Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BABC0218B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 15:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D421160902;
	Tue, 21 Jan 2025 15:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGekCQuMiAtV; Tue, 21 Jan 2025 15:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 797BD607B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 797BD607B8;
	Tue, 21 Jan 2025 15:55:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B36ED959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 912434092B
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDwF3ShesuxT for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 15:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1A6940462
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1A6940462
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1A6940462
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:55:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AFC624000B;
 Tue, 21 Jan 2025 15:55:47 +0000 (UTC)
Date: Tue, 21 Jan 2025 16:55:45 +0100
To: <yann.morin@orange.com>
Cc: <buildroot@buildroot.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20250121165545.0acdc63a@booty>
In-Reply-To: <2d128a40f7b030365fcc63e13dbd48a641d912aa.1737456332.git.yann.morin@orange.com>
References: <2d128a40f7b030365fcc63e13dbd48a641d912aa.1737456332.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737474948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwGu9AGeHqJdWheprEuRX7Oxhnen1YLk7t5N/iWyls4=;
 b=RwSYwTSmimjfbTr3W5N6alRSnibPUTGFYgGVsc9nvwNjg+fkX2XkaEDq7Oe2e6pj8jfkGA
 Dorrm0Z1jbyPgThCquCotK1Eg5lI1k3AhatReCz3R0yWa1TK6B1cdyXOmwbm99AsivqyaI
 Bpnn7VM1nxLlmPWPZVrRf+c1D8AC5kCEdLaU8Zvz7v97pZB7TfD/IDLoGzrHTyzWR1XKYs
 1+LLmBD0wrtxbLjvSQGYARgBUJuv7iyqA7cWAPSBS3Hfyy4MLi9gzim4/nE89TPphlcrxO
 mpFwXe17J43tsqPnuK5zTDWatqZbMnQd5h3GfZuXXUBXHSrQnxogzBg1CbTyVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RwSYwTSm
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: store reall version in
 legal manifest
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Tue, 21 Jan 2025 11:45:32 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The legal manifest currently stores the $(PKG)_VERSION variable.
> However, that variable undergoes a set of changes so that it is
> suitable for creating files and Makefile rules; that new value
> is purely a technical, internal detail of how Buildroot handles
> things.
> 
> In the legal manifest, we need access to the real value for the
> version, as this is what will allow actual references to the
> upstream package. If the version string is mangled, like slashes
> replaced with underscores, this introduces ambiguities as to what
> exactly the version is.
> 
> Change the legal manifest to include the actual, original value as
> was set in the .mk file.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>

Subject line: reall -> real.

It would be nice to shot an actual example in the commit message. I did
a very quick search and couldn't find any package where the problem
happens.

So if there is an upstream package affected I'd list that, otherwise
you can fake an example, as I did to test your patch, e.g.:

  For a package having:

    FOO_VERSION = "12/34"

  the version in the manifest actually is "12_34". With this patch it
  will be "12/34" as expected.

> -	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
> +	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_DL_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
>  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))

Not strictly specific about your patch, but IMO reusing the _DL_VERSION
variable makes code less readable. The _DL_VERSION name suggests it is
for downloading, right? What about renaming it to e.g. _ORIG_VERSION,
and then using _ORIG_VERSION for both the download, the legal manifest,
pkg-stats and whatever use is currently made of _DL_VERSION?

Other than that looks good, and I'm not strict about the _DL_VERSION so:

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
