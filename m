From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Date: Mon, 07 Sep 2015 10:35:02 +0200
Subject: [Buildroot] [PATCH 2/5] package/at: removed old patches
Message-ID: <12223428.AUK7i8NUDW@deathstar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
---
 ...c-remove-manual-compiler-check-with-AC_TR.patch | 33 --------
 ...c-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch | 34 --------
 ...-Makefile.in-add-LDFLAGS-to-linking-stage.patch | 38 ---------
 ...0004-Makefile.in-replace-IROOT-by-DESTDIR.patch | 97 ----------------------
 package/at/0005-Makefile.in-make-install-fix.patch | 69 ---------------
 package/at/0006-getloadavg.c-fix.patch             | 30 -------
 package/at/0007-parsetime.l-include-config-h.patch | 16 ----
 .../at/0008-remove-glibc-__isleap-assumption.patch | 59 -------------
 8 files changed, 376 deletions(-)
 delete mode 100644 package/at/0001-configure.ac-remove-manual-compiler-check-
with-AC_TR.patch
 delete mode 100644 package/at/0002-configure.ac-convert-AC_TRY_COMPILE-
AC_COMPILE_IFELS.patch
 delete mode 100644 package/at/0003-Makefile.in-add-LDFLAGS-to-linking-
stage.patch
 delete mode 100644 package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
 delete mode 100644 package/at/0005-Makefile.in-make-install-fix.patch
 delete mode 100644 package/at/0006-getloadavg.c-fix.patch
 delete mode 100644 package/at/0007-parsetime.l-include-config-h.patch
 delete mode 100644 package/at/0008-remove-glibc-__isleap-assumption.patch

