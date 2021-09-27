Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E880C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:56:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7863260EE7
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7863260EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 397854011D;
	Mon, 27 Sep 2021 16:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNLLcfkYLe4J; Mon, 27 Sep 2021 16:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 636B64017C;
	Mon, 27 Sep 2021 16:56:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA5F71BF955
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D43A54017C
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pgvtpJfMmhvt for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 16:56:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B40E74011D
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 16:56:25 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g7so12439229edv.1
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Jh/BlpVFtsKbUdIIJQ4TFgcVnP942/v8zM8fqmU5g2g=;
 b=C7B5NhbFM8ohIdWGvPA/Kj8HHPq7UPKPanrCpLAwiHj6r3wXrkOoPvADVb57UVRxN+
 EuuZKWNYypctXh5GepeEO8ZX0yHVeKsb6ZGikDV+Tbe3/5g8sBet6eqYYg4cI4RcZmw0
 BcH01EaFF3UKEQMnIb6Ev8DWsCYPvmBtoRIlD4X2bf9qbxMvOMbxmtSVohLd3SWzhz7S
 a4RleondkakUNG3jpp4odloZ3ogdQ7KgRAV4ApZFKkG0iKuzoGt+HLjnH3MLnyHM/2aL
 DwqrxExRlQcoln/w/MFv8xJhWupOTxNH/Qj6nFvj0N8N4by7cWzbic5bV3/j664pwg4M
 ke5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Jh/BlpVFtsKbUdIIJQ4TFgcVnP942/v8zM8fqmU5g2g=;
 b=3lj2R/9xltIu8EMiC2PRjL1MYGmCewnlBw63VJAVLdSzqv8V38nW6tPq+ZEiwRLMyd
 BzaCpKJVshL28IFo5EZBytli88hH8JJfyGxy21NLCUA3vLXhQha041vw+qND2s+6XIa2
 PvuoMWjgYR0VCgvTLKfuIVs/ZzunFOJeTysTDoFTozWSIbwV6EfBaFrbsF36sFQkhnXz
 8E8B7OiZFjlSt++skUEFQ54ZBpn0lspOYpOk8oXG+YvkcCIA8gMRcUylYjvUnp8KWVPb
 8IktRdQGe5qyNGzYkEHyXBLH90y4IY+EDXZ5RIQBanf63KVPTYHGjDKF/F3r0SW7tXBF
 Gzew==
X-Gm-Message-State: AOAM530OOdYO4J+c40UF+/1bmlmP7htUpQ/tBoNi8upnzQU6yWaQhk3e
 SNp6vgR6Pj0/bLLPXWjUlZwGkg==
X-Google-Smtp-Source: ABdhPJwZZAOdER7bYvqQPqlmM0dZv4DrzN4U4KkSGWs3BzAEfhwJfdwXRqtrxXePL9agrkreEoOBVg==
X-Received: by 2002:a50:cf48:: with SMTP id d8mr1122521edk.293.1632761783797; 
 Mon, 27 Sep 2021 09:56:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k21sm4681418edx.61.2021.09.27.09.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 09:56:23 -0700 (PDT)
Message-ID: <0b09997d-7df9-2385-aede-f6620d8d3292@mind.be>
Date: Mon, 27 Sep 2021 18:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Martin Elshuber <martin.elshuber@theobroma-systems.com>,
 buildroot@buildroot.org
References: <20210913142652.942533-2-martin.elshuber@theobroma-systems.com>
 <20210920152831.2489077-1-martin.elshuber@theobroma-systems.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920152831.2489077-1-martin.elshuber@theobroma-systems.com>
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/09/2021 17:28, Martin Elshuber wrote:
> Add options to chose EAP plugins.
> 
> Since the only plugin requiring libgmp is
> BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2, the selection of BR2_PACKAGE_GMP
> is moved down accordingly.
> 
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> 
> ---
> Changes v1 -> v2:
>    - use conditional defaults and mark as legacy
>    - drop 'ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)'
>    - fix title for BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC
> 
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> ---
>   package/strongswan/Config.in     | 89 +++++++++++++++++++++++++-------
>   package/strongswan/strongswan.mk | 40 +++++++-------
>   2 files changed, 87 insertions(+), 42 deletions(-)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 368cd1ecc0..8eae568b6a 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -75,34 +75,83 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
>   
>   config BR2_PACKAGE_STRONGSWAN_EAP
>   	bool "Enable EAP protocols"
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
>   if BR2_PACKAGE_STRONGSWAN_EAP
>   
> +config BR2_PACKAGE_STRONGSWAN_EAP_SIM
> +	bool "Enable EAP-SIM"
> +	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy

  This is already inside if BR2_PACKAGE_STRONGSWAN_EAP, so the condition on the 
default is meaningless. Yann said something about this legacy stuff which I 
don't quite follow, since the BR2_PACKAGE_STRONGSWAN_EAP is not legacy. Yann, 
did you mean that BR2_PACKAGE_STRONGSWAN_EAP should be removed (i.e. moved to 
Config.in.legacy), or was it a mistake?


  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
