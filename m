From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 09:25:53 +0200
Subject: [Buildroot] [git commit] eudev: improve S10udev script for startup
Message-ID: <20141012073514.681CCB1F97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df8ae412a44ec21d9928e8ba753adee7207d02bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adjusts the S10udev script by:

 * Using the --action=add option to udevadm trigger. By default, only
   the "change" events are handled by 'udevadm trigger', which means
   it doesn't handle all the "device add" events that occured during
   the boot time, before eudev was started.

 * Adds a call to 'udevadm settle' to make sure we wait for udev to
   handle all the events that occured before eudev was started.

Both of these change match what the Ubuntu and Debian udev startup
scripts are doing.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/S10udev |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index e00aa91..107dfd5 100755
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -30,7 +30,8 @@ case "$1" in
         printf "Populating ${udev_root:-/dev} using udev: "
         printf '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || (echo "FAIL" && exit 1)
-        udevadm trigger
+        udevadm trigger --action=add
+        udevadm settle
         echo "done"
         ;;
     stop)
