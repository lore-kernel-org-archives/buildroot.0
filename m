From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 30 Jan 2018 02:07:19 -0200
Subject: [Buildroot] [PATCH 2/3] eudev: fix printf usage in init script
In-Reply-To: <20180130040720.20172-1-casantos@datacom.ind.br>
References: <20180130040720.20172-1-casantos@datacom.ind.br>
Message-ID: <20180130040720.20172-2-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using a variable in a printf format string may lead to undesirable
results if the variable contains format controls, so replace

    printf "foo $var bar"

by

    printf "foo %s bar" "$var"

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/eudev/S10udev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 654a04df36..640fec625b 100755
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -27,7 +27,7 @@ test -r $UDEV_CONFIG || exit 6
 
 case "$1" in
     start)
-        printf "Populating ${udev_root:-/dev} using udev: "
+        printf "Populating %s using udev: " "${udev_root:-/dev}"
         printf '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || { echo "FAIL"; exit 1; }
         udevadm trigger --type=subsystems --action=add
-- 
2.14.3
