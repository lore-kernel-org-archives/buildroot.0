From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 13:50:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/kbd: fix musl build
Message-ID: <1454158223-10088-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/535/5357953e763a1ac4f17332abac54ce2946629a41/
http://autobuild.buildroot.net/results/cbd/cbd8f4ccde45e157e97ca9ef3035fd9e108e10ab/
http://autobuild.buildroot.net/results/cbf/cbfc14d5c7a61e997ff091983e586195e85a4316/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kbd/0002-musl-headers-error.patch          | 122 +++++++++++++++++++++
 .../kbd/0003-fix-struct_winsize-collision.patch    |  18 +++
 2 files changed, 140 insertions(+)
 create mode 100644 package/kbd/0002-musl-headers-error.patch
 create mode 100644 package/kbd/0003-fix-struct_winsize-collision.patch

diff --git a/package/kbd/0002-musl-headers-error.patch b/package/kbd/0002-musl-headers-error.patch
new file mode 100644
index 0000000..e8f8992
--- /dev/null
+++ b/package/kbd/0002-musl-headers-error.patch
@@ -0,0 +1,122 @@
+Fix musl build
+
+Downloaded from
+https://cgit.gentoo.org/proj/hardened-dev.git/tree/sys-apps/kbd/files/kbd-1.15.5-musl-headers-error.patch?h=musl&id=d62c42e26a2c30ae027bec66bf42fbfa9a7e69ae
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -Naur kbd-1.15.3.orig/src/dumpkeys.c kbd-1.15.3/src/dumpkeys.c
+--- kbd-1.15.3.orig/src/dumpkeys.c	2011-05-07 20:33:42.000000000 +0000
++++ kbd-1.15.3/src/dumpkeys.c	2013-07-06 02:20:41.660131968 +0000
+@@ -12,6 +12,7 @@
+ #include <linux/kd.h>
+ #include <linux/keyboard.h>
+ #include <sys/ioctl.h>
++#include <sys/types.h>
+ #include <string.h>
+ #include <errno.h>
+ #include "ksyms.h"
+diff -Naur kbd-1.15.3.orig/src/kbdinfo.c kbd-1.15.3/src/kbdinfo.c
+--- kbd-1.15.3.orig/src/kbdinfo.c	2011-05-07 20:33:42.000000000 +0000
++++ kbd-1.15.3/src/kbdinfo.c	2013-07-06 02:29:12.057160508 +0000
+@@ -1,6 +1,5 @@
+ #include <stdio.h>
+ #include <errno.h>
+-#include <error.h>
+ #include <unistd.h>
+ #include <sys/ioctl.h>
+ #include <linux/kd.h>
+@@ -9,6 +8,10 @@
+ #include "nls.h"
+ #include "version.h"
+ 
++#define error(e, n, s)	\
++	perror(s);	\
++	exit(e);	\
++
+ static const char *action = NULL;
+ static const char *value  = NULL;
+ 
+diff -Naur kbd-1.15.3.orig/src/kbdrate.c kbd-1.15.3/src/kbdrate.c
+--- kbd-1.15.3.orig/src/kbdrate.c	2011-05-07 20:33:42.000000000 +0000
++++ kbd-1.15.3/src/kbdrate.c	2013-07-06 02:21:53.121135964 +0000
+@@ -74,6 +74,7 @@
+ #include <errno.h>
+ #include <sys/file.h>
+ #include <sys/ioctl.h>
++#include <fcntl.h>
+ 
+ #ifdef __sparc__
+ #include <asm/param.h>
+diff -Naur kbd-1.15.3.orig/src/loadkeys.c kbd-1.15.3/src/loadkeys.c
+--- kbd-1.15.3.orig/src/loadkeys.c	2011-05-07 20:33:42.000000000 +0000
++++ kbd-1.15.3/src/loadkeys.c	2013-07-06 02:21:02.148133114 +0000
+@@ -79,6 +79,7 @@
+ #include <ctype.h>
+ #include <sys/param.h>
+ #include <sys/ioctl.h>
++#include <sys/types.h>
+ #include <linux/kd.h>
+ #include <linux/keyboard.h>
+ #include <unistd.h>
+diff -Naur kbd-1.15.3.orig/src/openvt.c kbd-1.15.3/src/openvt.c
+--- kbd-1.15.3.orig/src/openvt.c	2011-05-07 20:33:42.000000000 +0000
++++ kbd-1.15.3/src/openvt.c	2013-07-06 02:22:11.080136968 +0000
+@@ -10,6 +10,7 @@
+ #include <sys/vt.h>
+ #include <sys/wait.h>
+ #include <sys/file.h>
++#include <fcntl.h>
+ 
+ #include "version.h"
+ #include "xmalloc.h"
+diff -Naur kbd-1.15.3.orig/src/setvtrgb.c kbd-1.15.3/src/setvtrgb.c
+--- kbd-1.15.3.orig/src/setvtrgb.c	2011-05-07 20:33:42.000000000 +0000
++++ kbd-1.15.3/src/setvtrgb.c	2013-07-06 02:34:26.390178084 +0000
+@@ -5,12 +5,15 @@
+ #include <sys/ioctl.h>
+ #include <linux/kd.h>
+ #include <errno.h>
+-#include <error.h>
+ #include "kbd.h"
+ #include "getfd.h"
+ #include "nls.h"
+ #include "version.h"
+ 
++#define error(e, n, s)  \
++	perror(s);      \
++        exit(e);        \
++
+ static unsigned char *cmap;
+ 
+ /* Standard VGA terminal colors, matching those hardcoded in the Linux kernel's
+@@ -82,25 +85,21 @@
+ 				if (c == EOF)
+ 					error(EXIT_FAILURE, errno, "fscanf");
+ 
+-				error(EXIT_FAILURE, 0, _("Error: %s: Invalid value in field %u in line %u."),
+-				      filename, rows + 1, cols + 1);
++				error(EXIT_FAILURE, 0, "setvtrgb");
+ 			}
+ 
+ 			cmap[rows + cols * 3] = (unsigned char) val;
+ 
+ 			if (cols < 15 && fgetc(fd) != ',')
+-				error(EXIT_FAILURE, 0, _("Error: %s: Insufficient number of fields in line %u."),
+-				      filename, rows + 1);
++				error(EXIT_FAILURE, 0, "setvtrgb");
+ 			cols++;
+ 		}
+ 
+ 		if ((c = fgetc(fd)) == EOF)
+-			error(EXIT_FAILURE, 0, _("Error: %s: Line %u has ended unexpectedly.\n"),
+-			      filename, rows + 1); 
++			error(EXIT_FAILURE, 0, "setvtrgb");
+ 
+ 		if (c != '\n')
+-			error(EXIT_FAILURE, 0, _("Error: %s: Line %u is too long.\n"),
+-			      filename, rows + 1);
++			error(EXIT_FAILURE, 0, "setvtrgb");
+ 	}
+ }
+ 
diff --git a/package/kbd/0003-fix-struct_winsize-collision.patch b/package/kbd/0003-fix-struct_winsize-collision.patch
new file mode 100644
index 0000000..9c0d363
--- /dev/null
+++ b/package/kbd/0003-fix-struct_winsize-collision.patch
@@ -0,0 +1,18 @@
+Fix musl build
+
+Downloaded from
+https://cgit.gentoo.org/proj/hardened-dev.git/tree/sys-apps/kbd/files/kbd-1.15.5-fix-struct_winsize-collision.patch?h=musl&id=d62c42e26a2c30ae027bec66bf42fbfa9a7e69ae
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -Naur kbd-1.15.5.orig/src/resizecons.c kbd-1.15.5/src/resizecons.c
+--- kbd-1.15.5.orig/src/resizecons.c	2012-12-01 21:41:38.000000000 +0000
++++ kbd-1.15.5/src/resizecons.c	2014-01-16 13:48:25.793935059 +0000
+@@ -82,7 +82,6 @@
+ #include <sys/perm.h>
+ #else
+ #include <linux/types.h>
+-#include <linux/termios.h>
+ #endif
+ #include <linux/vt.h>
+ #include "paths.h"
-- 
2.7.0.rc3
