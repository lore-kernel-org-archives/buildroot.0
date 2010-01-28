From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] at: bump version, fix make install,
	convert to Makefile.autotools.in format
Message-ID: <20100128150634.B307E77719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=97ab9b4c4150bbf5fb973664cbc1f5fad28da41a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make install would fail if target != host, as it tried to use host strip
for install -s.

Patch 1-5 from ptxdist.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/at/S99at                                   |   38 +++++++
 ...c-remove-manual-compiler-check-with-AC_TR.patch |   33 ++++++
 ...c-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch |   34 +++++++
 ...-Makefile.in-add-LDFLAGS-to-linking-stage.patch |   38 +++++++
 ...0005-Makefile.in-replace-IROOT-by-DESTDIR.patch |   97 ++++++++++++++++++
 ...-3.1.12-0006-Makefile.in-make-install-fix.patch |   69 +++++++++++++
 package/at/at-3.1.12-0007-getloadavg-fix.patch     |   30 ++++++
 package/at/at-crosscompile.patch                   |   83 ---------------
 package/at/at.mk                                   |  105 +++++++-------------
 9 files changed, 373 insertions(+), 154 deletions(-)
 create mode 100755 package/at/S99at
 create mode 100644 package/at/at-3.1.12-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
 create mode 100644 package/at/at-3.1.12-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
 create mode 100644 package/at/at-3.1.12-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
 create mode 100644 package/at/at-3.1.12-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch
 create mode 100644 package/at/at-3.1.12-0006-Makefile.in-make-install-fix.patch
 create mode 100644 package/at/at-3.1.12-0007-getloadavg-fix.patch
 delete mode 100644 package/at/at-crosscompile.patch

