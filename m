From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:15:50 +0200
Subject: [Buildroot] [git commit] package/busybox: support spaces in module
	aliases in mdev
Message-ID: <20160702111607.1697F818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4fc5a180c81689a982d5c595844331684c14f51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new change which enabled automatic module loading on boot does not handle
the cases when module alias includes spaces. It prevents modules to be loaded
since script fails:

  % find /sys/ -name modalias | xargs sort -u
  sort: /sys/devices/platform/Fixed: No such file or directory

First alias in question is "platform:Fixed MDIO bus".

Amend the script to support above like cases.

Fixes: 07f46c2b6dae ("package/busybox: support automatic module loading with mdev")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/S10mdev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index 4cb31de..63ca955 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -9,7 +9,7 @@ case "$1" in
 	echo /sbin/mdev >/proc/sys/kernel/hotplug
 	/sbin/mdev -s
 	# coldplug modules
-	find /sys/ -name modalias | xargs sort -u | xargs modprobe -abq
+	find /sys/ -name modalias -print0 | xargs -0 sort -u -z | xargs -0 modprobe -abq
 	;;
   stop)
 	;;
