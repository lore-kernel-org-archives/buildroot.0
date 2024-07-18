Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6473FC3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 19:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 213394088C;
	Thu, 18 Jul 2024 19:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEchjzwLMwI2; Thu, 18 Jul 2024 19:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFC53408C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFC53408C3;
	Thu, 18 Jul 2024 19:59:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 110451BF20D
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 19:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F119B81EF3
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 19:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pH_KClb6nEaK for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 19:59:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0E6B81E3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E6B81E3B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0E6B81E3B
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 19:59:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B8A660004;
 Thu, 18 Jul 2024 19:59:27 +0000 (UTC)
Date: Thu, 18 Jul 2024 21:59:26 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240718215926.4399a7bc@windsurf>
In-Reply-To: <20240718121955.10918-1-thomas@devoogdt.com>
References: <20240718121955.10918-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721332768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQNE32YMici8ARvA+gE+NsVjQkxY7gXMEMp9tk5MK+o=;
 b=fjeo8biBWP6xNR9ELt+a7VunWAufDcvBGYbbKTYHjo/mIZTxCgHSt+oIvCtWMhKREwwDYB
 8r3f40CZSIu3l1A4kf7pz9a5sTRVMD2tzJ7n93o53AecVrxIGvP88h+rlOcFPYtvLlxg+W
 Vc654QaKhKafxMgGlnkQdfszBQiJP7yFgyNbJckS0FtdzRvB5Jtx0xJRjha2P9PslPKgjs
 WS/kwza91bNIsf3GEVjlw8BpIDfrgYoF6/fzsgau6wOI4DkDDPy2kR45OFWRVW1jByhtp+
 rqPoTSQYYLrKcYE75VDPTLQN51ZshaMbRLcgF/KlBDWUYCsY8yVQEjjFKF+Dgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fjeo8biB
Subject: Re: [Buildroot] [PATCH v1] package/cairo: fix compilation on
 toolchains without c++ support
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
Cc: eric.le.bihan.dev@free.fr, yann.morin.1998@free.fr,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org,
 aperez@igalia.com, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for the investigation, I had come to the same conclusion earlier
today, but you were faster than me at cooking the patch. A couple of
comments below, though, for your future contributions.

On Thu, 18 Jul 2024 12:19:55 +0000
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 

When you submit a fix, you should always explain since when the
regression got introduced. Indeed, Peter Korsgaard reviews all commits
made on master, and has to decide which commits should be backported to
our 2024.02.x maintenance branch. So we need to know if this fix is
needed on 2024.02.x or not. In this, it is not needed. So I have added
this in the commit message:

    This issue was occurring since the conversion of cairo to
    meson-package in commit
    1fa58814c09a71444f961b61a9a2c399b9163fc2 ("package/cairo: move to the
    meson build system")

> Fixes:
>  - https://lore.kernel.org/buildroot/20240717200926.1a7db2a1@windsurf/

Here, we want a reference to an autobuilder failure, so:

    Fixes:
    
      http://autobuild.buildroot.net/results/98b62ab7ed3092f9f9085f723baf7d6267451e5c/
    

> diff --git a/package/cairo/0003-meson-only-require-cpp-for-windows.patch b/package/cairo/0003-meson-only-require-cpp-for-windows.patch
> new file mode 100644
> index 0000000000..9774f29f8c
> --- /dev/null
> +++ b/package/cairo/0003-meson-only-require-cpp-for-windows.patch
> @@ -0,0 +1,38 @@
> +From e93ef3feb69994e3aa4e0ab66ccd66139b097e49 Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> +Date: Thu, 18 Jul 2024 12:16:51 +0200
> +Subject: [PATCH] meson: only require cpp for windows
> +
> +Allow to compile meson without c++ toolchain.

No, it's cairo that you allow to build without C++.

> +Fixes:
> + - https://lore.kernel.org/buildroot/20240717200926.1a7db2a1@windsurf/

We also recommend a reference to an autobuilder failure, or even better
as this patch goes upstream (which doesn't care about Buildroot),
directly have the error message copy/pasted.

I've applied with those details fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
