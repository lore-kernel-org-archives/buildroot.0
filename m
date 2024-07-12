Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AA6C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43787412B0;
	Fri, 12 Jul 2024 08:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiB6FTCH4eLS; Fri, 12 Jul 2024 08:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6691412B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6691412B7;
	Fri, 12 Jul 2024 08:49:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CDCE1BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AF96820E5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zu9lJYL5m-SS for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:49:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D6FC8209D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D6FC8209D
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D6FC8209D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:49:35 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52ea79e6979so2008330e87.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 01:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720774174; x=1721378974;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r51+tbkBQ0aV3V3LpZPEvSKgLaO6mpCHGywaE2RNNWM=;
 b=oVAzJhDfxNunupVR/W2Ln9JsCL/bIYSd/U9LymOET4uiL90As30mohRUgYwgbb/plJ
 lZ9ClZZaNOcNRljDKLXlnl2o4qtcvyqCv6vvYyIM2MlPeGAz2WVSgWSFWLtTdIgi0zYb
 rXz/ZeYMb/tptIK11+IoTXkx3SdKDrGtrN12h+5LY1CIcnlh4K4Px2x2H8EoNuS4U0fl
 WWXlMCPoOwIPi1D6+6aqv2odA++IzHSny8KBY5MeFosBhWo+3XKVrCjbAccNGTNbouIi
 u/NW4S2Q9k8mB2AW9xBtGk3l935JhxP4DiynYrT9/Q8TWRkp88mpafIw7CuzJY9GO7If
 AZEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfu/k23Ud3ThJQPTRQnwQ3HDec5+5NjbgXzw9tJODOPJ10XDGbLyHMEl6fu7pfBSe+R2iBwbR4xy6Tzg876mOcw5UCuRDOjw==
X-Gm-Message-State: AOJu0YyxRGPYQFiLkxqNcvvEoI1OWaj8Y/DuonytnW9GZq4Sz1ccGbJQ
 /8fGNyo03+EArgnv79lg/bxOrVFEU9KBVtSVwYeNsjLnf6INa4QWgnLbIQlQiUY=
X-Google-Smtp-Source: AGHT+IHtNdEM8OG+1fKvD8JAdhAAGQSU1IMd+fRcr/VDcdDBIfZqLK9N1VyJm3/vkMOC+d6VvxeSCQ==
X-Received: by 2002:a05:6512:312f:b0:52c:b479:902d with SMTP id
 2adb3069b0e04-52eb999135bmr5991786e87.4.1720774173587; 
 Fri, 12 Jul 2024 01:49:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f28c31dsm15105755e9.28.2024.07.12.01.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 01:49:33 -0700 (PDT)
Message-ID: <3b15acd5-c870-4322-850a-f391f5a2555e@mind.be>
Date: Fri, 12 Jul 2024 10:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
References: <20240704123452.3535612-1-heiko.thiery@gmail.com>
 <20240704123452.3535612-4-heiko.thiery@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240704123452.3535612-4-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720774174; x=1721378974; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r51+tbkBQ0aV3V3LpZPEvSKgLaO6mpCHGywaE2RNNWM=;
 b=BwPEWczgdprz8yIXP2FSbiIqJdNy/tjXplo+wa+EW9OnANzpLTuP760CxloN2Xf5gk
 xrPOxQ1mfr2je+C7NGeCaVADAPABdo1jXO7FZkagu4c4EJiU+Hqj4/Zl+0vbsOghba8z
 0gU2nd84nf9kkw5or5LF+6n8r/+MG13plBMUveGqF9XBGScb7GeV4QqhYGKZTkeRfDL6
 2JiVJyAvYhTDsJcEfCkgv2QjcIT9p3LJykKXu0Xr5xkpA42oU26+CMO1ufn0A1cuIQaC
 m9wpNLmZbOmKUQdz9BVh8l81Y99erci/V/133I5mPwcMo6UhaMqfuWr4nhmmwSG/e/Wh
 PTeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BwPEWczg
Subject: Re: [Buildroot] [PATCH v3 3/3] package/ccache: bump version to
 4.10.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/07/2024 14:34, Heiko Thiery wrote:
