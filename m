From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 18 Jan 2009 10:53:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/input-tools
Message-ID: <20090118105306.C73EB77108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-18 10:53:06 +0000 (Sun, 18 Jan 2009)
New Revision: 24899

Log:
Change use of rint, which is only supported for X86 in uClibc to generic rounding

Added:
   trunk/buildroot/package/input-tools/joystick-20051019-rint.patch


Changeset:
Added: trunk/buildroot/package/input-tools/joystick-20051019-rint.patch
===================================================================
--- trunk/buildroot/package/input-tools/joystick-20051019-rint.patch	                        (rev 0)
+++ trunk/buildroot/package/input-tools/joystick-20051019-rint.patch	2009-01-18 10:53:06 UTC (rev 24899)
@@ -0,0 +1,18 @@
+diff -urN joystick-20051019.orig/utils/jscal.c joystick-20051019/utils/jscal.c
+--- joystick-20051019.orig/utils/jscal.c	2004-10-19 09:51:52.000000000 +0200
++++ joystick-20051019/utils/jscal.c	2009-01-18 10:48:50.000000000 +0100
+@@ -141,10 +141,10 @@
+ 	c = 32767.0 / (inputs.cmin[1] - inputs.cmax[0]);
+ 	d = 32767.0 / (inputs.cmin[2] - inputs.cmax[1]);
+ 
+-	results[0] = rint(a);
+-	results[1] = rint(b);
+-	results[2] = rint(c*16384.0);
+-	results[3] = rint(d*16384.0);
++	results[0] = (int) (a + 0.5);
++	results[1] = (int) (b + 0.5);
++	results[2] = (int) (c*16384.0 + 0.5);
++	results[3] = (int) (d*16384.0 + 0.5);
+ 
+ 	return 1;
+ }
