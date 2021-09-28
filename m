Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC875C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:47:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 534CE6138E
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 534CE6138E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF4DF415BB;
	Tue, 28 Sep 2021 20:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfNqDMAKmXqK; Tue, 28 Sep 2021 20:47:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24520415BD;
	Tue, 28 Sep 2021 20:47:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FFFC1BF5E6
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F2D582D04
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id puwmel-dlPAt for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 20:47:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FD66828D1
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 20:47:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f1ff:ef77:6fa4:2894])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B8C6FB004EC;
 Tue, 28 Sep 2021 22:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632862034;
 bh=2pUlL7qt1EZUSNvGpyGA8hJXqCe9uomtE8gJiWIvpcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jshf3dQVwZ/1ynFmGK1T/4lsQaC9e1OylbKD1XpFWHb/oZwTMk7+xHyl35WaHEult
 heQ9xmk7nTy+G6hxr20DObLJsRZBX557ozuEd6oG9WTykHrdJDDt3ZzL5+9KTdE6+t
 av1qvm5vU2A7/GGYRgBrcTEguHWYU7bwuqWfOZdBNEzTAX7YJ09t0heQL4LWzdW8Pu
 saMC+CDCMrlOn7crTPwm3MBe1NlfqKxm78o3qGDmhXz7OQeZZxTvLgGVwDQfglMEP1
 1EfdbhlFs5BZJ3mMbi0BU39zDbySxHs4WcpIUOqqjMQzthF8Ndq6NcVZmoEP8dLmpx
 Tv4dWCU5kSiNg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Sep 2021 22:47:08 +0200
Date: Tue, 28 Sep 2021 22:47:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Martin Elshuber <martin.elshuber@theobroma-systems.com>
Message-ID: <20210928204708.GK1504958@scaer>
References: <20210920152831.2489077-1-martin.elshuber@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920152831.2489077-1-martin.elshuber@theobroma-systems.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/2] package/strongswan: Add options to
 select EAP plugins
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Martin, All,

On 2021-09-20 17:28 +0200, Martin Elshuber spake thusly:
> Add options to chose EAP plugins.
> 
> Since the only plugin requiring libgmp is
> BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2, the selection of BR2_PACKAGE_GMP
> is moved down accordingly.
> 
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>

Applied to master with the following changes:

  - move BR2_PACKAGE_STRONGSWAN_EAP to legacy
  - extend commit log accordingly
  - fix check-package:
        package/strongswan/strongswan.mk:57: unexpected indent with tabs

Thanks!

