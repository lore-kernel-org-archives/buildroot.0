From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Jul 2019 18:37:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez_utils: fix build with kernel
 >= 5.2
Message-ID: <20190715163755.2052-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/72b6039ee4ba28e67d5ffcb5073e669e8d740e14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...x-build-after-y2038-changes-in-glibc.patch | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 package/bluez_utils/0006-tools-Fix-build-after-y2038-changes-in-glibc.patch

diff --git a/package/bluez_utils/0006-tools-Fix-build-after-y2038-changes-in-glibc.patch b/package/bluez_utils/0006-tools-Fix-build-after-y2038-changes-in-glibc.patch
new file mode 100644
index 0000000000..fd81a93ba2
--- /dev/null
+++ b/package/bluez_utils/0006-tools-Fix-build-after-y2038-changes-in-glibc.patch
@@ -0,0 +1,68 @@
+From f36f71f60b1e68c0f12e615b9b128d089ec3dd19 Mon Sep 17 00:00:00 2001
+From: Bastien Nocera <hadess@hadess.net>
+Date: Fri, 7 Jun 2019 09:51:33 +0200
+Subject: tools: Fix build after y2038 changes in glibc
+
+The 32-bit SIOCGSTAMP has been deprecated. Use the deprecated name
+to fix the build.
+[Retrieved (and backported) from:
+https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/tools/?id=f36f71f60b1e68c0f12e615b9b128d089ec3dd19]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ test/l2test.c | 6 +++++-
+ test/rctest.c | 6 +++++-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+(limited to 'tools')
+
+diff --git a/test/l2test.c b/test/l2test.c
+index e755ac881..e787c2ce2 100644
+--- a/test/l2test.c
++++ b/test/l2test.c
+@@ -55,6 +55,10 @@
+ #define BREDR_DEFAULT_PSM	0x1011
+ #define LE_DEFAULT_PSM		0x0080
+ 
++#ifndef SIOCGSTAMP_OLD
++#define SIOCGSTAMP_OLD SIOCGSTAMP
++#endif
++
+ /* Test modes */
+ enum {
+ 	SEND,
+@@ -907,7 +911,7 @@ static void recv_mode(int sk)
+ 			if (timestamp) {
+ 				struct timeval tv;
+ 
+-				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
++				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
+ 					timestamp = 0;
+ 					memset(ts, 0, sizeof(ts));
+ 				} else {
+diff --git a/test/rctest.c b/test/rctest.c
+index 94490f462..bc8ed875d 100644
+--- a/test/rctest.c
++++ b/test/rctest.c
+@@ -50,6 +50,10 @@
+ 
+ #include "src/shared/util.h"
+ 
++#ifndef SIOCGSTAMP_OLD
++#define SIOCGSTAMP_OLD SIOCGSTAMP
++#endif
++
+ /* Test modes */
+ enum {
+ 	SEND,
+@@ -505,7 +509,7 @@ static void recv_mode(int sk)
+ 			if (timestamp) {
+ 				struct timeval tv;
+ 
+-				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
++				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
+ 					timestamp = 0;
+ 					memset(ts, 0, sizeof(ts));
+ 				} else {
+-- 
+cgit 1.2-0.3.lf.el7
+
-- 
2.20.1
