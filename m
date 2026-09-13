Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D734DC88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 924F0605F9;
	Sun, 13 Sep 2026 09:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLNpVqKbTK_W; Sun, 13 Sep 2026 09:51:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 69D79605FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789293091;
	b=pk73/YG3ch7a0XihVCz9RD5fQsRsCxoxgPwdQooixRp3rwCK9uzEZEOrIhSWzsLDdNHB
	 cVI9Sv5HHeDGxT/ihLKf0CLAABD4wpyb/t6wPnMt/zjjr91vHme9xz9diFkCVnNMH0+w4
	 TD8Vs/4pW1k3KYvbG2vcehMpJTKQtFWg6jEuxF935JACuQbdO7dxonE0gEUm42GFCTle0
	 ZZOmUB3uZKcyMMgnAeBiesIXKl9a7gpLdZZ49zpV2IwxaPuPgjTWmu3pjCP1hlqguAHuI
	 pd6DiMAupm+EIuYUbIGHVnx/IYuhMa+CW5fibwMOxS3pZrcPzVKyxZG+rrGvu3B604g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789293091;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6ywwMv0BJFWjCXvxgxRNDDRazNISiYVCTtsE2t7mxwI=;
	b=oe8awg/cbMRm5bl/WugGEMdfAuAs2PYgOrNRHNMtWDRLccdTdhvs5e2IPiLy5/T0V8OC
	 XVKqvH30pISp3NtLfXwjo69nF5caeVpejxw5mYgr8QfmKPM0LW1LATqeGRK6fyr7xB1WW
	 SoBv7nDoBPSzas7vE3KoCRv0rBPNqgRLw32Bfk9009VbczGUpfRKvtJBK+G/4+YpNqI9/
	 aZmyOzgdmBtePBi8YXlSzOqpEPSffXEKo7AvPJGzR9zAcO8Uaa8ghPysK1A/5YSZMLiK0
	 c8XiKgi8ZuclJlu3F1w9pURvdj9Ri210HStAkSfIRtLfFaX+wBXcikW49xHuPIHIhhg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789293091;
	bh=6ywwMv0BJFWjCXvxgxRNDDRazNISiYVCTtsE2t7mxwI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JtPF8bKHZVKPONQ8zADi27FzI0DTQbJ7hS7ODB001aeX+4pC+goMmoO7l2Dw2b0pT
	 i78hhFwaPQ1PHGDtmrKtAmNvf0lNpQ7xF4cff8D+9d7NMs7OATJWOPNKybDLlWD5Fr
	 yJRvzOMMvbM5Fj9q2Zg3woQ1kUeGQSX8W8gIOoM5qHG1Bsx4Pbd1Tk1g9sDaakTHAh
	 bu48jF1ijLNPZxmPQKpom7KUoVirEq7eOkXcQutrhcIE0bsn3mqOOzSxV+0g2fdxo6
	 1P67cxJ7iyzrGHPEwGedt7NZCVJ0lQG8iIej6o6IH5fPXG5hdPYj8faxT3ZsF98ZMh
	 ny/T77tZshKbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D79605FF;
	Sun, 13 Sep 2026 09:51:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF63324D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B519140648
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XGmNmUBERnX for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:51:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B737C40640
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789293088;
 b=mQ4g8m1UkBADikbZHidWzET/YzIgh0abPCcfNG3mzHJrpy6br7bYG5UZTY160s6e5fhl
 Y1NGI1KZ0dKmVSU73rp1VM5uqNMvxw8iBXiosY5kzlLo4Q6Rv84+U8JRLEwUFTMyvv4s1
 3b3OSpTOa4Tlkxz+YCJpvypTpYIoM2JOmbCLA8yOjOodcXXnjjwEvxWeQ5Rd+NRbdz/H3
 IaVgHH34KnVYt5Thpf/wDTjXCoCiCKjc7Q4iIi2FGE0ERpfWt5r7h5h1e7wiIx8IiCwE7
 DusW4eXSPAhsIxVGimZ/FqSTc/spBmuSB9wbJ+ywzW4rKNHS/YxKPdVvkFwN+kPTCJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789293088;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=7/3EJ6NcI4arCcF0B1uNjuNW55VCVmW1KOmvY1yrJso=;
 b=G11DsUCens6pa74J8kC35P1AmCEUclG5BatfZuvCzIDjuGkEYk2hSbn44rEOlOA2oswk
 5zHlGBerz8j0jKiEYScsz8wLqTT1fU5JQM9XeYsH+ItSISYKNN9IkrDIidb5bwteDqW/Y
 o5h8fsL+Ko0l6m/Dy76juQ9anHvqyXsmk/+GLMYZFK+Yo4gYxC8V74Icnff5OdaGqQEzM
 lG7DMzvUq9U/awzvuhemjwErLvtOdPYNezNOYC+SbtogXfDlfdKsMtRYwTeUlDgU4MaE0
 ZQsmoBRjiMPAympgGWl2VTeM86StV8z1GlVzF6LSDUN2pdqZ+W/nE+1pzeh+8Rb5pyw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HT5d5eWc; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B737C40640
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:51:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2DC8AC63450;
 Sun, 13 Sep 2026 09:52:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7B75460435;
 Sun, 13 Sep 2026 09:51:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 92F9811C7AFBA; 
 Sun, 13 Sep 2026 11:51:22 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 13 Sep 2026 11:51:14 +0200
Message-ID: <20260913095115.1622920-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913095115.1622920-1-thomas.petazzoni@bootlin.com>
References: <20260913095115.1622920-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH RE-RESEND 2/2]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate after
 ARMv7 EABIhf toolchain fix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The gen-bootlin-toolchains script has been fixed to generate more
correct conditions for the ARMv7 EABIhf toolchains (both little and
big endian). This change will make sure the toolchain cannot be
selected in a BR2_arm=y, BR2_ARM_CPU_ARMV8A=y, BR2_ARM_EABI=y
configuration.

Fixes:

  https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523/

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../Config.in.options                         | 40 ++++++++++++-------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 86d951e8a6..81cb3f0a05 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -8,8 +8,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_arcle && BR2_archs38
 	default y if BR2_arm && BR2_ARM_CPU_ARMV5 && BR2_ARM_EABI
 	default y if BR2_arm && BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF
-	default y if BR2_arm && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	default y if BR2_armeb && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	default y if BR2_arm && BR2_ARM_EABIHF && (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
+	default y if BR2_armeb && BR2_ARM_EABIHF && (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	default y if BR2_arm && BR2_ARM_CPU_ARMV7M && BR2_BINFMT_FLAT
 	default y if BR2_m68k_m68k && BR2_USE_MMU
 	default y if BR2_m68k_cf
@@ -770,7 +770,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf glibc bleeding-edge 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -794,7 +795,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	bool "armv7-eabihf glibc stable 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -817,7 +819,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armv7-eabihf musl bleeding-edge 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -841,7 +844,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 	bool "armv7-eabihf musl stable 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -864,7 +868,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf uclibc bleeding-edge 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
@@ -889,7 +894,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 	bool "armv7-eabihf uclibc stable 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -913,7 +919,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armebv7-eabihf glibc bleeding-edge 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -937,7 +944,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 	bool "armebv7-eabihf glibc stable 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -960,7 +968,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armebv7-eabihf musl bleeding-edge 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -984,7 +993,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 	bool "armebv7-eabihf musl stable 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -1007,7 +1017,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armebv7-eabihf uclibc bleeding-edge 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
@@ -1032,7 +1043,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
 	bool "armebv7-eabihf uclibc stable 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
