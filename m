Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB698C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 13:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5FD340A58;
	Sat,  5 Sep 2026 13:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gm8f_w8pAZ3p; Sat,  5 Sep 2026 13:51:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 081A440A77
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788616275;
	b=VNCmL+ccdGbqtNlTW/HLIKdbOeUwBqZ+mDLtiH9P1xotu47CIMO5QYnz1FngLxe0JSdC
	 gw6qXcCIPe/nktXPfw7fa8CTAQkFRcIzrfed5KUxJLgkaGkDzxZghxMX3//ud3eQtStEu
	 k5m0PLPKfDAP1v1zSxsYFFKFmEe/8n0jbfNTq5xGB+TnoQOnaePG61Z+/uv7bDaPewaEb
	 lm+yNSkuPENSHHdiVkxYZWeJeAodeoSx5AcJku6bqnq6ZNHU4WGpwbaxcPWYALv7e7pah
	 p3Jr44UUl0lHUMutd8LKFQe9MSWC3D4lthunBJszDvxtA3ewmU1iZRbe3rvpMnlD4/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788616275;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=E2+Qz0Of54PMvFBv+PNyhC6aXP7lw92ZDUWqwXqVCBs=;
	b=nBMhZCGtZKGVOiGm96Ute22V139V4IfhqG9R5ACh8Tv6F91uTJ3OuLgK8q5Q4n9f7FlU
	 6+aDrYf1FmDXTBDYeaiXDk1XnWfo8jSSscnMm15cK9Ze8bFPYLzA5HLAhSQo+TDOBA7eu
	 rZQ3Xq9sIfg5j348jftc4Z/Rf+1sulHNgWG89DinPQ1KRt90dVd+mvtvdrVbtE9JljaLE
	 uy8H3JCI3GldsRbOHfcgve1NYpeSkdj/ECwaYIRXmHV3XvHlEVhMLNm4lT6DXvdA1PHir
	 fE9BxyetLZnrQI5BfqvUMJhUcUm6MrC5DYQOd1Wk12SLdvnKIRQcbmKfGF8NsA9TBWg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788616275;
	bh=E2+Qz0Of54PMvFBv+PNyhC6aXP7lw92ZDUWqwXqVCBs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gp/ILltFx/j2xeztkBxe+BaY12jL9MFu0Y5LRuL1V5J/wQeo6lxcyO0glHNjyR+BF
	 SX11iia5Jlvn3V7lJybwcDNCiOkMbGo/Ykr44BIKTkFCVa5U+RC+oRGweUadunVYvE
	 17upUv1mIcA4Cak7jAtaIKsJRGNUeTnE8PIrUb90ju2Z6MIoU1v+ThNyy7AeRWFA7a
	 7EP8P2a9E83jj0FVXwhSQ2iDU87TyjU2vZmJp4qfiO0pNLzFtZ4dcf6/JIvN8BlYCd
	 P40VIaX6f62fnbBsABVpRpW2BynbK7QUwXbGjZ9VmOphvKO4S9QWxVSKNPyFbriXhP
	 X+FOJHFYQMFDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 081A440A77;
	Sat,  5 Sep 2026 13:51:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEB8349D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFF6B81069
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTCogY6GShNV for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 13:51:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 07DB681067
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788616273;
 b=UjD7TvJiiOwt9qAXyFB0Mhpq5PselF7xrzd0WbaexF8q+M6eVX6LsAtRykQ4lPBsMXzE
 EWzNXPkO3M9Q3+rPYkniJpjbams3+B1vuryyC6u9mfZU7fsZYgcmRXa1NNVjwJeB+tnRb
 hZk6StbzObrmIcCyuUBxbsjAFG5VSnLddxd4cMkN2tvxxOHJp4l3o4rO4dhnlaClSa/A5
 ha6DZ7nPytagztc/XNH+LS75bqLotqI6dg1Ikbo+RHE3HWf593IJqQMjNTenQj7v8+TCz
 XZECpPiLlo936glHA3HyD1U3hbrkeBzTP3NseQL5zZHjEQ5CeMO8NjubTRImLSekW8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788616273;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=WdACzZOB7t0BdVXUrkLZPlYtMY7zmhMByCbYzoe7beY=;
 b=lX/DjOT/QxDB//Hd16/FX755a8c1PONuM+IPEoz84g7ffM926lLImk/SlrtQY44M6rVD
 LaFNIKyW/C+Q/w88ftZdvVTSR4k7j1++a6hNxyrJvJFsTFpUt0VYjfWE7xnas9LJ8S3cp
 X06HYZKsFdgCXSaOAqAx4GMUv+XyDvMQAmrwJVImelFnscMulGFZqsQWGd5Mpi8PKYL/V
 sPEgNjv4Son/1MBau1A+UhCSjOo26wRqWnMvEMv1xiPhFl1Wtd2V8X0sCkp/uwgd0AkzV
 0pIh7cAu0WB0QAQM9H0CP/HayGEmLdrGEE5rIFbf/aYEh8gTA+wwPMPhSGsSJQKT9KQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=tpJURXxp; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07DB681067
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:51:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8D45B1A1901;
 Sat,  5 Sep 2026 13:51:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 61E8660233;
 Sat,  5 Sep 2026 13:51:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 827C411C7957A; 
 Sat,  5 Sep 2026 15:51:09 +0200 (CEST)
Date: Sat, 5 Sep 2026 15:51:09 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Message-ID: <apweRqv3X_4T-W72@windsurf>
References: <20260904065305.575693-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260904065305.575693-1-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.16.0
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

On Fri, Sep 04, 2026 at 08:52:55AM +0200, Michael Nosthoff via buildroot wrote:
> changelog:
> https://github.com/catchorg/Catch2/releases/tag/v3.16.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

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
