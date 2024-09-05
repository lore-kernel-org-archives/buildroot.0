Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027B8CE7A89
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A955640114;
	Thu,  5 Sep 2024 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZZzJpo6Vv6m; Thu,  5 Sep 2024 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53F9640391
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53F9640391;
	Thu,  5 Sep 2024 19:35:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AF1F1BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78AD160AD2
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xz4o35uJMAlC for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:35:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE87B60AAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE87B60AAE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE87B60AAE
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:35:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1714240004;
 Thu,  5 Sep 2024 19:35:23 +0000 (UTC)
Date: Thu, 5 Sep 2024 21:35:22 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240905213522.2a476624@windsurf>
In-Reply-To: <20240904205354.504964-1-yann.morin.1998@free.fr>
References: <20240904205354.504964-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725564924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nT+N4dv2InbVggM9FWaWXkkCCJr95HyNYmPnFcjQdfs=;
 b=LV56+MxTwSE6xxSTT6I/lbYcdhaknWBOAfULV8n+Nwco6V9QWq8Jvm+LhYphhEdI6mdrTQ
 RlTGgVDy0z41kRAqQQV+KYakLxBDK4MzQsM9121ftZ5k0JZn6fsuGaPbgAsBnBJ1WFgxPN
 yIXsZ7IMmB5Eu3l8GMI9fGJU/M++aOnTcz8jA4AdRjghPq66n6xRNMDAo1q69BRHHZQyBo
 BG9yow8onGgVurPZ3Gn9seHffvbwUMMb0fUMGK7c1kSBOVnBz2MeZFv+3UYVM7Ki1WDy8S
 kq/9e/AZfMc8G+ICFHv+lNy0bnlaKQxEzluaZSL7lH7b60vCBg/jXeOQkcdz0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LV56+MxT
Subject: Re: [Buildroot] [PATCH v3] docs/manual: use space-separated list
 for BR2_EXTERNAL
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Brandon Maier <Brandon.Maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Sep 2024 22:53:54 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Specifying a list of br2-external trees is poorly documented, and the
> only example uses a colon to separate the br2-external paths.
> 
> Adding the support for colon-separated list is the biggest mistake that
> was made when introducing support for multiple br2-external [0]. Indeed,
> both space and colon can be used to separate entries in the list, and it
> is also possible to mix the two. However, internally, the list is stored
> as a space-separated list, and all the code will split on spaces.
> 
> So, using colons is odd.
> 
> Change the documentation to only mention using a space-separated list.
> 
> Of course, for backward compatibility, we keep the code as-is to accept
> a colon-separated list, but we just do not advertise it.
> 
> [0] in 20cd49738781 core: add support for multiple br2-external trees
> 
> Reported-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> Reported-by: Brandon Maier <Brandon.Maier@collins.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ---
> Note: support/scripts/br2-external has shellcheck issues; this commit
> does not try to address those on purpose, as it only adds a comment.

I'm afraid I'm personally finding that this not going in the right
direction. I didn't follow the discussions on v1 and v2, but on my
side, I would very, very, very much prefer to use colon as a separator
in the BR2_EXTERNAL variable. The PATH variable is like this, it works
well, and I believe the principle of least surprise should encourage us
to follow that and use colon as a separator.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
