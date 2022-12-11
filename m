Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A84C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FB34054A;
	Sun, 11 Dec 2022 17:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8FB34054A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nK1O8XUcBqvz; Sun, 11 Dec 2022 17:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD61940510;
	Sun, 11 Dec 2022 17:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD61940510
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6FD1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD09F812C2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD09F812C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iquzb_anSe6g for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:04:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2052480D20
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2052480D20
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09065864B6; Sun, 11 Dec 2022 17:04:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 18:04:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 607665e3cecd967759344d6c702babe82ffa604c
X-Git-Newrev: c19e0bdc5621518986dfa04ced0dadd3c53e193c
X-Patchwork-Hint: ignore
Message-Id: <20221211170444.09065864B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal_vck190_defconfig: use
 correct u-boot.dtb in boot.bin
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

commit: https://git.buildroot.net/buildroot/commit/?id=c19e0bdc5621518986dfa04ced0dadd3c53e193c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes a problem in the vck190 boot.bin generation as it should be
using the u-boot.dtb as the u-boot device tree and not the Linux system.dtb.
While both dtbs are basically the same, it is better not to mix this up.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/versal/post-image.sh      | 2 +-
 board/versal/uboot.fragment     | 1 +
 configs/versal_vck190_defconfig | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 890522c31d..f45f29a155 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -24,7 +24,7 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	  }
 	  image {
 	    id = 0x1c000000, name=apu_subsystem 
-	    { type=raw, load=0x00001000, file=${BINARIES_DIR}/system.dtb }
+	    { type=raw, load=0x00001000, file=${BINARIES_DIR}/u-boot.dtb }
 	    { core=a72-0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
 	    { core=a72-0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
 	  }
diff --git a/board/versal/uboot.fragment b/board/versal/uboot.fragment
new file mode 100644
index 0000000000..6f71907379
--- /dev/null
+++ b/board/versal/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_OF_SEPARATE=y
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index d87df221c6..fcda6eb431 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -25,10 +25,12 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/versal/uboot.fragment"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_PACKAGE_VERSAL_FIRMWARE=y
 BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="v2022.2"
 BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
