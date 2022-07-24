Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4A8C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 13:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C582424D4;
	Sun, 24 Jul 2022 13:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C582424D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WycgQuVBfVXw; Sun, 24 Jul 2022 13:16:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ED2A424D7;
	Sun, 24 Jul 2022 13:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED2A424D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C83B11BF488
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC8DE83F11
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC8DE83F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jeLe67HKjutC for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 13:16:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C421483EFE
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C421483EFE
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 13:16:44 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z13so12411283wro.13
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 06:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KgdmhY4dBYC6P398krYxylMQx6KDn3oeuenLHuf5ii0=;
 b=x5q7omKpBzeggkdsHCz2u6igLRsdHDtM7M2hKMNVORtYPF2GEpj0MjypTvsOchid2L
 Er9U+7iMz3S8CsWqtMhLMArTY6H5lklCRAn1tpAlam8rr34z9eNXKQqsRnQd5zdsnntI
 pZcr0R6tcRU/acds8h5GhfQ7f3LMv8286x4BBZcEKoUZ7dEieSy8aMIMWhtUc5VPsJi5
 A0LG07XU8Z5kiZ7g8QHZYCnkMkuuKydwvt2bTXD4GfIy8TTmrjn8iaBb+6Uvtqm/lTnG
 EnWW8AhuiN/a/fhwZwGeiXbOcqUh1owyV33jEcjemnZN1y/ME/9ZN/lq4hRNSnyBgShH
 El9A==
X-Gm-Message-State: AJIora+8DlXCTgDiFEN62DlkzHes+V6O+ljNJ4cdkJtYFR1TdFBi48+2
 3tWWAGD75pBvFuqL2CzAMiH2Cg==
X-Google-Smtp-Source: AGRyM1s5bVboMTFbkF5z0xDLBwqW46+wl0pVrDkMTie0fAeWkMu+FkdOVGRrR+AAlW8jNJzQG4MeZQ==
X-Received: by 2002:adf:fb84:0:b0:21a:10f2:1661 with SMTP id
 a4-20020adffb84000000b0021a10f21661mr5086166wrr.2.1658668602716; 
 Sun, 24 Jul 2022 06:16:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 bq23-20020a5d5a17000000b0021e57963c4asm2834530wrb.77.2022.07.24.06.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 06:16:42 -0700 (PDT)
Message-ID: <1695b85a-b2f7-b4be-72c7-a60c3d6488f5@mind.be>
Date: Sun, 24 Jul 2022 15:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220112132618.2634250-2-aperez@igalia.com>
 <20220121154235.798255-1-aperez@igalia.com>
 <20220121154235.798255-3-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220121154235.798255-3-aperez@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KgdmhY4dBYC6P398krYxylMQx6KDn3oeuenLHuf5ii0=;
 b=Jdr0TQLE7TlLX5xWYiGX41jyMTJdwRxq3/d4MawECUiIb76jRlLMV/1/uLKR06S50G
 SoplgMOGuWoVJCyO1sInxmHDPj1ljUcHDTQf2AyaNAJXG1Y2Op9cGR1z4sS2uxaiEJfr
 1wyk4f1UHL5lLBt3t1GK2txceZYeEMMx0beVkTz9PtWAq/+t9lRpCAcqW5yvJ1aIDNjO
 nr5t2SPCiRrQf4conaBMrgmj4Uy3Kqakie7i6ut7SbhFhdD4bdLsFt7fzhYkd5LQdIl5
 FDHeNuTniCMtTR53HaWQWj6RYrIQsD7WhK6ELVdALokFK8R918WFBnrvXCUnvcENXcz8
 qlPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Jdr0TQLE
Subject: Re: [Buildroot] [PATCH RFC v2 2/7] package/pkg-cmake.mk: use ninja
 instead of make
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Peter Seiderer <ps.report@gmx.net>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/01/2022 16:42, Adrian Perez de Castro wrote:
> Switch to ninja as the build tool for the CMake package infrastructure.
> Note that the changes make packages which use [host-]cmake-package
> depend on host-ninja.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
> Changes v1 -> v2:
>    - No changes.
> ---
>   package/pkg-cmake.mk | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 3b1db35fb6..65f005a914 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -51,11 +51,6 @@ endif
>   
>   define inner-cmake-package
>   
> -$(2)_MAKE			?= $$(MAKE)
> -$(2)_INSTALL_OPTS		?= install
> -$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
> -$(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
> -
>   $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
>   
>   
> @@ -88,6 +83,7 @@ define $(2)_CONFIGURE_CMDS
>   	rm -f CMakeCache.txt && \
>   	PATH=$$(BR_PATH) \
>   	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> +		-GNinja \
>   		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
>   		-DCMAKE_INSTALL_PREFIX="/usr" \
>   		-DCMAKE_COLOR_MAKEFILE=OFF \
> @@ -117,6 +113,7 @@ define $(2)_CONFIGURE_CMDS
>   	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>   	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
>   	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> +		-GNinja \
>   		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>   		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>   		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> @@ -154,6 +151,8 @@ endif
>   # primitives to find {C,LD}FLAGS, add it to the dependency list.
>   $(2)_DEPENDENCIES += host-pkgconf
>   
> +$(2)_DEPENDENCIES += host-ninja

  Ah, crap, I forgot this one...

  Maybe it's better after all to add

$(2)_CMAKE_GENERATOR ?= Ninja
ifeq ($($(2)_CMAKE_GENERATOR),Ninja)
$(2)_DEPENDENCIES += host-ninja
endif

> +
>   $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
>   
>   #
> @@ -163,11 +162,13 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
>   ifndef $(2)_BUILD_CMDS
>   ifeq ($(4),target)
>   define $(2)_BUILD_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> +		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)

  If cmake is used here instead of ninja directly, it doesn't make sense to have 
a global <PKG>_CMAKE_OPTS (or whatever) any more, because the options for 
--build are completely different from those of --install. It does, however, make 
sense to add <PKG>_BUILD_OPTS, <PKG>_INSTALL_TARGET_OPTS, etc. (which we do have 
for a couple of other infras already). But that is pretty independent of this 
series.

  Regards,
  Arnout

>   endef
>   else
>   define $(2)_BUILD_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> +		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
>   endef
>   endif
>   endif
> @@ -178,7 +179,8 @@ endif
>   #
>   ifndef $(2)_INSTALL_CMDS
>   define $(2)_INSTALL_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
>   endef
>   endif
>   
> @@ -188,7 +190,8 @@ endif
>   #
>   ifndef $(2)_INSTALL_STAGING_CMDS
>   define $(2)_INSTALL_STAGING_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
> +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
>   endef
>   endif
>   
> @@ -198,7 +201,8 @@ endif
>   #
>   ifndef $(2)_INSTALL_TARGET_CMDS
>   define $(2)_INSTALL_TARGET_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
> +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
>   endef
>   endif
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
