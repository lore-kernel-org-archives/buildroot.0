Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDC3C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 449D582252;
	Thu,  9 Feb 2023 20:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 449D582252
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xArrVZgNIvm0; Thu,  9 Feb 2023 20:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8956382246;
	Thu,  9 Feb 2023 20:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8956382246
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BCBF1BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFDA3408A2
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFDA3408A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqDAoSQv-UCa for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:22:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C7BE4089E
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C7BE4089E
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:22:39 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id c26so5221820ejz.10
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 12:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Zl3k8o5oQei37PQ+awMZdYgpGt0VBK9cKCVtYGi/SY=;
 b=MOqdBTxu2kAex8H7/1J0tLFIrCivYiH04M58iu+G3RoEVogkMDdpVlon17bb/FgM8x
 T5AHnXyak7MABjmQsjLj/vymu5yU16R/O6hvkWhKZ5h+/tROwYcZaFG0iCKsM7wnH81l
 Xu6SHbXag3ZtpQTneQMgVYyjEB5Rp/g45B56MdaE6Yno9zSAHVj5CY1WtwlTs2R0NDo9
 CFOElTExTkqagcWPiozktz5jBjDIDyCFYTbvacbOUbm+8I495H6S8SannZc3rbuRpmAv
 qUoG5ZFOZu3pG4KaH00OhfmSIyZGoM5WZs1hGXgK/IBQwiTVfSI8SyLUT/1Az9JXjZ9N
 SM+Q==
X-Gm-Message-State: AO0yUKVEQqhR5Ob0Of0Wo000yVEVpx7RlKNUGIYe7UWvQ4hgVvedyUUn
 7jZPMAYyHkKGKfeJtgObUxbTNl6RVXGliTP1
X-Google-Smtp-Source: AK7set/d5Nm3AlzqrHEOBywk6L1FjaEVdphhPAJOaZ2fatGp7eJJkRXNurYn4Pmk+xaBz37u6mTlkQ==
X-Received: by 2002:a17:906:e259:b0:885:5e22:c038 with SMTP id
 gq25-20020a170906e25900b008855e22c038mr13911828ejb.33.1675974157911; 
 Thu, 09 Feb 2023 12:22:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906368b00b0088519b9206bsm1291585ejc.130.2023.02.09.12.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 12:22:34 -0800 (PST)
Message-ID: <8fe20693-4bf1-4378-d7c4-d81bcd9cf7ed@mind.be>
Date: Thu, 9 Feb 2023 21:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: James Kent <james.kent@orchestrated-technology.com>,
 buildroot@buildroot.org
References: <20230208182731.15752-1-james.kent@orchestrated-technology.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230208182731.15752-1-james.kent@orchestrated-technology.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Zl3k8o5oQei37PQ+awMZdYgpGt0VBK9cKCVtYGi/SY=;
 b=bV1XPADLImlweTA46kgO3rXb30+xqhhaqAGNyPda3/ZO9c0FWgv+yvYWwqRFSzDJhv
 cR93U+CM68HrQqYr6/OtbEyLPwC4CuzG2SH3daUdugGHZOpk/wgEyCYHI0qQ/HsEwLny
 pJNuGsz9RurXNRnfCuzgHqZxnqtJ3ZTy/chhY/fUvCUZnDLOse0V4Hr5mGFqmA7+3ioY
 QnrrCcZ6Kq2S3gFepz3iu4dfCcvHtEClr1gcrT72lxFFX7+609YhIALCOJ6WCEWUftBy
 siyemGe6Qme1TpN68oPcUoDGP0ShQwz1Lm1SWkJWZrumjWHaLWLSUeGXXXlgIFny+50f
 FtRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bV1XPADL
Subject: Re: [Buildroot] [PATCH v2] package/chrony: add default unprivileged
 user option
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
Cc: yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

On 08/02/2023 19:27, James Kent wrote:
> Configurable option to define and enable by default an unprivileged
> user which the Chrony daemon will assume once initialised. The
> functionality requires libcap which is selected as necessary.
> 
> This option supports the good security practice of dropping elevated
> privileges for daemon runtime.
> 
> The package configuration layout has been updated to current working
> practice.
> 
> Signed-off-by: James Kent <james.kent@orchestrated-technology.com>
> ---
>   package/chrony/Config.in | 12 +++++++++++-
>   package/chrony/chrony.mk |  8 ++++++++
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/package/chrony/Config.in b/package/chrony/Config.in
> index 158dc20530..0ba14c6aef 100644
> --- a/package/chrony/Config.in
> +++ b/package/chrony/Config.in
> @@ -7,10 +7,20 @@ config BR2_PACKAGE_CHRONY
>   
>   	  http://chrony.tuxfamily.org/
>   
> +if BR2_PACKAGE_CHRONY
> +
>   config BR2_PACKAGE_CHRONY_DEBUG_LOGGING
>   	bool "enable debug logging support"
> -	depends on BR2_PACKAGE_CHRONY
>   	help
>   	  Enable support for debug logging output from Chrony when
>   	  enabled at runtime. If disabled, code for debug logging will
>   	  not be compiled in.
> +
> +config BR2_PACKAGE_CHRONY_USER
> +	bool "chrony default unprivileged user"

  Is there any reason to do this conditionally? For all other packages, we do it 
unconditionally.

  Regards,
  Arnout

> +	select BR2_PACKAGE_LIBCAP
> +	help
> +	  Define and enable default unprivileged user for the Chrony
> +	  daemon to run as.
> +
> +endif
> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> index 379e95a778..16f8f082a3 100644
> --- a/package/chrony/chrony.mk
> +++ b/package/chrony/chrony.mk
> @@ -21,6 +21,14 @@ CHRONY_CONF_OPTS = \
>   
>   ifeq ($(BR2_PACKAGE_LIBCAP),y)
>   CHRONY_DEPENDENCIES += libcap
> +
> +ifeq ($(BR2_PACKAGE_CHRONY_USER),y)
> +CHRONY_CONF_OPTS += --with-user=chrony
> +define CHRONY_USERS
> +	chrony -1 chrony -1 * /run/chrony - - Time daemon
> +endef
> +endif
> +
>   else
>   CHRONY_CONF_OPTS += --without-libcap
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
