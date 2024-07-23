Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45E6C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4EFD80B28;
	Tue, 23 Jul 2024 09:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g55l3VAO-E-U; Tue, 23 Jul 2024 09:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95BA380D92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95BA380D92;
	Tue, 23 Jul 2024 09:41:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBD621BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D69B881169
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2r3M8rhoVMf for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE2D480B28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE2D480B28
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE2D480B28
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:41:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 139BB4000F;
 Tue, 23 Jul 2024 09:41:10 +0000 (UTC)
Date: Tue, 23 Jul 2024 11:41:10 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723114110.77c9143a@windsurf>
In-Reply-To: <20240723085645.732060-1-fontaine.fabrice@gmail.com>
References: <20240723085645.732060-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721727671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+nrKcC2n6BCk/gbAz+2gFaAT6ocRPzD7+5gq8uHTwk=;
 b=C5AdECw9kdDps1+dA3/mVgN3xghtW5ZKrMG2yxfJ1lyzi5/9Er7W9g4LD6ihhYxhdW8GTH
 L8zWxoySAwIcIhEu2OekvJi1fKi5G8XlPzS2gmky7tx+7m+7jxd2Jt5PejUYqtr5WMTUhX
 SuzSkeeicEkVzNMafloznb8x2YemUbZelgGIIC73plI5O8pdSmDCqUX1+u+A6i8woDyPPx
 KF58OkTJXoB9UwppuWGKPpA38lKTBR1U+vzGefI93GX/CS3PS6QS3ggAPkCKJjORKYFim7
 aMxIgBVZL4WziOWQhez6dfy6oALJzITpRfxayT4avQ4iHXkW+8nJ99C+HOvaJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C5AdECw9
Subject: Re: [Buildroot] [PATCH 1/1] package/gamin: fix build with gcc >= 14
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

Hello Fabrice,

On Tue, 23 Jul 2024 10:56:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/gamin/0004-fix-build-with-gcc-14.patch b/package/gamin/0004-fix-build-with-gcc-14.patch
> new file mode 100644
> index 0000000000..0380c6f120
> --- /dev/null
> +++ b/package/gamin/0004-fix-build-with-gcc-14.patch
> @@ -0,0 +1,104 @@
> +From 2e37707a94d20d6772862f18902a62b5ff666a27 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 23 Jul 2024 10:43:54 +0200
> +Subject: [PATCH] fix build with gcc >= 14
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks, but this patch lacks an Upstream: tag, so it causes a
check-package warning.

However, I think this stuff is
deprecated. http://www.gnome.org/~veillard/gamin/sources which we download
from, no longer exists, so the download only works because we fallback
on sources.buildroot.net. The project is also
here: https://gitlab.gnome.org/Archive/gamin, but archived, and last commit
was made 12 years ago. I think we can drop the package.

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
