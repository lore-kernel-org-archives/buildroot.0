Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D1BC624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 14:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FD5A60613;
	Sat,  5 Sep 2026 14:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKPyFMyTJkpI; Sat,  5 Sep 2026 14:18:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 66DAD6060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788617898;
	b=HafzeuIQQSvk6Kpo4BIS4bRn2lHa5UTyDGyeXxTPVFpIsH9keYjRJnq6tF32sWKTLyCT
	 gxnl525miiG9FiqIxAqZUV8GPtw1c/ATJVJdpidGlk/3I6f7+v+vo3mjADohI2PAHQ/av
	 4Fd8CjV0XfqQVg5OF9aYnuCtLc9Pznfzw5wSMLJfFNnQH1FA9f/X/4M2Bt/G+4xZ1RSsV
	 lcF9eO5FRKJeRZDfU1HdNxYbe94ab9/pUZ2hB7SiUe4MUDJiA2PUwUEnRUwCZ/teG2n37
	 hjNS36+qkmLZ9m/k6u4XtIgs3V2nY0lh2kEd3MUgJ53j/Fh7yHdbfmyJWEA716wT+WA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788617898;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RMO3pWlu2/E3adFbFJSEu9E3AHT8Pj3Zi0quYavpSQg=;
	b=h7oYWcM3QYTXTM9njSViLK3YpX7Nu1KPZK8C/Hi1pTcuNP/7bHGZCEeJQQjJc5v3bE2X
	 42MlBvFVf8vykT/ElWObW1Mi6ziPWKfANNO7CRxvUCwPPPZqPnOT9x/UICmYlxlQYylI0
	 m9oUerJ0kcSg7I9Ix78ktDqgUw7cUVERSWGlC+0uaikQIGl4VrkI0cxe3dutannTfIipW
	 CDMB/LRjUQOxq1H/jvmHkDgWwT+CDV4VlLYUh53Ua/wFMd9ZMbm3ztay/gYlliDiIjM85
	 v41IijnoP29gCCgTN035vwIuI3+pnidXSsa3eZeHNxc3FN8IKXvRWQNo/O/1Lz3Sv6Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788617898;
	bh=RMO3pWlu2/E3adFbFJSEu9E3AHT8Pj3Zi0quYavpSQg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OMyI9lED7lhljwwaeLI6w9uYF23Cv31TCoc7M/Vnvw/Yxa+8P1/o/WEvC1pdhloop
	 QoOm5/U2d2sM9xYdepMz/OEYNchEjaWkJH4mpteJd3XiX8F1gf3hyUtecaBjZxzf+z
	 3f0Lt1xIWItO0aUZQCmpy40zcUopeJ+vS9o8HyiEICOHjJlXwuxsASUr9Kv5jXbG4R
	 Fc5ZuXZk+nlX15QTncAOoSd40flXzUX2ee+cySdvwz8ZoWBt4h4oy4gqUX/eb3OSxe
	 XZgJ3n7s4gKX9kcVGUqSQYyZKyiiqmTToH+XEPEF45fkcYmt1zIPIA59ZFr9/H7QqX
	 1ahkACsUAe1vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66DAD6060B;
	Sat,  5 Sep 2026 14:18:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CECB5105
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C07B640AD3
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ai9UbxYxUh7b for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E5C7A40AC8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788617896;
 b=B5JDsnl5ZyttVGhNlsrsTlElobIL0/ovS/2p3Rc9LLwRRNqi5L8lXfTboqmvw21mt1z9
 +11bWISgss+RK0ndPtKBqcj4/sUrPj7D7uSNUZnAsUamfgtRNW62DZILQ1uhfYLvxL7j7
 /1iAA0iSpINx2NfjxArRPURUye8jf5t2CFDivm/QxQJx9ZMJ5C8lhcIow5jvQEG+MPG2Q
 cwqLNt8x80MUPEXaWSuq/ZCDSvIbDITBu0bQXN5r4M7D1iRz2umPuXr3q5XsrOcYG2Lbp
 EA7c0Fqgr3f9B0nhHDfh7cKmxmW452DWCHVdZgbt5O//U7zKNVjZ0ZplSu3pe+oLfLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788617896;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rdM/9J/8RICeEEVxhqYq/grGxFfM0Wle7WABFMqotwI=;
 b=Z/Q1KOzhovA2hTeSDINst6YLoeuCuZxwNNq0hCUh8a+vHZZ+/f4TbU1LVmciC/LpAq2l
 zjGPX7Ot8GBsHV9WcsKnt9aCMaYGNLBRd8x+n0m8UHSuSxIqyWyPpGNUG6R+VioD1IlbN
 fhONKaWBrrZE4j7uelbtmiXqDEk9PeyQYERqxtn710rfaDpNGQlyaQitu4emNXWT1MYMi
 cM7t61axWgA2yyNXsqHHRo5CuVobRaxbAQBINw5J5YDBjqUT0eJy2aGk3oNu96UzRWXsD
 uDArbfUD1FeSfoOCWWQKAseW6omk5YoKswQIwGdJeiA8DB4D+z/nX1p3Lg4DKIfFCLw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zHqIvuOf; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5C7A40AC8
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:18:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3534C1A18F9;
 Sat,  5 Sep 2026 14:18:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 051FA60233;
 Sat,  5 Sep 2026 14:18:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D1E311C783E9; 
 Sat,  5 Sep 2026 16:18:09 +0200 (CEST)
Date: Sat, 5 Sep 2026 16:18:08 +0200
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <apwklGv3fTv-wpNQ@windsurf>
References: <20260831214351.3577118-2-fbstachura@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260831214351.3577118-2-fbstachura@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] support/testing: add nano test
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

On Mon, Aug 31, 2026 at 11:43:52PM +0200, Franciszek Stachura wrote:
> Add a basic runtime test for nano. The test attempts to write a file
> using the editor.
> 
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Thanks, applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
