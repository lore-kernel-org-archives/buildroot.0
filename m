Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AFECD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC9883D94;
	Fri, 29 May 2026 21:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZWJNUNVMZ6j; Fri, 29 May 2026 21:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 584A683D6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780089630;
	bh=b2hVyioBnSAzBoCM4pgxsjktGjzUgENtsFyOsY3GoII=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L2jMQcU1RO8mKvn3auF4/bUaOFVEDc9Y6dQL6lbzypMnZ7TEoQmQzS3mNCT3D5JY6
	 AjQI08hXJEQgIe7B479qtQMcCjUi36coTuwc4e/AiCWtDPjhGUnSMM3UmtAScU8gyn
	 myi4/NRWaRGX+Xx2qf/1ahNO2g0wzvpjOPKQ8zZGyZZFixEHw4jQEsxLbXDIkGM69S
	 Kg2Cw7j+3UW2X9AaeGR/i8rR6/+MzTEETfWkaNk5Gl/hBOA6tuUW6ErcV8n7FNSqXS
	 d39OldP51v0TixNq0nqTmpXsbeOtp5A9WXXKoN92CaFltz/1PUEUultnO4jg8q71mb
	 pXIVfUsajJWJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 584A683D6E;
	Fri, 29 May 2026 21:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE997D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF66D4233F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zARTC3mA82Ht for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:20:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECD6642336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECD6642336
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECD6642336
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:20:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9E2A2C62464;
 Fri, 29 May 2026 21:20:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BB68D601FA;
 Fri, 29 May 2026 21:20:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 632D210888054; 
 Fri, 29 May 2026 23:20:23 +0200 (CEST)
Date: Fri, 29 May 2026 23:20:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <ahoCoXu7k68axiSL@windsurf>
References: <20260501183421.2459291-1-bernd@kuhls.net>
 <20260501183421.2459291-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260501183421.2459291-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780089624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=rIhrKSyBt1hq5or+HSAQYMqrWuLys+tuuZeptdUodM0=;
 b=hCXRDUPKKNYCcN2mdBY+yJSgggUsRI0+R4/zl5p+XiV1I3XItSF9cZ6c3e2NBKyno1yM/B
 8y4JRb04iXRentGY5CGdMHpHHI6j92z8q2HfnuLLo8hJ2i7KQCzsbwG02x1URgMjZf4HsD
 KNzKwZXLgRjoE3Xr1H29eiwPQZ+KXcQOVNp66q8sa/XnwUCH478FSQNByuOXsDz+kezqxE
 SYHUZD5A4ie5uPHutY2VqlM2axCb9nnVc2AXLoavOpM76o5Hdp2egZ5lBr7ZdsASI9jbUo
 rIQTNux025VfDRkQgO/zMCnssRX6Ix/t2eBKw8ksNXxeIRjcRA1B5A6HTlHPfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=hCXRDUPK
Subject: Re: [Buildroot] [PATCH 3/5] package/stellarium: add extra downloads
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

On Fri, May 01, 2026 at 08:34:19PM +0200, Bernd Kuhls wrote:
> Building Stellarium includes the download of external tarballs during
> configure.

But is this due to the bump in your PATCH 2/5, or already happening
with the current stellarium version? I did a build of the current
stellarium version, and a brief look at the configure step output
doesn't show anything being downloaded.

Two cases:

- It's happening with the current version of Stellarium, so your patch
  is a fix, and it should be in the series *before* the version bump

- It's happening only with the new version of Stellarium, in which
  case the version bump patch itself would cause a regression, and
  therefore this change should be squashed into the version bump.

Could you clarify in which situation we're in?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
