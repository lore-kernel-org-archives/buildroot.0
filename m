Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D27FCD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 14:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 335448415D;
	Fri, 29 May 2026 14:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aASB0gbksxsx; Fri, 29 May 2026 14:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C440783459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780063240;
	bh=5FW0TW36mQzkpdFW9hXjmtEiTFHwaZGp11v3EhbiM2g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dnrqWcR0L1XpCQCehkuP5EErckMBvNOWolqg+S9eQn4QEj/63bx3ftQl0APOTG0i5
	 6czRqLgCiIBA1gRjYvh0i2MX6bpNKzbXYvG7LI4PV0D3haq+EYgijzXjW4ViFlExtu
	 71u5tUt8wo24oSmZ0MzB/3SszFwkGFXew7yeYfWCiljdSqMnbpGUp42KMooLTDLz11
	 dJHT+m1NcOP+QnSVU35DbqUOxyyiDWHsTIg2Zrz1yjJ5P5hQB+u7jyBzgoq/cQ6IXr
	 x+YvM/S788sgKmTxLguM7b77jmHz3z24iajwLpYQqNQ9RhPnM9ews9rryQZYBkmJOL
	 h8gxjkLOY/FmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C440783459;
	Fri, 29 May 2026 14:00:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6358F288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 515AC42122
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DW1K_J1z65yl for <buildroot@buildroot.org>;
 Fri, 29 May 2026 14:00:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EEDA41FD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EEDA41FD4
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EEDA41FD4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:00:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9C49E1A373A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:00:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6178E601FA;
 Fri, 29 May 2026 14:00:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 995EE10888650; 
 Fri, 29 May 2026 16:00:33 +0200 (CEST)
Date: Fri, 29 May 2026 16:00:32 +0200
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Message-ID: <ahmYo01FFmj7ewrC@windsurf>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-11-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424132326.825570-11-jeanmichel.hautbois@yoseli.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780063234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=MgXRCSxg/WhRczrGlNVYLnu23vUWdK3qYdqxo+PGGXw=;
 b=PRm153932lCufH8OZQleMtEJg9QwJolKguvXPdFgldSCWNL+MPfG9EaLKeFNsSLsJtePnw
 nPJTnnYrQ8NUDIdz+p3TIJnZ7QrpWYfzhvbTXLtsSL28MWOwwYEiat8QngCwmC2aegMzFl
 jQVPw3z8DrSjRjCPanXhi1msz9Ce80CQzjNFVY40hUbK/0G8nSYQ8ViuiHFhWzo/hCSSFy
 agW8jHNq+m+MIlPPvp1328eH7lafl8Ssziqs4mMD7J2LOslT+SmCVta2RwxyWOWB1/bEn2
 s9Mzd9BDJrmltz0pDK+mhnfM7Qq12oWkzJa0SQhveJsE3kKjdjUYQ+3va4huQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=PRm15393
Subject: Re: [Buildroot] [PATCH 10/11] package/mawk: create awk symlink on
 install
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

Hello Jean-Michel,

On Fri, Apr 24, 2026 at 03:23:25PM +0200, Jean-Michel Hautbois wrote:
> Many scripts and Makefiles expect 'awk' to be available in PATH.
> When mawk is the only awk implementation installed, create a symlink
> from awk to mawk so that these scripts work without modification.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks for this patch! First of all, it could really be sent
separately from this series, as it is totally independent from the
Coldfire work. This would allow us to identify it as being
independent, and merge it independently (faster!) than the rest of the
Coldfire work that is more complicated.

> +define MAWK_CREATE_SYMLINK
> +	ln -sf mawk $(TARGET_DIR)/usr/bin/awk
> +endef
> +
> +MAWK_POST_INSTALL_TARGET_HOOKS += MAWK_CREATE_SYMLINK

This is good, but you forgot to account for the case where mawk may
not be the only awk implementation selected.

So you need to add:

   $(if $(BR2_PACKAGE_MAWK),mawk) \

to BUSYBOX_DEPENDENCIES in busybox.mk (you'll see a long list of such
dependencies). This ensures that full blown implementations are
installed *before* Busybox, and then when we install Busybox, we are
careful to not overwrite the already installed tools.

Then, you also need to avoid the conflict between gawk and mawk. After
discussing with other maintainers, it seems like our preference is to
have mawk win over gawk, so you should add:

ifeq ($(BR2_PACKAGE_GAWK),y)
MAWK_DEPENDENCIES += gawk
endif

This way, we will be sure that gawk gets built before mawk, ensuring
that mawk wins.

Could you look into this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
