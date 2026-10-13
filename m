Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2D9CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02C3C607A9;
	Tue, 13 Oct 2026 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMxkjtSCqR7c; Tue, 13 Oct 2026 21:09:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA35F60818
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925792;
	b=gZbLFkjcmWBuXcuiy+PfN3if47kgmn1tu/ay0YGZyRmRYNxjckT/fqMPZ4XAVz/jW9LV
	 gEO4u/jusj1On7ftbmTiwWdWVaPksd6DHXeWa1AqpV7nqJe7UOuJWkRpmPDarpF+bpg5R
	 NmELzv9BrOFWW/yW5ed+xUe4mlAaXSM3DfXiX0yOn88K1fYrUpPWtvoICBsbLIhyuSDgv
	 62+XH09v3qJEyy2U1CIC54RtP5p5DjVOfUNR2xZRgyP7LZvP3n1vPDOri20A3Tvsaqr4r
	 Fcjy2MF+Elt3GoR5cXVpi2wi8zBjNWxPCcjh7XZx/JPjkwpRDZR1XC/hRLXFuQvK8UQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925792;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EOfO6KuuWgEXtaTVqMXK4XJTGy4TR6dqJ9QMLjgM84k=;
	b=mKkjd0KmrBfU/ykDTxc12P0t509C5DswuDcFqoyZUCKZOlf0Wp9fnYwx2ABIktSywXIa
	 nAnOIn1nIi3xT2wyTX/eneDHzNN/vvL+NGRQYvNiCQa5WEACEGh4u1GbE15YX65Xzx2PG
	 NgiixS4UGxfJoP5P8mBmOqcze2Iu36FiO7S1VUTOVLnHIwpQLaH93I+Vix4/VePCDI6CU
	 77ZJ3yzC2DKC2jFb/z5O8PiDWa2clHvRqhrxvHme7VRz2sXcIqS+hfqMqYqYs8c5JnyyP
	 42CX8z5W2Aezr6gBSt/WiVMdf4b8cejMM97S9194nzh0MYPquojR2S+JpYLquIDXEmg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925792;
	bh=EOfO6KuuWgEXtaTVqMXK4XJTGy4TR6dqJ9QMLjgM84k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UHWid9encm2Y4axMOHzOemAARUtsJCZ6g8US2lhVtYFxWp6Pqrn+1U8fhk7mtvSor
	 RRegjZaeMMcbwN0+J2UkckL+O8NoNXVKjiY5kiUos9kDb0LB6SLd5UoImnP3PqU+0B
	 KSRzQnI0m+DRmx9tXEqnf0STzhy+GM3FtO+ky2lOS/exKb5iYZRgGPXRvj+j7+3coj
	 utNtzMqVRD6lEjTOq7wnQX7qGPGPq1MY3GOhn0nXNreg2Pl8Xd2L34obbsf7K+ARt+
	 whVvx/uySfXieN2OLiIO0l2X44uBpT0rpNmSP50uI8LQdiV9B1ie2RDmzjIKyTFYYH
	 JmgS+Jkd9590A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA35F60818;
	Tue, 13 Oct 2026 21:09:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 976AC2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D4A7406E6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tg797LHNSn2W for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:09:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 424DF406EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925789;
 b=Imj/Oz6kjjUyEbsG4BAKFx/ZTig92I2rgihbgCTJ/tB7vydEFeh15HbXQ2nJtQPU9sqv
 4m8KnN8TTmzEsZlZ21pWdXhDREkd72egMGQYZRlGbc25dAdUPxOW0BwXA5/8w0YhPCNv/
 AZ+j+RGViSuWU3s7xDPYAwjHzDN2XijApIca4NCVxJn1Pco+kYsjGkvRAEY5xecIw4fIL
 mh4utC+byR2YOLxzg6Kbjn+uJfxOslTyRci3FyyITnOAE1yeyDmJUHoqKz6ykN6um/mad
 g/SwJXRCf/IApieZLTjBprt9liNaKjlApTWiaT2qCCJb9oY0fT9ykz6ToMpooy5CEsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925789;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=75QyTxCiQm7TOfvUi9A7XgxzNF0xLf8knkWKNBpORds=;
 b=VMjUNO2Sv468L7AIDiFK5rzqfd6ZkELh8LHe3xvgo5eJv76FgSw12cd/tmrXjEGBTMtQ
 9dVYvOTre+L9MYL7/P5S24DoHyOSWO6/h4BDqgsCi2P6rLPXOdMItent3gJDez+Lmoese
 1zdkVlgfVWk0EgwnUy2JfXMefVUgZNbOvWUW+8e/Qn80bYtp6ECZKVe2gfSijwUfGUKh8
 ryp1ADH5NpNmzN29/fxZX+i5+13fd0KEcnYfDg9TL0v5TnDwevjkfDMbIN2sOUFitYk81
 Ym8zO+B0WV9w8H2aWnsohyiy97UHsBEtqOhYMo9YR/PAJ/zVQxyMztOyG5Yo8pqe1og==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OcX0P428; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 424DF406EE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:09:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A03854E41217;
 Tue, 13 Oct 2026 21:09:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 75A8160362;
 Tue, 13 Oct 2026 21:09:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 72A9D11D70701; 
 Tue, 13 Oct 2026 23:09:44 +0200 (CEST)
Date: Tue, 13 Oct 2026 23:09:43 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <as6dzPRAfNnf8RNQ@windsurf>
References: <20261013140423.1941069-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013140423.1941069-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/python-zlmdb: select python3
 zlib support
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

On Tue, Oct 13, 2026 at 04:04:22PM +0200, Yegor Yefremov via buildroot wrote:
> zlmdb/_pmap.py unconditionally imports the zlib module, so importing
> zlmdb fails without it:
> 
>   ModuleNotFoundError: No module named 'zlib'
> 
> Select BR2_PACKAGE_PYTHON3_ZLIB.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

Usual request: when providing a fix, always include the information of
which commit introduced the problem. If it has been a problem since
the package was added, the Fixes: tag can point to the commit adding
the package.

Without this information, LTS maintainers will have to dig themselves
into this to figure out whether this fix needs to be backported or
not, and our LTS maintainers already have to crawl through hundreds of
commits, so let's make their life easier :)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
