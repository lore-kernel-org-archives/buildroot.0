From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 23:02:33 +0200
Subject: [Buildroot] [git commit] package/eudev: tweak initscript
Message-ID: <20141022210933.D28A5B06A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f04a4ad6c20240a67dde097539aaa49cfa01527
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make the udev initscript trigger in a coherent way, i.e. first set
subsystems, then device and then let the whole thing settle.
Otherwise for usb_modeswitch udev rules they never kick in since the
storage aspect (device) gets claimed first and the switch ignored.
Also set the settle timeout to a smaller value than the default
120 seconds to avoid stalling too much.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/S10udev |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 107dfd5..8382bec 100755
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
+        udevadm settle --timeout=30 || echo "udevadm settle failed"
         echo "done"
         ;;
     stop)
