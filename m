From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri,  1 Jul 2016 21:56:19 +0300
Subject: [Buildroot] [PATCH v1 1/1] package/busybox: support spaces in
	module aliases in mdev
Message-ID: <1467399379-945-1-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new change which enabled automatic module loading on boot does not handle
the cases when module alias includes spaces. It prevents modules to be loaded
since script fails:

  % find /sys/ -name modalias | xargs sort -u
  sort: /sys/devices/platform/Fixed: No such file or directory

First alias in question is "platform:Fixed MDIO bus".

Amend the script to support above like cases.

Fixes: 07f46c2b6dae ("package/busybox: support automatic module loading with mdev")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 package/busybox/S10mdev | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index 4cb31de..f72c43f 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -9,7 +9,9 @@ case "$1" in
 	echo /sbin/mdev >/proc/sys/kernel/hotplug
 	/sbin/mdev -s
 	# coldplug modules
-	find /sys/ -name modalias | xargs sort -u | xargs modprobe -abq
+	find /sys -name modalias -print0 | xargs -0 sort -u | while read ma; do
+		modprobe -bq "$ma"
+	done
 	;;
   stop)
 	;;
-- 
2.8.1
