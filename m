Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68045D10BF6
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C7B04094C;
	Sat, 26 Oct 2024 11:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8x8I2eYnLLbq; Sat, 26 Oct 2024 11:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15716409F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15716409F6;
	Sat, 26 Oct 2024 11:50:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3DC05C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D524D4018E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swXBwyG3nXZG for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:50:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 846E840195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 846E840195
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 846E840195
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:50:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E2BD20002;
 Sat, 26 Oct 2024 11:50:32 +0000 (UTC)
Date: Sat, 26 Oct 2024 13:50:31 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
Message-ID: <20241026135031.120e23ca@windsurf>
In-Reply-To: <20241004220541.2290809-1-aperez@igalia.com>
References: <20241004220541.2290809-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729943432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtMeucUwlthRIlxlp2meJMWHAoRnfLbeKAX/ugl8JJE=;
 b=KklPpanafDw0ZEp24POaGS3Fz48rPEwMMEUZFv2la6S3p/+inPKid3VqsiWgg7hlcgqPBZ
 r1RAO5IGrPTivfvcCijli+19cqs1EbYSY1WYqa7YfcsXE45mTD6Djc1Rt07ksCcIx1qcMP
 qwRLFkWXVSE4k6C4ntPt6czhl5QAFSVezqA+4N5GbFCNq6uDxlM+nLYCjlISOS29yUBROq
 NmzcUyrxlcpNGMXl8Lje8QOyCAAIWv+ELXckL10q1vd7vXASlTy/7QDk5sxTvjJ7isSG79
 YZxa+RYdKgQ1jgSefy+PNmSSmtUZbIntJ8I1vuwiJTyjLbKLuMTKMZHr/e2dlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KklPpana
Subject: Re: [Buildroot] [PATCH 0/2] Update Sysprof and libdex to 47.0
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

On Sat,  5 Oct 2024 01:05:37 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Adrian Perez de Castro (2):
>   package/libdex: bump to version 0.8.0
>   package/sysprof: bump to version 47.0

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
