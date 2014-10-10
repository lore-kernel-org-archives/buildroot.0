From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 10 Oct 2014 16:23:37 +0200
Subject: [Buildroot] [PATCH v3] package/mono: new package
Message-ID: <1412951017-6769-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the complete Mono implementation. This patch compiles
both the native and managed parts.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changelog:

* Bump to version 3.10.0 (released today!)
* Various build optimization
* Fixing problems with uClibc
* Mono library version chooser added

I tried to merge mono-managed and mono-native in a single package,
but crosscompiling and compiling in the same folder without a clean
makes a big mess, so I think these packages should remain splitted.
Any hint appreciated!

 package/Config.in                                  |  1 +
 package/mono/Config.in                             | 34 ++++++++++++++++++
 package/mono/mono-managed/mono-managed.mk          | 42 ++++++++++++++++++++++
 .../mono-native/mono-native-001-fix_uclibc.patch   | 14 ++++++++
 package/mono/mono-native/mono-native.mk            | 31 ++++++++++++++++
 package/mono/mono.mk                               | 18 ++++++++++
 6 files changed, 140 insertions(+)
 create mode 100644 package/mono/Config.in
 create mode 100644 package/mono/mono-managed/mono-managed.mk
 create mode 100644 package/mono/mono-native/mono-native-001-fix_uclibc.patch
 create mode 100644 package/mono/mono-native/mono-native.mk
 create mode 100644 package/mono/mono.mk

diff --git a/package/Config.in b/package/Config.in
index ea89c96..92cf4b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -433,6 +433,7 @@ menu "Lua libraries/modules"
 	source "package/xavante/Config.in"
 endmenu
 endif
+	source "package/mono/Config.in"
 	source "package/nodejs/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
