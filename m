From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Apr 2013 20:33:15 +0200
Subject: [Buildroot] [git commit] at: bump to version 3.1.13
Message-ID: <20130428183835.C9E249B897@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41de02bd0277f5df5ce575f08f06958237fb2de7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-remove-manual-compiler-check-with-AC_TR.patch} |    0
 ...-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} |   10 +++++-----
 ...Makefile.in-add-LDFLAGS-to-linking-stage.patch} |    0
 ...004-Makefile.in-replace-IROOT-by-DESTDIR.patch} |   20 ++++++++++----------
 ... => at-0005-Makefile.in-make-install-fix.patch} |   14 +++++++-------
 ...vg-fix.patch => at-0006-getloadavg.c-fix.patch} |    8 ++++----
 ... => at-0007-parsetime.l-include-config-h.patch} |    6 +++---
 package/at/at.mk                                   |    3 ++-
 8 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/package/at/at-3.1.12-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch b/package/at/at-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
similarity index 100%
rename from package/at/at-3.1.12-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
rename to package/at/at-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
diff --git a/package/at/at-3.1.12-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch b/package/at/at-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
similarity index 70%
rename from package/at/at-3.1.12-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
rename to package/at/at-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
index ab6de44..e4276ac 100644
--- a/package/at/at-3.1.12-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
+++ b/package/at/at-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
@@ -19,13 +19,13 @@ index 997a37f..cab80ed 100644
 -AC_TRY_COMPILE([], [void __attribute__((noreturn)) panic(void);],
 -    AC_MSG_RESULT(yes)
 -    AC_DEFINE(HAVE_ATTRIBUTE_NORETURN, 1,
--	      [Define to 1 if compiler supports __attribute__((noreturn))]),
+-              [Define to 1 if compiler supports __attribute__((noreturn))]),
 -    AC_MSG_RESULT(no)
 +AC_COMPILE_IFELSE(
-+	[AC_LANG_PROGRAM([[]], [[void __attribute__((noreturn)) panic(void);]])],
-+	[AC_MSG_RESULT(yes)
-+	 AC_DEFINE(HAVE_ATTRIBUTE_NORETURN, 1, Define to 1 if compiler supports __attribute__((noreturn)))],
-+	[AC_MSG_RESULT(no)]
++       [AC_LANG_PROGRAM([[]], [[void __attribute__((noreturn)) panic(void);]])],
++       [AC_MSG_RESULT(yes)
++        AC_DEFINE(HAVE_ATTRIBUTE_NORETURN, 1, Define to 1 if compiler supports __attribute__((noreturn)))],
++       [AC_MSG_RESULT(no)]
  )
  dnl Checks for libraries.
  
diff --git a/package/at/at-3.1.12-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch b/package/at/at-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
similarity index 100%
rename from package/at/at-3.1.12-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
rename to package/at/at-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
diff --git a/package/at/at-3.1.12-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/at-0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
similarity index 90%
rename from package/at/at-3.1.12-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch
rename to package/at/at-0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
index 6a295e3..0d1d5f6 100644
--- a/package/at/at-3.1.12-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch
+++ b/package/at/at-0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
@@ -11,10 +11,10 @@ Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
  Makefile.in |   64 +++++++++++++++++++++++++++++++-----------------------------
  1 file changed, 34 insertions(+), 30 deletions(-)
 
-Index: at-3.1.12/Makefile.in
+Index: at-3.1.13/Makefile.in
 ===================================================================
---- at-3.1.12.orig/Makefile.in
-+++ at-3.1.12/Makefile.in
+--- at-3.1.13.orig/Makefile.in
++++ at-3.1.13/Makefile.in
 @@ -16,6 +16,10 @@ docdir		= $(prefix)/doc
  atdocdir	= $(docdir)/at
  etcdir		= @ETCDIR@
