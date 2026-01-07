Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED71CCFD637
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D098209B;
	Wed,  7 Jan 2026 14:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xl2Yna_K3_j9; Wed,  7 Jan 2026 14:09:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A87821CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794962;
	bh=lErJ/9IdXT/AGYPlqb5RBtTahzQ7u+B8HKuMYBPcXGY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TIaSIBUrd1WomwNVJWX/IppPhMJyGNPhCT1CPPn0VqQ2AE2P5sZjXli52ZG1dH0IP
	 vv739rOEGKy7fKJzIbx2KP5/E4vRfygcSbrmZDO5cDZGGpZra47dFdgG4ZO2ZrB0RR
	 DpLtgOCmHf1Ap7lLcRQyeBmC3d9ug1peYAvx33PTt3KYZ5MYM+z6quRznWBpJqIqUP
	 8M7NJoem9tzpx7HCCCaVPsREb4TRkOy2WRrt2k1MS9A1i1c86zHodwBja4zWGbpiAe
	 IlowZpit+rs4CkQZ67EqqeYFRFKWl3jP76pnt4GNNh1MEh2GNYplsrqp2aEaTa/zsv
	 yK1t0jSxDjrSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1A87821CB;
	Wed,  7 Jan 2026 14:09:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD069436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF538409A2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxB1zTawdI-c for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:09:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A71E44099D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A71E44099D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A71E44099D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0BC3C4E41FD8;
 Wed,  7 Jan 2026 14:09:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D61B3606F8;
 Wed,  7 Jan 2026 14:09:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 53B6F103C84A2; Wed,  7 Jan 2026 15:09:17 +0100 (CET)
Date: Wed, 7 Jan 2026 15:09:16 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Trammell Hudson <hudson@trmm.net>
Message-ID: <20260107150916.43a45891@windsurf>
In-Reply-To: <20260106192006.1629907-1-bernd@kuhls.net>
References: <20260106192006.1629907-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767794958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3v8wb6tTRejdY8PIGM188ggwseER117IaWE5o/hm6YI=;
 b=XxC7zosWngldgRLwc5gUsscpBRguo0JYinQN9yOBp1O7WFpm9Zk6HwvRbo4h/Zt0kH9JjR
 KAGaJlfEKqRA1mCFan/QiHmUE6sed3KpZCFrONZ3b4xwQdfukpSFbFrD0n3PLUikSRZrcp
 uCa1EJMDm9PTC+VtJcMhZLbF1kg4ltgOgzKqDE1KR/ATtO5ueC5hwlxv5maUIGTp5W/Wpe
 ANMv/sPgSn9bI0+BttkaWyia5JCtNaR1sVx01eIznPP/0NY2W2PYykMV88ajbRXNR6lG1k
 ElmAJsSe4CPGSljQDCRNhSvqMgihRhyjcrVlAHQu2qgDb/I8TGjl6ZOFS81iVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=XxC7zosW
Subject: Re: [Buildroot] [PATCH 1/1] package/nqptp: needs threads
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

On Tue,  6 Jan 2026 20:20:06 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/5b5/5b5eac85ca0221596ee12ea5e23acde46c6b7edb/
> 
> checking for pthread_create in -lpthread... no
> configure: error: pthread library needed
> 
> NPTL support is not needed, this defconfig builds:
> 
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PTHREADS=y
> BR2_GCC_VERSION_15_X=y
> BR2_PACKAGE_NQPTP=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/nqptp/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

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
