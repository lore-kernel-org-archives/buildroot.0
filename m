From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:04:50 +0200
Subject: [Buildroot] [git commit] package/{bluez5_utils,
 bluez5_utils-headers}: bump version to 5.51
Message-ID: <20190928210157.A68C8826B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74f6a8f8e3c770639537ce51fef8e91e17cc59b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: http://www.bluez.org/release-of-bluez-5-51/

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../bluez5_utils-headers/bluez5_utils-headers.mk   |  2 +-
 ...ls-Fix-build-after-y2038-changes-in-glibc.patch | 68 ----------------------
 package/bluez5_utils/bluez5_utils.hash             |  2 +-
 package/bluez5_utils/bluez5_utils.mk               |  2 +-
 4 files changed, 3 insertions(+), 71 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 020e8b4d4e..7dd65f650b 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.50
+BLUEZ5_UTILS_HEADERS_VERSION = 5.51
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch b/package/bluez5_utils/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch
deleted file mode 100644
index 7d08c6aa40..0000000000
--- a/package/bluez5_utils/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From f36f71f60b1e68c0f12e615b9b128d089ec3dd19 Mon Sep 17 00:00:00 2001
-From: Bastien Nocera <hadess@hadess.net>
-Date: Fri, 7 Jun 2019 09:51:33 +0200
-Subject: tools: Fix build after y2038 changes in glibc
-
-The 32-bit SIOCGSTAMP has been deprecated. Use the deprecated name
-to fix the build.
-[Retrieved from:
-https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/tools/?id=f36f71f60b1e68c0f12e615b9b128d089ec3dd19]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tools/l2test.c | 6 +++++-
- tools/rctest.c | 6 +++++-
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-(limited to 'tools')
-
-diff --git a/tools/l2test.c b/tools/l2test.c
-index e755ac881..e787c2ce2 100644
---- a/tools/l2test.c
-+++ b/tools/l2test.c
-@@ -55,6 +55,10 @@
- #define BREDR_DEFAULT_PSM	0x1011
- #define LE_DEFAULT_PSM		0x0080
- 
-+#ifndef SIOCGSTAMP_OLD
-+#define SIOCGSTAMP_OLD SIOCGSTAMP
-+#endif
-+
- /* Test modes */
- enum {
- 	SEND,
-@@ -907,7 +911,7 @@ static void recv_mode(int sk)
- 			if (timestamp) {
- 				struct timeval tv;
- 
--				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
-+				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
- 					timestamp = 0;
- 					memset(ts, 0, sizeof(ts));
- 				} else {
-diff --git a/tools/rctest.c b/tools/rctest.c
-index 94490f462..bc8ed875d 100644
---- a/tools/rctest.c
-+++ b/tools/rctest.c
-@@ -50,6 +50,10 @@
- 
- #include "src/shared/util.h"
- 
-+#ifndef SIOCGSTAMP_OLD
-+#define SIOCGSTAMP_OLD SIOCGSTAMP
-+#endif
-+
- /* Test modes */
- enum {
- 	SEND,
-@@ -505,7 +509,7 @@ static void recv_mode(int sk)
- 			if (timestamp) {
- 				struct timeval tv;
- 
--				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
-+				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
- 					timestamp = 0;
- 					memset(ts, 0, sizeof(ts));
- 				} else {
--- 
-cgit 1.2-0.3.lf.el7
-
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index b965708559..5b7eedbd2d 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  5ffcaae18bbb6155f1591be8c24898dc12f062075a40b538b745bfd477481911  bluez-5.50.tar.xz
+sha256  ebedfb359f62957940822f1d0b39fcee30422380e435608dad06bb3913d5ebba  bluez-5.51.tar.xz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 15c9b670a7..e2ce2f74dc 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.50
+BLUEZ5_UTILS_VERSION = 5.51
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
