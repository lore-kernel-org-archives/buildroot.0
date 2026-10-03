Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E838CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E8A81227;
	Sat,  3 Oct 2026 17:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jS3P2o7UTGNV; Sat,  3 Oct 2026 17:35:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C4ED281335
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791048926;
	b=Q4AzQ6xpXGPi6apYc0JE+DkEG/AHh70vayraf0b4eA1uNLwQDVcPlO5BTtFHOiBER62B
	 kSuVLKqCAVXa51oKSHobhABC6Rtozo3oSH4kOgje8L0Kp9ZuNAAy9ncctPAq2/Fjhd23j
	 7xwSos8aI0E+LTOQYanUZY0D01pdQLv2Vxc45p8aFWLnQUk+vBO/u69RrzsQ51S5xatIB
	 FlBfW29lFOlYTyeaTEMfMnVqkABrbO91ycXDARO4SKi7ls1dXMII0WpkYeIifO24TM555
	 mIAiK+kEJHW1v8SLDQjonNQM0plHizBVIdbGN/fUXbejPy1yYWZUAeQnh7gVg/SpnyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791048926;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4gvTrVsMgRXpSFIibXgLjZe++/Nq9pJ0dc8KbJYL0z0=;
	b=ZDYz0g7ZwFg2ytMDaCS2GafrJoxAIFCSjtYo/ScV66TnE+K2FN6+scM/S97Ly6pXtRvr
	 ekjLCtmyWQ8RbBtmEnpZfCQeQhSN3mCBNv686J8e8TFmyQGPhKuKdAZqFNcRuGoUXiSUM
	 xHyV6ORtYDveEyaPw/jW/GrCcByzPfljksbwuCFvUbZjJoe7K6M3NvxhsZ5mKWH9NwoIL
	 lW7viZn90/F2ec2Qo3IHP18DAjgNqZIVDfHv01UY5KKgtUGcd5vBxI/kfkQK9W6EDiRxZ
	 bSvTv4NS68l8UBS5ym62SXvxf0NlVznLofBZqiQTBkz5dGf+bzJLC5jRonIqT2TgmvQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791048926;
	bh=4gvTrVsMgRXpSFIibXgLjZe++/Nq9pJ0dc8KbJYL0z0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IiMXAPdU0E3xAlFgVKWy+JYk0HsVuYxbBJ983lLmFkcHD8ORYQOTp94z1n7OuyQHG
	 kaTy6ieV7zKhv/QYzBKeauP2w6Jwp/rJKAGfNEFqu+Pewt+YTsdZwydhW1o6OLd7x2
	 4A4H8XaOAPGKTv2A44DcDe/u4+o7egnu9cnWobmHfLowZaWd8ssNMvd3GteRO6sX3u
	 bO5MW/4mvLhuaZUWSi2IwmtjKPHt9FMOZgCchyBx0PEKgK+NIHVv7nLuUlr6TERlyd
	 od0tyrELpUQoZ3oS8cjAtKgPDeLMbXQecjPdhf5odI78E7PXVaNf/sHCtems2E5KNg
	 KwapxbkOUYKwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4ED281335;
	Sat,  3 Oct 2026 17:35:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94E781D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77F7440064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcAYkDyVy8oH for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:35:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 28AA040024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791048924;
 b=E5ULzouoVEBhwZU0t0CWS55gKEK2R1jXpGcVvIfbYnNjrDUB8IsvyT7r8tFMFNkW4HoB
 p2KzevJPOvxeROXzAn8RbaBkZ8vYRuhivljELzRHC6UmoovhZBJSmshJzDzvEEPjlro2u
 j2F5CPTH/DRxRcsaMDRL8xgitsl/X3IbleZ/D8UsV5s4GNI+zcduOU5WdNK31qLT5dHM1
 gPOQrFl9+d3SEKqeQzA9BkBU3fGp+4s8OdpCZvl/MkSmSenfhLy3dRKrXCPjUtgkCynRJ
 mjUgA+gsC96qwGzj6ai6XxDDFVenyECtQHOeUTAiPIUPQDeFeTxBCR9AnIS+rbBzp/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791048924;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=UidE/5KwNopNPQlboJIXE+StdQ6YY/e478xmto0mJjQ=;
 b=IrYGQCuPNrWfCgztFXmYN/GnT6oOsXL340DHgfY7Rfa6cNjMzRM3LaDRsAmO1D40CzSL
 Mp6sOKCHAG/6fmxWhPR3DGkytnnnerZJcZVjFH7V+DMq2sKZmDJAPF0H7y1E9B0HZRrwM
 V8W+qbIW0DagbcRaBkdtnxB/dGCqD4O5aSU79LHKrqqBAxFr9ZRA2Pc6IEQq+ndczGrWY
 2d1rTmtm3s6SrLAQwajQdiEhTUJmi8ekccgXAMQi1fCXchB/cyWVvcwuAzuw4X0NdSIpJ
 Ye2SjeoAIf4Ihlh2B+SNhiRnFyBizBLmuNK0fbko48rfRoGBWibGED1JZylpC4ua2Iw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cHgt3hz4; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28AA040024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:35:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0411D1A1108;
 Sat,  3 Oct 2026 17:35:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CCA6E604FF;
 Sat,  3 Oct 2026 17:35:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DEACC10328170; 
 Sat,  3 Oct 2026 19:35:18 +0200 (CEST)
Date: Sat, 3 Oct 2026 19:35:18 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
Message-ID: <asE80hM7k-0ySWl0@windsurf>
References: <20261003164344.488550-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003164344.488550-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libgphoto2: drop autoreconf
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

On Sat, Oct 03, 2026 at 06:43:44PM +0200, Dario Binacchi wrote:
> Commit 8b05934511ab ("package/libgphoto2: bump to version 2.5.34")
> removed the patch touching the autoconf macros, but left behind the
> comment referring to it and LIBGPHOTO2_AUTORECONF = YES. The release
> tarball ships a regenerated configure script that already includes the
> jpeg_mem_dest size type check, so autoreconf is no longer needed.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

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
