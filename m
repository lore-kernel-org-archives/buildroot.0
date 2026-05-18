Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1618ACD4F50
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0C31605BD;
	Mon, 18 May 2026 18:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KG5iNT5Wm1Mp; Mon, 18 May 2026 18:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8CD360646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779129701;
	bh=upIdZgdmOutvYsyYZDUF2A5aZKYDjj5rsSrgGFqXRmI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fkiHc2FK1LBsslUN2bTV/jOC6yIcj5mpy2sSE5xnIp7xA6JzuBdFEpHn7iBEsA0qJ
	 66yKMImXozl1HQK+mOOZITtHdbUY3weR7CEbUMT8Zz0gwF6Ji/snQwQ2m618duNKZf
	 OiyQp5aVwfjN+2q3zlWdse8HXxXmE1d+3T36x+ulTHpLkoEd7jJzZ7y16SvKICPoZr
	 ZSYTPz0qID60UpuVkcl3HaAELGbHaBBjxovc2CLmTb/KXN1c5dYVn14X25lLSpBvH4
	 biJsdmCrjTVVgCAiPWGUeRjSGTE3qfVGjPqZmZyiPDjba1TfmBQLKSLdkDJ29IC6y6
	 Y7zuvHHL92+Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8CD360646;
	Mon, 18 May 2026 18:41:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA542282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC0A580F04
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGjmYPymU48N for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:41:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F33D480F00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F33D480F00
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F33D480F00
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:41:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D6FC4B97C0CC; Mon, 18 May 2026 20:41:36 +0200 (CEST)
Message-ID: <1a85ea51-ed54-4bdd-a652-4a187f275369@rnout.be>
Date: Mon, 18 May 2026 20:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Mohr <and@gmx.li>, buildroot@buildroot.org
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
References: <20260516081236.7065-1-and@gmx.li>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260516081236.7065-1-and@gmx.li>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779129698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=guq6LKNerCUfT9b1WDK8nM/lEUgDMAhTyxSE+45e+ok=;
 b=fS3q8pRAmeAD6vhdtfbFTq5ZElwcERvBwjFAfj0IZiEi3hp4MlIH3IeNMPfjFBTFpNwLLa
 PPldwVP8eVYwT7ZUsWPdUsYtlzH7vPH1+3DL/8xTW9pTZch5ufWcpRa72kHKUxIy9Ttazb
 /APJISygd1JHR8PXwTg6Ug3AAh08breylV9JbTXKgMzLxlxzUlpnWjA5TXOEypk3D7LIBC
 E2Yx4OOkQdpudGI+9P70pk62WlRZ6WrHLkaucz/bTcmz4VFpZoQ0oJp+PNcYfkDpB9cQs6
 xbVW583gF5YiCFtxWutMXmye6xw8R0f4xs5p7nV67HTvXuIi0Q8wFHet8i+Uag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fS3q8pRA
Subject: Re: [Buildroot] [PATCH v3 1/1] package/libargon2: conditionally
 shared/static lib build
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

  Hi Andreas,

  Sorry to give you feedback only when you're already at v3...

On 16/05/2026 10:12, Andreas Mohr via buildroot wrote:
> libargon2 build shared and static lib by default.
> 
> Add conditionally BR2_SHARED_LIBS and BR2_STATIC_LIBS support
> and add version to pkg-config.

  That second part really should be a separate patch. With a bit more 
explanation too because I don't understand what exactly this does, or what 
happens if you don't set this. Can be as simple as "Without this, pkg-config 
--package-version libargon2 reports Buildroot's version instead of libargon2's 
version" (if that is actually what happens, of course :-)

> 
> Signed-off-by: Andreas Mohr <and@gmx.li>
> ---
> Changes in v3:
> - add version to pkg-config
> Changes in v2:
> - add conditionally shared lib build
> ---
>   package/libargon2/Config.in    | 5 -----
>   package/libargon2/libargon2.mk | 7 +++++++
>   2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
> index 6bba74cfb2..73c1e0d777 100644
> --- a/package/libargon2/Config.in
> +++ b/package/libargon2/Config.in
> @@ -1,12 +1,7 @@
>   config BR2_PACKAGE_LIBARGON2
>   	bool "libargon2"
>   	depends on BR2_USE_MMU
> -	depends on !BR2_STATIC_LIBS

  This dependency was propagated to other symbols, e.g. 
BR2_PACKAGE_PHP_EXT_LIBARGON2, BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS, 
BR2_PACKAGE_CRYPTSETUP, and should be removed from there (or the comments updated).

  Regards,
  Arnout

>   	help
>   	  A modern password hashing algorithm
>   
>   	  https://password-hashing.net/#argon2
> -
> -comment "libargon needs a toolchain w/ dynamic library"
> -	depends on BR2_USE_MMU
> -	depends on BR2_STATIC_LIBS
> diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
> index b3f6e1b216..e968aa08a3 100644
> --- a/package/libargon2/libargon2.mk
> +++ b/package/libargon2/libargon2.mk
> @@ -11,6 +11,7 @@ LIBARGON2_LICENSE_FILES = LICENSE
>   LIBARGON2_INSTALL_STAGING = YES
>   
>   LIBARGON2_OPTS = LIBRARY_REL=lib
> +LIBARGON2_OPTS += ARGON2_VERSION=$(LIBARGON2_VERSION)
>   
>   # GCC_TARGET_ARCH is not defined for all architectures, but libargon2
>   # only uses it to detect if some x86 optimizations can be used, and
> @@ -23,6 +24,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
>   LIBARGON2_OPTS += NO_THREADS=1
>   endif
>   
> +ifeq ($(BR2_STATIC_LIBS),y)
> +LIBARGON2_OPTS += LIB_SH= LINKED_LIB_SH=
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +LIBARGON2_OPTS += LIB_ST=
> +endif
> +
>   define LIBARGON2_BUILD_CMDS
>   	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>   		$(LIBARGON2_OPTS)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
