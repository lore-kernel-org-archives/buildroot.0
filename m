Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462EFC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 18:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10146405C6;
	Sun, 24 Mar 2024 18:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPlL-ZFoICvt; Sun, 24 Mar 2024 18:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4592405C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4592405C8;
	Sun, 24 Mar 2024 18:19:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5C8F1BF364
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A30B26072A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgXcmX4W-dxG for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 18:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99B6360709
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99B6360709
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99B6360709
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 18:19:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-414866f92beso3495235e9.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 11:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711304383; x=1711909183;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1rOvhazaeusSmGUwfxFx5L7dC91cEd4j4XwRz64jPUI=;
 b=BwD7OkNc/8hd1hAulxywVedoLm7umgaMX/PebNaAUXPLg1zcoAeJYeaSzoWDvizCx0
 SBTCijmC9ssd+33balz9fdgMlQxAfFLq0OsqTFI2LOU+8WGI38q8HG6u4dF3VDbluFWc
 d5ObCpnjydaJAPeYjr/m10MPGx4pvCGGvYyl34JLJAKCaP1lrQe7Vdex9HpXEjr/UDzR
 71ODO5WbDsNzhTICKUKmWV0MFyDhGxi297aQoVHIxr7dBVZY5dRhWMqKjS898G8Zre3O
 iIhNLiVRfRZNfRA4VZTpCegth9As3KwvoJvWyrXGAkns0+GHvwM1yEsRcamBRnonytC5
 Ic8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW/4uB/Ni4F/BFOH1vNs3/swdq+/emRBasDBgGj3hT5D6IrJlQTqKV6N8rVSl4WGN9nYTlEL5ry6yKOM31gKcplXRkwnvN1Q==
X-Gm-Message-State: AOJu0Yw52XfHGXcUBj0TXOlM6N6CgSWeQeKkWwE+xbnebg+Ai6jMbpuN
 iO2fUXXFedXPDQn9Oa14Zz10RJ3ubmVOtKJK8o1w464wbn+BPZJSQevjvyK/eoY=
X-Google-Smtp-Source: AGHT+IFdRwnfoVgx9VM+7HFzTW9YexOocHiRf4AQrXDBsTdPpgSehftfGaDiwv03OEg95sHEKfQdIQ==
X-Received: by 2002:a05:600c:3146:b0:413:3160:840f with SMTP id
 h6-20020a05600c314600b004133160840fmr3475236wmo.0.1711304383541; 
 Sun, 24 Mar 2024 11:19:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c3ba400b00413eb5aa694sm5863078wms.38.2024.03.24.11.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 11:19:43 -0700 (PDT)
Message-ID: <fe32182e-5dc0-4e27-8b52-a6908dae4ba0@mind.be>
Date: Sun, 24 Mar 2024 19:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240316084335.20839-1-bernd@kuhls.net>
 <20240316084335.20839-2-bernd@kuhls.net>
In-Reply-To: <20240316084335.20839-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711304383; x=1711909183; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1rOvhazaeusSmGUwfxFx5L7dC91cEd4j4XwRz64jPUI=;
 b=MpW7iXwLQqR2qKKamz0CKW/Wbi7KXoroMdmi6/L+FAA73kVK9EBrUlHoz2n2+LYY5a
 o24aIQMN1lvbyCw/aEohi5UVJk08CwOZ+8qAO2DPSU2QeHbuaJDC2FnG34edTatdiKar
 05d5zXjRag+jBLC254bOkMK4EvhgRnpe0nVnIdOwd6tYtJpH/dBOCBzkK+maFM7YkWN9
 RUoXS0GjA0IeZxa53M7DWSVX1EwnYMfQpYrFDXvKEPcgrnAh4l1uLvHfu3GLioxZ9JQP
 sq/s5wgA3jKV7ANOLcUbm6fO/MX8cMP6NlXIS5Vs5Ibq79sAahYLHQEjw1Z0wqJszhM7
 +63A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MpW7iXwL
Subject: Re: [Buildroot] [PATCH 2/5] package/busybox: disable tc to fix
 build with kernel >= 6.8
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/03/2024 09:43, Bernd Kuhls wrote:
> For details see https://bugs.busybox.net/show_bug.cgi?id=15934
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  As mentioned, patches 2, 3 and 4 are applied to master now as well. Thanks!

  Regards,
  Arnout

> ---
>   package/busybox/busybox-minimal.config | 3 +--
>   package/busybox/busybox.config         | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
> index 1e7ad1d357..5d2a30806a 100644
> --- a/package/busybox/busybox-minimal.config
> +++ b/package/busybox/busybox-minimal.config
> @@ -955,8 +955,7 @@ CONFIG_PING=y
>   CONFIG_ROUTE=y
>   # CONFIG_SLATTACH is not set
>   # CONFIG_SSL_CLIENT is not set
> -CONFIG_TC=y
> -CONFIG_FEATURE_TC_INGRESS=y
> +# CONFIG_TC is not set
>   # CONFIG_TCPSVD is not set
>   # CONFIG_UDPSVD is not set
>   CONFIG_TELNET=y
> diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
> index 6e8bd2799d..cfd16172fa 100644
> --- a/package/busybox/busybox.config
> +++ b/package/busybox/busybox.config
> @@ -968,8 +968,7 @@ CONFIG_FEATURE_FANCY_PING=y
>   CONFIG_ROUTE=y
>   # CONFIG_SLATTACH is not set
>   # CONFIG_SSL_CLIENT is not set
> -CONFIG_TC=y
> -CONFIG_FEATURE_TC_INGRESS=y
> +# CONFIG_TC is not set
>   # CONFIG_TCPSVD is not set
>   # CONFIG_UDPSVD is not set
>   CONFIG_TELNET=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
