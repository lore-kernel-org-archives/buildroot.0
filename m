Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72737C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2474460774;
	Sun,  4 Jan 2026 14:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ViuQHEQjKBSx; Sun,  4 Jan 2026 14:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 522D360730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767536417;
	bh=jEJ0UtNBC8+O7kGsIAYzAecmN10wbrBklXRbG8uUBXE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LNDO3NBIDbijHUlnCeNydhdR6ceUtIjTKtQROdWPR1fNv2c+de/MzSxZ9juB0y/ch
	 AT+WEpsrQRu9WPxkLhxFXPITkIxJTzlFAMCbFYh/5PirNI21qI+UdNLnI3Y1EsKm4i
	 VK9jPub3Lt4qjL+dgl7TjtnG1VRIrMNJxjtuQnKNJC1JG+k+y2/WGt1Bx5IDc7Ik0H
	 gFGL5QJUVDfoWO5afAtrEmWXtWyqClWHnQC8nCOsaug3W+RxhLtM0gn2s5y9dVMWYP
	 RL3C9WfeKuhE9A+JmFyShCXOqH4NjqN6V3Q28QlQo143T81RjQ1N9NXotK9GymtVs7
	 v12bzQQAD//+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 522D360730;
	Sun,  4 Jan 2026 14:20:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82E632DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 750D640210
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tk8lMFBNWKVI for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:20:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 659924013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 659924013F
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 659924013F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:20:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 68A5FC1C96E;
 Sun,  4 Jan 2026 10:56:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3E8876072B;
 Sun,  4 Jan 2026 10:56:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9660113B0449; Sun,  4 Jan 2026 11:56:45 +0100 (CET)
Date: Sun, 4 Jan 2026 11:56:44 +0100
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Dick Olsson <hi@senzilla.io>
Message-ID: <20260104115644.35a50066@windsurf>
In-Reply-To: <20250630185854.9826-1-ju.o@free.fr>
References: <20250630185854.9826-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767524206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=C5QRmuHw4YeRtLq6T8/ttXIXqyBWv0eB57FrmR3Ldmk=;
 b=OeIR2BIBPM4+fScN9Haz3WX1/o6r1hzceZAWjm0jXj7qR3Rc3Xm4zKY8rGLlRueF913Pvm
 6QGYel/R7uWk12tg9EMRyAFPAAbwqzUzd6FM+Aa0cIDRpKec2+MwYhrRSJLv76K7zCYWp3
 SnavtsgMpErKEOnmF8gPsiDIJyf8N23zJlQlzo7TEi2AhUIP0w3qov73bPdApg1+xtqZEg
 TqjdTOK0zIAKh3we4dDrQp7lxNj+cUIQfYTfRFu6S0goiwEfrs320dK8649q5bq2nWPJYP
 54citDc5pK/BT9SOsI573hLTmDPdclpZhOmSI85mJ9LV0fKA2MWhwJPnKsPkaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OeIR2BIB
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: add a new Kconfig option to
 pass arbitrary build options
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

On Mon, 30 Jun 2025 20:58:54 +0200
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> EDK2 build may include extra options. Those are usually in the form
> of "-D SOMEFLAG_ENABLE" and might be specific for a processor
> architecture or a platform. For example:
> "-D NETWORK_HTTP_BOOT_ENABLE", "-D NETWORK_TLS_ENABLE", ...
> 
> Those options are generally documented in their respective packages.
> See for example:
> https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
> 
> This commit adds a new Kconfig string option to let the use define
> arbitrary build flags.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Sounds good to me, but one question:

>  EDK2_BUILD_OPTS += \
> +	$(call qstrip,$(BR2_TARGET_EDK2_EXTRA_BUILD_OPTS)) \

Shouldn't this go...

>  	-t GCC5 \
>  	-n $(BR2_JLEVEL) \
>  	-a $(EDK2_ARCH) \

... at the end of all options, so that BR2_TARGET_EDK2_EXTRA_BUILD_OPTS
can potentially be used to override whatever option is passed by Buildroot?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
