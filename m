Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47BCCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84FEB408AF;
	Sat, 10 Oct 2026 15:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N32ePaz_jegZ; Sat, 10 Oct 2026 15:24:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 52D914087A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645882;
	b=RYnSVGF02UD/6uPBn24DCzQtsUY1YNV6BrxOlUuo4KWN/a9B/z7ev8dNMn7bZ0WHZQs9
	 PblWSwgIpZ1Ryoylk3XvX6IBF/gO0mtLywqNg9KNg3HdFIWp8h6wd5NnPvLN13y9ebVmZ
	 n2d03RCXJMWIg759WVaPHmPqX8zsGRCWkLmhzQ+MnwVcdtoX45N1kUv63IljUXOoPjRcD
	 2Q1aRx0LuHgoQG0NEn3B0HbQQdF0H960aPn1R00HNuRD5Kf4J+lkYyU8AtgKqg1IL14k+
	 X7woTSV/KYF4uykwcZXi3dG0HovcUosFwlM5v3n4maUkXy35yS5cLMayTl9MY5HaiMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645882;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eIATbU5UKpDlv9kpvTH++xR0g86wrFyIUkmUxM/DD5k=;
	b=YLfPMilxDO6EYADNuVVXhLIVyGcjxqRlQ4hY6YUqEfaAW+drcg12ACqjhzNLYiDHyEsE
	 eKAd3CFgMQNrGVzQJ+hfkUgEL2SxupsfVPX06RFB70DK+cIIP4JoqTtQuQVDUkN4H0J8N
	 xzeCiLW26oMD2HWgLAHE9JWv30ynewvirbHJPpTechLXu2E5YiNpZ4XnUthNXuEn7P9rp
	 II9EsaMTigXFAytqb01xfqhdujbCR3x3zvnK/NeScKTDHpAWPwU+t3NYSkeSo2xQSynRw
	 x29+1qZkN7jkb/lfGd12XV8OTYWw/H8Qstebb4NvskACKUmwGeeu9GSNGJyjWo3s/Ug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645882;
	bh=eIATbU5UKpDlv9kpvTH++xR0g86wrFyIUkmUxM/DD5k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C/VwcmpqF3FHorhPmyQEenLy4onkCpbvl8BjSiKhjNIeZGaFXJvh7NqIcv2iktmpd
	 Y9mp/pcpcH9aoGyXhxAeM//2GkDFoDYVmVtSRYelu4KD7y5B1wKCgPjvi68J6PNk4p
	 eDXLxt62XVX+mz6N//o83kFbh+FVx5n7Ts4oiPkgtdbKlYlIk0bmkx9dKMTLap6pW5
	 CyglxdzS7vPaCjml8t5ZrpvBFOtO0HBoO0I78UIyFjmdT5v+PXjEXtfkWS7EBE4bBZ
	 t1Sk5Z84z2XOMViFn46QNsuOVfINX1NDeMKWSmZtsPpLy2DoFFK36wAjTitWtA6P4I
	 g1ESiFcGaNYWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52D914087A;
	Sat, 10 Oct 2026 15:24:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAB6D317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8CB58112C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgssC-Z-UHDD for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:24:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 358B681109
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645879;
 b=ZvNG29jzW/auGPrxBMmJYyHzNNQ4NLNdpBbkFdebBz0mbv9ZBu5k+lh1tH97RspzaSJO
 3tfx181lB31GQIDXC3i5SOwA2Az6nGe4l7JzPQDkq9LPpE5h7o6K1jRfSOHzpW2mPDWTr
 xkPKD3O5UNVRFfNGaikiatiySnyZ5/nDSt7HMWVQf4vxPMOHGWstm+ap7WeDc6ux2Ii4g
 FSQNtXM8Gi8svTGJYUkozHj95l1dNdLUUZ7VZ1yKfxNosXeqlR2p+LCQ3nb/cihQKyEsc
 5lWV2LtanPDteMSz3zvSkfymmbullrNfoyCdcGWZ10W4Q0WWUr9z0ndbqTYqSgfslaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645879;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=qaDsCD+Qjd174SH4Y45GEf6IiZSI+0UP7SdV4uPkhiM=;
 b=DGWDSOC6Vxgz917eeeVL7JI3FPSdTQMYNiDrZRQwGGdUGq4LA6WZmlvSQsGWmvVwwxvh
 P/IIfbhLObRe09BZkq//2yCaVM6TPia2NlzJ8EOa4qqIUm4PuKGlY2z4ze+lPlcmf49t4
 /gGpv33rJMW4oncZhO6Yw6JrSb9mS03AAyDxKOMrNwIL16GpHZMKVP6bjBzF0PWHd5txD
 MmegWYdRrUkTuB353bfouk8KSque9Hzf3xi1NIqRqoMnhPY/HQpi8+Lfxl5gr0vZurwQp
 KhSZ1hQNO2D4xq1jNlTW78+kG6ZaFIsA7WzQdAnp7KoEBynE0mRrO2TTuQ8g+3UAFFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=N9hulQKv; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 358B681109
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:24:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D08781A11BF;
 Sat, 10 Oct 2026 15:24:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2959D6075C;
 Sat, 10 Oct 2026 15:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF62B11D7014D; 
 Sat, 10 Oct 2026 17:24:33 +0200 (CEST)
Date: Sat, 10 Oct 2026 17:24:32 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <aspYrBQMJbnHyhR9@windsurf>
References: <20260925060237.2488685-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260925060237.2488685-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/haveged: needs threads
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

On Fri, Sep 25, 2026 at 08:02:37AM +0200, Yegor Yefremov via buildroot wrote:
> Since the bump to version 1.9.15 in commit
> 2a28d25d0c61 ("package/haveged: bump to version 1.9.15"), haveged
> unconditionally includes <semaphore.h> and uses named semaphores
> (sem_open() and friends) to synchronize command instances. As a
> result, the build fails with toolchains without threads support:
> 
> haveged.c:37:10: fatal error: semaphore.h: No such file or directory
> 
> Add a dependency on BR2_TOOLCHAIN_HAS_THREADS. Since threads are now
> always available, unconditionally pass --enable-threads.
> 
> Fixes:
>   https://autobuild.buildroot.org/results/814cb7b5537d8b7b2c23f3d90e37b2b41de7ee3f
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
