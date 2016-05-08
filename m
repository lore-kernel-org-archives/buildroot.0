From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 15:16:07 +0200
Subject: [Buildroot] [git commit] package/freeswitch: bump version to 1.6.8
Message-ID: <20160508131802.5C4F381976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66dc7a41fd88d266031d5fbe87fe9a18ebe02a36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream:
https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/eadb3f890f6e7ba3b3ca23c6feb144fb35d304ce
https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/b024c752fb2e9789fdbaf769be9998f62bb5c483

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freeswitch/0001-zrtp.patch                 | 33 --------------------
 .../0002-mod_cv-remove-unneeded-includes.patch     | 36 ----------------------
 package/freeswitch/freeswitch.hash                 |  4 +--
 package/freeswitch/freeswitch.mk                   |  2 +-
 4 files changed, 3 insertions(+), 72 deletions(-)

diff --git a/package/freeswitch/0001-zrtp.patch b/package/freeswitch/0001-zrtp.patch
deleted file mode 100644
index c1cdeed..0000000
--- a/package/freeswitch/0001-zrtp.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Fix PowerPC detection (needs __linux__) and add aarch64 support.
-
-Patch sent upstream: https://freeswitch.org/jira/browse/FS-8746
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr freeswitch-1.6.6.org/libs/libzrtp/include/zrtp_config.h freeswitch-1.6.6/libs/libzrtp/include/zrtp_config.h
---- freeswitch-1.6.6.org/libs/libzrtp/include/zrtp_config.h	2016-01-12 17:32:36.000000000 +0100
-+++ freeswitch-1.6.6/libs/libzrtp/include/zrtp_config.h	2016-01-16 14:09:17.830860603 +0100
-@@ -21,7 +21,7 @@
- #		define ZRTP_PLATFORM ZP_ANDROID
- #	elif defined(__FreeBSD__)
- #		define ZRTP_PLATFORM ZP_BSD
--#	elif defined(linux) || defined(__linux)
-+#	elif defined(linux) || defined(__linux__)
- #		include <linux/version.h>
- #		define ZRTP_PLATFORM ZP_LINUX
- #	elif defined(__MACOSX__) || defined (__APPLE__) || defined (__MACH__)
-@@ -88,7 +88,13 @@
-  */
- #define ZRTP_BYTE_ORDER ZBO_BIG_ENDIAN
- 
--#elif defined(ARM) || defined(_ARM_) || defined(ARMV4) || defined(__arm__)
-+#elif defined(__AARCH64EB__)
-+/*
-+ * aarch64, big endian
-+ */
-+#define ZRTP_BYTE_ORDER ZBO_BIG_ENDIAN
-+
-+#elif defined(ARM) || defined(_ARM_) || defined(ARMV4) || defined(__arm__) || defined(__AARCH64EL__)
- /*
-  * ARM, default to little endian
-  */
diff --git a/package/freeswitch/0002-mod_cv-remove-unneeded-includes.patch b/package/freeswitch/0002-mod_cv-remove-unneeded-includes.patch
deleted file mode 100644
index f211363..0000000
--- a/package/freeswitch/0002-mod_cv-remove-unneeded-includes.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 83774b612a39ae81d1a4c9a4ca14278cd9e674e7 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Thu, 21 Apr 2016 19:10:52 +0200
-Subject: [PATCH 1/1] mod_cv: remove unneeded includes
-
-OpenCV contains various modules which have inter-module dependencies.
-While including freeswitch into buildroot we stumbled over the fact
-that mod_cv.cpp includes more headers than needed[1]. These OpenCV
-headers are generic headers which require more OpenCV modules enabled
-than really used by Freeswitch. The attached fixes the problem.
-
-[1] http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/146662
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Patch sent upstream: https://freeswitch.org/jira/browse/FS-9093]
----
- src/mod/applications/mod_cv/mod_cv.cpp | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/mod/applications/mod_cv/mod_cv.cpp b/src/mod/applications/mod_cv/mod_cv.cpp
-index 5183adc..5c10b8d 100644
---- a/src/mod/applications/mod_cv/mod_cv.cpp
-+++ b/src/mod/applications/mod_cv/mod_cv.cpp
-@@ -40,9 +40,6 @@ using namespace cv;
- 
- #include <switch.h>
- 
--#include <cv.h>
--#include "cvaux.h"
--#include "cxmisc.h"
- #include "highgui.h"
- #include <stdio.h>
- #include <stdlib.h>
--- 
-2.8.0.rc3
-
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 31915cd..36bd75e 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,2 +1,2 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.7.tar.xz.sha256
-sha256	9c7ca2d39985fdc39659054179465540e926880f032f855c0df74d6eec41a794	freeswitch-1.6.7.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.8.tar.xz.sha256
+sha256	a9834667c0afc164631611b4862acd6411e4e6ddb706e4af4b51eab4adbe4fc1	freeswitch-1.6.8.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 41ad39a..71a7add 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.7
+FREESWITCH_VERSION = 1.6.8
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPLv1.1, \
