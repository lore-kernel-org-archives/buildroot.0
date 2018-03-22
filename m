From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Thu, 22 Mar 2018 09:20:01 -0700
Subject: [Buildroot] [PATCH] eudev: prevent udev init script nonexistent
 directory error
Message-ID: <1521735601-29879-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following error occures in the udev init script because the kernel config
may optionally not include uevent_helper.

/etc/init.d/S10udev: line 47: can't create /proc/sys/kernel/hotplug: nonexistent directory

Work around this by not trying to access the destination if it's not available.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 package/eudev/S10udev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 640fec6..47c715c 100755
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -28,7 +28,7 @@ test -r $UDEV_CONFIG || exit 6
 case "$1" in
     start)
         printf "Populating %s using udev: " "${udev_root:-/dev}"
-        printf '\000\000\000\000' > /proc/sys/kernel/hotplug
+        [ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || { echo "FAIL"; exit 1; }
         udevadm trigger --type=subsystems --action=add
         udevadm trigger --type=devices --action=add
-- 
2.7.4
