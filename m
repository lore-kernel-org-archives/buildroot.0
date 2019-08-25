From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Aug 2019 19:37:58 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/flac: bump version to 1.3.3
Message-ID: <20190825173758.29573-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://xiph.org/flac/changelog.html

Removed patch applied upstream, removed autoreconf:
https://git.xiph.org/?p=flac.git;a=commitdiff;h=55721556161e6ab209f940f5023bc44b4051524a

Added all hashes provided by upstream and license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...onfigure.ac-relax-linux-OS-detection.patch | 35 -------------------
 package/flac/flac.hash                        | 10 +++++-
 package/flac/flac.mk                          |  4 +--
 3 files changed, 10 insertions(+), 39 deletions(-)
 delete mode 100644 package/flac/0001-configure.ac-relax-linux-OS-detection.patch

diff --git a/package/flac/0001-configure.ac-relax-linux-OS-detection.patch b/package/flac/0001-configure.ac-relax-linux-OS-detection.patch
deleted file mode 100644
index baf07bc16e..0000000000
--- a/package/flac/0001-configure.ac-relax-linux-OS-detection.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8589b44c573d4228a9df3ba7bffdfdf584e7b033 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 9 Jan 2017 21:38:29 +0100
-Subject: [PATCH] configure.ac: relax linux OS detection
-
-Not all linux hosts match the *-pc-linux-gnu wildcard, causing build
-failures for older glibc versions where we need to link with -lrt for
-clock_gettime - E.G.:
-
- - arm-unknown-linux-musleabihf
- - powerpc-unknown-linux-gnuspe
- - bfin-linux-linux-uclibc
- ..
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 070ab357..235d2717 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -186,7 +186,7 @@ esac
- AM_CONDITIONAL(OS_IS_WINDOWS, test "x$os_is_windows" = xyes)
- 
- case "$host" in
--	*-pc-linux-gnu)
-+	*-linux-*)
- 		sys_linux=true
- 		AC_DEFINE(FLAC__SYS_LINUX)
- 		AH_TEMPLATE(FLAC__SYS_LINUX, [define if building for Linux])
--- 
-2.11.0
-
diff --git a/package/flac/flac.hash b/package/flac/flac.hash
index 7ce76f107c..df7c2d1b95 100644
--- a/package/flac/flac.hash
+++ b/package/flac/flac.hash
@@ -1,2 +1,10 @@
+# From https://ftp.osuosl.org/pub/xiph/releases/flac/MD5SUMS
+md5 26703ed2858c1fc9ffc05136d13daa69  flac-1.3.3.tar.xz
+# From https://ftp.osuosl.org/pub/xiph/releases/flac/SHA1SUMS
+sha1 6ac2e8f1dd18c9b0214c4d81bd70cdc1e943cffe  flac-1.3.3.tar.xz
 # From http://downloads.xiph.org/releases/flac/SHA256SUMS.txt
-sha256	91cfc3ed61dc40f47f050a109b08610667d73477af6ef36dcad31c31a4a8d53f	flac-1.3.2.tar.xz
+sha256 213e82bd716c9de6db2f98bcadbc4c24c7e2efe8c75939a1a84e28539c4e1748  flac-1.3.3.tar.xz
+# Locally computed
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
+sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
+sha256 fa27cb11f13f97b0c5f3ff363b1e2610c6efe87ed175779cb2a78e44eb19d34c  COPYING.Xiph
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 34482133d9..a2cf186d10 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.3.2
+FLAC_VERSION = 1.3.3
 FLAC_SITE = http://downloads.xiph.org/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 FLAC_LICENSE = Xiph BSD-like (libFLAC), GPL-2.0+ (tools), LGPL-2.1+ (other libraries)
 FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
-# 0001-configure.ac-relax-linux-OS-detection.patch patches configure.ac
-FLAC_AUTORECONF = YES
 FLAC_CONF_OPTS = \
 	--disable-cpplibs \
 	--disable-xmms-plugin \
-- 
2.20.1
