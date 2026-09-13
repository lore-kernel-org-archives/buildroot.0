Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D04C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3769B80E75;
	Sun, 13 Sep 2026 09:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swwhY4U3xkZj; Sun, 13 Sep 2026 09:51:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0D06B80E48
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789293089;
	b=o9FLMCFvdlCkITHtfEshnDxFuJanlfmam6Nx/vkgQ/qkf48Ey/qt/CgPDGtUi5TGlmtP
	 px1GnmBLeg9Foamr7WibNf+0nw5fHXzei0w8eFecr2BktPco3vI2t2MnJXkQozI4FeyUz
	 F3vQeyGjeP6JH8apyqeaspmcTGmiNCF439baSBlZtwApSDB2wib0ghxXYwbhOmIHOFIxE
	 DY65vMmjuWuyDlIV6+8/bqZnluFk4lIQ4/xZyBcjnevffS6g60RusKETR/5q67rJpzpdG
	 3RW6VseNs5oSzr9FT2w9niN3gWc1cnSxOjtN7ZQ6E08HGELp2a1SHlC7lTQRU9FcKDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789293089;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=00d5vqHJr5fS1denr9G+Zgqtn94LRaxl58FYOJEFbo0=;
	b=BegYMaSCZmLWVBZ1Hgyzd3yS/RdvaDVmACDVwP6qydCGgGYIWwC3SHOMN/p53uXDms0Z
	 cLQ+riK7vvXHqNtbt6tn0t6xLcimdT85JlcdGkZZtbmDjeLS7nTvtqfGKi7bcZQfWiUCy
	 fLvH/+7mcaU2d+NFCLnLBpjvwGMbVSbkwdOJhpW3gaQkbgzx9J84J/GVQyg0V81njdZJ7
	 KL/oeI+neYjGA3Zp5nWDppfiSgv8ansksJRXAUiT/BXmt7E5TIJL5oyrRHxy7khLcSR8E
	 25KnVtK8IlisPNnM3tjiPJVhSI34d7m12+Dj9L5iDFg9WSEmK3WwLBSUosylerbkpjQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789293089;
	bh=00d5vqHJr5fS1denr9G+Zgqtn94LRaxl58FYOJEFbo0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Ef59/7e7QRsYELWZ0iC1ew5CkyI2y/T2NJhxKIEgSd4scgsWTGJniPF1beX5smSG+
	 NGQ4FwkcRvrtuDhlYp5jnWyFlImjKVGx7LFejAp7UFlk2+lYl7y87lgNUrr/OIhgMt
	 1dMyULHonz9CWiQsJWKQp1nHIqAza2tfgo4fqJqy/EZye+WwzXzp1wFWvIw8ix4gaS
	 j6Qfi05qTZgSS0z5dJ1rjbswpoX40Qqv3MYgRepDAb0810kFBNTZBWcWiN/44YLz/P
	 orL0xsepiCjMHLnIarZXlKEUZB0stzhAFJMS22Hw+3igRUKbSLdQPGEvlHRiHbSKSx
	 0tXscRyHb5siA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D06B80E48;
	Sun, 13 Sep 2026 09:51:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7401523F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61D8F605FF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPCnFIgOHmtv for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:51:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EC4C6605F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789293086;
 b=OFRG7vupqZE27KoYgg5kpDgDyBGijHevXtjdgy5KQTOsqu7JnBwSbijkue79qxQ1Ytn+
 omDPQHkffFwhBCIxqEN73+HPJtwy31PBFwyJS10PA3r9IG8eMTn2kscoG+QJir2QDqSgN
 0lC6B09vjWXcTBvSmTz8GpnfXzT6oPqkChOoIBgdmup85tjBv3kH9JTldov6pemR7H1am
 2HQyXPO9JTiO/QwZN0KuzuuQvP4DQ5JPRa/Mb4LergHFd07YauchYeD0aIh/ZKeIYjcw4
 Tzxgh9qANxSnQ24hgrT5kWcYDN3PjWyE4I70eMGOzsl627enXr2eULsUjXD5q5AjTIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789293086;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=5RQqMhM9r3r2kMz2hhtA32Htch/QpxgszmyCgs7xCAo=;
 b=WHgxkhqObB3PtUCfzMZRyxmuntKW9p/YJYtFptMfwqrvKiPw0QTm0jlk5NfWD6e0mCHt
 bdEBqcv2SdQBFkKSg2twb1qJO9ZM061WjYAjqVztKaLIujyNYZ+7YZaDY4jxqcmwW4a1V
 ZFbKtsImtmqVVeVejekx2HMa2n0RnEH4lB4JSxaXWMH4orOZj5H/ZFjRaNHJHoBMj8EVv
 n5P+V3sc79CCgtFGxfMojMoz2e/ixyRiteZKJJdVe/NylQus2J1yj+RHbhEbr1a3GEc/K
 riOGJn4NFbh7gogquKxukkdFez+lOqyKdwImQV+HcD5v2Adx6Ab1Jp8nhBVmRTLp9Gw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hzxC0wiz; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC4C6605F9
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:51:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6701C1A04E4
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:51:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 363D560435;
 Sun, 13 Sep 2026 09:51:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4B93B11C7AF95; 
 Sun, 13 Sep 2026 11:51:21 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 13 Sep 2026 11:51:13 +0200
Message-ID: <20260913095115.1622920-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH RE-RESEND 1/2]
 support/scripts/gen-bootlin-toolchains: fix ARMv7 EABIhf toolchains
 condition
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

The ARMv7 EABIhf toolchains can currently be selected with ARMv8 cores
selected, even when EABI is used due to how the condition is
constructed. This obviously fails as those toolchains are EABIhf,
causing the following build issue:

Incorrect ABI setting: EABI selected, but toolchain is incompatible

This is for example what happens with:

BR2_arm=y
BR2_cortex_a32=y
BR2_ARM_EABI=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE=y

In order to address this, we adjust the script generating the Bootlin
toolchain package so that EABIhf is required for both ARMv7 and
ARMv8.

Please note that we already require BR2_arm for those toolchains, so
we are *only* talking about ARMv8 cores being used in 32-bit mode.

This will be needed to fix:

  https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523/

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 4579949d18..ee64a86902 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -53,12 +53,12 @@ arches = {
         'prefix': 'arm',
     },
     'armv7-eabihf': {
-        'conditions': ['BR2_arm', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
+        'conditions': ['BR2_arm', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
         'test_options': ['BR2_arm', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armebv7-eabihf': {
-        'conditions': ['BR2_armeb', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
+        'conditions': ['BR2_armeb', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
         'test_options': ['BR2_armeb', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'armeb',
     },
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
