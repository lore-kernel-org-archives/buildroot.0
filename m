Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EF1C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B70DF407A3;
	Mon, 13 May 2024 21:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id quS3zoOMFTPP; Mon, 13 May 2024 21:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74A82407FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74A82407FA;
	Mon, 13 May 2024 21:19:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 183E81BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05508404B4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twhAkPYYs3_0 for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:19:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1935403D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1935403D6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1935403D6
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:19:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4718E0002;
 Mon, 13 May 2024 21:19:43 +0000 (UTC)
Date: Mon, 13 May 2024 23:19:42 +0200
To: Andreas Hilse via buildroot <buildroot@buildroot.org>
Message-ID: <20240513231942.2dd93919@windsurf>
In-Reply-To: <20240327140125.154985-1-andreas.hilse@gmail.com>
References: <20240327140125.154985-1-andreas.hilse@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715635183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEVrvyEY7XPXpuplFggdhkywJEtpuEVKi98OT0BMbjs=;
 b=QbuccZ8bN15HfW7u/IFw/7EXFmN7nkqhj+zyUcii8kWjdE3Y2EfY5AHmElj9Rc20bOC0oR
 mSIRwLKp1JZ6rWiEKNkXslnlOcIl5Z5fwUm2mZs9T+vHY9pILFbqceeiEBD3f08/qVyw1O
 YL8OGbju4CusoGzvcdI9GFUJFcTSLJmfLnNoeTD5QpViHm95JLV5YpYi5td7EV4yZpcou2
 E/CsNTMFSxraNbZV9t089aRu5ctpFB0kAsSbwoD9rRIj0RUQxNkpjxK/gDFB3sMW+6G04u
 nnmySXnn+M11Jv+Er3ajSpu0W+iXu5dYD2RGwMdG8BlWNE5fBON0CBC/GMPBnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QbuccZ8b
Subject: Re: [Buildroot] [PATCH] linux-pam: add patch for spurious password
 expires in 0 days warning
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
Cc: Andreas Hilse <andreas.hilse@gmail.com>,
 Andreas Hilse <andreas.hilse@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Wed, 27 Mar 2024 15:01:25 +0100
Andreas Hilse via buildroot <buildroot@buildroot.org> wrote:

> Buildroot 2024.02 brings updated linux-pam 1.6.0 package which has a
> regression, that warns users about their password expiring in 0 days
> when logging in, even with password expiration not being active.
> There is no newer version released yet.
> Patch is working as intended, tested by me.
> 
> Patch taken from linux-pam PR: https://github.com/linux-pam/linux-pam/pull/744

The patch is now upstream, at
https://github.com/linux-pam/linux-pam/commit/470b5bdd8fd29d6b35e3a80f9a57bdd4b2438200

Could you adjust the commit title to:

	package/linux-pam: add patch for spurious password expires in 0 days warning

> diff --git a/package/linux-pam/0002-do-not-warn-if-password-aging.patch b/package/linux-pam/0002-do-not-warn-if-password-aging.patch
> new file mode 100644
> index 0000000000..7df83bf058
> --- /dev/null
> +++ b/package/linux-pam/0002-do-not-warn-if-password-aging.patch
> @@ -0,0 +1,27 @@
> +From 470b5bdd8fd29d6b35e3a80f9a57bdd4b2438200 Mon Sep 17 00:00:00 2001
> +From: Tobias Stoeckmann <tobias@stoeckmann.org>
> +Date: Fri, 19 Jan 2024 10:09:00 +0100
> +Subject: [PATCH] pam_unix: do not warn if password aging is disabled
> +
> +Later checks will print a warning if daysleft is 0. If password
> +aging is disabled, leave daysleft at -1.
> +
> +Resolves: https://github.com/linux-pam/linux-pam/issues/743
> +Fixes: 9ebc14085a3b ("pam_unix: allow disabled password aging")
> +Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>

and here, add:

Upstream: https://github.com/linux-pam/linux-pam/commit/470b5bdd8fd29d6b35e3a80f9a57bdd4b2438200

followed by your Signed-off-by line ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
