From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:07:51 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libvncserver: fix
 CVE-2018-20750
Message-ID: <20200315095840.67FDD83F03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cabb7a98dbe9b1b206cad01cbf0d6e39b4cbfa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

LibVNC through 0.9.12 contains a heap out-of-bounds write vulnerability
in libvncserver/rfbserver.c. The fix for CVE-2018-15127 was incomplete.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b10cee53265b0ddd195a26569caa8909d82e8c04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...bytes-in-rfbProcessFileTransferReadBuffer.patch | 47 ++++++++++++++++++++++
 package/libvncserver/libvncserver.mk               |  3 ++
 2 files changed, 50 insertions(+)

diff --git a/package/libvncserver/0003-Limit-lenght-to-INT_MAX-bytes-in-rfbProcessFileTransferReadBuffer.patch b/package/libvncserver/0003-Limit-lenght-to-INT_MAX-bytes-in-rfbProcessFileTransferReadBuffer.patch
new file mode 100644
index 0000000000..7461f11f80
--- /dev/null
+++ b/package/libvncserver/0003-Limit-lenght-to-INT_MAX-bytes-in-rfbProcessFileTransferReadBuffer.patch
@@ -0,0 +1,47 @@
+From 09e8fc02f59f16e2583b34fe1a270c238bd9ffec Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Mon, 7 Jan 2019 10:40:01 +0100
+Subject: [PATCH] Limit lenght to INT_MAX bytes in
+ rfbProcessFileTransferReadBuffer()
+
+This ammends 15bb719c03cc70f14c36a843dcb16ed69b405707 fix for a heap
+out-of-bound write access in rfbProcessFileTransferReadBuffer() when
+reading a transfered file content in a server. The former fix did not
+work on platforms with a 32-bit int type (expected by rfbReadExact()).
+
+CVE-2018-15127
+<https://github.com/LibVNC/libvncserver/issues/243>
+<https://github.com/LibVNC/libvncserver/issues/273>
+[Retrieved from:
+https://github.com/LibVNC/libvncserver/commit/09e8fc02f59f16e2583b34fe1a270c238bd9ffec]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libvncserver/rfbserver.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libvncserver/rfbserver.c b/libvncserver/rfbserver.c
+index 7af84906..f2edbeea 100644
+--- a/libvncserver/rfbserver.c
++++ b/libvncserver/rfbserver.c
+@@ -88,6 +88,8 @@
+ #include <errno.h>
+ /* strftime() */
+ #include <time.h>
++/* INT_MAX */
++#include <limits.h>
+ 
+ #ifdef LIBVNCSERVER_WITH_WEBSOCKETS
+ #include "rfbssl.h"
+@@ -1472,8 +1474,11 @@ char *rfbProcessFileTransferReadBuffer(rfbClientPtr cl, uint32_t length)
+        0XFFFFFFFF, i.e. SIZE_MAX for 32-bit systems. On 64-bit systems, a length of 0XFFFFFFFF
+        will safely be allocated since this check will never trigger and malloc() can digest length+1
+        without problems as length is a uint32_t.
++       We also later pass length to rfbReadExact() that expects a signed int type and
++       that might wrap on platforms with a 32-bit int type if length is bigger
++       than 0X7FFFFFFF.
+     */
+-    if(length == SIZE_MAX) {
++    if(length == SIZE_MAX || length > INT_MAX) {
+ 	rfbErr("rfbProcessFileTransferReadBuffer: too big file transfer length requested: %u", (unsigned int)length);
+ 	rfbCloseClient(cl);
+ 	return NULL;
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index b024c3161d..79db2dad83 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -13,6 +13,9 @@ LIBVNCSERVER_INSTALL_STAGING = YES
 LIBVNCSERVER_DEPENDENCIES = host-pkgconf lzo
 LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 
+# 0003-Limit-lenght-to-INT_MAX-bytes-in-rfbProcessFileTransferReadBuffer.patch
+LIBVNCSERVER_IGNORE_CVES += CVE-2018-20750
+
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_FFMPEG=OFF \
