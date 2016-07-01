From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 11:06:05 +0200
Subject: [Buildroot] [git commit] libselinux: bump to version 2.5
Message-ID: <20160701091149.28CA58183A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebcca24c953d8df4b16bc52c5ba31feae4ed8ad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition, if a user is using glibc 2.22, the default CFLAG
D_FILE_OFFSET_BITS=64 will cause a compile error.  This flag is now
removed from the CFLAGS in the make file to ensure that toolchains
compiled against glibc 2.22 will build the new version of the package
properly.

In addition, libselinux now uses fts(), which is not available on musl,
and not provided by our default uClibc configuration. Therefore,
libselinux now depends on glibc, as well as all its reverse
dependencies.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: add glibc dependency for fts().]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/android-tools/Config.in    |  6 ++++--
 package/busybox/Config.in          |  1 +
 package/libselinux/Config.in       |  7 +++++--
 package/libselinux/libselinux.hash |  2 +-
 package/libselinux/libselinux.mk   |  6 ++++--
 package/libsemanage/Config.in      | 10 ++++++----
 package/setools/Config.in          |  6 ++++--
 7 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 35bb8af..2503a28 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -23,15 +23,17 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
+	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on !BR2_arc # libselinux
 	help
 	  This option will build and install the fastboot utility for
 	  the target, which can be used to reflash other target devices
 	  implementing the fastboot protocol.
 
-comment "fastboot needs a toolchain w/ threads, dynamic library"
+comment "fastboot needs a glibc toolchain w/ threads, dynamic library"
 	depends on !BR2_arc
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_ANDROID_TOOLS_ADB
 	bool "adb"
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index a3a328d..91c5d9e 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	select BR2_PACKAGE_LIBSELINUX
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
 	bool "Enable SELinux support"
 	help
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index bc8298d..c88669b 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_PCRE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	# Uses <fts.h>, not available in musl or uClibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# Toolchain issue: "fixup not contained within frag"
 	depends on !BR2_arc
 	help
@@ -17,6 +19,7 @@ config BR2_PACKAGE_LIBSELINUX
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libselinux needs a toolchain w/ threads, dynamic library"
+comment "libselinux needs a glibc toolchain w/ threads, dynamic library"
 	depends on !BR2_arc
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 861c327..a4c3440 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 57aad47c06b7ec18a76e8d9870539277a84cb40109cfdcf70ed3260bdb04447a libselinux-2.1.13.tar.gz
+sha256 94c9e97706280bedcc288f784f67f2b9d3d6136c192b2c9f812115edba58514f libselinux-2.5.tar.gz
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index d4b96c4..6f94173 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 2.1.13
-LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+LIBSELINUX_VERSION = 2.5
+LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 
@@ -13,8 +13,10 @@ LIBSELINUX_DEPENDENCIES = libsepol pcre
 
 LIBSELINUX_INSTALL_STAGING = YES
 
+# Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc 2.22.
 LIBSELINUX_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
 	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread" \
 	ARCH=$(KERNEL_ARCH)
 
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 5e9ad8f..4465ef4 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -5,7 +5,9 @@ config BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_BZIP2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # getpwent_r()
+	# libselinux needs fts.h (not available in uClibc/musl) and
+	# libsemanage itself needs getpwent_r() not available in musl
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
 	help
 	  libsemanage is the policy management library. It uses
@@ -18,7 +20,7 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libsemanage needs a toolchain w/ threads, dynamic library"
+comment "libsemanage needs a glibc toolchain w/ threads, dynamic library"
 	depends on !BR2_arc
-	depends on !BR2_TOOLCHAIN_USES_MUSL
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/setools/Config.in b/package/setools/Config.in
index c291b21..5e7f39d 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_SETOOLS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	# bfin: infamous _ symbol prefix issue
 	# nios2: triggers some toolchain issue "No symbol version
 	# section for versioned symbol"
@@ -28,7 +29,8 @@ config BR2_PACKAGE_SETOOLS
 
 	  https://github.com/TresysTechnology/setools3/wiki
 
-comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
+comment "setools needs a glibc toolchain w/ threads, C++, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_nios2 && !BR2_bfin && !BR2_arc
