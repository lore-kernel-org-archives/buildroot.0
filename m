From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Jul 2013 23:22:08 +0200
Subject: [Buildroot] [git commit] gst-plugins-good: fix v4l2 related build
	error with new (3.9+) kernel headers
Message-ID: <20130709212513.5D0A79A085@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce4a6ced942355eedc4ffae7c27cbab057b95ceb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix from gstreamer git.

Fixes http://autobuild.buildroot.net/results/e2b/e2b1c5219676c7d033353b7bd8273440c40dcf49/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-compilation-against-newer-kernel-headers.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch b/package/multimedia/gst-plugins-good/gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch
new file mode 100644
index 0000000..62c3bb2
--- /dev/null
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch
@@ -0,0 +1,30 @@
+From 8e633d2059cb835448021cf79becb487aff10975 Mon Sep 17 00:00:00 2001
+From: Bastien Nocera <hadess@hadess.net>
+Date: Mon, 18 Mar 2013 14:59:35 +0000
+Subject: [PATCH] v4l2: fix compilation against newer kernel headers as on
+ FC19
+
+---
+ sys/v4l2/v4l2_calls.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sys/v4l2/v4l2_calls.c b/sys/v4l2/v4l2_calls.c
+index 07d390a..4c10f4f 100644
+--- a/sys/v4l2/v4l2_calls.c
++++ b/sys/v4l2/v4l2_calls.c
+@@ -291,8 +291,12 @@ gst_v4l2_fill_lists (GstV4l2Object * v4l2object)
+         break;
+       case V4L2_CID_HFLIP:
+       case V4L2_CID_VFLIP:
++#ifndef V4L2_CID_PAN_RESET
+       case V4L2_CID_HCENTER:
++#endif
++#ifndef V4L2_CID_TILT_RESET
+       case V4L2_CID_VCENTER:
++#endif
+ #ifdef V4L2_CID_PAN_RESET
+       case V4L2_CID_PAN_RESET:
+ #endif
+-- 
+1.7.10.4
+
