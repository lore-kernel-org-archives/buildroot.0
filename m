From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 29 Jul 2009 19:21:23 +0200
Subject: [Buildroot] [PATCH 2/2] mtd-utils.git: fix targets
In-Reply-To: <1248888083-11767-1-git-send-email-daniel@caiaq.de>
References: <20090729172019.GS19257@buzzloop.caiaq.de>
	<1248888083-11767-1-git-send-email-daniel@caiaq.de>
Message-ID: <1248888083-11767-2-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update git version for mtd-utils.git.
- In this new version, a new tool named 'ubiformat' exists which is
  exported by this patch.
- The tool ubimirror does not exist anymore, remove support for it.
- remove two patches that do no longer apply
- add a patch that removes the unconditional setting of
  -D_FILE_OFFSET_BITS=64
- introduce EXTRA_CPPFLAGS that is set to -D_FILE_OFFSET_BITS=64 in case
  BR2_LARGEFILE is set
- select BR2_PACKAGE_LIBUUID for BR2_PACKAGE_MTD

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 package/mtd/Config.in                              |   11 +++--
 .../mtd/mtd-utils.git/mtd-utils-all-targets.patch  |   34 --------------
 .../mtd/mtd-utils.git/mtd-utils-target-acl.patch   |   48 --------------------
 .../mtd-utils-target-no-file-offset-bits.patch     |   11 +++++
 package/mtd/mtd-utils.git/mtd.mk                   |   15 ++++--
 5 files changed, 27 insertions(+), 92 deletions(-)
 delete mode 100644 package/mtd/mtd-utils.git/mtd-utils-all-targets.patch
 delete mode 100644 package/mtd/mtd-utils.git/mtd-utils-target-acl.patch
 create mode 100644 package/mtd/mtd-utils.git/mtd-utils-target-no-file-offset-bits.patch

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 125175f..c325ca4 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_MTD
 	bool "mtd/jffs2 utilities"
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBUUID
 	help
 	  Build mtd/jffs utilities
 
@@ -127,11 +128,6 @@ config BR2_PACKAGE_MTD_UBIDETACH
 	default y
 	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
-config BR2_PACKAGE_MTD_UBIMIRROR
-	bool "ubimirror"
-	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
-
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
 	default y
@@ -152,5 +148,10 @@ config BR2_PACKAGE_MTD_UBIUPDATEVOL
 	default y
 	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
+config BR2_PACKAGE_MTD_UBIFORMAT
+	bool "ubiformat"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
 endif
 
