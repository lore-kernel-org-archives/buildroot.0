Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61144C98312
	for <buildroot@archiver.kernel.org>; Sat, 17 Jan 2026 08:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F32FB41331;
	Sat, 17 Jan 2026 08:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYiLqB5tcdJR; Sat, 17 Jan 2026 08:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ABFA41339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768640109;
	bh=BXjHRLSTk/kcCOMKbRj/eD9wOaItMtf7HyN8wf781sk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jTURalNnSwr72uL9gx4EjWHQPoCDFxNCVlmYiDZN4Ec1x8VCJ8rbKh9LpQ/lSIz1y
	 rqha9wD/70dpMF/twVVqDHpEvlXL0t+/2EyHSFvzuN0U8JjXOQG+doQa483p+Wockf
	 D5Rt8shrd18Mw9CtZMithtdRczkCbvEGJ0zAC1tIdgzTucrmmjnzxzEAZ85tjgDoy5
	 PNLkOgu8G4F37PF+41oBxoTuGyeOX1XZFXshHx7//MWD13ZORWxo+1bszPUxBvfRWr
	 U1MRqDcR/7t8cCvjLfWnHZ1syPnTgu1AUuBTHYU3VMuQNs+oWi8F7E9zE/SgQBcUn4
	 /dqWLj0nso4UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ABFA41339;
	Sat, 17 Jan 2026 08:55:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F2302CC
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 08:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DA6940165
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 08:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w39rYUbfZ3GZ for <buildroot@buildroot.org>;
 Sat, 17 Jan 2026 08:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BD38400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BD38400A0
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BD38400A0
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 08:55:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1FD324E420B6
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 08:55:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CEAE160708;
 Sat, 17 Jan 2026 08:55:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F74710B68FCC; Sat, 17 Jan 2026 09:55:01 +0100 (CET)
Date: Sat, 17 Jan 2026 09:55:01 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aWtOVsmKA6SDZa0A@windsurf>
References: <20260102161448.1184855-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260102161448.1184855-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768640102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=LIk80znQillTHMiAWBLS5qA9Xg7LP3lvRFhzPQrXORA=;
 b=rQFKSBajiU4DWcwiwl3c1Dv1tqJ39U7i9SF04tBm+CGkh6+8oMOuIIKfhfD7KjxlpCB+eJ
 Z6mwJGlkCly8tzdQ9Z8kd6IhlomkmT1RJpBPd/73rmHaAzEsFRVEtaCUHMWUd7f4xDwg7X
 Cz2IaMYBwD/jO0om8Yk7gKRblYo8eWnaLkekGsWz+1j/hQFCPjzmQu2bbbvlpfyQ3fglod
 CxZ4/o4vWUdxk197XgLn/Oe9h1Vb5nfgnFGySXIFl4H3PZpcm0tYc2kQtm3xaBZA3mZEi2
 Z9n7zV13FpG5Ver1zAdP8/v/b0zC6rk4It1JbSk7Q/SmE0GE4jP0Lp2c4gFvQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rQFKSBaj
Subject: Re: [Buildroot] [PATCH 1/1] package/lmbench: bump version
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

On Fri, Jan 02, 2026 at 05:14:47PM +0100, Bernd Kuhls wrote:
> Last release dates back to 2007, switch _SITE to active fork:
> https://sourceforge.net/p/lmbench/patches/3/#4472
> 
> Removed patch 0009 which is included in this bump.
> 
> Rebased remaining patches.
> 
> Sent some existing patches to new active upstream repo and added
> Upstream: tags.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
