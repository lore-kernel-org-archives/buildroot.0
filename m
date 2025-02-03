Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ABCC02196
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 15:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B6A960FAA;
	Mon,  3 Feb 2025 15:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D71WX7s4mAnq; Mon,  3 Feb 2025 15:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51C6C60FD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C6C60FD6;
	Mon,  3 Feb 2025 15:17:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4957A185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3660F41024
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dK6XEjkzasje for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 15:17:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0069C41031
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0069C41031
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0069C41031
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:17:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38a8b35e168so2714132f8f.1
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 07:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738595859; x=1739200659;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AID/LCpydIDdTNzN27zhstoUF6/L6Ef3MKfP5DdFM8U=;
 b=cetL2qUBMZuJaXn+w4XjXJyFZM+TCbcUiaHldAOD1C+ts2s05oWbViwszaLWW8vzEu
 4ZzTGvmQPEfzOybP2bnbTKQ4Nt2urv7PYDnZeE5Iqo5P9ql8UelsAGYH0b4YbT8RJ/4c
 VFQIaABoEwS6z3WUy6PTKfTy0iYQ8BekYdC5+MjAzaCVsksk8N6MtkDckHqCMmeu/wBg
 au53hhVxJsCuWYjPA4rk06byFnl2KuHZ1kGj3qg1KwaNaevuPHPQBecP2v4t5cKics8E
 I1O4uHFEyFSvqdyLfJTpzuocHcl+Dy4DyTSFhHwZh1sSFE2LDuYSTBydLuEjOv18XK7a
 ihzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/6Ewl+3DsCYU4BTvIaodXJL2wbOk00adgwdW2kBDWPj6omdINLbI5kc/x8HN09Cm+hsp8fzyJ+oU=@buildroot.org
X-Gm-Message-State: AOJu0YxWwVbwdoPvqi4tORAk8mGgUKwUuPX4Tj3/k2f2Afk4UjR4d93s
 qu6Yzg4Lmw2knyt1l/2tr9QEkvHC34WOiYbq+DULMUq4SknxL2UO8M3L3j048vlWJWknXGlSR+4
 P
X-Gm-Gg: ASbGnctB998Agab/Q+dk/7JPosIWDLZgtSPQfoooauYier8tpP/9mO/TIZv2wiV0LX8
 jcZxo4k4iEqKOhQdL/qRdNNxbktkcN4Le7uUrhHS6yOXfU/mmHlQpFm9+DdoXaWKGFvhUrqxfWG
 8RqV0a3W1JnT+6MRV2RWr/siP+lNx3Hara1mNJ4kMauU/fO30lk4+WwqdaxdN0YY40KnyKbJ0KJ
 WATh5YHh2VjtFUxg/MJ0ePJWQHch3OF6Z7istFpOFlWekV5um7F1RwrzwxPi8gdc0yISc0KusGu
 ADAhwYb8L3cJr43eGokgmjZVEYmZGnCzEotKjjoOBqsAqbs=
X-Google-Smtp-Source: AGHT+IHhTX5LtPyxaAZe6j2G5afDBS5OMicxTQheJUdtau8RX9nio0wgOqG4zZmBERTLUFFfd3IshA==
X-Received: by 2002:a05:6000:1842:b0:386:37f8:451c with SMTP id
 ffacd0b85a97d-38c60f02792mr11259399f8f.1.1738595858750; 
 Mon, 03 Feb 2025 07:17:38 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e6181sm157119405e9.18.2025.02.03.07.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 07:17:38 -0800 (PST)
Message-ID: <776f6a89-4c7c-46a9-95d9-f8b6ab9b1b7a@mind.be>
Date: Mon, 3 Feb 2025 16:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com
References: <20250125221627.3315039-1-neal.frager@amd.com>
Content-Language: en-GB
In-Reply-To: <20250125221627.3315039-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738595859; x=1739200659; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AID/LCpydIDdTNzN27zhstoUF6/L6Ef3MKfP5DdFM8U=;
 b=StPUXlcbc8hmIXrXdtIaFRJkKfK8Itx28ZSpPeez3qjdf7rNT4d1t++LFUAjmyz98c
 B15DT+UDkVhWc85KkAiAI/CSc1sBzngMVWun9hZfCisvOALMEggVf0Gk+cYTl9ImzSCZ
 4zUtOMIgOtKBWRbLeBS+36VRnLeg4BJWsIzPjzafHGeQYX81hqcUp/58rHxBXPeHfcqq
 f/MbvcazTB980psiK9jPlmtRfIFBIkeQQN/RgoPiSJBbfVoDJT0iQkv6YzC6ekgI8YQD
 CAWQ6v7Rr1NKW8Bj1zwFR39XRuomd8Ar3b1H7xRjddW3Kyajzf4UXQN3UD96upnTHU0/
 ntyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=StPUXlcb
Subject: Re: [Buildroot] [PATCH v2 1/4] boot/xilinx-prebuilt: merge hash
 files
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/01/2025 23:16, Neal Frager via buildroot wrote:
> There is actually no need to have two hash files for the xilinx-prebuilt
> package.  As long as the boot/xilinx-prebuilt/xilinx-prebuilt.hash contains
> the hash value for the default version as well as any version used by a
> xilinx board defconfig, a single hash file is all that is needed.
> 
> In the future, when bumping the defconfig files independently of the
> xilinx-prebuilt default version, all that has to be done is the following
> process.
> 
> Patch Series:
> 1. Add new version hash to boot/xilinx-prebuilt/xilinx-prebuilt.hash.
> 2. Bump board defconfigs to new version.
> 3. Bump xilinx-prebuilt default version.
> 
> For this reason, this patch merges the two xilinx-prebuilt.hash files and
> removes the board/xilinx xilinx-prebuilt.hash file.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

  Series applied to master, thanks.

  I've also added Luca's and Brandon's Reviewed-by to patch 2.

  Regards,
  Arnout

> ---
> V1->V2:
> - New to patch series
> ---
>   board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash | 2 --
>   boot/xilinx-prebuilt/xilinx-prebuilt.hash                 | 1 +
>   2 files changed, 1 insertion(+), 2 deletions(-)
>   delete mode 100644 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> 
> diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> deleted file mode 100644
> index fe6963872c..0000000000
> --- a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally calculated
> -sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
> index 048b93dcf4..ddb2cf8bd1 100644
> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
> @@ -1,5 +1,6 @@
>   # Locally calculated
>   sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
> +sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
>   
>   # Locally calculated
>   sha256  7b2074b607264a07347e1a7ef0323229585942793469f34b2cf9628f7623e05f  LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
