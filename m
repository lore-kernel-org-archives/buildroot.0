Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E761ECD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE01D84BD0;
	Sat, 30 May 2026 21:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEYvTUciPeyH; Sat, 30 May 2026 21:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AD6E84BB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176898;
	bh=im2DX+BQTBvcGVbHM0UcdcUT6h2mOE5UVSXF8aUO+iM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CvY7Of2daT17ny32icjYINiQ41xceIrQ50HQwCCKUrP4a8NuwzrCB2yT4INLjUI7q
	 aOaQU+LWfwYy7d7/nbyxKNW05p+W+tI4uZ5vPniHI4pdO8cEg6pL/Yv1NuyRBesXz5
	 8tWkyh6xWTdnGZXMTgvtDwydNS9PqQTnCujL+bWbDxkg8DmqhmUJ2d8xM8ZC7eHPIp
	 d7g0BXS7GqlLd81tl6+x2QybZCrA6IYp/kHZm2T2ls6I5zERSCkcAKTSmFJf/Qy+6c
	 O4ZRha7ioc092AzkUS5KFXIiktxRsQn9ZoIBvMzUTmN3BFKFvfJ2w1oHHDX1RHWzus
	 kGHrIAUHWm4ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AD6E84BB8;
	Sat, 30 May 2026 21:34:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B58B0F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6F326F4F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5ogZTKmvzkL for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:34:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D052C61C37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D052C61C37
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D052C61C37
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2009E1A3751
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E9ADB6073B;
 Sat, 30 May 2026 21:34:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4EDF010888CC7; 
 Sat, 30 May 2026 23:34:53 +0200 (CEST)
Date: Sat, 30 May 2026 23:34:52 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <ahtX8NyfFVmQOCEk@windsurf>
References: <20260519091548.2867405-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260519091548.2867405-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780176893; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=0guky874BX4skz8UxYOejU5M/98+q3eLg7BGbVs6Zzo=;
 b=cE6XC3gzNCwNr/F0wI/m7EXond4vJjq1tSe6/QTQxtEnvB+jmJY5yXpD/e2hjyUUc5gytD
 EoQueXq+TV//aVej7SC4/ruw9LvJLf7J6zG1rzBeA1bO8LZ/qRWbHz97WUocOUe7Inrv87
 ZLE7uYbEqqS4ashj1Dom+/l7Jm+61AfvORTcDYXvIGGceZz3lrAKIvhzGorY8NTH9CX5Lr
 8ya4gGOht6DoKhW8iqF94yA2SdxsdrwE4Z0l36N+p67B1JIw47IY7kCl68zpCT1P9LaaoZ
 WXGJwPtJ4x4wWJZn1UgJMeMecHa+eH/gW+cwFtGUjTJ1m69erWvqrMWVMmb/Pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=cE6XC3gz
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: fix build failure with
 linux 7.1
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

On Tue, May 19, 2026 at 11:15:48AM +0200, Giulio Benetti wrote:
> Bump to version 2026-05-19 on branch v5.2.2.4 to fix build failure with
> Linux 7.1.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8188eu/rtl8188eu.hash | 2 +-
>  package/rtl8188eu/rtl8188eu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
