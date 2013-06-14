From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Jun 2013 15:14:46 -0300
Subject: [Buildroot] [PATCH] iozone: fixup build system
Message-ID: <1371233686-24012-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixup iozone's build system to make it somewhat more flexible.
First make our own linux targets for non-AIO toolchains (uClibc) and
non-threading.
And second, just ditch forced largefile support and expect it from
CFLAGS.
Otherwise using the generic target caused issues like:
http://autobuild.buildroot.net/results/19f606f2978dc3c8039b1bccfcc562b4050083c7/
...which is fixed by this.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iozone/Config.in            |  4 --
 package/iozone/iozone-targets.patch | 92 +++++++++++++++++++++++++++++++++++++
 package/iozone/iozone.mk            | 13 +++---
 3 files changed, 98 insertions(+), 11 deletions(-)
 create mode 100644 package/iozone/iozone-targets.patch

diff --git a/package/iozone/Config.in b/package/iozone/Config.in
index 5481ca1..26d4daa 100644
--- a/package/iozone/Config.in
+++ b/package/iozone/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_IOZONE
 	bool "iozone"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	help
 	  IOzone is a filesystem benchmark tool.
 	  The benchmark generates and measures a variety of file operations
 
 	  http://www.iozone.org/
-
-comment "IOzone requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
diff --git a/package/iozone/iozone-targets.patch b/package/iozone/iozone-targets.patch
new file mode 100644
index 0000000..258b960
--- /dev/null
+++ b/package/iozone/iozone-targets.patch
@@ -0,0 +1,92 @@
+Add new targets for iozone:
+
+linux-noaio is for linux targets without AIO (use case: uClibc)
+linux-noth is for linux target without threads or AIO
+
+And make largefile support optional via CFLAGS.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura iozone3_414.orig/src/current/makefile iozone3_414/src/current/makefile
+--- iozone3_414.orig/src/current/makefile	2013-06-11 09:48:18.257837091 -0300
++++ iozone3_414/src/current/makefile	2013-06-11 13:05:56.338162144 -0300
+@@ -166,10 +166,28 @@
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
+ #
+ linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
+-	$(CC)  -O3 $(LDFLAGS) iozone_linux.o libasync.o libbif.o -lpthread \
++	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux.o libasync.o libbif.o \
++		-lpthread -lrt -o iozone
++	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
++	$(CC)  $(CFLAGS) -Dlinux pit_server.o -o pit_server
++
++#
++# GNU 'C' compiler Linux build with threads, largefiles
++#
++linux-noaio: iozone_linux-noaio.o libbif.o fileop_linux.o pit_server.o
++	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noaio.o libbif.o \
++		-lpthread -lrt -o iozone
++	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
++	$(CC)  $(CFLAGS) -Dlinux pit_server.o -o pit_server
++
++#
++# GNU 'C' compiler Linux build with largefiles
++#
++linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
++	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noth.o libbif.o \
+ 		-lrt -o iozone
+-	$(CC)  -O3 -Dlinux fileop_linux.o -o fileop
+-	$(CC)  -O3 -Dlinux pit_server.o -o pit_server
++	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
++	$(CC)  $(CFLAGS) -Dlinux pit_server.o -o pit_server
+ 
+ #
+ # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
+@@ -795,13 +813,33 @@
+ 	@echo ""
+ 	@echo "Building iozone for Linux"
+ 	@echo ""
+-	$(CC) -Wall -c -O3 -Dunix -DHAVE_ANSIC_C -DASYNC_IO -DHAVE_PREAD \
+-		-DSHARED_MEM -Dlinux -D_LARGEFILE64_SOURCE $(CFLAGS) iozone.c \
++	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C -DASYNC_IO -DHAVE_PREAD \
++		-DSHARED_MEM -Dlinux $(CFLAGS) iozone.c \
+ 		-DNAME='"linux"' -o iozone_linux.o
+-	$(CC) -Wall -c -O3 -Dunix -DHAVE_ANSIC_C -DASYNC_IO -D_LARGEFILE64_SOURCE \
++	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C -DASYNC_IO \
++		-DSHARED_MEM -Dlinux $(CFLAGS) libbif.c -o libbif.o
++	$(CC) -Wall -c -Dunix -Dlinux -DHAVE_ANSIC_C -DASYNC_IO \
++		$(CFLAGS) libasync.c  -o libasync.o 
++
++iozone_linux-noaio.o: iozone.c libbif.c
++	@echo ""
++	@echo "Building iozone for Linux no AIO"
++	@echo ""
++	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C -DHAVE_PREAD \
++		-DSHARED_MEM -Dlinux $(CFLAGS) iozone.c \
++		-DNAME='"linux"' -o iozone_linux-noaio.o
++	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C \
++		-DSHARED_MEM -Dlinux $(CFLAGS) libbif.c -o libbif.o
++
++iozone_linux-noth.o: iozone.c libbif.c
++	@echo ""
++	@echo "Building iozone for Linux with no threads"
++	@echo ""
++	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C -DNO_THREADS -DHAVE_PREAD \
++		-DSHARED_MEM -Dlinux $(CFLAGS) iozone.c \
++		-DNAME='"linux"' -o iozone_linux-noth.o
++	$(CC) -Wall -c -Dunix -DHAVE_ANSIC_C -DNO_THREADS \
+ 		-DSHARED_MEM -Dlinux $(CFLAGS) libbif.c -o libbif.o
+-	$(CC) -Wall -c -O3 -Dunix -Dlinux -DHAVE_ANSIC_C -DASYNC_IO \
+-		-D_LARGEFILE64_SOURCE $(CFLAGS) libasync.c  -o libasync.o 
+ 
+ fileop_AIX.o:	fileop.c
+ 	@echo ""
+@@ -893,7 +931,7 @@
+ 	@echo ""
+ 	@echo "Building fileop for Linux"
+ 	@echo ""
+-	$(CC) -Wall -c -O3 $(CFLAGS) fileop.c -o fileop_linux.o
++	$(CC) -Wall -c $(CFLAGS) fileop.c -o fileop_linux.o
+ 
+ fileop_openbsd.o:	fileop.c
+ 	@echo ""
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index eb0a6d8..970e509 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -11,13 +11,12 @@ IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
 # IOzone license details can be found at:
 # http://www.iozone.org/docs/Iozone_License.txt
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
-# aio.h is not available on uClibc. Select "generic" target that does not use it.
-IOZONE_TARGET = generic
-else ifeq ($(BR2_powerpc),y)
-IOZONE_TARGET = linux-powerpc
-else ifeq ($(BR2_sparc),y)
-IOZONE_TARGET = linux-sparc
+# No threading target is non-AIO as well
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+IOZONE_TARGET = linux-noth
+# AIO support not available on uClibc, use the linux (non-aio) target.
+else ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+IOZONE_TARGET = linux-noaio
 else
 IOZONE_TARGET = linux
 endif
-- 
1.8.1.5
