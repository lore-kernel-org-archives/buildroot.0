Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27E2C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74F3E61554;
	Fri, 11 Jul 2025 10:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzwuXy6Nfxjf; Fri, 11 Jul 2025 10:45:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DC0461540
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DC0461540;
	Fri, 11 Jul 2025 10:45:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5B7F1E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C5B440517
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egc5lm4ZDawm for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF4FD404CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4FD404CA
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF4FD404CA
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-454b1d0a115so7020165e9.2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230706; x=1752835506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23ti2XPLT22Cx2sRPwgDKPQhL8SBYujzpzypzQpdTSs=;
 b=ABbtUPJ9Md9UUZ+6rNUS+DENhJo5O8flJkDzW2P5pJv5sowPwF5ENzDYlypW30IHHQ
 /dbhoaJdLEuoWHAZxwUiBUMieMLnfcxg00VtsDlj86sjezcuM58f0zwtaTY+v3dTtazj
 PAVdmxneHFFcb/6wrVLi1z00ZZoDaYbOKASUqSg8WjmA4kMm5ISBFRsFDJBWbO0DSIt5
 OMyxHgAy3g0OLiBtp3acfaYKX7WRl6fYFOkNjVHwvuHQJOqU4jSk5EcUAj9n/rsDD9LV
 nDNg4AYoI+q/mia880F4b1ybuuN5lr0e07+rNh4nRrTgaJBPmh0vio7+2Uw27EXq151c
 pbDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQXtNU3wmccIvVJlvvpUGXe15AGQMwtPLBkTElxY4z+CcI2Jq9yI29JwfzL2RZIYmbMxq3mhH6IWQ=@buildroot.org
X-Gm-Message-State: AOJu0YyZoCq8TtTdwc02di4nsUjeY3ZcCtbOzudIjX9Pr6TIM/b3GjKK
 SxRST32eWRydKIXuqmvjZxhZZG6IZHvbt9TWibpn+XwwqO1tuwmNyhjPtrXWadvPc1o=
X-Gm-Gg: ASbGncu66oKnbJpPl6eLO98/FwPslQgf+Xv2DB6cIWmaK9Bv2hveD22Zfv/kOQyUFpq
 s5aS0UQxuQMDn1Cz9OS+i6vEWDBTfBe6iqHZKMHnUhdzDV1vAlHPc2IIpejFSNVU1Go6TEzvU0A
 duONAVWGavAyf2PYQc7NX8t+aYSU8GD+uGwjMroMpYidCfoioXG9QnEvkd6qqDHoJBUH0c4/tlq
 ReKRYDDGvphoukLRWqv6xuG3IFS+n/ioR1jE+PZU2nHpv13OCgnVTflE9LXTbBNYNKu6jF5khrT
 UFl9AhNvof9wNgrSbTTC8oRXDjfAPvVeCRD1M3+Ydx63bONcc5vEXP+XJGxHSoyl1icI9g68hCF
 yXN5hioRhQXpEZA==
X-Google-Smtp-Source: AGHT+IF6t2/jjmOYeIoDTWvlh9ZyA5eRHa9Xq16DFmlEhF+eRCT2yBiqI88XNlT4ErBuAUrfZkbB+g==
X-Received: by 2002:a05:600c:820a:b0:453:6183:c443 with SMTP id
 5b1f17b1804b1-454ec13beefmr21856335e9.5.1752230705723; 
 Fri, 11 Jul 2025 03:45:05 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cdc6a542sm67362215e9.1.2025.07.11.03.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:05 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:04 +0200
Message-ID: <20250711104504.824570-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250704165336.3647761-1-bernd@kuhls.net>
References: <20250704165336.3647761-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230706; x=1752835506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23ti2XPLT22Cx2sRPwgDKPQhL8SBYujzpzypzQpdTSs=;
 b=cxnDu4RhTxzTcpDYBNmUBLyXBQ7naflDJ0gb/UhrV6zOfjzqtZevmnloJI2IwC+Zf8
 ujnCZBQA0gTOn9esWF9jdeCY0IOWZAXJWb7zAoDl4Rb+9bfEcdDJhnYuQC4XyFyFhGrU
 zh/Lf9PPDjj79xxXaulqEK8eVoNSFs/JzktSZnryAUv5dyE9Qps+bcKA8Dr1ldg0vksl
 N+wqu0bQ5Szw/3nvPnZG3aSGFiNJZ7um1aU8dBzmHssDGyyk//K9LkQkHAL4I2T4OF/p
 E9HjFXsTKtblr6Q0IiCCpUx7HP/Ntgy6xH5J9lrGwygjY1JsxePYKaNLtxZBFPWihk8U
 fp8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cxnDu4Rh
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.20.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Release notes: https://github.com/strukturag/libheif/releases
> 
> Version 1.19.6 fixes CVE-2025-43966 & CVE-2025-43967:
> https://github.com/strukturag/libheif/releases/tag/v1.19.6
> 
> Updated license hash due to upstream commit:
> https://github.com/strukturag/libheif/commit/377a957bd84018f4d27588c989fa5c66935c16ed
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/libheif/libheif.hash | 4 ++--
>  package/libheif/libheif.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
> index 26b21e1897..6c129873cb 100644
> --- a/package/libheif/libheif.hash
> +++ b/package/libheif/libheif.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  c4002a622bec9f519f29d84bfdc6024e33fd67953a5fb4dc2c2f11f67d5e45bf  libheif-1.18.2.tar.gz
> -sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
> +sha256  55cc76b77c533151fc78ba58ef5ad18562e84da403ed749c3ae017abaf1e2090  libheif-1.20.1.tar.gz
> +sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index 4783ada19e..f6e14888eb 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHEIF_VERSION = 1.18.2
> +LIBHEIF_VERSION = 1.20.1
>  LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
>  LIBHEIF_LICENSE = LGPL-3.0+
>  LIBHEIF_LICENSE_FILES = COPYING
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
