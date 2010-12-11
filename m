From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 Dec 2010 02:25:21 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: add 1.18.0 runsvdir fix
Message-ID: <20101211012556.2C8D88DF0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bee91f710a0803904b698407916aeb9d8401e513
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.18.0/busybox-1.18.0-runsvdir.patch   |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch

diff --git a/package/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch b/package/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch
new file mode 100644
index 0000000..41ad570
--- /dev/null
+++ b/package/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch
@@ -0,0 +1,17 @@
+diff -urpN busybox-1.18.0/runit/runsvdir.c busybox-1.18.0-runsvdir/runit/runsvdir.c
+--- busybox-1.18.0/runit/runsvdir.c	2010-11-22 21:43:22.000000000 +0100
++++ busybox-1.18.0-runsvdir/runit/runsvdir.c	2010-12-06 01:27:56.926036992 +0100
+@@ -312,8 +312,11 @@ int runsvdir_main(int argc UNUSED_PARAM,
+ 						last_mtime = s.st_mtime;
+ 						last_dev = s.st_dev;
+ 						last_ino = s.st_ino;
+-						//if (now <= mtime)
+-						//	sleep(1);
++						/* if the svdir changed this very second, wait until the
++						 * next second, because we won't be able to detect more
++						 * changes within this second */
++						while (time(NULL) == last_mtime)
++							usleep(100000);
+ 						need_rescan = do_rescan();
+ 						while (fchdir(curdir) == -1) {
+ 							warn2_cannot("change directory, pausing", "");
-- 
1.7.2.2
