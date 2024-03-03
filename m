Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1A0C54E49
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CBD281FAB;
	Sun,  3 Mar 2024 16:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lr5vU6Kbv5ps; Sun,  3 Mar 2024 16:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 379C081FB5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379C081FB5;
	Sun,  3 Mar 2024 16:17:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C02BB1BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADAA460827
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-UqaROoxabv for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A91BA60812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A91BA60812
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A91BA60812
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:17:30 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a4499ef8b5aso213066266b.0
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 08:17:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709482649; x=1710087449;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+IaelBbpoJkl+pILOkazMyi9wicFx5QW9j3LGauAP4=;
 b=fhHbl+WDv7nmsPT90y5qCJZdyv3Bby0sw1YhLhaq5JQThk2PxE2e73MGQ4+1Bdun3O
 A16/ghK0zpybgDmLr4hZRAB5H0hpFNYDaINc7C4nR9kt5FhElGlMS9sTCecXMIRwDDGs
 lXt/U6jRGTdURemN7GhUWcenmED+Xkuvkts62pll60rFPEEhfi7oO/J5KHpsdwua80GR
 O/nePcDN0TNEhGrm6llsuIP8ue50FKIBbxMW0BwiPqbRWwcNQfysM/MxCVRrcVLnagbl
 7aVUI8G7lfxXw/6fGR/utpJzhX97KKDV17aAMHAgOW5AtGGtXfVruGEGDIqHrujZoFC2
 Yf6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxV2Qjnx6F6ngck4FAf657SSVDNstk0oCJtEVz1GwiN8O2L0y3QoF5O8dDUgq6Jxth9lZHZuQwkHk8bYPCJOKc/87+Zq+jGw==
X-Gm-Message-State: AOJu0Yyc6uZl+GqvrDKCZ5GaUdY7b9+6PHjUjJNP9f9LXwz8xoWKtUX3
 0q56QjuZhQlFWwGSfi3IdB1XY9Q+zGsYHZQA3Pw1w0bZKg9ZBU5wHfccs15b9Zo=
X-Google-Smtp-Source: AGHT+IEvqRuZFameEgW27NXUfs8+YOQm8OLpMKU2T7cTaqvqZaw3Bl9sgn0T81kedx10oj9ZY5sTPg==
X-Received: by 2002:a17:906:180a:b0:a44:d6bb:ede0 with SMTP id
 v10-20020a170906180a00b00a44d6bbede0mr2553052eje.55.1709482648665; 
 Sun, 03 Mar 2024 08:17:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 gl7-20020a170906e0c700b00a44e65447f9sm1535534ejb.7.2024.03.03.08.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 08:17:28 -0800 (PST)
Message-ID: <a62e68fa-c940-44f5-b19d-902159def34f@mind.be>
Date: Sun, 3 Mar 2024 17:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240214195858.1796266-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240214195858.1796266-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709482649; x=1710087449; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z+IaelBbpoJkl+pILOkazMyi9wicFx5QW9j3LGauAP4=;
 b=IwMZ79YTQlo6CLqnxQ8hikwu5Hz4uR30bLOAIljn7bOho+WFJKBSNwnETaShOrskRQ
 C+NoafA5sNvu3WLIBUJb89cxlyR0El5i78ScmQIbNa/fCrJPiCl+nC9WBrlo2FOL+SmK
 wQK/maAAhU1C0dNVIhEDJfHfE87rdxXU1ZpV8Crk2B4nkNwqwFmdqxvr5shW94HE562D
 SmJK0CjvJ1w/GNH6eCFqv5lSTZYriyZZUb3/LACiWI3vW8naddBpZY3iOIt5qYo3KqaO
 me5nPX874Eqtj5Xi3nOrMLYKL0rtwJ+aFk7DyBO8+qpd5Mcs1Fo3q16cHwPuATKJpGMZ
 Kc7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IwMZ79YT
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-vaapi: fix
 wayland build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/02/2024 20:58, Fabrice Fontaine wrote:
> wayland-protocols is a mandatory dependency with wayland since
> bump to version 1.22.0 in commit
> 33d4c226e582f6c0086431c4d9154e462cb3cf34 and
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/3c713cc16ee1d374213cb2b47a3127e14e5ff8a5:
> 
> Run-time dependency wayland-protocols found: NO (tried pkgconfig and cmake)
> 
> ../output-1/build/gst1-vaapi-1.22.0/meson.build:111:0: ERROR: Dependency "wayland-protocols" not found, tried pkgconfig and cmake
> 
> Fixes: 33d4c226e582f6c0086431c4d9154e462cb3cf34
>   - http://autobuild.buildroot.org/results/b5e79d4e10fdf24c3fd43ab742d9d14a5d07824b
>   - http://autobuild.buildroot.org/results/ad624cd11d5a1b3346974000ae2b61f4261af02c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gst1-vaapi/Config.in     | 1 +
>   package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
> index a1062097ed..d6a1542ad3 100644
> --- a/package/gstreamer1/gst1-vaapi/Config.in
> +++ b/package/gstreamer1/gst1-vaapi/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_GST1_VAAPI
>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_GST1_PLUGINS_BASE
>   	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
>   	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
>   	help
> diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> index 4b04d1bb72..d934bab233 100644
> --- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> +++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> @@ -39,6 +39,7 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_WAYLAND),y)
>   GST1_VAAPI_CONF_OPTS += -Dwayland=enabled
> +GST1_VAAPI_DEPENDENCIES += wayland wayland-protocols
>   else
>   GST1_VAAPI_CONF_OPTS += -Dwayland=disabled
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
