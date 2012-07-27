From: Jonathan Liu <net147@gmail.com>
Date: Sat, 28 Jul 2012 00:03:58 +1000
Subject: [Buildroot] [PATCH] udev: process udev events on startup in init.d
	script
Message-ID: <1343397838-2265-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

udev rules are not processed for kernel events that occur before
the udev daemon is started. Call udevadm trigger to replay these
missed events.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/udev/S10udev | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/udev/S10udev b/package/udev/S10udev
index 7bb4309..2c7b7e9 100755
--- a/package/udev/S10udev
+++ b/package/udev/S10udev
@@ -30,6 +30,7 @@ case "$1" in
         echo -n "Populating ${udev_root:-/dev} using udev: "
         echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || (echo "FAIL" && exit 1)
+        udevadm trigger
         echo "done"
         ;;
     stop)
-- 
1.7.11.2
