Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D518D65C7C
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 16:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAC6D40ECE;
	Wed, 17 Dec 2025 16:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jil54oBFkkNq; Wed, 17 Dec 2025 16:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0F4F40478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765988934;
	bh=PFiAXcaEbKYeeBcO0kDRwvb+y1LaXSx7bMf5GgpfaxI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XJicl6V64XcrYvl32JPcZ4cBub/Ap+33E8p4SUhyITE/ZzjbA6t44iRJThQ5Tn6GT
	 RscxA8NILNZXAW87VQWZWrCspsUzsjXCEb71F78WFTryG9DlCHfUq1DNtTmYJCsYG9
	 nUWTS0M4rc67G7ZmcgwJdK3BTyaUQQwX1dhHSTIMAja3TQEfJyxfjecMVf3pXD0Bqm
	 4y84mCSWHksPjaAqi4ZPwoPPls/Ix4KpNrrjUpUe3IdEOQJpvOgoAzcqoMwdg3ar71
	 4V2cRbuqBtAgovgOMgaU/j75AHsyl9NLeNpyERAfmnnZYxqrDz5Dp1J5YL9Tjz2ELl
	 /Nlq7K4P284Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0F4F40478;
	Wed, 17 Dec 2025 16:28:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D662C3
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 16:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9A8960B42
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 16:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPzB_Dxs6nmp for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 16:28:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A759D60AEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A759D60AEC
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A759D60AEC
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 16:28:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 706104E41C64
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 16:28:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 254936072F;
 Wed, 17 Dec 2025 16:28:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5AEAC102F0AF4; Wed, 17 Dec 2025 17:28:41 +0100 (CET)
Date: Wed, 17 Dec 2025 17:28:38 +0100
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org, Fiona Klute
 <fiona.klute@gmx.de>
Message-ID: <20251217172838.6ecf51e5@windsurf>
In-Reply-To: <d1fd147a-3d1a-4286-941d-05dc0e44ef3c@bootlin.com>
References: <20251201-rasdaemon-v3-0-8ad394bdc372@bootlin.com>
 <20251201-rasdaemon-v3-1-8ad394bdc372@bootlin.com>
 <c517b6068e9301eabb9d433d1689cccc@free.fr>
 <d1fd147a-3d1a-4286-941d-05dc0e44ef3c@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765988923; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k/naIyUCMigFYvKPbt4mv9CILWz0d+wv+KsR4d56jrM=;
 b=h5me0z/WBpGP0ZsPAa44HQWetGupjy7qM5VFqX+YY2KM4eexo+Q2TI4K/+82Yf2c/Wxzao
 1ppTcyJmnBzeUfwUM6eo1QUCJWSkY57UhaSiYzsw2z23gGeCaoe1WJ38+4BGO1dCX/1108
 GxSDbDUNklFfiuikdZg/bcU5nh7dD9YBPsRNgribEZSu6GDakQmU+mP5Y+0nV/SBnE3UCc
 22A1RIDGh+20RY6vnIy1mW4adTWVDPitXIgdntRYVVk7NYDt6IY4RqfnUQtUKXAg0xuEYX
 mmtRvmONPQwAch8Kq/ZYSIK99Gv4IDIgPhr4taUQq3ClrQSxkpQLsSPeqFvS9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=h5me0z/W
Subject: Re: [Buildroot] [PATCH v3 1/2] package/rasdaemon: Add rasdaemon
 package
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

On Wed, 17 Dec 2025 16:30:22 +0100
Bastien Curutchet <bastien.curutchet@bootlin.com> wrote:

> Sure, I'll just wait for my PR to be merged before doing so.

Your upstream patch is simple enough that you can take it into
Buildroot and put it in package/rasdaemon/. Make sure to add an
Upstream: tag that points to the upstream PR. Indeed, it may be some
time before upstream (1) merges it and (2) makes a new release with it.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