diff --git a/package/at/S99at b/package/at/S99at
new file mode 100755
index 0000000..c3be80c
--- /dev/null
+++ b/package/at/S99at
@@ -0,0 +1,38 @@
+#!/bin/sh
+#
+# Starts at daemon
+#
+
+umask 077
+
+start() {
+	echo -n "Starting atd: "
+	start-stop-daemon --start --quiet --make-pidfile --pidfile /var/run/atd.pid --background --exec /usr/sbin/atd -- -f
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping atd: "
+	start-stop-daemon --stop --quiet --pidfile /var/run/atd.pid
+	echo "OK"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/at/at-3.1.12-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch b/package/at/at-3.1.12-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
new file mode 100644
index 0000000..9e69922
--- /dev/null
+++ b/package/at/at-3.1.12-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
@@ -0,0 +1,33 @@
+From a182f18fa3b9fb3dd817b601b51c758f9a77f407 Mon Sep 17 00:00:00 2001
+From: Marc Kleine-Budde <mkl@pengutronix.de>
+Date: Tue, 1 Dec 2009 17:08:14 +0100
+Subject: [PATCH 1/5] configure.ac: remove manual compiler check with AC_TRY_RUN
+
+AC_TRY_RUN breaks cross compilation, so remove it. autotools will take
+care about a working (cross-) compiler.
+
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+---
+ configure.ac |    6 ------
+ 1 files changed, 0 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a8c2a14..997a37f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -38,12 +38,6 @@ case "$host" in
+     AC_MSG_RESULT(no)
+     ;;
+ esac
+-AC_MSG_CHECKING(Trying to compile a trivial ANSI C program)
+-AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
+-    AC_MSG_RESULT(yes),
+-    AC_MSG_RESULT(no)
+-    AC_MSG_ERROR(Could not compile and run even a trivial ANSI C program - check CC.),
+-    AC_MSG_ERROR(Could not compile and run even a trivial ANSI C program - check CC.))
+ 
+ AC_MSG_CHECKING(__attribute__((noreturn)))
+ AC_TRY_COMPILE([], [void __attribute__((noreturn)) panic(void);],
+-- 
+1.6.5.3
+
diff --git a/package/at/at-3.1.12-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch b/package/at/at-3.1.12-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
new file mode 100644
index 0000000..ab6de44
--- /dev/null
+++ b/package/at/at-3.1.12-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
@@ -0,0 +1,34 @@
+From e12c96cccab550eda31cf7bb1dedddd3670ffe69 Mon Sep 17 00:00:00 2001
+From: Marc Kleine-Budde <mkl@pengutronix.de>
+Date: Tue, 1 Dec 2009 17:22:22 +0100
+Subject: [PATCH 2/5] configure.ac: convert AC_TRY_COMPILE -> AC_COMPILE_IFELSE
+
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+---
+ configure.ac |   10 +++++-----
+ 1 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 997a37f..cab80ed 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,11 +40,11 @@ case "$host" in
+ esac
+ 
+ AC_MSG_CHECKING(__attribute__((noreturn)))
+-AC_TRY_COMPILE([], [void __attribute__((noreturn)) panic(void);],
+-    AC_MSG_RESULT(yes)
+-    AC_DEFINE(HAVE_ATTRIBUTE_NORETURN, 1,
+-	      [Define to 1 if compiler supports __attribute__((noreturn))]),
+-    AC_MSG_RESULT(no)
++AC_COMPILE_IFELSE(
++	[AC_LANG_PROGRAM([[]], [[void __attribute__((noreturn)) panic(void);]])],
++	[AC_MSG_RESULT(yes)
++	 AC_DEFINE(HAVE_ATTRIBUTE_NORETURN, 1, Define to 1 if compiler supports __attribute__((noreturn)))],
++	[AC_MSG_RESULT(no)]
+ )
+ dnl Checks for libraries.
+ 
+-- 
+1.6.5.3
+
diff --git a/package/at/at-3.1.12-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch b/package/at/at-3.1.12-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
new file mode 100644
index 0000000..e1ab3d3
--- /dev/null
+++ b/package/at/at-3.1.12-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
@@ -0,0 +1,38 @@
+From 8720a71757f3626bf3bbc3a7aa2185e6387e5689 Mon Sep 17 00:00:00 2001
+From: Marc Kleine-Budde <mkl@pengutronix.de>
+Date: Tue, 1 Dec 2009 20:37:31 +0100
+Subject: [PATCH 3/5] Makefile.in: add LDFLAGS to linking stage
+
+The linking stage ignores the LDFLAGS, this breaks if the flex library
+lives in a non standard location.
+
+This patch add LDFLAGS to both "at" and "atd" linking stage.
+
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+---
+ Makefile.in |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index dae6b7d..b766bbb 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -65,13 +65,13 @@ LIST = Filelist Filelist.asc
+ all: at atd atrun
+ 
+ at: $(ATOBJECTS)
+-	$(CC) $(CFLAGS) -o at $(ATOBJECTS) $(LIBS) $(LEXLIB)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o at $(ATOBJECTS) $(LIBS) $(LEXLIB)
+ 	rm -f $(CLONES)
+ 	$(LN_S) -f at atq
+ 	$(LN_S) -f at atrm
+ 
+ atd: $(RUNOBJECTS)
+-	$(CC) $(CFLAGS) -o atd $(RUNOBJECTS) $(LIBS) $(PAMLIB)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o atd $(RUNOBJECTS) $(LIBS) $(PAMLIB)
+ 
+ y.tab.c y.tab.h: parsetime.y
+ 	$(YACC) -d parsetime.y
+-- 
+1.6.5.3
+
diff --git a/package/at/at-3.1.12-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/at-3.1.12-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch
new file mode 100644
index 0000000..6a295e3
--- /dev/null
+++ b/package/at/at-3.1.12-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch
@@ -0,0 +1,97 @@
+From 195d30e2e01fe2f91ed3bdaeec3982aa66b309dd Mon Sep 17 00:00:00 2001
+From: Marc Kleine-Budde <mkl@pengutronix.de>
+Date: Tue, 1 Dec 2009 20:57:45 +0100
+Subject: [PATCH 5/5] Makefile.in: replace IROOT by DESTDIR
+
+This patch replaces IROOT by DESTDIR, which is the autotools standard
+variable. For backwards compatibilty IROOT overwrites the DESTDIR.
+
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+---
+ Makefile.in |   64 +++++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 34 insertions(+), 30 deletions(-)
+
+Index: at-3.1.12/Makefile.in
+===================================================================
+--- at-3.1.12.orig/Makefile.in
++++ at-3.1.12/Makefile.in
+@@ -16,6 +16,10 @@ docdir		= $(prefix)/doc
+ atdocdir	= $(docdir)/at
+ etcdir		= @ETCDIR@
+ 
++ifdef IROOT
++DESTDIR		= $(IROOT)
++endif
++
+ DAEMON_USERNAME	= @DAEMON_USERNAME@
+ DAEMON_GROUPNAME= @DAEMON_GROUPNAME@
+ LOADAVG_MX	= @LOADAVG_MX@
+@@ -86,38 +90,38 @@ atrun: atrun.in
+ 	$(CC) -c $(CFLAGS) $(DEFS) $*.c
+ 
+ install: all
+-	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(etcdir)
+-	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(bindir)
+-	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(docdir)
+-	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(atdocdir)
+-	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(IROOT)$(ATSPOOL_DIR) $(IROOT)$(ATJOB_DIR)
+-	chmod 1770 $(IROOT)$(ATSPOOL_DIR) $(IROOT)$(ATJOB_DIR)
+-	touch $(IROOT)$(LFILE)
+-	chmod 600 $(IROOT)$(LFILE)
+-	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(IROOT)$(LFILE)
+-	test -f $(IROOT)$(etcdir)/at.allow || test -f $(IROOT)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(IROOT)$(etcdir)/
+-	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at $(IROOT)$(bindir)
+-	$(LN_S) -f at $(IROOT)$(bindir)/atq
+-	$(LN_S) -f at $(IROOT)$(bindir)/atrm
+-	$(INSTALL) -g root -o root -m 755 batch $(IROOT)$(bindir)
+-	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man1dir)
+-	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man5dir)
+-	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man8dir)
+-	$(INSTALL) -g root -o root -m 755 -s atd $(IROOT)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 atrun $(IROOT)$(sbindir)
+-	$(INSTALL) -g root -o root -m 644 at.1 $(IROOT)$(man1dir)/
+-	cd $(IROOT)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
+-	$(INSTALL) -g root -o root -m 644 atd.8 $(IROOT)$(man8dir)/
++	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
++	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
++	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
++	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
++	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
++	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
++	chmod 1770 $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
++	touch $(DESTDIR)$(LFILE)
++	chmod 600 $(DESTDIR)$(LFILE)
++	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
++	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR)$(etcdir)/
++	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at $(DESTDIR)$(bindir)
++	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
++	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
++	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
++	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
++	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
++	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
++	$(INSTALL) -g root -o root -m 755 -s atd $(DESTDIR)$(sbindir)
++	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
++	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
++	cd $(DESTDIR)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
++	$(INSTALL) -g root -o root -m 644 atd.8 $(DESTDIR)$(man8dir)/
+ 	sed "s,\$${exec_prefix},$(exec_prefix),g" <atrun.8>tmpman
+-	$(INSTALL) -g root -o root -m 644 tmpman $(IROOT)$(man8dir)/atrun.8
++	$(INSTALL) -g root -o root -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
+ 	rm -f tmpman
+-	$(INSTALL) -g root -o root -m 644 at_allow.5 $(IROOT)$(man5dir)/
+-	cd $(IROOT)$(man5dir) && $(LN_S) -f at_allow.5 at_deny.5 
+-	$(INSTALL) -g root -o root -m 644 $(DOCS) $(IROOT)$(atdocdir)
+-	rm -f $(IROOT)$(mandir)/cat1/at.1* $(IROOT)$(mandir)/cat1/batch.1* \
+-		$(IROOT)$(mandir)/cat1/atq.1*
+-	rm -f $(IROOT)$(mandir)/cat1/atd.8*
++	$(INSTALL) -g root -o root -m 644 at_allow.5 $(DESTDIR)$(man5dir)/
++	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at_allow.5 at_deny.5 
++	$(INSTALL) -g root -o root -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
++	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
++		$(DESTDIR)$(mandir)/cat1/atq.1*
++	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
+ 
+ dist: checkin $(DIST) $(LIST) Filelist.asc
+ 	(cd ..; tar cf - `for a in $(DIST) $(LIST); do echo at-$(VERSION)/$$a; done` |\
diff --git a/package/at/at-3.1.12-0006-Makefile.in-make-install-fix.patch b/package/at/at-3.1.12-0006-Makefile.in-make-install-fix.patch
new file mode 100644
index 0000000..b9a4e56
--- /dev/null
+++ b/package/at/at-3.1.12-0006-Makefile.in-make-install-fix.patch
@@ -0,0 +1,69 @@
+[PATCH]: Makefile.in: fix make install for non-root, don't strip
+
+Buildroot will ensure all files are owned by root and stripped anyway
+(if needed) before the rootfs is created.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ Makefile.in |   39 +++++++++++++++++++--------------------
+ 1 file changed, 19 insertions(+), 20 deletions(-)
+
+Index: at-3.1.12/Makefile.in
+===================================================================
+--- at-3.1.12.orig/Makefile.in
++++ at-3.1.12/Makefile.in
+@@ -90,35 +90,34 @@ atrun: atrun.in
+ 	$(CC) -c $(CFLAGS) $(DEFS) $*.c
+ 
+ install: all
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
+-	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(etcdir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(bindir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(sbindir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(docdir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(atdocdir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
+ 	chmod 1770 $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
+ 	touch $(DESTDIR)$(LFILE)
+ 	chmod 600 $(DESTDIR)$(LFILE)
+-	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
+-	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR)$(etcdir)/
+-	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at $(DESTDIR)$(bindir)
++	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -m 640 at.deny $(DESTDIR)$(etcdir)/
++	$(INSTALL) -m 6755 at $(DESTDIR)$(bindir)
+ 	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
+ 	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
+-	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
+-	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
+-	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
+-	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
+-	$(INSTALL) -g root -o root -m 755 -s atd $(DESTDIR)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
+-	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
++	$(INSTALL) -m 755 batch $(DESTDIR)$(bindir)
++	$(INSTALL) -d -m 755 $(DESTDIR)$(man1dir)
++	$(INSTALL) -d -m 755 $(DESTDIR)$(man5dir)
++	$(INSTALL) -d -m 755 $(DESTDIR)$(man8dir)
++	$(INSTALL) -m 755 atd $(DESTDIR)$(sbindir)
++	$(INSTALL) -m 755 atrun $(DESTDIR)$(sbindir)
++	$(INSTALL) -m 644 at.1 $(DESTDIR)$(man1dir)/
+ 	cd $(DESTDIR)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
+-	$(INSTALL) -g root -o root -m 644 atd.8 $(DESTDIR)$(man8dir)/
++	$(INSTALL) -m 644 atd.8 $(DESTDIR)$(man8dir)/
+ 	sed "s,\$${exec_prefix},$(exec_prefix),g" <atrun.8>tmpman
+-	$(INSTALL) -g root -o root -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
++	$(INSTALL) -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
+ 	rm -f tmpman
+-	$(INSTALL) -g root -o root -m 644 at_allow.5 $(DESTDIR)$(man5dir)/
++	$(INSTALL) -m 644 at_allow.5 $(DESTDIR)$(man5dir)/
+ 	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at_allow.5 at_deny.5 
+-	$(INSTALL) -g root -o root -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
++	$(INSTALL) -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
+ 	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
+ 		$(DESTDIR)$(mandir)/cat1/atq.1*
+ 	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
diff --git a/package/at/at-3.1.12-0007-getloadavg-fix.patch b/package/at/at-3.1.12-0007-getloadavg-fix.patch
new file mode 100644
index 0000000..2edb4f0
--- /dev/null
+++ b/package/at/at-3.1.12-0007-getloadavg-fix.patch
@@ -0,0 +1,30 @@
+[PATCH]: fix getloadavg.c compilation, revert to 3.1.10 version
+
+getloadavg.c shipped with 3.1.12 doesn't compile because it references
+headers not shipped. Fix it by simply reverting to the 3.1.10 version.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ getloadavg.c |    7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+Index: at-3.1.12/getloadavg.c
+===================================================================
+--- at-3.1.12.orig/getloadavg.c
++++ at-3.1.12/getloadavg.c
+@@ -66,11 +66,12 @@ Boston, MA  02110-1301  USA */
+ 
+ /* This should always be first.  */
+ #ifdef HAVE_CONFIG_H
+-#include <config.h>
++#include "config.h"
+ #endif
+ 
+-#include "lisp.h"
+-#include "sysfile.h" /* for encapsulated open, close, read, write */
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <fcntl.h>
+ 
+ #ifndef HAVE_GETLOADAVG
+ 
diff --git a/package/at/at-crosscompile.patch b/package/at/at-crosscompile.patch
deleted file mode 100644
index 8b68da7..0000000
--- a/package/at/at-crosscompile.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-diff -rdup at-3.1.10.orig/Makefile.in at-3.1.10/Makefile.in
---- at-3.1.10.orig/Makefile.in	2007-01-22 14:35:41.000000000 +0100
-+++ at-3.1.10/Makefile.in	2007-01-22 14:41:41.000000000 +0100
-@@ -62,6 +62,8 @@ MISC =  COPYING  Makefile.in configure a
- DIST = $(CSRCS) $(HEADERS) $(MISC) $(OTHERS)
- LIST = Filelist Filelist.asc
- 
-+IROOT = $(DESTDIR)
-+
- .PHONY: all install clean dist distclean
- 
- all: at atd atrun
-@@ -78,7 +80,7 @@ atd: $(RUNOBJECTS)
- y.tab.c y.tab.h: parsetime.y
- 	$(YACC) -d parsetime.y
- 
--lex.yy.c: parsetime.l
-+lex.yy.c: parsetime.l y.tab.h
- 	$(LEX) -i parsetime.l
- 
- atrun: atrun.in
-diff -rdup at-3.1.10.orig/config.h.in at-3.1.10/config.h.in
---- at-3.1.10.orig/config.h.in	2007-01-22 14:35:41.000000000 +0100
-+++ at-3.1.10/config.h.in	2007-01-22 14:35:35.000000000 +0100
-@@ -181,3 +181,6 @@
- 
- #undef HAVE_ATTRIBUTE_NORETURN
- #undef HAVE_PAM
-+
-+#undef NEED_YYWRAP
-+
-diff -rdup at-3.1.10.orig/configure at-3.1.10/configure
---- at-3.1.10.orig/configure	2007-01-22 14:35:41.000000000 +0100
-+++ at-3.1.10/configure	2007-01-22 14:35:35.000000000 +0100
-@@ -1037,7 +1037,7 @@ esac
- echo $ac_n "checking Trying to compile a trivial ANSI C program""... $ac_c" 1>&6
- echo "configure:1039: checking Trying to compile a trivial ANSI C program" >&5
- if test "$cross_compiling" = yes; then
--  { echo "configure: error: Could not compile and run even a trivial ANSI C program - check CC." 1>&2; exit 1; }
-+  echo "$ac_t""assuming it works" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
- #line 1044 "configure"
-diff -rdup at-3.1.10.orig/getloadavg.c at-3.1.10/getloadavg.c
---- at-3.1.10.orig/getloadavg.c	2007-01-22 14:35:41.000000000 +0100
-+++ at-3.1.10/getloadavg.c	2007-01-22 14:35:35.000000000 +0100
-@@ -66,11 +66,12 @@ Boston, MA  02110-1301  USA */
- 
- /* This should always be first.  */
- #ifdef HAVE_CONFIG_H
--#include <config.h>
-+#include "config.h"
- #endif
- 
--#include "lisp.h"
--#include "sysfile.h" /* for encapsulated open, close, read, write */
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <fcntl.h>
- 
- #ifndef HAVE_GETLOADAVG
- 
-diff -rdup at-3.1.10.orig/parsetime.h at-3.1.10/parsetime.h
---- at-3.1.10.orig/parsetime.h	2005-08-05 05:16:01.000000000 +0200
-+++ at-3.1.10/parsetime.h	2007-01-22 14:45:41.000000000 +0100
-@@ -17,6 +17,7 @@
-  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-  */
- 
-+#include "panic.h"
- time_t parsetime(int argc, char **argv);
- 
- extern char *last_token;
-diff -rdup at-3.1.10.orig/parsetime.l at-3.1.10/parsetime.l
---- at-3.1.10.orig/parsetime.l	2007-01-22 14:35:41.000000000 +0100
-+++ at-3.1.10/parsetime.l	2007-01-22 14:35:35.000000000 +0100
-@@ -1,5 +1,6 @@
- %{
- 
-+#include "config.h"
- #include <string.h>
- #include <time.h>
- #include "y.tab.h"
diff --git a/package/at/at.mk b/package/at/at.mk
index 5b53c2c..3eb99a4 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -3,76 +3,39 @@
 # at
 #
 #############################################################
-AT_VERSION:=3.1.10
-AT_SOURCE:=at_$(AT_VERSION).tar.gz
-AT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
-AT_DIR:=$(BUILD_DIR)/at-$(AT_VERSION)
-AT_CAT:=$(ZCAT)
-AT_TARGET_SCRIPT:=etc/init.d/S99at
-AT_BINARY:=at
-
-$(DL_DIR)/$(AT_SOURCE):
-	 $(call DOWNLOAD,$(AT_SITE),$(AT_SOURCE))
-
-at-source: $(DL_DIR)/$(AT_SOURCE)
-
-$(AT_DIR)/.unpacked: $(DL_DIR)/$(AT_SOURCE)
-	$(AT_CAT) $(DL_DIR)/$(AT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(AT_DIR) package/at/ at\*.patch
-	touch $@
-
-$(AT_DIR)/.configured: $(AT_DIR)/.unpacked
-	(cd $(AT_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--with-jobdir=/var/lib/atjobs \
-		--with-atspool=/var/lib/atspool \
-		--with-daemon_username=at \
-		--with-daemon_groupname=at \
-		SENDMAIL=/usr/sbin/sendmail \
-	)
-	touch $@
-
-$(AT_DIR)/$(AT_BINARY): $(AT_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(AT_DIR)
+AT_VERSION = 3.1.12
+AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
+AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
+AT_AUTORECONF = YES
+AT_INSTALL_STAGING = NO
+AT_INSTALL_TARGET = YES
+# no install-strip / install-exec
+AT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+AT_CONF_OPT = \
+        --with-jobdir=/var/spool/cron/atjobs \
+        --with-atspool=/var/spool/cron/atspool \
+        --with-daemon_username=root \
+        --with-daemon_groupname=root \
+	SENDMAIL=/usr/sbin/sendmail
+
+$(eval $(call AUTOTARGETS,package,at))
+
+$(AT_HOOK_POST_INSTALL): $(AT_TARGET_INSTALL_TARGET)
+	$(INSTALL) -m 0755 package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
 	touch $@
 
-$(TARGET_DIR)/$(AT_TARGET_SCRIPT): $(AT_DIR)/$(AT_BINARY)
-	# Use fakeroot to pretend to do 'make install' as root
-	echo '$(MAKE) DAEMON_USERNAME=root DAEMON_GROUPNAME=root ' \
-	 '$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(AT_DIR) install' \
-		> $(BUILD_DIR)/.fakeroot.at
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	echo 'rm -rf $(TARGET_DIR)/usr/man' >> $(BUILD_DIR)/.fakeroot.at
-endif
-	echo 'rm -rf $(TARGET_DIR)/usr/doc/at' >> $(BUILD_DIR)/.fakeroot.at
-	$(INSTALL) -m 0755 -D $(AT_DIR)/debian/rc $(TARGET_DIR)/$(AT_TARGET_SCRIPT)
-
-at: host-fakeroot $(TARGET_DIR)/$(AT_TARGET_SCRIPT)
-
-at-clean:
-	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(AT_DIR) uninstall
-	rm -f $(TARGET_DIR)/$(AT_TARGET_SCRIPT) $(TARGET_DIR)/etc/init.d/S99at
-	-$(MAKE) -C $(AT_DIR) clean
-
-at-dirclean:
-	rm -rf $(AT_DIR)
-
-.PHONY: at
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_AT),y)
-TARGETS+=at
-endif
+$(AT_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -rf $(addprefix $(TARGET_DIR),/usr/lib/atspool \
+					 /usr/lib/atjobs \
+					 /etc/at.deny \
+					 /etc/init.d/S99at \
+					 /usr/bin/at \
+					 /usr/bin/atrm \
+					 /usr/bin/atq \
+					 /usr/sbin/atd \
+					 /usr/sbin/atrun)
+	rm -f $(addprefix $(TARGET_DIR)/usr/man/man*/, \
+		at.1 atq.1 atrm.1 batch.1 at_allow.5 at_deny.5 atd.8 atrun.8)
+	rm -f $(AT_TARGET_INSTALL_TARGET) $(AT_HOOK_POST_INSTALL)
-- 
1.6.3.3
