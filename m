From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 12 Oct 2014 09:50:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: new package
In-Reply-To: <1413100208-12776-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1413100208-12776-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1413100208-12776-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the complete Mono implementation. This patch builds
both the native and managed parts.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Config.in                               |    1 +
 package/mono/Config.in                          |   39 ++++++++++++
 package/mono/mono-001-gc-fix-uclibc.patch       |   16 +++++
 package/mono/mono-002-support-uclibc-musl.patch |   25 ++++++++
 package/mono/mono.mk                            |   74 +++++++++++++++++++++++
 5 files changed, 155 insertions(+)
 create mode 100644 package/mono/Config.in
 create mode 100644 package/mono/mono-001-gc-fix-uclibc.patch
 create mode 100644 package/mono/mono-002-support-uclibc-musl.patch
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
index 0000000..de2d68b
--- /dev/null
+++ b/package/mono/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_MONO_ARCH_SUPPORTS
+	bool
+	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
+		      BR2_mipsel || BR2_powerpc || BR2_sparc || BR2_x86_64)
+
+config BR2_PACKAGE_MONO
+	bool "mono"
+	select BR2_STRIP_none
+	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
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
+	config BR2_PACKAGE_MONO_35
+		bool "3.5 .Net Runtime"
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
+
+endif
+
+comment "mono needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/mono/mono-001-gc-fix-uclibc.patch b/package/mono/mono-001-gc-fix-uclibc.patch
new file mode 100644
index 0000000..951d568
--- /dev/null
+++ b/package/mono/mono-001-gc-fix-uclibc.patch
@@ -0,0 +1,16 @@
+Disable backtrace on not supprted uclibc.
+
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
diff --git a/package/mono/mono-002-support-uclibc-musl.patch b/package/mono/mono-002-support-uclibc-musl.patch
new file mode 100644
index 0000000..48a3493
--- /dev/null
+++ b/package/mono/mono-002-support-uclibc-musl.patch
@@ -0,0 +1,25 @@
+Adjust libc.so path depending on C library being used
+
+By default, on Linux systems, Mono assumes that the C library is
+libc.so.6. While this is true for glibc, it is not true for uClibc and
+Musl based systems. This patch adds support for such systems.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -2973,6 +2973,12 @@
+         SQLITE="libsqlite.so"
+         SQLITE3="libsqlite3.so"
+ 	;;
++    *-*-*uclibc*)
++	LIBC="libc.so.0"
++	;;
++    *-*-*musl*)
++	LIBC="libc.so"
++	;;
+     *-*-*linux*)
+ 	AC_PATH_X
+ 	dlsearch_path=`(libtool --config ; echo eval echo \\$sys_lib_dlsearch_path_spec) | sh`
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
new file mode 100644
index 0000000..621ad96
--- /dev/null
+++ b/package/mono/mono.mk
@@ -0,0 +1,74 @@
+#############################################################
+#
+# mono
+#
+#############################################################
+
+MONO_VERSION = 3.10.0
+MONO_SITE = http://download.mono-project.com/sources/mono/
+MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
+MONO_LICENSE = Dual license LGPL, commercial
+MONO_LICENSE_FILES = LICENSE
+MONO_INSTALL_STAGING = YES
+
+# patching configure.ac
+MONO_AUTORECONF = YES
+
+# Disable managed code (mcs folder) from building
+MONO_CONF_OPTS = --disable-gtk-doc \
+	--with-mcs-docs=no \
+	--with-moonlight=no \
+	--disable-libraries \
+	--with-ikvm-native=no \
+	--enable-minimal=aot,profiler,debug \
+	--disable-mcs-build
+
+ifeq ($(BR2_PACKAGE_MONO_20),y)
+	ASSEMBLY_INCLUDED += $(HOST_DIR)/usr/lib/mono/2.0
+endif
+
+ifeq ($(BR2_PACKAGE_MONO_35),y)
+	ASSEMBLY_INCLUDED += $(HOST_DIR)/usr/lib/mono/3.5
+endif
+
+ifeq ($(BR2_PACKAGE_MONO_40),y)
+	ASSEMBLY_INCLUDED += $(HOST_DIR)/usr/lib/mono/4.0
+endif
+
+ifeq ($(BR2_PACKAGE_MONO_45),y)
+	ASSEMBLY_INCLUDED += $(HOST_DIR)/usr/lib/mono/4.5
+endif
+
+ifneq ($(ASSEMBLY_INCLUDED),)
+define MONO_INSTALL_LIBS
+		rsync -av --exclude=*.so --exclude=*.mdb --exclude=[0-9].[0-9] \
+			$(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
+		rsync -av --exclude=*.so --exclude=*.mdb $(ASSEMBLY_INCLUDED) \
+			$(TARGET_DIR)/usr/lib/mono/
+endef
+MONO_DEPENDENCIES += host-mono
+MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS
+endif
+
+HOST_MONO_CONF_OPTS = --disable-gtk-doc \
+	--with-mcs-docs=no \
+	--with-moonlight=no \
+	--disable-libraries \
+	--with-ikvm-native=no \
+	--enable-minimal=aot,profiler,debug \
+	--enable-static
+
+HOST_MONO_DEPENDENCIES = host-monolite
+
+define HOST_MONO_SETUP_MONOLITE
+	rm -rf $(@D)/mcs/class/lib/monolite
+	(cd $(@D)/mcs/class/lib; ln -s $(HOST_DIR)/usr/lib/monolite monolite)
+endef
+
+HOST_MONO_POST_CONFIGURE_HOOKS += HOST_MONO_SETUP_MONOLITE
+
+$(eval $(autotools-package))
+
+ifneq ($(ASSEMBLY_INCLUDED),)
+$(eval $(host-autotools-package))
+endif
-- 
1.7.9.5
