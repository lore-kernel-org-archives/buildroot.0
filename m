Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B26C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:27:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E8261153
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27E8261153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D58A0607D0;
	Sat, 11 Sep 2021 20:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5twmyRs3RXXj; Sat, 11 Sep 2021 20:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE81607E9;
	Sat, 11 Sep 2021 20:27:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 434EE1BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32DDB4051D
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSXEDx2GMXv8 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:27:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 023884036E
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:27:07 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id n10so7803331eda.10
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zyJWBj9jPv6q7EsaBWQEnqtijrR1HRUI8QPo3KwUDD4=;
 b=POMLfBwjJv3sLBttc5klgIfF+vjnBYsjt45UnUkTKGZkm/Eej4/JE10NBbmgz1Mk7d
 PCdxbvLWI4z21BtPdGEypmjA2UY30EURcSaLDnTcbi4aLzL87/cv6mVD46eLxNaHtHil
 Zl/Fq/R49tVu+w+ueqc3Wrr03noCVaNiwEhOnlP3exPt3R745k4MMkDzStEaFrImSrMi
 YjIWZqXY4XQ56uSWDD9MRNHY/8Z2irDBq9jnwjroD/RpscZVyd2/kvoHMzuU8nh8c5wu
 Z4SZB9Fq7VSuTs1EpTmf22cr2f+5vzeCNCzGHmsGU6aMKbIHbxuv6+mE/lumcBmhzeBq
 upFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zyJWBj9jPv6q7EsaBWQEnqtijrR1HRUI8QPo3KwUDD4=;
 b=lRMzHsJnREq2yQKeQU9wJJX9YF3gO3YBbCYDezDTuYCdN0szry851PE6k+MkdmaZAM
 nk7BC+Fpfw73h7T97Ub9Woz2a3XjS2NofZ2RNcr/T6elOyiEnI+a/1uKz6m6lzBOu5kM
 sRhuFtA7176kFxeJcsTTvSjPkxfueNPlkvUWB0J9ZPsc8bbmdKmWazcC7QbC3GUfvexn
 mR05sD0DsDwCvVN8ImUy+oYmTS3jy4nJnIo7SuT43pmcCKByWeKCqON5xT8OMW5Z4aH2
 nSEb4/3Qg9RsLkxTmiptBw2X51jxyqKnYBUHsrjX8aYrsXpueIKEmTPrlLozGL/NX/Hv
 xkQQ==
X-Gm-Message-State: AOAM533L1TAwQA1aWHTU7AXOSyyng8am8wyE52YUoPy0CUzLa32lJTfM
 PbhOAgAzUdXVqgY2iJDYw5BV4B36o9p08w==
X-Google-Smtp-Source: ABdhPJx9K5bpKlUxoFP7RsBtFkfzQmfjpM5ymYyNfxTJ1goPaxZIaOuMaiF5T6n/O/sUruMyMlSgSQ==
X-Received: by 2002:a05:6402:455:: with SMTP id
 p21mr4735943edw.309.1631392025871; 
 Sat, 11 Sep 2021 13:27:05 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s3sm1383887edw.38.2021.09.11.13.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 13:27:05 -0700 (PDT)
To: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
References: <DM6PR08MB39937E02CFE8C1C61A541E41A0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <9cc92872-5f7d-149c-faa5-10e9f678332e@mind.be>
Date: Sat, 11 Sep 2021 22:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DM6PR08MB39937E02CFE8C1C61A541E41A0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/3] package/rpm: bump version to 4.17.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 04/09/2021 22:40, James Knight wrote:
> Bumping the version of the rpm package to v4.17. This new release
> includes a series of key changes [1], notables includes:
> 
>  - Explicit requirement for lua v5.3+.
>  - Berkeley DB database backend has been dropped.
>  - beecrypt and NSS crypto backends have been dropped.
> 
> The argument `--with-external-db` was tied to Berkeley-related support,
> which was removed in an older revision [2]. The argument
> `--without-hackingdocs` was dropped in an older revision [3].

 Excellent commit message!

