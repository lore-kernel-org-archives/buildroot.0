Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC74AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:07:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 480FB6103B
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 480FB6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A4124016B;
	Sat, 18 Sep 2021 21:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8nOwzGM6EOL; Sat, 18 Sep 2021 21:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C258F40180;
	Sat, 18 Sep 2021 21:07:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A817C1BF842
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90C7183F22
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CvB1J_UUGi9F for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 21:07:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24D3F83F24
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 21:07:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2CD34B004EC;
 Sat, 18 Sep 2021 23:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631999223;
 bh=NCP7kKNoU8/2XRk0kLsO9mByw6jb2fc4ioRCw6bS44Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kYm02Ue98z7RQrj0tbaLmUK62wYaRyx9hxmMizfe5TFdISQclu5kg6Z8qlB6+0HjX
 cLGMAJ2UiWkBi8bAXl/QqxHsZ1uAHibx/OxCG3GeHpFUKEaYwHoP7rwIsUQP7F4yFv
 MENCVqGpmja9+T0WCA643O2ydW16xI5dDNvg/t8FxaPGWCKrLAN6BOBvhHrxHvHKuE
 63ON1soeu1d+JqL96r35KOUaLvr9WwQMOk8Oi1zieb8NxEwyRnyHl5C/52dg/BHcZd
 Id2scCT8g51esUnHftwW0/RgqYAktnwkAfl6evk8tdhC/W+vTeCNvOGPV1bF+dt5z7
 fjXPoyqusgw1Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 23:06:27 +0200
Date: Sat, 18 Sep 2021 23:06:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Martin Elshuber <martin.elshuber@theobroma-systems.com>
Message-ID: <20210918210627.GA1053080@scaer>
References: <20210913142652.942533-1-martin.elshuber@theobroma-systems.com>
 <20210913142652.942533-2-martin.elshuber@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210913142652.942533-2-martin.elshuber@theobroma-systems.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/3] package/strongswan: Add options to
 select EAP plugins
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Martin, All,

On 2021-09-13 16:26 +0200, Martin Elshuber spake thusly:
> Add options to chose EAP plugins.
> 
> Since the only plugin requiring libgmp is
> BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2, the selection of BR2_PACKAGE_GMP
> is moved down accordingly.
> 
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> ---
>  package/strongswan/Config.in     | 89 +++++++++++++++++++++++++-------
>  package/strongswan/strongswan.mk | 36 ++++++-------
>  2 files changed, 87 insertions(+), 38 deletions(-)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 368cd1ecc0..77d437d7d9 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -75,34 +75,83 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
>  
>  config BR2_PACKAGE_STRONGSWAN_EAP
>  	bool "Enable EAP protocols"

If I understand correctly, BR2_PACKAGE_STRONGSWAN_EAP no drives no
option directly, right? As such, it can be moved to legacy, and
then [...]

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
> +	default y

[...] each individual EAP option would have a conditional default:

    default y if BR2_PACKAGE_STRONGSWAN_EAP  # legacy

This would have the added benefit that, when we eventually get rid of
the legacy entry, we can also get rid of the legacy default.

[--SNIP--]
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 322abfbd7b..ebfa1a11f3 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -48,30 +48,30 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
>  STRONGSWAN_CONF_OPTS += \
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
>  endif

And indeed, from the above list, BR2_PACKAGE_STRONGSWAN_EAP by itself no
longer means anything; setting it to 'n' does not even forces all
sub-options to 'no', but leaves them to their default value (as was the
case previously, though, so not a regression).

I think this ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y) can be dropped
altogether, now.

Unless I missed something?

Regards,
Yann E. MORIN.

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
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
