Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACEECD6E54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BD5840776;
	Sat, 30 May 2026 12:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIWjSvCgKD0O; Sat, 30 May 2026 12:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE69540693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145474;
	bh=TQq5rTpI6NiR05BBwfZySXwr1Jz/rcr/nIRuPGG0sB0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MrhT6qon8EvxrD0ld1Py43DqFzurtkN7fYc6OoiYvYg3tqEKrGgf7GGO8+GiqMt+H
	 q6YFN2GFkcOuGorUFQBOtK0H2HVOIbLeGOfZVR2y+Ko9VuN/3QtGUEqU8r0Qn7DqlA
	 JxWUHdKPBYlittqTSoN8C/UEv8FjMGAxksPlffziBoF8SNpjYPcq+E+RIHqbeyRc7j
	 F5ueipu+bV5Og25S7+o9LZOlJEMjOKlxGWlrSpPO+8PgDo0GO1g9fjkJzU7+qstBrI
	 2RGL83QbbmqLyjWuL6Kwrvl8KpI9Mk3wfw5veZ+Lo+AIXcB/c3iuBQa9DIqoUroEhk
	 a1qYQnKDJxXTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE69540693;
	Sat, 30 May 2026 12:51:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0D4437F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0F8D407FD
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lQZKgLDFZ9c for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5BBA407A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5BBA407A3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5BBA407A3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:51:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 63637B97C719; Sat, 30 May 2026 12:07:41 +0200 (CEST)
Message-ID: <211980db-91ef-4447-925d-6587f49e2fb3@rnout.be>
Date: Sat, 30 May 2026 12:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20260530091018.589175-1-bernd@kuhls.net>
 <20260530091018.589175-2-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260530091018.589175-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780135661; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=84kzpsZVSKLxSidtgy3DhB6WFFPNbmbcQsyKQq+yXnc=;
 b=Cay1Rp3MLH7aEfF3+wSp7FGyPbihdBuLCCSWf0MS9EyUHeOw2gdZ6nA+GusSBCT2DAKnTw
 P0Tja0LV+DMiGKdkucvgyv4/nL2LBur6bPG9eEUShvvFg6c3sH8O3b95HCzanGP18lLgUL
 0qRMCRT0ifXqrYG2ODzGtinQEKDM+BAYxljrTk786wGXWJsJm4cKN+XO1S/REsEZ1NdG0A
 lMF64qm4HhckXOMcZ1URQxsc5QjhM39WCF4ajMJMvflZW8GAI1DNJ/nX1v9IyCf+BtArWl
 BABo/2Q+4w+B4QwhlUxmCbxIdX26KJvLVb1IbylYLL0/s/h9KbY52O78ac9ckw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Cay1Rp3M
Subject: Re: [Buildroot] [PATCH v2 2/2] package/libdill: fix build with
 gcc-15.x
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/05/2026 11:10, Bernd Kuhls wrote:
> Updated project URL: https://github.com/sustrik/libdill/pull/228

  This part was actually already committed months ago, so I updated the commit 
message and applied both to master, thanks.

> 
> Adding -std=gnu17 was recommended in upstream PR:
> https://github.com/sustrik/libdill/issues/229#issuecomment-2865524080
> 
> Fixes:
> https://autobuild.buildroot.net/results/1a5/1a5e9d7df6c83a921cae39b4dc4b601be4d18e36/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: Series passes Gitlab pipelines:

  It's actually v4 already...

  Regards,
  Arnout

> https://gitlab.com/bkuhls/buildroot/-/pipelines/2563402770
> 
> with the exception of bootlin-x86-i686-musl for which I could not find
> a fix: https://gitlab.com/bkuhls/buildroot/-/jobs/14613121682
> 
> This build error was masked by the other bugs which are fixed by this
> series. It can be reproduced with this gcc-14.x-based defconfig on the
> master branch with the autoconf-fix added:
> 
> BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> BR2_PACKAGE_LIBDILL=y
> 
>   package/libdill/libdill.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
> index bea9aaeecb..453031a471 100644
> --- a/package/libdill/libdill.mk
> +++ b/package/libdill/libdill.mk
> @@ -13,6 +13,13 @@ LIBDILL_INSTALL_STAGING = YES
>   LIBDILL_DEPENDENCIES = host-pkgconf
>   LIBDILL_AUTORECONF = YES
>   
> +# gcc-15 defaults to -std=gnu23 which introduces build failures.
> +# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
> +# versions will work, since they are using the older standard.
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
> +LIBDILL_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
> +endif
> +
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>   LIBDILL_CONF_OPTS += --enable-threads
>   else

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
