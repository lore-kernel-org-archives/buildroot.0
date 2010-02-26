From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2010 10:42:26 +0100
Subject: [Buildroot] [git commit master] squashfs: pass CFLAGS/LDFLAGS and
	add host-zlib dependency
Message-ID: <20100226094313.7A9B47775C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=be8a104c3cd65190e32aebcbc8430fb23c42361f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Squashfs depends on host-zlib, so we add this as a dependency. As
host-zlib is installed in $(HOST_DIR), we must pass $(HOST_CFLAGS) and
$(HOST_LDFLAGS).

Unfortunately, if we pass CFLAGS=$(HOST_CFLAGS), we override the
CFLAGS defined in the Makefile, and the build fails. Therefore, we
borrow a patch from OpenEmbedded to fix this problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../squashfs/squashfs-4.0-build-system-fix.patch   |   65 ++++++++++++++++++++
 target/squashfs/squashfsroot.mk                    |    4 +-
 2 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 target/squashfs/squashfs-4.0-build-system-fix.patch

diff --git a/target/squashfs/squashfs-4.0-build-system-fix.patch b/target/squashfs/squashfs-4.0-build-system-fix.patch
new file mode 100644
index 0000000..7ba0ab9
--- /dev/null
+++ b/target/squashfs/squashfs-4.0-build-system-fix.patch
@@ -0,0 +1,65 @@
+Fix the build system so that CFLAGS can be overriden on the command
+line to pass additionnal -I options.
+
+Patch borrowed from OpenEmbedded.
+
+Index: squashfs-4.0/squashfs-tools/Makefile
+===================================================================
+--- squashfs-4.0.orig/squashfs-tools.orig/Makefile	2009-04-19 01:47:43.000000000 +0200
++++ squashfs-4.0/squashfs-tools/Makefile	2009-04-19 01:52:36.000000000 +0200
+@@ -1,36 +1,48 @@
+ INSTALL_DIR = /usr/local/bin
+ 
+ INCLUDEDIR = .
++CFLAGS_R = -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE
++LIBS = -lz -lpthread
+ 
+ CFLAGS := -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
+ 
+ all: mksquashfs unsquashfs
+ 
+ mksquashfs: mksquashfs.o read_fs.o sort.o swap.o pseudo.o
+-	$(CC) mksquashfs.o read_fs.o sort.o swap.o pseudo.o -lz -lpthread -lm -o $@
++	$(CC) $(LDFLAGS) mksquashfs.o read_fs.o sort.o swap.o pseudo.o -lz -lpthread -lm -o $@
+ 
+ mksquashfs.o: mksquashfs.c squashfs_fs.h mksquashfs.h global.h sort.h squashfs_swap.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ read_fs.o: read_fs.c squashfs_fs.h read_fs.h global.h squashfs_swap.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ sort.o: sort.c squashfs_fs.h global.h sort.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ swap.o: swap.c Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ pseudo.o: pseudo.c pseudo.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ unsquashfs: unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o
+-	$(CC) unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o -lz -lpthread -lm -o $@
++	$(CC) $(LDFLAGS) unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o -lz -lpthread -lm -o $@
+ 
+-unsquashfs.o: unsquashfs.h unsquashfs.c squashfs_fs.h squashfs_swap.h squashfs_compat.h global.h Makefile
++unsquashfs.o: unsquashfs.c unsquashfs.h squashfs_fs.h squashfs_swap.h squashfs_compat.h global.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+-unsquash-1.o: unsquashfs.h unsquash-1.c squashfs_fs.h squashfs_compat.h global.h Makefile
++unsquash-1.o: unsquash-1.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+-unsquash-2.o: unsquashfs.h unsquash-2.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
++unsquash-2.o: unsquash-2.c unsquashfs.h unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+-unsquash-3.o: unsquashfs.h unsquash-3.c squashfs_fs.h squashfs_compat.h global.h Makefile
++unsquash-3.o: unsquash-3.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+-unsquash-4.o: unsquashfs.h unsquash-4.c squashfs_fs.h squashfs_swap.h global.h Makefile
++unsquash-4.o: unsquash-4.c unsquashfs.h squashfs_fs.h squashfs_swap.h global.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ clean:
+ 	-rm -f *.o mksquashfs unsquashfs
diff --git a/target/squashfs/squashfsroot.mk b/target/squashfs/squashfsroot.mk
index ebb0cd2..63adc5c 100644
--- a/target/squashfs/squashfsroot.mk
+++ b/target/squashfs/squashfsroot.mk
@@ -18,9 +18,9 @@ $(SQUASHFS_DIR)/.unpacked: $(DL_DIR)/$(SQUASHFS_SOURCE) #$(SQUASHFS_PATCH)
 	touch $@
 
 $(SQUASHFS_DIR)/squashfs-tools/mksquashfs: $(SQUASHFS_DIR)/.unpacked
-	$(MAKE) -C $(SQUASHFS_DIR)/squashfs-tools
+	$(MAKE) CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" -C $(SQUASHFS_DIR)/squashfs-tools
 
-squashfs: $(SQUASHFS_DIR)/squashfs-tools/mksquashfs
+squashfs: host-zlib $(SQUASHFS_DIR)/squashfs-tools/mksquashfs
 
 squashfs-source: $(DL_DIR)/$(SQUASHFS_SOURCE)
 
-- 
1.6.3.3
