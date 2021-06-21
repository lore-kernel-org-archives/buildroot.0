From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 21 Jun 2021 19:44:19 +0200
Subject: [Buildroot] [PATCH] package/at: bump versinon to 3.2.2
Message-ID: <20210621174419.303865-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let's bump at to version 3.2.2 by:
- moving SITE to http://software.calhariz.com/at that is the site buildroot
 uses to check if version changed and is updated(salsa.debian doesn't
 provide the new tar.bz2 at the moment)
- rebasing local patches(some some of them has not been accepted upstream
 because of removing -g root -o root while installing, while other simply
 has not been taken into account for 1 year

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ile.in-use-DESTDIR-instead-of-IROOT.patch} | 37 +++++++++++--------
 ...ake-install-for-non-root-don-t-stri.patch} | 24 ++++++++----
 ...-Makefile-fix-parallel-build-failure.patch | 10 ++---
 package/at/at.hash                            |  2 +-
 package/at/at.mk                              |  6 +--
 5 files changed, 47 insertions(+), 32 deletions(-)
 rename package/at/{0001-Makefile.in-replace-IROOT-by-DESTDIR.patch => 0001-Makefile.in-use-DESTDIR-instead-of-IROOT.patch} (82%)
 rename package/at/{0002-Makefile.in-make-install-fix.patch => 0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch} (83%)

diff --git a/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/0001-Makefile.in-use-DESTDIR-instead-of-IROOT.patch
similarity index 82%
rename from package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
rename to package/at/0001-Makefile.in-use-DESTDIR-instead-of-IROOT.patch
index 856b6c8d08..0fb4c79efe 100644
--- a/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
+++ b/package/at/0001-Makefile.in-use-DESTDIR-instead-of-IROOT.patch
@@ -1,41 +1,45 @@
-From 195d30e2e01fe2f91ed3bdaeec3982aa66b309dd Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Tue, 1 Dec 2009 20:57:45 +0100
-Subject: [PATCH 5/5] Makefile.in: replace IROOT by DESTDIR
+From 4c85d3a71f2db2cba96c89156611e9714b8c488d Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 21 Jun 2021 19:23:24 +0200
+Subject: [PATCH] Makefile.in: use DESTDIR instead of IROOT
 
 This patch replaces IROOT by DESTDIR, which is the autotools standard
-variable. For backwards compatibilty IROOT overwrites the DESTDIR.
-
-[Vincent: tweak the patch for the new version]
+variable. For backwards compatibilty IROOT overwrites the DESTDIR and emits
+a warning pointing that IROOT is deprecated.
 
 Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[Vincent: tweak the patch for the new version]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Giulio: rebase to version 3.2.2 and modify IROOT/DESTDIR compability]
 ---
- Makefile.in | 68 ++++++++++++++++++++++++++++++++-----------------------------
- 1 file changed, 36 insertions(+), 32 deletions(-)
+ Makefile.in | 73 ++++++++++++++++++++++++++++-------------------------
+ 1 file changed, 39 insertions(+), 34 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 06544f9..1f699d9 100644
+index 3e8303c..24ee40c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -17,6 +17,10 @@ atdocdir	= $(docdir)/at
- etcdir		= @ETCDIR@
+@@ -20,6 +20,11 @@ etcdir		= @ETCDIR@
+ atjobdir	= @ATJBD@
  systemdsystemunitdir = @systemdsystemunitdir@
  
 +ifdef IROOT
-+DESTDIR		= $(DESTDIR)
++DESTDIR 	= $(IROOT)
++$(warning IROOT is deprecated, you should use DESTDIR instead)
 +endif
 +
  DAEMON_USERNAME	= @DAEMON_USERNAME@
  DAEMON_GROUPNAME= @DAEMON_GROUPNAME@
  LOADAVG_MX	= @LOADAVG_MX@
-@@ -91,41 +95,41 @@ atrun: atrun.in
+@@ -95,43 +100,43 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
  install: all
 -	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(etcdir)
 -	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(bindir)
 -	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(atdatadir)
 -	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(docdir)
 -	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(atdocdir)
 -	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(IROOT)$(ATSPOOL_DIR) $(IROOT)$(ATJOB_DIR)
@@ -48,6 +52,7 @@ index 06544f9..1f699d9 100644
 -	$(LN_S) -f at $(IROOT)$(bindir)/atq
 -	$(LN_S) -f at $(IROOT)$(bindir)/atrm
 -	$(INSTALL) -g root -o root -m 755 batch $(IROOT)$(bindir)
+-	$(INSTALL) -g root -o root -m 755 batch-job $(IROOT)$(atdatadir)
 -	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man1dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man5dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man8dir)
@@ -59,6 +64,7 @@ index 06544f9..1f699d9 100644
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
++	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdatadir)
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
 +	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
@@ -71,6 +77,7 @@ index 06544f9..1f699d9 100644
 +	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
 +	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
 +	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
++	$(INSTALL) -g root -o root -m 755 batch-job $(DESTDIR)$(atdatadir)
 +	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
 +	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
 +	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
@@ -104,5 +111,5 @@ index 06544f9..1f699d9 100644
  
  dist: checkin $(DIST) $(LIST) Filelist.asc
 -- 
-2.4.10
+2.25.1
 
