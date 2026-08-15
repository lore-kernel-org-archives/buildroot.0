Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D304C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 19:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 214EB4072F;
	Sat, 15 Aug 2026 19:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5XQQYGg_EYo; Sat, 15 Aug 2026 19:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A41B405B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786822902;
	bh=WO7CyLYJNqYZiFg/+2DVNkaEMiVEEeaXgAtGvwXN2pI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BiZI/vGbc/hSWQ0GmrNBK8Fp0Q90vaVLpzVECLbwKM+OgaEgI20EkLfA08ohvNdY5
	 pNOojYcrIUSHGSJfFM7ljjIpcxNMgtWmsNh57s5Np95f1goClG3ExYgyxuB6NwPUBR
	 Y62suPsksvIj81kcNWxfN1D8G8r0KmCh+Ln29+gldWcjs5dTP5i8eyWZ7dYSlnk6Zn
	 qFL+KWMhNsAV6mLj0Q3LIcKsecz2r/MdFAvaUAr7mCSGk7/YycZ6lGbhoRicQmp4ye
	 05ssH4fmK5R7Ta+fvQoK7tWqkW/oQ0K34N9qAZBxmO7P66RH51sLIZm6SaN0WTb8mI
	 lbyj1Z1HQ5LzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A41B405B1;
	Sat, 15 Aug 2026 19:41:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FA41333
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 517114008C
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GuH_xgICjYd for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 19:41:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 488DF4006F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 488DF4006F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 488DF4006F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:41:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 258E91A167A
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:41:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D8400604AA;
 Sat, 15 Aug 2026 19:41:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D536011C4F640; 
 Sat, 15 Aug 2026 21:41:32 +0200 (CEST)
Date: Sat, 15 Aug 2026 21:41:32 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <aoDASYp4PBJt3wCJ@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-5-br025@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709110822.305873-5-br025@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 04/11] support/testing: add test data for
 mpd (1/6)
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

Hello Andreas,

On Thu, Jul 09, 2026 at 01:08:08PM +0200, Andreas Ziegler wrote:
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>
> ---
> Changes v1 -> v2:
> 	separate test data from test scripts
> 	create archive chunks of test data that are re-combined during build

I am sorry but unfortunately, I disagree with the addition of such
significant obscure binary blobs in Buildroot, for two reasons:

1. It adds a significant weight (in terms of size) to Buildroot if
   each and every test comes with 1 MB of test data

2. There is no way to know/verify what this obscure binary data
   is. When I saw your patches the immediate thing that came to my
   mind is: "it looks like the xz backdoor where some obscure test
   data was used to sneak in some malicious code".

So I don't know what this data is, but instead you have two options:

1. Generate it at run-time during the test, if at all possible

2. Create a Buildroot package that downloads test data. "mpd" probably
   needs music, so you can create a Buildroot package in a
   br2-external inside the mpd test that downloads a bunch of music
   files, and puts them inside the test root filesystem.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
