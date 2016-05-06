From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  6 May 2016 08:59:13 -0300
Subject: [Buildroot] [PATCH v2 1/1] uboot-tools: add missing dependency on
	host-dtc for the host package
In-Reply-To: <1462372709-24828-1-git-send-email-casantos@datacom.ind.br>
References: <1462372709-24828-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1462535953-4427-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mkimage utility needs dtc when support for Flat Image Trees (FIT)
is enabled. If dtc is not available mkimage may fail. Example:

    $ mkimage -f firmware.its firmware.im
    sh: dtc: command not found

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/uboot-tools/Config.in      | 16 +++++++++++++---
 package/uboot-tools/Config.in.host |  1 +
 package/uboot-tools/uboot-tools.mk |  5 +++++
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index aca310b..4622f6b 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -13,10 +13,22 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 	  The mkimage tool from Das U-Boot bootloader, which allows
 	  generation of U-Boot images in various formats.
 
-if BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
+config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SUPPORT
+	bool "Flat Image Trees (FIT) support"
+	depends on BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
+	select BR2_PACKAGE_HOST_DTC
+	help
+	  Enables support for FIT Signature Verification.
+
+	  This option allows to boot the new uImage structrure,
+	  Flattened Image Tree.  FIT is formally a FDT, which can include
+	  images of various types (kernel, FDT blob, ramdisk, etc.)
+	  in a single blob.  To boot this new uImage structure,
+	  pass the address of the blob to the "bootm" command.
 
 config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
 	bool "FIT signature verification support"
+	depends on BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SUPPORT
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enables support for FIT Signature Verification.
@@ -36,8 +48,6 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
 	  libcrypto, and possibly GPL/OpenSSL licensing
 	  incompatibility issues.
 
-endif
-
 config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
 	bool "mkenvimage"
 	help
diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index b5a42d9..5c44eaf 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_UBOOT_TOOLS
 	bool "host u-boot tools"
+	select BR2_PACKAGE_HOST_DTC
 	help
 	  Companion tools for Das U-Boot bootloader.
 
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index f47b3db..9bb2b54 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -65,6 +65,10 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
 endef
 
+ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
+HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
 endif
@@ -76,6 +80,7 @@ endef
 
 define HOST_UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE1) -C $(@D) 			\
+		CONFIG_FIT=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SUPPORT) \
 		CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) \
 		HOSTCC="$(HOSTCC)"		\
 		HOSTCFLAGS="$(HOST_CFLAGS)"	\
-- 
2.5.5
