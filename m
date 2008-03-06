From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:27:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
Message-ID: <20080306182758.09F16120295@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:27:57 -0800 (Thu, 06 Mar 2008)
New Revision: 21235

Log:
patches for tslib

Added:
   trunk/buildroot/package/tslib/tslib-1.0-absbit.patch
   trunk/buildroot/package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch


Changeset:
Added: trunk/buildroot/package/tslib/tslib-1.0-absbit.patch
===================================================================
--- trunk/buildroot/package/tslib/tslib-1.0-absbit.patch	                        (rev 0)
+++ trunk/buildroot/package/tslib/tslib-1.0-absbit.patch	2008-03-06 18:27:57 UTC (rev 21235)
@@ -0,0 +1,11 @@
+--- a/plugins/input-raw.c	2008-02-28 14:25:33.000000000 -0500
++++ b/plugins/input-raw.c	2008-02-28 14:27:25.000000000 -0500
+@@ -49,7 +49,7 @@ static int check_fd(struct tslib_input *
+ 	struct tsdev *ts = i->module.dev;
+ 	int version;
+ 	u_int32_t bit;
+-	u_int64_t absbit;
++	u_int32_t absbit;
+ 
+ 	if (! ((ioctl(ts->fd, EVIOCGVERSION, &version) >= 0) &&
+ 		(version == EV_VERSION) &&

Added: trunk/buildroot/package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch
===================================================================
--- trunk/buildroot/package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch	                        (rev 0)
+++ trunk/buildroot/package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch	2008-03-06 18:27:57 UTC (rev 21235)
@@ -0,0 +1,11 @@
+--- a/plugins/input-raw.c	2008-01-25 14:02:23.000000000 +0100
++++ b/plugins/input-raw.new.c	2008-01-25 14:02:50.000000000 +0100
+@@ -58,8 +58,6 @@ static int check_fd(struct tslib_input *
+ 		(ioctl(ts->fd, EVIOCGBIT(EV_ABS, sizeof(absbit) * 8), &absbit) >= 0) &&
+ 		(absbit & (1 << ABS_X)) &&
+ 		(absbit & (1 << ABS_Y)) && (absbit & (1 << ABS_PRESSURE)))) {
+-		fprintf(stderr, "selected device is not a touchscreen I understand\n");
+-		return -1;
+ 	}
+ 
+ 	if (bit & (1 << EV_SYN))
