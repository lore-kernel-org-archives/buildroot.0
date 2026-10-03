Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9527BCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 648CD60E20;
	Sat,  3 Oct 2026 16:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXXszsYJ6b-I; Sat,  3 Oct 2026 16:03:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 530E6606CF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043383;
	b=KkRu3yFygLgUPMa2VIcPwtGhcqpGdsBdJFKY8b49QT4u/09uJ8c7izPC9SgIuJpdAIUH
	 0K7j30KQpL8vzfA25Du0iGr/lwSD4odlItNU/fqulZzBmKR5WpAR2GUx2lGxIwCfJOE6a
	 5QvJ17sc2JtKfeZ4zGb0dy8pEqpfEtrQR3alF46IOTZlHTYXZHYLVDCb3+ACBPs/xrwKs
	 Qw2rbDxGIUW7Bt6SegUEboL7FFO1CCDd+EyFz5chfoXYMsrUkBOVmkAn+AOTqYgF/P/9Q
	 M9aA2YC72Tzs/fp1wuQC2BwsfpdYv+nC2lQ49J4ezW8yZK2/IaQSEeVU3CmJ/np5aSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043383;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Svp+7+1yGZBYl/YqZcVm9TUD/ATgXrgwEHgpOAlbo/8=;
	b=XUK4apyXAEK5BGVtLCW/E/79rzjELVzsG6ZkCpLuvG5whV7yneEqfVvVYFT25dLevso/
	 V+5Z+kXD8+k0dwS0aGtSXhzKWnQryjwqnvq3ZJMzG5j7/jtPdbAKPoSl3DC8K6webWjI+
	 2ePhxXHRkCeMqUpo9EWM4dOqDZ/8l+9j2cfgLaJobxplzTl18phG/FSHSv5sU5Ck4zs1P
	 8Nioh9w6k4KRlW6qJRwE2rOIL/khxD6mGnEbvpqSVs2Z+yofeRacm1RBJQ97Brz/it9Tv
	 loow/VWbge6yFHJ0RlOsU8KDrIRqsESPnS8I1fKdsR1u2E6LU5cc5kwFa4qntAP9/uw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043383;
	bh=Svp+7+1yGZBYl/YqZcVm9TUD/ATgXrgwEHgpOAlbo/8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p1EdeUjkYseo8Glz9J/m+dyxbrosnhoXQ9Qmw0yEB8tKb3zZJTpYqm1uO1er9z6Ds
	 eERBUoEFqfnCqFyqsuhIlzdkf2veFXqOSwo9r/nRY5aJH8PIw8tUQPP7W4gInS9M/A
	 xKlAeJ+N3JD/8QcuB9pT6ujONWt6MVTvlvkB+jOvHY/UeuoHUCROf0r1dEdZZa9qcN
	 hpN8AZWdoD4ko1CDLJnTD+i9TOHTuAMiWnUi3roMkpwe6cTPDmdTvY+FVBZSA7nVKB
	 exQ1uxaXg+ZAYtC+T6Kw89UW/xl2Y5j4DUIQX3Ye+RE77848i6QK9Iv3OlHjTpYm70
	 HQVtgEd/roK2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 530E6606CF;
	Sat,  3 Oct 2026 16:03:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA20B335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C091B40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMorbZa8i-Eh for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:03:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3023840024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791043380;
 b=VkNxWJrTrNPp1FDJKzyOyRRPyiQbi8Mgz7UrZn36yzYaEXx9DnnxsM1zsNxXtgj/WZf+
 u+QfKm4aY41yvDhFG0owC6NYPl4u0tSBS6JKkT6ZA6N9Rkg1GOwWxCZNIGM5o3cyXgnIU
 SnJKXf2uEsu+oPWqyJX9+bdu4lFj6wq0JyPOuwX0CDyQ6sGzjpMi7LEEroCEENVFwt0q+
 MgVQNadhkKqFVnJ2ZxidtMneT/f69bB9vVY+nJf4tSM0W9TXyL3n2QnVXdMDtwUdbO20w
 AKJcH2Hh8dqzqhp8Ezn2mKw1fPD6i+MtPcMexGyXQz7TH5FYST5i9/nnxiJA/74G2XA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791043380;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=vNeiYA2C7RQruG4N0GKILvqtTPF+6VAF8j8TRKNUXAo=;
 b=SzabjD/RxViTR+RjtveP4+OOSRlNPeDkXhlozxFb/kipWzCwGEgyhhUhdi4cUg0p0737
 DEvV6iMyIn/Ady+vMfq82TxL0uSBjSR1tiI0XudMnQvnYaHuCUA4pGwKzfbQ2w8O1ApOX
 /3Jl4357Qo1id66+jqdo3feYz9feNf+O41+JvJ7LiDnSwZE4mFO7G01jcajEgnAqYqDmV
 VyeW+BJYh+BlcbIR/qLzLvVZ9f80WotagQ/nTlN4NVKGb14nPtktyIowtwYz1GH84BwZ+
 c2VB+4ofCDXQcMRFeID8/dWxBAD1K2DClGLQKVoAmPmPutx530GYhMwJseDVAqC79yg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YYszc6lO; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3023840024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:02:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A25D31A1108;
 Sat,  3 Oct 2026 16:02:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 672D7604FF;
 Sat,  3 Oct 2026 16:02:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AD595103282A8; 
 Sat,  3 Oct 2026 18:02:55 +0200 (CEST)
