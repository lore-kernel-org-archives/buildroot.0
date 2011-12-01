From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Dec 2011 08:58:33 -0000
Subject: [Buildroot] [git commit] gawk: bump to version 4.0.0
Message-ID: <20111201085832.5B2838F75B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f00bc8ac3b93e5e2aa5c8b2c8354de7453d9b60a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump gawk to version 4.0.0
Also build after busybox if it's enabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gawk/gawk-no-versioned.patch |   37 ++++++---------------------------
 package/gawk/gawk.mk                 |    7 +++++-
 2 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/package/gawk/gawk-no-versioned.patch b/package/gawk/gawk-no-versioned.patch
index 6f74f52..ff28581 100644
--- a/package/gawk/gawk-no-versioned.patch
+++ b/package/gawk/gawk-no-versioned.patch
@@ -1,20 +1,13 @@
-From 9cb7ff17dd7f81589f0891413efa5d4aec1a1598 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 7 Jun 2010 11:33:50 -0300
-Subject: [PATCH] Disabled versioned installation to save space and use symlinks where it's appropiate
-
+Disabled versioned installation of binaries to save space.
+Also use symlinks where it's appropiate.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
- Makefile.in     |    3 ++-
- doc/Makefile.in |    2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
 
-diff --git a/Makefile.in b/Makefile.in
-index f946ee1..a3d467a 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -392,7 +392,7 @@ CLEANFILES = core core.*
+diff -Nura gawk-4.0.0.orig/Makefile.in gawk-4.0.0/Makefile.in
+--- gawk-4.0.0.orig/Makefile.in	2011-06-24 05:16:13.000000000 -0300
++++ gawk-4.0.0/Makefile.in	2011-11-11 15:31:16.429577288 -0300
+@@ -403,7 +403,7 @@
  MAINTAINERCLEANFILES = version.c
  
  # We want hard links for install-exec-hook, below
@@ -23,7 +16,7 @@ index f946ee1..a3d467a 100644
  all: config.h
  	$(MAKE) $(AM_MAKEFLAGS) all-recursive
  
-@@ -993,6 +993,7 @@ uninstall-am: uninstall-binPROGRAMS
+@@ -1011,6 +1011,7 @@
  # (This is done universally, which may not always be right, but
  # there's no easy way to distinguish GNU from non-GNU systems.)
  install-exec-hook:
@@ -31,19 +24,3 @@ index f946ee1..a3d467a 100644
  	(cd $(DESTDIR)$(bindir); \
  	$(LN) gawk$(EXEEXT) gawk-$(VERSION)$(EXEEXT) 2>/dev/null ; \
  	$(LN) pgawk$(EXEEXT) pgawk-$(VERSION)$(EXEEXT) 2>/dev/null ; \
-diff --git a/doc/Makefile.in b/doc/Makefile.in
-index b1533e7..8b91694 100644
---- a/doc/Makefile.in
-+++ b/doc/Makefile.in
-@@ -272,7 +272,7 @@ AWKCARD = awkcard.ps
- # make pgawk.1 a link to gawk.1 in the installed man directory.
- 
- # We want hard links for install-data-hook, below
--LN = ln
-+LN = $(LN_S)
- all: all-am
- 
- .SUFFIXES:
--- 
-1.6.4.4
-
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 445414b..7fd85ee 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,10 +4,15 @@
 #
 #############################################################
 
-GAWK_VERSION = 3.1.8
+GAWK_VERSION = 4.0.0
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_TARGET_BINS = awk gawk igawk pgawk
 
+# Prefer full-blown gawk over busybox awk
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+GAWK_DEPENDENCIES += busybox
+endif
+
 define GAWK_CREATE_SYMLINK
 	ln -sf /usr/bin/gawk $(TARGET_DIR)/usr/bin/awk
 endef
