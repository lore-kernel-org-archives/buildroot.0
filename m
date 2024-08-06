Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E75AC52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 21:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B62C6086D;
	Tue,  6 Aug 2024 21:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrJ3ABm3ZJIR; Tue,  6 Aug 2024 21:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34E7360792
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34E7360792;
	Tue,  6 Aug 2024 21:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAF9F1BF30B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D919F80897
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSaz9j_gnRYK for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 21:24:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F2E380891
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F2E380891
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F2E380891
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 21:24:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03A1AFF802;
 Tue,  6 Aug 2024 21:24:42 +0000 (UTC)
Date: Tue, 6 Aug 2024 23:24:42 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240806232442.0d61058c@windsurf>
In-Reply-To: <20240615091612.9579-1-ju.o@free.fr>
References: <20240615091612.9579-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722979483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVGlpJ26BvzKiDI2DUCeu2ARbNDcIbNv7bdjpYzHOf4=;
 b=izhhW1zU7mH9kOhXYwhwHrcFLZKLBr/OVRKFD3eJwOtcp51bcF8I+p5Bt2N/av/Z5z5ERE
 EnSbaFtDnPFEewSMWO+U91f0oVWUbzLpknlOX1Pi6DoUK7INKRTS5Ufx77ogh3FEup3ZkN
 Lx3Fgar4y2fZocu3ewQeqRiQOH/PdDxqN1uGdOfJPHRWQg7gUHIROQpzpGOa4DQhs2IUFj
 Qv+YGh7kj7ygWjNugQaidoUoy7K6gsUt6Gts9vcZcfwmytr1E08WSno5rdSekRvnvz+5wu
 LCDB1WNeciXA5JZGqdO1ycG3nwl6czPVphkcY0fPSFj0pERNxxONCer1tcmOBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=izhhW1zU
Subject: Re: [Buildroot] [PATCH 1/2] support/testing:
 test_audio_codec_base.py: new helper class
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 15 Jun 2024 11:16:11 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This is a helper class providing a template for testing audio codec
> programs such as lame mp3 encoder, flac tools, ogg vorbis-tools, ...
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  1 +
>  .../tests/package/test_audio_codec_base.py    | 86 +++++++++++++++++++
>  2 files changed, 87 insertions(+)
>  create mode 100644 support/testing/tests/package/test_audio_codec_base.py

Thanks, series applied!

Yann: I have read your good feedback and arguments, but I believe
Julien gave some solid explanations/counter-arguments. Generally
speaking, what Julien proposed is well aligned with the current
"philosophy" of the test cases, so I decided to apply. Also, if we were
to change how abstract test classes are done, we should rework it in a
global manner for all test cases, and not have multiple ways of doing
the same thing in different test cases.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
