From: luca at lucaceresoli.net <luca@lucaceresoli.net>
Date: Fri, 23 Apr 2010 10:24:53 +0200
Subject: [Buildroot] [PATCH] tslib: fix use of open()
Message-ID: <1272011093-4995-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Luca Ceresoli <luca@lucaceresoli.net>

Fixes error: "open with O_CREAT in second argument needs 3 arguments".

Original patch: svn://svn.berlios.de/tslib/trunk/tslib r72.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 ...b-1.0-open-with-O_CREAT-needs-3-arguments.patch |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch

diff --git a/package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch b/package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch
new file mode 100644
index 0000000..92b33f8
--- /dev/null
+++ b/package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch
@@ -0,0 +1,25 @@
+diff -ur a/tests/ts_calibrate.c b/tests/ts_calibrate.c
+--- a/tests/ts_calibrate.c	2010-04-22 17:36:33.000000000 +0200
++++ b/tests/ts_calibrate.c	2010-04-22 17:38:09.000000000 +0200
+@@ -21,6 +21,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+ #include <sys/time.h>
++#include <sys/stat.h>
+ #include <linux/kd.h>
+ #include <linux/vt.h>
+ #include <linux/fb.h>
+@@ -224,9 +225,11 @@
+ 		for (i = 0; i < 7; i++) printf("%d ", cal.a [i]);
+ 		printf("\n");
+ 		if ((calfile = getenv("TSLIB_CALIBFILE")) != NULL) {
+-			cal_fd = open (calfile, O_CREAT | O_RDWR);
++		  cal_fd = open (calfile, O_CREAT | O_RDWR,
++		                 S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+ 		} else {
+-			cal_fd = open ("/etc/pointercal", O_CREAT | O_RDWR);
++			cal_fd = open ("/etc/pointercal", O_CREAT | O_RDWR,
++		                 S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+ 		}
+ 		sprintf (cal_buffer,"%d %d %d %d %d %d %d",
+ 			 cal.a[1], cal.a[2], cal.a[0],
-- 
1.6.3.3
