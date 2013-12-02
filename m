From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon,  2 Dec 2013 10:10:25 +0000
Subject: [Buildroot] [PATCH] gpsd: fix build error when reconfigure disabled
Message-ID: <1385979025-7231-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Fixes build failures such as the following.

  http://autobuild.buildroot.net/results/424/42409545547daddd77c9e9bd59474ed033834ad5/

Note that the gpsd patch has been sent, but not yet accepted, upstream.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...04-fix-reconfigure-disabled-compile-error.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/gpsd/gpsd-04-fix-reconfigure-disabled-compile-error.patch

diff --git a/package/gpsd/gpsd-04-fix-reconfigure-disabled-compile-error.patch b/package/gpsd/gpsd-04-fix-reconfigure-disabled-compile-error.patch
new file mode 100644
index 0000000..90b4dc2
--- /dev/null
+++ b/package/gpsd/gpsd-04-fix-reconfigure-disabled-compile-error.patch
@@ -0,0 +1,33 @@
+When building with reconfigure=no, the build fails as follows.
+
+  libgpsd_core.c: In function 'gpsd_poll':
+  libgpsd_core.c:1236:35: error: 'const struct gps_type_t' has no member named 'mode_switcher'
+  scons: *** [libgpsd_core.os] Error 1
+  scons: building terminated because of errors.
+  make: *** [/scratch/peko/build/gpsd-3.10/.stamp_built] Error 2
+
+For an example, see the following autobuild failure.
+
+  http://autobuild.buildroot.net/results/424/42409545547daddd77c9e9bd59474ed033834ad5/
+
+The problem appears to be a failure to protect the mode_switcher field with
+a RECONFIGURE_ENABLE ifdef.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/libgpsd_core.c b/libgpsd_core.c
+--- a/libgpsd_core.c	2013-11-21 08:57:44.000000000 +0000
++++ b/libgpsd_core.c	2013-12-02 09:57:57.250335098 +0000
+@@ -1232,8 +1232,12 @@ gps_mask_t gpsd_poll(struct gps_device_t
+ 		 * previous mode switch to binary succeeded in suppressing
+ 		 * NMEA).
+ 		 */
++#ifdef RECONFIGURE_ENABLE
+ 		bool dependent_nmea = (newtype == NMEA_PACKET
+ 				       && session->device_type->mode_switcher!=NULL);
++#else
++		bool dependent_nmea = false;
++#endif /* RECONFIGURE_ENABLE */
+ 
+ 		/*
+ 		 * Compute whether to switch drivers.
-- 
1.8.3.2
