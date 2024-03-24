Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8B2C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 18:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94DD5405D3;
	Sun, 24 Mar 2024 18:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xWU8SbCvaYO; Sun, 24 Mar 2024 18:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 696BD405D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 696BD405D7;
	Sun, 24 Mar 2024 18:01:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 583C21BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4582940469
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TF1_6Q5WpcZi for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 18:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1925040104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1925040104
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1925040104
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 18:01:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FD72FF806;
 Sun, 24 Mar 2024 18:01:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1roSA2-006ftW-0L;
 Sun, 24 Mar 2024 19:01:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 19:01:28 +0100
Message-Id: <20240324180130.1590984-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240324180130.1590984-1-peter@korsgaard.com>
References: <20240324180130.1590984-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 3/4] configs/nezha_defconfig: use mainline Linux
 6.6.22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The D1 support is now in mainline, so use that instead.  There is no
dedicated nezha defconfig, so use the riscv defconfig.  This defconfig has
most drivers as modules, so add mdev to ensure they get correctly loaded.

The defconfig does not have USB gadget/OTG support, so enable that using a
config fragment to make the USB-C connector work and get rid of the
following warning:

[    7.233418] musb-sunxi 4100000.usb: Invalid or missing 'dr_mode' property
[    7.240330] musb-sunxi: probe of 4100000.usb failed with error -22

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/nezha/linux.fragment |  2 ++
 configs/nezha_defconfig    | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)
 create mode 100644 board/nezha/linux.fragment

diff --git a/board/nezha/linux.fragment b/board/nezha/linux.fragment
new file mode 100644
index 0000000000..4b101eaacb
--- /dev/null
+++ b/board/nezha/linux.fragment
@@ -0,0 +1,2 @@
+CONFIG_USB_GADGET=y
+CONFIG_USB_MUSB_DUAL_ROLE=y
diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index 7f3070f419..e717c8a08d 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -1,13 +1,15 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/nezha/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/nezha/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.22"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/nezha/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-nezha"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
