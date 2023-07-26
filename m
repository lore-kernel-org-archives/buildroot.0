Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E38C0015E
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 20:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9582E40BAB;
	Wed, 26 Jul 2023 20:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9582E40BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNktaGCIDpIs; Wed, 26 Jul 2023 20:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA46040649;
	Wed, 26 Jul 2023 20:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA46040649
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89B441BF40D
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5880340121
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5880340121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9W8l5hvVhptr for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 20:34:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5C8F40106
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 20:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5C8F40106
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD8A1C0005;
 Wed, 26 Jul 2023 20:34:01 +0000 (UTC)
Date: Wed, 26 Jul 2023 22:34:00 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230726223400.2bcca37c@windsurf>
In-Reply-To: <20230726202838.1931660-3-christian@aperture.us>
References: <20230726202838.1931660-1-christian@aperture.us>
 <20230726202838.1931660-3-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690403647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsI2MBTgTr4MldqrDUnaKIjso10hB+8BWOfG1UfCWD8=;
 b=hFr/mZZWXZ9/KZLOgVzQG3sVYZw2bIycfTUjLkfpjBbKIQbFpu+XKOUyoK1K2Y2KgsMWSL
 bDyTUXfrbrkTZaRn3MC+trHGSPJKGpSEEAHAY3FEcIa1VWhtJqYgn1TdemKK1JQAUp5vt1
 k1AX/3DnFoHrH1qsKByJGHg3wEt/fpRhlHZluVMsi7FRlvo8FvA7nWC8bKWtz7cAReX1UI
 1s+W6kofDHVbFrPqq3urWxX056xRc5ZWd8PAK4PrfWJu44bcHf1mQUwv88AbWZkl4pIYNL
 dQbuEFzPrgb6KTU63faUQhOFkMRJM8E46icCQqZAXUCLyqiFLIstCduqz8Q03g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hFr/mZZW
Subject: Re: [Buildroot] [PATCH v1 3/3] boot/uboot: add host-python-pylibfdt
 dependency if needed
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
Cc: "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jul 2023 13:28:38 -0700
Christian Stewart <christian@aperture.us> wrote:

> If BR2_TARGET_UBOOT_NEEDS_PYLIBFDT is set, add a dependency on
> host-python-pylibfdt.
> 
> Fixes a build failure with uboot 2023.07:
> 
> $ make uboot
> error: pylibfdt does not seem to be available with python3
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

But I thought pylibfdt was shipped as part of U-Boot? Isn't that no
longer the case?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
