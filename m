From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 03:40:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/avahi package/gmp
	target/cloop t etc...
Message-ID: <20070821104021.54585A6137@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 03:40:18 -0700 (Tue, 21 Aug 2007)
New Revision: 19604

Log:
- a few more cleanups (Cristian Ionescu-Idbohrn)


Modified:
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/target/cloop/cloop.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/toolchain/elf2flt/elf2flt.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-08-21 10:32:55 UTC (rev 19603)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-08-21 10:40:18 UTC (rev 19604)
@@ -41,7 +41,7 @@
 $(AVAHI_DIR)/.unpacked: $(DL_DIR)/$(AVAHI_SOURCE)
 	$(AVAHI_CAT) $(DL_DIR)/$(AVAHI_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(AVAHI_DIR) package/avahi/ \*.patch
-	touch $(AVAHI_DIR)/.unpacked
+	touch $@
 
 $(AVAHI_DIR)/.configured: $(AVAHI_DIR)/.unpacked $(AVAHI_EXPAT_DEP)
 	(cd $(AVAHI_DIR) && rm -rf config.cache && autoconf)
@@ -140,11 +140,11 @@
 		--with-autoipd-user=default \
 		--with-autoipd-group=default \
 	);
-	touch $(AVAHI_DIR)/.configured
+	touch $@
 
 $(AVAHI_DIR)/.compiled: $(AVAHI_DIR)/.configured
 	$(MAKE) -C $(AVAHI_DIR)
-	touch $(AVAHI_DIR)/.compiled
+	touch $@
 
 $(STAGING_DIR)/usr/sbin/avahi-autoipd: $(AVAHI_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR)/avahi-autoipd install

Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-08-21 10:32:55 UTC (rev 19603)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-08-21 10:40:18 UTC (rev 19604)
@@ -13,7 +13,7 @@
 GMP_HOST_BINARY:=libgmp$(HOST_SHREXT)
 GMP_LIBVERSION:=3.4.1
 
-# this is a workaround for a bug in GMP, please see 
+# this is a workaround for a bug in GMP, please see
 # http://gmplib.org/list-archives/gmp-devel/2006-April/000618.html
 ifeq ($(HOST_EXEEXT),.exe)
 GMP_CPP_FLAGS:=CPPFLAGS=-DDLL_EXPORT

Modified: trunk/buildroot/target/cloop/cloop.mk
===================================================================
--- trunk/buildroot/target/cloop/cloop.mk	2007-08-21 10:32:55 UTC (rev 19603)
+++ trunk/buildroot/target/cloop/cloop.mk	2007-08-21 10:40:18 UTC (rev 19604)
@@ -18,20 +18,20 @@
 CLOOP_TARGET:=$(IMAGE).cloop
 ### Note: not used yet! ck
 ### $(DL_DIR)/$(CLOOP_PATCH1):
