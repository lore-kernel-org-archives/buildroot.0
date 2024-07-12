Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D57C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24DA840723;
	Fri, 12 Jul 2024 14:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8r_arj68S0ZI; Fri, 12 Jul 2024 14:49:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1738B41714
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1738B41714;
	Fri, 12 Jul 2024 14:49:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 305711BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DB28405B9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-zo6TpEZl80 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:49:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8B5C4043E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8B5C4043E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8B5C4043E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:49:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBAA260005;
 Fri, 12 Jul 2024 14:49:00 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:48:59 +0200
To: Athaariq Ardhiansyah <foss@athaariq.my.id>
Message-ID: <20240712164859.45cadf53@windsurf>
In-Reply-To: <20240603230940.51746-1-foss@athaariq.my.id>
References: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
 <20240603230940.51746-1-foss@athaariq.my.id>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADAv2/p2TiDgbQ0wVFcbn0627iHEtZLdW8sVd/FpT6I=;
 b=kMeTCqepEMrkoSWGbsvb6Cqzu7OJcPYxU5t9gvYQMZKcOFrfWY3swIhFSAtBe3d4yliUcs
 wd+ydpSXyvD4KuFpLsMg2ULrt1rhy/B4Nuo3qJHVYvBUwmGsPcWpS0K2ch0sNV2ErAdReG
 9+S4XwQ0ve0j353kzHLCpSlcFy+fY020FhYHSrhfqvT7Dx/MuCyQ0QtrZ7EyaTSh99Cpl+
 pgPVYxUglSKAiITCBYpwQL6EOwLT7bgcvPF85dg5Aa7te4Dpzv0QSO+4plEbtYLVBoslIV
 nZ1pXmisCtGuYjx9tHnXygWHQMf5PQMnd89J378iJHnbJQOxJe+g87eF3oYnlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kMeTCqep
Subject: Re: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version
 to v1.20240529
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>, Fiona Klute <fiona.klute@gmx.de>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  4 Jun 2024 06:09:34 +0700
Athaariq Ardhiansyah <foss@athaariq.my.id> wrote:

> Latest RPi firmware already provided support for Raspberry Pi 5.
> 
> Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
> 
> ---
> Changes v1 -> v2:
>   - Fix missing description due to terminal issue
> ---
>  package/rpi-firmware/Config.in         | 5 +++++
>  package/rpi-firmware/rpi-firmware.hash | 2 +-
>  package/rpi-firmware/rpi-firmware.mk   | 2 +-
>  3 files changed, 7 insertions(+), 2 deletions(-)

Considering the comments received, I have marked PATCH 1/3 and 3/3 as
Changes Requested in our patch tracking system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
