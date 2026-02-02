Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A74E73156
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2BBF40A48;
	Mon,  2 Feb 2026 10:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GyhZSEZqkwL; Mon,  2 Feb 2026 10:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 826B2407B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770028372;
	bh=oOTh/rqMcR1fKxm93DyLV62CVj4MgOdfqJAvmaepCKY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oycOW4QCtTjid/oHF2wHmkg7nhd2PYhgF5xw8bdnCgSHSIOo1bDXqe6qq2NSD2AdD
	 RkK6uiFpCq6D5wa7Ahzls8wrlgbkqfug2gntYvJBbaXxdQw2e6t6lSNYPnr/KAAo59
	 /kTFqAUXpEkn2D5Cpx7rq6pdcBEYJbcnzfXDglYR31CEGbGfgsN833dAdS/bh63xOt
	 Qwsnys95i/Ny3hnHUH8A/S4P0ng/zLPeqEgIKdaAVSGdzP8FTVqK+dkAH1CvqpTu0c
	 ITu7PruML8nUU+K1pMH4hpd2v6bAqHN3R6T8CprHO1fW59Pt5FTFgc9Gd9qetL7K1J
	 9P300GBNs2Uxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 826B2407B9;
	Mon,  2 Feb 2026 10:32:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C3141E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BCB88331B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zBEHzbX42Df for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:32:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 783B483276
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 783B483276
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 783B483276
 for <buildroot@busybox.net>; Mon,  2 Feb 2026 10:32:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 637B91A2B9F;
 Mon,  2 Feb 2026 10:32:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3A0BF60767;
 Mon,  2 Feb 2026 10:32:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 519B4119A8888; Mon,  2 Feb 2026 11:32:44 +0100 (CET)
Date: Mon, 2 Feb 2026 11:32:44 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <aYB9KqddPrOr4apY@windsurf>
References: <20251220145542.433349-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251220145542.433349-1-francois.perrad@gadz.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770028365; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=HIOc4HTeonq3o8aFo/Butn0LrlGGzFNtOA92XIvVTo0=;
 b=vPbp81PKWb51+QpbeMU1ryKY68Ehyqn6nV/EjIiz8/J1ClJq4bS47bV8oM1vPtZjsdFsMo
 R1NlcHfX31VGCPmc2W6N7SnEkXQs6C8ZrQtwBNOPzg0CiFyduQcslSWdXC+agNnxk5j4Ba
 dERjMbY+IiKUDWfLYDOLd87vKWb2FzaEIju5bzd9gyTd1rqFyEOdE6plBPHRqeFz3XF85+
 ajURMV91b07PUS+IsA5xhMX3/dHXixS67hDwuudvgmZs528Sl7Io8kUD9HcXKJOaVmK3jC
 RPM92UiRFsQyRc7b2vPsBag/CkeQd1k7DP+C8yCcPZDGuqKx6t6VGXAgTcgpKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=vPbp81PK
Subject: Re: [Buildroot] [PATCH v2] package/lzlib: switch to another fork
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

Hello,

On Sat, Dec 20, 2025 at 03:55:42PM +0100, Francois Perrad via buildroot wrote:
> LuaDist and their subprojects are died

                                    ^^^^ dead

> 
> LuaDist was based on CMake, so back to luarocks infrastructure
> 
> different tag scheme, but same source (ie. lzlib.c)
> 
> this obviously fixes CMake 4 compatibility.

I've added a reference to an autobuilder failure fixed by this change,
and applied.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
