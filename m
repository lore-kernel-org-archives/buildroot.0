Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56430CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 054BF60AC0;
	Fri,  5 Jun 2026 12:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1YB-ODTgKBK; Fri,  5 Jun 2026 12:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD53860AE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663746;
	bh=0GJI0taJntAaprSXeod06MokZA4b8uH5uAT7Sa1bhQk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rvm/+H+26wXRDGtUva0J9r0rIHlb43p1jx9iJz5/K0NfUyHurHwWA6KHfZaXJBdSU
	 x6G0z1g3NfYwYJ7QREPpj7T/rvTfMUxzrwuvPHZsEhdaF8V75Dx+dRFz3jsrWaTdER
	 rBiUXmCcQAGO//LMgzznW0Ts9DV1z+LOovJDKoUPz6qzu9uSrAyE9mP3X0S6l5daXK
	 mz9Q41b/XPxyeJJcDqi94hGxAHpOlQSuq8TJZ6QNw8hr+Htr2WFhCImSJZ4NeJvStz
	 T1OiEM3+qSiL2rDDWWKcBsJIlIVfv14dtJhMhff8VJabgXhl0SR8ARZClWJNED2Icq
	 3wLCqnTKNi4Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD53860AE5;
	Fri,  5 Jun 2026 12:49:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23503F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C115781FC2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UroGX50qGcrx for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB13081FB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB13081FB2
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB13081FB2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso20485735e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663740; x=1781268540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RTqmaFQ9RWYwX7tDimxkBts+TKgAouGS880infi4eG0=;
 b=jPqzN9ns+B17Sf4lvPTuSWxJgYK55UDCDdKmk1htC+UeD3jKOgDRidpw/PDM2FIue6
 SpFiU+w8U/xNf45LtBlJIYUfCs/On7nQ5fQeb4yXxHB9oLVZoSUx8dii6/QNH6XP6z9o
 8y53wuaC2fcvWr562lu05l5n3pdWqCR6r06Vka5E8ikKltS1VDQasC5MbvhJBN1P+yGg
 K6nxUW8xVxZ1u0MCG0402fg3JK3Sh1Bfx7KKyQ17xHMttUQRsR0IAZYM7o4JZFCEn53t
 W/PD+1dX+yLg+V3a5T5McOrn+YtIVoFN/L2FGG6CKMO6BT5CAqjOlgsUYOIraUlsPYaA
 fGuw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8419cyaY/bg7r69YgvP/q2TNqxeYT2aC1hHt9QjtuXuOA8l4MM5hlB0HKZJpXlsVg3lKxKHGQlLbY=@buildroot.org
X-Gm-Message-State: AOJu0YzmP1suSkaOGsnlj0qTTDchj+bz2XVGn4yVmD6szTEdh6OzfswS
 vI0aodIIvYQjHXegmSR1O/C3pDN1RAThLAfSt8VhxKyWys/IzhEuUOuXzSryCr+i9Cd/n2WgV85
 lr9k3
X-Gm-Gg: Acq92OFFaKxqcXc0zP1Qsjzal8MOFP/lgUXkpZD6MFjVVqFext7oO0kd12c7mG1zFDR
 bLTkYbduxG02VoWDzPAssa1iRZpzJaGT7dTqXLj7HyPqVfzXX+uZ8LqL56N2mtYCTVD5t/D1JlJ
 nNYOMqe6SaubDhhXDUv56CU8RmG1y21oMWW98iDIpV3jYRaDXTCDWLo9oi7JJbhWJs5ad9Z0obR
 plaSzRSliPkK0nhEBeH4VKzgW3j2FASOgd3NEwSYxsB9cNaPYTAlqBUwJ8Kcozl6DTjpeyd9lPC
 abQuWYK+61VuDxI6i2408dxndGGujzHodna7ufLhNxBkv/1mckQBqlqYVkf1cXmXpQGqr1mW9dK
 Fd1vRJqjXQge0LFhmR/VQqRIcivOjaoBlnF88MPxQJd+3ZqNA6cHPp9WRKF3rmMJFi+yj7Q/hTc
 Vu7SkReVl7k7zFd8DWQvU8XoX5NQ==
X-Received: by 2002:a05:600c:3ba4:b0:490:bad9:de43 with SMTP id
 5b1f17b1804b1-490c2525dacmr60637495e9.0.1780663740390; 
 Fri, 05 Jun 2026 05:49:00 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3918fcsm171332205e9.3.2026.06.05.05.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:00 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:48:59 +0200
Message-ID: <20260605124859.270126-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251106204522.3273683-2-bernd@kuhls.net>
References: <20251106204522.3273683-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663740; x=1781268540; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTqmaFQ9RWYwX7tDimxkBts+TKgAouGS880infi4eG0=;
 b=dHMShMglOj9cmBrqHLzq7xU7meu69qBJxoHp/6OT8Z8ihkrgD2vSMNLUEZyctvRmHm
 3wHKQsJXpmBqNJNUVJlGBVbdUqyUocbaarAcloeyD3yk7igl04vADcVrfwMZ+QSBz0OB
 BbYnmLJmfsKVice+I9GhilBIhG3Se66BSWZjIdTR8m5kAzVXYUhnHsMH8J21f0VCKJaD
 wk21DxMbdiMpa7FwR7NvOOjuzbxTrXXNVqUIIKUDAP3IHvQd+un5tYlNSjoBO4atqMbt
 IJa6MUeZBx+H70hGj0G8xAoBjVTt6ozAWA5Dm7Ea6fg0S2oH22mW5WpqSaqddTHT7U2x
 v1qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dHMShMgl
