Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE3BFA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 963A48176F;
	Fri,  2 Jan 2026 20:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2OdkCWIrDm1; Fri,  2 Jan 2026 20:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE54881698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387269;
	bh=SClSnGccA2jZf1RPQgNm2IlvinTa2aVzGHhLpGFgKPY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FZNZrNyAKm6zE/aGRBe6259QwRJrnhqMGoG6WntL0qOTFIh1ITFKV5oEmr239RvYh
	 O6Y9s/K6WbuLsMQYfA8FJjLDUiUxuIe4X8pllyMWSjfJ4xIl5OxA5D51AVZO8dTubR
	 nALkdfnssQq3wm0FjeWYFFbo9RBgYi8R/4QyLC/Xgp+ZFQdhPk972tA6KF10S50Rmm
	 YFSPwI+V2aN7cmyziYatlKmSj8RNCROYMUdw+Ttmg3DVsPsQAYFXFwSTQvyK1+XKgM
	 5AXCbvnIcZOqYg23Ul5YSaxhSZySmclgqA6QXOu8YZegGLTMtyxM6qGiLT78r+y0E7
	 PMtee55N78lrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE54881698;
	Fri,  2 Jan 2026 20:54:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC1EA19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C964181583
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdxo7lZPpWTG for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:54:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 011B7813EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 011B7813EE
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 011B7813EE
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:54:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 02F141A25E6;
 Fri,  2 Jan 2026 20:54:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CD2E5606C7;
 Fri,  2 Jan 2026 20:54:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 27CD4113B023D; Fri,  2 Jan 2026 21:54:25 +0100 (CET)
Date: Fri, 2 Jan 2026 21:54:24 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260102215424.66b201b1@windsurf>
In-Reply-To: <20260102203917.5271-1-james.hilliard1@gmail.com>
References: <20260102203917.5271-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767387265; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=eqbQumvaqstc6ltYlzbEeTme36mD5/DphHuCDEPjPk0=;
 b=FyILXIkONnShl5vTCZFd1GoDl9kI/SYEBg6XBnCSh0kMGDRfg3nWyZPjFd5+L8Chy6YVjP
 1O89S8UghGLEghV4Q8ycfeANtI2KSt5LRnHWPt9KPDYRFXMe27vTHnVbf252g1T8uwRAFE
 ItU8cqGPBlGXngc33Q5TiUrD2tDX+T+iWdeKGKFqThZBh0xsJadpIxg9N6h6wd9WTzIjWe
 TSSwDnLpO4HIlahGbX2Gse2D00gwZsKxA1webeGqfyrLoZVIixOTFJ3PO5ua/9fu6HDgeT
 2n50iTrKZLZ7IF9GrdlWb2ovPCxCy0z0WScbhEQJF1Cj9ZASV24Gj7oDMIq7mA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=FyILXIkO
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 5.0.1
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

On Fri,  2 Jan 2026 13:39:17 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pycares/python-pycares.hash | 4 ++--
>  package/python-pycares/python-pycares.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
