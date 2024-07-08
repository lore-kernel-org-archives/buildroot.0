Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9569C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 468FF60AA5;
	Mon,  8 Jul 2024 20:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yP_JQwLZLmIN; Mon,  8 Jul 2024 20:22:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BC2160AEF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BC2160AEF;
	Mon,  8 Jul 2024 20:22:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A859A1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A31E760903
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_MbFPq8yHBM for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 613C360826
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 613C360826
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 613C360826
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99B691BF20B;
 Mon,  8 Jul 2024 20:22:16 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:21:46 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222146.08701e2e@windsurf>
In-Reply-To: <20240707120650.4036307-1-dario.binacchi@amarulasolutions.com>
References: <20240707120650.4036307-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPjgTnveLJqQym0s+fSm5oLW7OT7tI4q0Dr7M/MqJGA=;
 b=I5NnkFTgto1PK+radMvUtLaAdLP7DepTOeOXv18HjpddCFs5QNRI9jPzztyKHoqORQyvuw
 TkF2+jxPssdYCucI+NDCuc+le3TGl+VXPHS1aWGz3u2xg6fPCIQqXDFT86MkqIytg+5ks5
 m7mfJzJeuhRFvBs8T8BXdUZRYDzQHvOPys5/FHBQlOmSwLy1rFNm1JkJ7ZiEAAXOBxcrai
 3t0+IdYTwY1/tZANpt4PXQJJyKJ2BOcGsIZmZ5HbXewImrGF1Q6BGtdv9nTWM4SYuQGH06
 2lGJPNZOezL4ZvJltQ8nD8WhQ/YHxiK0SGBsm60vfQBrU6mGydWRvRAx8L00lw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I5NnkFTg
Subject: Re: [Buildroot] [PATCH 1/1] package/sane-backends: update the
 patches to be applied with fuzz 0
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jul 2024 14:06:50 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, sane-backends fails to build with output:
> 
>     Applying 0001-sane_backend-add-missing-config.h.patch using patch:
>     patching file include/sane/sanei_backend.h
>     Hunk #1 FAILED at 8.
>     1 out of 1 hunk FAILED -- saving rejects to file include/sane/sanei_backend.h.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../0001-sane_backend-add-missing-config.h.patch            | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

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
