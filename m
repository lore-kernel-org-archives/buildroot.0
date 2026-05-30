Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4EDCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 515986F5FC;
	Sat, 30 May 2026 21:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4x-_IGjje4z; Sat, 30 May 2026 21:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7727F61C38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176954;
	bh=+mGdFknXlSOWGLBLczn3ajk1MJ0vwuoEMrE7lg55nb8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o4YdEIwSRbLyax2grsODqynmnHIQnpGZBPe6CAD3hJGCNhwS2MrdE8doMvKic0+Bu
	 ztkVM1zcdtuIGsIw5J6a5iQjDNopK5Pc68/PZdCUCGxA6yanrEcklFFztyie12lDIT
	 jhIS/+ctS8Gjo5x6RYzy1SJh+FcIclqkhrKoHJ0nsC90K2leREN+E1S96PgoMqG/6q
	 D1d3OU9iz0kpyf29i/K3SXpXNCc27RVuaX0891hm52VzeKrypCWFJoDFJBNq6J/EG0
	 0RF7Ykxk91U03pw+TkxOwudQ7mqPaYFqfyH9B94wYy9VhB0QX53GK0UNkxVYMPEhWa
	 8bs58xPMkpekw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7727F61C38;
	Sat, 30 May 2026 21:35:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA21C12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBE7F61C38
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUvyafhDfV4u for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C334A61C37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C334A61C37
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C334A61C37
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:35:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 274111A3751;
 Sat, 30 May 2026 21:35:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EA89C6073B;
 Sat, 30 May 2026 21:35:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1854E10888CC7; 
 Sat, 30 May 2026 23:35:49 +0200 (CEST)
Date: Sat, 30 May 2026 23:35:48 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <ahtYKKiaJ5Y-vZTq@windsurf>
References: <20260519091548.2867405-1-giulio.benetti@benettiengineering.com>
 <ahtX8NyfFVmQOCEk@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahtX8NyfFVmQOCEk@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780176949; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=qlXzBvyCylaVOlIuAk6vWKOxuDCzeohpB1aWNZW56cE=;
 b=bSXFwdJV4ncx3z4NNmMrb+Y+VpG6l1ntUMRLV1W5drZfRPSlB/rgRnK5Ac1SItm8QC2QYL
 gxmR8bnkj/mVuHKWfI/J5N+2tlIuwf3tv3XPxJGw7TC5jXL03N+pV2LNGBXPqHhfEws4Y1
 fU6omXPHZKLA+Ot3qaR53eMaMjM3nwrX8pghFTAAkox0EYhR7Dj8Wfyz4kzSN22dRbIcnd
 pHiFbbmbtKG977xVjzAkeX5V+1W4FG8QDsQPq5Bz3BDhp2GNaoUgX7BNMbrX6R3W60svLF
 e85tMOYZVTfGAy5jA6wb0OWbCYU9bHNowPMnG0RfztTqw4qzBQTn/jIxNx/O8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=bSXFwdJV
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

On Sat, May 30, 2026 at 11:34:54PM +0200, Thomas Petazzoni wrote:
> On Tue, May 19, 2026 at 11:15:48AM +0200, Giulio Benetti wrote:
> > Bump to version 2026-05-19 on branch v5.2.2.4 to fix build failure with
> > Linux 7.1.
> > 
> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > ---
> >  package/rtl8188eu/rtl8188eu.hash | 2 +-
> >  package/rtl8188eu/rtl8188eu.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Applied to next, thanks!

Wrong: I applied to master, not next.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
