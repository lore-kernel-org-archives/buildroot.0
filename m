Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E6E1098797
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3942161B96;
	Fri, 20 Mar 2026 15:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kG59DwNrrbEU; Fri, 20 Mar 2026 15:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F7E60A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022113;
	bh=Ai63V85+ViZxHoNRk127IFw9jxMABlGHxjsvR+gkEAE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IPRGvlp6T1D0l/oxzWxL7jbH1FaeR+fbfLsVzCmzD8Y9YfNi9YODJGMOFBtn6aW6+
	 P0K0QPgrfCkMox6XEU2BUvyrQ9LXaGxMEZ3omfOHb41M1ISa+IA3TRbTpi1Lw8fhw/
	 ehP6fCJXdpubLonJEddkst+WUC+Xa6e7WMnYcSL5AmZk1j7hVKIart7JqmiTEy0lg+
	 wXHL2NWyWK5gJ4AHmdIbYoF6EDqXOEg7IY9HTk1/UNhN53SOg3D/hmzPq5Uh+2HkKb
	 +Njh54djyDItgEQFQ8XUbXxUFR/k+yMTVmH4+C/cCGG9FC2dckQpS0T8Dsk4JBNePD
	 kWsf0kRsdYSNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51F7E60A3F;
	Fri, 20 Mar 2026 15:55:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A28FE1B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A01C041EA4
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utbvqvPjFOe8 for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90F3A41E81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90F3A41E81
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90F3A41E81
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso17522505e9.3
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022106; x=1774626906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cwsEGcONSTZwAkO0X9E5Oi+tsvndIBSQTJieDFgk7cw=;
 b=Nqj8PXcC0O1LZQHta1UhgBOOBJ4Up5rJAHunLu68DnRY0Bi8F5k44/3Wv/FevOGSUM
 xmG9Tvh3N8UOnHacMFeb3ZiPgB12WIGYtPoR6mMUasAfvxqL5OrApqegfU/kRmNUO6Ua
 7Rl5EZF/snoTAUJWxDTolmxZNTfUJSS2YFQd7HR//BOULN7xglq5rZQvPMJ3jefHBxdd
 L2eA+deenImtd1Lxut0UXb7AnQFA94QckXNgt3Wg5MxqtfUbcTB63h1QN1W7WfpBqp8J
 t+E9UCn6waHxw/6zDVNfpzs9MGPRkqlavEoBzvljwEf8IE1W4xIuS1B4MwRs26WA7BMj
 tKuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6yENtwmmYGkmLL/qAlTCjldjArPZWZexYXp0eMHYoAET+2VDkXQXe7IFm9noH1fyGHA9RGlQbr0Q=@buildroot.org
X-Gm-Message-State: AOJu0Yw8GGVk6dEuS0hiFgY7vw4o7mpKHS9LaUhV2a5xIZVdwk1F6nH3
 T0aIQIxbDvF9fongujiL0vn/7iMBBi0l7Y6wpk57eN8EOd2k+DaY59YlJH+ArABlUnw30LSqPBi
 F/1DB464=
X-Gm-Gg: ATEYQzwx7PBmaq4Xc5tqgh/HDRWbeLpLUZ8q+H++cLUVPocNXw/CseQpVj9Z471Xv2e
 1aj6Kocn/z3g17EF9Ajk3fYDp8wtWMo7KtjpJJVRMu7v9dc55YxUsF3OEDiZIuyPA7KNU+DG63o
 rvt8HvvrYRz75PZ5Pg0fhCBQ72zJkECLYiOb83V1f/905/MvXU0rgeyZyrYgkENOtL7YwUsgNb6
 Yvr9NdGZiY7RwHYBAf5MB6yT1LEJexI0YmmwijHZbH4z0Qeh9ob8NaQT/QnFLlhjxlw1PYlzGY1
 I4byi8PPDfwn/wnVizLCgUgl/bNlg91G+Ngo8RURc1DcyzjNQRfwshm3tM99M1/R77YaxlXnuil
 6+HBX9viaSmh5wu0kZrcq3rstP8xMiB1wHoJtzlCWWf43kxSywxfUv6Oxyk1/0d3/UB7okG8MA0
 2PCJOGtI0SGvI6fUCd
X-Received: by 2002:a05:600c:4705:b0:485:3af5:7e53 with SMTP id
 5b1f17b1804b1-486fee04f94mr51331195e9.19.1774022106435; 
 Fri, 20 Mar 2026 08:55:06 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b6470380asm6909768f8f.24.2026.03.20.08.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:06 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:05 +0100
Message-ID: <20260320155505.176623-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227215711.1232099-1-ju.o@free.fr>
References: <20260227215711.1232099-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022106; x=1774626906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwsEGcONSTZwAkO0X9E5Oi+tsvndIBSQTJieDFgk7cw=;
 b=GwWBPqECdRXHHRBXR1g7XIjWiQ//BKaJJhMq9Hz9z4goOOMG/XVdPnzcxFaPRMqNrT
 ZXhXBlx7536S/9JYJk+s45REZJyyN8aP2pCfitTfFYQE01DbGCqempXG7dw14Rs4myQR
 SXd+zMSqoH4cx2NvGPSsphvoNzxoTn2efTT8xV6qRDBOqsMHdJ0NNVVWkMDWsfBytnqX
 RzumYh++I8Muz8/xsQRFSESC0SV5nXA60i+VEYMmiL6hL256ca4fyuThCB5vWAvOb1Wn
 znceYD/1oThlHkNXBqj5NLMqNeKIuWOMf2a7Iz+44ZxUxCsDA2Sl+HY5dzjVKTE5Z0+A
 d9Ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GwWBPqEC
Subject: Re: [Buildroot] [PATCH next 1/3] configs/aarch64_efi: switch to
 external toolchain
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
> This commit switches the aarch64_efi_defconfig to an external glibc
> stable Bootlin toolchain, to follow recommendation from [1].
> 
> Since an external toolchain is used, the linux-headers.hash custom
> hash file is no longer needed and is removed.
> 
> [1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  board/aarch64-efi/patches/linux-headers/linux-headers.hash | 1 -
>  configs/aarch64_efi_defconfig                              | 4 +++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>  delete mode 120000 board/aarch64-efi/patches/linux-headers/linux-headers.hash
> 
> diff --git a/board/aarch64-efi/patches/linux-headers/linux-headers.hash b/board/aarch64-efi/patches/linux-headers/linux-headers.hash
> deleted file mode 120000
> index 5808d92afe..0000000000
> --- a/board/aarch64-efi/patches/linux-headers/linux-headers.hash
> +++ /dev/null
> @@ -1 +0,0 @@
> -../linux/linux.hash
> \ No newline at end of file
> diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
> index 3aa649cf9c..2bc6740eaf 100644
> --- a/configs/aarch64_efi_defconfig
> +++ b/configs/aarch64_efi_defconfig
> @@ -1,5 +1,7 @@
>  BR2_aarch64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>  BR2_GLOBAL_PATCH_DIR="board/aarch64-efi/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
