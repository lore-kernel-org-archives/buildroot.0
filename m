Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032C7CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 07:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 949BD40C0C;
	Wed, 10 Sep 2025 07:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhAyNGMP40xt; Wed, 10 Sep 2025 07:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CDE1408AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CDE1408AD;
	Wed, 10 Sep 2025 07:51:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A135D234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92EEF4056E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_WhLjrSg6Qq for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 07:51:07 +0000 (UTC)
X-Greylist: delayed 488 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 10 Sep 2025 07:51:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 979A940527
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 979A940527
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 979A940527
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:51:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1A128C6B3AF;
 Wed, 10 Sep 2025 07:50:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D513F606D4;
 Wed, 10 Sep 2025 07:51:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A4E6A102F1D2E; 
 Wed, 10 Sep 2025 09:50:58 +0200 (CEST)
Date: Wed, 10 Sep 2025 09:50:57 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250910095057.08ac190f@booty>
In-Reply-To: <20250905122057.2520997-1-neal.frager@amd.com>
References: <20250905122057.2520997-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757490662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OwTyJWh9vyv7HCC80l9dMw6kzp4yNgctjAP7Yo/oVoY=;
 b=sa8IDau8aZcYduqIdcw64UiImj0j/sKRKeF84euMHbnwN9rC8dyxC8XMmfin0MKI6SitWt
 jqZc21zq4GJXNUD6KMAxWgzEdpgIj4CK0OSvelVQXHYF9KDQu/yeyGsBAR0l7DQb7EElFC
 q6qZtGADsZ4S02+MO1ceooKXpBO++mx/phkowkboaY6BBHiJ8YKwOjBVFyFJrB/9u7SLuR
 Qu5/4E9wjh3eZb7JhpdrrrnhXDNWHYxJxurias9Dg022AyyEyJeZD4/2rzn1W2y3fImc1Z
 B2K257kOfrqv2sMLTzUptURWLijzJPWiOmtnMKIUv1iN98hZFpsDqIaNbVUIRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sa8IDau8
Subject: Re: [Buildroot] [PATCH v1 1/1] board/arm-trusted-firmware: override
 BL31 environment variable error
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 5 Sep 2025 13:20:57 +0100
Neal Frager <neal.frager@amd.com> wrote:

> When building the arm-trusted-firmware, if the host environment has a value
> configured in the BL31 variable such as the following:
> 
> export BL31=/tmp/bl31.elf
> 
> This will cause the build of the bl31.elf to be skipped leading to the
> following build error:
> 
> make[1]: Nothing to be done for 'bl31'.
> And then:
> readelf: Error: './output/build/arm-trusted-firmware-custom/build/versal/release/bl31/bl31.elf': No such file
> 
> To fix this, clear the BL31 variable in the MAKE_OPTS, so that building the
> arm-trusted-firmware will build regardless of the host environment.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
