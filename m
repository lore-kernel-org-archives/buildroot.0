From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 20:56:06 +0200
Subject: [Buildroot] [git commit] bzip2: Fix build system to build object
	files twice
Message-ID: <20130605191224.AAD739A95B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11e9c455be3a0587fa434647800e7a3ce1bb2bf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build problems on MIPS

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bzip2/bzip2-build-objects-twice.patch |   56 +++++++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/package/bzip2/bzip2-build-objects-twice.patch b/package/bzip2/bzip2-build-objects-twice.patch
new file mode 100644
index 0000000..9bde0f6
--- /dev/null
+++ b/package/bzip2/bzip2-build-objects-twice.patch
@@ -0,0 +1,56 @@
+Build objects twice for shared and static libraries
+
+The existing Makefile causes problems on MIPS because the same object
+files (not compiled with -fPIC) are used in static and shared libraries.
+MIPS will refuce to link non-pic objects in shared libraries.
+We fix this problems by creating a new rule for the shared library
+and build the shared objects as *.sho instead of *.o.
+Then, we use these objects to create the shared library.
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+Index: bzip2-1.0.6/Makefile-libbz2_so
+===================================================================
+--- bzip2-1.0.6.orig/Makefile-libbz2_so
++++ bzip2-1.0.6/Makefile-libbz2_so
+@@ -25,13 +25,13 @@ SHELL=/bin/sh
+ CC=gcc
+ override CFLAGS += -fpic -fPIC -Wall
+ 
+-OBJS= blocksort.o  \
+-      huffman.o    \
+-      crctable.o   \
+-      randtable.o  \
+-      compress.o   \
+-      decompress.o \
+-      bzlib.o
++OBJS= blocksort.sho  \
++      huffman.sho    \
++      crctable.sho   \
++      randtable.sho  \
++      compress.sho   \
++      decompress.sho \
++      bzlib.sho
+ 
+ all: $(OBJS)
+ 	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.6 $(OBJS)
+@@ -45,17 +45,5 @@ install:
+ clean: 
+ 	rm -f $(OBJS) bzip2.o libbz2.so.1.0.6 libbz2.so.1.0 bzip2-shared
+ 
+-blocksort.o: blocksort.c
+-	$(CC) $(CFLAGS) -c blocksort.c
+-huffman.o: huffman.c
+-	$(CC) $(CFLAGS) -c huffman.c
+-crctable.o: crctable.c
+-	$(CC) $(CFLAGS) -c crctable.c
+-randtable.o: randtable.c
+-	$(CC) $(CFLAGS) -c randtable.c
+-compress.o: compress.c
+-	$(CC) $(CFLAGS) -c compress.c
+-decompress.o: decompress.c
+-	$(CC) $(CFLAGS) -c decompress.c
+-bzlib.o: bzlib.c
+-	$(CC) $(CFLAGS) -c bzlib.c
++%.sho: %.c
++	$(CC) $(CFLAGS) -o $@ -c $<
