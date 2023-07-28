Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998C8EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 21:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B460614E1;
	Fri, 28 Jul 2023 21:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B460614E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxuEPFc1hCIv; Fri, 28 Jul 2023 21:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6901761247;
	Fri, 28 Jul 2023 21:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6901761247
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81B641BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B82E84584
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B82E84584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5e13MuVourx for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 21:00:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6277F84581
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 21:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6277F84581
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51E4483A26; Fri, 28 Jul 2023 21:00:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 23:00:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 233ff41fdb4867638237a6626dd320d46e57f051
X-Git-Newrev: f187fad22d692f046441976efcd4385692a48261
X-Patchwork-Hint: ignore
Message-Id: <20230728210057.51E4483A26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f4xx_defconfig: off network
 utils from busybox
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f187fad22d692f046441976efcd4385692a48261
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel is built without network support, so network utils are useless.
This has a positive impact on the size of busybox and xipImage, making
them smaller.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiegineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../common/stm32f4xx/busybox.fragment               | 21 +++++++++++++++++++++
 .../common/stm32f4xx/stm32-post-build.sh            |  3 +++
 configs/stm32f429_disco_xip_defconfig               |  1 +
 configs/stm32f469_disco_sd_defconfig                |  1 +
 configs/stm32f469_disco_xip_defconfig               |  1 +
 5 files changed, 27 insertions(+)

diff --git a/board/stmicroelectronics/common/stm32f4xx/busybox.fragment b/board/stmicroelectronics/common/stm32f4xx/busybox.fragment
new file mode 100644
index 0000000000..d0bf2cb99d
--- /dev/null
+++ b/board/stmicroelectronics/common/stm32f4xx/busybox.fragment
@@ -0,0 +1,21 @@
+# CONFIG_FEATURE_HWIB is not set
+# CONFIG_HOSTNAME is not set
+# CONFIG_DNSDOMAINNAME is not set
+# CONFIG_FEATURE_HTTPD_PORT_DEFAULT is not set
+# CONFIG_IFCONFIG is not set
+# CONFIG_FEATURE_IFCONFIG_HW is not set
+# CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
+# CONFIG_IFUP is not set
+# CONFIG_IFDOWN is not set
+# CONFIG_IP is not set
+# CONFIG_IPADDR is not set
+# CONFIG_IPLINK is not set
+# CONFIG_IPROUTE is not set
+# CONFIG_NC is not set
+# CONFIG_NETSTAT is not set
+# CONFIG_PING is not set
+# CONFIG_ROUTE is not set
+# CONFIG_TC is not set
+# CONFIG_TELNET is not set
+# CONFIG_WGET is not set
+# CONFIG_UDHCPC is not set
diff --git a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
index 2ac9c653c3..4fcce61500 100755
--- a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
+++ b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
@@ -1,4 +1,7 @@
 #!/bin/sh
 
+# Busybox is built without network support
+sed -i '/hostname/d' ${TARGET_DIR}/etc/inittab
+
 # Kernel is built without devpts support
 sed -i '/^devpts/d' ${TARGET_DIR}/etc/fstab
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 5640d9dc4d..d4e000487a 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f429-disco"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 662ce3b3d0..8b10bc6741 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index ae2780556a..e362a99851 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
