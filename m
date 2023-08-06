Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A48C00528
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 19:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51077409F0;
	Sun,  6 Aug 2023 19:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51077409F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHYeYbmOfdUb; Sun,  6 Aug 2023 19:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10738404DE;
	Sun,  6 Aug 2023 19:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10738404DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DDFB1BF421
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEAE2404A6
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEAE2404A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLYdF0Ak2iRZ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 19:42:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75BC4400CC
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 19:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75BC4400CC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D41CC0002;
 Sun,  6 Aug 2023 19:42:37 +0000 (UTC)
Date: Sun, 6 Aug 2023 21:42:36 +0200
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20230806214236.72d4cb2d@windsurf>
In-Reply-To: <20221005091032.3014-2-br015@umbiko.net>
References: <20220409160921.GA3547512@scaer>
 <20221005091032.3014-2-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691350957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2ot7lRJS0p4WoE91huqlqf+BbREwLypWuHvFainoPg=;
 b=GVagY9pkbjQqDQ7u1ReNYQSNCAz1NMkIgIYiadtI50yo5JDHtupIQBXfnAtjuDXdMMqDnu
 F8P21h1u2wRyu6e6qQZoXobAnb8qrwgDg3QeNekxngh84bqgQhRx9y0PjZX868bfOmaynr
 9P1U1roctOEFOo9YrWaJAm1cbnqh450nmbuh6MEr4mUfuaNuUQnbWlPtYghxu4NqcUDs0p
 ulNoFXtv7jvFq6x+0SCPdxkPy3Tj1L1i1wZsYkM/6MedI4MDn3ape3OUCkVqho2HXRI3fs
 Qc6iSiwGN6n0WlfaWMpmPqg/3lf+ikEoYK5lneNBp4FCBUmkb9lbZa1QL0lYqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GVagY9pk
Subject: Re: [Buildroot] [PATCH v2 1/4] package/mpd: fix reversed logic in
 tcp disable
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
Cc: YANN E MORIN <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Wed,  5 Oct 2022 11:10:29 +0200
Andreas Ziegler <br015@umbiko.net> wrote:

> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

I've extended this explanation with some details on when the issue was
introduced:

    package/mpd: fix reversed logic in tcp disable
    
    In commit 54b9008d482923131191da75f09966483f4ecac1 ("package/mpd: bump
    to version 0.21.11"), mpd was migrated from using the autotools build
    system to the meson build system.
    
    As part of this, the BR2_PACKAGE_MPD_TCP was incorrectly modified,
    leading BR2_PACKAGE_MPD_TCP disabled to actually enable TCP, and
    BR2_PACKAGE_MPD_TCP enabled to not explicitly enable TCP support.
    
    This commit fixes that by handling this option in the common way.
    
    Signed-off-by: Andreas Ziegler <br015@umbiko.net>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

> +# default setting is 'true'
>  ifneq ($(BR2_PACKAGE_MPD_TCP),y)
> -MPD_CONF_OPTS += -Dtcp=true
> +MPD_CONF_OPTS += -Dtcp=false
>  endif

Changed to:

ifeq ($(BR2_PACKAGE_MPD_TCP),y)
MPD_CONF_OPTS += -Dtcp=true
else
MPD_CONF_OPTS += -Dtcp=false
endif

Applied to master with those changes.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
