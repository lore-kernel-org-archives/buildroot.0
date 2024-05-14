Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B85C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 15:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB9981354;
	Tue, 14 May 2024 15:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4M1wL9uo7l27; Tue, 14 May 2024 15:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E203481372
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E203481372;
	Tue, 14 May 2024 15:44:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 181801BF955
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D529540544
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbOGuKjVmx_3 for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 15:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E68424053A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E68424053A
 for <buildroot@buildroot.org>; Tue, 14 May 2024 15:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D03EE873C2; Tue, 14 May 2024 15:44:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 17:43:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31c39632856ecd38d3597793e8273786d4f0614f
X-Git-Newrev: 9764258aaf0ef78ffd83e17d26959613b04b2944
X-Patchwork-Hint: ignore
Message-Id: <20240514154403.D03EE873C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/avenger96_defconfig: fix CI build
 error due to a missing package for uboot
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

commit: https://git.buildroot.net/buildroot/commit/?id=9764258aaf0ef78ffd83e17d26959613b04b2944
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This refers to https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124907
The build error referenced in that link is:

error: command 'swig' failed: No such file or directory
make[4]: *** [scripts/dtc/pylibfdt/Makefile:33: rebuild] Error 1
make[3]: *** [scripts/Makefile.build:397: scripts/dtc/pylibfdt] Error 2
make[2]: *** [Makefile:2014: scripts_dtc] Error 2
make[1]: *** [package/pkg-generic.mk:283: /builds/buildroot.org/buildroot/output/build/uboot-2024.01/.stamp_built] Error 2
make: *** [Makefile:82: _all] Error 2

BR2_TARGET_UBOOT_NEEDS_PYLIBFDT is added to the avenger96_defconfig in order to resolve the issue

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/avenger96_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index f73b654dc8..64cfb3c2b0 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -47,6 +47,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp15xx-dhcor-avenger96"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
