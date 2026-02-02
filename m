Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C93E7314A
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D6440A3C;
	Mon,  2 Feb 2026 10:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YMll5x57e8u; Mon,  2 Feb 2026 10:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896C140A16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027202;
	bh=ReXZ4kJGLP4mtw8PFM565M2dUzIaLv11KmP7d0XTNmc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XjK39yxOix7pVWJMJ6R6I8ZHm3ecMSLnIPyz0w8tWYOmUk05B8J1VxRAFTBsEtbY6
	 6/FIQC8nSg76kDmXFln6mqb/BaLDzvP1Fb6MpAeDw5Gt8Akmy6nENPiI1OkphAL4Vy
	 rpJixnZjvlaZqIDRr4HWrEqre7oLOR+B8N5t8V7p9bMu9fYX35nv0IK6AmBYG78LD5
	 pvC7mChy0DK3ZXmEeDlKiPbLAmcraFf0zEuOacoq4wVs/uB5SbytTg2U7FMFkj6oL0
	 E4zOiPl3SMAABVGUQPN837VNHOlXUABWaHPNIzMcGnUplCuwq4NEUwhh2hGc0yTs5B
	 tUqmSqlSlCfqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 896C140A16;
	Mon,  2 Feb 2026 10:13:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B07A149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 159C560665
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5ornanfhJvL for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0296460664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0296460664
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0296460664
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:13:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A43404E42367
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:13:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 78B1160767;
 Mon,  2 Feb 2026 10:13:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B687119A8888; Mon,  2 Feb 2026 11:13:13 +0100 (CET)
Date: Mon, 2 Feb 2026 11:13:11 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>
Message-ID: <aYB4i6UL6oI32BDV@windsurf>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
 <20260114195451.3978704-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114195451.3978704-2-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770027195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=9JgwPVhVz9V1RrOtNrIRQ5NvopLE0fqzlb2QChegt30=;
 b=F7wk1Fl12+ml4irOjEakXytiUBoSXvvFSm81/tTprS6j5tr6Xw7a5uGFwUdpkuM4M3SphU
 64w3YDXoqgENxigZ96V7VRu5XWMTqkCsg8nQJgy+FLgBtyMrypt5A7PzjXGrghp8obGYhV
 /tmVcXmLYBwn+OWRlVCQWAeQ52hSlYGzxMhxs35EO4w6L2H+RvYjhGwyGi5sxIY6+sv3OZ
 4hu7ywAiVzh/7jaj0kwpew9Ks/7Q77y+Q9zuBjhoat3OCpsq/0ZFBeB0rgaGnlR+ZLJCQ7
 89TqomUQEU81kndLkPsgzioox/qSOS134fmt24dPZH60ccpmw1Dub36srz57AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=F7wk1Fl1
Subject: Re: [Buildroot] [PATCH 01/17] configs/amarula_vyasa_rk3288: bump
 Linux to 6.18.5 and U-Boot to 2026.01
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

On Wed, Jan 14, 2026 at 08:54:34PM +0100, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.5
> * bumps U-Boot to version 2026.01
> * forces check hashes
> * switches to extlinux

Unless I'm missing something, this patch is not changing force check
hashes, and also I don't see anything related to extlinux.

Are you sure this commit log is matching the changes?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
