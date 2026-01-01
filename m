Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0295EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A92FC82105;
	Thu,  1 Jan 2026 09:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2qcyoG2wrOX; Thu,  1 Jan 2026 09:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE09B821DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767261007;
	bh=gLG1K/94zSven0D3LWHOihZbO7LbPWj5atEEyMZ9gEc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gc7r6tQKnXJl/7GViOxAg0MMN8h/Jf6bdTSs0AOfMZOnMbZR4R71ocAw0C5JGSrXq
	 +IniwR8EyS/3GRgvASnLbHlaLGIqUfqfwrp3zHYgdCIUtHQ2rPPEt1JOaYQ9QRwBJI
	 giKYq+1PzrSRrPxiluto3OWzDxrpmVgquVznBL3PaT0KWgtsyPA0v7fDDxTZEweQdb
	 J2+3HI3Q0UNZd/0qqb36Q+QcPvl/whaNvO2WeXs/3F4Isqj4QsKSMZ+m1sK7Ymunxk
	 fMRWpkHS5VjDNgk8UIGPCy3wPXtedFeaYBLmNONQlkuuOTMnfNme5dQQp8ZO9QyGgi
	 WicLtlK899AHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE09B821DA;
	Thu,  1 Jan 2026 09:50:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7AE1351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA39C821DA
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZa-mwmFqXUQ for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B78FD82105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B78FD82105
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B78FD82105
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:50:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 17A011A2438
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:50:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E0C23606B6;
 Thu,  1 Jan 2026 09:50:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44CB0113B071F; Thu,  1 Jan 2026 10:50:03 +0100 (CET)
Date: Thu, 1 Jan 2026 10:45:48 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104548.14d49253@windsurf>
In-Reply-To: <20251231185047.3955846-1-james.hilliard1@gmail.com>
References: <20251231185047.3955846-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767261003; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gy0UpKfXa9YwHzGMNDh9SnMFzumn0NsQBbtvcrckGYQ=;
 b=hYHVct3hZFY4r8jJJelEyGvmcfvSkqdGZTOMUF4vV0mzlc5K+rFYWJvGThrYD1lODcyFgA
 vC8jdSnvzEsIaKyL6ftQJvbgaULquAwg+mWWFvpZ0mGwwcJChHznFVRCmA0aAR9D51IQki
 MV8/nXm2s1YUGjFn5ebxsVeTc5UeuNuu5LKZr2Dtkbsux5BEplrKhw8wSJSwlrIyI6bPAq
 L0BT7WPIv3+8LRO2Jt9LPOE3OArmbxsm1FoWFPyrOO6oiPjfPV4150pWEF/oVVQAqKbvFy
 2g79UkhpcoRIM/FqB1boIM7lOCg+DccsOsy/ZMnpO6RR4U8WT51IIzY7/rDrFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=hYHVct3h
Subject: Re: [Buildroot] [PATCH 1/1] package/python-termcolor: bump to
 version 3.3.0
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

On Wed, 31 Dec 2025 11:50:47 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-termcolor/python-termcolor.hash | 4 ++--
>  package/python-termcolor/python-termcolor.mk   | 4 ++--
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