Date: Sat, 3 Oct 2026 18:02:54 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <asEnKMe3IUA9X12w@windsurf>
References: <20260929123920.1133421-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929123920.1133421-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/tcpreplay: security bump to version
 4.6.1
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

On Tue, Sep 29, 2026 at 02:39:20PM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Fixes the following security issues:
> 
> 4.5.4: GHSA-2wmf-4p77-784q, GHSA-5cjx-62pj-pmgq, GHSA-pfqg-243f-8q25,
>        GHSA-pjh6-6hrw-vcwr, GHSA-ww62-mxv7-pg55
> 4.5.5: GHSA-27v4-xhfx-g2rx, GHSA-777w-9599-w8g4, GHSA-jj65-mrgg-f5fx,
>        GHSA-m655-53p4-6qm8, GHSA-p7xp-4gj2-x56c, GHSA-v8c4-9w98-9v6v
> 4.6.0: GHSA-5q26-7fxx-v8fh, GHSA-fwcr-mqg6-hqmx, GHSA-m6w7-8497-g9c9
> 4.6.1: GHSA-4hqm-8v2c-9pwj, GHSA-p3f2-88rg-9mch, GHSA-pmmx-m8p5-969j
> 
> Release notes:
> https://github.com/appneta/tcpreplay/releases/tag/v4.5.3
> https://github.com/appneta/tcpreplay/releases/tag/v4.5.4
> https://github.com/appneta/tcpreplay/releases/tag/v4.5.5
> https://github.com/appneta/tcpreplay/releases/tag/v4.6.0
> https://github.com/appneta/tcpreplay/releases/tag/v4.6.1
> 
> Since 4.6.0, CMake is upstream's recommended build system, so convert
> the package to it. The option parsers, tcpedit_stub.h and man pages
> are pre-generated in the release tarball, so disable autogen, python3
> and asciidoctor to not depend on what's installed on the host.
> 
> Add patches to:
> - make WITH_TCPDUMP work when cross compiling
> - find fts_read() in musl-fts' libfts (replaces passing -lfts)
> - fix a struct ethhdr redefinition in txring.h with musl
> 
> TX_RING support, which is always detected on Linux, unconditionally
> uses pthreads, so add a dependency on BR2_TOOLCHAIN_HAS_THREADS.
> 
> Fixes:
> https://autobuild.buildroot.org/results/1db3e924c659c8edff026568ffbfc576d5222db9
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
