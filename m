Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939E2C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 15:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B638111F;
	Sun, 20 Apr 2025 15:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Pc74Uy6l1cq; Sun, 20 Apr 2025 15:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4034D80F8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4034D80F8A;
	Sun, 20 Apr 2025 15:36:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 471BB1A0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 15:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37AB94048E
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 15:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qc3B0n-pP48i for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 15:36:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9CAA404D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9CAA404D8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9CAA404D8
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 15:36:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 416F319F58A;
 Sun, 20 Apr 2025 17:36:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Apr 2025 17:36:14 +0200
MIME-Version: 1.0
Date: Sun, 20 Apr 2025 17:36:14 +0200
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Francois Dugast <francois.dugast.foss@gmail.com>
In-Reply-To: <20250420132648.611706-1-fancp2007@gmail.com>
References: <20250420132648.611706-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <94284f78b05cb0cd9b0c2aadc63393c1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745163376;
 bh=Scuv3ZxOMRVv1WFfM78az9EE2c2NKRRietGTp3oKU2c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gJ5d+7AOH/AR5S47j2xAir3htZ3MzkCEIZ8FWw1t17XFYiO3fUXxPCSk6wIrWoAtv
 R1YKLi6tajnJJfKniEIV7dJ/ii2gV1T53l2v9ba3TAgBcPKLDJ7CvutJOs40uuXHMI
 olNNlS5LCfwojDEYY4y3IiSy+1Gy43eeKOFcFBYrS9f+tT89cgzgT84lMKmtGkGH5d
 ymjYm5oaquE4Y1LMkcT5Ic/rE4nHfRcy+qxG24jXjsZB3LKXSoPM4SsC/M6+hYRSBV
 hNNyD0JipxU7YibozYW/XuHdb6qJQgh66ZZMD1pX3j8WAjs6vRyiU5zx3U6H9GxrpP
 V2j6fIThR3Pqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gJ5d+7AO
Subject: Re: [Buildroot] [PATCH] configs/visionfive2: bump OpenSBI to 1.6,
 Linux to 6.12.24 and U-Boot to 2025.04
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/04/2025 15:26, Scott Fan wrote:
> The updated linux configuration is based on the defconfig from the
> JH7110_VisionFive2_6.12.y_devel branch of the starfive kernel fork [1].
> 
> [1] 
> https://github.com/starfive-tech/linux/blob/e0ef35bfe6683a541b57a0b73a5b95c97e3f93c3/arch/riscv/configs/starfive_visionfive2_defconfig
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
