Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B761C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:45:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3902460F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3902460F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1540583DDF;
	Tue,  3 Aug 2021 23:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TuELuy4syVEr; Tue,  3 Aug 2021 23:45:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6344C83D5C;
	Tue,  3 Aug 2021 23:44:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14A071BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEE3940F30
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RaNj5hZlhpOZ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACB7040EB5
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 037D586AA7; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 21:25:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 65a00a4570361376a324f86e7569741e99fc05c6
X-Git-Newrev: 3abd21bcd929442dabbea9c95199e35f4fc44f6e
X-Patchwork-Hint: ignore
Message-Id: <20210803211008.037D586AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/beaglev: switch to
 upstream opensbi generic platform
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=3abd21bcd929442dabbea9c95199e35f4fc44f6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch from the starfive-tech opensbi to upstream repo and use generic
platform now that it supports the console uart [1]. This landed after
the 0.9 release [2], so the current head of master branch is used [3].

FW_FDT_PATH is set to u-boot.dtb so that the device tree from U-Boot
will be included in the OpenSBI build [4]. Note that U-Boot must have
CONFIG_OF_SEPARATE enabled for U-Boot to build u-boot.dtb [5].

[1] https://github.com/riscv/opensbi/commit/e822b7504df0583a6a227d51cb7da8ea9fc79c0a
[2] https://github.com/riscv/opensbi/commit/234ed8e427f4d92903123199f6590d144e0d9351
[3] https://github.com/riscv/opensbi/commit/79f9b4220ffa7f74356054be25d450d7958bf16c
[4] https://github.com/riscv/opensbi/blob/master/docs/firmware/fw.md
[5] https://github.com/u-boot/u-boot/blob/master/doc/README.fdt-control

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/beaglev_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 39872b6d0b..82a6e9abc4 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -23,12 +23,13 @@ BR2_TARGET_BEAGLEV_DDRINIT=y
 BR2_TARGET_BEAGLEV_SECONDBOOT=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
-# HEAD of the Fedora branch
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,opensbi,2524b0ecd8684b42bc7a4c69794f40f11cbbe2a5)/opensbi-2524b0ecd8684b42bc7a4c69794f40f11cbbe2a5.tar.gz"
-BR2_TARGET_OPENSBI_PLAT="starfive/vic7100"
+# upstream opensbi master branch
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,riscv,opensbi,79f9b4220ffa7f74356054be25d450d7958bf16c)/opensbi-79f9b4220ffa7f74356054be25d450d7958bf16c.tar.gz"
+BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_DYNAMIC_IMG is not set
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
+BR2_TARGET_OPENSBI_FW_FDT_PATH=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
