From: Michael Roth <mroth@nessie.de>
Date: Thu, 26 Mar 2009 22:34:36 +0100
Subject: [Buildroot] [PATCH 2/5] mtd-utils: Added mtd-utils-1.2.0
In-Reply-To: <1238103279-8040-1-git-send-email-mroth@nessie.de>
References: <1238103279-8040-1-git-send-email-mroth@nessie.de>
Message-ID: <1238103279-8040-3-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mtd-utils-1.2.0 added with ubifs support.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/mtd/1.2.0/mtd-utils-1.2.0-all-acl.patch    |   48 ++++++
 .../mtd-utils-1.2.0-all-bcopy-bzero-bcmp.patch     |  128 ++++++++++++++++
 .../mtd-utils-1.2.0-all-flashcp-npow2-erase.patch  |   23 +++
 .../mtd/1.2.0/mtd-utils-1.2.0-host-targets.patch   |   37 +++++
 package/mtd/1.2.0/mtd.mk                           |  153 ++++++++++++++++++++
 package/mtd/Config.in                              |   44 +++++--
 package/mtd/mtd.mk                                 |    3 +
 7 files changed, 425 insertions(+), 11 deletions(-)
 create mode 100644 package/mtd/1.2.0/mtd-utils-1.2.0-all-acl.patch
 create mode 100644 package/mtd/1.2.0/mtd-utils-1.2.0-all-bcopy-bzero-bcmp.patch
 create mode 100644 package/mtd/1.2.0/mtd-utils-1.2.0-all-flashcp-npow2-erase.patch
 create mode 100644 package/mtd/1.2.0/mtd-utils-1.2.0-host-targets.patch
 create mode 100644 package/mtd/1.2.0/mtd.mk

