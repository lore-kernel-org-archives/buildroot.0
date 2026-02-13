Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35364EDF145
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 10:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 434AE41B54;
	Fri, 13 Feb 2026 10:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-k1jYEKWl-c; Fri, 13 Feb 2026 10:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A6D9411EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770976973;
	bh=+UJvpaBTcvjIZBMZCIHgAige3CYhZxg26s9+yCzTmos=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qN4cDUuibJHDc2YYxYZ+iMjmb3zj/cD3X8UlFBUdd3PUhINY1TUoM9SNqQPNq/6yn
	 lejAfSTywocIWO8fScsS5muNjvQyYF/2tlpxwVlv+ZHyeN2AzjTbOAU3FJAkdZD44u
	 bR/tMyHk+6JPtCF6Anx2p7H1FLCEZtp/3kaW16+R6uvUI75HmE/bgzx0jexoF/1yob
	 NIdW9SJ0W6313O2lg00m/fpulOl4FPaN/yAiZCofj/q6ZuyBR0IC/6JCj1geyYtykd
	 xVgUiWZ1TnEbPAr/cvvJBz1+ACl9aq1FMPyESaWM+fq0ii0nDrUp9y5UaStoZvlKCC
	 Wod385b5iK2sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A6D9411EC;
	Fri, 13 Feb 2026 10:02:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E667EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6001F40267
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUqX8Fecewp3 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 10:02:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA62F401FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA62F401FF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA62F401FF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:02:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 74A9D60132;
 Fri, 13 Feb 2026 11:02:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Feb 2026 11:02:47 +0100
MIME-Version: 1.0
Date: Fri, 13 Feb 2026 11:02:47 +0100
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260211145739.2389857-1-romain.naour@smile.fr>
References: <20260211145739.2389857-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <4b92bb1b81c039056460c2d87f5fa069@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770976968;
 bh=SuXk72xk/cV5kzQCt/MnGi64VDKgrOCcdf1wtRg/dDk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xm80x/i9mgx6Utb9icNUjGlx3WHFeXO4foGHDkcfQDP1Y+XXoCbkdU9QTg8w43f0L
 6HKCsLjBgbnbYSDvwOJ3CPaECRoYZdD6oarVFIlGjNJMPm/k/VwYVSdDIR0gnM3Jya
 48DpjaZ8DsHTA+gs+/XzRJP/U9ASIfhkMeIdtBUgFza720HRJzh9hlRqII5OYq2HHG
 OpucNREQkVKHa4QCB3Nn6cqVYer9orlpWNBiVjc9nzMnZ7OjN71LXucdliGKTir2zB
 dky3Emptg1tnTx62lCSOKd1ZRT40IEE0OfrPxBPXsAQCCY0abi1s2wKBNJc6TGmCF1
 IcML5whPw6DBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Xm80x/i9
Subject: Re: [Buildroot] [PATCH] configs/beagleboneai64_defconfig: bump
 Linux to 6.12.70 and U-Boot to 2026.01
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

On 11/02/2026 15:57, Romain Naour via buildroot wrote:
> This commit:
> - updates the Kernel from LTS 6.6.30 to 6.12.70
> - updates U-Boot from 2024.04 to 2026.01
> - updates arm-trusted-firmware from v2.10 to v2.12 LTS
> - switches to Bootlin external glibc stable toolchain
> 
> Note: Using the kernel 6.18.9, the SD card fail at boot:
> 
>   mmc1: SDHCI controller on 4fb0000.mmc [4fb0000.mmc] using ADMA 64-bit
>   Waiting for root device /dev/mmcblk1p2...
>   mmc1: error -110 whilst initialising SD card
> 
> So let's use stable kernel 6.12.y for the time being.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