> https://ccache.dev/releasenotes.html#_ccache_4_10_1
> 
> This version requires use the system dependencies of host-blake3 and
> host-xxhash. The bundled version is not able to build/download.
> 
> The ZSTD_FROM_INTERNET and HIREDIS_FROM_INTERNET variables are replaced
> in the ccache build system with DEP_ZSTD and DEP_HIREDIS in version 4.10.
> For the sake of completeness, all DEP_<xxx> variables were set for external
> dependencies.
> 
> The generation of documentation has also been switched off.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> 
> v2:
>      - cleanup HOST_CCACHE_CONF_OPTS
> 
> v3:
>      - adopt LICENSE.adoc hash
> 
>   package/ccache/ccache.hash |  4 ++--
>   package/ccache/ccache.mk   | 27 +++++++++++++++++----------
>   package/pkg-generic.mk     |  2 +-
>   3 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
> index a2537077b6..744e167489 100644
> --- a/package/ccache/ccache.hash
> +++ b/package/ccache/ccache.hash
> @@ -1,4 +1,4 @@
>   # sha256 computed locally
> -sha256  4c03bc840699127d16c3f0e6112e3f40ce6a230d5873daa78c60a59c7ef59d25  ccache-4.9.1.tar.xz
> +sha256  3a43442ce3916ea48bb6ccf6f850891cbff01d1feddff7cd4bbd49c5cf1188f6  ccache-4.10.1.tar.xz
>   sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
> -sha256  a6aea7358a30ded3f8abbff979219bdbe7b7a9aa489a8c70030afd96a83caf84  LICENSE.adoc
> +sha256  de4684f5251a0a2c58f3a7ab94d6a8d3443822cbd01abcdadd9250d3d1e0bfe1  LICENSE.adoc

  Commit message should explain why the hash changed, i.e. what are the 
differences between the old and the new license. Preferably with a reference to 
the upstream commit(s) that introduced the change.

> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index 0b2c02e8a7..d92608512c 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -4,20 +4,27 @@
>   #
>   ################################################################################
>   
> -CCACHE_VERSION = 4.9.1
> +CCACHE_VERSION = 4.10.1
>   CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
>   CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
>   CCACHE_LICENSE = GPL-3.0+, others
>   CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
> -HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd
> +HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd host-xxhash host-blake3
>   
>   # We are ccache, so we can't use ccache
>   HOST_CCACHE_CONF_OPTS += \
>   	-UCMAKE_C_COMPILER_LAUNCHER \
>   	-UCMAKE_CXX_COMPILER_LAUNCHER \
>   	-DCCACHE_DEV_MODE=OFF \
> -	-DZSTD_FROM_INTERNET=OFF \
> -	-DHIREDIS_FROM_INTERNET=OFF \
> +	-DDEP_BLAKE3=SYSTEM \
> +	-DDEP_FMT=BUNDLED \
> +	-DDEP_CPPHTTPLIB=BUNDLED \
> +	-DDEP_HIREDIS=SYSTEM \
> +	-DDEP_NONSTDSPAN=BUNDLED \
> +	-DDEP_TLEXPECTED=BUNDLED \
> +	-DDEP_XXHASH=SYSTEM \
> +	-DDEP_ZSTD=SYSTEM \
> +	-DENABLE_DOCUMENTATION=OFF \
>   	-DENABLE_TESTING=OFF
>   
>   # Patch host-ccache as follows:
> @@ -32,12 +39,12 @@ HOST_CCACHE_CONF_OPTS += \
>   HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))
>   
>   define HOST_CCACHE_PATCH_CONFIGURATION
> -	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/Config.cpp
> -	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
> -	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
> -	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
> -	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/Config.cpp
> -	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/Config.cpp
> +	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache/Config.cpp
> +	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
> +	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
> +	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
> +	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/ccache/Config.cpp
> +	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/ccache/Config.cpp
>   endef
>   
>   HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a2749320c3..7249a9a233 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -793,7 +793,7 @@ $(2)_EXTRACT_DEPENDENCIES += \
>   endif
>   
>   ifeq ($$(BR2_CCACHE),y)
> -ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd,$(1)),)
> +ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd host-xxhash host-blake3,$(1)),)

  Wow, this is getting impressive... Perhaps we should turn this around and use 
a variable FOO_ADD_CCACHE_DEPENDENCY, similar to the 
FOO_ADD_TOOLCHAIN_DEPENDENCY we already have?

  Regards,
  Arnout

>   $(2)_DEPENDENCIES += host-ccache
>   endif
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
