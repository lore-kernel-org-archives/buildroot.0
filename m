Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B62CFA462
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A7314080E;
	Wed, 23 Oct 2024 19:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yv2B767TKUmF; Wed, 23 Oct 2024 19:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4206C40838
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4206C40838;
	Wed, 23 Oct 2024 19:54:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7034B4960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B6096072B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nY_tCf2bcd97 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9573E6062A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9573E6062A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:54:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8256F863EA; Wed, 23 Oct 2024 19:54:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 21:53:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b4bd2696235dd1949c3bed63187b3017ea71e9f
X-Git-Newrev: 93487f1566974d17630a432e2cc3db38b29c888d
X-Patchwork-Hint: ignore
Message-Id: <20241023195429.8256F863EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rock5b: enable uboot-env on the SD
 card
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=93487f1566974d17630a432e2cc3db38b29c888d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having the uboot environment defined on the SD card allows the user to
use the uboot setenv and saveenv commands to make persistent changes
(e.g. to change the boot order, or to set a server IP for PXE boot).

Set the uboot-env partition type GUID to "U-Boot environment", see:
https://github.com/u-boot/u-boot/blob/v2024.10/doc/README.gpt#L288
https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
and enable CONFIG_PARTITION_TYPE_GUID such that uboot will automatically
find the SD card partition to store/load the uboot environment to.

We need to mark the root partition as bootable, otherwise uboot will no
longer be able to boot the partition by default. (Most likely because
the root partition is now no longer the first partition on the device.)

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/radxa/rock5b/genimage.cfg    | 7 +++++++
 board/radxa/rock5b/u-boot.fragment | 5 +++++
 configs/rock5b_defconfig           | 1 +
 3 files changed, 13 insertions(+)

diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
index 43bb65bdd9..070cc03dc2 100644
--- a/board/radxa/rock5b/genimage.cfg
+++ b/board/radxa/rock5b/genimage.cfg
@@ -11,8 +11,15 @@ image sdcard.img {
 		offset = 32K
 	}
 
+	partition uboot-env {
+		partition-type-uuid = 3de21764-95bd-54bd-a5c3-4abe786f38a8
+		offset = 16M
+		size = 64K
+	}
+
 	partition rootfs {
 		partition-type-uuid = L
 		image = "rootfs.ext2"
+		bootable = true
 	}
 }
diff --git a/board/radxa/rock5b/u-boot.fragment b/board/radxa/rock5b/u-boot.fragment
new file mode 100644
index 0000000000..ceba8d609a
--- /dev/null
+++ b/board/radxa/rock5b/u-boot.fragment
@@ -0,0 +1,5 @@
+CONFIG_ENV_SIZE=0x10000
+CONFIG_PARTITION_TYPE_GUID=y
+# CONFIG_ENV_IS_NOWHERE is not set
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SYS_MMC_ENV_DEV=1
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index d75ad585fb..af748a5d25 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -34,6 +34,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
