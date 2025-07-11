Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A844C83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 711FE82A28;
	Fri, 11 Jul 2025 10:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uV0HPp4_hOZy; Fri, 11 Jul 2025 10:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 787C58219A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 787C58219A;
	Fri, 11 Jul 2025 10:44:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31E6C1E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23CFE8219A
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aN8CCwSWF6bN for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD5C68217E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD5C68217E
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD5C68217E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:34 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso1412736f8f.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230673; x=1752835473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbKRvRZr9d4Pru1LHSLBiSZKaFh0TJVPmHMCk/0TQEg=;
 b=eGwbAbPtPEpuZOIU5yXSaM9EPOrO8xFzI96K7jt41U/riCOv+lKbBnWy1FmC2zcv/n
 ABQv7+Vr6fK2EbO8j9OFAZwYIEhE0w7vabVzmuP1W3l834KoLWTuE7Ov7A6NY4kiDgUm
 BLZrjWphDANpA0yr/cay1BpE3pen03p0C1sFCl3fCmKHiwnwb2yF5YBUtBSqyzVapze3
 KdOVFK8dm8ZNEPbUrTK/m6pGNawgqeHU/HLbsK6MJOqHLdcfD+W/BbaJfZuN2/hT5acs
 L3Xvk9RIj1DfjFcAwjqCV+ZtG4JNLCdNEooxExkrXeBhMsyoEyh2rTfQnmQz0+6r4FGw
 B1nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOYWHzBpCxyK388m2BS3ZEBToxJUw9k+aM1A+7gKhKWo37C2usAn1vM5HJVaM+meOrmEmdBbDrYQQ=@buildroot.org
X-Gm-Message-State: AOJu0YzBxNzylKeKM0tW9y2TtxJJ8/w3I4diV4Q8VYCxEFd1ZZbiM3Gb
 MTuaHTpsLO0wZMypt80RuM1WyocilNIAsGFPPX6HVlu17LKXCffU6BnkQ8maikB8+kY=
X-Gm-Gg: ASbGncvFxZISbcyhkQubiBMTS0G6mgl3KL4oMVDaRBkx9+g2QoWmxpgSfKquFdLt9Y3
 mu7lghTx6E2ihAB4/IRu4ehECtQzW4Y7qXOxqyPa8hwoSPmdU4CSr9STrcleZHuM4M6Jree1QNN
 f+QkQuj1sJWVVePNtfbyaOYUIq+8zQtdxTS7HyEgcN/nbCOGHpqy2lRrs0xlNaDepHs+jTZxxac
 MkuPUtVRtohdI8SPedy2bOrf7d2kqiJAFbVQIJSw6nY9T7n6aHPJbjjLhQmiz+9VUqNjA8vXKoL
 LqhRJEkLf+tqW+i+GuZaMzq81kRu9Zb+dihvnFfaoDA8P5qR/2LVJk4Als4YUpTXRXf3c/JwM3S
 CoebZGsGNYshaNC8qyZqyQRV3
X-Google-Smtp-Source: AGHT+IGCY1JYdyVwH/voZNkqn9TxldD0B+0D2vfOITijOZtX517XmBrWt00kB8np8QyHJ+kEqbzU0w==
X-Received: by 2002:a05:6000:2b11:b0:3a6:d92d:9f7c with SMTP id
 ffacd0b85a97d-3b5f187e900mr1905625f8f.9.1752230672831; 
 Fri, 11 Jul 2025 03:44:32 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc1ecbsm4087402f8f.25.2025.07.11.03.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:32 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:31 +0200
