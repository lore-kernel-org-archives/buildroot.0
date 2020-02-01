From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Feb 2020 09:47:57 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump to version 4.25,
 add xtensa support
Message-ID: <20200201084758.285234-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nspr 4.25 added support for Xtensa architecture:
https://groups.google.com/forum/#!topic/mozilla.dev.tech.nspr/lK7toqtJ96E

Removed BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT because it was only needed for
xtensa.

Added sha1 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ecryptfs-utils/Config.in | 2 --
 package/libnspr/Config.in        | 8 --------
 package/libnspr/libnspr.hash     | 6 ++++--
 package/libnspr/libnspr.mk       | 2 +-
 package/libnss/Config.in         | 2 --
 package/spidermonkey/Config.in   | 1 -
 6 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 0c39f48d08..08210f05eb 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # keyutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
 	depends on !BR2_STATIC_LIBS # libnss, keyutils
 	select BR2_PACKAGE_KEYUTILS
@@ -29,7 +28,6 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	  http://ecryptfs.org
 
 comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library"
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 57fcbdf6be..de8dd0a06b 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -1,9 +1,3 @@
-config BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
-	def_bool y
-	depends on !BR2_xtensa
-
-if BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
-
 config BR2_PACKAGE_LIBNSPR
 	bool "libnspr"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -18,5 +12,3 @@ config BR2_PACKAGE_LIBNSPR
 
 comment "libnspr needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-endif
diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 0ec475f480..8deaa2d986 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,6 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.20/src/SHA256SUMS
-sha256	90a59a0df6a11528749647fe18401cc7e03881e3e63c309f8c520ce06dd413d0  nspr-4.24.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.25/src/SHA1SUMS
+sha1 fe02a9056ce867677401b3d6372cdb62f7c7aad4  nspr-4.25.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.25/src/SHA256SUMS
+sha256 0bc309be21f91da4474c56df90415101c7f0c7c7cab2943cd943cd7896985256  nspr-4.25.tar.gz
 # Locally calculated
 sha256	fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 42b4350d90..857052d8c7 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.24
+LIBNSPR_VERSION = 4.25
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 2dd0197236..feedcd4029 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBNSS
 	bool "libnss"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBNSPR
 	select BR2_PACKAGE_SQLITE
@@ -28,5 +27,4 @@ config BR2_PACKAGE_LIBNSS_ARCH
 endif
 
 comment "libnss needs a toolchain w/ threads, dynamic library"
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/spidermonkey/Config.in b/package/spidermonkey/Config.in
index 5f12110626..150b941c94 100644
--- a/package/spidermonkey/Config.in
+++ b/package/spidermonkey/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
 	default y if BR2_riscv
 	default y if BR2_sh4 || BR2_sh4a
 	default y if BR2_sparc || BR2_sparc64
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 
 config BR2_PACKAGE_SPIDERMONKEY_JIT_ARCH_SUPPORTS
 	bool
-- 
2.20.1
