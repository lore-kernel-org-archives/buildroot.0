Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A39CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0DFD84514;
	Fri, 29 May 2026 18:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WdYrmlrB_Vv; Fri, 29 May 2026 18:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0039584520
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780078295;
	bh=pJRUbJYmY7K+2cWEEMeIVD/MXYqk0tCIiy1x5EMgy3w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bu14e5Idy7FZQCqBSueaV4N5gZuFUKGPTNvI2RqCH8J1L8W5F04BxXYQYd4AVizIC
	 TVEHkVSGxCTYphqtlZRIlVpc2xXVzHhf3rDLg2ijRkgK5Inq3TGoX3XVpeRUGzrNk4
	 gK+SLp8gt1iGGtl+xX3XPo6hzmG6dtf4Iy+4xkjAhSCQqCMTJeIHbup8xvzi1DF277
	 YMxDKxAWQR82BbMYT/Buuetc4Lhd4aoYTqtMQlbSI1MhSa8j3Reoqc8MohSOtuSrxV
	 1JW2AVWpYm0/y18ZbhIA6dhygVuxDCNb1KwIeOTuau+3e7BSvxnTjXnQDoZW62TTPG
	 Utju/toMWt84A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0039584520;
	Fri, 29 May 2026 18:11:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 112F2D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4EB4406F0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQEnQP6qGlE5 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:11:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC842406DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC842406DD
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC842406DD
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:11:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6648B97C6E1; Fri, 29 May 2026 20:11:30 +0200 (CEST)
Message-ID: <2c2d6932-26e9-4233-87a9-a5618cebf9c6@rnout.be>
Date: Fri, 29 May 2026 20:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Will Newton <will.newton@gmail.com>
References: <20260527210646.3568047-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260527210646.3568047-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780078290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=nSIuKm0tJnHApSl9b7qgIHvUL6zVzkrL01l5JQqmBiU=;
 b=eJsAyD0k18ZvfBn2gwj4CfEAbVPv6CaV1HK/eM8hL6hd9f+Jfdiz8SqsP1laFPWiKco4P/
 eD7wNDQ4ipRHdKAJcSQ9SvcyaX6VQYxdfiV+zzgbUxL6J2kEryQSXNwbhGLC+lwi+oUyWe
 wOifF19rO/kx09a7oNTZ22EO9Lp6N5YFgOmPQlI8kB+ypH90fkTPMa78lVr1YV+mnVxfD8
 7bpsPwHU7LiBGRlVbe2tX5W0Y0dZ9e+a3J5bVg0S+2DS/EMsB0hMdahh1jFM96uJITQqrP
 Q7j7pTkXiYWQdBRcm8uO0GDsvJbHqudNsZpN6081L6H0L9DIZUSKNZPI8VP/7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=eJsAyD0k
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libmicrohttpd: needs
 host-pkgconf
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



On 27/05/2026 23:06, Bernd Kuhls wrote:
> Buildroot commit 712121326f84e2508ab161053c2b04e45511c79f bumped the
> package to 1.0.5 which includes upstream commit
> https://github.com/Karlson2k/libmicrohttpd/commit/a1f937422658d3c6d53853c587bc025274afac4d
> that breaks the build if pkgconf was not found:
> https://github.com/Karlson2k/libmicrohttpd/blame/master/m4/pkg.m4#L84
> 
> Fixes:
> https://autobuild.buildroot.net/results/e3e/e3e25753c670b5d86d042d850582e2e1e0eedca5/
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14386351826
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.
  Regards,
  Arnout

> ---
> v2: added host-pkgconf as mandatory dependency (Romain)
>      Gitlab pipeline passed:
>      https://gitlab.com/bkuhls/buildroot/-/pipelines/2557122497
> 
>   package/libmicrohttpd/libmicrohttpd.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
> index 7a243b42cf..a3b24d363c 100644
> --- a/package/libmicrohttpd/libmicrohttpd.mk
> +++ b/package/libmicrohttpd/libmicrohttpd.mk
> @@ -9,6 +9,7 @@ LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
>   LIBMICROHTTPD_LICENSE_FILES = COPYING
>   LIBMICROHTTPD_CPE_ID_VENDOR = gnu
>   LIBMICROHTTPD_INSTALL_STAGING = YES
> +LIBMICROHTTPD_DEPENDENCIES = host-pkgconf
>   LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
>   LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
>   
> @@ -16,7 +17,7 @@ LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"
>   
>   ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
>   LIBMICROHTTPD_LICENSE = LGPL-2.1+
> -LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls
> +LIBMICROHTTPD_DEPENDENCIES += gnutls
>   LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr
>   else
>   LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
