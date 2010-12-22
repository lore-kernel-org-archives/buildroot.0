From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 22 Dec 2010 22:26:57 +0100
Subject: [Buildroot] [git commit master 1/1] tslib: bump version to current
	git head
Message-ID: <20101222213332.84B388E252@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=36f33bc00f95b27702e07bacac8047f0d1882b62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to missing official releases, fetch directly from GitHub
repository. Many bugfixes since 1.0 and all previous patches in
Buildroot are either applied or obsoleted.

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
Acked-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tslib/ts.conf                              |   25 ---------
 package/tslib/tslib-1.0-absbit.patch               |   11 ----
 .../tslib-1.0-link-plugins-against-libts.patch     |   48 ------------------
 package/tslib/tslib-1.0-no-cxx.patch               |   17 ------
 ...b-1.0-open-with-O_CREAT-needs-3-arguments.patch |   53 --------------------
 package/tslib/tslib-1.0-remove-bzero.patch         |   11 ----
 ...-1.0-remove-return-on-error-from-check-df.patch |   11 ----
 package/tslib/tslib.mk                             |    6 +--
 8 files changed, 2 insertions(+), 180 deletions(-)
 delete mode 100644 package/tslib/ts.conf
 delete mode 100644 package/tslib/tslib-1.0-absbit.patch
 delete mode 100644 package/tslib/tslib-1.0-link-plugins-against-libts.patch
 delete mode 100644 package/tslib/tslib-1.0-no-cxx.patch
 delete mode 100644 package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch
 delete mode 100644 package/tslib/tslib-1.0-remove-bzero.patch
 delete mode 100644 package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch

