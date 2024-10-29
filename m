Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4927AD3A699
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AC1C80A99;
	Tue, 29 Oct 2024 20:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWBygsttxBRF; Tue, 29 Oct 2024 20:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 301E080B04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 301E080B04;
	Tue, 29 Oct 2024 20:35:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D6484EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BB9B40A86
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phWzYf8ccxur for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D8761405F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8761405F4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8761405F4
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:35:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC47D40003;
 Tue, 29 Oct 2024 20:35:53 +0000 (UTC)
Date: Tue, 29 Oct 2024 21:35:53 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>, Adam Duskett
 <adam.duskett@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, James Hilliard
 <james.hilliard1@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <20241029213553.4d0ff82e@windsurf>
In-Reply-To: <20241010135318.3064224-2-fiona.klute@gmx.de>
References: <20241010135318.3064224-1-fiona.klute@gmx.de>
 <20241010135318.3064224-2-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730234154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Ki/ZPlsiKFN8PHokBxOsVKCxxOhKnYr0sJgo86hasQ=;
 b=Bgh/bzo7eI2ztN9OC1VQU7tFOKDwjMD8YAL+4ooWGM4+55WW2xbdzwfl7Yslakn1/FjI8j
 VXK34etgQ0yMGETEwnnwk2wgH4LWdMjfbQRZCBmGMyDfkKgN5XqbejYCtseP/0rQ9IdGRs
 pPpzE4WsN6alBFEEclaP2iQYUDy1gqCDea7RNhJYM6oNzCmchBGuBDp24vJfqtvWRRKGn9
 loBQOiauyWkCrBNcEnzn0rwRwimoQiuu7VLPUltscTeK2uoritZqm5jPuU7/D5VH1XzaMB
 dWnlqsU8bOdBcPin+TOY1fufkhD4QIuFOR8v6SWiJDW1yqtrSAlJWo8cPR4hXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bgh/bzo7
Subject: Re: [Buildroot] [PATCH v5 1/7] package/gobject-introspection: don't
 depend on cairo
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

On Thu, 10 Oct 2024 15:53:08 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index ad72af22a2..af27781cf7 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -47,12 +47,7 @@ GOBJECT_INTROSPECTION_CONF_OPTS = \
>  	-Dbuild_introspection_data=true \
>  	-Ddoctool=disabled
>  
> -ifeq ($(BR2_PACKAGE_CAIRO),y)
> -GOBJECT_INTROSPECTION_DEPENDENCIES += cairo
> -GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=enabled
> -else
>  GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=disabled

It didn't really make sense to keep it as a separate
GOBJECT_INTROSPECTION_CONF_OPTS += assignment, so I folded it into the
previous GOBJECT_INTROSPECTION_CONF_OPTS = assignment.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