@@ -41,14 +41,14 @@ Index: at-3.1.12/Makefile.in
 -	chmod 600 $(IROOT)$(LFILE)
 -	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(IROOT)$(LFILE)
 -	test -f $(IROOT)$(etcdir)/at.allow || test -f $(IROOT)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(IROOT)$(etcdir)/
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at $(IROOT)$(bindir)
+-	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(IROOT)$(bindir)
 -	$(LN_S) -f at $(IROOT)$(bindir)/atq
 -	$(LN_S) -f at $(IROOT)$(bindir)/atrm
 -	$(INSTALL) -g root -o root -m 755 batch $(IROOT)$(bindir)
 -	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man1dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man5dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man8dir)
--	$(INSTALL) -g root -o root -m 755 -s atd $(IROOT)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 atd $(IROOT)$(sbindir)
 -	$(INSTALL) -g root -o root -m 755 atrun $(IROOT)$(sbindir)
 -	$(INSTALL) -g root -o root -m 644 at.1 $(IROOT)$(man1dir)/
 -	cd $(IROOT)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
@@ -63,7 +63,7 @@ Index: at-3.1.12/Makefile.in
 +	touch $(DESTDIR)$(LFILE)
 +	chmod 600 $(DESTDIR)$(LFILE)
 +	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
-+	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR)$(etcdir)/
++	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR$
 +	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at $(DESTDIR)$(bindir)
 +	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
 +	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
@@ -80,14 +80,14 @@ Index: at-3.1.12/Makefile.in
 -	$(INSTALL) -g root -o root -m 644 tmpman $(IROOT)$(man8dir)/atrun.8
 +	$(INSTALL) -g root -o root -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
  	rm -f tmpman
--	$(INSTALL) -g root -o root -m 644 at_allow.5 $(IROOT)$(man5dir)/
--	cd $(IROOT)$(man5dir) && $(LN_S) -f at_allow.5 at_deny.5 
+-	$(INSTALL) -g root -o root -m 644 at.allow.5 $(IROOT)$(man5dir)/
+-	cd $(IROOT)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
 -	$(INSTALL) -g root -o root -m 644 $(DOCS) $(IROOT)$(atdocdir)
 -	rm -f $(IROOT)$(mandir)/cat1/at.1* $(IROOT)$(mandir)/cat1/batch.1* \
 -		$(IROOT)$(mandir)/cat1/atq.1*
 -	rm -f $(IROOT)$(mandir)/cat1/atd.8*
-+	$(INSTALL) -g root -o root -m 644 at_allow.5 $(DESTDIR)$(man5dir)/
-+	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at_allow.5 at_deny.5 
++	$(INSTALL) -g root -o root -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
++	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
 +	$(INSTALL) -g root -o root -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
 +	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
 +		$(DESTDIR)$(mandir)/cat1/atq.1*
diff --git a/package/at/at-3.1.12-0006-Makefile.in-make-install-fix.patch b/package/at/at-0005-Makefile.in-make-install-fix.patch
similarity index 91%
rename from package/at/at-3.1.12-0006-Makefile.in-make-install-fix.patch
rename to package/at/at-0005-Makefile.in-make-install-fix.patch
index b9a4e56..ad84344 100644
--- a/package/at/at-3.1.12-0006-Makefile.in-make-install-fix.patch
+++ b/package/at/at-0005-Makefile.in-make-install-fix.patch
@@ -8,10 +8,10 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
  Makefile.in |   39 +++++++++++++++++++--------------------
  1 file changed, 19 insertions(+), 20 deletions(-)
 
-Index: at-3.1.12/Makefile.in
+Index: at-3.1.13/Makefile.in
 ===================================================================
---- at-3.1.12.orig/Makefile.in
-+++ at-3.1.12/Makefile.in
+--- at-3.1.13.orig/Makefile.in
++++ at-3.1.13/Makefile.in
 @@ -90,35 +90,34 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
@@ -32,7 +32,7 @@ Index: at-3.1.12/Makefile.in
  	touch $(DESTDIR)$(LFILE)
  	chmod 600 $(DESTDIR)$(LFILE)
 -	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