diff --git a/package/tslib/ts.conf b/package/tslib/ts.conf
deleted file mode 100644
index 1b0da93..0000000
--- a/package/tslib/ts.conf
+++ /dev/null
@@ -1,25 +0,0 @@
-# Uncomment if you wish to use the linux input layer event interface
-module_raw input
-
-# Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
-# module_raw collie
-
-# Uncomment if you're using a Sharp Zaurus SL-C700/C750/C760/C860
-# module_raw corgi
-
-# Uncomment if you're using a device with a UCB1200/1300/1400 TS interface
-# module_raw ucb1x00
-
-# Uncomment if you're using an HP iPaq h3600 or similar
-# module_raw h3600
-
-# Uncomment if you're using a Hitachi Webpad
-# module_raw mk712
-
-# Uncomment if you're using an IBM Arctic II
-# module_raw arctic2
-
-module pthres pmin=1
-module variance delta=30
-module dejitter delta=100
-module linear
diff --git a/package/tslib/tslib-1.0-absbit.patch b/package/tslib/tslib-1.0-absbit.patch
deleted file mode 100644
index 11e758d..0000000
--- a/package/tslib/tslib-1.0-absbit.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/plugins/input-raw.c	2008-02-28 14:25:33.000000000 -0500
-+++ b/plugins/input-raw.c	2008-02-28 14:27:25.000000000 -0500
-@@ -49,7 +49,7 @@ static int check_fd(struct tslib_input *
- 	struct tsdev *ts = i->module.dev;
- 	int version;
- 	u_int32_t bit;
--	u_int64_t absbit;
-+	u_int32_t absbit;
- 
- 	if (! ((ioctl(ts->fd, EVIOCGVERSION, &version) >= 0) &&
- 		(version == EV_VERSION) &&
diff --git a/package/tslib/tslib-1.0-link-plugins-against-libts.patch b/package/tslib/tslib-1.0-link-plugins-against-libts.patch
deleted file mode 100644
index d60b6a1..0000000
--- a/package/tslib/tslib-1.0-link-plugins-against-libts.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-commit 12435b337ea074bd31ccb03aff58c7eefa86f31c
-Author: kergoth <kergoth@a933c7a4-9bf7-0310-9141-a2e45189604d>
-Date:   Sat Nov 1 20:46:07 2008 +0000
-
-    Link plugins against libts
-    
-    Some plugins use tslib functions. Link those plugins against libts.
-    The problem is easy to see with LDFLAGS="-Wl,-no-undefined".
-    Without this change DirectFB in unable to use tslib because symbols
-    in the tslib plugins can't be resolved.
-    
-    Signed-off-by: Ville Syrjala <syrjala@sci.fi>
-    Signed-off-by: Chris Larson <clarson@kergoth.com>
-    
-    git-svn-id: svn://svn.berlios.de/tslib/trunk/tslib at 56 a933c7a4-9bf7-0310-9141-a2e45189604d
-
-diff --git a/plugins/Makefile.am b/plugins/Makefile.am
-index 3b902c2..4c4ef8b 100644
---- a/plugins/Makefile.am
-+++ b/plugins/Makefile.am
-@@ -114,15 +114,19 @@ pluginexec_LTLIBRARIES = \
-   
- variance_la_SOURCES	= variance.c
- variance_la_LDFLAGS	= -module $(LTVSN)
-+variance_la_LIBADD	= $(top_builddir)/src/libts.la
-   
- dejitter_la_SOURCES	= dejitter.c
- dejitter_la_LDFLAGS	= -module $(LTVSN)
-+dejitter_la_LIBADD	= $(top_builddir)/src/libts.la
-   
- linear_la_SOURCES	= linear.c
- linear_la_LDFLAGS	= -module $(LTVSN)
-+linear_la_LIBADD	= $(top_builddir)/src/libts.la
- 
- pthres_la_SOURCES	= pthres.c
- pthres_la_LDFLAGS	= -module $(LTVSN)
-+pthres_la_LIBADD	= $(top_builddir)/src/libts.la
- 
- # hw access
- corgi_la_SOURCES	= corgi-raw.c
-@@ -148,6 +152,7 @@ tatung_la_LDFLAGS	= -module $(LTVSN)
- 
- input_la_SOURCES	= input-raw.c
- input_la_LDFLAGS	= -module $(LTVSN)
-+input_la_LIBADD		= $(top_builddir)/src/libts.la
- 
- linear_h2200_la_SOURCES	= linear-h2200.c
- linear_h2200_la_LDFLAGS	= -module $(LTVSN)
diff --git a/package/tslib/tslib-1.0-no-cxx.patch b/package/tslib/tslib-1.0-no-cxx.patch
deleted file mode 100644
index 7e4e6d5..0000000
--- a/package/tslib/tslib-1.0-no-cxx.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-tslib: Doesn't use C++, so don't require it in the configure script
----
- configure.ac |    1 -
- 1 file changed, 1 deletion(-)
-
-Index: tslib-1.0/configure.ac
-===================================================================
---- tslib-1.0.orig/configure.ac
-+++ tslib-1.0/configure.ac
-@@ -15,7 +15,6 @@
- TS_DEFAULT_FLAGS
- 
- # Checks for programs.
--AC_PROG_CXX
- AC_PROG_CC
- AC_PROG_CPP
- TS_CC_HIDDEN_VISIBILITY
diff --git a/package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch b/package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch
deleted file mode 100644
index 5b23dd0..0000000
--- a/package/tslib/tslib-1.0-open-with-O_CREAT-needs-3-arguments.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 4769d044fad6033053ee39c1fcd5ccc7693c6f71 Mon Sep 17 00:00:00 2001
-From: kergoth <kergoth@a933c7a4-9bf7-0310-9141-a2e45189604d>
-Date: Tue, 24 Mar 2009 17:42:34 +0000
-Subject: [PATCH] tslib fails to compile on Ubuntu 8.10+, easy patch
-
-I noticed that gcc fails to compile the latest svn copy of tslib due
-to a potentially "unsafe" use of open(). Ubuntu 8.10+, for instance,
-by default enables the compiler flag -D_FORTIFY_SOURCE=2 which throws
-an error on lines 253 and 255 of ts_calibrate.c. This is a pretty
-minor issue, but could potentially stop some people using Ubuntu from
-compiling unless they realize what's going on.
-
-To fix this, all you need to do is set a mode in the open() call. I
-patched ts_calibrate.c to set 0644 (S_IRUSR | S_IWUSR | S_IRGRP |
-S_IROTH) and it compiles fine. See below.
-
-Signed-off-by: Daniel Jabbour <daniel@laptouchinc.com>
-Signed-off-by: Chris Larson <clarson@kergoth.com>
-
-git-svn-id: svn://svn.berlios.de/tslib/trunk/tslib at 72 a933c7a4-9bf7-0310-9141-a2e45189604d
----
- tests/ts_calibrate.c |    7 +++++--
- 1 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/tests/ts_calibrate.c b/tests/ts_calibrate.c
-index 04c75dc..00e9580 100644
---- a/tests/ts_calibrate.c
-+++ b/tests/ts_calibrate.c
-@@ -21,6 +21,7 @@
- #include <sys/ioctl.h>
- #include <sys/mman.h>
- #include <sys/time.h>
-+#include <sys/stat.h>
- #include <linux/kd.h>
- #include <linux/vt.h>
- #include <linux/fb.h>
-@@ -250,9 +251,11 @@ int main()
- 		for (i = 0; i < 7; i++) printf("%d ", cal.a [i]);
- 		printf("\n");
- 		if ((calfile = getenv("TSLIB_CALIBFILE")) != NULL) {
--			cal_fd = open (calfile, O_CREAT | O_RDWR);
-+			cal_fd = open (calfile, O_CREAT | O_RDWR,
-+			               S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
- 		} else {
--			cal_fd = open ("/etc/pointercal", O_CREAT | O_RDWR);
-+			cal_fd = open ("/etc/pointercal", O_CREAT | O_RDWR,
-+			               S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
- 		}
- 		sprintf (cal_buffer,"%d %d %d %d %d %d %d",
- 			 cal.a[1], cal.a[2], cal.a[0],
--- 
-1.7.0
-
diff --git a/package/tslib/tslib-1.0-remove-bzero.patch b/package/tslib/tslib-1.0-remove-bzero.patch
deleted file mode 100644
index 3e3ef3e..0000000
--- a/package/tslib/tslib-1.0-remove-bzero.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/src/ts_parse_vars.c	2006-08-24 17:02:55.000000000 -0400
-+++ b/src/ts_parse_vars.c	2008-03-12 13:57:01.000000000 -0400
-@@ -33,7 +33,7 @@ int tslib_parse_vars(struct tslib_module
- 		return 0;
- 
- 	//s = alloca(strlen(str));
--	bzero(s_holder,1024);
-+	memset(s_holder, 0, 1024);
- 	strncpy(s_holder,str,strlen(str));
- 	s = s_holder;
- 	while ((p = strsep(&s, " \t")) != NULL && ret == 0) {
diff --git a/package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch b/package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch
deleted file mode 100644
index 7945c1b..0000000
--- a/package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/plugins/input-raw.c	2008-01-25 14:02:23.000000000 +0100
-+++ b/plugins/input-raw.new.c	2008-01-25 14:02:50.000000000 +0100
-@@ -58,8 +58,6 @@ static int check_fd(struct tslib_input *
- 		(ioctl(ts->fd, EVIOCGBIT(EV_ABS, sizeof(absbit) * 8), &absbit) >= 0) &&
- 		(absbit & (1 << ABS_X)) &&
- 		(absbit & (1 << ABS_Y)) && (absbit & (1 << ABS_PRESSURE)))) {
--		fprintf(stderr, "selected device is not a touchscreen I understand\n");
--		return -1;
- 	}
- 
- 	if (bit & (1 << EV_SYN))
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 798499e..3ca40c5 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -3,11 +3,9 @@
 # tslib
 #
 #############################################################
-TSLIB_VERSION:=1.0
-TSLIB_SOURCE:=tslib-$(TSLIB_VERSION).tar.bz2
-TSLIB_SITE:=http://download.berlios.de/tslib
+TSLIB_VERSION:=860d69ca
+TSLIB_SITE:=git://github.com/kergoth/tslib.git
 TSLIB_AUTORECONF = YES
-TSLIB_LIBTOOL_PATCH = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_TARGET = YES
 TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
-- 
1.7.2.2
