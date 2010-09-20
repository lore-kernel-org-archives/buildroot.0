From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Sep 2010 16:21:20 +0200
Subject: [Buildroot] [git commit master 1/1] squashfs: bump 4.x,
	add lzo support
Message-ID: <20100920142304.895158B5C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=785fef108ebd940aeabe7e5c2d6d5f54f98e6146
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We'll need libattr/xz packages in BR to enable support for those.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    8 +-
 fs/squashfs/Config.in                              |   17 +++-
 fs/squashfs/squashfs.mk                            |    7 ++
 package/squashfs/Config.in                         |   17 ++++
 .../squashfs/squashfs-4.0-build-system-fix.patch   |   60 ------------
 .../squashfs-4.0-mksquashfs-get_nprocs.patch       |   37 -------
 ...quashfs-4.0-mksquashfs-race-condition-fix.patch |   41 --------
 .../squashfs/squashfs-4.1-build-system-fix.patch   |  102 ++++++++++++++++++++
 package/squashfs/squashfs.mk                       |   50 ++++++++--
 9 files changed, 188 insertions(+), 151 deletions(-)
 delete mode 100644 package/squashfs/squashfs-4.0-build-system-fix.patch
 delete mode 100644 package/squashfs/squashfs-4.0-mksquashfs-get_nprocs.patch
 delete mode 100644 package/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch
 create mode 100644 package/squashfs/squashfs-4.1-build-system-fix.patch

diff --git a/CHANGES b/CHANGES
index 92d06be..7ae67d9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,6 +7,8 @@
 
 	Toolchain: ARM cortex A9 support
 
+	Fs: Squashfs 4.1 with lzo support
+
 	Old-style package hooks (*_HOOK_POST_*) removed. Use the more
 	generic new-style ones instead.
 
@@ -22,9 +24,9 @@
 	lite, m4, mdadm, metacity, mysql_client, nano, nbd, ncftp,
 	neon, netperf, ntfsprogs, openntpd, openssh, openvpn, oprofile,
 	pango, pcre, php, prboom, radvd, qt, samba, sdl_sound,
-	shared-mime-info, speex, sqlite, strace, taglib, tcpdump,
-	tiff, tn5250, udev, udpcast, usbmount, usbutils, which,
-	xlib_libX11, zlib
+	shared-mime-info, speex, sqlite, squashfs, strace, taglib,
+	tcpdump, tiff, tn5250, udev, udpcast, usbmount, usbutils,
+	which, xlib_libX11, zlib
 
 	Removed packages: dillo, libglib12, libgtk12, microwin,
 	pcmcia
diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index bcc93b9..20aac08 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -19,5 +19,20 @@ config BR2_TARGET_ROOTFS_SQUASHFS3
        bool "3.x"
 
 endchoice
-endif
 
+choice
+	prompt "Compression algorithm"
+	default BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
+	depends on BR2_TARGET_ROOTFS_SQUASHFS4
+	help
+	  Select the squashfs compression algorithm to use when
+	  generating the filesystem.
+
+config BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
+       bool "gzip"
+
+config BR2_TARGET_ROOTFS_SQUASHFS4_LZO
+       bool "lzo"
+
+endchoice
+endif
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index aae22b6..311a3ee 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -6,6 +6,13 @@
 
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4),y)
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
+
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
+ROOTFS_SQUASHFS_ARGS += -comp lzo
+else
+ROOTFS_SQUASHFS_ARGS += -comp gzip
+endif
+
 else
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs3
 
diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index f83100f..e975185 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -6,5 +6,22 @@ config BR2_PACKAGE_SQUASHFS
 
 	  http://squashfs.sourceforge.net/
 
+if BR2_PACKAGE_SQUASHFS
+
+config BR2_PACKAGE_SQUASHFS_GZIP
+       bool "gzip support"
+       default y
+       select BR2_PACKAGE_GZIP
+       help
+         Support GZIP compression algorithm
+
+config BR2_PACKAGE_SQUASHFS_LZO
+       bool "lzo support"
+       select BR2_PACKAGE_LZO
+       help
+         Support LZO compression algorithm
+
+endif
+
 comment "squashfs requires a toolchain with LARGEFILE support"
 	depends on !BR2_LARGEFILE
