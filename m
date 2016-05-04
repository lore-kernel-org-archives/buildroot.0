From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed,  4 May 2016 11:38:29 -0300
Subject: [Buildroot] [PATCH 1/1] uboot-tools: add missing dependency on
	host-dtc for the host package
Message-ID: <1462372709-24828-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mkimage utility needs dtc when the input is in Flat Image Trees (FIT)
format. If dtc is not available mkimage fails. Example:

    $ mkimage -f firmware.its firmware.im
    sh: dtc: command not found

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/uboot-tools/Config.in.host | 1 +
 package/uboot-tools/uboot-tools.mk | 2 ++
 2 files changed, 3 insertions(+)

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
index f47b3db..a07fbfa 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -65,6 +65,8 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
 endef
 
+HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
+
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
 endif
-- 
2.5.5