Regards,
Yann E. MORIN.

    
> ---
> Changes v1 -> v2:
>   - use conditional defaults and mark as legacy
>   - drop 'ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)'
>   - fix title for BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC
> 
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> ---
>  package/strongswan/Config.in     | 89 +++++++++++++++++++++++++-------
>  package/strongswan/strongswan.mk | 40 +++++++-------
>  2 files changed, 87 insertions(+), 42 deletions(-)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 368cd1ecc0..8eae568b6a 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -75,34 +75,83 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
>  
>  config BR2_PACKAGE_STRONGSWAN_EAP
>  	bool "Enable EAP protocols"
> -	select BR2_PACKAGE_GMP
> -	help
> -	  Enable various EAP protocols:
> -	    - mschapv2
> -	    - tls
> -	    - ttls
> -	    - peap
> -	    - sim
> -	    - sim-file
> -	    - aka
> -	    - aka-3gpp2
> -	    - simaka-sql
> -	    - simaka-pseudonym
> -	    - simaka-reauth
> -	    - identity
> -	    - md5
> -	    - gtc
> -	    - tnc
> -	    - dynamic
> -	    - radius
>  
>  if BR2_PACKAGE_STRONGSWAN_EAP
>  
> +config BR2_PACKAGE_STRONGSWAN_EAP_SIM
> +	bool "Enable EAP-SIM"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE
> +	bool "Enable EAP-SIM file backend"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
>  config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
>  	bool "Enable EAP-SIM smart card backend"
>  	depends on !BR2_STATIC_LIBS # pcsc-lite
>  	select BR2_PACKAGE_PCSC_LITE
>  
> +config BR2_PACKAGE_STRONGSWAN_EAP_AKA
> +	bool "Enable EAP-AKA"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2
> +	bool "Enable EAP-AKA 3GPP2 algorithms"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +	select BR2_PACKAGE_GMP
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL
> +	bool "Enable EAP-SIM/AKA backend based on a triplet/quintuplet SQL database"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM
> +	bool "Enable EAP-SIM/AKA pseudonym storage"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_REAUTH
> +	bool "Enable EAP-SIM/AKA reauthentication data storage"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_IDENTITY
> +	bool "Enable EAP-Identity"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_MD5
> +	bool "Enable EAP-MD5"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_GTC
> +	bool "Enable EAP-GDC"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2
> +	bool "Enable EAP-MSCHAPv2"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_PEAP
> +	bool "Enable EAP-PEAP"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_RADIUS
> +	bool "Enable EAP-RADIUS"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_TLS
> +	bool "Enable EAP-TLS"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_TTLS
> +	bool "Enable EAP-TTLS"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC
> +	bool "Enable EAP-DYNAMIC"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
> +config BR2_PACKAGE_STRONGSWAN_EAP_TNC
> +	bool "Enable EAP-TNC"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +
>  endif
>  
>  config BR2_PACKAGE_STRONGSWAN_UNITY
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 322abfbd7b..5fb4e6821a 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -37,6 +37,23 @@ STRONGSWAN_CONF_OPTS += \
>  	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
>  	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
>  	--enable-wolfssl=$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),yes,no) \
> +	--enable-eap-sim=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM),yes,no) \
> +	--enable-eap-sim-file=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE),yes,no) \
> +	--enable-eap-aka=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA),yes,no) \
> +	--enable-eap-aka-3gpp2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),yes,no) \
> +	--enable-eap-simaka-sql=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL),yes,no) \
> +	--enable-eap-simaka-pseudonym=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM),yes,no) \
> +	--enable-eap-simaka-reauth=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_REAUTH),yes,no) \
> +	--enable-eap-identity=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_IDENTITY),yes,no) \
> +	--enable-eap-md5=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_MD5),yes,no) \
> +	--enable-eap-gtc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_GTC),yes,no) \
> +	--enable-eap-mschapv2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2),yes,no) \
> +	--enable-eap-tls=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TLS),yes,no) \
> +	--enable-eap-ttls=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TTLS),yes,no) \
> +	--enable-eap-peap=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_PEAP),yes,no) \
> +	--enable-eap-tnc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TNC),yes,no) \
> +	--enable-eap-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC),yes,no) \
> +	--enable-eap-radius=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_RADIUS),yes,no)
>  	--with-ipseclibdir=/usr/lib \
>  	--with-plugindir=/usr/lib/ipsec/plugins \
>  	--with-imcvdir=/usr/lib/ipsec/imcvs \
> @@ -46,32 +63,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  STRONGSWAN_CONF_ENV += LIBS='-latomic'
>  endif
>  
> -ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
> -STRONGSWAN_CONF_OPTS += \
> -	--enable-eap-sim \
> -	--enable-eap-sim-file \
> -	--enable-eap-aka \
> -	--enable-eap-aka-3gpp2 \
> -	--enable-eap-simaka-sql \
> -	--enable-eap-simaka-pseudonym \
> -	--enable-eap-simaka-reauth \
> -	--enable-eap-identity \
> -	--enable-eap-md5 \
> -	--enable-eap-gtc \
> -	--enable-eap-mschapv2 \
> -	--enable-eap-tls \
> -	--enable-eap-ttls \
> -	--enable-eap-peap \
> -	--enable-eap-tnc \
> -	--enable-eap-dynamic \
> -	--enable-eap-radius
> -STRONGSWAN_DEPENDENCIES += gmp
> -endif
> -
>  STRONGSWAN_DEPENDENCIES += \
>  	$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl) \
>  	$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt) \
>  	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp) \
> +	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),gmp) \
>  	$(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl) \
>  	$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2) \
>  	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite) \
> -- 
> 2.30.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
