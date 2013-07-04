From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed,  3 Jul 2013 17:34:35 -0700
Subject: [Buildroot] [PATCH] fbgrab: bump to version 1.1
Message-ID: <1372898075-30947-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 ...bgrab-proper-Makefile-for-cross-compiling.patch |   39 ++++++++++++++++++++
 package/fbgrab/fbgrab-proper_makefile.patch        |   23 ------------
 package/fbgrab/fbgrab.mk                           |    4 +-
 3 files changed, 41 insertions(+), 25 deletions(-)
 create mode 100644 package/fbgrab/fbgrab-proper-Makefile-for-cross-compiling.patch
 delete mode 100644 package/fbgrab/fbgrab-proper_makefile.patch

diff --git a/package/fbgrab/fbgrab-proper-Makefile-for-cross-compiling.patch b/package/fbgrab/fbgrab-proper-Makefile-for-cross-compiling.patch
new file mode 100644
index 0000000..a211774
--- /dev/null
+++ b/package/fbgrab/fbgrab-proper-Makefile-for-cross-compiling.patch
@@ -0,0 +1,39 @@
+From 2283817b9aed0b6228d0255d5aba7968379c9854 Mon Sep 17 00:00:00 2001
+From: Gilles Talis <gilles.talis@gmail.com>
+Date: Wed, 3 Jul 2013 11:40:36 -0700
+Subject: [PATCH] fbgrab: A proper Makefile for cross compiling
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Respect to the CC, CFLAGS and LDFLAGS is required for cross compiling in
+Buildroot. And there's no need to run the source through splint.
+
+Reworked original patch from: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
+
+Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ Makefile |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index aae16e6..2d6b6fc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,8 +3,10 @@
+ ### modular. So this is a simple gnu Makefile...
+ ###
+ 
+-fbgrab: fbgrab.c
+-	gcc -g -Wall fbgrab.c -lpng -lz -o fbgrab
++LDFLAGS += -lpng -lz
++
++fbgrab: fbgrab.o
++	$(CC) $(LDFLAGS) fbgrab.o -o $@
+ 
+ install:
+ 	install fbgrab /usr/bin/fbgrab
+-- 
+1.7.4.1
+
diff --git a/package/fbgrab/fbgrab-proper_makefile.patch b/package/fbgrab/fbgrab-proper_makefile.patch
deleted file mode 100644
index e907ed7..0000000
--- a/package/fbgrab/fbgrab-proper_makefile.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-[PATCH] fbgrab: A proper Makefile for cross compiling
-
-Respect to the CC, CFLAGS and LDFLAGS is required for cross compiling in
-Buildroot. And there's no need to run the source through splint.
-
-Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
-
---- fbgrab-1.0.orig/Makefile	2010-12-07 22:57:24.000000000 +0100
-+++ fbgrab-1.0/Makefile	2010-12-07 22:58:36.000000000 +0100
-@@ -3,9 +3,10 @@
- ### modular. So this is a simple gnu Makefile...
- ###
- 
--fbgrab: fbgrab.c
--	splint +posixlib fbgrab.c
--	gcc -g -Wall fbgrab.c -lpng -lz -o fbgrab
-+LDFLAGS += -lpng -lz
-+
-+fbgrab: fbgrab.o
-+	$(CC) $(LDFLAGS) fbgrab.o -o $@
- 
- install:
- 	strip fbgrab
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 62539a8..b404c69 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FBGRAB_VERSION = 1.0
+FBGRAB_VERSION = 1.1
 FBGRAB_SOURCE = fbgrab-$(FBGRAB_VERSION).tar.gz
-FBGRAB_SITE = http://hem.bredband.net/gmogmo/fbgrab
+FBGRAB_SITE = http://fbgrab.monells.se
 FBGRAB_DEPENDENCIES = libpng
 FBGRAB_LICENSE = GPLv2
 FBGRAB_LICENSE_FILES = COPYING
-- 
1.7.4.1
