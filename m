Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DD4C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 20:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0AB041992;
	Wed, 15 Jan 2025 20:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RcAatLOpDTc; Wed, 15 Jan 2025 20:40:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7018F4196F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7018F4196F;
	Wed, 15 Jan 2025 20:40:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 840FEB8B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CF244198D
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdjeWQ90Jn7S for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 20:40:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33B9C4196F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33B9C4196F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33B9C4196F
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:40:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3EB23780333;
 Wed, 15 Jan 2025 21:40:41 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53026])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Jan 2025 21:40:41 +0100
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 21:40:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <c0b59224321a5c7e500cdca98a1bc498@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736973643;
 bh=RjM1cC0urMKdbLBzniZq2EdqX6T+1tKTs3jf5u70q7I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q/8MDKgbBMd2DJe0tZMcYfDvk0HorD7kK/2EgtSJihsicaweUEE6BqITX6VgEDlDR
 q6XArEwFHGhLgKWYVDpsufquR2G5xXab74Yb/MKa/HMNKV4zrZshYeByk5CGic+gEu
 LVaf5zwUIaJ58vkcz/5UlxyIspYSaPMOhcXUZmsNeBA8LpcQX8orpBf+3vUz1x5dqX
 xulOXXo2maufYMIqq3eoiWl7uNC/h6SO2v+0GIpQkmEszpditIY9aLVp2tZcoIZ+uU
 G7tITnwm8NW/ahv2JluydgCEoebvzTSXZ7oz34aPcn5wJJfDSlNsGEEVWX9pG+W4ub
 wE3x+wuyES7Sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q/8MDKgb
Subject: Re: [Buildroot] [PATCH 01/12] support/config-fragments: remove
 nios2 toolchain
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

Hi Romain,

On 09/01/2025 00:05, Romain Naour via buildroot wrote:
> The nios2 architecture was deprecated in gcc-14 and has been removed
> in the upcoming gcc-15 [1][2].
> 
> Our last and only nios2 defconfig "qemu_nios2_10m50_defconfig" was
> removed in 2024.11 due to nios2 removal from Qemu 9.1.0 [3].
> 
> Remove nios2 testing from Buildroot autobuilders.
> 
> [1] https://sourceware.org/pipermail/binutils/2024-April/133675.html
> [2] 
> https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e876acab6cdd84bb2b32c98fc69fb0ba29c81153
> [3] f96b4c176f6e9d6c4374a0d322de672bf44c35bf
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Julien Olivain <ju.o@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

I merged this series into master, thanks.

Since we just merged
https://gitlab.com/buildroot.org/buildroot/-/commit/2ddc5808cd19f577917566ad83e2a3835d6d43b9
which is adding the BR2_BROKEN symbol, I applied this v1 instead of the 
v2
which was avoiding this symbol, posted in:
https://lore.kernel.org/buildroot/20250110195359.3358022-1-romain.naour@smile.fr/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
