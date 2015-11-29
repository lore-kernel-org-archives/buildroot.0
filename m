From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 15:25:35 +0100
Subject: [Buildroot] [git commit branch/next] at: bump version to 3.1.16
Message-ID: <20151129142905.54499807F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcf25bffbe9887c6749d41a40637895fbe74f965
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Bump version to 3.1.16
- Update the hash value
- Remove upstreamed patches:
  0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
  0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
- Tweak patches for the new version:
  0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
  0005-Makefile.in-make-install-fix.patch

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...c-remove-manual-compiler-check-with-AC_TR.patch |   33 -----------------
 ...-Makefile.in-add-LDFLAGS-to-linking-stage.patch |   38 -------------------
 ...0004-Makefile.in-replace-IROOT-by-DESTDIR.patch |   39 +++++++++++++-------
 package/at/0005-Makefile.in-make-install-fix.patch |   34 ++++++++++++-----
 package/at/at.hash                                 |    6 +--
 package/at/at.mk                                   |    2 +-
 6 files changed, 52 insertions(+), 100 deletions(-)

diff --git a/package/at/0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch b/package/at/0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
deleted file mode 100644
index 9e69922..0000000
--- a/package/at/0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a182f18fa3b9fb3dd817b601b51c758f9a77f407 Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Tue, 1 Dec 2009 17:08:14 +0100
-Subject: [PATCH 1/5] configure.ac: remove manual compiler check with AC_TRY_RUN
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
--    AC_MSG_ERROR(Could not compile and run even a trivial ANSI C program - check CC.),
--    AC_MSG_ERROR(Could not compile and run even a trivial ANSI C program - check CC.))
- 
- AC_MSG_CHECKING(__attribute__((noreturn)))
- AC_TRY_COMPILE([], [void __attribute__((noreturn)) panic(void);],
--- 
-1.6.5.3
-
diff --git a/package/at/0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch b/package/at/0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
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
diff --git a/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
index 0d1d5f6..856b6c8 100644
--- a/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
+++ b/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
@@ -6,27 +6,30 @@ Subject: [PATCH 5/5] Makefile.in: replace IROOT by DESTDIR
 This patch replaces IROOT by DESTDIR, which is the autotools standard
 variable. For backwards compatibilty IROOT overwrites the DESTDIR.
 
+[Vincent: tweak the patch for the new version]
+
 Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 ---
- Makefile.in |   64 +++++++++++++++++++++++++++++++-----------------------------
- 1 file changed, 34 insertions(+), 30 deletions(-)
+ Makefile.in | 68 ++++++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 36 insertions(+), 32 deletions(-)
 
-Index: at-3.1.13/Makefile.in
-===================================================================
---- at-3.1.13.orig/Makefile.in
-+++ at-3.1.13/Makefile.in
-@@ -16,6 +16,10 @@ docdir		= $(prefix)/doc
- atdocdir	= $(docdir)/at
+diff --git a/Makefile.in b/Makefile.in
+index 06544f9..1f699d9 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -17,6 +17,10 @@ atdocdir	= $(docdir)/at
  etcdir		= @ETCDIR@
+ systemdsystemunitdir = @systemdsystemunitdir@
  
 +ifdef IROOT
-+DESTDIR		= $(IROOT)
++DESTDIR		= $(DESTDIR)
 +endif
 +
  DAEMON_USERNAME	= @DAEMON_USERNAME@
  DAEMON_GROUPNAME= @DAEMON_GROUPNAME@
  LOADAVG_MX	= @LOADAVG_MX@
-@@ -86,38 +90,38 @@ atrun: atrun.in
+@@ -91,41 +95,41 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
  install: all
@@ -63,15 +66,15 @@ Index: at-3.1.13/Makefile.in
 +	touch $(DESTDIR)$(LFILE)
 +	chmod 600 $(DESTDIR)$(LFILE)
 +	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
-+	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR$
-+	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at $(DESTDIR)$(bindir)
++	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR)$(etcdir)/
++	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(DESTDIR)$(bindir)
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
 +	cd $(DESTDIR)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
@@ -92,6 +95,14 @@ Index: at-3.1.13/Makefile.in
 +	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
 +		$(DESTDIR)$(mandir)/cat1/atq.1*
 +	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
