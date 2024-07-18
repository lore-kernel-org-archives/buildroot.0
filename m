Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09DBC3DA63
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 17:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C698408E6;
	Thu, 18 Jul 2024 17:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1SGuWuEevHb; Thu, 18 Jul 2024 17:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B22C408D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B22C408D6;
	Thu, 18 Jul 2024 17:14:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0121BF334
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 17:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 991E14042F
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 17:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xw9U8PnEhsw6 for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 17:13:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E0CA40396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E0CA40396
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E0CA40396
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 17:13:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 460DB60004;
 Thu, 18 Jul 2024 17:13:56 +0000 (UTC)
Date: Thu, 18 Jul 2024 19:13:55 +0200
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20240718191355.34e1a05e@booty>
In-Reply-To: <20240718-boot-uboot-env-select-v1-1-e6c778e814d8@collins.com>
References: <20240718-boot-uboot-env-select-v1-1-e6c778e814d8@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721322836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cY/ydp8Bxbm51R/Ryu5r5nPdjGDiaTeVL3pBw31DMo8=;
 b=Q40FxBcazv0G8eIWdxa15Yh6WmwXYubkQ1OjkLNvwBldKcUbDAltauscu37jS91ZinLFdf
 IxQy/Vd55FmW+yjqZ+Ad4xqQZIdNJLSOAmqSRsIIM2bo7ZMPXLN1tdw2PI60+iSK477BpK
 7op+rnMlVz9wfWlFCqD8IfUnlYS7GhrJwzrofZHEZPjTGgZwcMhcBlAUXIYuJ9tYvQRL4/
 a+xCxPAanmMcY01xv72rkyXKCBUYLCe17FWDpNAoWeH5OiQypJhRGjYZS2tJfoaKcdDW6/
 EuG2WR/gU4ncZSvApiC/k+0MJVgfH4LNrMwtfJzyaBLLuYwyUcbDkK9ECDbNtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q40FxBca
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix Kconfig warning for
 DEFAULT_ENV_FILE
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon, Arnout,

On Thu, 18 Jul 2024 15:45:45 +0000
Brandon Maier <brandon.maier@collins.com> wrote:

> The following warning occurs from commit "boot/uboot: allow taking the
> entire default environment from a text file".
> 
>   boot/uboot/Config.in:141:warning: config symbol
>   'BR2_TARGET_UBOOT_DEFAULT_ENV_FILE' uses select, but is not bool or
>   tristate

Hum, apologies, didn't notice this, at least when working on v2 (see
below).

> Add a 'bool' config so we can enable dependencies.

That's basically what I did in v1 [0], possibly for this same reason,
but I'm afraid I don't remember exactly.

Then in his review Arnout suggested to have only a string option, and I
did not recall any good reason to not do so, and so v2 came without the
bool.

> In addition, the DEFAULT_ENV_FILE works by setting Kconfig options,
> therefore we also need to depend on
> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG.

Arnout, do you think the issues reported by Brandon can be fixed while
keeping a single string option?

If they can't, I think it's worth resurrecting the help text from the
two options as I had written them initially in [0]. Otherwise one would
have a bool without help text, and woudl have to enable it just to make
the string option (with help text) visible. Kinda chicken-egg.

[0]
https://lore.kernel.org/buildroot/20240617-uboot-default-env-v1-1-9ac88f0e1789@bootlin.com/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
