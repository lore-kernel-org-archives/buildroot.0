Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4480CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A758840350;
	Sun,  7 Apr 2024 19:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AESa2FOcme9w; Sun,  7 Apr 2024 19:53:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB21540B25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB21540B25;
	Sun,  7 Apr 2024 19:53:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DD201BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4831E60A87
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niWSFNmjMR2T for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:53:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 902C160A65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 902C160A65
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 902C160A65
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:53:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4162b8cb3e9so33215995e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712519593; x=1713124393;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5WwEPZSKXqkzh7ifPTSVGA/lSoNLhkHHGIn0yomIA0Y=;
 b=u8VN+zctRkD+RJcMBqjRekSoKBe+rjsYG3g3qukbXh9pZ27IPspSQbqADh+GgjAClX
 Ar7zjLq9OcSvnd7/AEQbf55KkqpQkAmIbSqOvcJArMqKiZ6HQFHAJl/AFjCdNUHE5Woq
 Ll+Vy8K4DNvxTROjrhWgocccqVN9l8o6nmtUD+OLB7892XEAxyPGIGdgMQz46dnRQhmq
 Uy6SQ14805KC7yBaJbiPzZFzgIFNZ6GTzrXCBJsBtrfMyMa3u02xK6eAX5XRoGTu1kXN
 moDhOX/iX35+3UPzK3anL4NMYAGuVd2hJ52P6DWDZmmYWUZ2Yeh+hkO2JlcY6eQylZpQ
 9VaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgh+XjNB+7eeOlTNFby9GfdE1RJg8pRxSff0p+HCZYnef/wQnSGoZRUmkWNP62ULX3pKAIet5BsWycKVjlY/fPNXczvke++A==
X-Gm-Message-State: AOJu0YyJlDC4oCFX6czzf0G5PEFPrgxq9Z02LJljEEgUAwgdvuicfZcC
 QHlF/UabgXTyCD1W9B/iD/kCOKn/1TI4n5+bEQnPSSqFzLwauRinI9TIWh1Vx5QmuDgUwL+ceTp
 U
X-Google-Smtp-Source: AGHT+IGOojas0ur6edSxkiVY/7hIqbwJNMj6xbrQmrTvN8AaQVPzGZu4j6I5NyG/LczlUACwyWt8Zw==
X-Received: by 2002:a05:600c:4e0f:b0:416:7b2c:def0 with SMTP id
 b15-20020a05600c4e0f00b004167b2cdef0mr55760wmq.5.1712519593521; 
 Sun, 07 Apr 2024 12:53:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a05600c1d0b00b0041645193a55sm5134820wms.21.2024.04.07.12.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:53:13 -0700 (PDT)
Message-ID: <10f6eb6e-fc38-457f-980b-a299716485b0@mind.be>
Date: Sun, 7 Apr 2024 21:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-3-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20240407103512.1112712-3-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712519593; x=1713124393; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5WwEPZSKXqkzh7ifPTSVGA/lSoNLhkHHGIn0yomIA0Y=;
 b=beK0q+6G3xB+XOvbgKNIRtbRsWDFYTY32fcThjXXjiUMZOwvaYmu4kE6rQwBLcwZXy
 GlRlLxFBQuG6fZSd9qU5EsJ16FjMy4ZNwxkX+SNI4b79gJkMWUCQLprnOlqRZcd2QS/N
 X6x3+wTPZ5Jo5VYQkeaqezdu/Tza4NRyX5UUDoJbHmylvE+kpyOjZAcSzSS6ycGmIW4m
 OULYB7y2w5XrGZuvq21dMDRVOIy0T1ZAoEdRisO4ab2nwXX6R7TXkz9Dc8VqGhQZetPJ
 cQZQp4s6Vw3+SIsRUf1NdEXMHQ3SNrxh5oQJwXM3y97Y1v+nZROor5f209SK0BbDgOTq
 fX5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=beK0q+6G
Subject: Re: [Buildroot] [PATCH v12 02/16] board/ti/am6{2,
 4}x-sk: add arm-trusted-firmware v2.7 hash
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



On 07/04/2024 12:34, Romain Naour wrote:
> We are going to enable BR2_DOWNLOAD_FORCE_CHECK_HASHES by default
> to enforce downloads to have at least one valid hash including
> those that use a custom version.

  If we switch to BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION then 
this custom hash isn't needed any more.

  Regards,
  Arnout

> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
>   .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
>   2 files changed, 4 insertions(+)
>   create mode 100644 board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>   create mode 100644 board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> 
> diff --git a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> new file mode 100644
> index 0000000000..74fe35c9bc
> --- /dev/null
> +++ b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
> diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> new file mode 100644
> index 0000000000..74fe35c9bc
> --- /dev/null
> +++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