Subject: Re: [Buildroot] [PATCH v3 01/14] package/asterisk: fix build caused
 by libjwt bump
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
> In commit 770f9154978c40ce5b7718174108b37c5310869d, libjwt was bumped
> from 1.17.2 to 3.2.0, which is a big bump. And the libjwt website
> states "Version 3 of LibJWT is a complete overhaul of the code. Please
> see documentation for usage."
> 
> And indeed, this version bump breaks the build of Asterisk:
> 
> res_stir_shaken/attestation.c: In function 'pack_payload':
> res_stir_shaken/attestation.c:357:9: error: implicit declaration of function 'jwt_add_grants_json' [-Wimplicit-function-declaration]
>   357 |         jwt_add_grants_json(jwt, payload_str);
>       |         ^~~~~~~~~~~~~~~~~~~
> In file included from /home/autobuild/autobuild/instance-11/output-1/build/asterisk-22.3.0/include/asterisk/module.h:39,
>                  from res_stir_shaken/attestation.c:24:
> res_stir_shaken/attestation.c: In function '_dtor_jwt':
> res_stir_shaken/attestation.c:367:38: error: implicit declaration of function 'jwt_free'; did you mean 'jwks_free'? [-Wimplicit-function-declaration]
>   367 |         RAII_VAR(jwt_t *, jwt, NULL, jwt_free);
>       |                                      ^~~~~~~~
> 
> To fix this, let's use the bundled version of libjwt in Asterisk,
> since even Asterisk master hasn't been fixed to be compatible with
> libjwt 3.x.
> 
> Of course, this raises the question of whether the separate libjwt
> package should be removed, as it is anyway only used by Asterisk.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/2d39791c65c5b71b0533d4b2bce5f073f5919552/
> 
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> [Bernd: Added libopenssl dependency needed by bundled libjwt]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/asterisk/Config.in     | 3 ++-
>  package/asterisk/asterisk.hash | 2 ++
>  package/asterisk/asterisk.mk   | 7 ++++---
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
> index 71c741acfd..3db6e5375a 100644
> --- a/package/asterisk/Config.in
> +++ b/package/asterisk/Config.in
> @@ -10,10 +10,11 @@ config BR2_PACKAGE_ASTERISK
>  	select BR2_PACKAGE_LIBCURL
>  	select BR2_PACKAGE_LIBEDIT
>  	select BR2_PACKAGE_LIBILBC
> -	select BR2_PACKAGE_LIBJWT
>  	select BR2_PACKAGE_LIBPJSIP
>  	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_OPENSSL # bundled libjwt
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # bundled libjwt
>  	select BR2_PACKAGE_SQLITE
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index 7b28624921..f11ed08ef4 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -3,6 +3,8 @@ sha256  4cc403c8885d4aed3956dfb75d315d3e5bcc129eb9cd47c156d3b12ecceed1ba  asteri
>  
>  # Locally computed
>  sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
> +sha256  6775095bcd417d375faddc1f17cdd7706ad8aa9b9b02404990c4b0ee218ee379  libjwt-1.15.3.tar.gz
> +
>  # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
>  # sha256 locally computed
>  sha1  721c512feaea102700d5bdce952fdc0bb29dc640  asterisk-core-sounds-en-gsm-1.6.1.tar.gz
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index 18af217129..e7e802aa45 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -13,11 +13,13 @@ ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
>  # segfaults. The reason behind this is unclear.
>  # https://github.com/asterisk/asterisk/issues/671
>  ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.15.1/
> +ASTERISK_LIBJWT_URL = https://raw.githubusercontent.com/asterisk/third-party/master/libjwt/1.15.3/
>  ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
>  ASTERISK_EXTRA_DOWNLOADS = \
>  	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
>  	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz \
> -	$(ASTERISK_PJSIP_URL)/pjproject-2.15.1.tar.bz2
> +	$(ASTERISK_PJSIP_URL)/pjproject-2.15.1.tar.bz2 \
> +	$(ASTERISK_LIBJWT_URL)/libjwt-1.15.3.tar.gz
>  
>  ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
>  ASTERISK_LICENSE_FILES = \
> @@ -39,7 +41,6 @@ ASTERISK_DEPENDENCIES = \
>  	jansson \
>  	libcurl \
>  	libedit \
> -	libjwt \
>  	libpjsip \
>  	libxml2 \
>  	sqlite \
> @@ -94,7 +95,7 @@ ASTERISK_CONF_OPTS = \
>  	--with-jansson \
>  	--with-libcurl \
>  	--with-ilbc \
> -	--with-libjwt="$(STAGING_DIR)/usr" \
> +	--with-libjwt-bundled \
>  	--with-libxml2 \
>  	--with-libedit="$(STAGING_DIR)/usr" \
>  	--with-pjproject-bundled \
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
