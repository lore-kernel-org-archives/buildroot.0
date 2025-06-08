Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5553C5B552
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 11:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2ACB40A71;
	Sun,  8 Jun 2025 11:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAJih299uiRV; Sun,  8 Jun 2025 11:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B292C4095F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B292C4095F;
	Sun,  8 Jun 2025 11:35:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2CF3C8
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 995E460A8E
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mi7hXZ1r8Qes for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 11:35:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF95160B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF95160B58
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF95160B58
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:35:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C62E4B00572;
 Sun,  8 Jun 2025 13:35:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Jun 2025 13:35:41 +0200
MIME-Version: 1.0
Date: Sun, 08 Jun 2025 13:35:41 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Baruch Siach via buildroot <buildroot@buildroot.org>
In-Reply-To: <87qzzweq56.fsf@dell.be.48ers.dk>
References: <e5b537b303b5e57c90925196afa558503f6f6072.1749201612.git.baruch@tkos.co.il>
 <87qzzweq56.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.11
Message-ID: <7e965164bc9bc29f24d0b3e076ecc347@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749382542;
 bh=kayh2MM4kQZEdj8X65wj6DehaUR3Vh1n1XZmcxKNqJQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KEgHoxKIDG0xSDsXWDsy7UFnCFYYP8X5hgOfHXXpfgaV61BjYjcKMtn7vX/9V2Gkf
 GY3PJmIWDzFFR/EnK+DfxIRS93Uup80cj88jozLQft7OOmiNWu7W4ZZj0NvwzpgXv9
 ForUhs+oAztYz6uu7rns53zZnQ62yxCndNKTv+ZHznE0G3ALbG+9fWi4o2HjPVoXdn
 zPQng4PFabw0TKeOX1frw+C/snGK92Xlzd0uHU682u9NyoGIzDf0W9eoUSq6rKXwRG
 3/LnkFX7cPC+rgdhF6myuLDnXe60stc/0UrE60RAksdlFH/HRxnBd2L4/5AOPxibYW
 XILJXuMWW3o/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KEgHoxKI
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix build with HTTPS-RR
 disabled
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, Baruch,

On 06/06/2025 19:28, Peter Korsgaard wrote:
>>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> 
>>>>>> writes:
> 
>  > Experimental HTTPS-RR support is disabled by default. curl version 
> 8.14
>  > added configure check for double resolver, threaded and c-ares, when
>  > HTTPS-RR is disabled, failing configuration.
> 
>  > Add option to enable HTTPS-RR. When not set, disable the threaded
>  > resolver if c-ares is enabled.
> 
>  > Fixes:
>  > 
> https://autobuild.buildroot.org/results/45e5cd39fddee64f38cf4601877826ff7433a26b/
>  > 
> https://autobuild.buildroot.org/results/9e9c8b28c476544a1a5cb4f62666525225e15aca/
>  > 
> https://autobuild.buildroot.org/results/ea44b98214c3c8d744815e2a866fbf8776291829/
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  >  package/libcurl/Config.in  | 5 +++++
>  >  package/libcurl/libcurl.mk | 9 +++++++++
>  >  2 files changed, 14 insertions(+)
> 
>  > diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
>  > index 0e52bc69c286..3612166f8eac 100644
>  > --- a/package/libcurl/Config.in
>  > +++ b/package/libcurl/Config.in
>  > @@ -36,6 +36,11 @@ config BR2_PACKAGE_LIBCURL_WEBSOCKETS_SUPPORT
>  >  	help
>  >  	  Enable support for websockets.
> 
>  > +config BR2_PACKAGE_LIBCURL_HTTPSRR_SUPPORT
>  > +	bool "HTTPS-RR support"
>  > +	help
>  > +	  Enable support for HTTPS-RR.
>  > +
>  >  config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
>  >  	bool "enable extra protocols and features"
>  >  	default y
>  > diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
>  > index 8501910ac5d2..1c2f6ce919aa 100644
>  > --- a/package/libcurl/libcurl.mk
>  > +++ b/package/libcurl/libcurl.mk
>  > @@ -170,6 +170,15 @@ else
>  >  LIBCURL_CONF_OPTS += --disable-websockets
>  >  endif
> 
>  > +ifeq ($(BR2_PACKAGE_LIBCURL_HTTPSRR_SUPPORT),y)
>  > +LIBCURL_CONF_OPTS += --enable-httpsrr
>  > +else
>  > +LIBCURL_CONF_OPTS += --disable-httpsrr
>  > +ifeq ($(BR2_PACKAGE_C_ARES),y)
>  > +LIBCURL_CONF_OPTS += --disable-threaded-resolver
> 
> We already handle enable/disable threaded resolver above, so it is a 
> bit
> odd to pass both --enable-threaded-resolver AND
> --disable-threaded-resolver.
> 
> Given that the HTTPS-RR support is experimental, maybe a simpler patch
> would be to do:
> 
> # ares cannot be used with the threaded resolver
> ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES),yx)
> LIBCURL_CONF_OPTS += --enable-threaded-resolver
> else
> LIBCURL_CONF_OPTS += --disable-threaded-resolver
> endif

For info, I applied the patch proposed by Peter in:
https://gitlab.com/buildroot.org/buildroot/-/commit/0fce7a9623315cd58750df984b3b9d630eda1700

I marked this one as superseded.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
