From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 10:48:51 +0200
Subject: [Buildroot] [git commit] package/mono: new package
Message-ID: <20141025084936.8D51CB0EFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b98c99a60e2daaf1516c60baf9dd045a21d7de4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the complete Mono implementation. This patch builds
both the native and managed parts.

[Thomas:
 - adjust license informations
 - add missing host-gettext dependency to host-mono
 - minor formatting tweaks.]

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                               |    1 +
 package/mono/Config.in                          |   40 +++++++++++++
 package/mono/mono-001-gc-fix-uclibc.patch       |   16 +++++
 package/mono/mono-002-support-uclibc-musl.patch |   25 ++++++++
 package/mono/mono.mk                            |   68 +++++++++++++++++++++++
 5 files changed, 150 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6822cd7..84e7bd2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -438,6 +438,7 @@ menu "Lua libraries/modules"
 	source "package/xavante/Config.in"
 endmenu
 endif
+	source "package/mono/Config.in"
 	source "package/nodejs/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
diff --git a/package/mono/Config.in b/package/mono/Config.in
new file mode 100644
index 0000000..f8f4895
--- /dev/null
+++ b/package/mono/Config.in
@@ -0,0 +1,40 @@
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
index 0000000..23d16f1
--- /dev/null
+++ b/package/mono/mono.mk
@@ -0,0 +1,68 @@
+#############################################################
+#
+# mono
+#
+#############################################################
+
+MONO_VERSION = 3.10.0
+MONO_SITE = http://download.mono-project.com/sources/mono/
+MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
+MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
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
+# The libraries have been built by the host-mono build. Since they are
+# architecture-independent, we simply copy them to the target.
+define MONO_INSTALL_LIBS
+	rsync -av --exclude=*.so --exclude=*.mdb \
+		$(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
+	rsync -av $(HOST_DIR)/etc/mono $(TARGET_DIR)/etc
+endef
+
+MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS
+
+MONO_DEPENDENCIES += host-mono
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
+HOST_MONO_CONF_OPTS += \
+	--with-profile2=$(if $(BR2_PACKAGE_MONO_20),yes,no) \
+	--with-profile4=$(if $(BR2_PACKAGE_MONO_40),yes,no) \
+	--with-profile4_5=$(if $(BR2_PACKAGE_MONO_45),yes,no)
+
+HOST_MONO_DEPENDENCIES = host-monolite host-gettext
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