diff --git a/package/at/0001-configure.ac-remove-manual-compiler-check-with-
AC_TR.patch b/package/at/0001-configure.ac-remove-manual-compiler-check-with-
AC_TR.patch
deleted file mode 100644
index 9e69922..0000000
--- a/package/at/0001-configure.ac-remove-manual-compiler-check-with-
AC_TR.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a182f18fa3b9fb3dd817b601b51c758f9a77f407 Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Tue, 1 Dec 2009 17:08:14 +0100
-Subject: [PATCH 1/5] configure.ac: remove manual compiler check with 
AC_TRY_RUN
-
-AC_TRY_RUN breaks cross compilation, so remove it. autotools will take
-care about a working (cross-) compiler.
-
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
----
- configure.ac |    6 ------
- 1 files changed, 0 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a8c2a14..997a37f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -38,12 +38,6 @@ case "$host" in
-     AC_MSG_RESULT(no)
-     ;;
- esac
--AC_MSG_CHECKING(Trying to compile a trivial ANSI C program)
--AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
--    AC_MSG_RESULT(yes),
--    AC_MSG_RESULT(no)
--    AC_MSG_ERROR(Could not compile and run even a trivial ANSI C program - 
check CC.),
--    AC_MSG_ERROR(Could not compile and run even a trivial ANSI C program - 
check CC.))
- 
- AC_MSG_CHECKING(__attribute__((noreturn)))
- AC_TRY_COMPILE([], [void __attribute__((noreturn)) panic(void);],
--- 
-1.6.5.3
-
diff --git a/package/at/0002-configure.ac-convert-AC_TRY_COMPILE-
AC_COMPILE_IFELS.patch b/package/at/0002-configure.ac-convert-AC_TRY_COMPILE-
AC_COMPILE_IFELS.patch
deleted file mode 100644
index e4276ac..0000000
--- a/package/at/0002-configure.ac-convert-AC_TRY_COMPILE-
AC_COMPILE_IFELS.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e12c96cccab550eda31cf7bb1dedddd3670ffe69 Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Tue, 1 Dec 2009 17:22:22 +0100
-Subject: [PATCH 2/5] configure.ac: convert AC_TRY_COMPILE -> AC_COMPILE_IFELSE
-
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
----
- configure.ac |   10 +++++-----
- 1 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 997a37f..cab80ed 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -40,11 +40,11 @@ case "$host" in
- esac
- 
- AC_MSG_CHECKING(__attribute__((noreturn)))
--AC_TRY_COMPILE([], [void __attribute__((noreturn)) panic(void);],
--    AC_MSG_RESULT(yes)
--    AC_DEFINE(HAVE_ATTRIBUTE_NORETURN, 1,
--              [Define to 1 if compiler supports __attribute__((noreturn))]),
--    AC_MSG_RESULT(no)
-+AC_COMPILE_IFELSE(
-+       [AC_LANG_PROGRAM([[]], [[void __attribute__((noreturn)) 
panic(void);]])],
-+       [AC_MSG_RESULT(yes)
-+        AC_DEFINE(HAVE_ATTRIBUTE_NORETURN, 1, Define to 1 if compiler 
supports __attribute__((noreturn)))],
-+       [AC_MSG_RESULT(no)]
- )
- dnl Checks for libraries.
- 
--- 
-1.6.5.3
-
diff --git a/package/at/0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch 
b/package/at/0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
deleted file mode 100644
index e1ab3d3..0000000
--- a/package/at/0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 8720a71757f3626bf3bbc3a7aa2185e6387e5689 Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Tue, 1 Dec 2009 20:37:31 +0100
-Subject: [PATCH 3/5] Makefile.in: add LDFLAGS to linking stage
-
-The linking stage ignores the LDFLAGS, this breaks if the flex library
-lives in a non standard location.
-
-This patch add LDFLAGS to both "at" and "atd" linking stage.
-
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
----
- Makefile.in |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index dae6b7d..b766bbb 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -65,13 +65,13 @@ LIST = Filelist Filelist.asc
- all: at atd atrun
- 
- at: $(ATOBJECTS)
--	$(CC) $(CFLAGS) -o at $(ATOBJECTS) $(LIBS) $(LEXLIB)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o at $(ATOBJECTS) $(LIBS) $(LEXLIB)
- 	rm -f $(CLONES)
- 	$(LN_S) -f at atq
- 	$(LN_S) -f at atrm
- 
- atd: $(RUNOBJECTS)
--	$(CC) $(CFLAGS) -o atd $(RUNOBJECTS) $(LIBS) $(PAMLIB)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o atd $(RUNOBJECTS) $(LIBS) $(PAMLIB)
- 
- y.tab.c y.tab.h: parsetime.y
- 	$(YACC) -d parsetime.y
--- 
-1.6.5.3
-
diff --git a/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch 
b/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
deleted file mode 100644
index 0d1d5f6..0000000
--- a/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 195d30e2e01fe2f91ed3bdaeec3982aa66b309dd Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Tue, 1 Dec 2009 20:57:45 +0100
-Subject: [PATCH 5/5] Makefile.in: replace IROOT by DESTDIR
-
-This patch replaces IROOT by DESTDIR, which is the autotools standard
-variable. For backwards compatibilty IROOT overwrites the DESTDIR.
-
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
----
- Makefile.in |   64 
+++++++++++++++++++++++++++++++-----------------------------
- 1 file changed, 34 insertions(+), 30 deletions(-)
-
-Index: at-3.1.13/Makefile.in
-
===================================================================
---- at-3.1.13.orig/Makefile.in
-+++ at-3.1.13/Makefile.in
-@@ -16,6 +16,10 @@ docdir		= $(prefix)/doc
- atdocdir	= $(docdir)/at
- etcdir		= @ETCDIR@
- 
-+ifdef IROOT
-+DESTDIR		= $(IROOT)
-+endif
-+
- DAEMON_USERNAME	= @DAEMON_USERNAME@
- DAEMON_GROUPNAME= @DAEMON_GROUPNAME@
- LOADAVG_MX	= @LOADAVG_MX@
-@@ -86,38 +90,38 @@ atrun: atrun.in
- 	$(CC) -c $(CFLAGS) $(DEFS) $*.c
- 
- install: all
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(etcdir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(bindir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(sbindir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(docdir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(atdocdir)
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d 
$(IROOT)$(ATSPOOL_DIR) $(IROOT)$(ATJOB_DIR)
--	chmod 1770 $(IROOT)$(ATSPOOL_DIR) $(IROOT)$(ATJOB_DIR)
--	touch $(IROOT)$(LFILE)
--	chmod 600 $(IROOT)$(LFILE)
--	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(IROOT)$(LFILE)
--	test -f $(IROOT)$(etcdir)/at.allow || test -f $(IROOT)$(etcdir)/at.deny 
|| $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(IROOT)$(etcdir)/
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at 
$(IROOT)$(bindir)
--	$(LN_S) -f at $(IROOT)$(bindir)/atq
--	$(LN_S) -f at $(IROOT)$(bindir)/atrm
--	$(INSTALL) -g root -o root -m 755 batch $(IROOT)$(bindir)
--	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man1dir)
--	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man5dir)
--	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man8dir)
--	$(INSTALL) -g root -o root -m 755 atd $(IROOT)$(sbindir)
--	$(INSTALL) -g root -o root -m 755 atrun $(IROOT)$(sbindir)
--	$(INSTALL) -g root -o root -m 644 at.1 $(IROOT)$(man1dir)/
--	cd $(IROOT)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 
batch.1 && $(LN_S) -f at.1 atrm.1
--	$(INSTALL) -g root -o root -m 644 atd.8 $(IROOT)$(man8dir)/
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
-+	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d 
$(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
-+	chmod 1770 $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
-+	touch $(DESTDIR)$(LFILE)
-+	chmod 600 $(DESTDIR)$(LFILE)
-+	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
-+	test -f $(DESTDIR)$(etcdir)/at.allow || test -f 
$(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 
640 at.deny $(DESTDIR$
-+	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at 
$(DESTDIR)$(bindir)
-+	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
-+	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
-+	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
-+	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
-+	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
-+	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
-+	$(INSTALL) -g root -o root -m 755 -s atd $(DESTDIR)$(sbindir)
-+	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
-+	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
-+	cd $(DESTDIR)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 
batch.1 && $(LN_S) -f at.1 atrm.1
-+	$(INSTALL) -g root -o root -m 644 atd.8 $(DESTDIR)$(man8dir)/
- 	sed "s,\$${exec_prefix},$(exec_prefix),g" <atrun.8>tmpman
--	$(INSTALL) -g root -o root -m 644 tmpman $(IROOT)$(man8dir)/atrun.8
-+	$(INSTALL) -g root -o root -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
- 	rm -f tmpman
--	$(INSTALL) -g root -o root -m 644 at.allow.5 $(IROOT)$(man5dir)/
--	cd $(IROOT)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
--	$(INSTALL) -g root -o root -m 644 $(DOCS) $(IROOT)$(atdocdir)
--	rm -f $(IROOT)$(mandir)/cat1/at.1* $(IROOT)$(mandir)/cat1/batch.1* \
--		$(IROOT)$(mandir)/cat1/atq.1*
--	rm -f $(IROOT)$(mandir)/cat1/atd.8*
-+	$(INSTALL) -g root -o root -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
-+	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
-+	$(INSTALL) -g root -o root -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
-+	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
-+		$(DESTDIR)$(mandir)/cat1/atq.1*
-+	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
- 
- dist: checkin $(DIST) $(LIST) Filelist.asc
- 	(cd ..; tar cf - `for a in $(DIST) $(LIST); do echo at-$(VERSION)/$$a; 
done` |\
diff --git a/package/at/0005-Makefile.in-make-install-fix.patch 
b/package/at/0005-Makefile.in-make-install-fix.patch
deleted file mode 100644
index ad84344..0000000
--- a/package/at/0005-Makefile.in-make-install-fix.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-[PATCH]: Makefile.in: fix make install for non-root, don't strip
-
-Buildroot will ensure all files are owned by root and stripped anyway
-(if needed) before the rootfs is created.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- Makefile.in |   39 +++++++++++++++++++--------------------
- 1 file changed, 19 insertions(+), 20 deletions(-)
-
-Index: at-3.1.13/Makefile.in
-
===================================================================
---- at-3.1.13.orig/Makefile.in
-+++ at-3.1.13/Makefile.in
-@@ -90,35 +90,34 @@ atrun: atrun.in
- 	$(CC) -c $(CFLAGS) $(DEFS) $*.c
- 
- install: all
--	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
--	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
--	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
--	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
--	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d 
$(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
-+	$(INSTALL) -m 755 -d $(DESTDIR)$(etcdir)
-+	$(INSTALL) -m 755 -d $(DESTDIR)$(bindir)
-+	$(INSTALL) -m 755 -d $(DESTDIR)$(sbindir)
-+	$(INSTALL) -m 755 -d $(DESTDIR)$(docdir)
-+	$(INSTALL) -m 755 -d $(DESTDIR)$(atdocdir)
-+	$(INSTALL) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
- 	chmod 1770 $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
- 	touch $(DESTDIR)$(LFILE)
- 	chmod 600 $(DESTDIR)$(LFILE)
--	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
--	test -f $(DESTDIR)$(etcdir)/at.allow || test -f 
$(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 
640 at.deny $(DESTDIR$
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at 
$(DESTDIR)$(bindir)
-+	test -f $(DESTDIR)$(etcdir)/at.allow || test -f 
$(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -m 640 at.deny $(DESTDIR)$(etcdir)/
-+	$(INSTALL) -m 6755 at $(DESTDIR)$(bindir)
- 	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
- 	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
--	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
--	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
--	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
--	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
--	$(INSTALL) -g root -o root -m 755 -s atd $(DESTDIR)$(sbindir)
--	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
--	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
-+	$(INSTALL) -m 755 batch $(DESTDIR)$(bindir)
-+	$(INSTALL) -d -m 755 $(DESTDIR)$(man1dir)
-+	$(INSTALL) -d -m 755 $(DESTDIR)$(man5dir)
-+	$(INSTALL) -d -m 755 $(DESTDIR)$(man8dir)
-+	$(INSTALL) -m 755 atd $(DESTDIR)$(sbindir)
-+	$(INSTALL) -m 755 atrun $(DESTDIR)$(sbindir)
-+	$(INSTALL) -m 644 at.1 $(DESTDIR)$(man1dir)/
- 	cd $(DESTDIR)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 
batch.1 && $(LN_S) -f at.1 atrm.1
--	$(INSTALL) -g root -o root -m 644 atd.8 $(DESTDIR)$(man8dir)/
-+	$(INSTALL) -m 644 atd.8 $(DESTDIR)$(man8dir)/
- 	sed "s,\$${exec_prefix},$(exec_prefix),g" <atrun.8>tmpman
--	$(INSTALL) -g root -o root -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
-+	$(INSTALL) -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
- 	rm -f tmpman
--	$(INSTALL) -g root -o root -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
-+	$(INSTALL) -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
- 	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
--	$(INSTALL) -g root -o root -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
-+	$(INSTALL) -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
- 	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
- 		$(DESTDIR)$(mandir)/cat1/atq.1*
- 	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
diff --git a/package/at/0006-getloadavg.c-fix.patch b/package/at/0006-
getloadavg.c-fix.patch
deleted file mode 100644
index e073927..0000000
--- a/package/at/0006-getloadavg.c-fix.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-[PATCH]: fix getloadavg.c compilation, revert to 3.1.10 version
-
-getloadavg.c shipped with 3.1.13 doesn't compile because it references
-headers not shipped. Fix it by simply reverting to the 3.1.10 version.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- getloadavg.c |    7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-Index: at-3.1.13/getloadavg.c
-
===================================================================
---- at-3.1.13.orig/getloadavg.c
-+++ at-3.1.13/getloadavg.c
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
diff --git a/package/at/0007-parsetime.l-include-config-h.patch 
b/package/at/0007-parsetime.l-include-config-h.patch
deleted file mode 100644
index f4111eb..0000000
--- a/package/at/0007-parsetime.l-include-config-h.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Make sure to include config.h so that NEEDS_* macros are properly
-taken into account. This was a problem for NEEDS_YYWRAP, which was set
-to 1 in config.h, but the corresponding code wasn't compiled in.
-
-Index: at-3.1.13/parsetime.l
-
===================================================================
---- at-3.1.13.orig/parsetime.l
-+++ at-3.1.13/parsetime.l
-@@ -4,6 +4,7 @@
- #include <time.h>
- #include "y.tab.h"
- #include "parsetime.h"
-+#include "config.h"
- 
- char *last_token = NULL;
- char **my_argv;
diff --git a/package/at/0008-remove-glibc-__isleap-assumption.patch 
b/package/at/0008-remove-glibc-__isleap-assumption.patch
deleted file mode 100644
index 2152249..0000000
--- a/package/at/0008-remove-glibc-__isleap-assumption.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 7f811d9c4ebc9444e613e251c31d6bf537a24dc1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 16:35:30 -0700
-Subject: [PATCH] remove glibc assumption
-
-glibc time.h header has an undocumented __isleap macro
-that we are using anf musl is missing it.
-Since it is undocumented & does not appear
-on any other libc, stop using it and just define the macro in
-locally  instead.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[patch from: http://patchwork.openembedded.org/patch/91893/ ]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
- parsetime.y | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/parsetime.y b/parsetime.y
-index 7005e88..324e6d3 100644
---- a/parsetime.y
-+++ b/parsetime.y
-@@ -8,6 +8,9 @@
- 
- #define YYDEBUG 1
- 
-+#define is_leap_year(y) \
-+    ((y) % 4 == 0 && ((y) % 100 != 0 || (y) % 400 == 0))
-+
- struct tm exectm;
- static int isgmt;
- static int yearspec;
-@@ -217,8 +220,8 @@ date            : month_name day_number
- 				 mnum == 12) && dnum > 31)
- 			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
- 			         mnum == 11) && dnum > 30)
--			    || (mnum ==  2 && dnum > 29 &&  __isleap(ynum+1900))
--			    || (mnum ==  2 && dnum > 28 && !__isleap(ynum+1900))
-+			    || (mnum ==  2 && dnum > 29 &&  is_leap_year(ynum+1900))
-+			    || (mnum ==  2 && dnum > 28 && !is_leap_year(ynum+1900))
- 			   )
- 			{
- 			    yyerror("Error in day of month");
-@@ -261,8 +264,8 @@ date            : month_name day_number
- 				 mnum == 12) && dnum > 31)
- 			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
- 			         mnum == 11) && dnum > 30)
--			    || (mnum ==  2 && dnum > 29 &&  __isleap(ynum+1900))
--			    || (mnum ==  2 && dnum > 28 && !__isleap(ynum+1900))
-+			    || (mnum ==  2 && dnum > 29 &&  is_leap_year(ynum+1900))
-+			    || (mnum ==  2 && dnum > 28 && !is_leap_year(ynum+1900))
- 			   )
- 			{
- 			    yyerror("Error in day of month");
--- 
-2.1.4
-- 
2.5.1
