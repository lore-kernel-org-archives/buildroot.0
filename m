Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8D9CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D6EE616FE;
	Thu, 27 Nov 2025 20:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Sc7Yn9UtCwY; Thu, 27 Nov 2025 20:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA3486151B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA3486151B;
	Thu, 27 Nov 2025 20:07:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8450A708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75C83616E2
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDMmvTMhVm3B for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:07:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 70B8A6151B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70B8A6151B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70B8A6151B
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7F197B979CF0; Thu, 27 Nov 2025 21:07:43 +0100 (CET)
Message-ID: <e5928a29-2979-47c2-aee3-2e3760e68faa@rnout.be>
Date: Thu, 27 Nov 2025 21:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251123104513.157388-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251123104513.157388-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764274063; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=MS+2ChpuPOwNBMqJiP67rMWsrYchEc4NeQDDcVIg8LA=;
 b=YqppzFtevkYxV08Xl1CccqUN2r/o1oOq8mYJjJB3yQ/xHq0ZC+KJwxpyMjz4UyuIw3cwAB
 Bs+hohuOOJHY4AyYpENbZwgI/gsVKvrdYGFRTxS3vyw3UFrPSdSITJr7IL6lqlKfXUPB84
 qkrodZ3SEq0KlAg3aiGCPP0rvkxwakGpu4sybAo3FQWPaAyRUKhrO1wPV8eYDl8mVCIWr0
 CYcDtJXMRRxlF2Ldp9kpGqXYHotdiBDv6wFafLLitpOLjMfbYtvFEy3dsUYr1yQ39maKbM
 zEMy/2nTC8fWFZpcJdN7QjogG+zX2onrQEbEC8ccOuWs+5KIi8QnjBEwATmjuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=YqppzFte
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: security bump to
 version 3.8.11
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



On 23/11/2025 11:45, Bernd Kuhls wrote:
> Release notes:
> https://lists.gnupg.org/pipermail/gnutls-help/2025-November/004906.html
> 
> Fixes CVE-2025-9820.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/gnutls/gnutls.hash | 4 ++--
>   package/gnutls/gnutls.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
> index 1b2a7ba9b5..03297c3321 100644
> --- a/package/gnutls/gnutls.hash
> +++ b/package/gnutls/gnutls.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.10.tar.xz.sig
> -sha256  db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7  gnutls-3.8.10.tar.xz
> +# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.11.tar.xz.sig
> +sha256  91bd23c4a86ebc6152e81303d20cf6ceaeb97bc8f84266d0faec6e29f17baa20  gnutls-3.8.11.tar.xz
>   # Locally calculated
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
>   sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 7536189429..9eef594cc9 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -6,7 +6,7 @@
>   
>   # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
>   GNUTLS_VERSION_MAJOR = 3.8
> -GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
> +GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).11
>   GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
>   GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
>   GNUTLS_LICENSE = LGPL-2.1+ (core library)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