--	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR)$(etcdir)/
+-	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR$
 -	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at $(DESTDIR)$(bindir)
 +	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -m 640 at.deny $(DESTDIR)$(etcdir)/
 +	$(INSTALL) -m 6755 at $(DESTDIR)$(bindir)
@@ -59,9 +59,9 @@ Index: at-3.1.12/Makefile.in
 -	$(INSTALL) -g root -o root -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
 +	$(INSTALL) -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
  	rm -f tmpman
--	$(INSTALL) -g root -o root -m 644 at_allow.5 $(DESTDIR)$(man5dir)/
-+	$(INSTALL) -m 644 at_allow.5 $(DESTDIR)$(man5dir)/
- 	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at_allow.5 at_deny.5 
+-	$(INSTALL) -g root -o root -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
++	$(INSTALL) -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
+ 	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
 -	$(INSTALL) -g root -o root -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
 +	$(INSTALL) -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
  	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
diff --git a/package/at/at-3.1.12-0007-getloadavg-fix.patch b/package/at/at-0006-getloadavg.c-fix.patch
similarity index 81%
rename from package/at/at-3.1.12-0007-getloadavg-fix.patch
rename to package/at/at-0006-getloadavg.c-fix.patch
index 2edb4f0..e073927 100644
--- a/package/at/at-3.1.12-0007-getloadavg-fix.patch
+++ b/package/at/at-0006-getloadavg.c-fix.patch
@@ -1,6 +1,6 @@
 [PATCH]: fix getloadavg.c compilation, revert to 3.1.10 version
 
-getloadavg.c shipped with 3.1.12 doesn't compile because it references
+getloadavg.c shipped with 3.1.13 doesn't compile because it references
 headers not shipped. Fix it by simply reverting to the 3.1.10 version.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
@@ -8,10 +8,10 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
  getloadavg.c |    7 ++++---
  1 file changed, 4 insertions(+), 3 deletions(-)
 
-Index: at-3.1.12/getloadavg.c
+Index: at-3.1.13/getloadavg.c
 ===================================================================
---- at-3.1.12.orig/getloadavg.c
-+++ at-3.1.12/getloadavg.c
+--- at-3.1.13.orig/getloadavg.c
++++ at-3.1.13/getloadavg.c
 @@ -66,11 +66,12 @@ Boston, MA  02110-1301  USA */
  
  /* This should always be first.  */
diff --git a/package/at/at-3.1.12-0007-include-config-h.patch b/package/at/at-0007-parsetime.l-include-config-h.patch
similarity index 72%
rename from package/at/at-3.1.12-0007-include-config-h.patch
rename to package/at/at-0007-parsetime.l-include-config-h.patch
index 8afc502..f4111eb 100644
--- a/package/at/at-3.1.12-0007-include-config-h.patch
+++ b/package/at/at-0007-parsetime.l-include-config-h.patch
@@ -2,10 +2,10 @@ Make sure to include config.h so that NEEDS_* macros are properly
 taken into account. This was a problem for NEEDS_YYWRAP, which was set
 to 1 in config.h, but the corresponding code wasn't compiled in.
 
-Index: at-3.1.12/parsetime.l
+Index: at-3.1.13/parsetime.l
 ===================================================================
---- at-3.1.12.orig/parsetime.l	2010-02-10 00:17:46.000000000 +0100
-+++ at-3.1.12/parsetime.l	2010-02-10 00:18:07.000000000 +0100
+--- at-3.1.13.orig/parsetime.l
++++ at-3.1.13/parsetime.l
 @@ -4,6 +4,7 @@
  #include <time.h>
  #include "y.tab.h"
diff --git a/package/at/at.mk b/package/at/at.mk
index 6432ae3..ad024e3 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -3,7 +3,8 @@
 # at
 #
 #############################################################
-AT_VERSION = 3.1.12
+
+AT_VERSION = 3.1.13
 AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
 AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
 # missing deps for parsetime.l