diff --git a/package/mtd/mtd-utils.git/mtd-utils-all-targets.patch b/package/mtd/mtd-utils.git/mtd-utils-all-targets.patch
deleted file mode 100644
index e887118..0000000
--- a/package/mtd/mtd-utils.git/mtd-utils-all-targets.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-diff -urN mtd-utils-1.1.0-0rig/Makefile mtd-utils-1.1.0/Makefile
---- mtd-utils-1.1.0-0rig/Makefile	2007-08-03 15:55:51.000000000 +0200
-+++ mtd-utils-1.1.0/Makefile	2007-09-27 08:20:55.000000000 +0200
-@@ -72,6 +72,30 @@
- $(BUILDDIR)/sumtool: $(BUILDDIR)/sumtool.o $(BUILDDIR)/crc32.o
- 	$(CC) $(LDFLAGS) -o $@ $^
- 
-+ftl_format:	$(BUILDDIR)/ftl_format
-+flash_erase:	$(BUILDDIR)/flash_erase
-+flash_eraseall:	$(BUILDDIR)/flash_eraseall
-+nanddump:	$(BUILDDIR)/nanddump
-+doc_loadbios:	$(BUILDDIR)/doc_loadbios
-+mkfs.jffs:	$(BUILDDIR)/mkfs.jffs
-+ftl_check:	$(BUILDDIR)/ftl_check
-+mkfs.jffs2:	$(BUILDDIR)/mkfs.jffs2
-+flash_lock:	$(BUILDDIR)/flash_lock
-+flash_unlock:	$(BUILDDIR)/flash_unlock
-+flash_info:	$(BUILDDIR)/flash_info
-+flash_otp_info:	$(BUILDDIR)/flash_otp_info
-+flash_otp_dump:	$(BUILDDIR)/flash_otp_dump
-+mtd_debug:	$(BUILDDIR)/mtd_debug
-+flashcp:	$(BUILDDIR)/flashcp
-+nandwrite:	$(BUILDDIR)/nandwrite
-+jffs2dump:	$(BUILDDIR)/jffs2dump
-+nftldump:	$(BUILDDIR)/nftldump
-+nftl_format:	$(BUILDDIR)/nftl_format
-+docfdisk:	$(BUILDDIR)/docfdisk
-+rfddump:	$(BUILDDIR)/rfddump
-+rfdformat:	$(BUILDDIR)/rfdformat
-+sumtool:	$(BUILDDIR)/sumtool
-+
- install: ${TARGETS}
- 	mkdir -p ${DESTDIR}/${SBINDIR}
- 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
diff --git a/package/mtd/mtd-utils.git/mtd-utils-target-acl.patch b/package/mtd/mtd-utils.git/mtd-utils-target-acl.patch
deleted file mode 100644
index 953786e..0000000
--- a/package/mtd/mtd-utils.git/mtd-utils-target-acl.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Author:	Ulf Samuelsson
-Date:	2007-01-25
-
-Log:
-Patch adding "sys/acl.h" needed to compile mtd.
-
-Modified:
-	package/mtd/mtd_acl.patch
-
-Changeset
-	package/mtd/mtd_acl.patch
-
-diff -urN mtd_orig-0rig/include/sys/acl.h mtd_orig/include/sys/acl.h
---- mtd_orig-0rig/include/sys/acl.h	1970-01-01 01:00:00.000000000 +0100
-+++ mtd_orig/include/sys/acl.h	2007-01-17 20:11:22.000000000 +0100
-@@ -0,0 +1,32 @@
-+/*
-+  File: linux/posix_acl.h
-+
-+  (C) 2002 Andreas Gruenbacher, <a.gruenbacher@computer.org>
-+*/
-+
-+
-+#ifndef __LINUX_POSIX_ACL_H
-+#define __LINUX_POSIX_ACL_H
-+
-+#define ACL_UNDEFINED_ID	(-1)
-+
-+/* a_type field in acl_user_posix_entry_t */
-+#define ACL_TYPE_ACCESS		(0x8000)
-+#define ACL_TYPE_DEFAULT	(0x4000)
-+
-+/* e_tag entry in struct posix_acl_entry */
-+#define ACL_USER_OBJ		(0x01)
-+#define ACL_USER		(0x02)
-+#define ACL_GROUP_OBJ		(0x04)
-+#define ACL_GROUP		(0x08)
-+#define ACL_MASK		(0x10)
-+#define ACL_OTHER		(0x20)
-+
-+/* permissions in the e_perm field */
-+#define ACL_READ		(0x04)
-+#define ACL_WRITE		(0x02)
-+#define ACL_EXECUTE		(0x01)
-+//#define ACL_ADD		(0x08)
-+//#define ACL_DELETE		(0x10)
-+
-+#endif  /* __LINUX_POSIX_ACL_H */
diff --git a/package/mtd/mtd-utils.git/mtd-utils-target-no-file-offset-bits.patch b/package/mtd/mtd-utils.git/mtd-utils-target-no-file-offset-bits.patch
new file mode 100644
index 0000000..c21a909
--- /dev/null
+++ b/package/mtd/mtd-utils.git/mtd-utils-target-no-file-offset-bits.patch
@@ -0,0 +1,11 @@
+--- a/common.mk	2009-07-29 19:07:29.000000000 +0200
++++ b/common.mk	2009-07-29 19:07:34.000000000 +0200
+@@ -12,7 +12,7 @@
+ 	$(call cc-option,-Wwrite-strings) \
+ 	$(call cc-option,-Wno-sign-compare)
+ CFLAGS += $(WFLAGS)
+-CPPFLAGS += -D_FILE_OFFSET_BITS=64
++CPPFLAGS += $(EXTRA_CPPFLAGS)
+ 
+ DESTDIR ?= /usr/local
+ PREFIX=/usr
diff --git a/package/mtd/mtd-utils.git/mtd.mk b/package/mtd/mtd-utils.git/mtd.mk
index ca25ee5..b3f1b7e 100644
--- a/package/mtd/mtd-utils.git/mtd.mk
+++ b/package/mtd/mtd-utils.git/mtd.mk
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
+MTD_VERSION:=e783e75e09b4a0a519665afd7bdeaf2985e7a09c
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
 MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
 MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION)
@@ -98,20 +98,25 @@ MTD_TARGETS_UBI_y :=
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH) += ubiattach
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32) += ubicrc32
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH) += ubidetach
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMIRROR) += ubimirror
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL) += ubimkvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO) += ubinfo
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL) += ubirmvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL) += ubiupdatevol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIFORMAT) += ubiformat
 
 MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y)) $(addprefix $(MTD_DIR)/ubi-utils/, $(MTD_TARGETS_UBI_y))
 
+ifeq ($(BR2_LARGEFILE),y)
+TARGET_CPPFLAGS += -D_FILE_OFFSET_BITS=64
+endif
+
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 	mkdir -p $(TARGET_DIR)/usr/sbin
 	$(MAKE1) OPTFLAGS="-DNEED_BCOPY -Dbcmp=memcmp -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
-	       BUILDDIR=$(MTD_DIR) \
-	       CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) WITHOUT_XATTR=1 -C $(MTD_DIR)
+		BUILDDIR=$(MTD_DIR) \
+		EXTRA_CPPFLAGS=$(TARGET_CPPFLAGS) \
+		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) WITHOUT_XATTR=1 -C $(MTD_DIR)
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
 MTD_UBI_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_UBI_y))
@@ -124,7 +129,7 @@ $(MTD_UBI_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/ubi-utils/%
 	cp -f $< $@
 	$(STRIPCMD) $@
 
-mtd: zlib lzo $(MTD_TARGETS) $(MTD_UBI_TARGETS)
+mtd: zlib lzo libuuid $(MTD_TARGETS) $(MTD_UBI_TARGETS)
 
 mtd-source: $(DL_DIR)/$(MTD_SOURCE)
 
-- 
1.6.3.3
