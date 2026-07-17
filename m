Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C892C44523
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A345811FB;
	Fri, 17 Jul 2026 15:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJC4P7KOGJCr; Fri, 17 Jul 2026 15:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29661811FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303256;
	bh=jTkzMrp56YEiNCm7I9YOsZmHu904dJAxzMagFs2xk9w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gnr7cDFvtHFCBZZDdjdxKZsQ5gNVZCQ6/X3ZL2577K/fqu4kaChO/ns62NYEeaupr
	 mkS54b2iVd+A1QdWOL4/DC8JuAcyHxVxDH3HySuyUCumqnGVNmUNX7w9JIa11hNCH6
	 Ax8UM9qh07gilGgqgI5uJ1H8m719vr15pspIqRB5FoixJ9qX+i/B1zgZebwMRHIk69
	 3zvT7oVi+vkqZHg4l28WRkh7B/WqW0uaSArcV7xb7iOKYwwvVq1DFdZFAw91vIM0g6
	 r/PMqhO8ogm1gnWasAa4QMGrigGGLs4KEw8jQqLpak7rDX2JcLMG3Tpv3YAFzvFJR4
	 P0omgNABrEFAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29661811FF;
	Fri, 17 Jul 2026 15:47:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B977736E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F37881207
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eT_htPJIXeB for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C09B811D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C09B811D7
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C09B811D7
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-47df6a5202bso5490303f8f.0
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303250; x=1784908050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QDXcmqFZ2rLjWoCTTXswCHos1TTbSpVN1p3l9XgI+no=;
 b=VpCDCIoknvDQM+w2pUqpnoyvbvZBDVEiPTEriIlkX4OYM4LUB+md61JllB06aZofWT
 7F9U3Zq2Z8SKsJwIB6OXOZcoBjzHqSloE7RIzHOYdv/NcIpWPLUePy80uZZuJlGBDUC0
 xMMIVYI1B5IF3XTg0D6bsdy/ZVoCTrJvXlOlHPwjY6FYVTl8qtO475iPDFkQHh6MQVBM
 IxMzxEuDzqt8fgQyMpRel+C/ntkJ0Ufp34Q6ZNwBKp7TeVfX0u4hkVDEtjULq9FhQaqO
 S3Dp2+oAGHCnH+zvWzXSIDh2WrR1HpwgwYaQFZuddlAqGwq5CgHoZHIbh9Y+oOj5FlRx
 m1PA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqf27q3q+lUNkeAGf0Z/Z4HjhmlsWl7gg0CXr6tAsVe4E2h66I5IW1CSx41wLxdmTjlz4qTvLIYlws=@buildroot.org
X-Gm-Message-State: AOJu0YyFEKJm10ikvNKTxr9reCpOP93ZtWvm0c92p5c+sJ374idKZ3EQ
 VK/0FAZsdkcVNRX6eRs27X8FieuV2NZWkEVZXLKHpUwEdvV5H/xbiDUEpKwLX8Xeh8w=
X-Gm-Gg: AfdE7cnVCCpz1l6MC9b08GrGR4ELF9dQV1n9oQvsiwNWAdyRoS8R8gPPbfcL1bV7pL7
 y9Ufq6Dgg9w7yScl9z+AxCP4SKmXAvvNrd2ey+6LIzb8mOtA9+sYk8pEGmpeJvMWH0mo9pyS+DR
 1z90uJJgb59COEfLBpBI9llA8ah2U9cKMsjfofmpHzWw5MUOGMfgB0mh0lE7Sc+oSxFs/dYUn8M
 iQId1SzI97enldgut5Bs484lOuUcNrQieN0weFs3MDeCXmmR/K8DAzG0r8neegxV8oGZ91qTknv
 yK+p0soAQZp0aFpynwKVHn9H6nJFrWQhMVLX+YtTen3bysQInYP9aAm/ZMToOdtF5CxfhRpuQyR
 Bn/+NuC7LVrSymlz1BEg9LzDa4moQHoVJqkZVIC6VscmRmMoYkamz+oQYoGU570atE0OylLs=
