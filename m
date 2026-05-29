Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4343CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 14:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E9D061352;
	Fri, 29 May 2026 14:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCxuoeZy89K3; Fri, 29 May 2026 14:08:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D9F760E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780063732;
	bh=vDqZwLtHwzv8NzrrOXrE9icH68sDQsJmEGb5xJCrTXQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=F9BaOXRCetgmqRb8wY15u5jqRxxquKvqJ/Syp9J63eHbRTdStQCU2YVGCQQAWlAus
	 +3457pBn2Jv7DnuT+/2U4nl/7qr3LJC1LIVmyLmZC+X49bhPnN5ONqqeTFxCdsfrVx
	 EcS+zsD1qmu0SyNnA6PbpR/ULD2/chm048MEFA9Z0xHKJW22gHQrn2F6BGrWG+DKYt
	 OZmsePydAEV86zawjUaDsqryl4m+RAEkCCdjMCkaL7BeboipXTB3u8FiZMY1N0K3eO
	 XxW7jWwFvR6U3Oyi0BIToNWlJkXAIbKd3IteFaLeK6fRxNHvo0FFCtOxk0F6hvDUq0
	 ezoCG7tbecVJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9F760E74;
	Fri, 29 May 2026 14:08:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D36C7F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B395842086
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beuHDZuT8EC3 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 14:08:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 866BE42084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 866BE42084
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 866BE42084
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:08:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7422BB97C6EC; Fri, 29 May 2026 16:08:47 +0200 (CEST)
Message-ID: <79fd300a-5ba0-4665-878f-ae3fa0f443cc@rnout.be>
Date: Fri, 29 May 2026 16:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260529132747.1269960-1-bernd@kuhls.net>
 <20260529132747.1269960-3-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529132747.1269960-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780063727; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Ncg3OJMrxRmMuUVdV6HyAsMqEbUcijRwWr18pJxC9PQ=;
 b=Lj4nFW99G3y6uqttFJpbJHr/LgNm10nk8LOTNVdxGdRo/qYthHIkH9gMO+xaxUSS/4E0gi
 UzQDe+cTkNLpVj1QDWVl6SO9FPdI4QCLlT14J3HFKU68xzBckZXXMWvlzzTrGu+XPS1oIO
 Ngvtfoc1Qs6i3ubDDuR4LvX4/vrZk3nJsZBDnDK5t5XtVxPwG8huYVwfbXcl8U8GAwRATm
 FGz5HXevR0Yf8oDmihvtFvhkFNrkXy9nZf9Qz/yXSRNSkr5cmJJoEgqEh4ePJOMnrcB7da
 ToL5OZTge6YNgrpUYRFam0woV9NCez4DBvuDdoeMRvS2vQ3FVa2TfWl5HBhUng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Lj4nFW99
Subject: Re: [Buildroot] [PATCH 3/3] package/freeswitch: security bump
 version to 1.11.1
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



