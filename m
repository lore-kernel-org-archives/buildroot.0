From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:21:19 +0200
Subject: [Buildroot] [git commit] libvncserver: add upstream security fix
 for CVE-2018-7225
Message-ID: <20180610125503.E7A2883F5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4f7700f0b40022f91c2d43f7d21c5a01487587e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-7225 - An issue was discovered in LibVNCServer through
0.9.11.  rfbProcessClientNormalMessage() in rfbserver.c does not sanitize
msg.cct.length, leading to access to uninitialized and potentially sensitive
data or possibly unspecified other impact (e.g., an integer overflow) via
specially crafted VNC packets.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-Limit-client-cut-text-length-to-1-MB.patch | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/libvncserver/0001-Limit-client-cut-text-length-to-1-MB.patch b/package/libvncserver/0001-Limit-client-cut-text-length-to-1-MB.patch
new file mode 100644
index 0000000000..84a537640d
--- /dev/null
+++ b/package/libvncserver/0001-Limit-client-cut-text-length-to-1-MB.patch
@@ -0,0 +1,65 @@
+From 28afb6c537dc82ba04d5f245b15ca7205c6dbb9c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Mon, 26 Feb 2018 13:48:00 +0100
+Subject: [PATCH] Limit client cut text length to 1 MB
+
+This patch constrains a client cut text length to 1 MB. Otherwise
+a client could make server allocate 2 GB of memory and that seems to
+be to much to classify it as a denial of service.
+
+The limit also prevents from an integer overflow followed by copying
+an uninitilized memory when processing msg.cct.length value larger
+than SIZE_MAX or INT_MAX - sz_rfbClientCutTextMsg.
+
+This patch also corrects accepting length value of zero (malloc(0) is
+interpreted on differnet systems differently).
+
+CVE-2018-7225
+<https://github.com/LibVNC/libvncserver/issues/218>
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ libvncserver/rfbserver.c | 20 +++++++++++++++++++-
+ 1 file changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/libvncserver/rfbserver.c b/libvncserver/rfbserver.c
+index 116c488..4fc4d9d 100644
+--- a/libvncserver/rfbserver.c
++++ b/libvncserver/rfbserver.c
+@@ -88,6 +88,8 @@
+ #include <errno.h>
+ /* strftime() */
+ #include <time.h>
++/* PRIu32 */
++#include <inttypes.h>
+ 
+ #ifdef LIBVNCSERVER_WITH_WEBSOCKETS
+ #include "rfbssl.h"
+@@ -2575,7 +2577,23 @@ rfbProcessClientNormalMessage(rfbClientPtr cl)
+ 
+ 	msg.cct.length = Swap32IfLE(msg.cct.length);
+ 
+-	str = (char *)malloc(msg.cct.length);
++	/* uint32_t input is passed to malloc()'s size_t argument,
++	 * to rfbReadExact()'s int argument, to rfbStatRecordMessageRcvd()'s int
++	 * argument increased of sz_rfbClientCutTextMsg, and to setXCutText()'s int
++	 * argument. Here we impose a limit of 1 MB so that the value fits
++	 * into all of the types to prevent from misinterpretation and thus
++	 * from accessing uninitialized memory (CVE-2018-7225) and also to
++	 * prevent from a denial-of-service by allocating to much memory in
++	 * the server. */
++	if (msg.cct.length > 1<<20) {
++	    rfbLog("rfbClientCutText: too big cut text length requested: %" PRIu32 "\n",
++		    msg.cct.length);
++	    rfbCloseClient(cl);
++	    return;
++	}
++
++	/* Allow zero-length client cut text. */
++	str = (char *)calloc(msg.cct.length ? msg.cct.length : 1, 1);
+ 	if (str == NULL) {
+ 		rfbLogPerror("rfbProcessClientNormalMessage: not enough memory");
+ 		rfbCloseClient(cl);
+-- 
+2.11.0
+
