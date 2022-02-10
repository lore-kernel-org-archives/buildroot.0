Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD89C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D50EB408BF;
	Thu, 10 Feb 2022 21:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5M9fHfrEJHC; Thu, 10 Feb 2022 21:31:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C95AE40562;
	Thu, 10 Feb 2022 21:31:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA131BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98E3882D0F
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0RcXTPfeTQJy for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:31:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B062782D40
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:31:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8169A60004;
 Thu, 10 Feb 2022 21:31:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nIH2R-0008WR-MR; Thu, 10 Feb 2022 22:31:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@xilinx.com>
References: <20220210081932.3114763-1-neal.frager@xilinx.com>
Date: Thu, 10 Feb 2022 22:31:39 +0100
In-Reply-To: <20220210081932.3114763-1-neal.frager@xilinx.com> (Neal Frager's
 message of "Thu, 10 Feb 2022 01:19:31 -0700")
Message-ID: <874k56wgqs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@xilinx.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@xilinx.com> writes:

 > This patch:
 > - bumps ATF to Xilinx v2.6: mainline v2.6 requires patch to build
 > - bumps U-Boot to Xilinx 2022.01: important drivers not in mainline
 > - bumps Linux to Xilinx 5.15: important drivers not in mainline
 > - deletes board/zynqmp/patches directory: patches already in mainline
 > - modifies board/zynqmp/genimage.cfg: U-Boot 2022.01 uses u-boot.itb format
 > - adds extlinux.conf to vfat bootfs
 > - modifies U-Boot to unified xilinx_zynqmp_virt_defconfig (supports all boards)
 > - adds support for SPL pm_cfg_obj.c loading to PMU firmware
 > - enables support for host machines without OpenSSL required by U-Boot and Linux

 > V3-> V4:
 > * cleaned up commit log messages
 > * added version history
 > ---

[snip]

 > +++ b/configs/zynqmp_zcu106_defconfig
 > @@ -1,34 +1,39 @@
 >  BR2_aarch64=y
 > -BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
 > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 >  BR2_LINUX_KERNEL=y
 >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
 >  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
 > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15"

xlnx_rebase_v5.15 is a branch. A git version should point to a tag og a
sha1 so the build is reproducible.

 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.6"

Same for xlnx_rebase_v2.6

 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 >  BR2_TARGET_UBOOT=y
 >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 >  BR2_TARGET_UBOOT_CUSTOM_GIT=y
 > -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
 > -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
 > -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu106_revA"
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2022.01"

And xlnx_rebase_v2022.01

I think I earlier asked you not to change the URL when it is not needed,
please leave the existing /xilinx/ URL.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
