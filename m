From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 22:58:17 +0100
Subject: [Buildroot] [git commit] eudev: fix printf usage in init script
Message-ID: <20180130215819.76C3788103@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6298ed8bf46dd546d4ee7244136f2f9bad82ecad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using a variable in a printf format string may lead to undesirable
results if the variable contains format controls, so replace

    printf "foo $var bar"

by

    printf "foo %s bar" "$var"

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
