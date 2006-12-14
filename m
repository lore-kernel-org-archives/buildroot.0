From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 14 Dec 2006 08:03:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpg123
Message-ID: <20061214160341.2A2D9485F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-14 08:03:40 -0800 (Thu, 14 Dec 2006)
New Revision: 16931

Log:
- forgot to add the cross patch.


Added:
   trunk/buildroot/package/mpg123/mpg123-cross.patch


Changeset:
Added: trunk/buildroot/package/mpg123/mpg123-cross.patch
===================================================================
--- trunk/buildroot/package/mpg123/mpg123-cross.patch	2006-12-14 15:55:33 UTC (rev 16930)
+++ trunk/buildroot/package/mpg123/mpg123-cross.patch	2006-12-14 16:03:40 UTC (rev 16931)
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
