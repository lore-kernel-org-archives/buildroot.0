From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 14:45:20 -0300
Subject: [Buildroot] [PATCH] package/eudev: tweak initscript
Message-ID: <1413827120-11083-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the udev initscript trigger in a coherent way, i.e. first set
subsystems, then device and then let the whole thing settle.
Otherwise for usb_modeswitch udev rules they never kick in since the
storage aspect (device) gets claimed first and the switch ignored.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/eudev/S10udev | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 107dfd5..c3eafce 100755
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -30,8 +30,9 @@ case "$1" in
         printf "Populating ${udev_root:-/dev} using udev: "
         printf '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || (echo "FAIL" && exit 1)
-        udevadm trigger --action=add
-        udevadm settle
+        udevadm trigger --type=subsystems --action=add
+        udevadm trigger --type=devices --action=add
+        udevadm settle --timeout=10
         echo "done"
         ;;
     stop)
-- 
2.0.4
