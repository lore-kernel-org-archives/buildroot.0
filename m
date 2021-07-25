Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F84C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:21:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5900C60E0C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5900C60E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C9660670;
	Sun, 25 Jul 2021 16:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etAUUm-4knQO; Sun, 25 Jul 2021 16:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B64360672;
	Sun, 25 Jul 2021 16:21:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 739771BF2B4
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 632F1606F0
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 554t7UZwvigd for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 16:21:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C92960670
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 16:21:11 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id nb11so12396174ejc.4
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=488hN7fg6z4JUFFRZBAqgnYOoaXwG0XaMpA2bU6SBEg=;
 b=AqW1VeQ6EjgpfDJEMARhQHalV9oNj4Ra7ZKq3WUOSE9Y2xnCe/qZ9wUnGSySslRZjO
 Ezew1J2P/o6vlfUP8GfOcMppkJfMefkrx4YMpBbygTcnRphMVa2uhlS0AvUnawV5abS/
 Rqh/XUcfzIpWx5sn20O6GKvjhJcnfkKI/AKvNwspK7N0NH0P4bVmp1pBWoxkEZsTD+4+
 ye1rld3RFswmphowcOdwsZma2hw3kFpKEDtIgIYb+e18bPdwQW1oxRvgRgzbhoSDh3ci
 jUng/fewOg7fkOPKYtaOgNXe760pdAoBeuR897welrt6/75cx/oeImRN/x1pW7e1CYi6
 fwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=488hN7fg6z4JUFFRZBAqgnYOoaXwG0XaMpA2bU6SBEg=;
 b=VE9CzcqilyGF52Yxh3yLWxaYp6n54LZSf/kqnjGfi7YIBKSOFUtuE59ZaFfTezDUhD
 tRZtDlnk+HEm0vVdSPTkfQjzs0U4gnPOK84eSNJKb1GEM0YPEf/lZoSN0pgZE4zvnO1X
 WMtssHWDkzG+pm/DAz1nYjWVz/XbBgejOAv47ySpUl/folFYxwMLj7pWKywYavVVOUA4
 V8zfhXDIO08lZUEaFVElv1oT2n/vzEdGP3G5VrREqnnh300+SBtaSVU83sVvwQcVraMy
 doxyHdD5AkwE7l9fSNPPOZPAUJzarOnbJh2jB2Pqy0iC0WH0LCjZzPZQFnYY2usuIdYj
 31KQ==
X-Gm-Message-State: AOAM532pwhnizfKP9vXPBK9fnKxiSIIbnp/K9ZbwWCxVkzhs4InpGHVx
 RS3Zn78SkAs0R+sdBLdWKn5ayQ==
X-Google-Smtp-Source: ABdhPJx1HQelOAiGszfHrC2iGOFRn/uiI5VuzE801WQIAl1PmXwm1ZvpYgzT6LUQt4pPl08gf2eAKw==
X-Received: by 2002:a17:907:3f9a:: with SMTP id
 hr26mr13525254ejc.110.1627230069565; 
 Sun, 25 Jul 2021 09:21:09 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ec38sm18042357edb.15.2021.07.25.09.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 09:21:09 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210718204406.899038-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <6cd7e12d-3bcf-f177-650e-441f5a322e7c@mind.be>
Date: Sun, 25 Jul 2021 18:21:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210718204406.899038-1-james.hilliard1@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v4 1/2] package/libtirpc: Add optional
 GSSAPI support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 18/07/2021 22:44, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 Both applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v3 -> v4:
>   - rebase
> Changes v2 -> v3:
>   - use krb5-config instead of -lgssapi_krb5
> ---
>  package/libtirpc/Config.in   | 8 ++++++++
>  package/libtirpc/libtirpc.mk | 8 +++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> index 2e9c939fa8..1899edefbf 100644
> --- a/package/libtirpc/Config.in
> +++ b/package/libtirpc/Config.in
> @@ -7,5 +7,13 @@ config BR2_PACKAGE_LIBTIRPC
>  
>  	  http://sourceforge.net/projects/libtirpc/
>  
> +config BR2_PACKAGE_LIBTIRPC_GSS
> +	bool "gss"
> +	depends on BR2_USE_MMU # libkrb5
> +	depends on BR2_PACKAGE_LIBTIRPC
> +	select BR2_PACKAGE_LIBKRB5
> +	help
> +	  Enable GSSAPI support
> +
>  comment "libtirpc needs a toolchain w/ threads"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
> index 31be113965..4b385b7003 100644
> --- a/package/libtirpc/libtirpc.mk
> +++ b/package/libtirpc/libtirpc.mk
> @@ -18,7 +18,13 @@ LIBTIRPC_AUTORECONF = YES
>  # getrpcby{number,name} are only provided if 'GQ' is defined
>  LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
>  
> -LIBTIRPC_CONF_OPTS = --disable-gssapi
> +ifeq ($(BR2_PACKAGE_LIBTIRPC_GSS),y)
> +LIBTIRPC_CONF_ENV += KRB5_CONFIG=$(STAGING_DIR)/usr/bin/krb5-config
> +LIBTIRPC_CONF_OPTS += --enable-gssapi
> +LIBTIRPC_DEPENDENCIES += libkrb5
> +else
> +LIBTIRPC_CONF_OPTS += --disable-gssapi
> +endif
>  HOST_LIBTIRPC_CONF_OPTS = --disable-gssapi
>  
>  $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
