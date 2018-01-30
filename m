From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 30 Jan 2018 02:07:18 -0200
Subject: [Buildroot] [PATCH 1/3] eudev: fix error handling init script
Message-ID: <20180130040720.20172-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace (echo "msg" && exit 1) by { echo "msg"; exit 1; }.

The (list) compound command runs in a subshell, so the "exit" interrupts
the subshell, not the main script. Examples:

    $ sh -c "echo 1; (exit 1); echo 2"
    1
    2
    $ sh -c "echo 1; { exit 1; }; echo 2"
    1
    $

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/eudev/S10udev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 8382bec2bb..654a04df36 100755
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -29,7 +29,7 @@ case "$1" in
     start)
         printf "Populating ${udev_root:-/dev} using udev: "
         printf '\000\000\000\000' > /proc/sys/kernel/hotplug
-        $UDEV_BIN -d || (echo "FAIL" && exit 1)
+        $UDEV_BIN -d || { echo "FAIL"; exit 1; }
         udevadm trigger --type=subsystems --action=add
         udevadm trigger --type=devices --action=add
         udevadm settle --timeout=30 || echo "udevadm settle failed"
-- 
2.14.3
