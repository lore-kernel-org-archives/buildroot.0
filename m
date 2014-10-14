From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 14 Oct 2014 22:58:33 +0200
Subject: [Buildroot] [PATCH 2/2 v3] package/mono: new package
Message-ID: <1413320313-11078-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the complete Mono implementation. This patch builds
both the native and managed parts.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---

Chengelog:

* Fixing default mono version with select in Config.in
* Rewriting library selection logic in mono.mk

[Thomas:

  - Merge mono-managed and mono-native as a single package. The
    mono-managed stuff is done by the host variant of the mono
    package, while the mono-native stuff is done as the target variant
    of the mono package.

  - Introduce a BR2_PACKAGE_MONO_ARCH_SUPPORTS blind Config.in option
    to make sure the IPv6 related comment is not displayed when the
    architecture being used anyway doesn't support Mono.

  - Add a patch to Mono to fix the C library path when uClibc and Musl
    is used. This is a better approach than the
    POST_INSTALL_TARGET_HOOKS because this approach can potentially be
    submitted upstreamed, which ultimately allows to simplify the
    Buildroot package.

  - Depend on a 'monolite' package, and use it instead of letting Mono
    download Monolite by itself, which circumvents Buildroot's
    download infrastructure.
    mono-managed stuff is done by the host variant of the mono
    package, while the mono-native stuff is done as the target variant
    of the mono package.

  - Introduce a BR2_PACKAGE_MONO_ARCH_SUPPORTS blind Config.in option
    to make sure the IPv6 related comment is not displayed when the
    architecture being used anyway doesn't support Mono.

  - Add a patch to Mono to fix the C library path when uClibc and Musl
    is used. This is a better approach than the
    POST_INSTALL_TARGET_HOOKS because this approach can potentially be
    submitted upstreamed, which ultimately allows to simplify the
    Buildroot package.

  - Depend on a 'monolite' package, and use it instead of letting Mono
    download Monolite by itself, which circumvents Buildroot's
    download infrastructure.

  - Move the installation of Mono libraries to the target Mono
    package, as a POST_INSTALL_TARGET_HOOKS.]

[Angelo:

  - Bump to the latest Mono version 3.10.0

  - Add selection for .Net runtime compilation and installation in
    target.]

 package/Config.in                               |  1 +
 package/mono/Config.in                          | 41 ++++++++++++++++
 package/mono/mono-001-gc-fix-uclibc.patch       | 16 +++++++
 package/mono/mono-002-support-uclibc-musl.patch | 25 ++++++++++
 package/mono/mono.mk                            | 64 +++++++++++++++++++++++++
 5 files changed, 147 insertions(+)
 create mode 100644 package/mono/Config.in
 create mode 100644 package/mono/mono-001-gc-fix-uclibc.patch
 create mode 100644 package/mono/mono-002-support-uclibc-musl.patch
 create mode 100644 package/mono/mono.mk

diff --git a/package/Config.in b/package/Config.in
index 19bb9bf..d615872 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -435,6 +435,7 @@ menu "Lua libraries/modules"
 	source "package/xavante/Config.in"
 endmenu
 endif
+	source "package/mono/Config.in"
 	source "package/nodejs/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
diff --git a/package/mono/Config.in b/package/mono/Config.in
new file mode 100644
index 0000000..011a766
--- /dev/null
+++ b/package/mono/Config.in
@@ -0,0 +1,41 @@
+config BR2_PACKAGE_MONO_ARCH_SUPPORTS
+	bool
+	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
+		      BR2_mipsel || BR2_powerpc || BR2_sparc || BR2_x86_64)
+
+config BR2_PACKAGE_MONO
+	bool "mono"
+	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
+	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_MONO_45 if !BR2_PACKAGE_MONO_20 && !BR2_PACKAGE_MONO_40
+	help
+	  An open source, cross-platform, implementation of C#
+	  and the CLR that is binary compatible with Microsoft.NET.
+
+	  http://download.mono-project.com/sources/mono/
+
+if BR2_PACKAGE_MONO
+
+config BR2_PACKAGE_MONO_20
+	bool "2.0/3.5 .Net Runtime"
+	help
+	  This option enables the installation of the 2.0/3.5 version 
+	  of the Mono .Net runtime to the target
+
+config BR2_PACKAGE_MONO_40
+	bool "4.0 .Net Runtime"
+	help
+	  This option enables the installation of the 4.0 version 
+	  of the Mono .Net runtime to the target
+
+config BR2_PACKAGE_MONO_45
+	bool "4.5 .Net Runtime"
+	default y
+	help
+	  This option enables the installation of the 4.5 version 
+	  of the Mono .Net runtime to the target
+
+endif
+
+comment "mono needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/mono/mono-001-gc-fix-uclibc.patch b/package/mono/mono-001-gc-fix-uclibc.patch
new file mode 100644
index 0000000..62b52cd
--- /dev/null
+++ b/package/mono/mono-001-gc-fix-uclibc.patch
@@ -0,0 +1,16 @@
+Disable backtrace on not supported uclibc.
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
index 0000000..fdb4a2f
--- /dev/null
+++ b/package/mono/mono.mk
@@ -0,0 +1,64 @@
+#############################################################
+#
+# mono
+#
+#############################################################
+
+MONO_VERSION = 3.10.0
+MONO_SITE = http://download.mono-project.com/sources/mono/
+MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
+MONO_LICENSE = LGPLv2 or commercial
+MONO_LICENSE_FILES = LICENSE COPYING.LIB mcs/COPYING.LIB mcs/COPYING \
+	eglib/COPYING external/Newtonsoft.Json/Tools/7-zip/copying.txt
+MONO_INSTALL_STAGING = YES
+
+## Mono native
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
+define MONO_INSTALL_LIBS
+	rsync -av --exclude=*.so --exclude=*.mdb \
+		$(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
+endef
+
+MONO_DEPENDENCIES += host-mono
+
+MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS
+
+## Mono managed
+
+HOST_MONO_CONF_OPTS = --disable-gtk-doc \
+	--with-mcs-docs=no \
+	--with-moonlight=no \
+	--disable-libraries \
+	--with-ikvm-native=no \
+	--enable-minimal=aot,profiler,debug \
+	--enable-static
+
+# These options refer to the target mono, not the host. We use the host
+# only to compile libraries, then we copy them to the target.
+HOST_MONO_CONF_OPTS += --with-profile2=$(if $(BR2_PACKAGE_MONO_20),yes,no)
+HOST_MONO_CONF_OPTS += --with-profile4=$(if $(BR2_PACKAGE_MONO_40),yes,no)
+HOST_MONO_CONF_OPTS += --with-profile4_5=$(if $(BR2_PACKAGE_MONO_45),yes,no)
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
+$(eval $(host-autotools-package))
-- 
2.1.1
