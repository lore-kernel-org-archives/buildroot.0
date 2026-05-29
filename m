Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BEFCD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A35841FC3;
	Fri, 29 May 2026 13:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYxQZ35iIIaI; Fri, 29 May 2026 13:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5DD241EC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780061868;
	bh=Jt6ukfLWd+JzNNLTct7QA74FcMiUwmE2gEttoe9NADU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hbjDqiCoI23NWTm/bxCveHA3aSXDdcAyfG+PGxWIq0oRtK9pPE++Ghak3CA2TaNbf
	 ijDXZUA+9S/onlHu1ifuas4Q8bTYz+bI80QuzGtJRjkd7ji5NaWknpZIks1RoXOATf
	 FQDVCobRvih0g1avLo5MUknUPssMIDaAsQVM6uN84QSgy3a5A7cU9BacGCs7RZiV4Z
	 THw/npQl3X0Tu0p+Vmc2BV0mmii+V50qRju5tUpR4RTOP3Se6PBEO/ITkUda5PFyWD
	 NdWWDFhqEkN8WDfMQX0Vo+pMLJ6F4bOp7eZXceObbaZq/pUktg6nRFFyJW5KTEYLd5
	 3dfCoanyPsdMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5DD241EC3;
	Fri, 29 May 2026 13:37:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C89F288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74F2861405
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDCtE_hqibVK for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:37:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 796C7613D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 796C7613D6
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 796C7613D6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:37:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AA4EAC6245D;
 Fri, 29 May 2026 13:37:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E4B20601FA;
 Fri, 29 May 2026 13:37:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B76AF10888644; 
 Fri, 29 May 2026 15:37:40 +0200 (CEST)
Date: Fri, 29 May 2026 15:37:39 +0200
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Message-ID: <ahmWPGlMHd0ZUKzs@windsurf>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-10-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424132326.825570-10-jeanmichel.hautbois@yoseli.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780061862; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=VTUKz9NDiqyjZenGhC8zqQobPJe7hIqo3ty9/pwLM+c=;
 b=1SPY3BVOIadzzTduuHmSvKMvTro2pNMR0UPT+nH7Kn049VmD+sJmbX9KaHMp83efv/NO1X
 GWtn/twgtQxmmX4qF9XghtaWrIpg4K4o2VWWvyeRU5oxo0Kc747lMLM1d26zQynPkf240t
 VfipKbXL3v3ZQQqc+XFszAw9hn54GIuzfW7xMztCBpSmipKa77PV1G+Ih4kvIEVL3ZE9Wt
 WR/JzEcWNWKEpk5n/vhsJ8aGYnN2iuxilC/tJRwc7B6N35gEnatjeJM5DBwS3KRDtNqGPZ
 RAhftRZrI/6TOKOMWCcZf7luhImCtELvN77SwYn67um8Mi4H1zYNPANwgigU4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1SPY3BVO
Subject: Re: [Buildroot] [PATCH 09/11] package/nginx: add m68k ColdFire TLS
 support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Apr 24, 2026 at 03:23:24PM +0200, Jean-Michel Hautbois wrote:
> On m68k ColdFire, nginx with OpenSSL requires reduced optimization
> (-O1) and -fno-strict-aliasing to avoid aliasing violations in the
> OpenSSL/nginx interaction that cause segfaults in HTTPS handling.
> 
> Also enforce strict alignment (-mstrict-align) and explicitly link
> against the system crypto libraries including libatomic.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  package/nginx/nginx.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index 41490caee2..35d53c3ec1 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -87,6 +87,12 @@ else
>  NGINX_CONF_OPTS += --without-pcre
>  endif
>  
> +ifeq ($(BR2_m68k_cf),y)
> +NGINX_CFLAGS += -O1 -fno-strict-aliasing -mstrict-align
> +NGINX_CONF_ENV += LIBS="-lssl -lcrypto -lz -ldl -lpcre"
> +NGINX_CONF_OPTS += --with-ld-opt="-L$(STAGING_DIR)/usr/lib -lssl -lcrypto -lpcre2-8 -latomic -lz -ldl -lpthread"

This is clearly very, very hacky, and will not fly. Yes, it probably
solves your immediate problem, but if we were solving all problems
this way, Buildroot would be just a pile of hacks (which hopefully it
isn't at the moment!).

All the library stuff should not be needed. For the -O1, is it to
workaround a gcc bug? Was it reported upstream?

The strict aliasing stuff, why is it related to building on Coldfire?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
