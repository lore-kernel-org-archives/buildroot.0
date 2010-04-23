From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 23 Apr 2010 11:00:55 +0200
Subject: [Buildroot] [git commit master] tslib: fix use of open()
Message-ID: <20100423090213.1BB4020670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=532d36fa15b8804fc2497ae8920b29790d8e07be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes error: "open with O_CREAT in second argument needs 3 arguments".

Original patch: svn://svn.berlios.de/tslib/trunk/tslib r72.

[Peter: pull original patch for proper attribution]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 ...b-1.0-open-with-O_CREAT-needs-3-arguments.patch |   53 ++++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletions(-)
 create mode 100644 package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch

diff --git a/CHANGES b/CHANGES
index 2eb5694..3f18ec6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -17,7 +17,7 @@
 	libaio,libdrm, libgcrypt, libglib2, libpng, libxml2, matchbox,
 	mdadm, memstat, mesa3d, mtd-utils, nano, openssl, pciutils,
 	php, pixman, portage, pppd, pthread-stubs, python, qt, radvd,
-	setserial, squashfs, usb_modeswith, wget,
+	setserial, squashfs, tslib, usb_modeswith, wget,
 	xdriver_xf86-video-intel, xkeyboard-config, xlib_libX11,
 	xlib_libXaw, xlib_libXfont, xlib_libXfontcache, xlib_libXxf86misc,
 	xlib_libpciaccess, xproto_dri2proto, xproto_eviext,
diff --git a/package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch b/package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch
new file mode 100644
index 0000000..5b23dd0
--- /dev/null
+++ b/package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch
@@ -0,0 +1,53 @@
+From 4769d044fad6033053ee39c1fcd5ccc7693c6f71 Mon Sep 17 00:00:00 2001
+From: kergoth <kergoth@a933c7a4-9bf7-0310-9141-a2e45189604d>
+Date: Tue, 24 Mar 2009 17:42:34 +0000
+Subject: [PATCH] tslib fails to compile on Ubuntu 8.10+, easy patch
+
+I noticed that gcc fails to compile the latest svn copy of tslib due
+to a potentially "unsafe" use of open(). Ubuntu 8.10+, for instance,
+by default enables the compiler flag -D_FORTIFY_SOURCE=2 which throws
+an error on lines 253 and 255 of ts_calibrate.c. This is a pretty
+minor issue, but could potentially stop some people using Ubuntu from
+compiling unless they realize what's going on.
+
+To fix this, all you need to do is set a mode in the open() call. I
+patched ts_calibrate.c to set 0644 (S_IRUSR | S_IWUSR | S_IRGRP |
+S_IROTH) and it compiles fine. See below.
+
+Signed-off-by: Daniel Jabbour <daniel@laptouchinc.com>
+Signed-off-by: Chris Larson <clarson@kergoth.com>
+
+git-svn-id: svn://svn.berlios.de/tslib/trunk/tslib at 72 a933c7a4-9bf7-0310-9141-a2e45189604d
+---
+ tests/ts_calibrate.c |    7 +++++--
+ 1 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/tests/ts_calibrate.c b/tests/ts_calibrate.c
+index 04c75dc..00e9580 100644
+--- a/tests/ts_calibrate.c
++++ b/tests/ts_calibrate.c
+@@ -21,6 +21,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+ #include <sys/time.h>
++#include <sys/stat.h>
+ #include <linux/kd.h>
+ #include <linux/vt.h>
+ #include <linux/fb.h>
+@@ -250,9 +251,11 @@ int main()
+ 		for (i = 0; i < 7; i++) printf("%d ", cal.a [i]);
+ 		printf("\n");
+ 		if ((calfile = getenv("TSLIB_CALIBFILE")) != NULL) {
+-			cal_fd = open (calfile, O_CREAT | O_RDWR);
++			cal_fd = open (calfile, O_CREAT | O_RDWR,
++			               S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+ 		} else {
+-			cal_fd = open ("/etc/pointercal", O_CREAT | O_RDWR);
++			cal_fd = open ("/etc/pointercal", O_CREAT | O_RDWR,
++			               S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+ 		}
+ 		sprintf (cal_buffer,"%d %d %d %d %d %d %d",
+ 			 cal.a[1], cal.a[2], cal.a[0],
+-- 
+1.7.0
+
-- 
1.6.3.3
