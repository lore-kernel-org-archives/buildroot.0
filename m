From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 10:35:14 +0200
Subject: [Buildroot] [git commit] iozone: bump to version 3_482
Message-ID: <20180930084530.E142988E82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb2478086b9135ef9e4c001f5df9d788e762bbc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reworked patch from Gustavo Zacharias to make it apply to this version

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...patch => 0001-Add-new-targets-for-iozone.patch} | 47 +++++++++++++---------
 package/iozone/iozone.hash                         |  2 +-
 package/iozone/iozone.mk                           |  2 +-
 3 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/package/iozone/0001-targets.patch b/package/iozone/0001-Add-new-targets-for-iozone.patch
similarity index 63%
rename from package/iozone/0001-targets.patch
rename to package/iozone/0001-Add-new-targets-for-iozone.patch
index 258b960928..e6bfc18de6 100644
--- a/package/iozone/0001-targets.patch
+++ b/package/iozone/0001-Add-new-targets-for-iozone.patch
@@ -1,4 +1,7 @@
-Add new targets for iozone:
+From 1584ffbfda3277b82997b9f1e0ef31a7061560e0 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sun, 26 Aug 2018 18:39:06 +0200
+Subject: [PATCH] Add new targets for iozone:
 
 linux-noaio is for linux targets without AIO (use case: uClibc)
 linux-noth is for linux target without threads or AIO
@@ -6,11 +9,16 @@ linux-noth is for linux target without threads or AIO
 And make largefile support optional via CFLAGS.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ src/current/makefile | 56 +++++++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 47 insertions(+), 9 deletions(-)
 
-diff -Nura iozone3_414.orig/src/current/makefile iozone3_414/src/current/makefile
---- iozone3_414.orig/src/current/makefile	2013-06-11 09:48:18.257837091 -0300
-+++ iozone3_414/src/current/makefile	2013-06-11 13:05:56.338162144 -0300
-@@ -166,10 +166,28 @@
+diff --git a/src/current/makefile b/src/current/makefile
+index cfef879..7925e62 100644
+--- a/src/current/makefile
++++ b/src/current/makefile
+@@ -168,10 +168,28 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
  #
  linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
@@ -42,46 +50,46 @@ diff -Nura iozone3_414.orig/src/current/makefile iozone3_414/src/current/makefil
  
  #
  # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
-@@ -795,13 +813,33 @@
+@@ -814,13 +832,33 @@ iozone_linux.o:	iozone.c libbif.c libasync.c
  	@echo ""
  	@echo "Building iozone for Linux"
  	@echo ""
--	$(CC) -Wall -c -O3 -Dunix -DHAVE_ANSIC_C -DASYNC_IO -DHAVE_PREAD \
+-	$(CC) -Wmissing-prototypes -Wall -c -O3 -Dunix -DHAVE_ANSIC_C -DASYNC_IO -DHAVE_PREAD \
 -		-DSHARED_MEM -Dlinux -D_LARGEFILE64_SOURCE $(CFLAGS) iozone.c \
-+	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C -DASYNC_IO -DHAVE_PREAD \
++	$(CC) -Wmissing-prototypes -Wall -c -Dunix -DHAVE_ANSIC_C -DASYNC_IO -DHAVE_PREAD \
 +		-DSHARED_MEM -Dlinux $(CFLAGS) iozone.c \
  		-DNAME='"linux"' -o iozone_linux.o
--	$(CC) -Wall -c -O3 -Dunix -DHAVE_ANSIC_C -DASYNC_IO -D_LARGEFILE64_SOURCE \
-+	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C -DASYNC_IO \
+-	$(CC) -Wmissing-prototypes -Wall -c -O3 -Dunix -DHAVE_ANSIC_C -DASYNC_IO -D_LARGEFILE64_SOURCE \
++	$(CC) -Wmissing-prototypes -Wall -c -Dunix -DHAVE_ANSIC_C -DASYNC_IO \
 +		-DSHARED_MEM -Dlinux $(CFLAGS) libbif.c -o libbif.o
-+	$(CC) -Wall -c -Dunix -Dlinux -DHAVE_ANSIC_C -DASYNC_IO \
-+		$(CFLAGS) libasync.c  -o libasync.o 
++	$(CC) -Wmissing-prototypes -Wall -c -Dunix -Dlinux -DHAVE_ANSIC_C -DASYNC_IO \
++		$(CFLAGS) libasync.c  -o libasync.o
 +
 +iozone_linux-noaio.o: iozone.c libbif.c
 +	@echo ""
 +	@echo "Building iozone for Linux no AIO"
 +	@echo ""
-+	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C -DHAVE_PREAD \
++	$(CC) -Wmissing-prototypes -Wall -c -Dunix -DHAVE_ANSIC_C -DHAVE_PREAD \
 +		-DSHARED_MEM -Dlinux $(CFLAGS) iozone.c \
 +		-DNAME='"linux"' -o iozone_linux-noaio.o
-+	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C \
++	$(CC) -Wmissing-prototypes -Wall -c -Dunix -DHAVE_ANSIC_C \
 +		-DSHARED_MEM -Dlinux $(CFLAGS) libbif.c -o libbif.o
 +
 +iozone_linux-noth.o: iozone.c libbif.c
 +	@echo ""
 +	@echo "Building iozone for Linux with no threads"
 +	@echo ""
-+	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C -DNO_THREADS -DHAVE_PREAD \
++	$(CC) -Wmissing-prototypes -Wall -c -Dunix -DHAVE_ANSIC_C -DNO_THREADS -DHAVE_PREAD \
 +		-DSHARED_MEM -Dlinux $(CFLAGS) iozone.c \
 +		-DNAME='"linux"' -o iozone_linux-noth.o
-+	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C -DNO_THREADS \
++	$(CC) -Wmissing-prototypes -Wall -c -Dunix -DHAVE_ANSIC_C -DNO_THREADS \
  		-DSHARED_MEM -Dlinux $(CFLAGS) libbif.c -o libbif.o
--	$(CC) -Wall -c -O3 -Dunix -Dlinux -DHAVE_ANSIC_C -DASYNC_IO \
+-	$(CC) -Wmissing-prototypes -Wall -c -O3 -Dunix -Dlinux -DHAVE_ANSIC_C -DASYNC_IO \
 -		-D_LARGEFILE64_SOURCE $(CFLAGS) libasync.c  -o libasync.o 
  
  fileop_AIX.o:	fileop.c
  	@echo ""
-@@ -893,7 +931,7 @@
+@@ -924,7 +962,7 @@ fileop_linux.o:	fileop.c
  	@echo ""
  	@echo "Building fileop for Linux"
  	@echo ""
@@ -90,3 +98,6 @@ diff -Nura iozone3_414.orig/src/current/makefile iozone3_414/src/current/makefil
  
  fileop_openbsd.o:	fileop.c
  	@echo ""
+-- 
+2.7.4
+
diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index b387588fd6..8f552ba3f3 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	bbbda98d7c052d8654ea23fb2187d831107ab4ac89842fa21509276d9a6915f0	iozone3_446.tar
+sha256	2733feb63c96f77177c68f3d938f2294d5394d8554b2767c45cbe138b2f3ae30	iozone3_482.tar
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 477a60a3bb..05b3973fa0 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3_446
+IOZONE_VERSION = 3_482
 IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
