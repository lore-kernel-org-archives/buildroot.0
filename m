From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 23:46:41 +0200
Subject: [Buildroot] [git commit] toolchain: GCC bug 85862
Message-ID: <20180521214858.4398B81DDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd03966d4ebeb284ac3afb5f3b8cba13da2b9983
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC < 7.x hangs while building libnss for the Microblaze Arch.

Discovered by
http://autobuild.buildroot.net/results/158e8ebb39713e1b436a5cc1a1916f46c30694df

Reported:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862

Simlar to:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=49218

[Peter: tweak ecryptfs comment, add comment/dependencies for qt5webengine]
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ecryptfs-utils/Config.in   | 4 ++++
 package/libnss/Config.in           | 4 ++++
 package/qt5/qt5webengine/Config.in | 6 ++++++
 toolchain/Config.in                | 8 ++++++++
 4 files changed, 22 insertions(+)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index bb4cc64488..6652d33e0e 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
 	depends on !BR2_STATIC_LIBS # libnss, keyutils
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # microblaze specific & GCC < 7.x
 	select BR2_PACKAGE_KEYUTILS
 	select BR2_PACKAGE_LIBNSS
 	# runtime dependency only, some scripts are using the
@@ -35,3 +36,6 @@ comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS
+
+comment "ecryptfs needs a toolchain not affected by GCC bug 85862"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # libnss
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 599c9a6536..34ddb91dfa 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBNSS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862
 	select BR2_PACKAGE_LIBNSPR
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
@@ -18,3 +19,6 @@ config BR2_PACKAGE_LIBNSS
 comment "libnss needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "libnss needs a toolchain not affected by GCC bug 85862"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 969582712e..38486c6dcf 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -20,12 +20,18 @@ comment "qt5webengine needs an OpenGL and EGL-capable backend"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || !BR2_PACKAGE_HAS_LIBEGL
 
+comment "qt5webengine needs a toolchain not affected by GCC bug 85862"
+	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_QT5_VERSION_5_6
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # libnss
+
 config BR2_PACKAGE_QT5WEBENGINE
 	bool "qt5webengine"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5base-icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 121ddb4fa4..2479a6587c 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -84,6 +84,14 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	default y if BR2_m68k_cf5208
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862
+# An infinite loop exists in the find_base_term() logic of 6.x
+# on microblaze.  http://autobuild.buildroot.net/results/158e8ebb39713e1b436a5cc1a1916f46c30694df/
+config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
+	bool
+	default y if BR2_microblaze
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
