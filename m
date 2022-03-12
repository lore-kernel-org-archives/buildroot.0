Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34452C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 19:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB1EA8186E;
	Sat, 12 Mar 2022 19:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Li0L3JChnI64; Sat, 12 Mar 2022 19:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF5DA81749;
	Sat, 12 Mar 2022 19:43:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 490F71BF3E8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 469AD410C4
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OcQDsV41ttNk for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 19:43:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 302AC40997
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 19:43:43 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id qt6so25872108ejb.11
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 11:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=XlDMqd/jXEYc/Igtc11VTJABvGs7Dzi/Zv/DDKH+X20=;
 b=QHRutCrYSnY9KzsatOW6AYnxp6Xx64MhEs9cYcnzp/1KcJnHnyvbnz0BNoUW3HhPTg
 BIqXNgkLU43Oy7Lq45jbdMVVkIoX8AaHLF4r1vLb7UVbqQaN58unFjWaMsQSfb08s2k+
 TOTp0jEzOFcO65OlyJhwRmHYherJR3gAjH4l7cuFy+/WToVgs9AUNxWWLcHF2Ln5eH9z
 k+MnMIbVLQiMI//t0WkV1Q/KMR38MjMG09i1RDh258RyDtdo/oofgwhhL7uqc2v6LaDE
 DhsVU5w+RJyn7yoCCVohnaEPXHY7kj2z6efCCrJZJuxGOzDh0hV72VnRbPb3eJweb1In
 8I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XlDMqd/jXEYc/Igtc11VTJABvGs7Dzi/Zv/DDKH+X20=;
 b=oTZq91XsCx89EAuE7+bZEYTJIFxDXsHVKUl3aVP7gEk7GmQu5JoYsWpwsmci4EGm/+
 VSgtyt5zvVkBgIV9I0b6/Fq1wMHHYSbcNF9bdtZrXbJQa0+i8DmFxbrnaKPJbJz9uk7/
 VR8UAjvyfqqkJO+I2tLTb2zmpxbHOiEinulaIgC7XdOlTkHUTb095tyOHLIZ0saYCQSQ
 v28CWNcac2Cj93vxPslAWaStdFeKa4rLG8nRWinxt8k1de9Zt274CjF0qrqET1kv9Zr+
 lmsatC10BdNinxxuqBzFuVCUEqDEDuQgd+/I82LA/2P1cTrKGous0LXFd+jcC5GIPVOC
 8AQg==
X-Gm-Message-State: AOAM532o4BF6JgZ4CdPWeJBWerZKeen6FrH26VfZuONGAGOhDDr4KW58
 TxAqhs8FFyJkqM7vYzHXRgZnDw==
X-Google-Smtp-Source: ABdhPJw/VjLNukdf80DV0sVMk1iiEoVvTVQB/No+irof+vqYaLDWNcruorfe+62qwOWDKvHvPohulg==
X-Received: by 2002:a17:906:1e94:b0:6cc:4382:f12e with SMTP id
 e20-20020a1709061e9400b006cc4382f12emr13490074ejj.482.1647114221320; 
 Sat, 12 Mar 2022 11:43:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a1709067f8500b006da68bfdfc7sm4716094ejr.12.2022.03.12.11.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 11:43:40 -0800 (PST)
Message-ID: <48945229-3116-363f-f61f-89d495695cc1@mind.be>
Date: Sat, 12 Mar 2022 20:43:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20220222220255.22327-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222220255.22327-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [RFC][PATCH 1/1] package/bind: bump to version
 9.16.26
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2022 23:02, Petr Vorel wrote:
> BIND 9.11 EOL in March, 2022. BIND 9.16 is current Stable/ESV version.
> 
> Changes:
> * libuv (new dependency)
> * openssl is now mandatory
> * zlib must be detected with PKG_CONFIG_PATH (specifying zlib
>    installation path is not supported)
> * bind9-config and isc-config.sh removed
> * updated COPYRIGHT hash
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

  Applied to master, thanks.

  I guess we'll get complaints if it doesn't work :-)

  Regards,
  Arnout

