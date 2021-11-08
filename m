Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C270EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 08:47:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4537B60EE9
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 08:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4537B60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E21A940187;
	Mon,  8 Nov 2021 08:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUrp_ibxWjah; Mon,  8 Nov 2021 08:47:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6D944027F;
	Mon,  8 Nov 2021 08:47:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90BB61BF393
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 08:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EEBA40285
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 08:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBW6469hg8lW for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 08:47:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A54140187
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 08:47:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 630798B5C0; Mon,  8 Nov 2021 08:43:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 09:45:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12ef36004b0f00d00e5b28b01a79791ec69a1aa0
X-Git-Newrev: 87b06f3a803a26b4d6822646ef3c2be0210ba163
X-Patchwork-Hint: ignore
Message-Id: <20211108084334.630798B5C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/sun20i-d1-spl: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=87b06f3a803a26b4d6822646ef3c2be0210ba163
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot does not yet have SPL code to initialize the DDR controller on the
Allwinner D1 - So instead package the sun20i-d1-spl bootloader, which is
based on boot0 from the Allwinner BSP with some modifications to build it
separately from the BSP and boot mainline U-Boot as explained on the
linux-sunxi wiki:

https://linux-sunxi.org/Allwinner_Nezha

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                            |  1 +
 boot/Config.in                        |  1 +
 boot/sun20i-d1-spl/Config.in          |  8 ++++++++
 boot/sun20i-d1-spl/sun20i-d1-spl.hash |  2 ++
 boot/sun20i-d1-spl/sun20i-d1-spl.mk   | 23 +++++++++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a2d34fdcc7..19d527b396 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2112,6 +2112,7 @@ F:	board/orangepi/
 F:	board/pandaboard/
 F:	board/roseapplepi/
 F:	boot/shim/
+F:	boot/sun20i-d1-spl/
 F:	configs/avenger96_defconfig
 F:	configs/beagleboneai_defconfig
 F:	configs/lafrite_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index ff98a49796..40472ae07d 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,6 +20,7 @@ source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
+source "boot/sun20i-d1-spl/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/sun20i-d1-spl/Config.in b/boot/sun20i-d1-spl/Config.in
new file mode 100644
index 0000000000..9d94d87b1c
--- /dev/null
+++ b/boot/sun20i-d1-spl/Config.in
@@ -0,0 +1,8 @@
+config BR2_TARGET_SUN20I_D1_SPL
+	bool "sun20-d1-spl"
+	depends on BR2_RISCV_64
+	help
+	  Allwinner D1 boot0 code with modifications to use as U-Boot
+	  SPL.
+
+	  https://github.com/smaeul/sun20i_d1_spl
diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.hash b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
new file mode 100644
index 0000000000..6ca60e5278
--- /dev/null
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  69063601239a7254fb72e486b138d88a6f2b5c645b24cdfe9792123f975d4a8f  sun20i-d1-spl-771192d0b3737798d7feca87263c8fa74a449787.tar.gz
diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.mk b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
new file mode 100644
index 0000000000..2462ce2322
--- /dev/null
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# sun20i-d1-spl
+#
+################################################################################
+
+# Commit on the 'mainline' branch
+SUN20I_D1_SPL_VERSION = 771192d0b3737798d7feca87263c8fa74a449787
+SUN20I_D1_SPL_SITE = $(call github,smaeul,sun20i_d1_spl,$(SUN20I_D1_SPL_VERSION))
+SUN20I_D1_SPL_INSTALL_TARGET = NO
+SUN20I_D1_SPL_INSTALL_IMAGES = YES
+SUN20I_D1_SPL_LICENSE = GPL-2.0+
+
+define SUN20I_D1_SPL_BUILD_CMDS
+	$(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)" p=sun20iw1p1 mmc
+endef
+
+define SUN20I_D1_SPL_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/nboot/boot0_sdcard_sun20iw1p1.bin \
+		$(BINARIES_DIR)/boot0_sdcard_sun20iw1p1.bin
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
