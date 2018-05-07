From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  7 May 2018 18:03:01 +0200
Subject: [Buildroot] [PATCH] busybox: S01mdev: fix module autoloading
Message-ID: <20180507160301.29361-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit b4fc5a180c (package/busybox: support spaces in module aliases in
mdev) changed the mdev coldplugging to handle sysfs path elements containing
spaces.  This unfortunately doesn't work as was recently reported:

http://lists.busybox.net/pipermail/buildroot/2018-May/220903.html

The problem is that sort -z also expects the fields of the input files to be
zero terminated, which is not the case for modalias sysfs entries.

To my knowledge, no modalias entries contain spaces so fix it by dropping
the -z option to sort and adjusting the xargs invocation to match.  The find
invocation and first xargs invocation still uses -print0 / -0, so sysfs
paths containing spaces are still handled correctly.

Spaces in modalias entries could be handled with the xargs -d '\n' option,
but that is unfortunately not supported by the busybox applet.

Reported-by: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/S10mdev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index 63ca955b1c..2ba391a5df 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -9,7 +9,7 @@ case "$1" in
 	echo /sbin/mdev >/proc/sys/kernel/hotplug
 	/sbin/mdev -s
 	# coldplug modules
-	find /sys/ -name modalias -print0 | xargs -0 sort -u -z | xargs -0 modprobe -abq
+	find /sys/ -name modalias -print0 | xargs -0 sort -u | xargs modprobe -abq
 	;;
   stop)
 	;;
-- 
2.11.0
