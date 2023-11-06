Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB57CC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 07:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66A0141E34;
	Mon,  6 Nov 2023 07:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A0141E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bp_XQ-qYOSmm; Mon,  6 Nov 2023 07:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDD7B41E27;
	Mon,  6 Nov 2023 07:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDD7B41E27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E41611BF368
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 07:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ACBD610D2
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 07:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ACBD610D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxfMJY6DWT_s for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 07:43:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C51C610D0
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 07:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C51C610D0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3719B20003;
 Mon,  6 Nov 2023 07:43:15 +0000 (UTC)
Date: Mon, 6 Nov 2023 08:43:14 +0100
To: Damien Le Moal <dlemoal@kernel.org>
Message-ID: <20231106084314.2458b0c3@windsurf>
In-Reply-To: <5761b87d-4843-4669-bc65-f6e1351e12b7@kernel.org>
References: <20231030002748.280144-1-dlemoal@kernel.org>
 <5761b87d-4843-4669-bc65-f6e1351e12b7@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699256595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VCr0UBp258Ag8dysmeghSAvHa9YgD0x55Ahccva00Y8=;
 b=ZkLUFE2m1Gq0C1MUQQFXVe3911HpYN6+dmG5MLdOv/YHTrxdWAvh11rpPVrEVpnU8j8t3N
 eBng+ijmIA4uxeUUjWlHTDUWXlVqqz3uCt9+GLdy63M42wZGrbGGi2HfgHaT9yUd33yvqX
 iWZEsLyvDYG6OvKgOsjC28mUjF6T0p3g9QrcqO715GTgo6DYSnPQJX/0GU2DVcK+xbOMRk
 84Uuos+tR/n3t1kC6fSx7B3uk/8aTC+x6tHQnZRvDAywbkJyWON6iPxs8Y8ftnZu70Vluj
 HLfxnnWTHhJgBwurjvoDidsGTpIZ3V9PNw+FGO7pOUtkWS0JdPEV3US5ysrFFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZkLUFE2m
Subject: Re: [Buildroot] [PATCH] package/gcc: Fix gcc finale library
 installation
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 6 Nov 2023 11:17:41 +0900
Damien Le Moal <dlemoal@kernel.org> wrote:

> I received a build failure report (again) for the RISC-V Canaan & Sipeed boards
> configs. This patch fixes these build failures.

I need to dig deeper into this. We looked into this issue with Romain,
and I believe our conclusion is that it was unfortunately more complex
than this, because in fact BR2_TOOLCHAIN_HAS_LIBATOMIC is not a fully
accurate representation of whether gcc has libatomic or not.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