diff --git a/package/at/0002-Makefile.in-make-install-fix.patch b/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
similarity index 83%
rename from package/at/0002-Makefile.in-make-install-fix.patch
rename to package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
index 831ea1a3a9..587bd160b1 100644
--- a/package/at/0002-Makefile.in-make-install-fix.patch
+++ b/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
@@ -1,33 +1,39 @@
-[PATCH]: Makefile.in: fix make install for non-root, don't strip
+From daae0a5a26ad78c05adb0eb1fc6cad1896e3766a Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 21 Jun 2021 19:33:23 +0200
+Subject: [PATCH] Makefile.in: fix make install for non-root, don't strip
 
 Buildroot will ensure all files are owned by root and stripped anyway
 (if needed) before the rootfs is created.
 
-[Vincent: tweak the patch for the new version]
-
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[Vincent: tweak the patch for the new version]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Giulio: tweak patch for version 3.2.2]
 ---
- Makefile.in | 43 +++++++++++++++++++++----------------------
- 1 file changed, 21 insertions(+), 22 deletions(-)
+ Makefile.in | 47 +++++++++++++++++++++++------------------------
+ 1 file changed, 23 insertions(+), 24 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 1f699d9..f313f9b 100644
+index 24ee40c..f634c74 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -95,41 +95,40 @@ atrun: atrun.in
+@@ -100,43 +100,42 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
  install: all
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdatadir)
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
 -	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(etcdir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(bindir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(sbindir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(atdatadir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(docdir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(atdocdir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
@@ -42,6 +48,7 @@ index 1f699d9..f313f9b 100644
  	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
  	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
 -	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
+-	$(INSTALL) -g root -o root -m 755 batch-job $(DESTDIR)$(atdatadir)
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
@@ -49,6 +56,7 @@ index 1f699d9..f313f9b 100644
 -	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
 -	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
 +	$(INSTALL) -m 755 batch $(DESTDIR)$(bindir)
++	$(INSTALL) -m 755 batch-job $(DESTDIR)$(atdatadir)
 +	$(INSTALL) -d -m 755 $(DESTDIR)$(man1dir)
 +	$(INSTALL) -d -m 755 $(DESTDIR)$(man5dir)
 +	$(INSTALL) -d -m 755 $(DESTDIR)$(man8dir)
@@ -79,5 +87,5 @@ index 1f699d9..f313f9b 100644
  
  dist: checkin $(DIST) $(LIST) Filelist.asc
 -- 
-2.4.10
+2.25.1
 
diff --git a/package/at/0004-Makefile-fix-parallel-build-failure.patch b/package/at/0004-Makefile-fix-parallel-build-failure.patch
index 6e3dc24ca4..27f461f2b9 100644
--- a/package/at/0004-Makefile-fix-parallel-build-failure.patch
+++ b/package/at/0004-Makefile-fix-parallel-build-failure.patch
@@ -1,4 +1,4 @@
-From 3ace0b57e2aacb784c01a3c7694c6c92461937ff Mon Sep 17 00:00:00 2001
+From 12da7467ed698b20042e4e47b3690666769ba775 Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@benettiengineering.com>
 Date: Thu, 20 Feb 2020 22:00:11 +0100
 Subject: [PATCH] Makefile: fix parallel build failure
@@ -19,10 +19,10 @@ Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 4c11913..57c3a0c 100644
+index f634c74..af82e4c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -83,6 +83,8 @@ y.tab.c y.tab.h: parsetime.y
+@@ -90,6 +90,8 @@ y.tab.c y.tab.h: parsetime.y
  lex.yy.c: parsetime.l
  	$(LEX) -i parsetime.l
  
@@ -31,11 +31,11 @@ index 4c11913..57c3a0c 100644
  atd.service: atd.service.in
  	cat $< | sed -e 's![@]sbindir[@]!$(sbindir)!g' | sed -e 's![@]atjobdir[@]!$(atjobdir)!g' > $@
  
-@@ -173,3 +175,4 @@ perm.o: perm.c config.h privs.h at.h
+@@ -181,3 +183,4 @@ perm.o: perm.c config.h privs.h at.h
  posixtm.o: posixtm.c posixtm.h
  daemon.o: daemon.c config.h daemon.h privs.h
  getloadavg.o: getloadavg.c config.h getloadavg.h
 +y.tab.o: y.tab.c y.tab.h
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/at/at.hash b/package/at/at.hash
index c5daf4ef86..88a9e8a91d 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  62123a6fcf02b2606673afca80c2874358b83880c12db7f276a7c6cc70068cb2  at-upstream-3.2.1.tar.bz2
+sha256  2211da14914fde1f9cc83592838fb6385a32fb11fcecb7816c77700df6559088  at_3.2.2.orig.tar.gz
 
 sha256  01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/at/at.mk b/package/at/at.mk
index 6ac82e2de3..bbeed2a0e8 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-AT_VERSION = 3.2.1
-AT_SOURCE = at-upstream-$(AT_VERSION).tar.bz2
-AT_SITE = https://salsa.debian.org/debian/at/-/archive/upstream/$(AT_VERSION)
+AT_VERSION = 3.2.2
+AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
+AT_SITE = http://software.calhariz.com/at
 AT_AUTORECONF = YES
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
 AT_LICENSE = GPL-2.0+, GPL-3.0+, ISC
-- 
2.25.1