On 29/05/2026 15:27, Bernd Kuhls wrote:
> https://github.com/signalwire/freeswitch/releases/tag/v1.11.1
> https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Release-Notes/FreeSWITCH-1.11.x-Release-notes/
> 
> This bump depends on the bump of libks to 2.0.11:
> https://github.com/signalwire/freeswitch/commit/4bc49f57b733e699a508aa51b83a16f09bf505dc
> 
> Removed patches which are included in this release.
> Renumbered patch 0004.
> 
> The following mods were removed upstream:
> mod_isac: https://github.com/signalwire/freeswitch/commit/6286c51ff6e8d5bd5859e46d7ce4be427b7a63f0
> mod_yaml: https://github.com/signalwire/freeswitch/commit/74c64339556362ab70e99976a90aca54e31b2c27
> mod_portaudio: https://github.com/signalwire/freeswitch/commit/49e63f6fffc6962ecfe762c57aae0c1e5bcc5096
> mod_soundtouch: https://github.com/signalwire/freeswitch/commit/d912e9fb011298acb790663ca075e845c3740e9d
> 
> Renamed configure option to disable python support:
> https://github.com/signalwire/freeswitch/commit/3a53566eab5793c8c2daf9e44e10d8a4a572aa69
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Gitlab pipeline passed with the exception of bootlin-aarch64-glibc-old:
> https://gitlab.com/bkuhls/buildroot/-/pipelines/2561720809
> 
>    ./.libs/libfreeswitch.so: undefined reference to `getentropy'
> 
> Freeswitch added the usage of getentropy in version 1.11.0:
> https://github.com/signalwire/freeswitch/commit/7f9dd270b492907ddd063be18003e18719bdb80b
> 
> getentropy was added in glibc 2.25
> https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=ec15dde7613306cfa574149f61ea38ab3fbba76d;hb=db0242e3023436757bbc7c488a779e6e3343db04#l116
> 
> causing a build error with bootlin-aarch64-glibc-old which is based on
> glibc 2.24. I found no way to disable freeswitch for this toolchain.

  I also don't know how to do that. It's old though :-)


[snip]
> diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
> index 9c6fb6155d..2cbded4da1 100644
> --- a/package/freeswitch/freeswitch.hash
> +++ b/package/freeswitch/freeswitch.hash
> @@ -1,5 +1,5 @@
> -# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.12.-release.tar.xz.sha256
> -sha256  e324e4ae063e692c42b93031157329bae339ea007e611d3535333deaed85aa47  freeswitch-1.10.12.-release.tar.xz
> +# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.11.1.-release.tar.xz.sha256
> +sha256  ed4e6ecc6a6ee0bcbc068f33cf3e5d1b83d7ad26c3a98feaebb1b2ab22d5adf4 freeswitch-1.11.1.-release.tar.xz

  Should be two spaces instead of one space (check-package).

  Applied series to master, thanks.
  Regards,
  Arnout

>   # Locally computed
>   sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
>   sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
> @@ -7,4 +7,3 @@ sha256  e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/a
>   sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  libs/libvpx/LICENSE
>   sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  libs/libyuv/LICENSE
>   sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  libs/srtp/LICENSE
> -sha256  ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/mod/codecs/mod_isac/LICENSE
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index 5cd80cfc4f..cec9b30660 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FREESWITCH_VERSION = 1.10.12
> +FREESWITCH_VERSION = 1.11.1
>   FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
>   FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
>   # External modules need headers/libs from staging
> @@ -19,9 +19,6 @@ FREESWITCH_LICENSE_FILES = \
>   	libs/apr/LICENSE \
>   	libs/srtp/LICENSE
>   
> -# 0006-Move-project-to-PCRE2.patch
> -FREESWITCH_AUTORECONF = YES
> -
>   FREESWITCH_CPE_ID_VENDOR = freeswitch
>   
>   # required dependencies
> @@ -81,7 +78,7 @@ FREESWITCH_CONF_ENV += \
>   FREESWITCH_CONF_OPTS = \
>   	--without-erlang \
>   	--enable-fhs \
> -	--without-python \
> +	--without-python3 \
>   	--disable-system-xmlrpc-c
>   
>   # Enable optional modules
> @@ -156,14 +153,6 @@ define FREESWITCH_ENABLE_MODULES
>   endef
>   FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
>   
> -# mod_isac supports a limited set of archs
> -# src/mod/codecs/mod_isac/typedefs.h
> -ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_64),y)
> -FREESWITCH_LICENSE += , BSD-3-Clause (mod_isac)
> -FREESWITCH_LICENSE_FILES += src/mod/codecs/mod_isac/LICENSE
> -FREESWITCH_ENABLED_MODULES += codecs/mod_isac
> -endif
> -
>   ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
>   FREESWITCH_DEPENDENCIES += alsa-lib
>   FREESWITCH_ENABLED_MODULES += endpoints/mod_alsa
> @@ -231,11 +220,6 @@ ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
>   FREESWITCH_DEPENDENCIES += libxcrypt
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBYAML),y)
> -FREESWITCH_DEPENDENCIES += libyaml
> -FREESWITCH_ENABLED_MODULES += languages/mod_yaml
> -endif
> -
>   ifeq ($(BR2_PACKAGE_LUA),y)
>   FREESWITCH_DEPENDENCIES += lua
>   FREESWITCH_ENABLED_MODULES += languages/mod_lua
> @@ -251,11 +235,6 @@ FREESWITCH_DEPENDENCIES += opus
>   FREESWITCH_ENABLED_MODULES += codecs/mod_opus
>   endif
>   
> -ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
> -FREESWITCH_DEPENDENCIES += portaudio
> -FREESWITCH_ENABLED_MODULES += endpoints/mod_portaudio
> -endif
> -
>   ifeq ($(BR2_PACKAGE_LAME)$(BR2_PACKAGE_LIBSHOUT)$(BR2_PACKAGE_MPG123),yyy)
>   FREESWITCH_DEPENDENCIES += lame libshout mpg123
>   FREESWITCH_ENABLED_MODULES += formats/mod_shout
> @@ -271,11 +250,6 @@ FREESWITCH_DEPENDENCIES += libsndfile
>   FREESWITCH_ENABLED_MODULES += formats/mod_sndfile
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBSOUNDTOUCH),y)
> -FREESWITCH_DEPENDENCIES += libsoundtouch
> -FREESWITCH_ENABLED_MODULES += applications/mod_soundtouch
> -endif
> -
>   ifeq ($(BR2_PACKAGE_FREESWITCH_OPENCV4),y)
>   FREESWITCH_DEPENDENCIES += opencv4
>   FREESWITCH_ENABLED_MODULES += applications/mod_cv

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