diff --git a/package/mtd/1.2.0/mtd-utils-1.2.0-all-acl.patch b/package/mtd/1.2.0/mtd-utils-1.2.0-all-acl.patch
new file mode 100644
index 0000000..953786e
--- /dev/null
+++ b/package/mtd/1.2.0/mtd-utils-1.2.0-all-acl.patch
@@ -0,0 +1,48 @@
+Author:	Ulf Samuelsson
+Date:	2007-01-25
+
+Log:
+Patch adding "sys/acl.h" needed to compile mtd.
+
+Modified:
+	package/mtd/mtd_acl.patch
+
+Changeset
+	package/mtd/mtd_acl.patch
+
+diff -urN mtd_orig-0rig/include/sys/acl.h mtd_orig/include/sys/acl.h
+--- mtd_orig-0rig/include/sys/acl.h	1970-01-01 01:00:00.000000000 +0100
++++ mtd_orig/include/sys/acl.h	2007-01-17 20:11:22.000000000 +0100
+@@ -0,0 +1,32 @@
++/*
++  File: linux/posix_acl.h
++
++  (C) 2002 Andreas Gruenbacher, <a.gruenbacher@computer.org>
++*/
++
++
++#ifndef __LINUX_POSIX_ACL_H
++#define __LINUX_POSIX_ACL_H
++
++#define ACL_UNDEFINED_ID	(-1)
++
++/* a_type field in acl_user_posix_entry_t */
++#define ACL_TYPE_ACCESS		(0x8000)
++#define ACL_TYPE_DEFAULT	(0x4000)
++
++/* e_tag entry in struct posix_acl_entry */
++#define ACL_USER_OBJ		(0x01)
++#define ACL_USER		(0x02)
++#define ACL_GROUP_OBJ		(0x04)
++#define ACL_GROUP		(0x08)
++#define ACL_MASK		(0x10)
++#define ACL_OTHER		(0x20)
++
++/* permissions in the e_perm field */
++#define ACL_READ		(0x04)
++#define ACL_WRITE		(0x02)
++#define ACL_EXECUTE		(0x01)
++//#define ACL_ADD		(0x08)
++//#define ACL_DELETE		(0x10)
++
++#endif  /* __LINUX_POSIX_ACL_H */
diff --git a/package/mtd/1.2.0/mtd-utils-1.2.0-all-bcopy-bzero-bcmp.patch b/package/mtd/1.2.0/mtd-utils-1.2.0-all-bcopy-bzero-bcmp.patch
new file mode 100644
index 0000000..fda25bc
--- /dev/null
+++ b/package/mtd/1.2.0/mtd-utils-1.2.0-all-bcopy-bzero-bcmp.patch
@@ -0,0 +1,128 @@
+From d055f1c3e5dad8c0a73a511e1b8d2f82c9b7ab01 Mon Sep 17 00:00:00 2001
+From: Mitch Davis <mjd-linux-mtd@afork.com>
+Date: Wed, 8 Oct 2008 13:36:13 +1100
+Subject: [PATCH] [PATCH] [MTD] mtd-utils: fec.c: bzero->memset, bcopy->memcpy, bcmp->memcmp
+
+This patch alters fec.c so it does not use the deprecated bzero, bcopy
+and bcmp functions.  This can help on platforms that do not have these
+functions.
+
+Signed-off-by: Mitch Davis <mitch.davis@symstream.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+---
+ fec.c |   35 +++++++++++------------------------
+ 1 files changed, 11 insertions(+), 24 deletions(-)
+
+diff --git a/fec.c b/fec.c
+index 09e8453..6d9020f 100644
+--- a/fec.c
++++ b/fec.c
+@@ -47,19 +47,6 @@
+ #include <string.h>
+ 
+ /*
+- * compatibility stuff
+- */
+-#ifdef MSDOS	/* but also for others, e.g. sun... */
+-#define NEED_BCOPY
+-#define bcmp(a,b,n) memcmp(a,b,n)
+-#endif
+-
+-#ifdef NEED_BCOPY
+-#define bcopy(s, d, siz)        memcpy((d), (s), (siz))
+-#define bzero(d, siz)   memset((d), '\0', (siz))
+-#endif
+-
+-/*
+  * stuff used for testing purposes only
+  */
+ 
+@@ -433,7 +420,7 @@ invert_mat(gf *src, int k)
+     gf *id_row = NEW_GF_MATRIX(1, k);
+     gf *temp_row = NEW_GF_MATRIX(1, k);
+ 
+-    bzero(id_row, k*sizeof(gf));
++    memset(id_row, '\0', k*sizeof(gf));
+     DEB( pivloops=0; pivswaps=0 ; /* diagnostic */ )
+     /*
+      * ipiv marks elements already used as pivots.
+@@ -513,7 +500,7 @@ found_piv:
+ 	 * we can optimize the addmul).
+ 	 */
+ 	id_row[icol] = 1;
+-	if (bcmp(pivot_row, id_row, k*sizeof(gf)) != 0) {
++	if (memcmp(pivot_row, id_row, k*sizeof(gf)) != 0) {
+ 	    for (p = src, ix = 0 ; ix < k ; ix++, p += k ) {
+ 		if (ix != icol) {
+ 		    c = p[icol] ;
+@@ -704,7 +691,7 @@ fec_new(int k, int n)
+     /*
+      * the upper matrix is I so do not bother with a slow multiply
+      */
+-    bzero(retval->enc_matrix, k*k*sizeof(gf) );
++    memset(retval->enc_matrix, '\0', k*k*sizeof(gf) );
+     for (p = retval->enc_matrix, col = 0 ; col < k ; col++, p += k+1 )
+ 	*p = 1 ;
+     free(tmp_m);
+@@ -731,10 +718,10 @@ fec_encode(struct fec_parms *code, gf *src[], gf *fec, int index, int sz)
+ 	sz /= 2 ;
+ 
+     if (index < k)
+-         bcopy(src[index], fec, sz*sizeof(gf) ) ;
++         memcpy(fec, src[index], sz*sizeof(gf) ) ;
+     else if (index < code->n) {
+ 	p = &(code->enc_matrix[index*k] );
+-	bzero(fec, sz*sizeof(gf));
++	memset(fec, '\0', sz*sizeof(gf));
+ 	for (i = 0; i < k ; i++)
+ 	    addmul(fec, src[i], p[i], sz ) ;
+     } else
+@@ -751,10 +738,10 @@ void fec_encode_linear(struct fec_parms *code, gf *src, gf *fec, int index, int
+ 	sz /= 2 ;
+ 
+     if (index < k)
+-	    bcopy(src + (index * sz), fec, sz*sizeof(gf) ) ;
++	    memcpy(fec, src + (index * sz), sz*sizeof(gf) ) ;
+     else if (index < code->n) {
+ 	p = &(code->enc_matrix[index*k] );
+-	bzero(fec, sz*sizeof(gf));
++	memset(fec, '\0', sz*sizeof(gf));
+ 	for (i = 0; i < k ; i++)
+ 	    addmul(fec, src + (i * sz), p[i], sz ) ;
+     } else
+@@ -814,12 +801,12 @@ build_decode_matrix(struct fec_parms *code, gf *pkt[], int index[])
+     for (i = 0, p = matrix ; i < k ; i++, p += k ) {
+ #if 1 /* this is simply an optimization, not very useful indeed */
+ 	if (index[i] < k) {
+-	    bzero(p, k*sizeof(gf) );
++	    memset(p, '\0', k*sizeof(gf) );
+ 	    p[i] = 1 ;
+ 	} else
+ #endif
+ 	if (index[i] < code->n )
+-	    bcopy( &(code->enc_matrix[index[i]*k]), p, k*sizeof(gf) ); 
++	    memcpy(p,  &(code->enc_matrix[index[i]*k]), k*sizeof(gf) ); 
+ 	else {
+ 	    fprintf(stderr, "decode: invalid index %d (max %d)\n",
+ 		index[i], code->n - 1 );
+@@ -870,7 +857,7 @@ fec_decode(struct fec_parms *code, gf *pkt[], int index[], int sz)
+     for (row = 0 ; row < k ; row++ ) {
+ 	if (index[row] >= k) {
+ 	    new_pkt[row] = my_malloc (sz * sizeof (gf), "new pkt buffer" );
+-	    bzero(new_pkt[row], sz * sizeof(gf) ) ;
++	    memset(new_pkt[row], '\0', sz * sizeof(gf) ) ;
+ 	    for (col = 0 ; col < k ; col++ )
+ 		addmul(new_pkt[row], pkt[col], m_dec[row*k + col], sz) ;
+ 	}
+@@ -880,7 +867,7 @@ fec_decode(struct fec_parms *code, gf *pkt[], int index[], int sz)
+      */
+     for (row = 0 ; row < k ; row++ ) {
+ 	if (index[row] >= k) {
+-	    bcopy(new_pkt[row], pkt[row], sz*sizeof(gf));
++	    memcpy(pkt[row], new_pkt[row], sz*sizeof(gf));
+ 	    free(new_pkt[row]);
+ 	}
+     }
+-- 
+1.6.0.6
+
diff --git a/package/mtd/1.2.0/mtd-utils-1.2.0-all-flashcp-npow2-erase.patch b/package/mtd/1.2.0/mtd-utils-1.2.0-all-flashcp-npow2-erase.patch
new file mode 100644
index 0000000..b9a0a60
--- /dev/null
+++ b/package/mtd/1.2.0/mtd-utils-1.2.0-all-flashcp-npow2-erase.patch
@@ -0,0 +1,23 @@
+flashcp: handle non-power-of-2 erase size (E.G. for dataflash)
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ flashcp.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: mtd-utils-1.1.0/flashcp.c
+===================================================================
+--- mtd-utils-1.1.0.orig/flashcp.c	2007-08-03 15:55:51.000000000 +0200
++++ mtd-utils-1.1.0/flashcp.c	2009-02-17 14:02:09.000000000 +0100
+@@ -255,8 +255,9 @@
+ #warning "Check for smaller erase regions"
+ 
+ 	erase.start = 0;
+-	erase.length = filestat.st_size & ~(mtd.erasesize - 1);
+-	if (filestat.st_size % mtd.erasesize) erase.length += mtd.erasesize;
++	erase.length = (filestat.st_size + mtd.erasesize - 1) / mtd.erasesize;
++	erase.length *= mtd.erasesize;
++
+ 	if (flags & FLAG_VERBOSE)
+ 	{
+ 		/* if the user wants verbose output, erase 1 block at a time and show him/her what's going on */
diff --git a/package/mtd/1.2.0/mtd-utils-1.2.0-host-targets.patch b/package/mtd/1.2.0/mtd-utils-1.2.0-host-targets.patch
new file mode 100644
index 0000000..bddaa67
--- /dev/null
+++ b/package/mtd/1.2.0/mtd-utils-1.2.0-host-targets.patch
@@ -0,0 +1,37 @@
+diff -ur mtd-utils-1.2.0.orig/Makefile mtd-utils-1.2.0/Makefile
+--- mtd-utils-1.2.0.orig/Makefile	2008-06-27 18:21:28.000000000 +0200
++++ mtd-utils-1.2.0/Makefile	2009-03-25 17:16:43.000000000 +0100
+@@ -90,6 +90,33 @@
+ 
+ 
+ 
++ftl_format:	$(BUILDDIR)/ftl_format
++flash_erase:	$(BUILDDIR)/flash_erase
++flash_eraseall:	$(BUILDDIR)/flash_eraseall
++nanddump:	$(BUILDDIR)/nanddump
++doc_loadbios:	$(BUILDDIR)/doc_loadbios
++mkfs.jffs:	$(BUILDDIR)/mkfs.jffs
++ftl_check:	$(BUILDDIR)/ftl_check
++mkfs.jffs2:	$(BUILDDIR)/mkfs.jffs2
++flash_lock:	$(BUILDDIR)/flash_lock
++flash_unlock:	$(BUILDDIR)/flash_unlock
++flash_info:	$(BUILDDIR)/flash_info
++flash_otp_info:	$(BUILDDIR)/flash_otp_info
++flash_otp_dump:	$(BUILDDIR)/flash_otp_dump
++mtd_debug:	$(BUILDDIR)/mtd_debug
++flashcp:	$(BUILDDIR)/flashcp
++nandwrite:	$(BUILDDIR)/nandwrite
++jffs2dump:	$(BUILDDIR)/jffs2dump
++nftldump:	$(BUILDDIR)/nftldump
++nftl_format:	$(BUILDDIR)/nftl_format
++docfdisk:	$(BUILDDIR)/docfdisk
++rfddump:	$(BUILDDIR)/rfddump
++rfdformat:	$(BUILDDIR)/rfdformat
++sumtool:	$(BUILDDIR)/sumtool
++serve_image:	$(BUILDDIR)/serve_image
++recv_image:	$(BUILDDIR)/recv_image
++fectest:	$(BUILDDIR)/fectest
++
+ install: ${TARGETS}
+ 	mkdir -p ${DESTDIR}/${SBINDIR}
+ 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
diff --git a/package/mtd/1.2.0/mtd.mk b/package/mtd/1.2.0/mtd.mk
new file mode 100644
index 0000000..76340e5
--- /dev/null
+++ b/package/mtd/1.2.0/mtd.mk
@@ -0,0 +1,153 @@
+#############################################################
+#
+# mtd provides jffs2 utilities
+#
+#############################################################
+MTD_VERSION:=1.2.0
+MTD_NAME:=mtd-utils-$(MTD_VERSION)
+MTD_SOURCE:=$(MTD_NAME).tar.bz2
+MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
+MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/$(MTD_NAME)
+MTD_DIR:=$(BUILD_DIR)/$(MTD_NAME)
+MTD_CAT:=$(BZCAT)
+
+#############################################################
+#
+# Build mkfs.jffs2 and sumtool for use on the local host system if
+# needed by target/jffs2root.
+#
+#############################################################
+MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
+SUMTOOL := $(MTD_HOST_DIR)/sumtool
+
+$(DL_DIR)/$(MTD_SOURCE):
+	$(call DOWNLOAD,$(MTD_SITE),$(MTD_SOURCE))
+
+$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+		package/mtd/1.2.0 mtd-utils-$(MTD_VERSION)-all\*.patch
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+		package/mtd/1.2.0 mtd-utils-$(MTD_VERSION)-host\*.patch
+	touch $@
+
+
+$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+		$(MAKE) LINUXDIR=$(LINUX_DIR) \
+		BUILDDIR=$(MTD_HOST_DIR) \
+		-C $(MTD_HOST_DIR) mkfs.jffs2
+
+$(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+		$(MAKE) LINUXDIR=$(LINUX_DIR) \
+		BUILDDIR=$(MTD_HOST_DIR) \
+		-C $(MTD_HOST_DIR) sumtool
+
+mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+
+mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
+
+mtd-host-clean:
+	-$(MAKE) -C $(MTD_HOST_DIR) clean
+
+mtd-host-dirclean:
+	rm -rf $(MTD_HOST_DIR)
+
+#############################################################
+#
+# build mtd for use on the target system
+#
+#############################################################
+$(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(MTD_DIR) \
+		package/mtd/1.2.0 mtd-utils-$(MTD_VERSION)-all\*.patch
+	toolchain/patch-kernel.sh $(MTD_DIR) \
+		package/mtd/1.2.0 mtd-utils-$(MTD_VERSION)-target\*.patch
+	touch $@
+
+MTD_TARGETS_n :=
+MTD_TARGETS_y :=
+
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE) += flash_erase
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL) += flash_eraseall
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO) += flash_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK) += flash_lock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK) += flash_unlock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP) += flashcp
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2) += mkfs.jffs2
+MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SERVE_IMAGE) += serve_image
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RECV_IMAGE) += recv_image
+
+MTD_TARGETS_UBI_n :=
+MTD_TARGETS_UBI_y :=
+
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH) += ubiattach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32) += ubicrc32
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH) += ubidetach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIFORMAT) += ubiformat
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL) += ubimkvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO) += ubinfo
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINIZE) += ubinize
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL) += ubirmvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL) += ubiupdatevol
+
+MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
+MTD_BUILD_UBI_TARGETS := $(addprefix $(MTD_DIR)/ubi-utils/new-utils/, $(MTD_TARGETS_UBI_y))
+
+$(MTD_BUILD_TARGETS) $(MTD_BUILD_UBI_TARGETS): $(MTD_DIR)/.unpacked
+	mkdir -p $(TARGET_DIR)/usr/sbin
+	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		BUILDDIR=$(MTD_DIR) \
+		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) WITHOUT_XATTR=1 -C $(MTD_DIR) \
+		$(MTD_BUILD_TARGETS)
+	$(MAKE) CFLAGS="-Iinclude -Isrc -I../../include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) -C $(MTD_DIR)/ubi-utils/new-utils \
+
+MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
+MTD_UBI_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_UBI_y))
+
+$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/%
+	cp -f $< $@
+	$(STRIPCMD) $@
+
+$(MTD_UBI_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/ubi-utils/new-utils/%
+	cp -f $< $@
+	$(STRIPCMD) $@
+
+mtd: zlib lzo $(MTD_TARGETS) $(MTD_UBI_TARGETS)
+
+
+mtd: zlib $(MTD_TARGETS)
+
+mtd-source: $(DL_DIR)/$(MTD_SOURCE)
+
+mtd-clean:
+	-$(MAKE) -C $(MTD_DIR) clean
+
+mtd-dirclean:
+	rm -rf $(MTD_DIR)
+
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_MTD),y)
+TARGETS+=mtd
+endif
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 2be02ee..6514bb1 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -31,6 +31,16 @@ config BR2_PACKAGE_MTD_UTILS_1_1_0
 
 	  Build mtd/jffs utilities with Dataflash support.
 