Message-ID: <20250711104431.823185-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250701170320.664704-1-bernd@kuhls.net>
References: <20250701170320.664704-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230673; x=1752835473; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbKRvRZr9d4Pru1LHSLBiSZKaFh0TJVPmHMCk/0TQEg=;
 b=XZ0wLnWdD1gs91MpKv5vMNO6NyRYRWBq+2063hN+D2RQYSAhNtRwXw+Iu/tG0hxcR6
 0GtFIMVGu9v2cCCQWJ6AEr5LWvQKrGIMyKQMprljU+RtQctWtHPF2KfaDJbeBFFRscYY
 I4HwORJDIB8/+5h66Qk99L9Eoj7i0Oq0CGbXsRnMbzV3BGSYuwcDS+maRd0WzlAyHIQh
 RJEOe4UqUrnXCPMMEdZYm1DSU+6w2wAqTkDPsa+kKgQRrOkkr2Fo4f83/wFc/ZpmWH/O
 upEw4YK7QckZod4aHzFUrvoDcsofXRaQhjk23fCVxyln7xLq+j0RuMTggp/21SPREXLf
 LABw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XZ0wLnWd
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 15}.x series
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  linux/Config.in                      |  2 +-
>  linux/linux.hash                     | 14 +++++++-------
>  package/linux-headers/Config.in.host | 14 +++++++-------
>  3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 3dcdbd5128..83184363f0 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "6.15.3" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.15.4" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index db1da163a0..254682d009 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,12 +1,12 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  12b50c89925438d9cd7385a0cafc9c433e6562ac5df00a21889fce9f548d65b0  linux-6.15.3.tar.xz
> -sha256  a7f3fe381f67eca4172e9b63efb61a14bd7f9e1278e03603d0ff5a93f270c24d  linux-6.12.34.tar.xz
> -sha256  713981ea26b20b476ba4ce880b76b21294576788d5db1c2188b167bcb06ecc56  linux-6.6.94.tar.xz
> -sha256  bc3c45faf6f5f0450666c75fa9dad9bc7c0cf7c7cba0dbd94e5cfdc58229c116  linux-6.1.141.tar.xz
> +sha256  0eafd627b602f58d73917d00e4fc3196ba18cba67df6995a42aa74744d8efa16  linux-6.15.4.tar.xz
> +sha256  05f4e0b01dde578c3328eb539d305cccec7b84e939f6dd5f21fdaf5f313da748  linux-6.12.35.tar.xz
> +sha256  18640ae9a2c952f8f8868324378df1a9e138ad29e6b93a9c38155764ea67ea85  linux-6.6.95.tar.xz
> +sha256  dcd26ea135c96bddbb17131f96176bca1a9268ea0e1cb96dfb7d6970780fa3aa  linux-6.1.142.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  3d03eb798910f32929f7fda5a56e4bb1a121f10bde320d6f3063639c009313dc  linux-5.15.185.tar.xz
> -sha256  07c852940dc2dc03fe84f7fcf697648d7cba11c62d20504380492ba07aa46bb6  linux-5.10.238.tar.xz
> -sha256  c879d0ba817aaa0fde318d58d7e1f141d9c29bd8569a96b73159ebc448077b99  linux-5.4.294.tar.xz
> +sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
> +sha256  2dfa422b6bbe65a6b352a38129d27de918c3f0f05c72ecdd39d46d657ca0f0db  linux-5.10.239.tar.xz
> +sha256  c48158f7735668aac78b9d74bb3616f57a4ea0816ca09f7db83f7834d705b6a9  linux-5.4.295.tar.xz
>  # Locally computed
>  sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
>  sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 8a27e52c4c..2a8b2a863b 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -444,13 +444,13 @@ endchoice
>  
>  config BR2_DEFAULT_KERNEL_HEADERS
>  	string
> -	default "5.4.294"	if BR2_KERNEL_HEADERS_5_4
> -	default "5.10.238"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.185"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.141"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.94"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.34"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.15.3"	if BR2_KERNEL_HEADERS_6_15
> +	default "5.4.295"	if BR2_KERNEL_HEADERS_5_4
> +	default "5.10.239"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.186"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.142"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.6.95"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.35"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.15.4"	if BR2_KERNEL_HEADERS_6_15
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>  	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
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