X-Received: by 2002:a5d:5d0a:0:b0:475:f100:3603 with SMTP id
 ffacd0b85a97d-47f62338f82mr4148986f8f.50.1784303250258; 
 Fri, 17 Jul 2026 08:47:30 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ec7ea1sm4776197f8f.24.2026.07.17.08.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:29 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:29 +0200
Message-ID: <20260717154729.191887-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704085239.2901837-1-bernd@kuhls.net>
References: <20260704085239.2901837-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303250; x=1784908050; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QDXcmqFZ2rLjWoCTTXswCHos1TTbSpVN1p3l9XgI+no=;
 b=ZCgizF4G5i4Mt3ku+x23EcmWs6GsINbS+zaTIQQl/p4Ap2YBWn/drVlQHk45PyEbo3
 tb69v64FBYf42sk7H89b/iZrebQciCpFOyOH2quZ0b8djqQw/VfCc9OlBW2ZVrKQVQH5
 gcGQ0YF++BEoxHMN2pzHecQYWZiMBBUcaYqvCxwHWrBaQUIdX70iDhhEijRggSKCqUGW
 uVFOfWyiOboOmuESc1s11NeGWBvR7ZA9Vlb88hffGqAMkmgdXBO5TcJG1G7FF1KmPTWT
 fTTzN9c5kXZFXxbmqzfGOf3RF+mJsC6VEXIAIkiFGHN4YB9LrXZExXfRuTxjgAb+UbbI
 Xgvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZCgizF4G
Subject: Re: [Buildroot] [PATCH 1/2] package/samba4: fix build on m68k
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> samba4 uses very big switch statements, which causes the build to fail
> on m68k, because the offsets there are only 16-bit.
> 
> We fix that by using -mlong-jump-table-offsets on m68k to use 32-bit
> offsets for switch statements, but this is only available starting with
> gcc 7 [0] [1].
> 
> Only one package selects samba4, mpd, but it already depends on gcc
> >= 12. As such, we do not need to propagate that new dependency.
> 
> Fixes:
> https://autobuild.buildroot.net/results/b60/b606da691bb462879d4f9769928b5a40b9170837/
> 
> [0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c15
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c16
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Series passed Gitlab pipelines:
> https://gitlab.com/bkuhls/buildroot/-/commits/00a09b88bb7905e5daf558adf59cbb13a05e05dc
> 
>  package/samba4/Config.in | 5 +++++
>  package/samba4/samba4.mk | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/samba4/Config.in b/package/samba4/Config.in
> index e1d3dd9bf7..59f040e96a 100644
> --- a/package/samba4/Config.in
> +++ b/package/samba4/Config.in
> @@ -4,6 +4,10 @@ comment "samba4 needs a uClibc or glibc toolchain w/ wchar, dynamic library, NPT
>  		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_USE_MMU
>  
> +comment "samba4 needs a toolchain w/ gcc >= 7"
> +	depends on BR2_m68k
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> +
>  config BR2_PACKAGE_SAMBA4
>  	bool "samba4"
>  	depends on BR2_USE_MMU # fork()
> @@ -12,6 +16,7 @@ config BR2_PACKAGE_SAMBA4
>  	depends on !BR2_STATIC_LIBS # cmocka, python, gnutls
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
> +	depends on !BR2_m68k || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # m68k needs gcc >= 7.x
>  	select BR2_PACKAGE_CMOCKA
>  	select BR2_PACKAGE_E2FSPROGS
>  	select BR2_PACKAGE_GNUTLS
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 2d6bc80b9e..006fbff6c5 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -32,6 +32,11 @@ SAMBA4_CONF_ENV = \
>  	XSLTPROC=false \
>  	WAF_NO_PREFORK=1
>  
> +# m68k needs 32-bit offsets in switch tables to build
> +ifeq ($(BR2_m68k),y)
> +SAMBA4_CFLAGS += -mlong-jump-table-offsets
> +endif
> +
>  SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python3"
>  ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  SAMBA4_PYTHON += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
