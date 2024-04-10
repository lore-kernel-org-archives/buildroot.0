Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76ECCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 20:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6560403C4;
	Wed, 10 Apr 2024 20:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5ZugawN0SJx; Wed, 10 Apr 2024 20:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B85D341722
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B85D341722;
	Wed, 10 Apr 2024 20:00:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 544351BF59A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EEB84174C
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7P1YRNHyUkL for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 20:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 578A841759
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 578A841759
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 20:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F93F85ECA; Wed, 10 Apr 2024 20:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 21:52:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07d3c7e263673864274d81071d71543cea06847c
X-Git-Newrev: 84577b53da631e38411d91affc13feca5caccfa9
X-Patchwork-Hint: ignore
Message-Id: <20240410200011.4F93F85ECA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/nezha_defconfig: use mainline
 Linux 6.6.22
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=84577b53da631e38411d91affc13feca5caccfa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The D1 support is now in mainline, so use that instead.  There is no
dedicated nezha defconfig, so use the riscv defconfig.  This defconfig has
most drivers as modules, so add mdev to ensure they get correctly loaded.

The defconfig does not have USB gadget/OTG support, so enable that using a
config fragment to make the USB-C connector work and get rid of the
following warning:

[    7.233418] musb-sunxi 4100000.usb: Invalid or missing 'dr_mode' property
[    7.240330] musb-sunxi: probe of 4100000.usb failed with error -22

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/nezha/linux.fragment |  2 ++
 configs/nezha_defconfig    | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
