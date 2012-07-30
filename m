From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 21:18:09 +0200
Subject: [Buildroot] [git commit] udev: process udev events on startup in
	init.d script
Message-ID: <20120730191827.CAEF081EC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29afecace95d0687477bf42f7ce4e918bcd0f271
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udev rules are not processed for kernel events that occur before
the udev daemon is started. Call udevadm trigger to replay these
missed events.

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udev/S10udev |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