> 
> [1]: https://rpm.org/wiki/Releases/4.17.0
> [2]: https://github.com/rpm-software-management/rpm/commit/e1d3811883dc9fe79fe7b5ff90f69b9998611128
> [3]: https://github.com/rpm-software-management/rpm/commit/3017eae9a3952823f80932e84a7a1e81f983639a
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  package/rpm/Config.in |  8 +++++---
>  package/rpm/rpm.hash  |  4 ++--
>  package/rpm/rpm.mk    | 25 ++++---------------------
>  3 files changed, 11 insertions(+), 26 deletions(-)
> 
> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
> index ac979fdbad..9da8d51df0 100644
> --- a/package/rpm/Config.in
> +++ b/package/rpm/Config.in
> @@ -1,5 +1,6 @@
> -comment "rpm needs a toolchain w/ dynamic library and threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
> +		|| !BR2_PACKAGE_LUA_5_3
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	depends on BR2_USE_MMU
>  
> @@ -7,9 +8,10 @@ config BR2_PACKAGE_RPM
>  	bool "rpm"
>  	depends on !BR2_STATIC_LIBS # dlfcn.h
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	depends on BR2_PACKAGE_LUA_5_3

 The commit message says 5.3+ but you only allow 5.3 exactly here. Could you
test if 5.4 works as well, and update the dependency accordingly?

 I've applied to master as is though, thanks.

 Regards,
 Arnout

>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_LIBNSS && !BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_FILE
>  	select BR2_PACKAGE_POPT
>  	select BR2_PACKAGE_ZLIB
> diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
> index 9389f8290f..19b6dd9176 100644
> --- a/package/rpm/rpm.hash
> +++ b/package/rpm/rpm.hash
> @@ -1,5 +1,5 @@
> -# From https://rpm.org/wiki/Releases/4.16.1.3.html
> -sha256  513dc7f972b6e7ccfc9fc7f9c01d5310cc56ee853892e4314fa2cad71478e21d  rpm-4.16.1.3.tar.bz2
> +# From https://rpm.org/wiki/Releases/4.17.0.html
> +sha256  2e0d220b24749b17810ed181ac1ed005a56bbb6bc8ac429c21f314068dc65e6a  rpm-4.17.0.tar.bz2
>  
>  # Hash for license file
>  sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
> index ae324fbeef..816deceff7 100644
> --- a/package/rpm/rpm.mk
> +++ b/package/rpm/rpm.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -RPM_VERSION_MAJOR = 4.16
> -RPM_VERSION = $(RPM_VERSION_MAJOR).1.3
> +RPM_VERSION_MAJOR = 4.17
> +RPM_VERSION = $(RPM_VERSION_MAJOR).0
>  RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
>  RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
>  RPM_DEPENDENCIES = \
> @@ -13,6 +13,7 @@ RPM_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
>  	$(if $(BR2_PACKAGE_ELFUTILS),elfutils) \
>  	file \
> +	lua \
>  	popt \
>  	$(if $(BR2_PACKAGE_XZ),xz) \
>  	zlib \
> @@ -28,10 +29,7 @@ RPM_SELINUX_MODULES = rpm
>  RPM_CONF_OPTS = \
>  	--disable-python \
>  	--disable-rpath \
> -	--with-external-db \
> -	--with-gnu-ld \
> -	--without-hackingdocs \
> -	--without-lua
> +	--with-gnu-ld
>  
>  ifeq ($(BR2_PACKAGE_ACL),y)
>  RPM_DEPENDENCIES += acl
> @@ -40,13 +38,6 @@ else
>  RPM_CONF_OPTS += --without-acl
>  endif
>  
> -ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
> -RPM_DEPENDENCIES += berkeleydb
> -RPM_CONF_OPTS += --enable-bdb
> -else
> -RPM_CONF_OPTS += --disable-bdb
> -endif
> -
>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  RPM_DEPENDENCIES += dbus
>  RPM_CONF_OPTS += --enable-plugins
> @@ -64,14 +55,6 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  RPM_DEPENDENCIES += libgcrypt
>  RPM_CONF_OPTS += --with-crypto=libgcrypt
> -else ifeq ($(BR2_PACKAGE_LIBNSS),y)
> -RPM_DEPENDENCIES += libnss
> -RPM_CONF_OPTS += --with-crypto=nss
> -RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr
> -else ifeq ($(BR2_PACKAGE_BEECRYPT),y)
> -RPM_DEPENDENCIES += beecrypt
> -RPM_CONF_OPTS += --with-crypto=beecrypt
> -RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/beecrypt
>  else
>  RPM_DEPENDENCIES += openssl
>  RPM_CONF_OPTS += --with-crypto=openssl
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
