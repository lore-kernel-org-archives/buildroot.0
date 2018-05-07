From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  7 May 2018 20:35:01 +0200
Subject: [Buildroot] [PATCH v2] busybox: S01mdev: fix module autoloading
Message-ID: <20180507183501.13778-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit b4fc5a180c (package/busybox: support spaces in module aliases in
mdev) changed the mdev coldplugging to handle sysfs path elements and
modalias values containing spaces.  This unfortunately doesn't work as was
recently reported:

http://lists.busybox.net/pipermail/buildroot/2018-May/220903.html

The problem is that sort -z also expects the fields of the input files to be
zero terminated, which is not the case for modalias sysfs entries.

So drop the -z option to sort.  Spaces in modalias entries could be handled
with the xargs -d '\n' option, but that is unfortunately not supported by
the busybox applet.  Instead, use tr to convert newlines to zeros so we can
use xargs -0.

Reported-by: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/S10mdev | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index 63ca955b1c..7075b77016 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -9,7 +9,8 @@ case "$1" in
 	echo /sbin/mdev >/proc/sys/kernel/hotplug
 	/sbin/mdev -s
 	# coldplug modules
-	find /sys/ -name modalias -print0 | xargs -0 sort -u -z | xargs -0 modprobe -abq
+	find /sys/ -name modalias -print0 | xargs -0 sort -u | tr '\n' '\0' | \
+	    xargs -0 modprobe -abq
 	;;
   stop)
 	;;
-- 
2.11.0