+config BR2_PACKAGE_MTD_UTILS_1_2_0
+	bool "mtd-utils 1.2.0"
+	select BR2_PACKAGE_LZO
+	help
+	  MTD Utils release 1.2.0.
+
+	  jffs (Version 1) support dropped.
+
+	  Ubi-FS support added.
+
 config BR2_PACKAGE_MTD_UTILS_GIT
 	bool "mtd-utils (almost) latest GIT"
 	help
@@ -124,6 +134,14 @@ config BR2_PACKAGE_MTD_NFTL_FORMAT
 config BR2_PACKAGE_MTD_NFTLDUMP
 	bool "nftldump"
 
+config BR2_PACKAGE_MTD_RECV_IMAGE
+	bool "recv_image"
+	depends on BR2_PACKAGE_MTD_UTILS_GIT || BR2_PACKAGE_MTD_UTILS_1_2_0
+
+config BR2_PACKAGE_MTD_SERVE_IMAGE
+	bool "serve_image"
+	depends on BR2_PACKAGE_MTD_UTILS_GIT || BR2_PACKAGE_MTD_UTILS_1_2_0
+
 config BR2_PACKAGE_MTD_SUMTOOL
 	bool "sumtool"
 	default y
@@ -131,42 +149,46 @@ config BR2_PACKAGE_MTD_SUMTOOL
 config BR2_PACKAGE_MTD_UBIATTACH
 	bool "ubiattach"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
