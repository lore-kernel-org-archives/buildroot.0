Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31323CD6E4C
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 07:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6FDD84D38;
	Mon,  1 Jun 2026 07:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qS3I1w8zi-Up; Mon,  1 Jun 2026 07:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE74084D3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780298606;
	bh=YXfNuMwhGsakNZYt/oWjYDf9eencJ3GPtNIXcZjGug8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cWjV+3USp8zMX25HUsTa5mE3LodIs/QIgGbunDIHsrMil37RpGoNIxB9sWuwYvJZi
	 a2YDlvVAGgVzPX+1wVg7lbwgQWZ2cKvCZPX+JFIX0nmNwUCaAkNcX0Vwd9ybzLUUMq
	 B6LO9fU2mH/KBxhMC6+iOGv81HBIzPqSSK/stH9LMcRFw47dmcL73gkexwBX+wDMKK
	 TIwb7QyYE1KB/Oy/MyQiOhYafDIMbaLWyrqDc2zdJZq/GS9Jg0CE3f8PJVd85gZRyD
	 vgN+8mzmpTk5HoIVmsPkO1EB3OX6wqeQRMJDp3e0/Mh8aVq7kWSea+kZZaQvXM+c2d
	 XQ9zlozeW4yRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE74084D3D;
	Mon,  1 Jun 2026 07:23:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32E0F294
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 07:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18E0B60E87
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 07:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIKYdqfAko0o for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 07:23:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C06C60E6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C06C60E6B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C06C60E6B
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 07:23:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id ADC72C6247C;
 Mon,  1 Jun 2026 07:23:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C9D82602AB;
 Mon,  1 Jun 2026 07:23:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 704A910888CB3; 
 Mon,  1 Jun 2026 09:23:17 +0200 (CEST)
Date: Mon, 1 Jun 2026 09:23:16 +0200
To: Daniel Houck <Software@drhouck.me>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
Message-ID: <ah0zPcqFqxIDhiuY@windsurf>
References: <20260508235516.3028284-1-Software@DRHouck.me>
 <ahtVrc-CD9fLtDgO@windsurf>
 <d0db0464-cb86-4cc8-8a79-6076524c7610@DRHouck.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0db0464-cb86-4cc8-8a79-6076524c7610@DRHouck.me>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780298600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=SPKzo+6713EEan9KBVgWYGMh98nYyWOnz6+XvOF1S8Y=;
 b=Rc+5QmyItZ3P2IVrk7cl4GZJmXPqaUIoTnoXWEa8yjChNrIz3COt85kNYvKJitmjV4zeV6
 QIslmbgHVq+LKtuRmV0DtlOgffMxp+DX/9gcm2ARflX5vBhvS0syV3O4S0A5Ao+CKu4qXI
 LzHqY3PJFe3Iq2cp6p5n4AQICQCFxLqR9ZH5P+oFTJ1Ztx6dEV7LLVHSqwcrkHVPPn2j9u
 bU+IGNR0R7JBDylrfLoKJxm4CWj2wdQYYvA+BK1wVmRJP6LWFqen+ZYz9+Yuf/AeTWiq5M
 0ASWCnqdsGAEbhXtimkv9A3XOHQmh/S/xYU+b+5+Xd3rou5ZMTEOsbkYafrj2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Rc+5QmyI
Subject: Re: [Buildroot] [PATCH 1/1] package/micropython: bump to version
 1.28.0
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

Hello Daniel,

On Sun, May 31, 2026 at 08:25:07PM -0400, Daniel Houck wrote:

> Thanks for the review.  I always worry I'm too verbose in my commit
> messages; I'm glad you liked it (and wanted even more detail).  I hope this
> answers your questions.

Thanks a lot for the additional details, all questions have been
addressed, very clearly. If you post a v2 with a slightly improved
commit message, we will be good to go!

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
