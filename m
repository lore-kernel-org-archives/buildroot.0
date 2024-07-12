Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C86C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9938140B5B;
	Fri, 12 Jul 2024 20:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GeZL6myfCzJM; Fri, 12 Jul 2024 20:23:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B97140B77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B97140B77;
	Fri, 12 Jul 2024 20:23:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6311BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13AF940B5B
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SY3JsEICFMgf for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 966BD40B3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 966BD40B3E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 966BD40B3E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:23:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA526240002;
 Fri, 12 Jul 2024 20:23:39 +0000 (UTC)
Date: Fri, 12 Jul 2024 22:23:39 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712222339.3f63c86b@windsurf>
In-Reply-To: <20240520084931.20190-1-ju.o@free.fr>
References: <20240520084931.20190-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720815820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FC0Lp0VjC7SxK/6LN7lJpr82l81+DF55EBf2PXCWMWQ=;
 b=KLSnr+i40io3iPRNr1wIhH7Sn0lL00oP0nMn6Pvkl3vuypljjoiZbrcEm/C92yTkaqpGH+
 kjBDrlXOJGkHyUu6raHQWnht1TKFe7zUbNeJRhRSjx9qFthv0djUgpYYiInxJW1MQfW8j7
 K/1kxPi7Ea6Jc3TtPR7h1Hm2np6W7s6G4E7yT1mlorjPwREsmSYBoqILuSA0yXwbZ7rY3C
 0/zkDWBj6WAiEG+AYofMP/RlJDlamDidz1NHdNPsUZA9fsDAFqNbOB/rIa0aZkP4AlCMLh
 9kqOXegUPCa6FxZHh2Gr4pHEwREgEm2G/IVgpwxD4cCBycnJiCrGH8mv/FQnTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KLSnr+i4
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mpico: remove defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 May 2024 10:49:31 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This defconfig fail to build since commit dc0f721
> "package/gcc: switch to 13.x as default".
> 
> This board is no longer listed in the supported platforms in the
> latest BSPs from TechNexion:
> https://developer.technexion.com/docs/release-notes-yp42-2024q2#supported-platforms-in-this-release
> 
> This commit removes this defconfig.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597285
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                           |  1 -
>  DEVELOPERS                                    |  2 -
>  ...low-lower-address-access-with-gcc-12.patch | 62 ------------
>  ...dd-support-for-new-binutils-versions.patch | 62 ------------
>  board/technexion/imx8mpico/readme.txt         | 99 -------------------
>  configs/imx8mpico_defconfig                   | 40 --------
>  6 files changed, 266 deletions(-)
>  delete mode 100644 board/technexion/imx8mpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch
>  delete mode 100644 board/technexion/imx8mpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch
>  delete mode 100644 board/technexion/imx8mpico/readme.txt
>  delete mode 100644 configs/imx8mpico_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
