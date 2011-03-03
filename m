From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 Mar 2011 11:50:24 +0100
Subject: [Buildroot] [git commit master 1/1] squashfs: bump version
Message-ID: <20110303105127.C38E88E279@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=313c3d0f39e19e08499a529c73875841d7ddff98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The EXTRA_CFLAGS patch is now upstream, but we need a fix for !gzip builds
instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/squashfs/squashfs.mk                            |    2 +-
 .../squashfs/squashfs-4.1-build-system-fix.patch   |  102 --------------------
 package/squashfs/squashfs-4.2-no-gzip-fix.patch    |   26 +++++
 package/squashfs/squashfs.mk                       |    4 +-
 4 files changed, 29 insertions(+), 105 deletions(-)
 delete mode 100644 package/squashfs/squashfs-4.1-build-system-fix.patch
 create mode 100644 package/squashfs/squashfs-4.2-no-gzip-fix.patch

diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 7efe979..91a7534 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -11,7 +11,7 @@ ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
 ROOTFS_SQUASHFS_ARGS += -comp lzo
 else
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZMA),y)
-ROOTFS_SQUASHFS_ARGS += -comp lzma
+ROOTFS_SQUASHFS_ARGS += -comp xz
 else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
diff --git a/package/squashfs/squashfs-4.1-build-system-fix.patch b/package/squashfs/squashfs-4.1-build-system-fix.patch
deleted file mode 100644
index 709f1de..0000000
--- a/package/squashfs/squashfs-4.1-build-system-fix.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-[PATCH]: allow custom EXTRA_CFLAGS/LDFLAGS/*_SUPPORT on the make cmd line
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- squashfs-tools/Makefile |   26 +++++++++++++-------------
- 1 file changed, 13 insertions(+), 13 deletions(-)
-
-Index: squashfs4.1/squashfs-tools/Makefile
-===================================================================
---- squashfs4.1.orig/squashfs-tools/Makefile
-+++ squashfs4.1/squashfs-tools/Makefile
-@@ -87,11 +87,11 @@ MKSQUASHFS_OBJS = mksquashfs.o read_fs.o
- UNSQUASHFS_OBJS = unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o \
- 	unsquash-4.o swap.o compressor.o
- 
--CFLAGS = $(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE \
--	-D_GNU_SOURCE -DCOMP_DEFAULT=\"$(COMP_DEFAULT)\"  -O2 -Wall
-+CFLAGS = $(EXTRA_CFLAGS) $(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE \
-+	-D_GNU_SOURCE -DCOMP_DEFAULT=\"$(COMP_DEFAULT)\" -Wall
- 
- LIBS =
--ifdef GZIP_SUPPORT
-+ifeq ($(GZIP_SUPPORT),1)
- CFLAGS += -DGZIP_SUPPORT
- MKSQUASHFS_OBJS += gzip_wrapper.o
- UNSQUASHFS_OBJS += gzip_wrapper.o
-@@ -99,7 +99,7 @@ LIBS += -lz
- COMPRESSORS += gzip
- endif
- 
--ifdef LZMA_SUPPORT
-+ifeq ($(LZMA_SUPPORT),1)
- LZMA_OBJS = $(LZMA_DIR)/C/Alloc.o $(LZMA_DIR)/C/LzFind.o \
- 	$(LZMA_DIR)/C/LzmaDec.o $(LZMA_DIR)/C/LzmaEnc.o $(LZMA_DIR)/C/LzmaLib.o
- INCLUDEDIR += -I$(LZMA_DIR)/C
-@@ -109,7 +109,7 @@ UNSQUASHFS_OBJS += lzma_wrapper.o $(LZMA
- COMPRESSORS += lzma
- endif
- 
--ifdef XZ_SUPPORT
-+ifeq ($(XZ_SUPPORT),1)
- CFLAGS += -DLZMA_SUPPORT
- MKSQUASHFS_OBJS += xz_wrapper.o
- UNSQUASHFS_OBJS += xz_wrapper.o
-@@ -117,7 +117,7 @@ LIBS += -llzma
- COMPRESSORS += lzma
- endif
- 
--ifdef LZO_SUPPORT
-+ifeq ($(LZO_SUPPORT),1)
- CFLAGS += -DLZO_SUPPORT
- ifdef LZO_DIR
- INCLUDEDIR += -I$(LZO_DIR)/include
-@@ -129,8 +129,8 @@ LIBS += $(LZO_LIBDIR) -llzo2
- COMPRESSORS += lzo
- endif
- 
--ifdef XATTR_SUPPORT
--ifdef XATTR_DEFAULT
-+ifeq ($(XATTR_SUPPORT),1)
-+ifeq ($(XATTR_DEFAULT),1)
- CFLAGS += -DXATTR_SUPPORT -DXATTR_DEFAULT
- else
- CFLAGS += -DXATTR_SUPPORT
-@@ -142,7 +142,7 @@ endif
- #
- # If LZMA_SUPPORT is specified then LZO_DIR must be specified too
- #
--ifdef LZMA_SUPPORT
-+ifeq ($(LZMA_SUPPORT),1)
- ifndef LZMA_DIR
- $(error "LZMA_SUPPORT requires LZMA_DIR to be also defined")
- endif
-@@ -151,8 +151,8 @@ endif
- #
- # Both XZ_SUPPORT and LZMA_SUPPORT cannot be specified
- #
--ifdef XZ_SUPPORT
--ifdef LZMA_SUPPORT
-+ifeq ($(XZ_SUPPORT),1)
-+ifeq ($(LZMA_SUPPORT),1)
- $(error "Both XZ_SUPPORT and LZMA_SUPPORT cannot be specified")
- endif
- endif
-@@ -175,7 +175,7 @@ endif
- all: mksquashfs unsquashfs
- 
- mksquashfs: $(MKSQUASHFS_OBJS)
--	$(CC) $(MKSQUASHFS_OBJS) -lpthread -lm $(LIBS) -o $@
-+	$(CC) $(EXTRA_LDFLAGS) $(MKSQUASHFS_OBJS) -lpthread -lm $(LIBS) -o $@
- 
- mksquashfs.o: mksquashfs.c squashfs_fs.h mksquashfs.h global.h sort.h \
- 	squashfs_swap.h xattr.h
-@@ -195,7 +195,7 @@ xattr.o: xattr.h
- read_xattrs.o: xattr.h
- 
- unsquashfs: $(UNSQUASHFS_OBJS)
--	$(CC) $(UNSQUASHFS_OBJS) -lpthread -lm $(LIBS) -o $@
-+	$(CC) $(EXTRA_LDFLAGS) $(UNSQUASHFS_OBJS) -lpthread -lm $(LIBS) -o $@
- 
- unsquashfs.o: unsquashfs.h unsquashfs.c squashfs_fs.h squashfs_swap.h \
- 	squashfs_compat.h global.h xattr.h
diff --git a/package/squashfs/squashfs-4.2-no-gzip-fix.patch b/package/squashfs/squashfs-4.2-no-gzip-fix.patch
new file mode 100644
index 0000000..4cb5f50
--- /dev/null
+++ b/package/squashfs/squashfs-4.2-no-gzip-fix.patch
@@ -0,0 +1,26 @@
+[PATCH] squashfs-tools: unbreak builds without gzip support
+
+The initialization of gzip_comp_ops if gzip support is disabled is
+missing 2 null pointers, causing the id element to be initialized to 0
+rather than ZLIB_COMPRESSION, which breaks all the compressor functions
+as they loop until finding the correct element or id = 0.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ squashfs-tools/compressor.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: squashfs4.2/squashfs-tools/compressor.c
+===================================================================
+--- squashfs4.2.orig/squashfs-tools/compressor.c
++++ squashfs4.2/squashfs-tools/compressor.c
+@@ -27,7 +27,8 @@
+ 
+ #ifndef GZIP_SUPPORT
+ static struct compressor gzip_comp_ops =  {
+-	NULL, NULL, NULL, NULL, NULL, NULL, ZLIB_COMPRESSION, "gzip", 0
++	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ZLIB_COMPRESSION,
++	"gzip", 0
+ };
+ #else
+ extern struct compressor gzip_comp_ops;
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 50e8964..5000a8c 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -1,4 +1,4 @@
-SQUASHFS_VERSION=4.1
+SQUASHFS_VERSION=4.2
 SQUASHFS_SOURCE=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
 
@@ -7,7 +7,7 @@ SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
 
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZMA),y)
 SQUASHFS_DEPENDENCIES += xz
-SQUASHFS_MAKE_ARGS += XZ_SUPPORT=1 COMP_DEFAULT=lzma
+SQUASHFS_MAKE_ARGS += XZ_SUPPORT=1 COMP_DEFAULT=xz
 else
 SQUASHFS_MAKE_ARGS += XZ_SUPPORT=0
 endif
-- 
1.7.3.4
