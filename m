Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58FCCA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 08:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0767060F34;
	Wed, 10 Sep 2025 08:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmsFb2ypGdcO; Wed, 10 Sep 2025 08:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF6060DC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BF6060DC2;
	Wed, 10 Sep 2025 08:11:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B2D610E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 08:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E07BB60D9E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 08:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zt9lrCW95wbj for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 08:11:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0DBF1606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DBF1606F6
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DBF1606F6
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 08:11:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A72B74E40BDB;
 Wed, 10 Sep 2025 08:11:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 690B1606D4;
 Wed, 10 Sep 2025 08:11:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34FF4102F2955; 
 Wed, 10 Sep 2025 10:11:22 +0200 (CEST)
Date: Wed, 10 Sep 2025 10:11:17 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250910101118.3bb72b85@booty>
In-Reply-To: <20250905122603.2521801-1-neal.frager@amd.com>
References: <20250905122603.2521801-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757491895; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WKkrhu5m5WXwuUEvpkzEi10wvcn4GlmedJmFIlgbI1Q=;
 b=1h3xGQA3JTPTxHP7iQTtoIQCW2DZaeOkq4z24va/8mCO91iQCj6bjhQi4m8wSfZ0LIuaSd
 SDCC08vbrktHo9qVfub+wq/2kG2g40OTXbBEWujjunUiRq3M8pub/s9WSIka5DOBoz529t
 9qjTTuopI5o7N0wHiLimm+oz6rhgfbdXvf7qiVkmhmgYOQVBiERPG7+kamEKBEW0dw5IMz
 zuzlaI/3czGc6CRxunp3+q6HaPi4cNlKaYbnj+I3eKq90/JALebZ9B9Rkyrs4nbZJJ7O50
 BY1m2ixP4Z0/jbagK+8kMyg/LWzgPmG1P9GyDTSzYpVMcFFjcEO2MJDCYcP5rQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=1h3xGQA3
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/arm-trusted-firmware: override
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

Hello Neal,

On Fri, 5 Sep 2025 13:26:03 +0100
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

Nice bug!

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I'm not sure whether this is the correct solution or rather we should
unexport BL31 in the main Makefile (in the "Hide troublesome environment
variables from sub processes" section). However as far as I can say
this is OK, and definitely self-contained since it's likely that other
packages won't be affected by a BL31 host environment variable, so:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
