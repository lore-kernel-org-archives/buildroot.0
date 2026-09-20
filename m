Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA12C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 11:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93A1880F85;
	Sun, 20 Sep 2026 11:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TJIm1dpoWsk; Sun, 20 Sep 2026 11:40:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D0D7980F7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789904403;
	b=YvXnQ/Z8NuQOlGn49P4I+o1jdHoM17y52yAGZL1iAZjTfsBIgO51gu8+/jzK2T5Ren96
	 UiYC6nV1v37nREUvfnU8ii6rPqgWa3g05Wo8aky86gFR0xy9uQClPZdACpazSXT1nYXzF
	 /opq3s7rMj2zw6oEZKkPnsRlRHpyv9k1nsjyrlk9o1iMS/5E9Q5raofjthwHEdgfX392d
	 3uMRdoXP0IUeG1kFGvyD207kh5XNA5CNKFrTn96apb2XdGeMMz5oezFTRc+7+YstF5KLN
	 RW00PcncRMQ73Kv3wpA95xuRvxR1mKyfVQXNPE6Hn2ntVAKj6HBb6XqINgFDWKfan5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789904403;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+z20S5kIHzxv5gCqpMfBv2b/4DFTOFwfe+bNdnZ7TOw=;
	b=I8y1A9AH1K29zoLrm55ZFgCtDkvEcu/l4PJ6X5I1QkHDJo2IRubFR5JA/Sb88g108pfr
	 901x6Satz7pTvwuR/kl3LZx2PwYg8ZX/oU3j28tzXA9symUqRAOV12N2h/rwrqyLPUHbF
	 LVvdEqAo2VeWdNziJqCW8OiUB7y9TVoe+beFBCKkSzBzZLqmFGUHEOCUpQBsvgp6hTC1c
	 YV2T73Lx9PvFiLRmnGw3pd9DZNsp2XO7ootmhX7bO1/LACDGWDVLvwmVycMgc32s4MBiw
	 YjsgtN08iypjNd8p76t0/KlyVTYtZ8vEcywkCfbHFcnCCVjCUNWVPXncR5K7Uw4qjcA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789904403;
	bh=+z20S5kIHzxv5gCqpMfBv2b/4DFTOFwfe+bNdnZ7TOw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hbOXO0KDHBjcsSik7zQ89jOcG7EN8wCe4TqMjFPWOAgNFbFoAb0yihdVXX62rFOzD
	 J56hDjeYCDlmtKEonDG7RFMJdy3s4Aw3PdwDeHqgcLkD3MP5+9Qrgpg4+CVb0Gcuts
	 jSZ0wnPWGZOT8/hdEZxGBGVzuVTl/DINOmfb7Yur5h+jbc49hw1gQetcF5aXbZpQsp
	 D7b6FN6FcXvauM4GV+iiNEexNvuwZ3HUpUdgfk0hsy5HM0eQus7yA5Vt9o5FNhhLBt
	 cKY/gUzy50U2PWiezMPWWdiYfC6+Fm0R/nhc1yfOuxYSdOAuqsObXr+sn3IgsGIWa0
	 WNz6cD+B1wH1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0D7980F7D;
	Sun, 20 Sep 2026 11:40:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87D35392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 796D440A49
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuKyeNsoTaLq for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 11:40:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0B85D40A39
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789904401;
 b=pVcJh1MBOnQoCeiOiydCmg295fYPj1PEZOLSW48ibgmxsOdIZXgoRki9UnYkuPuAFUwA
 0tPfpJT6vOiLT/BVV3+o1nra7lBuwWHjiE0MCFQAp4YKqUZeN2jAZo1uomN7QBnfiy987
 6jpyrU/D0nJ/VJwgP/1UrJ6kFGv2HhMrXSYkCo18JXSqSQLIkObIju+EzW9bX9SDoOsL5
 OJVJOdSSLONEBDERHc5D2ALwDaziW6fuwZD9FFJXPkeY6sp1NdsDUgi+V/9EhwhBLvJze
 7qSOmw02kWN8rrJg5AWIkkwlOFPZ2zhCknR5XHpAx1JkJdJGmAhRNFgw0ROiSlpH82g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789904401;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=GhCWWX7kCvmXD1SNX+vUUdUjx8Xa6nQzA1rLE+QE3l4=;
 b=Hb1pwdaBFDMm2rYNeilEdyWcrbHPQbDp2kAHgT5lXs4P4ZzDnPabP2ZAGNRy0or0uSNf
 1WwtkVfPsXq5pE6sNlixP6voUUFRJEhLPPLYPhkHAS0tSeAWlBU9QwYrYxjjBxdr6PJjR
 spQMO/mccG9XOfiPurF9RhCCJT2uE3nGPShB4igv/feIm5Hswa4SFh1AJIhqziI92//uu
 C9qrhR2nRWVNmlpl1WYUr7E4TZ5PZE7E/phe/N45fqFhHaGLyX8uq1BQdQZb+un+7bauC
 xm0hOrddxhCcEjszbAR9Iu3GW/Ztl57dbbRtZLrV3LTB3J1WrwQDKuq+eqwbbD1+/UA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="m6TwV/v4"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B85D40A39
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:39:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D116F1A0969;
 Sun, 20 Sep 2026 11:39:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 952A4604C9;
 Sun, 20 Sep 2026 11:39:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E48310329079; 
 Sun, 20 Sep 2026 13:39:45 +0200 (CEST)
Date: Sun, 20 Sep 2026 13:39:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>, 
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <aq_F0nh1ggPgxmXN@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-47-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-47-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 46/77] package/libest: Fix build with
 OpenSSL 4.0.0
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

On Sat, Sep 19, 2026 at 05:58:11PM +0200, Bernd Kuhls wrote:
> + #ifdef  __cplusplus
> + extern "C" {
> +@@ -829,6 +832,13 @@ LIBEST_API EST_ERROR est_disable_performance_timers(EST_CTX *ctx);
> +          ENGINE_load_builtin_engines(); \
> +          SSL_library_init(); \
> +          SSL_load_error_strings(); } while (0)
> ++#elif OPENSSL_VERSION_NUMBER >= 0x40000000L
> ++#define est_apps_startup()               \
> ++    do { ERR_load_crypto_strings();      \
> ++         OpenSSL_add_all_algorithms();   \
> ++         OSSL_PROVIDER_load(NULL, "default"); \
> ++         SSL_library_init();             \
> ++         SSL_load_error_strings(); } while (0)
> + #else

Looking at this, I wasn't sure how it would still build with OpenSSL
3.x with engines disabled as done by:

> diff --git a/package/libest/Config.in b/package/libest/Config.in
> index 3a0328c2f8..bd5f40afae 100644
> --- a/package/libest/Config.in
> +++ b/package/libest/Config.in
> @@ -5,7 +5,6 @@ config BR2_PACKAGE_LIBEST
>  	bool "libest"
>  	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
>  	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
> -	select BR2_PACKAGE_LIBOPENSSL_ENGINES

but it does build fine, so: applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
