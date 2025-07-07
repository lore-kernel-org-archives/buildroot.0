Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB74BC71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 16:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0737608B8;
	Mon,  7 Jul 2025 16:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WM6h2MF8YHrw; Mon,  7 Jul 2025 16:48:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0553460B6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0553460B6E;
	Mon,  7 Jul 2025 16:48:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDBAA12E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 16:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A373360B6E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 16:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xj2PciXKvilH for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 16:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E69E3608B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E69E3608B8
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 16:48:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF75A86107; Mon,  7 Jul 2025 16:48:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Jul 2025 18:45:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: accb006d9b62079b56bc1f1388b558a60dde277a
X-Git-Newrev: 279cd778651b2f66122233ef6b958a91a5489027
X-Patchwork-Hint: ignore
Message-Id: <20250707164853.DF75A86107@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/loongarch: add lsx/lasx SIMD
 dependency on fpu64
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=279cd778651b2f66122233ef6b958a91a5489027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the LoongArch64 introduction in commit [1], the Kconfig menus
allows selecting lsx and lasx SIMD options independently of the FPU
configuration.

When lsx or lasx SIMD is selected and FPU is "none", host-gcc-initial
is failing at configuration time, with error:

    --with-simd=lasx conflicts with --with-fpu=none

According to the gcc configuration script [2], lsx and lasx values
are valid only if FPU is 64.

This commit adds the missing "depends on BR2_LOONGARCH_FPU_64" for
BR2_LOONGARCH_SIMD_LSX and BR2_LOONGARCH_SIMD_LASX options.

Fixes:
https://autobuild.buildroot.org/results/d159645dab9206dd46f45e79241fc8a950bd0326/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/54895db9c10a26283b25a393cb6c872d72c245d1
[2] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config.gcc;h=a6f6efec4e103301225ef74c2d1159933d1c9cf8;hb=1757c320badc92c0628eafcd07d54585659692ed#l5163

Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.loongarch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
index cf2a12ce42..1f302364b1 100644
--- a/arch/Config.in.loongarch
+++ b/arch/Config.in.loongarch
@@ -59,12 +59,14 @@ config BR2_LOONGARCH_SIMD_NONE
 
 config BR2_LOONGARCH_SIMD_LSX
 	bool "LSX"
+	depends on BR2_LOONGARCH_FPU_64
 	help
 	  Enable generating instructions from the 128-bit LoongArch SIMD
 	  Extension (LSX).
 
 config BR2_LOONGARCH_SIMD_LASX
 	bool "LASX"
+	depends on BR2_LOONGARCH_FPU_64
 	help
 	  Enable generating instructions from the 256-bit LoongArch
 	  Advanced SIMD Extension (LASX) and the 128-bit LoongArch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
