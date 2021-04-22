From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Apr 2021 23:05:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix build with FIT
Message-ID: <20210422210559.707845-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with FIT is broken since bump to version 2021.04 in commit
a4c38ae470e6c472f0e0cdfbfb8e2e76f1e8047c

Fixes:
 - http://autobuild.buildroot.org/results/5771a7413c98ec202c9623672787a1eee74da5e0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ....c-fix-building-tools-without-an-arc.patch | 267 ++++++++++++++++++
 1 file changed, 267 insertions(+)
 create mode 100644 package/uboot-tools/0004-common-image-fit.c-fix-building-tools-without-an-arc.patch

diff --git a/package/uboot-tools/0004-common-image-fit.c-fix-building-tools-without-an-arc.patch b/package/uboot-tools/0004-common-image-fit.c-fix-building-tools-without-an-arc.patch
new file mode 100644
index 0000000000..98056bf29c
--- /dev/null
+++ b/package/uboot-tools/0004-common-image-fit.c-fix-building-tools-without-an-arc.patch
@@ -0,0 +1,267 @@
+From 6ee0710e33fb3ec5350eebf0c4be0f8b17fc6c31 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 22 Apr 2021 22:21:24 +0200
+Subject: [PATCH] common/image-fit.c: fix building tools without an
+ architecture
+
+This reverts commit
+https://github.com/u-boot/u-boot/commit/f14e6eec6c7fe5c0a77491bdb62961ae8dacb503
+(and following commits) to add back #ifdef checks for USE_HOSTCC and
+CONFIG_* instead of normal if instructions as building u-boot tools
+without a board configuration is broken since this time:
+
+  HOSTCC  tools/common/fdt_region.o
+In file included from ./tools/../common/image-fit.c:33,
+                 from tools/common/image-fit.c:1:
+include/linux/kconfig.h:4:10: fatal error: generated/autoconf.h: No such file or directory
+    4 | #include <generated/autoconf.h>
+      |          ^~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ common/image-fit.c | 130 ++++++++++++++++++++++++---------------------
+ 1 file changed, 70 insertions(+), 60 deletions(-)
+
+diff --git a/common/image-fit.c b/common/image-fit.c
+index 94501b1071..c625dab7d2 100644
+--- a/common/image-fit.c
++++ b/common/image-fit.c
+@@ -17,6 +17,7 @@
+ #include <u-boot/crc.h>
+ #else
+ #include <linux/compiler.h>
++#include <linux/kconfig.h>
+ #include <common.h>
+ #include <errno.h>
+ #include <log.h>
+@@ -30,7 +31,6 @@ DECLARE_GLOBAL_DATA_PTR;
+ #include <bootm.h>
+ #include <image.h>
+ #include <bootstage.h>
+-#include <linux/kconfig.h>
+ #include <u-boot/crc.h>
+ #include <u-boot/md5.h>
+ #include <u-boot/sha1.h>
+@@ -165,7 +165,7 @@ int fit_get_subimage_count(const void *fit, int images_noffset)
+ 	return count;
+ }
+ 
+-#if CONFIG_IS_ENABLED(FIT_PRINT) || CONFIG_IS_ENABLED(SPL_FIT_PRINT)
++#if defined(FIT_PRINT) || defined(SPL_FIT_PRINT)
+ /**
+  * fit_image_print_data() - prints out the hash node details
+  * @fit: pointer to the FIT format image header
+@@ -504,16 +504,16 @@ void fit_image_print(const void *fit, int image_noffset, const char *p)
+ 
+ 	ret = fit_image_get_data_and_size(fit, image_noffset, &data, &size);
+ 
+-	if (!host_build()) {
+-		printf("%s  Data Start:   ", p);
+-		if (ret) {
+-			printf("unavailable\n");
+-		} else {
+-			void *vdata = (void *)data;
++#ifndef USE_HOSTCC
++	printf("%s  Data Start:   ", p);
++	if (ret) {
++		printf("unavailable\n");
++	} else {
++		void *vdata = (void *)data;
+ 
+-			printf("0x%08lx\n", (ulong)map_to_sysmem(vdata));
+-		}
++		printf("0x%08lx\n", (ulong)map_to_sysmem(vdata));
+ 	}
++#endif
+ 
+ 	printf("%s  Data Size:    ", p);
+ 	if (ret)
+@@ -1448,6 +1448,7 @@ int fit_all_image_verify(const void *fit)
+ 	return 1;
+ }
+ 
++#ifdef CONFIG_FIT_CIPHER
+ static int fit_image_uncipher(const void *fit, int image_noffset,
+ 			      void **data, size_t *size)
+ {
+@@ -1471,6 +1472,7 @@ static int fit_image_uncipher(const void *fit, int image_noffset,
+  out:
+ 	return ret;
+ }
++#endif /* CONFIG_FIT_CIPHER */
+ 
+ /**
+  * fit_image_check_os - check whether image node is of a given os type
+@@ -1512,8 +1514,9 @@ int fit_image_check_arch(const void *fit, int noffset, uint8_t arch)
+ 	uint8_t image_arch;
+ 	int aarch32_support = 0;
+ 
+-	if (IS_ENABLED(CONFIG_ARM64_SUPPORT_AARCH32))
+-		aarch32_support = 1;
++#ifdef CONFIG_ARM64_SUPPORT_AARCH32
++	aarch32_support = 1;
++#endif
+ 
+ 	if (fit_image_get_arch(fit, noffset, &image_arch))
+ 		return 0;
+@@ -1608,38 +1611,40 @@ int fit_check_format(const void *fit, ulong size)
+ 		return -ENOEXEC;
+ 	}
+ 
+-	if (CONFIG_IS_ENABLED(FIT_FULL_CHECK)) {
+-		/*
+-		 * If we are not given the size, make do wtih calculating it.
+-		 * This is not as secure, so we should consider a flag to
+-		 * control this.
+-		 */
+-		if (size == IMAGE_SIZE_INVAL)
+-			size = fdt_totalsize(fit);
+-		ret = fdt_check_full(fit, size);
+-		if (ret)
+-			ret = -EINVAL;
++#ifdef FIT_FULL_CHECK
++	/*
++	 * If we are not given the size, make do wtih calculating it.
++	 * This is not as secure, so we should consider a flag to
++	 * control this.
++	 */
++	if (size == IMAGE_SIZE_INVAL)
++		size = fdt_totalsize(fit);
++	ret = fdt_check_full(fit, size);
++	if (ret)
++		ret = -EINVAL;
+ 
+-		/*
+-		 * U-Boot stopped using unit addressed in 2017. Since libfdt
+-		 * can match nodes ignoring any unit address, signature
+-		 * verification can see the wrong node if one is inserted with
+-		 * the same name as a valid node but with a unit address
+-		 * attached. Protect against this by disallowing unit addresses.
+-		 */
+-		if (!ret && CONFIG_IS_ENABLED(FIT_SIGNATURE)) {
+-			ret = fdt_check_no_at(fit, 0);
++	/*
++	 * U-Boot stopped using unit addressed in 2017. Since libfdt
++	 * can match nodes ignoring any unit address, signature
++	 * verification can see the wrong node if one is inserted with
++	 * the same name as a valid node but with a unit address
++	 * attached. Protect against this by disallowing unit addresses.
++	 */
++#ifdef FIT_SIGNATURE
++	if (!ret) {
++		ret = fdt_check_no_at(fit, 0);
+ 
+-			if (ret) {
+-				log_debug("FIT check error %d\n", ret);
+-				return ret;
+-			}
+-		}
+ 		if (ret) {
+ 			log_debug("FIT check error %d\n", ret);
+ 			return ret;
+ 		}
+ 	}
++#endif
++	if (ret) {
++		log_debug("FIT check error %d\n", ret);
++		return ret;
++	}
++#endif
+ 
+ 	/* mandatory / node 'description' property */
+ 	if (!fdt_getprop(fit, 0, FIT_DESC_PROP, NULL)) {
+@@ -1825,20 +1830,20 @@ int fit_conf_get_node(const void *fit, const char *conf_uname)
+ 	if (conf_uname == NULL) {
+ 		/* get configuration unit name from the default property */
+ 		debug("No configuration specified, trying default...\n");
+-		if (!host_build() && IS_ENABLED(CONFIG_MULTI_DTB_FIT)) {
+-			noffset = fit_find_config_node(fit);
+-			if (noffset < 0)
+-				return noffset;
+-			conf_uname = fdt_get_name(fit, noffset, NULL);
+-		} else {
+-			conf_uname = (char *)fdt_getprop(fit, confs_noffset,
+-							 FIT_DEFAULT_PROP, &len);
+-			if (conf_uname == NULL) {
+-				fit_get_debug(fit, confs_noffset, FIT_DEFAULT_PROP,
+-					      len);
+-				return len;
+-			}
++#if !defined(USE_HOSTCC) && defined(CONFIG_MULTI_DTB_FIT)
++		noffset = fit_find_config_node(fit);
++		if (noffset < 0)
++			return noffset;
++		conf_uname = fdt_get_name(fit, noffset, NULL);
++#else
++		conf_uname = (char *)fdt_getprop(fit, confs_noffset,
++						 FIT_DEFAULT_PROP, &len);
++		if (conf_uname == NULL) {
++			fit_get_debug(fit, confs_noffset, FIT_DEFAULT_PROP,
++				      len);
++			return len;
+ 		}
++#endif
+ 		debug("Found default configuration: '%s'\n", conf_uname);
+ 	}
+ 
+@@ -2003,8 +2008,10 @@ int fit_image_load(bootm_headers_t *images, ulong addr,
+ 	ret = fit_check_format(fit, IMAGE_SIZE_INVAL);
+ 	if (ret) {
+ 		printf("Bad FIT %s image format! (err=%d)\n", prop_name, ret);
+-		if (CONFIG_IS_ENABLED(FIT_SIGNATURE) && ret == -EADDRNOTAVAIL)
++#ifdef FIT_SIGNATURE
++		if (ret == -EADDRNOTAVAIL)
+ 			printf("Signature checking prevents use of unit addresses (@) in nodes\n");
++#endif
+ 		bootstage_error(bootstage_id + BOOTSTAGE_SUB_FORMAT);
+ 		return ret;
+ 	}
+@@ -2071,13 +2078,13 @@ int fit_image_load(bootm_headers_t *images, ulong addr,
+ 	}
+ 
+ 	bootstage_mark(bootstage_id + BOOTSTAGE_SUB_CHECK_ARCH);
+-	if (!host_build() && IS_ENABLED(CONFIG_SANDBOX)) {
+-		if (!fit_image_check_target_arch(fit, noffset)) {
+-			puts("Unsupported Architecture\n");
+-			bootstage_error(bootstage_id + BOOTSTAGE_SUB_CHECK_ARCH);
+-			return -ENOEXEC;
+-		}
++#if !defined(USE_HOSTCC) && !defined(CONFIG_SANDBOX)
++	if (!fit_image_check_target_arch(fit, noffset)) {
++		puts("Unsupported Architecture\n");
++		bootstage_error(bootstage_id + BOOTSTAGE_SUB_CHECK_ARCH);
++		return -ENOEXEC;
+ 	}
++#endif
+ 
+ #ifndef USE_HOSTCC
+ 	fit_image_get_arch(fit, noffset, &os_arch);
+@@ -2123,8 +2130,9 @@ int fit_image_load(bootm_headers_t *images, ulong addr,
+ 		return -ENOENT;
+ 	}
+ 
++#ifdef CONFIG_FIT_CIPHER
+ 	/* Decrypt data before uncompress/move */
+-	if (IS_ENABLED(CONFIG_FIT_CIPHER) && IMAGE_ENABLE_DECRYPT) {
++	if (IMAGE_ENABLE_DECRYPT) {
+ 		puts("   Decrypting Data ... ");
+ 		if (fit_image_uncipher(fit, noffset, &buf, &size)) {
+ 			puts("Error\n");
+@@ -2132,10 +2140,12 @@ int fit_image_load(bootm_headers_t *images, ulong addr,
+ 		}
+ 		puts("OK\n");
+ 	}
++#endif
+ 
++#if !defined(USE_HOSTCC) && defined(CONFIG_FIT_IMAGE_POST_PROCESS)
+ 	/* perform any post-processing on the image data */
+-	if (!host_build() && IS_ENABLED(CONFIG_FIT_IMAGE_POST_PROCESS))
+-		board_fit_image_post_process(&buf, &size);
++	board_fit_image_post_process(&buf, &size);
++#endif
+ 
+ 	len = (ulong)size;
+ 
+-- 
+2.30.2
+
-- 
2.30.2
