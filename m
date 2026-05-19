Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16C7CD4851
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 03:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20EE1404EC;
	Tue, 19 May 2026 03:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8o7tcvuIcLDM; Tue, 19 May 2026 03:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25F0240497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779160810;
	bh=7C1oD0ApXJJUE79d4V7iWEpklBy+fK+uen7x7fkyO00=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mYBPvLSmkoCqkS2N6gEFjebDNJXkTaVKUfmqWmRE27XGymu+aKfqzMcAvDbIitF+x
	 R4Bj0duCKBRDKne5Tu0yW3PsDc5oYsWNu8g2nO+93n+96AFi8fsM/P26L3YomR5w5z
	 eDCzku+Upq7EHrTWZFI0/utgnj1S0RiY/VAAsj0b074SQ7pY3pgnZZVS22VVdqEzIz
	 R/p4iUAhM7dmdvWY5AqRgLZcpNdyB9EYOAJgjuu706WrYAW7HSvsQjI0esQ7Tmb0Xz
	 hORO5Zia3lN5Mf1C22qmRUgtleWwyRGe+gb/blU3EwKWZHNLjQUhLfya5mi4PRBroj
	 3n1JLSRhEqmsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F0240497;
	Tue, 19 May 2026 03:20:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDEAC282
 for <buildroot@buildroot.org>; Tue, 19 May 2026 03:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A34CB40497
 for <buildroot@buildroot.org>; Tue, 19 May 2026 03:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsV8V8ep8R9W for <buildroot@buildroot.org>;
 Tue, 19 May 2026 03:20:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94C014048D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C014048D
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94C014048D
 for <buildroot@buildroot.org>; Tue, 19 May 2026 03:20:04 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 59E1C4402AF;
 Tue, 19 May 2026 06:19:26 +0300 (IDT)
To: Andreas Mohr via buildroot <buildroot@buildroot.org>
Cc: Andreas Mohr <and@gmx.li>,  Pascal de Bruijn <p.debruijn@unilogic.nl>
In-Reply-To: <20260518220229.17936-1-and@gmx.li> (Andreas Mohr via buildroot's
 message of "Mon, 18 May 2026 22:02:28 +0000")
References: <20260518220229.17936-1-and@gmx.li>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 19 May 2026 06:20:00 +0300
Message-ID: <87lddgt7a7.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1779160766;
 bh=qx+H7QWzuw4rDFz6qOLa/NqNIID4lm0qm3iPLL5bUCU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nGkqjjDoql9Af3HmCFzB7xegsqI293C4BMKzrenOW8LgKiXJQAr6P5LXf3zadTYXf
 U0/6ThVYgFo8Sord57TAp7wY9T9g12MXfvuXiY4/HAG7AFV41EBr2mVsZMO1GQx5ee
 x8Y8FmHiyjhzwW+LYnKs0PmqAAnq1anGK0pJMJ7f+t0vS7ocrhmbePIJgJ7iH1pi6t
 huRuigjQ5WvSU/92KJYrO8V3u69OSqzoP9KIrSPFfGMW1+/frloK2agXbbvOY8FW7P
 /0c+JEY3rpw7aej+ui6flX4G9o8Y64gwc9gzIU/EsgaLkkaKWhsoP/I2bA1eKmJEhI
 19fHv7LLsAf8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=nGkqjjDo
Subject: Re: [Buildroot] [PATCH v4 1/2] package/libargon2: conditionally
 shared/static build
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andreas,

On Mon, May 18 2026, Andreas Mohr via buildroot wrote:
> Add static build support of libargon2.
> This will allow dependent packages like cryptsetup to build static as well.

The comment in package/cryptsetup/Config.in needs update, then.

Can lua-argon2 build statically now? If not, the comment in its
Config.in pointing at libargon2 needs update as well.

Same goes for python-argon2-cffi-bindings.

baruch

> Signed-off-by: Andreas Mohr <and@gmx.li>
> ---
>  package/libargon2/Config.in    | 5 -----
>  package/libargon2/libargon2.mk | 6 ++++++
>  2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
> index 6bba74cf..73c1e0d7 100644
> --- a/package/libargon2/Config.in
> +++ b/package/libargon2/Config.in
> @@ -1,12 +1,7 @@
>  config BR2_PACKAGE_LIBARGON2
>  	bool "libargon2"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_STATIC_LIBS
>  	help
>  	  A modern password hashing algorithm
>  
>  	  https://password-hashing.net/#argon2
> -
> -comment "libargon needs a toolchain w/ dynamic library"
> -	depends on BR2_USE_MMU
> -	depends on BR2_STATIC_LIBS
> diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
> index b3f6e1b2..8ca0071a 100644
> --- a/package/libargon2/libargon2.mk
> +++ b/package/libargon2/libargon2.mk
> @@ -23,6 +23,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
>  LIBARGON2_OPTS += NO_THREADS=1
>  endif
>  
> +ifeq ($(BR2_STATIC_LIBS),y)
> +LIBARGON2_OPTS += LIB_SH= LINKED_LIB_SH=
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +LIBARGON2_OPTS += LIB_ST=
> +endif
> +
>  define LIBARGON2_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>  		$(LIBARGON2_OPTS)

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
