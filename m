From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  9 Mar 2016 00:03:25 +0100
Subject: [Buildroot] [PATCH] package/busybox: support automatic module
	loading with mdev
Message-ID: <1457478205-18515-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A recently discussed on the mailing list:
http://lists.busybox.net/pipermail/buildroot/2016-February/154189.html

Our mdev configuration currently doesn't handle module loading. Fix that by:

- Telling mdev to run modprobe on hotplug events providing MODALIAS

- Adjust the init script to handle coldplug modalias events (E.G. modules
  for which the devices were already present before mdev was added as the
  hotplug handler). mdev -s should arguable handle this, but it doesn't.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/S10mdev   | 2 ++
 package/busybox/mdev.conf | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index d386d42..4cb31de 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -8,6 +8,8 @@ case "$1" in
 	echo "Starting mdev..."
 	echo /sbin/mdev >/proc/sys/kernel/hotplug
 	/sbin/mdev -s
+	# coldplug modules
+	find /sys/ -name modalias | xargs sort -u | xargs modprobe -abq
 	;;
   stop)
 	;;
diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
index 247c0ed..4fafe63 100644
--- a/package/busybox/mdev.conf
+++ b/package/busybox/mdev.conf
@@ -33,3 +33,6 @@ event[0-9]+	root:root 640 =input/
 mice		root:root 640 =input/
 mouse[0-9]	root:root 640 =input/
 ts[0-9]		root:root 600 =input/
+
+# load modules
+$MODALIAS=.*	root:root 660 @modprobe "$MODALIAS"
-- 
2.7.0
