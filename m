Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C39BCA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F37598124D;
	Fri,  2 Oct 2026 19:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hICtly6mV3iW; Fri,  2 Oct 2026 19:33:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6764F810DD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969635;
	b=MkfAYN+1DzPfuZP9YUTAAp3mpISITDJjIh0Am0mLXuzf6NDdIbld32oBdiphziJ9FiLS
	 sGwjFz9GNQvZ1qOQroo4a04cMKvKtun0hveJ8w3ElTOkTdc0SoHqGXumM1QHRDceA+XSp
	 +G/29H9DB19B9FvwrFmfNSfmzwj3LHja1egYpAkZTViQJk6i/4tdhZNgT1ZeqfTOrOdHc
	 8PghCVcjDC0JV4XuF1pXwa3l3wLVlKdS/W0S4pnCCp6cd8DTQEP17X6TufOoSJHqy0ZG3
	 83/ya25azbp5dwozCOWJ48iFnaskEsZEHe8z1bBA09brJQs24LL2vEDP3K/SCndI8iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969635;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uuZfv67CJK890BvZznwI56whFg/1sC9Oe5YuY4rT+fY=;
	b=JCAXKZh2NPeUlQ9F/HI6Ib1jqyCyNpIujYMtBMuIFN88CvLHSRPfkZmMVLvr9caB+M9m
	 vIfeEvTwyAJwZV4tx0P1sRgtev4yg9sNjy0qi3B1UTuM89rkTB7tESJcRSfzh6AbAx0vl
	 hKGgWUTSh8sNAeQtqrLVNjbbbzAsuZHKlufUqGE8oWzyBvkooC0kvQl92xAbS2QQxCNvA
	 yaUKWmWMabrPdD8H6SKBquLnlSTs8jVnVzFZLuxZ3KoM6upRnLs/lmjaALx/xJJxfTY3x
	 Nyp10ecRB5Ybpr6DcQosVyCDWatDrZJDLkriJuO5yHe0hYvMZUAGIokRxPAZEMaIjUg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969635;
	bh=uuZfv67CJK890BvZznwI56whFg/1sC9Oe5YuY4rT+fY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d9XS0IbkrwJV2rt795JbBBkFZOyLvOI0fCkIrps9i3faNUeuLUPfUFgoOgOIVMOVy
	 9494K1Ub+baxOZjWzJs/os6S0ODgHWB/+Te/nQ2f02egptwqqaeAPJla0SpWLnVM1q
	 W6+WIy5WKSlIqH1FllOXRg3XnIxRg/87xHd9scRBm0yI+m3jBBh0VxkAavxkr0hpx4
	 w65eUd4eTWKHKYUFux6JAIPw1R9WadKFAa1R40IhbzfBGhmIJGkGnBbZeh5yLKmYWE
	 MIMlBQoUYgkXicE5VynP6Of8/sBLapkWWvbY25f/bn9k7PEVWcekncfV+4L1rTAOJh
	 68ONC4H1UaqGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6764F810DD;
	Fri,  2 Oct 2026 19:33:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9746D435
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D59140B2E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MII93su1lhOQ for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:33:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2D5B540B22
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969632;
 b=Vi5C9rFcb0ErpX0ZWSA5rKTHFo7z7UTCg3jYd0SWHYKL5mJoF7NNhT8ZDpjy9XwZSdzr
 WW2VIZmVZTmEspKZOG8y82C36V14bgeFV5fdRkuODMDmMLitaYTRRB20QTwVUYZ4/JHKL
 LA0MsklxqjoX+X+LHFXK18AespDTPrAeT6n8dPOhMJLa+uOMOSfo0TzTb7Zteb1HIg550
 CbnTKGcESXfnrgrm1a9dK4kOY5yOx/vlk4sS5xVS8BviUexg7qo70dyR1dsJzfkRNGRP4
 G97qiLLfo1+yzW9D2hgnrfljNYMwrjZUDz8H7bEbu+ly7esSONV5sChLAkzTMLPY+Xw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969632;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=grjm4/Vnx9rmjql3ykop6oraF+0CBduDJsqbPaL4V+k=;
 b=bRDBtV9XQXQp7B50mkIm6D9SYhBSP2Z0KKfMJOHEpTrUt5vhD2QgwbETny15Ke6DL+5+
 Z3vL8RL7ZE5vJwkGSpiOFzcRnrj4DMe6IuQU1SOgiWqajOD/IMWWj19i+HTu6IahLtIwT
 3TBd2iWh+rojaneUsVzdYCQhcYQO2ksaoa2VNplytYJQ+ie/kNzT1J1pjMrwARuw0T+bC
 KlDH2tRL8JE9J1uz1T2gEI3Jnj/PyaBrfc7YXvDWx/K+YhMiV3XAFNNlK0CHWPpaOlD05
 ehBthm8ps42xtCUsu2IlCkUUOwPSI76pPyHOnWCRbYePfBauJCOtpkGIN6QGXdjw0pQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=c7ZLvnfy; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D5B540B22
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:33:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EAEC71A10EC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:33:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B8F52603DC;
 Fri,  2 Oct 2026 19:33:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F1E35103281E6; 
 Fri,  2 Oct 2026 21:33:43 +0200 (CEST)
Date: Fri, 2 Oct 2026 21:33:43 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
Message-ID: <asAHE0vT31SCuXYz@windsurf>
References: <20261002135828.353207-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002135828.353207-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1] package/libpcap: bump version to 1.11.0
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

On Fri, Oct 02, 2026 at 03:58:28PM +0200, Peter Seiderer via buildroot wrote:
> - bump version to 1.11.0 (for details see [1])
> 
> [1] https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.11.0/CHANGES
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

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
