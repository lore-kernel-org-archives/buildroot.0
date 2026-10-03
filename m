Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C3FCA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54808412F3;
	Sat,  3 Oct 2026 12:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Efhm7_cY7ap; Sat,  3 Oct 2026 12:53:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CABFB41285
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791031981;
	b=a2yhrm7xL2E9EKOei2BWEfuvSsSrCNnKn80txqSHZAbMG5/ASiumwZ/r5MSAKtzghBGj
	 jwhOoGkFWH7STwpE/ealBUhCfswUDqgMOLwOqEsuvlj+jCMBlKCrZiF5RSOu0Yy0mU0eo
	 ZSvTrjq+ohhWuNq7zlYC8EBj2ro5ALN+eUlhCNmHuZi/vQrr5TfF0kIRFWqBawc6ocAgH
	 maAAymmG6/2A2YrgT4Pw+ozK1q2qg8RnP9ZH20pF1M79Gk5qSf0iwwJBaxWsHi47TP9Ix
	 4gXDqKG+4yNx7eESOWo6cek5Uz5KpTR/oVcRxj1pxNLxgRzt+tHAjd16nStLU/M2cAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791031981;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XEleAVkKAdktTf11LMZ74Nw1usbxffs7f2BH9MRZRNU=;
	b=sY8pS12s/BqANU6xMhCcyQPYa+zuvFv/JPXv1vIGtgLiKdfXcX4QqxzM62O/RD/5ZZEp
	 AZaQExBULaMbPfSZ59BV2+aT+CeHEDQO26H6CzIF68mJ7l9pcRhyeF5q0qloFFY3HG2qW
	 awonTZrxd16TxVDyH+zjV3ewdaRvC16GVp55xn0soH1bKKLZRjLiKQOsWSw9YRuWTM3Gl
	 IwwrpwIcJBiKu3YoiFAJUXrANJoPPbi8c9H2bbZB42eE7IQb0vRlpexGlY1CWdoisWPrZ
	 24cYjPqJW8MM7o69vv69WRcsxc7TtdYK13z2EBlfW3G1UqxC9/FkOSOfLJhcyd6/AOw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791031981;
	bh=XEleAVkKAdktTf11LMZ74Nw1usbxffs7f2BH9MRZRNU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jvJt4dLlor907O2uH+oVZOHJk0Uyle2EjxjboXqMPnuHiXntEeGxv3/KN2l29+8n9
	 +BUp+UFuS+YQRMyjx4YwRnbHPLNEuVOJcW/Vi+cv6UGPbJ8FqZUFQHkD54SzVMCTej
	 PqdnMf+oD8AhDWKe2/PF9q+sMH/VSfp6hbp2OmZKSY4ZGyxEy/0nvTVDL7ga8jveQo
	 d7EznsbVjLB+n0cFdammHP+Mu28ywmO1K6V5wZ2tBVK8F4dYYqg0qIxPG6n4/tAIvH
	 MiBf8pupLVsqaYAVoVj36w6udQ6PkcZ6sXmfrBf9IZszAVhhlvQOsVJWOSqHsTkwdF
	 cHgq9T6UvdBLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CABFB41285;
	Sat,  3 Oct 2026 12:53:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8123D335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7265960DF0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weoCEocwYeaV for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:52:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0D99F60DEB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791031979;
 b=MTv9kwOrCDIxUcHh+ZDdvte9vroDnFt1GmBGOLTSjowzFlZLLF7z0uyecJioN+AKYGWF
 d6G1xpclwh5u/iMC0IIQXR70NFXQx9u0wP7IY4rQkUXSeCl3SDGJvZj9zVdSCTx6/W/Ja
 6YkPX4EgdFz6E0I7+gcziRpz+hwqgYCcWORfIoEQNm0dr0qnqkEAjZz3ZPT+CaOgQnB+O
 lL0cRoezCiIKRIeiLJQojNYzISj+zL45/OIwx6m7Bx29BNvVnStMPWI5JMZL2Rj6dKDLt
 1puHoAaAm2/6DeQ6w3qNEje+bXL6LNJQ2XFKP97dyDUdJA/DOenYoCkPOmWvF5Lp/Lg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791031979;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=YZcmGU0V98vp52mBdaJTtlofIgaq4o1epoteGvFvJSE=;
 b=rWCV4mUytCfO2WoCLRgHyK2jj61I9IFx5/ywwwDR6t58w2LLoauJQ5S4C6ccwqUooy/s
 Y4stRXncYH5yj6He8XOCdQvJGAD0AjZz1MjtLxeROV7IEPJ/TWKK3lCNBL8u1Yw1suDJG
 v/WT3t7eBPwNG8VWZKMYLxW+/jfmyCQnMLvrEniXpC1I76I0OJiq/AIuxws7NTTlZdrXG
 pM3/Ud98hPgL6UWkMCuGXzkUR31mTrmFR2SkG3bZp/9GkhbhZDkjZS93pM+XYZQRiWWsp
 tyA1zNgiyNYTcwzMslhyFom1ibiq0+4t2lG2dfzdXPLiPcjNssx9Q8yNxFWaOG5Y9OQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dQ5I2LOu; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D99F60DEB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:52:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AFCF44E41129;
 Sat,  3 Oct 2026 12:52:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7DD78604FF;
 Sat,  3 Oct 2026 12:52:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D6E410328318; 
 Sat,  3 Oct 2026 14:52:53 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:52:52 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <asD6oO-KMgFhJZ3-@windsurf>
References: <20261003084453.545653-22-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-22-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-periphery: bump to
 version 2.4.2
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

On Sat, Oct 03, 2026 at 02:44:07AM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/vsergeev/python-periphery/commit/a7361781456fcfa605b0d4d335abfbb9ced45918
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