-### 	$(WGET) -P $(DL_DIR) $(CLOOP_PATCH1_URL)/$(CLOOP_PATCH1)
+###	$(WGET) -P $(DL_DIR) $(CLOOP_PATCH1_URL)/$(CLOOP_PATCH1)
 
 $(DL_DIR)/$(CLOOP_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(CLOOP_SITE)/$(CLOOP_SOURCE)
 
 $(CLOOP_DIR)/.unpacked: $(DL_DIR)/$(CLOOP_SOURCE) ### $(DL_DIR)/$(CLOOP_PATCH1)
 	$(ZCAT) $(DL_DIR)/$(CLOOP_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	touch $(CLOOP_DIR)/.unpacked
+	touch $@
 ###		$(ZCAT) $(DL_DIR)/$(CLOOP_PATCH1) | patch -p1 -d $(CLOOP_DIR)
 ###		toolchain/patch-kernel.sh $(CLOOP_DIR) target/cloop/ cloop*.patch
 
 $(CLOOP_DIR)/create_compressed_fs: $(CLOOP_DIR)/.unpacked
 	$(MAKE) CFLAGS="-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DUSE_ERROR_SILENT" -C $(CLOOP_DIR) \
-		APPSONLY=yes -j1 
+		APPSONLY=yes -j1
 
 cloop: $(CLOOP_DIR)/create_compressed_fs
 
@@ -51,7 +51,7 @@
 
 $(CLOOP_DIR)/cloop.o: $(CLOOP_DIR)/create_compressed_fs
 	$(MAKE) CFLAGS="-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DUSE_ERROR_SILENT" -C $(CLOOP_DIR) -j1
- 
+
 cloop-module: $(CLOOP_DIR)/cloop.o
 
 #############################################################
@@ -62,13 +62,13 @@
 # required:
 # mkisofs 2.01a34-unofficial-iconv from http://users.utu.fi/jahhein/mkisofs/
 # optional:
-# symlinks: scan/change symbolic links - v1.2 - by Mark Lord 
+# symlinks: scan/change symbolic links - v1.2 - by Mark Lord
 #           from ftp://ftp.ibiblio.org/pub/Linux/utils/file/
 #
 #############################################################
 
 ### Note: target/default/device_table.txt is not yet supported! ck
-# the quickfix is to use sudo to mount the previous created cramroot 
+# the quickfix is to use sudo to mount the previous created cramroot
 check-tools:
 	which mkisofs
 	- which symlinks
@@ -119,4 +119,3 @@
 # 1448 -rw-r--r--    1 claus users 1482752 Mar 13 16:52 root_fs_powerpc.cramfs
 # 1840 -rw-r--r--    1 claus users 1883408 Mar 13 13:14 root_fs_powerpc.jffs2
 #############################################################
-

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2007-08-21 10:32:55 UTC (rev 19603)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2007-08-21 10:40:18 UTC (rev 19604)
@@ -22,7 +22,7 @@
 
 $(CRAMFS_DIR)/mkcramfs: $(CRAMFS_DIR)
 	$(MAKE) CFLAGS="-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" -C $(CRAMFS_DIR);
-	touch -c $(CRAMFS_DIR)/mkcramfs
+	touch -c $@
 
 cramfs: $(CRAMFS_DIR)/mkcramfs
 

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2007-08-21 10:32:55 UTC (rev 19603)
+++ trunk/buildroot/target/ext2/ext2root.mk	2007-08-21 10:40:18 UTC (rev 19604)
@@ -14,7 +14,7 @@
 $(GENEXT2_DIR)/.unpacked: $(DL_DIR)/$(GENEXT2_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(GENEXT2_SOURCE) | tar -C $(BUILD_DIR) -xvf -
 	toolchain/patch-kernel.sh $(GENEXT2_DIR) target/ext2/ genext2fs\*.patch
-	touch $(GENEXT2_DIR)/.unpacked
+	touch $@
 
 $(GENEXT2_DIR)/.configured: $(GENEXT2_DIR)/.unpacked
 	chmod a+x $(GENEXT2_DIR)/configure
@@ -23,12 +23,12 @@
 		CC="$(HOSTCC)" \
 		--prefix=$(STAGING_DIR) \
 	);
-	touch  $(GENEXT2_DIR)/.configured
+	touch $@
 
 $(GENEXT2_DIR)/genext2fs: $(GENEXT2_DIR)/.configured
 	$(MAKE) CFLAGS="-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE \
-		-D_FILE_OFFSET_BITS=64" -C $(GENEXT2_DIR);
-	touch -c $(GENEXT2_DIR)/genext2fs
+		-D_FILE_OFFSET_BITS=64" -C $(GENEXT2_DIR)
+	touch -c $@
 
 genext2fs: $(GENEXT2_DIR)/genext2fs
 

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2007-08-21 10:32:55 UTC (rev 19603)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2007-08-21 10:40:18 UTC (rev 19604)
@@ -15,7 +15,7 @@
 $(SQUASHFS_DIR)/.unpacked: $(DL_DIR)/$(SQUASHFS_SOURCE) #$(SQUASHFS_PATCH)
 	$(SQUASHFS_CAT) $(DL_DIR)/$(SQUASHFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
 	toolchain/patch-kernel.sh $(SQUASHFS_DIR) target/squashfs/ squashfs\*.patch
-	touch $(SQUASHFS_DIR)/.unpacked
+	touch $@
 
 $(SQUASHFS_DIR)/squashfs-tools/mksquashfs: $(SQUASHFS_DIR)/.unpacked
 	$(MAKE) -C $(SQUASHFS_DIR)/squashfs-tools;

Modified: trunk/buildroot/toolchain/elf2flt/elf2flt.mk
===================================================================
--- trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2007-08-21 10:32:55 UTC (rev 19603)
+++ trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2007-08-21 10:40:18 UTC (rev 19604)
@@ -11,7 +11,7 @@
 
 $(ELF2FLT_DIR)/.unpacked:
 	cp -r toolchain/elf2flt/elf2flt "$(TOOL_BUILD_DIR)/elf2flt"
-	touch $(ELF2FLT_DIR)/.unpacked
+	touch $@
 
 $(ELF2FLT_DIR)/.patched: $(ELF2FLT_DIR)/.unpacked
 ifeq ($(strip $(ARCH)),nios2)
@@ -19,7 +19,7 @@
 	$(SED) "s,CROSS_COMPILE_PREFIX,$(REAL_GNU_TARGET_NAME),g;" toolchain/elf2flt/elf2flt.nios2.conditional
 	toolchain/patch-kernel.sh $(ELF2FLT_DIR) toolchain/elf2flt elf2flt.nios2.conditional
 endif
-	touch $(ELF2FLT_DIR)/.patched
+	touch $@
 
 $(ELF2FLT_DIR)/.configured: $(ELF2FLT_DIR)/.patched
 	(cd $(ELF2FLT_DIR); rm -rf config.cache; \
@@ -30,7 +30,7 @@
 		--with-libbfd=$(BINUTILS_DIR1)/bfd/libbfd.a \
 		--with-libiberty=$(BINUTILS_DIR1)/libiberty/libiberty.a \
 		--prefix=$(STAGING_DIR))
-	touch $(ELF2FLT_DIR)/.configured
+	touch $@
 
 $(ELF2FLT_DIR)/$(ELF2FLT_BINARY): $(ELF2FLT_DIR)/.configured
 	$(MAKE) -C $(ELF2FLT_DIR) all
