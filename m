From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 7 Jan 2010 12:57:36 -0500
Subject: [Buildroot] [PATCH] package/mtd: Remove obsolete utilities,
	add new ones
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190902089564@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

package/mtd: Remove obsolete utilities, add new ones

A number of options under "MTD tools selection" are no longer
available.  Remove them to avoid possible build errors.

In addition, the nandtest utility is present in MTD-utils release
so remove the depends on BR2_PACKAGE_MTD_UTILS_GIT.

Add a number of new utilities that exist in the latest version.
All of these do not have a 'default y' so existing configurations
should not change.

Reorder the MTD_TARGETS_* to match the Config.in so it's easier
to notice missing utilities.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 125175f..b5a2668 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -31,11 +31,6 @@ config BR2_PACKAGE_MTD_DOCFDISK
 config BR2_PACKAGE_MTD_DOC_LOADBIOS
 	bool "doc_loadbios"
 
-config BR2_PACKAGE_MTD_ERASE
-	bool "erase"
-	default y
-	depends on BR2_PACKAGE_MTD_20050122
-
 config BR2_PACKAGE_MTD_FLASHCP
 	bool "flashcp"
 	default y
@@ -56,6 +51,12 @@ config BR2_PACKAGE_MTD_FLASH_LOCK
 	bool "flash_lock"
 	default y
 
+config BR2_PACKAGE_MTD_FLASH_OTP_DUMP
+	bool "flash_otp_dump"
+
+config BR2_PACKAGE_MTD_FLASH_OTP_INFO
+	bool "flash_otp_info"
+
 config BR2_PACKAGE_MTD_FLASH_UNLOCK
 	bool "flash_unlock"
 	default y
@@ -72,19 +73,10 @@ config BR2_PACKAGE_MTD_JFFS2DUMP
 	bool "jffs2dump"
 	default y
 
-config BR2_PACKAGE_MTD_JFFS3DUMP
-	bool "jffs3dump"
-	default y
-	depends on BR2_PACKAGE_MTD_20050122
-
 config BR2_PACKAGE_MTD_MKFSJFFS2
 	bool "mkfs.jffs2"
 	default y
 
-config BR2_PACKAGE_MTD_MKFSJFFS
-	bool "mkfs.jffs"
-	depends on BR2_PACKAGE_MTD_20050122 || BR2_PACKAGE_MTD_20061007 || BR2_PACKAGE_MTD_UTILS
-
 config BR2_PACKAGE_MTD_MTD_DEBUG
 	bool "mtd_debug"
 	default y
@@ -96,17 +88,28 @@ config BR2_PACKAGE_MTD_NANDDUMP
 config BR2_PACKAGE_MTD_NANDTEST
 	bool "nandtest"
 	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
 config BR2_PACKAGE_MTD_NANDWRITE
 	bool "nandwrite"
 	default y
 
+config BR2_PACKAGE_MTD_NFTLDUMP
+	bool "nftldump"
+
 config BR2_PACKAGE_MTD_NFTL_FORMAT
 	bool "nftl_format"
 
-config BR2_PACKAGE_MTD_NFTLDUMP
-	bool "nftldump"
+config BR2_PACKAGE_MTD_RECV_IMAGE
+	bool "recv_image"
+
+config BR2_PACKAGE_MTD_RFDDUMP
+	bool "rfddump"
+
+config BR2_PACKAGE_MTD_RFDFORMAT
+	bool "rfdformat"
+
+config BR2_PACKAGE_MTD_SERVE_IMAGE
+	bool "serve_image"
 
 config BR2_PACKAGE_MTD_SUMTOOL
 	bool "sumtool"
diff --git a/package/mtd/mtd-utils.git/mtd.mk b/package/mtd/mtd-utils.git/mtd.mk
index 6cb45c2..f65b171 100644
--- a/package/mtd/mtd-utils.git/mtd.mk
+++ b/package/mtd/mtd-utils.git/mtd.mk
@@ -74,37 +74,43 @@ $(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
 MTD_TARGETS_n :=
 MTD_TARGETS_y :=
 
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE) += flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL) += flash_eraseall
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO) += flash_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK) += flash_lock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK) += flash_unlock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP) += flashcp
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2) += mkfs.jffs2
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST) += nandtest
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)		+= flashcp
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)	+= flash_erase
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL)	+= flash_eraseall
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO)	+= flash_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)	+= flash_lock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP)	+= flash_otp_dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)	+= jffs2dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)	+= mkfs.jffs2
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)	+= mtd_debug
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP)		+= nanddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST)		+= nandtest
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE)	+= nandwrite
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP)		+= nftldump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT)	+= nftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RECV_IMAGE)	+= recv_image
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDDUMP)		+= rfddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDFORMAT)	+= rfdformat
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SERVE_IMAGE)	+= serve_image
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL)		+= sumtool
 
 MTD_TARGETS_UBI_n :=
 MTD_TARGETS_UBI_y :=
 
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH) += ubiattach
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32) += ubicrc32
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH) += ubidetach
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMIRROR) += ubimirror
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL) += ubimkvol
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO) += ubinfo
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL) += ubirmvol
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL) += ubiupdatevol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH)	+= ubiattach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32)	+= ubicrc32
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH)	+= ubidetach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMIRROR)	+= ubimirror
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL)	+= ubimkvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO)	+= ubinfo
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL)	+= ubirmvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
 
 MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y)) $(addprefix $(MTD_DIR)/ubi-utils/, $(MTD_TARGETS_UBI_y))
 
diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
index 9b114de..f6bbd36 100644
--- a/package/mtd/mtd-utils/mtd.mk
+++ b/package/mtd/mtd-utils/mtd.mk
@@ -71,26 +71,31 @@ $(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
 MTD_TARGETS_n :=
 MTD_TARGETS_y :=
 
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE) += flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL) += flash_eraseall
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO) += flash_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK) += flash_lock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK) += flash_unlock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP) += flashcp
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2) += mkfs.jffs2
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS) += mkfs.jffs
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
-#MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS3DUMP) += jffs3dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)		+= flashcp
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)	+= flash_erase
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL)	+= flash_eraseall
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO)	+= flash_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)	+= flash_lock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP)	+= flash_otp_dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)	+= jffs2dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)	+= mkfs.jffs2
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)	+= mtd_debug
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP)		+= nanddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST)		+= nandtest
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE)	+= nandwrite
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP)		+= nftldump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT)	+= nftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RECV_IMAGE)	+= recv_image
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDDUMP)		+= rfddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDFORMAT)	+= rfdformat
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SERVE_IMAGE)	+= serve_image
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL)		+= sumtool
 
 MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
 
