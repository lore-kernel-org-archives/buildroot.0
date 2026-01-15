Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA17DD4661C
	for <buildroot@archiver.kernel.org>; Thu, 15 Jan 2026 19:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD0B38478E;
	Thu, 15 Jan 2026 19:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWlhWrH916k1; Thu, 15 Jan 2026 19:47:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE30284792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768506460;
	bh=/NDtCWm9XuZ9ud6ZLASPvqWsjPE9Omtls2SaJG6qtSo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LtkM/WjuGLcSDe5wggFNeLrAP0cUqxnVefghLhsaEe3L5vPfz2Evv2eGZ2paoixRf
	 2gD1doWfHxXxYLxLj4ncW0cuboEo80DvjgPiWVyBjtVdZlSLLQlq+aN7x0xTyB1wi3
	 21Xq3oUxgdZ4OzYni4qIspGe1ZcXMB7FLMXoSFP3kwe2RqnbHsnZ4UkCeMIbePNx4T
	 drR66lAM5kkmVsx/xGYY84i5fhAWlOeaAjMSveoOSs1LXCbY7Oe849IYB3LScCCbSl
	 TgyshcIVCxXsj+nTFp5p8w9004sYn3+9d8KPr/CsYEZyynSojj/yGckr1nawozH4ZW
	 AB89Nyf9TDKkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE30284792;
	Thu, 15 Jan 2026 19:47:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2AE0223
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 19:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89CE884792
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 19:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTm0dfT8edI4 for <buildroot@buildroot.org>;
 Thu, 15 Jan 2026 19:47:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B4FD8478E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B4FD8478E
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B4FD8478E
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 19:47:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9D0334E420F1;
 Thu, 15 Jan 2026 19:47:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5E036606E0;
 Thu, 15 Jan 2026 19:47:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 891CC10B687EE; Thu, 15 Jan 2026 20:47:34 +0100 (CET)
Date: Thu, 15 Jan 2026 20:47:33 +0100
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>, 
 Julien Olivain <ju.o@free.fr>
Message-ID: <aWlEAhChn8gSm7QZ@windsurf>
References: <20251221180810.3770181-1-ju.o@free.fr>
 <20251228232021.4d4e70c9@windsurf> <20251230174958.GA496221@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230174958.GA496221@pevik>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768506455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=RQgIG5wHY107kk5016DNRUqJ9XltDGjd95jDimeqQdM=;
 b=dUG+4ZhiroXSu1MDwNZv0igoGWJGU46vuTw7aVgP40lr70/0hAiVssdgN9r8bkmRdOPrsL
 2SoSA4ki6VHclSoXc1Ml7daiOBdtL0KFJCd1t7xTfxkIuDo9bh/qhh4et8qhP0sebLVO2S
 oU9ZnUPNhMrMFKjimaKoOyEJcKC7YxjUsqg89JLmUg25sSIxjZqbkz28g9n6IDZJmtkbGV
 /EWoF8hBsgjN9K4ReK3zxBMHFyqEZlPfspIrWnuI5fxzhfBbpUJfLKTxdHmEia9EEntil9
 zqN0VaJg6W/8B4tliwGZZKyfD6JJIn5X6tL0ezDqUOlVioBiro9QE/tEt4DH7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dUG+4Zhi
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: ltp-testsuite: replace
 runltp by kirk
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

On Tue, Dec 30, 2025 at 06:49:58PM +0100, Petr Vorel wrote:

> Yeah. I don't like it either. Specially LTP tests themselves does not require
> anything (single test is either binary written in C statically linked LTP
> libraries, we also have few POSIX compatible shell based tests which require
> barely minimum of external dependencies), it can be run as is.
> 
> ATM we have list of tests in so called runtest files [1], which contain list of
> tests (each line is single test: "test_label binary/script optional_arguments"),
> therefore anything which can remove the first parameter and execute the rest can
> be LTP runner. i.e. Buildroot custom script could be really minimal.

I don't think I would want Buildroot to carry its own custom script
for this.

> runltp does quite a few other things but these who need them should really move
> to kirk. Also we plan to implement in kirk and ltx running tests in parallel.
> That will save a lot of runtime.
> 
> [1] https://github.com/linux-test-project/ltp/tree/master/runtest
> 
> > One option would as suggested by Petr to use kirk in its intended mode,
> > with kirk running on the host, and connected over SSH to the target to
> > run tests.
> 
> > On the other hand, it was a lot more simple/convenient to be able to
> > just run a simple shell script on the target to run the test suite.
> 
> Would it be possible to have both? Vendor runltp for local use and package kirk
> as a host package (+ ltx as normal package)?

I'm not sure what you're suggesting as "both"? Do you mean, having a
simple test runner that we can run directly on the target, but also
offer the possibility of building/installing kirk to run the test
suite from the host?

I'm not sure what ltx is in this context.

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
