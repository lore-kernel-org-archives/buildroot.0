From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Date: Mon, 07 Sep 2015 15:05:14 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/at: updated version from 3.1.13
	to 3.1.16
Message-ID: <11269096.cxoRZRC0e7@deathstar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to acheive this, several adjustments were made (as follows):

* removed old patches from v3.1.13
* added reworked "Makefile.in-replace-IROOT-by-DESTDIR" patch
* added reworked "Makefile.in: fix make install for non-root, don't strip"
patch
* added previous patches from v3.1.13 and left out obsolete patches


Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
---
 ...001-Makefile.in-replace-IROOT-by-DESTDIR.patch} | 48 +++++++++++-------
 ...c-remove-manual-compiler-check-with-AC_TR.patch | 33 ------------
 ...fix-make-install-for-non-root-don-t-stri.patch} | 42 ++++++++++-----
 ...c-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch | 34 -------------
 ...-Makefile.in-add-LDFLAGS-to-linking-stage.patch | 38 --------------
 ...avg.c-fix.patch => 0003-getloadavg.c-fix.patch} |  0
 ...tch => 0004-parsetime.l-include-config-h.patch} |  0
 .../at/0008-remove-glibc-__isleap-assumption.patch | 59 
----------------------
 package/at/at.hash                                 |  9 ++--
 package/at/at.mk                                   |  2 +-
 10 files changed, 66 insertions(+), 199 deletions(-)
 rename package/at/{0004-Makefile.in-replace-IROOT-by-DESTDIR.patch => 0001-
Makefile.in-replace-IROOT-by-DESTDIR.patch} (76%)
 delete mode 100644 package/at/0001-configure.ac-remove-manual-compiler-check-
with-AC_TR.patch
 rename package/at/{0005-Makefile.in-make-install-fix.patch => 0002-Makefile.in-
fix-make-install-for-non-root-don-t-stri.patch} (71%)
 delete mode 100644 package/at/0002-configure.ac-convert-AC_TRY_COMPILE-
AC_COMPILE_IFELS.patch
 delete mode 100644 package/at/0003-Makefile.in-add-LDFLAGS-to-linking-
stage.patch
 rename package/at/{0006-getloadavg.c-fix.patch => 0003-getloadavg.c-fix.patch} 
(100%)
 rename package/at/{0007-parsetime.l-include-config-h.patch => 0004-
parsetime.l-include-config-h.patch} (100%)
 delete mode 100644 package/at/0008-remove-glibc-__isleap-assumption.patch

diff --git a/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch 
b/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
similarity index 76%
rename from package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
rename to package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
index 0d1d5f6..90c0f17 100644
--- a/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
+++ b/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
@@ -1,23 +1,27 @@
-From 195d30e2e01fe2f91ed3bdaeec3982aa66b309dd Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Tue, 1 Dec 2009 20:57:45 +0100
-Subject: [PATCH 5/5] Makefile.in: replace IROOT by DESTDIR
+From de18666063c1c7dbd9795078375f54fe5238b2ff Mon Sep 17 00:00:00 2001
+From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
+Date: Fri, 4 Sep 2015 19:15:19 +0200
+Subject: [PATCH 1/1] Makefile.in: replace IROOT by DESTDIR
 
 This patch replaces IROOT by DESTDIR, which is the autotools standard
 variable. For backwards compatibilty IROOT overwrites the DESTDIR.
 
 Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+
+Adjusted patch to v3.1.16
+
+Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
 ---
- Makefile.in |   64 
+++++++++++++++++++++++++++++++-----------------------------
- 1 file changed, 34 insertions(+), 30 deletions(-)
+ Makefile.in | 68 
++++++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 36 insertions(+), 32 deletions(-)
 
-Index: at-3.1.13/Makefile.in
-
===================================================================
---- at-3.1.13.orig/Makefile.in
-+++ at-3.1.13/Makefile.in
-@@ -16,6 +16,10 @@ docdir		= $(prefix)/doc
- atdocdir	= $(docdir)/at
+diff --git a/Makefile.in b/Makefile.in
+index 5dd2767..4297f87 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -17,6 +17,10 @@ atdocdir	= $(docdir)/at
  etcdir		= @ETCDIR@
