Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D526DCD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C7254117C;
	Mon,  8 Apr 2024 21:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGZFWgw4bQSM; Mon,  8 Apr 2024 21:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADC6F41488
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADC6F41488;
	Mon,  8 Apr 2024 21:09:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 568F51BF2A6
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E0D818AC
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RHc58OmoXEl for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:09:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F5D781469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F5D781469
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F5D781469
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:09:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C02AFF804;
 Mon,  8 Apr 2024 21:09:37 +0000 (UTC)
Date: Mon, 8 Apr 2024 23:09:35 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240408230935.170ec78e@windsurf>
In-Reply-To: <20240404195346.1434611-1-fontaine.fabrice@gmail.com>
References: <20240404195346.1434611-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712610577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qEcQWlH07E9hE1aIl1OyBNabF4db6PKLb9Wf017ZO8=;
 b=MFJuWmLBN1Nj45+y0gOiqPiev2j9sUrSlmB48SYt383CSMhBpxFavCWzq4k75tTs9vCg+t
 +aLOJz6sTfwRXsBvFcgp1DrJ4MJdc2JAqaatIS84wSx12fU5NLp+f+l3Z6cNF3Yr4SUCFx
 ltJQ6i9FgO+wfRtUXw6IkW7dugjKZVpwTVg9W2HiDPLYCu9fIZaDombSUwtLNt8LceTTXI
 UrXe7QzPyu0Vozc9eMDUgHGVJhppQjjX2HwmCVyhrCuOfjh502vOHjPIWy7hG9NzMm6bKl
 jEoJL2zrwZRN04R7+g2G2PJLhKY0oxFRYp1YOUqyfMskSZNf1GHaKJgZ5+HPVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MFJuWmLB
Subject: Re: [Buildroot] [PATCH 1/1] package/nut: bump to version 2.8.2
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  4 Apr 2024 21:53:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patches (already in version) and so also drop autoreconf
> 
> https://github.com/networkupstools/nut/releases/tag/v2.8.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...iler_family.m4-fix-cross-compilation.patch |  55 ---------
>  ...hon.m4-allow-overriding-of-PYTHON-2-.patch | 106 ------------------
>  package/nut/nut.hash                          |   4 +-
>  package/nut/nut.mk                            |   5 +-
>  4 files changed, 4 insertions(+), 166 deletions(-)
>  delete mode 100644 package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch
>  delete mode 100644 package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch

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
