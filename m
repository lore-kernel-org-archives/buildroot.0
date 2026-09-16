Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD0AC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B8C140635;
	Wed, 16 Sep 2026 19:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zF37wIhemYnN; Wed, 16 Sep 2026 19:46:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3E16D4046C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789588011;
	b=qcdg9N535Gu6PD/SQEnShVTM7w3QBQAwZ2x7L15yzLF2zGPAqtjOiT7qTtIidCtuJVex
	 GsttRY0SXUzwTtNff7Awh6ZdWRejEbxf3y4dHsI/zGJeHp8CMBzijDhjeGimxw1ZvGrdM
	 ZlnO0O7ROIA3LC7AqsFalTjp82p4EA0ABeggC7rBAA/Bhc9H3HgukAbB+P22q+hu5HKGp
	 V9NNWFq16qu3KrIsHNWwaQXGMHFBmXtPeZdiFg1p1NEVSxKccY0x65IlaIubFJ2L0Jdr0
	 J/i7Jq9aaDq9mtxwEJ0/MlIrIAaaDVxbImpo6uYGCud1MN9dhyUqO9xoyjtkEMllJ8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789588011;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vp5CPsVkQy4Sah9E5hPByVS7vFVCzxnkpcRDPuJXVnk=;
	b=Po1q76OeNFAfDmQBX2K+KGRtBUDn+onKxvpbWuMJMDV6ELEwuaDxPONwDnoXFs1HDDKi
	 QD4NaE2y7nz4iAPVtMnopsrQuO8qxjLwi66eypXOHFnXpW758uLjqHrASbWZy7MxPCWxI
	 KYOSI3FfCK46aKJ/hvw+3xA412F20tqga/L5zNKI3msu9DiTRnsU/YVEOSNXtC0T4QOE+
	 kFAuC7WQ0zuwM/bmqoJP+RDLsVuMk5tNtFr8PIbpFOfaLSkEV0f5bSh5eKNluecBCMIm0
	 Y5wrBfKiq7seJPeIEBfV3uSKtMy9iir3w+FyHDPKcbrxE7EK/l6cKq8rZfA7IHWsEmw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789588011;
	bh=vp5CPsVkQy4Sah9E5hPByVS7vFVCzxnkpcRDPuJXVnk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IKhNq4VbFAMf8ozgEhEUnJnJqPx4ibF19ubEKCa/hlC3ph63iG8xacAyN7TUtPWzq
	 hqhGnqx7PXQoW5zK2YaCNtt1P4K5Gb39T32+KO/w7iCnCYWFp+D8bVvinGtEgCsEOV
	 UffBiTH31IO5uiKmJh9Y9JsYdPpUJch1KwxAwjx1CH/vLhPiTKdrOOSaHicgb544Ak
	 4Oha0egMRPxxO/WS9KOxM3gF+GSX921wEM3qBiFyPnLcucrkeaHbFjqbnIlbWvP0/X
	 zhFCplEVHut2RBBwbhdc8Pun+mbFdKpRadrNSo110rfSxcFcZ93aXka+Klec7wA9rK
	 SZJCe3e7wni9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E16D4046C;
	Wed, 16 Sep 2026 19:46:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45C4A2EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BF78400B0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id et1KWJMcGdB6 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:46:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CF09C4006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789588008;
 b=DqQ4ELrXdQkOXiYwHp9BYc9qK3n6ZsimGFRGkSfjAa/aMsJE4w+fd4D9XhHBWhuH5RhD
 UVcBluCHOMtp6qU7a3W8RqbovC8nosPCKG+8b3+3yOP3F4S6hoA6L+T1iBWqZd6mEi9EC
 sLvVC9hwjUKs/V8rGQ3m5oglRM0XZMI/RCehDqnzcoqkpkaYgOWX8vMSGEl8Vzyc8+s+K
 oAYXWgwaY4cLppTj9J+XYjgrNiBMNOzMtGY47OZmaliG0OH1U/MgyxZN1gEEjHpk5stt8
 jAcn2AD45jaEaXI839twjCCKgzhzTemeT/OQ73RjbocQgQ3x6AKFUumvJMBWxMR524g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789588008;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Iixhn/CTOkD1tAYB/JYoIF+q5W8XJ7fBVDr2no9e2sE=;
 b=hesSPq4oxQ+XVn1IBJQW46P43VrJz9NqJai2UvqS/usy1aeyU8mLwc/FDeF+C784oB2T
 hQE2ERJoLhD9b8ryIYUWGJsKJjW5r10BCIxvMPblJXXEA/8UJccInLOHlMrFE9I/yHSXJ
 K/oO8pKboZoQL4Fh6fplIXlE5z2wlEi+Fx4qeytHesxfuOLEuHZydzvJkvvJqrq0Gez4a
 gzBmNFytEzhd8tDsK32cZszjBRmVpApitrJYbzh5MZYfTpFvsw5jD6pA9epQuXi73XNrS
 FATDKHUfAcpRRB7kXtzH3a3B2rPjECs1iczd9Qu+vaRYKr6aDnInqhtEPWzxsIps/eA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vQU22AHL; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF09C4006B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:46:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5FF441A08EE;
 Wed, 16 Sep 2026 19:46:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3747460337;
 Wed, 16 Sep 2026 19:46:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0738C11C7B060; 
 Wed, 16 Sep 2026 21:46:39 +0200 (CEST)
Date: Wed, 16 Sep 2026 21:46:39 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <aqrxwsTrc8fd_jDI@windsurf>
References: <20260908093538.2715153-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908093538.2715153-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-grpcio: disable for the MIPS
 n32 ABI
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

Hello,

Thanks a lot for this patch. Number of questions below.

On Tue, Sep 08, 2026 at 11:35:38AM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The bundled abseil-cpp only implements DirectMmap() with mmap2 for the
> o32 ABI on MIPS:
> 
>     #if ... (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) || ...
> 
> With the n32 ABI, the "remaining 64-bit architectures" fallback is
> selected instead, which fails to build because long is 32-bit there:
> 
>     third_party/abseil-cpp/absl/base/internal/direct_mmap.h:130:39:
>         error: static assertion failed: Platform is not 64-bit
>       130 |   static_assert(sizeof(unsigned long) == 8, "Platform is not 64-bit");
>           |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
>     third_party/abseil-cpp/absl/base/internal/direct_mmap.h:130:39:
>         note: the comparison reduces to '(4 == 8)'

So assume this is fixing:

  https://autobuild.buildroot.net/results/90405c0a3d0b2e929d5074305906e6fe3679298c/

 ?

If so, can you add a Fixes: tag?

Also, can you investigate since when this problem exists, so that our
LTS maintainers can understand whether they need to backport this fix
or not?

> Upstream abseil has no support for the n32 ABI, so disable the package
> for that ABI. The o32 and n64 ABIs are unaffected.

But then doesn't package/abseil-cpp/Config.in also need to be
modified?

And is it possible for python-grpcio to use the Buildroot-provided
abseil, instead of using its bundled version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
