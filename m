Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B57D13570
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 08:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D251E60586;
	Mon, 28 Oct 2024 08:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-hjjlCfTQ0z; Mon, 28 Oct 2024 08:26:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9204607CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9204607CB;
	Mon, 28 Oct 2024 08:26:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FAB34EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 08:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D94740645
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 08:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-MjWsqFm9PL for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 08:26:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2878240649
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2878240649
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2878240649
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 08:26:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD1CB240009;
 Mon, 28 Oct 2024 08:26:01 +0000 (UTC)
Date: Mon, 28 Oct 2024 09:26:00 +0100
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: buildroot@buildroot.org, Andy Yan <andyshrk@163.com>, Andy Yan
 <andyshrk@gmail.com>
Message-ID: <20241028092600.61ee97f7@windsurf>
In-Reply-To: <Zx9EBoth4bf6QpQd@smile.fi.intel.com>
References: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
 <20241026144748.09d6b892@windsurf>
 <Zx9EBoth4bf6QpQd@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730103962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dKu8e3n1ke6yIMvJtZTKyfYYU1VZlSTD9dLvmOKDGKw=;
 b=k0nhOjUVPE2MdL9sSMi2nJgVpAoC+MXFXMdPO5UHBb/fIa7bNbNV7dQ7ObDkzGoFDS5WsV
 wZoX4wTPKrGtfl7PzsRX5H/m7KSFNWCzOHuxjmnOIMxiXvrw0f9hV8iN75v5xw+vdSZCO2
 ohtDsYUlQ4mjUZAc0bSE2FZYBM2ViYMw4NTY8Ee7LWrFwyPhjAvftt0u9K3syGSiFFfIki
 Zw/F/KrFFZFv14Ie0NzzmQ1t+w29fjrKpDN5aT3QYLGtJQuRqpGsanKlD5h7/Hxo8VZnDm
 0QTm/zAo99gX+aEdULPXTMDdCmmnekFobNOyhKRTnQCmhpzqqIL+Bl0HdzoRkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k0nhOjUV
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
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

Hello Andy,

On Mon, 28 Oct 2024 09:57:58 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> > One thing that isn't super nice is your handling of the DEBUG variable.
> > Ideally in Buildroot we would want neither DEBUG=0 nor DEBUG=1, but
> > "don't do anything and let Buildroot pass the CFLAGS it wants".  
> 
> Any suggestion how it may be addressed?

1. Don't override the CFLAGS passed by the user

2. Allow a value of DEBUG= that tells your Makefile to not do anything
   (i.e neither DEBUG=0 nor DEBUG=1)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
