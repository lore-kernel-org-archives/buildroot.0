Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047FDC3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE25B4144A;
	Fri, 12 Jul 2024 15:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLpzt1e5HmVe; Fri, 12 Jul 2024 15:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2212D41471
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2212D41471;
	Fri, 12 Jul 2024 15:35:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 919831BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DE67820C3
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQLdnmIdsFOT for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:35:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D08F82033
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D08F82033
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D08F82033
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:35:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6780EE0005;
 Fri, 12 Jul 2024 15:35:11 +0000 (UTC)
Date: Fri, 12 Jul 2024 17:35:10 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240712173510.20d586c1@windsurf>
In-Reply-To: <20240627220223.6687-2-aperez@igalia.com>
References: <20240627220223.6687-1-aperez@igalia.com>
 <20240627220223.6687-2-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720798511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nm4saove2PRfbFV8Gu1/6LdtjNNT/R6Xlu9aLGneeA=;
 b=UPu2dWySvXorWfwU0ov5c2CH3H52CLJPlvETSxec5EYAYbroF8ZlqCrJkGA4WhFJ2mvsw7
 YadKNEmjSf1PjAu4Tk+MUUKrTlZ0tmfS66wedqm0IGnnIeA73CCnYka+MK8wvzXFrwAWms
 35gmCqaUd4kfib6UXK2hd/9b/WvoyGPZfkDyI0bmFEP2rTzPiTTzF3pSgk3ymQmN+D7HVk
 C6xSRWz/IOSiG+VRhWSKOwvqLZsQMwnYI3TWc2pM58PSdyvDsgP5hkZIqYZQ/5hIKuKmug
 f30t+WVAr2ZrzZznYjsJ5DAKvTXLCAnzcB8in2IGXitYZD+hzXJnebb1VZeEcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UPu2dWyS
Subject: Re: [Buildroot] [PATCH 1/2] package/libdex: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adrian,

On Fri, 28 Jun 2024 01:02:18 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This package provides utilities for asynchronous programming in C
> using a futures/promises model. Newer versions of sysprof require
> this library.
> 
> https://gitlab.gnome.org/GNOME/libdex
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Thanks, applied with some really minor changes.

> diff --git a/package/Config.in b/package/Config.in
> index 550fdc1f411..ff55d892e0e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2155,6 +2155,7 @@ menu "Other"
>  	source "package/libcap/Config.in"
>  	source "package/libcap-ng/Config.in"
>  	source "package/libcgroup/Config.in"
> +	source "package/libdex/Config.in"
>  	source "package/llvm-project/libclc/Config.in"
>  	source "package/libcofi/Config.in"
>  	source "package/libcorrect/Config.in"

Fix up alphabetic ordering here. This was pointed out by "make
check-package".

> +LIBDEX_VERSION_MAJOR = 0.6
> +LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
> +LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
> +LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
> +LIBDEX_LICENSE = LGPL-2.1+
> +LIBDEX_LICENSE_FILES = COPYING
> +LIBDEX_INSTALL_STAGING = YES
> +LIBDEX_DEPENDENCIES += libglib2

= instead of +=

> +LIBDEX_CONF_OPTS += \

Ditto here.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
