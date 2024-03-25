Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF70C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 21:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CC1D8199D;
	Mon, 25 Mar 2024 21:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqWGOVQrGNPV; Mon, 25 Mar 2024 21:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8736581DD8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8736581DD8;
	Mon, 25 Mar 2024 21:12:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1AAE1BF2CB
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 21:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE9DF405F8
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 21:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TiPW3YuweWn for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 21:12:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE7F6405F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE7F6405F1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE7F6405F1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 21:12:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 871B113F88F;
 Mon, 25 Mar 2024 22:11:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Mar 2024 22:11:56 +0100
Date: Mon, 25 Mar 2024 22:11:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZgHonLPkhwBT61zW@landeda>
References: <20240320221352.13766-1-fontaine.fabrice@gmail.com>
 <7b0c2b66-38d2-4853-8438-2671006a91a1@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b0c2b66-38d2-4853-8438-2671006a91a1@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711401122;
 bh=MOPsK3Z02/+YafR3oI49lk16ZCviq+qC2P79Z9gRoJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LmkB90sWCrYut31tIv1aRmTTOxEy4f75vRTErmfSFtjcjAteUYA4pBOAER04SpwPr
 r51BjfSDS6T95U6EAAhcFnzsN9glhVcvfza95ve/G/C0bzs0Dq/2phSsM9g2pkBtx9
 IkH6NkntPohsrQ5zJUrSXEOw1SHBRnp32KfdXtJklzOrDbmCgXyZ/rBjCcD8r7Uxod
 LoKib35ae6WuBBe4fbyDKSgGyYJCtXRw0ZN0Kxa1YK7PeMHorZQ83YsqYYFsxdWiFR
 8kJehZnn5sUtzc7DHkgcZRqJh3L1+xOziGETOa4Kvwua5SM8NKprGrCvvZO1wHsLd2
 H04r5dcrc/XSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LmkB90sW
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: disable riscv with
 uclibc
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2024-03-24 17:33 +0100, Arnout Vandecappelle via buildroot spake thusly:
> On 20/03/2024 23:13, Fabrice Fontaine wrote:
> > Disable riscv with uclibc to avoid the following build failure with
> > uclibc-ng < 1.0.43 raised since bump to version 2.1.6 in commit
>  I believe we generally don't fix issues in packages if the issue is
> actually in the libc itself. This does mean we will have build failures for
> older prebuilt external toolchains, but those we should fix using the
> exclusions in genrandconfig.
> 
>  I'm putting the other maintainers in Cc to check if they agree with my assessment.

+1

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
