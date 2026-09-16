Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D4AC88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B2C7806F2;
	Wed, 16 Sep 2026 18:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l96UuLSKpLpZ; Wed, 16 Sep 2026 18:57:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EA328806ED
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789585040;
	b=A3NFSDkHKPi2poIjZBuaqK09NLKAwW62eqs6RK3lyQG+G/RERpd6+O+Bt2VmFGexE0ZN
	 4RJWV/pNmxXWJ8THMNjc8yoU3NTrXeUnxKpIDSx1v+VEauxwlhuAa1kbFjuuKVB1HSzVR
	 m+FGwIXTCCu3+T1RF3lhF/BWJbWkkUj7lDU7/s6gMkycSsosjX43tA3bnbhbGQbix5Hgz
	 YX75gssFXuVCTHwn/se8kcBVQ4alS5nUTU6sIXQK4Mj8ZeZYOLM60ZaXAyqbffZT9mgzd
	 nz79oiNlbyf3FFMjOAKE7MfgGRfw8zNvFwAINKBqi0Yo4slf/PaooSTafRd0qg4m7JQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789585040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GdgXhjDCJA2VONcT+RsLDw7NHbxABQEG+nG8J4KueRs=;
	b=ZdFKz8dXzT9CWdvMvakHlpPFq7/VaXeIaMnPqP2wV/u2LkSehMVxUUGkOl9qBP34bXfP
	 vVWPdRMoWB3mjo005dhnRZonKj1MrJCTjNIaiT0RtsNXVGSFjTy6NT3XCYRodzmQgbgnS
	 hKpwNt+8+ymIoKdVwB6+SS02SjtmDqXH+rjIEJFOLqbmlvmpKn+oJELeVWtaI/1rVpxP9
	 HcILtoJV48ktnrIZRAt6xrbAlDMf9uM1++AklwZEtceGUpY2TSKlYWKEYC5wDluIre6Sw
	 LH66Z2EzUlgMfQTacY+0IFunI3nZrbrWdnqJYj3rPc6wfcsxdne4eSGTxFF/l3fqkzg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789585040;
	bh=GdgXhjDCJA2VONcT+RsLDw7NHbxABQEG+nG8J4KueRs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PwnId61PX22bSHeFmrW6+BQMqLoMktH/hdv6c0V8NWl3o+LhiYjGqEWdbfRgt1OD3
	 TzVqfSPF4k1IwhMM5Z95Oa4xTL+xi2ZXMGKzxmp8UEmbYEkZRlbmSYP6cEgEi2jlcm
	 H/q80do988gDLoTS30Iwq56utKVOreHJKsBGQaJVaSj6MIL3RKDDHZs/KP8JKAkMAf
	 ka6PRHIXKvBNGR8e1tcSN83lu6XV7bskRxsEeLZu8gAnGHGTMTnpLBy3HLgmrdH712
	 hlDhb6ohlIxjCCgCx9HjoGCPRX4x+QVwMmdLMQWScl2xuUPpezTRQ7eDiBegjyAdlU
	 1r+zyvDRA/hpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA328806ED;
	Wed, 16 Sep 2026 18:57:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C4997AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82AB54008B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWFTC-gXBMvF for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:57:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E68C64006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789585037;
 b=fNrLXuAkicoWYVByTBTaPpeJrngezDC51MW0bpvg+uVmkfAPH0OObKUcnfO4m1Q8Pec6
 7IF1/Myn0hv6pitFaQ3ygE5XAfVWTv8GG9g4dt8rEgZVZ7yk1h1H2//rM2WznZmeXphKt
 fYkb7WRGkHGLJJcCEqbKXmrenSh5QU0+lqeAbXbIQYhAn157k6KGq8kJRJgUDwCXVgT3j
 ajwYdDavM+P1VHKmf+7ekZBGA1GzhdmTSWnyoHtmkEc+PAYs3toXi1v7oEQC9ySN1wwxj
 9MdFDh9IFuNF7ColBv+77bpfOztWiBk2nx2RnxiD2yZfDN+Vzro4wfnMiQJ7pADn0YQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789585037;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=lbBJ0f0BecBBi9bcNZRRsRXy/nbyATllF60KpaaA8HU=;
 b=AGxKPmA15P5Thsk6BifBMYkXqwLCOowwkPYw0RjawKx4og5EuP5qzCQr+Ds2XBbArW61
 TeO93qCDPoyP8sOp0gyc2pVdNkznMQCuwq4yZIbYWZQcmNYMmUuWpK3IxUr0IRkBNyqQR
 sqkLD3QUcPZknwlJ3qztMMQ8G2SIckl3r4cjx4fPZpoOGGFUiHCYfdn2RHBXsqqsDX555
 NIQ4bLYpKOMCIHayurxPvGapuFilIDJSJCNCg3hNJqugA0fSXJ93yuwRyqkPwrmJL8/qU
 JDj0zqOvBUJuwfzhkGuqFGkYRzxorH2eKeJz90j367U7ucYx3k2cLwQi2Zq1fEs5LRw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lKpmzjqu; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E68C64006B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:57:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 66D721A08DB;
 Wed, 16 Sep 2026 18:57:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 343C660337;
 Wed, 16 Sep 2026 18:57:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C61C11C7B00D; 
 Wed, 16 Sep 2026 20:57:12 +0200 (CEST)
Date: Wed, 16 Sep 2026 20:57:11 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <aqrl-vOwcHy1wpBs@windsurf>
References: <20260914092612.1283030-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914092612.1283030-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/qemu: host-qemu does not support
 AVX512 CPUs
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

Thanks for the patch!

On Mon, Sep 14, 2026 at 11:26:12AM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Building gobject-introspection for an x86 CPU variant with AVX512 fails
> when g-ir-scanner runs the freshly built target binaries under
> qemu-user:
> 
>   qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> 
> The Qemu TCG engine implements AVX, AVX2, F16C, FMA3 and VAES since Qemu
> 7.2, but it does not implement the AVX512 instruction set at all [0].
> Therefore no -cpu value passed through
> BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS can make such binaries run, and
> user-mode emulation is simply not possible for these CPU variants.
> 
> Mark those CPUs as unsupported by host-qemu, the same way it is already
> done for x86_steamroller and x86_core_avx2. This relies on the existing

Does our BR2_x86_core_avx2 exclusion still makes sense?

1. You're mentioning that the TCG engine implements AVX2, so why is
supporting x86_core_avx2 a problem?

2. According to arch/Config.in.x86, BR2_x86_core_avx2 is deprecated
and BR2_x86_haswell should be used instead, which I suppose means they
are equivalent. But we do exclude BR2_x86_core_avx2 but not
BR2_x86_haswell in BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS, which doesn't
make much sense.

What do you think?

> BR2_X86_CPU_HAS_AVX512 symbol, so all AVX512 capable variants are
> covered, and it disables gobject-introspection and nodejs, which are the
> two packages needing host-qemu in user mode.
> 
> [0] https://gitlab.com/qemu-project/qemu/-/issues/2878
> 
> Fixes:
> 
>   https://autobuild.buildroot.org/results/7ed7f9c36dae1ddb965a0f0021db6cd319927b47/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Nevertheless, your patch is good by itself, so I've applied it to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