> ---
> Hi,
> 
> time to move on to 9.16.
> 
> Tested only local build as I don't use bind.
> I'll also verify builds with utils/test-pkg.
> But it'd be great if anybody could also test running bind.
> 
> Kind regards,
> Petr
> 
>   package/bind/Config.in | 12 +++++++++++-
>   package/bind/bind.hash |  6 +++---
>   package/bind/bind.mk   | 15 +++++++--------
>   3 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/package/bind/Config.in b/package/bind/Config.in
> index db10ceb304..9887403ed9 100644
> --- a/package/bind/Config.in
> +++ b/package/bind/Config.in
> @@ -1,6 +1,11 @@
>   config BR2_PACKAGE_BIND
>   	bool "bind"
> -	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_MMU # fork(), libuv
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
> +	depends on !BR2_STATIC_LIBS # libuv
> +	select BR2_PACKAGE_LIBUV
> +	select BR2_PACKAGE_OPENSSL
>   	help
>   	  BIND (Berkeley Internet Name Domain) is an
>   	  implementation of the Domain Name System (DNS) protocols
> @@ -24,6 +29,11 @@ config BR2_PACKAGE_BIND
>   
>   	  https://www.isc.org/bind/
>   
> +comment "bind needs a toolchain w/ NPTL, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> +
>   if BR2_PACKAGE_BIND
>   
>   config BR2_PACKAGE_BIND_SERVER
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 70299f1677..401e389e49 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.11.36/bind-9.11.36.tar.gz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.16.26/bind-9.16.26.tar.xz.asc
>   # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
> -sha256  c953fcb6703b395aaa53e65ff8b2869b69a5303dd60507cba2201305e1811681  bind-9.11.36.tar.gz
> -sha256  cad49daa42654bc241762cd998630168a2542c8fd6fad3881e2eac1510bb6fcd  COPYRIGHT
> +sha256  70b39a5eb71650358ec9ba41da3050d32aeac0aeb4a466684b23f35affa7fb45  bind-9.16.26.tar.xz
> +sha256  daf6f1eddf5983ed664a2d125b619e56e2e93917c19d0d41c7586ea153ba2155  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index e329c803a3..5b4c60b14c 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,12 +4,12 @@
>   #
>   ################################################################################
>   
> -BIND_VERSION = 9.11.36
> +BIND_VERSION = 9.16.26
> +BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>   BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>   # bind does not support parallel builds.
>   BIND_MAKE = $(MAKE1)
>   BIND_INSTALL_STAGING = YES
> -BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
>   BIND_LICENSE = MPL-2.0
>   BIND_LICENSE_FILES = COPYRIGHT
>   BIND_CPE_ID_VENDOR = isc
> @@ -32,15 +32,18 @@ BIND_CONF_ENV = \
>   BIND_CONF_OPTS = \
>   	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads) \
>   	--without-lmdb \
> -	--with-libjson=no \
> +	--with-json-c=no \
>   	--with-randomdev=/dev/urandom \
>   	--enable-epoll \
>   	--enable-filter-aaaa \
>   	--disable-backtrace
>   
> +BIND_DEPENDENCIES = libuv
> +
>   ifeq ($(BR2_PACKAGE_ZLIB),y)
> -BIND_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
> +BIND_CONF_OPTS += --with-zlib
>   BIND_DEPENDENCIES += zlib
> +BIND_DEPENDENCIES += host-pkgconf zlib
>   else
>   BIND_CONF_OPTS += --without-zlib
>   endif
> @@ -66,7 +69,6 @@ else
>   BIND_CONF_OPTS += --with-libxml2=no
>   endif
>   
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   BIND_DEPENDENCIES += host-pkgconf openssl
>   BIND_CONF_OPTS += \
>   	--with-openssl=$(STAGING_DIR)/usr \
> @@ -80,9 +82,6 @@ BIND_CONF_OPTS += --with-gost=yes
>   else
>   BIND_CONF_OPTS += --with-gost=no
>   endif
> -else
> -BIND_CONF_OPTS += --with-openssl=no
> -endif
>   
>   # Used by dnssec-keymgr
>   ifeq ($(BR2_PACKAGE_PYTHON_PLY),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
