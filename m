From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 28 Aug 2007 11:18:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpg123
Message-ID: <20070828181811.8200EA45BC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-28 11:18:10 -0700 (Tue, 28 Aug 2007)
New Revision: 19713

Log:
Remove mpg123 patch from current build, full removal pending

Added:
   trunk/buildroot/package/mpg123/mpg123-0.59r-cross.patch

Modified:
   trunk/buildroot/package/mpg123/mpg123.mk


Changeset:
Copied: trunk/buildroot/package/mpg123/mpg123-0.59r-cross.patch (from rev 19712, trunk/buildroot/package/mpg123/mpg123-cross.patch)
===================================================================
--- trunk/buildroot/package/mpg123/mpg123-0.59r-cross.patch	                        (rev 0)
+++ trunk/buildroot/package/mpg123/mpg123-0.59r-cross.patch	2007-08-28 18:18:10 UTC (rev 19713)
@@ -0,0 +1,44 @@
+diff -ruN mpg123-0.59r.orig/Makefile mpg123-0.59r/Makefile
+--- mpg123-0.59r.orig/Makefile	1999-06-15 22:39:06.000000000 +0200
++++ mpg123-0.59r/Makefile	2006-12-14 15:52:44.000000000 +0100
+@@ -103,14 +103,14 @@
+         mpg123-make
+ 
+ linux:
+-	$(MAKE) CC=gcc LDFLAGS= \
++	$(MAKE) LDFLAGS= \
+ 		OBJECTS='decode_i386.o dct64_i386.o decode_i586.o \
+ 			audio_oss.o term.o' \
+ 		CFLAGS='-DI386_ASSEM -DPENTIUM_OPT -DREAL_IS_FLOAT -DLINUX \
+ 			-DREAD_MMAP -DOSS -DTERM_CONTROL\
+-			-Wall -O2 -m486 \
++			-Wall \
+ 			-fomit-frame-pointer -funroll-all-loops \
+-			-finline-functions -ffast-math' \
++			-finline-functions -ffast-math $(CFLAGS)' \
+ 		mpg123-make
+ 
+ linux-3dnow:
+@@ -246,6 +246,22 @@
+ 			-finline-functions -ffast-math' \
+ 		mpg123-make
+ 
++linux-bigend:
++	$(MAKE) LDFLAGS= OBJECTS='decode.o dct64.o audio_oss.o' \
++		CFLAGS+='-DREAL_IS_FLOAT -DLINUX -DREAD_MMAP \
++			-DOSS -DOSS_BIG_ENDIAN -Wall \
++			-fomit-frame-pointer -funroll-loops \
++			-finline-functions -ffast-math $(CFLAGS)' \
++		mpg123-make
++
++linux-littleend:
++	$(MAKE) LDFLAGS= OBJECTS='decode.o dct64.o audio_oss.o' \
++		CFLAGS='-DREAL_IS_FLOAT -DLINUX -DREAD_MMAP \
++			-DOSS -Wall \
++			-fomit-frame-pointer -funroll-loops \
++			-finline-functions -ffast-math $(CFLAGS)' \
++		mpg123-make
++
+ linux-sajber:
+ 	@ $(MAKE) FRONTEND=sajberplay-make linux-frontend
+ 

Modified: trunk/buildroot/package/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/mpg123/mpg123.mk	2007-08-28 12:41:56 UTC (rev 19712)
+++ trunk/buildroot/package/mpg123/mpg123.mk	2007-08-28 18:18:10 UTC (rev 19713)
@@ -23,7 +23,7 @@
 
 $(MPG123_DIR)/.unpacked: $(DL_DIR)/$(MPG123_SOURCE)
 	$(MPG123_CAT) $(DL_DIR)/$(MPG123_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MPG123_DIR) package/mpg123/ mpg123\*.patch
+	toolchain/patch-kernel.sh $(MPG123_DIR) package/mpg123/ mpg123-$(MPG123_VERSION)\*.patch
 	$(CONFIG_UPDATE) $(MPG123_DIR)/build
 	touch $@
 