+	depends on BR2_PACKAGE_MTD_UTILS_GIT || BR2_PACKAGE_MTD_UTILS_1_2_0
 
 config BR2_PACKAGE_MTD_UBICRC32
 	bool "ubicrc32"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
+	depends on BR2_PACKAGE_MTD_UTILS_GIT || BR2_PACKAGE_MTD_UTILS_1_2_0
 
 config BR2_PACKAGE_MTD_UBIDETACH
 	bool "ubidetach"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
+	depends on BR2_PACKAGE_MTD_UTILS_GIT || BR2_PACKAGE_MTD_UTILS_1_2_0
 
-config BR2_PACKAGE_MTD_UBIMIRROR
-	bool "ubimirror"
+config BR2_PACKAGE_MTD_UBIFORMAT
+	bool "ubiformat"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
+	depends on BR2_PACKAGE_MTD_UTILS_GIT || BR2_PACKAGE_MTD_UTILS_1_2_0
 
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
+	depends on BR2_PACKAGE_MTD_UTILS_GIT|| BR2_PACKAGE_MTD_UTILS_1_2_0
 
 config BR2_PACKAGE_MTD_UBINFO
 	bool "ubinfo"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
+	depends on BR2_PACKAGE_MTD_UTILS_GIT || BR2_PACKAGE_MTD_UTILS_1_2_0
+
+config BR2_PACKAGE_MTD_UBINIZE
+	bool "ubinize"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT|| BR2_PACKAGE_MTD_UTILS_1_2_0
 
 config BR2_PACKAGE_MTD_UBIRMVOL
 	bool "ubirmvol"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
+	depends on BR2_PACKAGE_MTD_UTILS_GIT || BR2_PACKAGE_MTD_UTILS_1_2_0
 
 config BR2_PACKAGE_MTD_UBIUPDATEVOL
 	bool "ubiupdatevol"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
+	depends on BR2_PACKAGE_MTD_UTILS_GIT || BR2_PACKAGE_MTD_UTILS_1_2_0
 
 endif
-
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 9d66698..7a2c70e 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -1,3 +1,6 @@
+ifeq ($(BR2_PACKAGE_MTD_UTILS_1_2_0),y)
+include package/mtd/1.2.0/mtd.mk
+endif
 ifeq ($(BR2_PACKAGE_MTD_UTILS_1_1_0),y)
 include package/mtd/1.1.0/mtd.mk
 endif
-- 
1.6.0.6