diff --git a/package/squashfs/squashfs-4.0-build-system-fix.patch b/package/squashfs/squashfs-4.0-build-system-fix.patch
deleted file mode 100644
index 9db208b..0000000
--- a/package/squashfs/squashfs-4.0-build-system-fix.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Index: a/squashfs-tools/Makefile
-===================================================================
---- a/squashfs-tools.orig/Makefile	2009-04-19 01:47:43.000000000 +0200
-+++ b/squashfs-tools/Makefile	2009-04-19 01:52:36.000000000 +0200
-@@ -1,36 +1,48 @@
- INSTALL_DIR = /usr/local/bin
- 
- INCLUDEDIR = .
-+CFLAGS_R = -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE
-+LIBS = -lz -lpthread
- 
- CFLAGS := -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
- 
- all: mksquashfs unsquashfs
- 
- mksquashfs: mksquashfs.o read_fs.o sort.o swap.o pseudo.o
--	$(CC) mksquashfs.o read_fs.o sort.o swap.o pseudo.o -lz -lpthread -lm -o $@
-+	$(CC) $(LDFLAGS) mksquashfs.o read_fs.o sort.o swap.o pseudo.o -lz -lpthread -lm -o $@
- 
- mksquashfs.o: mksquashfs.c squashfs_fs.h mksquashfs.h global.h sort.h squashfs_swap.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- read_fs.o: read_fs.c squashfs_fs.h read_fs.h global.h squashfs_swap.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- sort.o: sort.c squashfs_fs.h global.h sort.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- swap.o: swap.c Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- pseudo.o: pseudo.c pseudo.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- unsquashfs: unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o
--	$(CC) unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o -lz -lpthread -lm -o $@
-+	$(CC) $(LDFLAGS) unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o -lz -lpthread -lm -o $@
- 
--unsquashfs.o: unsquashfs.h unsquashfs.c squashfs_fs.h squashfs_swap.h squashfs_compat.h global.h Makefile
-+unsquashfs.o: unsquashfs.c unsquashfs.h squashfs_fs.h squashfs_swap.h squashfs_compat.h global.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
--unsquash-1.o: unsquashfs.h unsquash-1.c squashfs_fs.h squashfs_compat.h global.h Makefile
-+unsquash-1.o: unsquash-1.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
--unsquash-2.o: unsquashfs.h unsquash-2.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
-+unsquash-2.o: unsquash-2.c unsquashfs.h unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
--unsquash-3.o: unsquashfs.h unsquash-3.c squashfs_fs.h squashfs_compat.h global.h Makefile
-+unsquash-3.o: unsquash-3.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
--unsquash-4.o: unsquashfs.h unsquash-4.c squashfs_fs.h squashfs_swap.h global.h Makefile
-+unsquash-4.o: unsquash-4.c unsquashfs.h squashfs_fs.h squashfs_swap.h global.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- clean:
- 	-rm -f *.o mksquashfs unsquashfs
diff --git a/package/squashfs/squashfs-4.0-mksquashfs-get_nprocs.patch b/package/squashfs/squashfs-4.0-mksquashfs-get_nprocs.patch
deleted file mode 100644
index 8a19923..0000000
--- a/package/squashfs/squashfs-4.0-mksquashfs-get_nprocs.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-[PATCH] squashfs-tools: Don't use get_nprocs()
-
-get_nprocs() is a GNU extension, not supported on E.G. uClibc. It is a
-simple wrapper around sysconf(_SC_NPROCESSORS_CONF), so use that instead.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- squashfs-tools/mksquashfs.c |    2 +-
- squashfs-tools/unsquashfs.c |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: squashfs4.0/squashfs-tools/mksquashfs.c
-===================================================================
---- squashfs4.0.orig/squashfs-tools/mksquashfs.c
-+++ squashfs4.0/squashfs-tools/mksquashfs.c
-@@ -3705,7 +3705,7 @@ void initialise_threads()
- 			processors = 1;
- 		}
- #else
--		processors = get_nprocs();
-+		processors = sysconf(_SC_NPROCESSORS_CONF);
- #endif
- 	}
- 
-Index: squashfs4.0/squashfs-tools/unsquashfs.c
-===================================================================
---- squashfs4.0.orig/squashfs-tools/unsquashfs.c
-+++ squashfs4.0/squashfs-tools/unsquashfs.c
-@@ -1811,7 +1811,7 @@ void initialise_threads(int fragment_buf
- 			processors = 1;
- 		}
- #else
--		processors = get_nprocs();
-+		processors = sysconf(_SC_NPROCESSORS_CONF);
- #endif
- 	}
- 
diff --git a/package/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch b/package/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch
deleted file mode 100644
index 7f8e8e0..0000000
--- a/package/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-[PATCH]: fix mksquashfs race condition
-
-See http://thread.gmane.org/gmane.comp.file-systems.squashfs.devel/76
-for details.
----
- squashfs-tools/mksquashfs.c |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-Index: squashfs4.0/squashfs-tools/mksquashfs.c
-===================================================================
---- squashfs4.0.orig/squashfs-tools/mksquashfs.c
-+++ squashfs4.0/squashfs-tools/mksquashfs.c
-@@ -1733,8 +1733,8 @@ void unlock_fragments()
- 		entry->buffer->block = bytes;
- 		bytes += compressed_size;
- 		fragments_outstanding --;
--		pthread_mutex_unlock(&fragment_mutex);
- 		queue_put(to_writer, entry->buffer);
-+		pthread_mutex_unlock(&fragment_mutex);
- 		pthread_mutex_lock(&fragment_mutex);
- 		TRACE("fragment_locked writing fragment %d, compressed size %d"
- 			"\n", entry->fragment, compressed_size);
-@@ -2426,8 +2426,8 @@ void *frag_deflator(void *arg)
- 			write_buffer->block = bytes;
- 			bytes += compressed_size;
- 			fragments_outstanding --;
--			pthread_mutex_unlock(&fragment_mutex);
- 			queue_put(to_writer, write_buffer);
-+			pthread_mutex_unlock(&fragment_mutex);
- 			TRACE("Writing fragment %lld, uncompressed size %d, "
- 				"compressed size %d\n", file_buffer->block,
- 				file_buffer->size, compressed_size);
-@@ -4137,7 +4137,7 @@ void read_recovery_data(char *recovery_f
- 
- 
- #define VERSION() \
--	printf("mksquashfs version 4.0 (2009/04/05)\n");\
-+	printf("mksquashfs version 4.0-test (2009/04/05)\n");\
- 	printf("copyright (C) 2009 Phillip Lougher <phillip@lougher.demon.co.uk>\n\n"); \
- 	printf("This program is free software; you can redistribute it and/or\n");\
- 	printf("modify it under the terms of the GNU General Public License\n");\
diff --git a/package/squashfs/squashfs-4.1-build-system-fix.patch b/package/squashfs/squashfs-4.1-build-system-fix.patch
new file mode 100644
index 0000000..709f1de
--- /dev/null
+++ b/package/squashfs/squashfs-4.1-build-system-fix.patch
@@ -0,0 +1,102 @@
+[PATCH]: allow custom EXTRA_CFLAGS/LDFLAGS/*_SUPPORT on the make cmd line
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ squashfs-tools/Makefile |   26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+Index: squashfs4.1/squashfs-tools/Makefile
+===================================================================
+--- squashfs4.1.orig/squashfs-tools/Makefile
++++ squashfs4.1/squashfs-tools/Makefile
+@@ -87,11 +87,11 @@ MKSQUASHFS_OBJS = mksquashfs.o read_fs.o
+ UNSQUASHFS_OBJS = unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o \
+ 	unsquash-4.o swap.o compressor.o
+ 
+-CFLAGS = $(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE \
+-	-D_GNU_SOURCE -DCOMP_DEFAULT=\"$(COMP_DEFAULT)\"  -O2 -Wall
++CFLAGS = $(EXTRA_CFLAGS) $(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE \
++	-D_GNU_SOURCE -DCOMP_DEFAULT=\"$(COMP_DEFAULT)\" -Wall
+ 
+ LIBS =
+-ifdef GZIP_SUPPORT
++ifeq ($(GZIP_SUPPORT),1)
+ CFLAGS += -DGZIP_SUPPORT
+ MKSQUASHFS_OBJS += gzip_wrapper.o
+ UNSQUASHFS_OBJS += gzip_wrapper.o
+@@ -99,7 +99,7 @@ LIBS += -lz
+ COMPRESSORS += gzip
+ endif
+ 
+-ifdef LZMA_SUPPORT
++ifeq ($(LZMA_SUPPORT),1)
+ LZMA_OBJS = $(LZMA_DIR)/C/Alloc.o $(LZMA_DIR)/C/LzFind.o \
+ 	$(LZMA_DIR)/C/LzmaDec.o $(LZMA_DIR)/C/LzmaEnc.o $(LZMA_DIR)/C/LzmaLib.o
+ INCLUDEDIR += -I$(LZMA_DIR)/C
+@@ -109,7 +109,7 @@ UNSQUASHFS_OBJS += lzma_wrapper.o $(LZMA
+ COMPRESSORS += lzma
+ endif
+ 
+-ifdef XZ_SUPPORT
++ifeq ($(XZ_SUPPORT),1)
+ CFLAGS += -DLZMA_SUPPORT
+ MKSQUASHFS_OBJS += xz_wrapper.o
+ UNSQUASHFS_OBJS += xz_wrapper.o
+@@ -117,7 +117,7 @@ LIBS += -llzma
+ COMPRESSORS += lzma
+ endif
+ 
+-ifdef LZO_SUPPORT
++ifeq ($(LZO_SUPPORT),1)
+ CFLAGS += -DLZO_SUPPORT
+ ifdef LZO_DIR
+ INCLUDEDIR += -I$(LZO_DIR)/include
+@@ -129,8 +129,8 @@ LIBS += $(LZO_LIBDIR) -llzo2
+ COMPRESSORS += lzo
+ endif
+ 
+-ifdef XATTR_SUPPORT
+-ifdef XATTR_DEFAULT
++ifeq ($(XATTR_SUPPORT),1)
++ifeq ($(XATTR_DEFAULT),1)
+ CFLAGS += -DXATTR_SUPPORT -DXATTR_DEFAULT
+ else
+ CFLAGS += -DXATTR_SUPPORT
+@@ -142,7 +142,7 @@ endif
+ #
+ # If LZMA_SUPPORT is specified then LZO_DIR must be specified too
+ #
+-ifdef LZMA_SUPPORT
++ifeq ($(LZMA_SUPPORT),1)
+ ifndef LZMA_DIR
+ $(error "LZMA_SUPPORT requires LZMA_DIR to be also defined")
+ endif
+@@ -151,8 +151,8 @@ endif
+ #
+ # Both XZ_SUPPORT and LZMA_SUPPORT cannot be specified
+ #
+-ifdef XZ_SUPPORT
+-ifdef LZMA_SUPPORT
++ifeq ($(XZ_SUPPORT),1)
++ifeq ($(LZMA_SUPPORT),1)
+ $(error "Both XZ_SUPPORT and LZMA_SUPPORT cannot be specified")
+ endif
+ endif
+@@ -175,7 +175,7 @@ endif
+ all: mksquashfs unsquashfs
+ 
+ mksquashfs: $(MKSQUASHFS_OBJS)
+-	$(CC) $(MKSQUASHFS_OBJS) -lpthread -lm $(LIBS) -o $@
++	$(CC) $(EXTRA_LDFLAGS) $(MKSQUASHFS_OBJS) -lpthread -lm $(LIBS) -o $@
+ 
+ mksquashfs.o: mksquashfs.c squashfs_fs.h mksquashfs.h global.h sort.h \
+ 	squashfs_swap.h xattr.h
+@@ -195,7 +195,7 @@ xattr.o: xattr.h
+ read_xattrs.o: xattr.h
+ 
+ unsquashfs: $(UNSQUASHFS_OBJS)
+-	$(CC) $(UNSQUASHFS_OBJS) -lpthread -lm $(LIBS) -o $@
++	$(CC) $(EXTRA_LDFLAGS) $(UNSQUASHFS_OBJS) -lpthread -lm $(LIBS) -o $@
+ 
+ unsquashfs.o: unsquashfs.h unsquashfs.c squashfs_fs.h squashfs_swap.h \
+ 	squashfs_compat.h global.h xattr.h
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 1dccb08..0332d60 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -1,30 +1,62 @@
-SQUASHFS_VERSION=4.0
+SQUASHFS_VERSION=4.1
 SQUASHFS_SOURCE=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
 
-SQUASHFS_DEPENDENCIES = zlib
-HOST_SQUASHFS_DEPENDENCIES = host-zlib
+# no libattr/xz in BR
+SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0 XZ_SUPPORT=0
+
+# we need atleast one compresser, so use gzip if lzo isn't enabled
+ifeq ($(BR2_PACKAGE_SQUASHFS_GZIP)$(if $(BR2_PACKAGE_SQUASHFS_LZO),,y),y)
+SQUASHFS_DEPENDENCIES += zlib
+SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=1
+else
+SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=0 COMP_DEFAULT=lzo
+endif
+
+ifeq ($(BR2_PACKAGE_SQUASHFS_LZO),y)
+SQUASHFS_DEPENDENCIES += lzo
+SQUASHFS_MAKE_ARGS += LZO_SUPPORT=1
+else
+SQUASHFS_MAKE_ARGS += LZO_SUPPORT=0
+endif
+
+
+HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lzo
+
+# no libattr/xz in BR
+HOST_SQUASHFS_MAKE_ARGS = \
+	XATTR_SUPPORT=0 \
+	XZ_SUPPORT=0    \
+	GZIP_SUPPORT=1  \
+	LZO_SUPPORT=1
 
 define SQUASHFS_BUILD_CMDS
  $(TARGET_MAKE_ENV) $(MAKE)    \
    CC="$(TARGET_CC)"           \
-   CFLAGS="$(TARGET_CFLAGS)"   \
-   LDFLAGS="$(TARGET_LDFLAGS)" \
+   EXTRA_CFLAGS="$(TARGET_CFLAGS)"   \
+   EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
+   $(SQUASHFS_MAKE_ARGS) \
    -C $(@D)/squashfs-tools/
 endef
 
 define SQUASHFS_INSTALL_TARGET_CMDS
- $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/ INSTALL_DIR=$(TARGET_DIR)/usr/bin install
+ $(TARGET_MAKE_ENV) $(MAKE) $(SQUASHFS_MAKE_ARGS) \
+   -C $(@D)/squashfs-tools/ INSTALL_DIR=$(TARGET_DIR)/usr/bin install
 endef
 
 define HOST_SQUASHFS_BUILD_CMDS
- $(HOST_MAKE_ENV) $(MAKE) CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" -C $(@D)/squashfs-tools/
+ $(HOST_MAKE_ENV) $(MAKE) \
+   CC="$(HOSTCC)" \
+   EXTRA_CFLAGS="$(HOST_CFLAGS)"   \
+   EXTRA_LDFLAGS="$(HOST_LDFLAGS)" \
+   $(HOST_SQUASHFS_MAKE_ARGS) \
+   -C $(@D)/squashfs-tools/
 endef
 
 define HOST_SQUASHFS_INSTALL_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
+ $(HOST_MAKE_ENV) $(MAKE) $(HOST_SQUASHFS_MAKE_ARGS) \
+   -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
 endef
 
 $(eval $(call GENTARGETS,package,squashfs))
 $(eval $(call GENTARGETS,package,squashfs,host))
-
-- 
1.7.1