+ 	if test x"$(systemdsystemunitdir)" != xno; then \
+-		$(INSTALL) -o root -g root -m 755 -d $(IROOT)$(systemdsystemunitdir); \
+-		$(INSTALL) -o root -g root -m 644 atd.service $(IROOT)$(systemdsystemunitdir); \
++		$(INSTALL) -o root -g root -m 755 -d $(DESTDIR)$(systemdsystemunitdir); \
++		$(INSTALL) -o root -g root -m 644 atd.service $(DESTDIR)$(systemdsystemunitdir); \
+ 	fi
  
  dist: checkin $(DIST) $(LIST) Filelist.asc
- 	(cd ..; tar cf - `for a in $(DIST) $(LIST); do echo at-$(VERSION)/$$a; done` |\
+-- 
+2.4.10
+
diff --git a/package/at/0005-Makefile.in-make-install-fix.patch b/package/at/0005-Makefile.in-make-install-fix.patch
index ad84344..831ea1a 100644
--- a/package/at/0005-Makefile.in-make-install-fix.patch
+++ b/package/at/0005-Makefile.in-make-install-fix.patch
@@ -3,16 +3,19 @@
 Buildroot will ensure all files are owned by root and stripped anyway
 (if needed) before the rootfs is created.
 
+[Vincent: tweak the patch for the new version]
+
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 ---
- Makefile.in |   39 +++++++++++++++++++--------------------
- 1 file changed, 19 insertions(+), 20 deletions(-)
+ Makefile.in | 43 +++++++++++++++++++++----------------------
+ 1 file changed, 21 insertions(+), 22 deletions(-)
 
-Index: at-3.1.13/Makefile.in
-===================================================================
---- at-3.1.13.orig/Makefile.in
-+++ at-3.1.13/Makefile.in
-@@ -90,35 +90,34 @@ atrun: atrun.in
+diff --git a/Makefile.in b/Makefile.in
+index 1f699d9..f313f9b 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -95,41 +95,40 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
  install: all
@@ -32,8 +35,8 @@ Index: at-3.1.13/Makefile.in
  	touch $(DESTDIR)$(LFILE)
  	chmod 600 $(DESTDIR)$(LFILE)
 -	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
--	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR$
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at $(DESTDIR)$(bindir)
+-	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR)$(etcdir)/
+-	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(DESTDIR)$(bindir)
 +	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -m 640 at.deny $(DESTDIR)$(etcdir)/
 +	$(INSTALL) -m 6755 at $(DESTDIR)$(bindir)
  	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
@@ -42,7 +45,7 @@ Index: at-3.1.13/Makefile.in
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
--	$(INSTALL) -g root -o root -m 755 -s atd $(DESTDIR)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 atd $(DESTDIR)$(sbindir)
 -	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
 -	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
 +	$(INSTALL) -m 755 batch $(DESTDIR)$(bindir)
@@ -67,3 +70,14 @@ Index: at-3.1.13/Makefile.in
  	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
  		$(DESTDIR)$(mandir)/cat1/atq.1*
  	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
+ 	if test x"$(systemdsystemunitdir)" != xno; then \
+-		$(INSTALL) -o root -g root -m 755 -d $(DESTDIR)$(systemdsystemunitdir); \
+-		$(INSTALL) -o root -g root -m 644 atd.service $(DESTDIR)$(systemdsystemunitdir); \
++		$(INSTALL) -m 755 -d $(DESTDIR)$(systemdsystemunitdir); \
++		$(INSTALL) -m 644 atd.service $(DESTDIR)$(systemdsystemunitdir); \
+ 	fi
+ 
+ dist: checkin $(DIST) $(LIST) Filelist.asc
+-- 
+2.4.10
+
diff --git a/package/at/at.hash b/package/at/at.hash
index 481c937..22c732c 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,4 +1,2 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.13-2%2Bdeb7u1.dsc
-sha1	9873e0c38403ef58364912d0b505fd20798fd400  at_3.1.13.orig.tar.gz
-sha256	3a8b90868d615d21a92f4986ea9a823886329af8fae8dd7ab4eed9b273bca072  at_3.1.13.orig.tar.gz
-md5	1da61af6c29e323abaaf13ee1a8dad79  at_3.1.13.orig.tar.gz
+# From: http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.16-1.dsc
+sha256 cb9af59c6a54edce9536ba629841055409d1f89d8ae26494727a97141fb4d5c1  at_3.1.16.orig.tar.gz
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
 AT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at
 # missing deps for parsetime.l
