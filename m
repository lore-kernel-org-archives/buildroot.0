From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 25 Nov 2015 13:36:15 +0000
Subject: [Buildroot] [PATCH next 2/2] at: rename patches so they are in a
	consecutive order
In-Reply-To: <1448458575-60714-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448458575-60714-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1448458575-60714-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...c-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch |  34 +++++++
 ...0002-Makefile.in-replace-IROOT-by-DESTDIR.patch | 108 +++++++++++++++++++++
 ...c-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch |  34 -------
 package/at/0003-Makefile.in-make-install-fix.patch |  83 ++++++++++++++++
 ...0004-Makefile.in-replace-IROOT-by-DESTDIR.patch | 108 ---------------------
 package/at/0004-getloadavg.c-fix.patch             |  30 ++++++
 package/at/0005-Makefile.in-make-install-fix.patch |  83 ----------------
 package/at/0005-parsetime.l-include-config-h.patch |  16 +++
 package/at/0006-getloadavg.c-fix.patch             |  30 ------
 .../at/0006-remove-glibc-__isleap-assumption.patch |  59 +++++++++++
 package/at/0007-parsetime.l-include-config-h.patch |  16 ---
 .../at/0008-remove-glibc-__isleap-assumption.patch |  59 -----------
 12 files changed, 330 insertions(+), 330 deletions(-)
 create mode 100644 package/at/0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
 create mode 100644 package/at/0002-Makefile.in-replace-IROOT-by-DESTDIR.patch
 delete mode 100644 package/at/0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
 create mode 100644 package/at/0003-Makefile.in-make-install-fix.patch
 delete mode 100644 package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
 create mode 100644 package/at/0004-getloadavg.c-fix.patch
 delete mode 100644 package/at/0005-Makefile.in-make-install-fix.patch
 create mode 100644 package/at/0005-parsetime.l-include-config-h.patch
 delete mode 100644 package/at/0006-getloadavg.c-fix.patch
 create mode 100644 package/at/0006-remove-glibc-__isleap-assumption.patch
 delete mode 100644 package/at/0007-parsetime.l-include-config-h.patch
 delete mode 100644 package/at/0008-remove-glibc-__isleap-assumption.patch

