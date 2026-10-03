Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976BBCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5932341206;
	Sat,  3 Oct 2026 10:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CkaM2hQ9uwF; Sat,  3 Oct 2026 10:08:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9CCA8411EF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022122;
	b=lyPt0h2wyZo4msC+drPFsOlnCYFtaBoVbOyGozzLERGJRENxb/aNyLaMQqLvgvDWaWDw
	 +9wZQcegSVZfs1g89EEIfLJMTFcriJ30QL2rATy2+8NNEoeh5EMhSLnNdnFVCdH/7XKBn
	 CjeF1JgjsDcfUcQRSAFj2wAY9Lil5Wr3q/YqLV1OI/8ieoUV+T39+HjIQuXLDloNGkjNY
	 fiNv1jNswtYrHWB/7/M0PgZYsYcp/hFH1HFghBTsXUGni7ekcQDy4X0riyvwOFyuJt9lc
	 fkU3klWkcRrMCsFnupDDpwacJ1Qx5dfrMjuc5Uf31wkAKTo2DSvxSA+D96l6Wr0z97A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9sRXF5VCFr1s1QsX1mBL+YDVNZI2zCugEFwEy85AImA=;
	b=fnMyH91jHuCPPIfx+szWgt6XrHUUn4z84iVE5HwntZJZE4/tQ7hl+YxChK+r8yd/m5cT
	 9e/VVOeJQl5m0KGtIeaqaS1A8rgbRhGW2+UpIkibg/i+bu1E94bM20TtHUOw4IhwuQ0qs
	 J+TstZr+7LBwpZwEhlZlaOWp3+slg4hKlbfh+3n4/j2cM/3+LV4JILW/Nsyo8fxd0vAJa
	 UaHKMr4nILVaY46P+nmstvCYicIrkSiOteAd59XgEWzgPSNbbG+TLN9tB2GRYMjjMsZYT
	 /wYbSn8Akxn/K+enPZcx6UouY5LBAFAtI+E48fyZ0v4ApVCKPlVaoJsZXUMIXn6yPxw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022122;
	bh=9sRXF5VCFr1s1QsX1mBL+YDVNZI2zCugEFwEy85AImA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hWSrFkqIwFxR4AhOgca2foXtXOl9OI8wrE54hxCT0wGTAMW6ivtAVQlVrj3VFAnxp
	 A3nUulFGOXTLc/oas2MpRRmneBUloQlCL4SpR2Kt+BYHVTzSlSOD/sXuPwUlZfLq1a
	 jCcAm8zK4aAdCCgBOSRNQ8bbXI4H5/wCjuJeu9Qo7FKyahMHWTebjassUDqNuZqFUf
	 pjoZp16IzJE6IY0V5YHcCZVlR8+xqEwOg+jsDRvWRwRdLYDudC3uGiGstjj0H/eGUW
	 O/CBu3myObPopOup9c9O65bARh5zmtpz8VRDAENYannSoS3+5lz9RY3u7/LKnua6Ro
	 vtUi+IahXtPhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CCA8411EF;
	Sat,  3 Oct 2026 10:08:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89AD2476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70258811ED
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0p0PDu86f1F for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:08:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E2FE680F71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022119;
 b=Ls0U9u7rbwP85hjWvVrMyZW0bUxdWucSwuKHg24iqTkacHmWunqTnX73Aw/2vXkwErQu
 SyTA0A+34jsSjzJoWpC+YRXE5C6cUKIvV+JOP8h1Gfwpqj09VwYMsncBMDiTL0O6AqNed
 E/gteGKHQbUJzlOp+VjMrLKq88FrIv7/5YZ/70+VeMqWLmp3IiGcqf6mx9lBSwBK7Ye91
 11ldPgOoqeCrlDadiGc7EP2AUgFvNux3l5W1g+pcZuEh+2Yw6RFzndg2s6iI47na2r2ok
 G3UF1ZWN/I9WEt6Q85EZSZN991+JsTCYYz9gN8Uk+zfiuK/XuoFr0H/gGsZUZQjvetQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022119;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=T2gmOPR0YEOCjZeMxLtAr4yVTOnHNG1Yx3xoYq6AnaU=;
 b=mK3G2PCEEucS6x6FBkZ1EpnXTcdsWdDqsTgXF6uQy6c/7MFvKZjj9g6MK8B9U7tkxLxI
 p+gCjODmm/O7b261gc0lw1Xhg7RH9oldeRacFddpvzB/xP5ofXgrx3P9lipmBrTwTbj7/
 Ib1Joy6bmgXonWYu9QjSy5YMCyGoOzgphCUDr9Bfo4m3US+1j7CJI/CY82ND+3XC28Jl8
 8419B6/wnPEuHDE0qqKC+p/xECUBvcC6C5JY6tDFikufDttXWIBsovUrMy2+YLuV5W4o5
 GrsZLVx986xyHHjscVlN12QbQaCpo4RYi+mQfE3EvCiUhrsHrHfGWwJu2J1cdKyqB4Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WTEnwuzV; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2FE680F71
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id ED07A1A1100;
 Sat,  3 Oct 2026 10:08:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C1880604FF;
 Sat,  3 Oct 2026 10:08:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B93B1103281F4; 
 Sat,  3 Oct 2026 12:08:35 +0200 (CEST)
Date: Sat, 3 Oct 2026 12:08:35 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Lionel Flandrin <lionel@svkt.org>
Message-ID: <asDUHhdV-spKEm4U@windsurf>
References: <20261003084453.545653-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-2-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-babel: bump to version
 2.18.0
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

On Sat, Oct 03, 2026 at 02:43:47AM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/python-babel/babel/commit/56c63caf50b18b152541b5dcafd51f645d867074
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
