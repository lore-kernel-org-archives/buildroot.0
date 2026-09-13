Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256ECC88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F3E60604;
	Sun, 13 Sep 2026 10:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAkDZCCY06OH; Sun, 13 Sep 2026 10:02:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0E9F460621
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789293742;
	b=mo1U2EF3xotbS5bYNPSpvGHaHJmcSG8QtbFP2oeNmaPzgp06b9WII5RveaInLKyN6aue
	 yhWeAYJASrd+to3XtFKmtv/NkJzJQo+kCUxNyUnHYmgV1mPsEN+30imC++GBWA0k1M5UB
	 RHitI9FUjJNVjDw1cuQE8a1u1nGoeNG5mgoniIGzbvrDMCGJUIndCdLvgiEBG84pRsTn8
	 OnYu8PayKUTh81SfEfGaYR6r6gTRQHQzADynX7Vh+IFhe6zaE9yHj4J/CBri7kuatMhz4
	 wvthts0Sk9MT0aQ9tiMcfcSFxxZ6gOulgYKXPrU4CtbarpaTnJu4fnXa+CSPMV84VGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789293742;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=PhK3RszA2tINdJUmGNWfAtqf5IteqporuGPm0BJyso4=;
	b=RiGjFxBqeE9kzGFZUtVOU+Hc/WmLWtmi3Q1+UUcVuCywqjUBvVJpLsN7Ggs5I450YRfN
	 y0mk8/fK5Va0QcGJ1rdDP345Tn/qjJTvU0KYwsAhmm/ONvEHINO1nQf4fFzEElEHAERca
	 tYnbeCOG2W762SUcWJ7bxwbiLxz2p37xpmP0IrWb0mtYzI/9LLV/FN+GvzJMZZZ7BYDV7
	 HkncQUQ4q8+bgPszCFKaNIRA8hUigpZPYj1LA5cS319pRjJoMIVm4dI9BzALRXgm/COai
	 /2eOf8Lyw+i2J5czyT3mZcMprWn2kDazH/kdm/+ZOA9dqA91YRtN5S519NHw5GhcFhA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789293742;
	bh=PhK3RszA2tINdJUmGNWfAtqf5IteqporuGPm0BJyso4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rrgo3YejtW6AlvTIkRDcpubl/tmsDxYlYqoGrAxGr7ZJ5hlkeQedpWcBgF3Ug22Tw
	 TPbFmRBV5eXQoEQeNnVMfZ2F7ButQkxFtJJRqnHfkEfASF0arzGkD1XyvBcK4cDXC9
	 13UBQWOiJvIDEA9TJSRovem23qtmh5rtA78fCIMe/ODTa/Q1AQtWXP6SuO2yB77Xo7
	 AOtuviOfcgPsbmcHd9NV8mLPxVpj36RiDC3nKHSB5DEWzqMxkqROTRQ8xlT5gDst/2
	 T/KxTCL4sgkiYE7Km2TkYtiPpCodudS59ma3QXxBaCqUjfuR1+/QuhmGYSu6IsiSRZ
	 DIUMiaF6o738g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E9F460621;
	Sun, 13 Sep 2026 10:02:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 153C4EB
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 066BA80E76
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPKRWRWhdqvW for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:02:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E7F5780E3E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789293739;
 b=PHlvR1dAXm9nGErXct8hkDz0POgi4Ke/VmWJ4dSce0G/Vi6eoWxWzk7ACpDyG9cfygcz
 nLAuLJyweLLDowM/mb4bZvZKqFRpcv3Ta/bv+5q426OUmbtF+OW9l11aAA7KtR/1C0yAK
 Z1bMr2eMKF86i5CMn59LJQm5KJDDrcFbNOmntvm9vwkkAiccx+5EQqhZCrrw8sthQpsg1
 m0XFqnnuTCA6XPDO5fGQThAtk0mcGxrrMrzCSu+6wXpYG0gSUYJ9I8TCOx6bBq3etjk7E
 FUMnXVPPvRLsWoiTj9pGPGE74JuD61FUS2Yi4XNrVSxS8Q1WYxFvcFk2lRxooIyIFNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789293739;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=cPIWZ+qk/LKALHGm9mCD5oKIJ5nJaYAYLqLdZmVR9TE=;
 b=YkMp3YjC+mgKemzSynvIqU2NksC/+cXWEHefvJ01t1S06XsvFj1q2qltyGDM+jggR17y
 Tkh3i89xv1vUEMHinqWZYtIzB7K+CrA6fq9RCVcOAaDpJgxySzNSazcqu1IKLtNEwqv7r
 D5yjbJHYCJfmGox+KSDIA/3oytJSPBXSzNmEMSmEpF5sXhWrq2O3dAWxeyZ60b8aYKMNP
 p2MhoTXGXCZ30kazRKioeEaIl185oQeHfpPNNk2G8c3yTtZ8MT4W1uAkV/NmfezUwKl5B
 MKq2XnC5blNoTfmkOK1Oh18h1bC8/T9pxHgzaCI8bEkQiC5uLIJBAav51yZdQD8sAQA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RSAMgjq4; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7F5780E3E
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:02:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BC99978035E;
 Sun, 13 Sep 2026 12:02:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 12:02:15 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 12:02:15 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260913095115.1622920-1-thomas.petazzoni@bootlin.com>
References: <20260913095115.1622920-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <22b5538ed379237ea5ac9edcd55fd5a6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH RE-RESEND 1/2]
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/09/2026 11:51, Thomas Petazzoni via buildroot wrote:
> The ARMv7 EABIhf toolchains can currently be selected with ARMv8 cores
> selected, even when EABI is used due to how the condition is
> constructed. This obviously fails as those toolchains are EABIhf,
> causing the following build issue:
> 
> Incorrect ABI setting: EABI selected, but toolchain is incompatible
> 
> This is for example what happens with:
> 
> BR2_arm=y
> BR2_cortex_a32=y
> BR2_ARM_EABI=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE=y
> 
> In order to address this, we adjust the script generating the Bootlin
> toolchain package so that EABIhf is required for both ARMv7 and
> ARMv8.
> 
> Please note that we already require BR2_arm for those toolchains, so
> we are *only* talking about ARMv8 cores being used in 32-bit mode.
> 
> This will be needed to fix:
> 
>   
> https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523/
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