diff --git a/package/at/0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch b/package/at/0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
new file mode 100644
index 0000000..e4276ac
--- /dev/null
+++ b/package/at/0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
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
+-              [Define to 1 if compiler supports __attribute__((noreturn))]),
+-    AC_MSG_RESULT(no)
++AC_COMPILE_IFELSE(
++       [AC_LANG_PROGRAM([[]], [[void __attribute__((noreturn)) panic(void);]])],
++       [AC_MSG_RESULT(yes)
++        AC_DEFINE(HAVE_ATTRIBUTE_NORETURN, 1, Define to 1 if compiler supports __attribute__((noreturn)))],
++       [AC_MSG_RESULT(no)]
+ )
+ dnl Checks for libraries.
+ 
+-- 
+1.6.5.3
+
diff --git a/package/at/0002-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/0002-Makefile.in-replace-IROOT-by-DESTDIR.patch
new file mode 100644
index 0000000..856b6c8
--- /dev/null
+++ b/package/at/0002-Makefile.in-replace-IROOT-by-DESTDIR.patch
@@ -0,0 +1,108 @@
+From 195d30e2e01fe2f91ed3bdaeec3982aa66b309dd Mon Sep 17 00:00:00 2001
+From: Marc Kleine-Budde <mkl@pengutronix.de>
+Date: Tue, 1 Dec 2009 20:57:45 +0100
+Subject: [PATCH 5/5] Makefile.in: replace IROOT by DESTDIR
+
+This patch replaces IROOT by DESTDIR, which is the autotools standard
+variable. For backwards compatibilty IROOT overwrites the DESTDIR.
+
+[Vincent: tweak the patch for the new version]
+
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ Makefile.in | 68 ++++++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 36 insertions(+), 32 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 06544f9..1f699d9 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -17,6 +17,10 @@ atdocdir	= $(docdir)/at
+ etcdir		= @ETCDIR@
+ systemdsystemunitdir = @systemdsystemunitdir@
+ 
++ifdef IROOT
++DESTDIR		= $(DESTDIR)
++endif
++
+ DAEMON_USERNAME	= @DAEMON_USERNAME@
+ DAEMON_GROUPNAME= @DAEMON_GROUPNAME@
+ LOADAVG_MX	= @LOADAVG_MX@
+@@ -91,41 +95,41 @@ atrun: atrun.in
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
+-	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(IROOT)$(bindir)
+-	$(LN_S) -f at $(IROOT)$(bindir)/atq
+-	$(LN_S) -f at $(IROOT)$(bindir)/atrm
+-	$(INSTALL) -g root -o root -m 755 batch $(IROOT)$(bindir)
+-	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man1dir)
+-	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man5dir)
+-	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man8dir)
+-	$(INSTALL) -g root -o root -m 755 atd $(IROOT)$(sbindir)
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
++	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(DESTDIR)$(bindir)
++	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
++	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
++	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
++	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
++	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
++	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
++	$(INSTALL) -g root -o root -m 755 atd $(DESTDIR)$(sbindir)
++	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
++	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
++	cd $(DESTDIR)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
++	$(INSTALL) -g root -o root -m 644 atd.8 $(DESTDIR)$(man8dir)/
+ 	sed "s,\$${exec_prefix},$(exec_prefix),g" <atrun.8>tmpman
+-	$(INSTALL) -g root -o root -m 644 tmpman $(IROOT)$(man8dir)/atrun.8
++	$(INSTALL) -g root -o root -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
+ 	rm -f tmpman
+-	$(INSTALL) -g root -o root -m 644 at.allow.5 $(IROOT)$(man5dir)/
+-	cd $(IROOT)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
+-	$(INSTALL) -g root -o root -m 644 $(DOCS) $(IROOT)$(atdocdir)
+-	rm -f $(IROOT)$(mandir)/cat1/at.1* $(IROOT)$(mandir)/cat1/batch.1* \
+-		$(IROOT)$(mandir)/cat1/atq.1*
+-	rm -f $(IROOT)$(mandir)/cat1/atd.8*
++	$(INSTALL) -g root -o root -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
++	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
++	$(INSTALL) -g root -o root -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
++	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
++		$(DESTDIR)$(mandir)/cat1/atq.1*
++	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
+ 	if test x"$(systemdsystemunitdir)" != xno; then \
+-		$(INSTALL) -o root -g root -m 755 -d $(IROOT)$(systemdsystemunitdir); \
+-		$(INSTALL) -o root -g root -m 644 atd.service $(IROOT)$(systemdsystemunitdir); \
++		$(INSTALL) -o root -g root -m 755 -d $(DESTDIR)$(systemdsystemunitdir); \
++		$(INSTALL) -o root -g root -m 644 atd.service $(DESTDIR)$(systemdsystemunitdir); \
+ 	fi
+ 
+ dist: checkin $(DIST) $(LIST) Filelist.asc
+-- 
+2.4.10
+
diff --git a/package/at/0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch b/package/at/0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
deleted file mode 100644
index e4276ac..0000000
--- a/package/at/0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
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
-+       [AC_LANG_PROGRAM([[]], [[void __attribute__((noreturn)) panic(void);]])],
-+       [AC_MSG_RESULT(yes)
-+        AC_DEFINE(HAVE_ATTRIBUTE_NORETURN, 1, Define to 1 if compiler supports __attribute__((noreturn)))],
-+       [AC_MSG_RESULT(no)]
- )
- dnl Checks for libraries.
- 
--- 
-1.6.5.3
-
diff --git a/package/at/0003-Makefile.in-make-install-fix.patch b/package/at/0003-Makefile.in-make-install-fix.patch
new file mode 100644
index 0000000..831ea1a
--- /dev/null
+++ b/package/at/0003-Makefile.in-make-install-fix.patch
@@ -0,0 +1,83 @@
+[PATCH]: Makefile.in: fix make install for non-root, don't strip
+
+Buildroot will ensure all files are owned by root and stripped anyway
+(if needed) before the rootfs is created.
+
+[Vincent: tweak the patch for the new version]
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ Makefile.in | 43 +++++++++++++++++++++----------------------
+ 1 file changed, 21 insertions(+), 22 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 1f699d9..f313f9b 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -95,41 +95,40 @@ atrun: atrun.in
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
+-	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(DESTDIR)$(bindir)
++	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -m 640 at.deny $(DESTDIR)$(etcdir)/
++	$(INSTALL) -m 6755 at $(DESTDIR)$(bindir)
+ 	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
+ 	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
+-	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
+-	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
+-	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
+-	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
+-	$(INSTALL) -g root -o root -m 755 atd $(DESTDIR)$(sbindir)
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
+-	$(INSTALL) -g root -o root -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
++	$(INSTALL) -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
+ 	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
+-	$(INSTALL) -g root -o root -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
++	$(INSTALL) -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
+ 	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
+ 		$(DESTDIR)$(mandir)/cat1/atq.1*
+ 	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
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
diff --git a/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
deleted file mode 100644
index 856b6c8..0000000
--- a/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 195d30e2e01fe2f91ed3bdaeec3982aa66b309dd Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Tue, 1 Dec 2009 20:57:45 +0100
-Subject: [PATCH 5/5] Makefile.in: replace IROOT by DESTDIR
-
-This patch replaces IROOT by DESTDIR, which is the autotools standard
-variable. For backwards compatibilty IROOT overwrites the DESTDIR.
-
-[Vincent: tweak the patch for the new version]
-
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- Makefile.in | 68 ++++++++++++++++++++++++++++++++-----------------------------
- 1 file changed, 36 insertions(+), 32 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 06544f9..1f699d9 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -17,6 +17,10 @@ atdocdir	= $(docdir)/at
- etcdir		= @ETCDIR@
- systemdsystemunitdir = @systemdsystemunitdir@
- 
-+ifdef IROOT
-+DESTDIR		= $(DESTDIR)
-+endif
-+
- DAEMON_USERNAME	= @DAEMON_USERNAME@
- DAEMON_GROUPNAME= @DAEMON_GROUPNAME@
- LOADAVG_MX	= @LOADAVG_MX@
-@@ -91,41 +95,41 @@ atrun: atrun.in
- 	$(CC) -c $(CFLAGS) $(DEFS) $*.c
- 
- install: all
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(etcdir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(bindir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(sbindir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(docdir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(atdocdir)
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(IROOT)$(ATSPOOL_DIR) $(IROOT)$(ATJOB_DIR)
--	chmod 1770 $(IROOT)$(ATSPOOL_DIR) $(IROOT)$(ATJOB_DIR)
--	touch $(IROOT)$(LFILE)
--	chmod 600 $(IROOT)$(LFILE)
--	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(IROOT)$(LFILE)
--	test -f $(IROOT)$(etcdir)/at.allow || test -f $(IROOT)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(IROOT)$(etcdir)/
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(IROOT)$(bindir)
--	$(LN_S) -f at $(IROOT)$(bindir)/atq
--	$(LN_S) -f at $(IROOT)$(bindir)/atrm
--	$(INSTALL) -g root -o root -m 755 batch $(IROOT)$(bindir)
--	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man1dir)
--	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man5dir)
--	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man8dir)
--	$(INSTALL) -g root -o root -m 755 atd $(IROOT)$(sbindir)
--	$(INSTALL) -g root -o root -m 755 atrun $(IROOT)$(sbindir)
--	$(INSTALL) -g root -o root -m 644 at.1 $(IROOT)$(man1dir)/
--	cd $(IROOT)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
--	$(INSTALL) -g root -o root -m 644 atd.8 $(IROOT)$(man8dir)/
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
-+	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
-+	chmod 1770 $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
-+	touch $(DESTDIR)$(LFILE)
-+	chmod 600 $(DESTDIR)$(LFILE)
-+	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
-+	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR)$(etcdir)/
-+	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(DESTDIR)$(bindir)
-+	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
-+	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
-+	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
-+	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
-+	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
-+	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
-+	$(INSTALL) -g root -o root -m 755 atd $(DESTDIR)$(sbindir)
-+	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
-+	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
-+	cd $(DESTDIR)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
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
- 	if test x"$(systemdsystemunitdir)" != xno; then \
--		$(INSTALL) -o root -g root -m 755 -d $(IROOT)$(systemdsystemunitdir); \
--		$(INSTALL) -o root -g root -m 644 atd.service $(IROOT)$(systemdsystemunitdir); \
-+		$(INSTALL) -o root -g root -m 755 -d $(DESTDIR)$(systemdsystemunitdir); \
-+		$(INSTALL) -o root -g root -m 644 atd.service $(DESTDIR)$(systemdsystemunitdir); \
- 	fi
- 
- dist: checkin $(DIST) $(LIST) Filelist.asc
--- 
-2.4.10
-
diff --git a/package/at/0004-getloadavg.c-fix.patch b/package/at/0004-getloadavg.c-fix.patch
new file mode 100644
index 0000000..e073927
--- /dev/null
+++ b/package/at/0004-getloadavg.c-fix.patch
@@ -0,0 +1,30 @@
+[PATCH]: fix getloadavg.c compilation, revert to 3.1.10 version
+
+getloadavg.c shipped with 3.1.13 doesn't compile because it references
+headers not shipped. Fix it by simply reverting to the 3.1.10 version.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ getloadavg.c |    7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+Index: at-3.1.13/getloadavg.c
+===================================================================
+--- at-3.1.13.orig/getloadavg.c
++++ at-3.1.13/getloadavg.c
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
diff --git a/package/at/0005-Makefile.in-make-install-fix.patch b/package/at/0005-Makefile.in-make-install-fix.patch
deleted file mode 100644
index 831ea1a..0000000
--- a/package/at/0005-Makefile.in-make-install-fix.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-[PATCH]: Makefile.in: fix make install for non-root, don't strip
-
-Buildroot will ensure all files are owned by root and stripped anyway
-(if needed) before the rootfs is created.
-
-[Vincent: tweak the patch for the new version]
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- Makefile.in | 43 +++++++++++++++++++++----------------------
- 1 file changed, 21 insertions(+), 22 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 1f699d9..f313f9b 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -95,41 +95,40 @@ atrun: atrun.in
- 	$(CC) -c $(CFLAGS) $(DEFS) $*.c
- 
- install: all
--	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
--	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
--	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
--	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
--	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
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
--	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR)$(etcdir)/
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(DESTDIR)$(bindir)
-+	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -m 640 at.deny $(DESTDIR)$(etcdir)/
-+	$(INSTALL) -m 6755 at $(DESTDIR)$(bindir)
- 	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
- 	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
--	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
--	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
--	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
--	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
--	$(INSTALL) -g root -o root -m 755 atd $(DESTDIR)$(sbindir)
--	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
--	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
-+	$(INSTALL) -m 755 batch $(DESTDIR)$(bindir)
-+	$(INSTALL) -d -m 755 $(DESTDIR)$(man1dir)
-+	$(INSTALL) -d -m 755 $(DESTDIR)$(man5dir)
-+	$(INSTALL) -d -m 755 $(DESTDIR)$(man8dir)
-+	$(INSTALL) -m 755 atd $(DESTDIR)$(sbindir)
-+	$(INSTALL) -m 755 atrun $(DESTDIR)$(sbindir)
-+	$(INSTALL) -m 644 at.1 $(DESTDIR)$(man1dir)/
- 	cd $(DESTDIR)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
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
- 	if test x"$(systemdsystemunitdir)" != xno; then \
--		$(INSTALL) -o root -g root -m 755 -d $(DESTDIR)$(systemdsystemunitdir); \
--		$(INSTALL) -o root -g root -m 644 atd.service $(DESTDIR)$(systemdsystemunitdir); \
-+		$(INSTALL) -m 755 -d $(DESTDIR)$(systemdsystemunitdir); \
-+		$(INSTALL) -m 644 atd.service $(DESTDIR)$(systemdsystemunitdir); \
- 	fi
- 
- dist: checkin $(DIST) $(LIST) Filelist.asc
--- 
-2.4.10
-
diff --git a/package/at/0005-parsetime.l-include-config-h.patch b/package/at/0005-parsetime.l-include-config-h.patch
new file mode 100644
index 0000000..f4111eb
--- /dev/null
+++ b/package/at/0005-parsetime.l-include-config-h.patch
@@ -0,0 +1,16 @@
+Make sure to include config.h so that NEEDS_* macros are properly
+taken into account. This was a problem for NEEDS_YYWRAP, which was set
+to 1 in config.h, but the corresponding code wasn't compiled in.
+
+Index: at-3.1.13/parsetime.l
+===================================================================
+--- at-3.1.13.orig/parsetime.l
++++ at-3.1.13/parsetime.l
+@@ -4,6 +4,7 @@
+ #include <time.h>
+ #include "y.tab.h"
+ #include "parsetime.h"
++#include "config.h"
+ 
+ char *last_token = NULL;
+ char **my_argv;
diff --git a/package/at/0006-getloadavg.c-fix.patch b/package/at/0006-getloadavg.c-fix.patch
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
-===================================================================
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
diff --git a/package/at/0006-remove-glibc-__isleap-assumption.patch b/package/at/0006-remove-glibc-__isleap-assumption.patch
new file mode 100644
index 0000000..2152249
--- /dev/null
+++ b/package/at/0006-remove-glibc-__isleap-assumption.patch
@@ -0,0 +1,59 @@
+From 7f811d9c4ebc9444e613e251c31d6bf537a24dc1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 16:35:30 -0700
+Subject: [PATCH] remove glibc assumption
+
+glibc time.h header has an undocumented __isleap macro
+that we are using anf musl is missing it.
+Since it is undocumented & does not appear
+on any other libc, stop using it and just define the macro in
+locally  instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[patch from: http://patchwork.openembedded.org/patch/91893/ ]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+ parsetime.y | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/parsetime.y b/parsetime.y
+index 7005e88..324e6d3 100644
+--- a/parsetime.y
++++ b/parsetime.y
+@@ -8,6 +8,9 @@
+ 
+ #define YYDEBUG 1
+ 
++#define is_leap_year(y) \
++    ((y) % 4 == 0 && ((y) % 100 != 0 || (y) % 400 == 0))
++
+ struct tm exectm;
+ static int isgmt;
+ static int yearspec;
+@@ -217,8 +220,8 @@ date            : month_name day_number
+ 				 mnum == 12) && dnum > 31)
+ 			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
+ 			         mnum == 11) && dnum > 30)
+-			    || (mnum ==  2 && dnum > 29 &&  __isleap(ynum+1900))
+-			    || (mnum ==  2 && dnum > 28 && !__isleap(ynum+1900))
++			    || (mnum ==  2 && dnum > 29 &&  is_leap_year(ynum+1900))
++			    || (mnum ==  2 && dnum > 28 && !is_leap_year(ynum+1900))
+ 			   )
+ 			{
+ 			    yyerror("Error in day of month");
+@@ -261,8 +264,8 @@ date            : month_name day_number
+ 				 mnum == 12) && dnum > 31)
+ 			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
+ 			         mnum == 11) && dnum > 30)
+-			    || (mnum ==  2 && dnum > 29 &&  __isleap(ynum+1900))
+-			    || (mnum ==  2 && dnum > 28 && !__isleap(ynum+1900))
++			    || (mnum ==  2 && dnum > 29 &&  is_leap_year(ynum+1900))
++			    || (mnum ==  2 && dnum > 28 && !is_leap_year(ynum+1900))
+ 			   )
+ 			{
+ 			    yyerror("Error in day of month");
+-- 
+2.1.4
diff --git a/package/at/0007-parsetime.l-include-config-h.patch b/package/at/0007-parsetime.l-include-config-h.patch
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
-===================================================================
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
diff --git a/package/at/0008-remove-glibc-__isleap-assumption.patch b/package/at/0008-remove-glibc-__isleap-assumption.patch
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
2.4.10
