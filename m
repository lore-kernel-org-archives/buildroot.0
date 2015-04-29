From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Apr 2015 16:18:19 -0300
Subject: [Buildroot] [PATCH] gawk: bump to version 4.1.2
Message-ID: <1430335099-23127-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop LIBTOOL/GETTEXTIZE as well since it's no longer bundled with a beta
version.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gawk/0001-no-versioned.patch | 20 ++++++++++----------
 package/gawk/gawk.hash               |  2 +-
 package/gawk/gawk.mk                 |  5 +----
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/package/gawk/0001-no-versioned.patch b/package/gawk/0001-no-versioned.patch
index ff28581..0c35088 100644
--- a/package/gawk/0001-no-versioned.patch
+++ b/package/gawk/0001-no-versioned.patch
@@ -2,25 +2,25 @@ Disabled versioned installation of binaries to save space.
 Also use symlinks where it's appropiate.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
+[Gustavo: update for 4.1.2]
 
-diff -Nura gawk-4.0.0.orig/Makefile.in gawk-4.0.0/Makefile.in
---- gawk-4.0.0.orig/Makefile.in	2011-06-24 05:16:13.000000000 -0300
-+++ gawk-4.0.0/Makefile.in	2011-11-11 15:31:16.429577288 -0300
-@@ -403,7 +403,7 @@
- MAINTAINERCLEANFILES = version.c
+diff -Nura gawk-4.1.2.orig/Makefile.in gawk-4.1.2/Makefile.in
+--- gawk-4.1.2.orig/Makefile.in	2015-04-29 16:11:09.367925925 -0300
++++ gawk-4.1.2/Makefile.in	2015-04-29 16:11:25.308466495 -0300
+@@ -554,7 +554,7 @@
+ CLEANFILES = core core.*
  
  # We want hard links for install-exec-hook, below
 -LN = ln
 +LN = $(LN_S)
- all: config.h
- 	$(MAKE) $(AM_MAKEFLAGS) all-recursive
  
-@@ -1011,6 +1011,7 @@
+ # For some make's, e.g. OpenBSD, that don't define this
+ RM = rm -f
+@@ -1173,6 +1173,7 @@
  # (This is done universally, which may not always be right, but
  # there's no easy way to distinguish GNU from non-GNU systems.)
  install-exec-hook:
 +foo:
  	(cd $(DESTDIR)$(bindir); \
  	$(LN) gawk$(EXEEXT) gawk-$(VERSION)$(EXEEXT) 2>/dev/null ; \
- 	$(LN) pgawk$(EXEEXT) pgawk-$(VERSION)$(EXEEXT) 2>/dev/null ; \
+ 	if [ ! -f awk$(EXEEXT) ]; \
diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 72d3cdc..8720031 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	efd4c6aafb1ce996309fc903ceb625e7012221c464eb72483dbb23adef1ee8db	gawk-4.1.1.tar.xz
+sha256	ea8b53c5834ee27012fecba7273f97fca7104884975cf81ddae6f85c5581f481	gawk-4.1.2.tar.xz
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index bf136fa..653a5a0 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-GAWK_VERSION = 4.1.1
+GAWK_VERSION = 4.1.2
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk $(if $(BR2_PACKAGE_MPFR),mpfr)
 GAWK_LICENSE = GPLv3+
 GAWK_LICENSE_FILES = COPYING
-# beta libtool version
-GAWK_AUTORECONF = YES
-GAWK_GETTEXTIZE = YES
 
 # Prefer full-blown gawk over busybox awk
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
2.0.5
