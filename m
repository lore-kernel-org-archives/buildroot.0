Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B160E91291
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 08:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E90B8295A;
	Thu,  5 Feb 2026 08:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVkL-wrqh4fi; Thu,  5 Feb 2026 08:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4900283863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770280704;
	bh=9PwTkayupsDr60yGYsOAzBcL13huWPWWafd61gZLLLY=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FPHvAIwRR4W7GGJZRNikaFhJ1buJtNL+0RsmHqfh1F5ljPiBzgtCyLcbiM+6HDatK
	 a0TGdow0HADMczqJ37X8ZdM46MqiKW8dE7uraqqSoU3YZxurh31ybO/U6/RnVAFBF/
	 eQR02bPFa5LVKyOSw7jLSsREpqpKakXDiGW6xFlIgmdqyLwpi1qo7yqKZXJcsGfSKE
	 NkknxRmeglRr1v90ggVM4XxPAYd3Ud0w/uNtpufxTJwFdMN4aQp3Fzr2c5tDeYo6lh
	 0swGBxEYhIAJCE1x9usitXHSqe0gyMoRh6LpDbpTDueoIdfTlgDc1wNqX0Rdi+MP2F
	 IeoQj39K6mUsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4900283863;
	Thu,  5 Feb 2026 08:38:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79B1A173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 08:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 650DC8409D
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 08:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BEerdjHVDyl for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 08:38:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6968584058
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6968584058
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6968584058
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 08:38:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 09A5C4E42409
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 08:38:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFF82606FD
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 08:38:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 367F1119A865B
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:38:15 +0100 (CET)
Date: Thu, 5 Feb 2026 09:38:15 +0100
To: buildroot@buildroot.org
Message-ID: <aYRR-h2Ol98Svw2Y@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770280698; h=from:subject:date:message-id:to:mime-version:content-type;
 bh=1ZpvaEak9s3taGjM3T3fM8KMD4Iw1RrvJxyZ3mNyLXY=;
 b=NfyPG4ps7/5mDhK14y4U0CXOq8dn5Xfl7dVwDfX8mL9QojAk9M0Qz/bkaMj+r2+9VyQ4Sk
 D7JbIJy5uoaboTeKy3K+7dH6VqBAc4iXegWtty5pDsc7w2qL6wvb0QJuipD3hLM4BDYdYB
 Q734pN6QK/L1tM/dki/ZmlSYZg29ANJzp/Ptd5OZRIqp9yj9tbrX5bBz9VL6X5zXh2kDT8
 1CgJEKYDRCLfxlwPp4NNJo2+UPVJkLAw6K/ecC0w+KmrEeNN1TBFaPamfi9Lbqb4q0eAtq
 jOlwwLpHO6ZQS5GEBlm+z8+BExkjXzxLBq2mKbNtey1lbRaUAJUUMnQlrqEdqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NfyPG4ps
Subject: [Buildroot] Announcing Marcus Hoffmann as an additional Buildroot
 maintainer
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

We are happy to announce that Marcus Hoffmann has joined the team of
Buildroot maintainers. Some of you might have seen Marcus pushing a
few commits already.

Marcus has been contributing to Buildroot for many years, on a broad
range of topics, and has accepted to step up as a maintainer.

Therefore, the current team of maintainers is composed of (by
alphabetic ordering of first name):

Arnout Vandecappelle
Julien Olivain
Marcus Hoffmann
Peter Korsgaard
Romain Naour
Thomas Petazzoni

Thanks a lot to Marcus!

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
