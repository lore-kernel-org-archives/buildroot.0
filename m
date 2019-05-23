From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 23 May 2019 16:14:44 +0300
Subject: [Buildroot] [PATCH v1] package/busybox: Avoid "can't create
 /proc/sys/kernel/hotplug" error
Message-ID: <20190523131444.36058-1-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At runtime on most of the modern kernels [1] S10mdev script produces an error:

/etc/init.d/S10mdev: line 9: can't create /proc/sys/kernel/hotplug: nonexistent directory

since the commit

  caae7fa1d737 ("busybox: register mdev as hotplug helper when selected")

added it unconditionally.

Check the presence of procfs node before writing to it.

[1]: Linux kernels with the commit
       86d56134f1b6 ("kobject: Make support for uevent_helper optional.")
     applied.

Fixes: caae7fa1d737 ("busybox: register mdev as hotplug helper when selected")
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 package/busybox/S10mdev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index 7075b77016..ddede9a4a6 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -6,7 +6,7 @@
 case "$1" in
   start)
 	echo "Starting mdev..."
-	echo /sbin/mdev >/proc/sys/kernel/hotplug
+	test -f /proc/sys/kernel/hotplug && echo /sbin/mdev > /proc/sys/kernel/hotplug
 	/sbin/mdev -s
 	# coldplug modules
 	find /sys/ -name modalias -print0 | xargs -0 sort -u | tr '\n' '\0' | \
-- 
2.20.1
