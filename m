Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1390C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 20:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9935B60E46;
	Tue,  9 Apr 2024 20:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVOXtxxay55c; Tue,  9 Apr 2024 20:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1439F60E16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1439F60E16;
	Tue,  9 Apr 2024 20:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CAAC1BF3A4
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54BF4415C3
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFKatrUwQMlt for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02BAB4025D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02BAB4025D
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAB3285E30; Tue,  9 Apr 2024 20:50:29 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 9 Apr 2024 13:59:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cab57f1b449b412e6c0105ff45e72020ef87a8a
X-Git-Newrev: 6439a10e98523281c0f9be670bf9dd605a367025
X-Patchwork-Hint: ignore
Message-Id: <20240409205029.DAB3285E30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-r5-loader: install tiboot3.bin
 and sysfw.itb to BINARIES_DIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6439a10e98523281c0f9be670bf9dd605a367025
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With binman support enabled, u-boot for k3 r5 core (ti-k3-r5-loader)
install different target image (tiboot3*.bin) depending on the K3
SoC boot ROM:

- General Purpose devices (gp)
- High Security - Field Securable devices (hs-fs)
- High Security - Security Enforcing devices (hs)

An additional firmware binary is required on certain TI K3 devices such
as AM65 and J721e due to the "Split binary" boot flow [1]:

- Split binary with a combined firmware: (eg: AM65)
- Combined binary with a combined firmware: (eg: AM64)
- Split binary with a split firmware: (eg: J721E)
- Combined binary with a split firmware: (eg: AM62)

K3 SoC using Split Binary Boot Flow also requires sysfw-*.itb file
to boot (eg: am65, j721e). Only tiboot3*.bin is needed for other
boot flow.

From [1]:
"It's important to rename the generated tiboot3.bin and sysfw.itb
to match exactly tiboot3.bin and sysfw.itb as ROM and the wakeup
UBoot SPL will only look for and load the files with these names."

See the (not exhaustive) list of all tiboot3*.bin and sysfw*.itb file
variant found in meta-ti:

  meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf:UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
  meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf:UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
  meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/j721s2.inc:IMAGE_BOOT_FILES += "tiboot3-j721s2-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j721s2.inc:IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j722s.inc:IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j784s4.inc:IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j784s4.inc:IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/k3r5.inc:SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"

  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw.itb"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw-am65x_sr2-gp-evm.itb"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw-am65x_sr2-hs-evm.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e-gp-evm.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-fs-evm.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-evm.itb"

This firmware list can also be verified with the firmware name used in
the u-boot devicetree k3-*-binman.dtsi files.

On the SK-AM62B-P1, three tiboot3 binaries are built, one for each boot
ROM variant:

  tiboot3-am62x-gp-evm.bin
  tiboot3-am62x-hs-evm.bin
  tiboot3-am62x-hs-fs-evm.bin

A tiboot3.bin symlink is provided as default choice:

  tiboot3.bin -> tiboot3-am62x-hs-fs-evm.bin

On this board, the tiboot3.bin symlink links to the hs-fs variant
but it not always de case for all TI K3 devices.
(ex: J721e use gp variant by default).

The tiboot3.bin symlink links the -gp, -hs-fs, -hs tiboot3 binary
according to where "symlink = "tiboot3.bin";" line is located in
k3-*binman.dtsi.

As reported by Michael Walle [2], such firmware name can also be
customized by a SBC vendor [3], so we can't always be sure which
firmware to use.

If required, let the user provide a custom tiboot3 or sysfw firmware
name from the defconfig. Otherwise use the default firmware choice
by copying tiboot3.bin and sysfw.itb symlinks.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/doc/board/ti/k3.rst
[2] http://lists.busybox.net/pipermail/buildroot/2024-April/688943.html
[3] https://elixir.bootlin.com/u-boot/v2024.04/source/arch/arm/dts/k3-am625-phycore-som-binman.dtsi#L14

Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-r5-loader/Config.in          | 40 +++++++++++++++++++++++++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 35 ++++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 5f4f33b220..707f22ab4e 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -102,4 +102,44 @@ config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
 
 	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
 
+config BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN
+	string "tiboot3.bin binary name"
+	default "tiboot3.bin"
+	help
+	  Name of the TI K3 tiboot3.bin binary to use.
+
+	  The tiboot3 binary name must match with the TI K3 SoC boot
+	  ROM:
+
+	  - General Purpose devices (gp)
+	  - High Security - Field Securable devices (hs-fs)
+	  - High Security - Security Enforcing devices (hs)
+
+	  Or if the tiboot3 binary generated use a custom name.
+
+	  If unsure, use the default tiboot3.bin (symlink) generated by
+	  binman.
+
+config BR2_TARGET_TI_K3_R5_LOADER_SYSFW_ITB
+	string "sysfw.itb binary name"
+	default "sysfw.itb"
+	help
+	  Name of the TI K3 sysfw.itb binary to use (if any required).
+
+	  sysfw*.itb are only generated for Split binary based Boot
+	  Flow (eg: am65, j721e). This option is not used on other
+	  TI K3 devices.
+
+	  The sysfw binary name must match with the TI K3 SoC boot
+	  ROM:
+
+	  - General Purpose devices (gp)
+	  - High Security - Field Securable devices (hs-fs)
+	  - High Security - Security Enforcing devices (hs)
+
+	  Or if the sysfw binary generated use a custom name.
+
+	  If unsure, use the default sysfw.itb (symlink) generated by
+	  binman.
+
 endif
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index cf18b43871..36f87e577e 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -73,7 +73,24 @@ TI_K3_R5_LOADER_DEPENDENCIES += \
 	host-python-pylibfdt \
 	host-python-setuptools
 TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
-endif
+
+TI_K3_R5_LOADER_TIBOOT3_BIN = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN))
+
+define TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN
+	cp $(@D)/$(TI_K3_R5_LOADER_TIBOOT3_BIN) $(BINARIES_DIR)/tiboot3.bin
+endef
+
+TI_K3_R5_LOADER_SYSFW_ITB = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_SYSFW_ITB))
+
+# sysfw*.itb are only generated for Split binary based Boot Flow (eg: am65, j721e).
+# So, if sysfw.itb symlink exist we must copy it or the custom sysfw.itb.
+define TI_K3_R5_LOADER_INSTALL_SWSFW_ITB
+	if test -e $(@D)/sysfw.itb ; then \
+		cp $(@D)/$(TI_K3_R5_LOADER_SYSFW_ITB) $(BINARIES_DIR)/sysfw.itb ; \
+	fi
+endef
+
+endif # BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
 
 define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
@@ -81,6 +98,22 @@ endef
 
 define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
 	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
+	$(TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN)
+	$(TI_K3_R5_LOADER_INSTALL_SWSFW_ITB)
 endef
 
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER)$(BR_BUILDING),yy)
+
+ifeq ($(TI_K3_R5_LOADER_TIBOOT3_BIN),)
+$(error No custom tiboot3 name specified, check your BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN setting)
+endif
+
+ifeq ($(TI_K3_R5_LOADER_SYSFW_ITB),)
+$(error No custom sysfw name specified, check your BR2_TARGET_TI_K3_R5_LOADER_SYSFW_ITB setting)
+endif
+
+endif # BR_BUILDING
+
 $(eval $(kconfig-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