diff --git a/package/mono/Config.in b/package/mono/Config.in
new file mode 100644
index 0000000..1b2471e
--- /dev/null
+++ b/package/mono/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_MONO
+	bool "mono"
+	select BR2_STRIP_none
+	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips \
+		|| BR2_powerpc || BR2_sparc || BR2_x86_64)
+	depends on BR2_INET_IPV6
+	help
+	  An open source, cross-platform, implementation of C#
+	  and the CLR that is binary compatible with Microsoft.NET.
+
+	  http://download.mono-project.com/sources/mono/
+
+if BR2_PACKAGE_MONO
+	config BR2_PACKAGE_MONO_20
+		bool "2.0 .Net Runtime"
+		help
+		  Version 2.0 of Mono .Net runtime
+	config BR2_PACKAGE_MONO_30
+		bool "3.0 .Net Runtime"
+		help
+		  Version 3.0 of Mono .Net runtime
+	config BR2_PACKAGE_MONO_40
+		bool "4.0 .Net Runtime"
+		help
+		  Version 4.0 of Mono .Net runtime
+	config BR2_PACKAGE_MONO_45
+		default y
+		bool "4.5 .Net Runtime"
+		help
+		  Version 4.5 of Mono .Net runtime
+endif
+
+comment "mono needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/mono/mono-managed/mono-managed.mk b/package/mono/mono-managed/mono-managed.mk
new file mode 100644
index 0000000..7010106
--- /dev/null
+++ b/package/mono/mono-managed/mono-managed.mk
@@ -0,0 +1,42 @@
+#############################################################
+#
+# mono-managed
+#
+#############################################################
+
+MONO_MANAGED_VERSION = $(MONO_VERSION)
+MONO_MANAGED_SITE = $(MONO_SITE)
+MONO_MANAGED_SOURCE = $(MONO_SOURCE)
+
+HOST_MONO_MANAGED_CONF_OPTS = $(MONO_CONF_OPT) --enable-static \
+	--enable-minimal=aot,profiler,debug
+
+ifeq ($(BR2_PACKAGE_MONO_20),y)
+	ASSEMBLY_SRC += $(HOST_DIR)/usr/lib/mono/2.0
+endif
+
+ifeq ($(BR2_PACKAGE_MONO_30),y)
+	ASSEMBLY_SRC += $(HOST_DIR)/usr/lib/mono/3.0
+endif
+
+ifeq ($(BR2_PACKAGE_MONO_40),y)
+	ASSEMBLY_SRC += $(HOST_DIR)/usr/lib/mono/4.0
+endif
+
+ifeq ($(BR2_PACKAGE_MONO_45),y)
+	ASSEMBLY_SRC += $(HOST_DIR)/usr/lib/mono/4.5
+endif
+
+define MONO_MANAGED_GETMONOLITE
+	$(MAKE) -C $(@D) get-monolite-latest
+endef
+
+define MONO_MANAGED_INSTALL
+	rsync -av --exclude=*.so --exclude=*.mdb --exclude=[0-9].[0-9] $(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
+	rsync -av --exclude=*.so --exclude=*.mdb $(ASSEMBLY_SRC) $(TARGET_DIR)/usr/lib/mono/
+endef
+
+HOST_MONO_MANAGED_POST_CONFIGURE_HOOKS += MONO_MANAGED_GETMONOLITE
+HOST_MONO_MANAGED_POST_INSTALL_HOOKS += MONO_MANAGED_INSTALL
+
+$(eval $(host-autotools-package))
diff --git a/package/mono/mono-native/mono-native-001-fix_uclibc.patch b/package/mono/mono-native/mono-native-001-fix_uclibc.patch
new file mode 100644
index 0000000..c82f24b
--- /dev/null
+++ b/package/mono/mono-native/mono-native-001-fix_uclibc.patch
@@ -0,0 +1,14 @@
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+
+diff -purN mono-native-3.8.0.orig/libgc/include/gc.h mono-native-3.8.0/libgc/include/gc.h
+--- mono-native-3.8.0.orig/libgc/include/gc.h	2014-10-07 15:00:21.259466731 +0200
++++ mono-native-3.8.0/libgc/include/gc.h	2014-10-07 15:05:25.560975681 +0200
+@@ -500,7 +500,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_of
+ #ifdef __linux__
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif
diff --git a/package/mono/mono-native/mono-native.mk b/package/mono/mono-native/mono-native.mk
new file mode 100644
index 0000000..6c371d0
--- /dev/null
+++ b/package/mono/mono-native/mono-native.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# mono-native
+#
+#############################################################
+
+MONO_NATIVE_VERSION = $(MONO_VERSION)
+MONO_NATIVE_SITE = $(MONO_SITE)
+MONO_NATIVE_SOURCE = $(MONO_SOURCE)
+MONO_NATIVE_INSTALL_STAGING = $(MONO_INSTALL_STAGING)
+
+MONO_NATIVE_DEPENDENCIES += host-mono-managed
+
+# Disable managed code (mcs folder) from building
+MONO_NATIVE_CONF_OPTS = $(MONO_CONF_OPT) --disable-mcs-build
+
+define MONO_NATIVE_TWEAK_LIBC_NAME
+	$(SED) 's/libc.so.6/$(MONO_LIBC_NAME)/g' $(TARGET_DIR)/etc/mono/config
+endef
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+	MONO_LIBC_NAME = libc.so.0
+else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+	MONO_LIBC_NAME = libc.so
+endif
+
+ifneq ($(MONO_LIBC_NAME),)
+	MONO_NATIVE_POST_INSTALL_TARGET_HOOKS += MONO_NATIVE_TWEAK_LIBC_NAME
+endif
+
+$(eval $(autotools-package))
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
new file mode 100644
index 0000000..541f9ad
--- /dev/null
+++ b/package/mono/mono.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# mono
+#
+#############################################################
+
+MONO_VERSION = 3.10.0
+MONO_SITE = http://download.mono-project.com/sources/mono/
+MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
+MONO_INSTALL_STAGING = YES
+
+MONO_CONF_OPT = --disable-gtk-doc --with-mcs-docs=no \
+	--with-moonlight=no --disable-libraries --with-ikvm-native=no
+
+ifeq ($(BR2_PACKAGE_MONO),y)
+	include package/mono/*/*.mk
+	TARGETS += mono-native mono-managed
+endif
-- 
2.1.1
