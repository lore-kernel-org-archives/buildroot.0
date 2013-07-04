From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Jul 2013 11:52:42 +0200
Subject: [Buildroot] [git commit] fbgrab: bump to version 1.1
Message-ID: <20130704095654.6F7289A29F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8916f9d80eb2c6a089ba4c9250656f47b5d6de77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also update URL in Config.in]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fbgrab/Config.in                           |    2 +-
 ...bgrab-proper-Makefile-for-cross-compiling.patch |   39 ++++++++++++++++++++
 package/fbgrab/fbgrab-proper_makefile.patch        |   23 ------------
 package/fbgrab/fbgrab.mk                           |    4 +-
 4 files changed, 42 insertions(+), 26 deletions(-)

diff --git a/package/fbgrab/Config.in b/package/fbgrab/Config.in
index ca6c6b7..f3b29d9 100644
--- a/package/fbgrab/Config.in
+++ b/package/fbgrab/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_FBGRAB
 	  FBGrab is a framebuffer screenshot program, capturing the linux
 	  frambuffer and converting it to a png-picture.
 
-	  http://hem.bredband.net/gmogmo/fbgrab
+	  http://fbgrab.monells.se/
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
+Reworked original patch from: Daniel Nystr??m <daniel.nystrom@timeterminal.se>
+
+Signed-off-by: Daniel Nystr??m <daniel.nystrom@timeterminal.se>
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
-Signed-off-by: Daniel Nystr??m <daniel.nystrom@timeterminal.se>
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
