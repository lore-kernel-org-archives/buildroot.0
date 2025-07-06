Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA1EC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 10:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 944E860C14;
	Sun,  6 Jul 2025 10:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HioI04ouLtFV; Sun,  6 Jul 2025 10:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07DDC60672
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07DDC60672;
	Sun,  6 Jul 2025 10:59:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D00A12E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1373B40914
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kx5nqhgP4kx5 for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 10:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C36240818
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C36240818
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C36240818
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:59:23 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E1901B00579;
 Sun,  6 Jul 2025 12:59:17 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Julien Olivain <ju.o@free.fr>
Date: Sun,  6 Jul 2025 12:58:59 +0200
Message-ID: <20250706105859.292908-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751799560;
 bh=ZBkhFSj4pns0oU69ziJXcuvV7IJDpMIXIbMBU6KENEU=;
 h=From:To:Cc:Subject:Date:From;
 b=SfkMI0Xc6bA9HVr8KDVCQQkRSlGCwZmiYAcUwVyndBfaZEyxOoCTLpwgYbeq4QwwV
 4pEyqDM3gOhmQGRVtW0u5jEy6EXYsZquFbxX/pBtmNM/QRZihXjrZNSIe9NdEY0UYP
 0hqFcoKY1OvrZhwGRjKCU7q8ijR8nfxQipxRNYo+ogz2iGPZG1h/g9Ycx9qQu5gUb+
 /51b7UZQqDLL1D44hXuoNHNHLl+Jbt6/M1zoczjIJ1PRHwlnxYcu83gR4QaCxgUSxf
 DTSENj9XwAcz1BNZ0TmfPCYqYrwAy9ei8oTezC6pBcaLWq9v2KAUVJLmwGfMCjBxHz
 WodgZEe4H1NPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SfkMI0Xc
Subject: [Buildroot] [PATCH 1/1] arch/loongarch: add lsx/lasx SIMD
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Note: while this patch adds the missing dependencies, it also reveals
a new issue. For LoongArch, Gcc infers ABI from the target triplet
and seems to ignore --with-abi values. Even if with this patch, the
Kconfig values are correct (ABI/FPU/SIMD), gcc configuration is still
failing with a new error:

    lp64d/base ABI cannot be implemented with --with-fpu=none.

This is because the target triplet is loongarch64-buildroot-linux-gnu
which will select the lp64d ABI. See:
https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config.gcc;h=a6f6efec4e103301225ef74c2d1159933d1c9cf8;hb=1757c320badc92c0628eafcd07d54585659692ed#l5102

Jiaxun, could you have a look on how to adjust this target triplet
and ABI, please?  Another option could be to remove support for
lp64s and lp64f ABIs.
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
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
