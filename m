Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D01C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B7E1410C5;
	Sun, 19 Jun 2022 15:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B7E1410C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pUWXGVatY8C0; Sun, 19 Jun 2022 15:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D14405AE;
	Sun, 19 Jun 2022 15:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D14405AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1BF61BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA158408E6
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA158408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDrzAMtoIR8v for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:42:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B551404C9
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B551404C9
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:42:49 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id kq6so16795536ejb.11
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 08:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hwcS5T7mZDZFl9ZcfDYIzNr3bgf7NJSgNn6Bo5/OHao=;
 b=5ScRA4yyFJ9ORpgZwZ7tstFTrWGg1vXHu2fq/HyUWr01/FPAR9MPArns6wRQLQakoR
 2MBAACGs/Gf3fWYOTJ/sd7Yevo1H7O2M34keO2ovj94ErQ/P1bP9bjOkf1hTSOwcs6/E
 45q3Wa3jwijeI7FwMUhKrm2pIrw1pJH/7mKdeVh4tFM6JAGR/4LbGWeKjlJoGL1gYTgb
 jrFoNp3oqPl1/REqA5q6jw6ndzCafLd7qIt3Cdq9cJfZeR4h1AltPQVvvjn3ySsZRu8E
 8r1mZeR5jlSCGbBFNlfPdFFtiP+pmSJtUtB+UxLNlVjw+keHOlE/cyDkD5zXqCYp/OGI
 Z9lg==
X-Gm-Message-State: AJIora+DKdmU66XATL8X92UhgncTJRaXNlfyPU2RdT64vtun2Vv9Ctdu
 13aagwdEuU+9p3QQRqSq3sdJEA==
X-Google-Smtp-Source: AGRyM1ufdCwakyMVaznOhPejmxQ15pGxoC9wXz9aHfVSnAE61GRfuVITjkfsqQwzh94h8d6WN2GUXg==
X-Received: by 2002:a17:906:8301:b0:6e4:896d:59b1 with SMTP id
 j1-20020a170906830100b006e4896d59b1mr16798564ejx.396.1655653367675; 
 Sun, 19 Jun 2022 08:42:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 lb25-20020a170907785900b006febc1e9fc8sm4704005ejc.47.2022.06.19.08.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:42:47 -0700 (PDT)
Message-ID: <8a43541e-a38b-6ab0-f58f-50958c5fc0a8@mind.be>
Date: Sun, 19 Jun 2022 17:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220612220729.1231925-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220612220729.1231925-1-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=hwcS5T7mZDZFl9ZcfDYIzNr3bgf7NJSgNn6Bo5/OHao=;
 b=ONmZDlkk/e8fnNk6/MGQ2cFLrat5HMQ6i2pOrgtcKbDQKa9M1hguacmgTC4SQA9AY2
 cUn9WDk071hMh+2fB6OtS6S2fbnNG8JYXg+z8v+h+/XGZAFi7rh3x4KCEVrDSEKbvkYj
 4G+dh9gqoZC0JmBisRUR5lGxYmsjTmAsZet8bSOEBMlUvgcQGrHSrf9D78gpyFtOuWf1
 T15IRGTvrBiwTPGgUIBpCHOWLzNYjr4mp1/Zos4MQs7oSHQVsdiS/U9do1bLjz0Rvny2
 UsrnTC+DoG0o5NEat6DmvF8giZ/05wfUnSXrEwJo3f9BNiII/r5+pkrO4L1lSvN9zGYo
 L7MA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ONmZDlkk
Subject: Re: [Buildroot] [PATCH v4 1/3] package/wpa_supplicant: fixing
 "Invalid configuration line"
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



On 13/06/2022 00:07, Angelo Compagnucci wrote:
> Default configuration file is wrong for the default compiling options.
> 
> Fixes:
> 
> Successfully initialized wpa_supplicant
> Line 1: unknown global field 'ctrl_interface=/var/run/wpa_supplicant'.
> Line 1: Invalid configuration line
> 'ctrl_interface=/var/run/wpa_supplicant'.
> Failed to read or parse configuration '/etc/wpa_supplicant.conf'.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied series to master, thanks.

  Regards,
  Arnout

> ---
> v1 -> v4:
> * Enabling the ctrl_interface option when the config option is enabled
> 
>   package/wpa_supplicant/wpa_supplicant.conf | 2 +-
>   package/wpa_supplicant/wpa_supplicant.mk   | 7 +++++++
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.conf b/package/wpa_supplicant/wpa_supplicant.conf
> index 1994a6c739..20e9f7f842 100644
> --- a/package/wpa_supplicant/wpa_supplicant.conf
> +++ b/package/wpa_supplicant/wpa_supplicant.conf
> @@ -1,4 +1,4 @@
> -ctrl_interface=/var/run/wpa_supplicant
> +#ctrl_interface=/var/run/wpa_supplicant
>   ap_scan=1
>   
>   network={
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index c4cfe03371..14f6a6e271 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -184,6 +184,12 @@ WPA_SUPPLICANT_DEPENDENCIES += readline
>   WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
>   endif
>   
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),y)
> +define WPA_SUPPLICANT_ENABLE_CTRL_IFACE
> +	sed -i '/ctrl_interface/s/^#//g' $(TARGET_DIR)/etc/wpa_supplicant.conf
> +endef
> +endif
> +
>   ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO),y)
>   WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_BUILD_WPA_CLIENT_SO
>   define WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO
> @@ -259,6 +265,7 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
>   	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
>   	$(WPA_SUPPLICANT_INSTALL_DBUS)
>   	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
> +	$(WPA_SUPPLICANT_ENABLE_CTRL_IFACE)
>   endef
>   
>   define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
