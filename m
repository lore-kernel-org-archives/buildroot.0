Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15C0C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5173A40137;
	Sun,  5 Feb 2023 14:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5173A40137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyY8nmwU21Zp; Sun,  5 Feb 2023 14:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8107B4012F;
	Sun,  5 Feb 2023 14:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8107B4012F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A13F1BF334
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40F7560758
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40F7560758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mP28Lpcsiunn for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:00:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB0CB60746
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB0CB60746
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:00:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B98CB1C0003;
 Sun,  5 Feb 2023 14:00:24 +0000 (UTC)
Date: Sun, 5 Feb 2023 15:00:23 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230205150023.105dfc14@windsurf>
In-Reply-To: <20221107214903.1565321-1-yann.morin.1998@free.fr>
References: <20221107214903.1565321-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675605625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mM+U37sNaEj4cL07RAPEU285im4h4u5gGI9D+cOLiDk=;
 b=H3lXQqD9jZUiCSLo8U1gZQnskK5tqqnOZ/VTDCByNQLiu/Up++q/8UOAA5y+mhxJI+Wr9W
 TC6vjoaAjBrWC9fkf0A/FnXeugqYttTQyL6akb+QP2LH4DjKwX5bPXvTYWXhuHr7/bM0gw
 j/vvDHUfTsGbwg+cCCGxOZ+kDDAjBBu8axhwO1WfCOpJppKrMZ2Zu6oUbeel2RxQrYkKPQ
 W1a8tfwUUvDlYztiM05DdoFmKB44q70ydneIXCWSfjbO3KRRiIKqPrQfDXUMwNjH1qefoA
 rd/15wZeaXPj0jEsmsWGopqjgyAgRCU6lMQJZgQzXT2K683gtdUJ0jFDNr4Tdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H3lXQqD9
Subject: Re: [Buildroot] [PATCH] toolchain: make paranoid check of
 library/header paths unconditional
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Nov 2022 22:49:03 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> When we introduced support for the paranoid check of unsafe libraries
> and headers path with commit 4ac8f78d3771 (Add option for paranoid
> unsafe path checking) back in 2014, we made it optional, as we expected
> that would break quite a few packages.
> 
> Now, almost 8 years later, we only have three packages that explicitly
> reference the option (dillo, gnuradio, and libtalloc), either in a patch
> or in their .mk.
> 
> The option has been enabled by default since 2016, with 61c8854cef2a
> (toolchain: enable paranoid unsafe path check by default), and that has
> not triggered many build failures in a while.
> 
> The minimal defconfig used by test-pkg has also had it enabled as of
> b6c98b3549d8 (minimal.config: add BR2_COMPILER_PARANOID_UNSAFE_PATH=y)
> in 2017.
> 
> It is time to make that globally unconditional now.
> 
> There is still a remnant, in our binutils patches. As our toolchain may
> get used outside of Buildroot, people may got the expectation that path
> poisoning is only a warning, so we keep the current behaviour.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> ---
>  Config.in                               | 18 ------------------
>  package/Makefile.in                     |  3 +--
>  support/config-fragments/minimal.config |  1 -
>  toolchain/toolchain-wrapper.c           | 21 ++++-----------------
>  4 files changed, 5 insertions(+), 38 deletions(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
