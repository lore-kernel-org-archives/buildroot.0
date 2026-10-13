Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334DECC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1FA7404C8;
	Tue, 13 Oct 2026 08:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87c8sC1-rIUn; Tue, 13 Oct 2026 08:19:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B6685404E9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879557;
	b=pTUw16cFMsudPgZrdDSTpZC+dU0OQ8blJ6Lax83IWvtR4IVQ5VaSbMLnF0iNM9qOS2TR
	 r0KVwPSSXFQWQxtWd+KK711Hwkt/Q5K1DWy1GtrzQ+yeN3GBQMESbVLJRQ6mEQ4XXQhSs
	 p5ThISoPHSO1JBGqhAwLtCFY4oUo459hJcqhxn4wu8y7na4NjPOJa/YM3MAkvRop8t7Uq
	 DT8UcFZjF4H9xSJRBDZFps2cRio+SASRccAhKkONyxIIxJm7tedduAOuvrVqpYlyZXX23
	 ehdsw7wC9CXeezNfSLCBXhAaBPu1cniWpprSZc346xZ8V+m3zcWI3ysLGJllwa2xKwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FgEgrGapW7kGy5ezPSJtdx4HMksU8eV0ZHH8jKUgQXs=;
	b=nMyaxv0ZE8J3GVevsqZw2EpmhM3qBfo795JeWM1JZmBgTt/BLHQiLbYGPLvJiaR4gOVP
	 t7y7mrz8H3l5oJrZjcee1lspcmfgOTX+kW4ksBmVMsvnmbb4nJP5Nx59V3yMHqDZcnLom
	 gp99eVchOFWFZJc7fmji5CK9zYxbep1rKeoeki8YMn7/CU7sLkLikKqsELUyfzNaF0L2k
	 CUOIJGGLhitVuYG8VDTU58MuaNFwp3ow+pyceTcuaw+WynPIGf1bamMdijQa3H0KGi5wf
	 mJnap75P38Wh2CHrx0eA03WbuzSLzqG7jsIC11AqS8NZZCUi9dMkUBmq4w8W/vI0BFw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879557;
	bh=FgEgrGapW7kGy5ezPSJtdx4HMksU8eV0ZHH8jKUgQXs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BzoiEYbvwTD2V6qj/S+V6WitrOmF5f0mkrNoBP3B4jVnOWYTxMRHBImbDLsUspkgS
	 Vslz07FqYgLHMfCZHQ92y7kSibhpoQu3HmHqKuqWnZbNE/zZcTLSSMz8snnWKk3nUL
	 aVYRywdkrdhEDe/1xfb0BrVyK6MI/ns4nb3cE4uPjO6iPi3Ah/X9sDAiV9/Umt6wqQ
	 Q0GUQidRqAvFL9OYL9SEtQYKC3q3YnPWjPtqwY06w3fWLDASGHY1UrYwf+ajEqUbv1
	 lnu9VZ+6B453z4LmTJwtVXR3KMVRMT8ZqFIzSasbbQ2sO/K+4Ztob0Eu6Thz1V89SV
	 /VJHsLfGSx/gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6685404E9;
	Tue, 13 Oct 2026 08:19:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DC4DDE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FA8E40068
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLIp_-X_8f9x for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:19:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EC4714005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791879555;
 b=ifUrj7OVRZs5PT7AbeGPniUGL72KQTvWvdZJuv99T47A9oPIgRdUZFWjlP1+x9Fo+Dxj
 L0IpP9vFwuJirb8DRopAFGJ7WnFKc4v8kn3/fgODRwhxR/Pc1UlSrH17GFyKxobRtbbvW
 Ui0RNoX37Vpm3INY9PmMf9pqUDWjxMu656BXZcEebspBblaT3fhOnHtzU5R+t/23Wo6y7
 swnPtI5iiJggLQ+0n+jYwXjX/uEYBmGYe1pNQ/LY9HjsLnmC4+lUzB9QzsGCIOl6B29dN
 r+H9TkeEfexU2hMt2gUkg8PCGzI+RyB3C8qAb5T5G3tzvvtj1fvFSv/y3ccmcanwolg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879555;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=BAtjJMyl8mOr6LVxEq2PGWsZ6rdNQ+BzD0HwKX2a/hQ=;
 b=qA5kOqpQGFx9qlDi6ks7aZYyQHikQpcf73ix9pXkTNXDTfIqenxGH15saEb0pW0BTwZZ
 Zwy4IaKJ/KLeayAnWdRvg5QwBScTv59d8/4Y1t4CQIqjA/egzbwIAJdBS5xjEYW4nkkso
 x+d3SUoH2mQa5QQPHVRUsYlatKfybTfgdUP/aT4MbVhbUa88aBDYfi/H1GfkV1e39DARl
 lrWleYuGVLk75VjIcoEH0gbEnpp0exbCghRTuP/mEaF8ZpTb5pqwNzc+e0R3M1kXpSxV6
 Ieh46qJac83FIk8nCwuGiY5/kYY2F3WPITNCsmilpwuOhrULKV9KSS8FsRPj2plL+Hw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZNrT0bqg; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC4714005F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:19:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3515B1A11FB;
 Tue, 13 Oct 2026 08:19:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0827A60362;
 Tue, 13 Oct 2026 08:19:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 91AFB11D703EF; 
 Tue, 13 Oct 2026 10:19:09 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:19:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>, 
 Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <as3pef0o-P3R7P56@windsurf>
References: <20261011130058.3443432-1-bernd@kuhls.net>
 <20261011130058.3443432-24-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261011130058.3443432-24-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v9 23/52] package/redis: Fix build with
 OpenSSL 4.0.0
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

On Sun, Oct 11, 2026 at 03:00:28PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Daniel Price <daniel.price@gmail.com>
> Cc: Titouan Christophe <titouan.christophe@mind.be>

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
