Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97940C52D7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D9AD80C61;
	Mon, 12 Aug 2024 20:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aV01vfilqof; Mon, 12 Aug 2024 20:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7385880C46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7385880C46;
	Mon, 12 Aug 2024 20:54:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEF4D1BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB8DB400B8
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qs1L4rfp-jkX for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 679B5400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 679B5400B5
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 679B5400B5
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:54:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C8AFC0002;
 Mon, 12 Aug 2024 20:54:44 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:54:42 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20240812225442.7f1035d7@windsurf>
In-Reply-To: <20240810215257.480823-1-thomas.petazzoni@bootlin.com>
References: <20240810215257.480823-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723496085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EoJuw4pLH5O2lKrAJ01/Y8YwH/khzi2eam57bls/uMQ=;
 b=jydJwvUJEXnIBH36R7VW27PZyXfK3wHgcZQO2ptfLRx1g/to6W3sR2CDvNwNlI2D9WCsWV
 cx0+vMcCa/CSb9mvpXrcYn3pOWbP1faHvmB0ZVObywubV9Tw+bWBCQ/qovkzYfqv+wHKrU
 LRV/LNmQCj8uVOR/clHkUpVlGAPSVnOuQdJs7pztgkaz6W/kuJuakFS6HgHRq/L5Oy6USJ
 9L6wO35y7hi3f3/t8PuQKTmrbxR/SuHhGS23SOmNu4iduKIWobuwtZ3nDTVHdVSdddpcEA
 5SkuIZVFqPaKihPlUGyPfWdcWP21Xa82ezaFZVkYPYBEQytN9SkpQiEOIvDm0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jydJwvUJ
Subject: Re: [Buildroot] [PATCH v2 next] package/{glibc,
 localdef}: bump to version 2.40
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Aug 2024 23:52:56 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> This commit bumps glibc to version 2.40. See the release notes at:
> 
> https://sourceware.org/pipermail/libc-alpha/2024-July/158467.html
> 
> The patches against localedef are refreshed. The patch 0003 requires a
> small change: the macro to tweak is no longer _ISOC2K_SOURCE, but
> _ISOC23_SOURCE.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes since v1:
> - Refreshed localedef patches to apply on glibc 2.40, thanks to Bernd
>   for the review.
> ---
>  package/glibc/glibc.hash                      |  2 +-
>  package/glibc/glibc.mk                        |  2 +-
>  ...ACK-only-build-and-install-localedef.patch | 30 +++++++++----------
>  ...y-on-GCC-to-4.8-and-binutils-to-2.24.patch | 16 +++++-----
>  ..._SOURCE-undefined-to-build-localede.patch} | 17 ++++++-----
>  package/localedef/localedef.mk                |  2 +-
>  6 files changed, 36 insertions(+), 33 deletions(-)
>  rename package/localedef/{0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch => 0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch} (63%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
