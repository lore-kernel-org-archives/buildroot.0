Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA714CFD637
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0AD282152;
	Wed,  7 Jan 2026 14:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J90HTRihcicy; Wed,  7 Jan 2026 14:10:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DAA382016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767795015;
	bh=6f+Z+knGqNPaRrmJViYMfOJkNiYTl+PZIgftazPh76I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ef+Iqt5q9tiBW+A5ByAc2meT9QfRvy6A0Lq5IRJQNqKm1dId9gaqnsmCwAK+F4YDc
	 oMYTmbdmSupSY7A/rQlSZi7QfinN4r2cksqpHHCesv8PWIRCD2xo4PFU10YhSOWGGo
	 e6lwjMCYFOQcVieKAE2OJDz2lMXNesRhoqK+QMNxl/ItDbSie7eACSLdOuTJqMlh8V
	 FbulDCH4VbG7pVaN+3i2PZeOrJpbINM1rGHtP/NDVkefwj5IubUfDy/1S2K4zzMKkI
	 c7E9Zy5JwFbHBP+XsalsNhFvQKWGYUG8hzswxtHsF/jvibD/uC8G7fH1ryRO+JLq7q
	 oE/QUUcXA07mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DAA382016;
	Wed,  7 Jan 2026 14:10:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3BA6970
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5EF2409A9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDP6gNJt_fqs for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:10:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A09EA4099D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A09EA4099D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A09EA4099D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:10:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C17074E41FCA;
 Wed,  7 Jan 2026 14:10:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 98BFE606F8;
 Wed,  7 Jan 2026 14:10:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BCC5C103C803C; Wed,  7 Jan 2026 15:10:07 +0100 (CET)
Date: Wed, 7 Jan 2026 15:10:06 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com,
 brandon.maier@collins.com, ju.o@free.fr, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Message-ID: <20260107151006.3b01289d@windsurf>
In-Reply-To: <20260107103452.84964-1-neal.frager@amd.com>
References: <20260107103452.84964-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767795010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0MUDP6/g4EQB7h0WbUJUmidKqJN4t8rhYPxkbdCcncQ=;
 b=laoOxoIQ3a8/673AKP6u6Yex+0yezagUZPmIHhauxqN350R7AvqqykPWFU2QaBlUcKyNeM
 IAfmdcNYZuWt248sY9gzHVc67zdzkUwwX/4S3YkkPittxIYn0IG8pltzCmfzdGU0d3t1qb
 nofIKsuRX2XXkXIkfTyi6PB09tBMngDB91XuW6a4520zNiGVfhwfVNmo5NUV2Kvu73rprg
 +RQ13jrIg1LcG6iJTcdDNkTguVIYPktDBmQGqDRZceauXWIJuf14nzDIGC2h4FBAtrWWm9
 TWLKpux0GeASJUwqxndxRwOJYe0izcrYdc3+WR6Y322muAkUphcnAlr6UxbxqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=laoOxoIQ
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/versal2_*: bump to Linux
 6.12.60
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

On Wed, 7 Jan 2026 10:34:51 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Bump the versal2 defconfigs to Linux 6.12.60.
> 
> Run tested on a versal2 vek385 evaluation board.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/versal2_vek385_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