+ systemdsystemunitdir = @systemdsystemunitdir@
  
 +ifdef IROOT
 +DESTDIR		= $(IROOT)
@@ -26,7 +30,7 @@ Index: at-3.1.13/Makefile.in
  DAEMON_USERNAME	= @DAEMON_USERNAME@
  DAEMON_GROUPNAME= @DAEMON_GROUPNAME@
  LOADAVG_MX	= @LOADAVG_MX@
-@@ -86,38 +90,38 @@ atrun: atrun.in
+@@ -91,41 +95,41 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
  install: all
@@ -58,20 +62,20 @@ Index: at-3.1.13/Makefile.in
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
-+	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d 
$(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
++	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) 
$(DESTDIR)$(ATJOB_DIR)
 +	chmod 1770 $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
 +	touch $(DESTDIR)$(LFILE)
 +	chmod 600 $(DESTDIR)$(LFILE)
 +	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
-+	test -f $(DESTDIR)$(etcdir)/at.allow || test -f 
$(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 
640 at.deny $(DESTDIR$
-+	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at 
$(DESTDIR)$(bindir)
++	test -f $(DESTDIR)$(etcdir)/at.allow || test -f 
$(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 
640 at.deny $(DESTDIR)$(etcdir)/
++	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at 
$(DESTDIR)$(bindir)
 +	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
 +	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
 +	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
 +	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
 +	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
 +	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
-+	$(INSTALL) -g root -o root -m 755 -s atd $(DESTDIR)$(sbindir)
++	$(INSTALL) -g root -o root -m 755 atd $(DESTDIR)$(sbindir)
 +	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
 +	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
 +	cd $(DESTDIR)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 
batch.1 && $(LN_S) -f at.1 atrm.1
@@ -92,6 +96,14 @@ Index: at-3.1.13/Makefile.in
 +	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
 +		$(DESTDIR)$(mandir)/cat1/atq.1*
 +	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
+ 	if test x"$(systemdsystemunitdir)" != xno; then \
+-		$(INSTALL) -o root -g root -m 755 -d 
$(IROOT)$(systemdsystemunitdir); \
+-		$(INSTALL) -o root -g root -m 644 atd.service 
$(IROOT)$(systemdsystemunitdir); \
++		$(INSTALL) -o root -g root -m 755 -d 
$(DESTDIR)$(systemdsystemunitdir); \
++		$(INSTALL) -o root -g root -m 644 atd.service 
$(DESTDIR)$(systemdsystemunitdir); \
+ 	fi
  
  dist: checkin $(DIST) $(LIST) Filelist.asc
- 	(cd ..; tar cf - `for a in $(DIST) $(LIST); do echo at-$(VERSION)/$$a; 
done` |\
+-- 
+2.5.1
+
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
diff --git a/package/at/0005-Makefile.in-make-install-fix.patch 
b/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
similarity index 71%
rename from package/at/0005-Makefile.in-make-install-fix.patch
rename to package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-
stri.patch
index ad84344..1ba68be 100644
--- a/package/at/0005-Makefile.in-make-install-fix.patch
+++ b/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
@@ -1,18 +1,25 @@
-[PATCH]: Makefile.in: fix make install for non-root, don't strip
+From 4d23d04285ac3e9152746fb6f6589de17be7057a Mon Sep 17 00:00:00 2001
+From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
+Date: Fri, 4 Sep 2015 19:23:15 +0200
+Subject: [PATCH 2/2] Makefile.in: fix make install for non-root, don't strip
 
 Buildroot will ensure all files are owned by root and stripped anyway
 (if needed) before the rootfs is created.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+
+Adjusted patch to v3.1.16
+
+Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
 ---
- Makefile.in |   39 +++++++++++++++++++--------------------
- 1 file changed, 19 insertions(+), 20 deletions(-)
+ Makefile.in | 43 +++++++++++++++++++++----------------------
+ 1 file changed, 21 insertions(+), 22 deletions(-)
 
-Index: at-3.1.13/Makefile.in
-
===================================================================
---- at-3.1.13.orig/Makefile.in
-+++ at-3.1.13/Makefile.in
-@@ -90,35 +90,34 @@ atrun: atrun.in
+diff --git a/Makefile.in b/Makefile.in
+index 4297f87..5d82f18 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -95,41 +95,40 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
  install: all
@@ -21,7 +28,7 @@ Index: at-3.1.13/Makefile.in
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d 
$(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) 
$(DESTDIR)$(ATJOB_DIR)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(etcdir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(bindir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(sbindir)
@@ -32,8 +39,8 @@ Index: at-3.1.13/Makefile.in
  	touch $(DESTDIR)$(LFILE)
  	chmod 600 $(DESTDIR)$(LFILE)
 -	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
--	test -f $(DESTDIR)$(etcdir)/at.allow || test -f 
$(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 
640 at.deny $(DESTDIR$
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at 
$(DESTDIR)$(bindir)
+-	test -f $(DESTDIR)$(etcdir)/at.allow || test -f 
$(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 
640 at.deny $(DESTDIR)$(etcdir)/
+-	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at 
$(DESTDIR)$(bindir)
 +	test -f $(DESTDIR)$(etcdir)/at.allow || test -f 
$(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -m 640 at.deny $(DESTDIR)$(etcdir)/
 +	$(INSTALL) -m 6755 at $(DESTDIR)$(bindir)
  	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
@@ -42,7 +49,7 @@ Index: at-3.1.13/Makefile.in
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
--	$(INSTALL) -g root -o root -m 755 -s atd $(DESTDIR)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 atd $(DESTDIR)$(sbindir)
 -	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
 -	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
 +	$(INSTALL) -m 755 batch $(DESTDIR)$(bindir)
@@ -67,3 +74,14 @@ Index: at-3.1.13/Makefile.in
  	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
  		$(DESTDIR)$(mandir)/cat1/atq.1*
  	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
+ 	if test x"$(systemdsystemunitdir)" != xno; then \
+-		$(INSTALL) -o root -g root -m 755 -d 
$(DESTDIR)$(systemdsystemunitdir); \
+-		$(INSTALL) -o root -g root -m 644 atd.service 
$(DESTDIR)$(systemdsystemunitdir); \
++		$(INSTALL) -m 755 -d $(DESTDIR)$(systemdsystemunitdir); \
++		$(INSTALL) -m 644 atd.service $(DESTDIR)$(systemdsystemunitdir); \
+ 	fi
+ 
+ dist: checkin $(DIST) $(LIST) Filelist.asc
+-- 
+2.5.1
+
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
diff --git a/package/at/0006-getloadavg.c-fix.patch b/package/at/0003-
getloadavg.c-fix.patch
similarity index 100%
rename from package/at/0006-getloadavg.c-fix.patch
rename to package/at/0003-getloadavg.c-fix.patch
diff --git a/package/at/0007-parsetime.l-include-config-h.patch 
b/package/at/0004-parsetime.l-include-config-h.patch
similarity index 100%
rename from package/at/0007-parsetime.l-include-config-h.patch
rename to package/at/0004-parsetime.l-include-config-h.patch
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
diff --git a/package/at/at.hash b/package/at/at.hash
index 481c937..86f523b 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,4 +1,5 @@
-# From 
http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.13-2%2Bdeb7u1.dsc
-sha1	9873e0c38403ef58364912d0b505fd20798fd400  at_3.1.13.orig.tar.gz
-sha256	3a8b90868d615d21a92f4986ea9a823886329af8fae8dd7ab4eed9b273bca072  
at_3.1.13.orig.tar.gz
-md5	1da61af6c29e323abaaf13ee1a8dad79  at_3.1.13.orig.tar.gz
+# From 
http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.16-1.dsc
+
+sha1    5ad64a471d0ed9985541e918e096f69dc2963cf0 123174 at_3.1.16.orig.tar.gz
+sha256  cb9af59c6a54edce9536ba629841055409d1f89d8ae26494727a97141fb4d5c1 
at_3.1.16.orig.tar.gz
+md5 d05da75d9b75d93917ffb16ab48b1e19 at_3.1.16.orig.tar.gz
diff --git a/package/at/at.mk b/package/at/at.mk
index 1504e32..8865360 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AT_VERSION = 3.1.13
+AT_VERSION = 3.1.16
 AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
 AT_SITE = 
http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at
 # missing deps for parsetime.l
-- 
2.5.1
