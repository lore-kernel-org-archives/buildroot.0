Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B23C25B5F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 12:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8681F8219B;
	Wed,  8 May 2024 12:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNFtt8KW6rI1; Wed,  8 May 2024 12:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75CFD821AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75CFD821AB;
	Wed,  8 May 2024 12:55:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7521BF307
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 12:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17AA560753
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 12:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ibx8itdyymnT for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 12:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 691AF60646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 691AF60646
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 691AF60646
 for <buildroot@buildroot.org>; Wed,  8 May 2024 12:55:11 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D499535365EA; Wed,  8 May 2024 14:55:08 +0200 (CEST)
Date: Wed, 8 May 2024 14:55:08 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zjt2LJ9JGGPPWFu2@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715172909; bh=UOjpsINUq6vZjhDTJ2XJfGdCQgbv/5xNRk4LN2OtIJE=;
 h=Date:From:To:Subject:From;
 b=f+heyKSFY/6DcF+owd0fHt5YpGku4IU7icpv3YukXhHTPtt76vO2T0AsYNpxSHfI+
 LfY4onbqxWWsUF2XUe0OOBILdNb4kCRHgKxjfwVWQCLfg/7/R/aTdOoprm51SkA8fa
 9fxd99IZM43yeAoF5YZqq/4RqhwqAluiNFHMyavpFruiW6bp7LUI+iIR2Jzq1jTQDd
 j1J7i/wKdUVyORU+XttnnIM/lSWqmGFKt5Y1TySqAhoyIJ9KA7SzQlNSmrV/wnhoG4
 vxgFoaNUl/ISJz9Zis/9F2gUnGIQn4RDl8Yxs97lnZT81gR3234jMGReqG45UPPrIm
 Cn+nWDCNVKkJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=f+heyKSF
Subject: [Buildroot] [PATCH] package/uclibc: enable riscv32
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

Tested with qemu_riscv32_virt_defconfig.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2555487f06..9fd07400de 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
 	default y if BR2_mips64el
 	default y if BR2_or1k
 	default y if BR2_powerpc
+	# see libc/sysdeps/linux/riscv32/sys/asm.h
+	default y if BR2_RISCV_32 && (BR2_RISCV_ABI_ILP32 || BR2_RISCV_ABI_ILP32D)
 	# see libc/sysdeps/linux/riscv64/sys/asm.h
 	default y if BR2_RISCV_64 && (BR2_RISCV_ABI_LP64 || BR2_RISCV_ABI_LP64D)
 	default y if BR2_sh4
@@ -138,6 +140,7 @@ config BR2_UCLIBC_TARGET_ARCH
 	default "i386"	   if BR2_i386
 	default "x86_64"   if BR2_x86_64
 	default "riscv64"  if BR2_RISCV_64
+	default "riscv32"  if BR2_RISCV_32
 
 config BR2_UCLIBC_MIPS_ABI
 	string
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
