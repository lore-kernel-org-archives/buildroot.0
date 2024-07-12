Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A18C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5D2684658;
	Fri, 12 Jul 2024 22:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0O1nhN82jx36; Fri, 12 Jul 2024 22:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73DA483FF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73DA483FF8;
	Fri, 12 Jul 2024 22:18:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECBA81BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D71F040351
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoUfSzUI7uQG for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:18:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C3E14034C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C3E14034C
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C3E14034C
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:18:39 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-36796aee597so1438495f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720822717; x=1721427517;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Cbofc3iWTHdSo2CmFKeb4jrw0H9iieBRE0CI7FgIGY=;
 b=o6cwOtJqWQ8gQNepCkj0ktIPOVI62wga95NFGyvx6HhYB7NK/HlvVlaWpOaUDCTm6V
 DuicW1OooC0vQbGgX4I2zgHCvSdV7utkK/lwTiBqksVnjSaYwhMUVOQsZHlCfFvVjBg/
 OXR+na1SQDrCzMYxKrUuK1l+BCmuke8tIkweRfhJz8Z1S1whEYX5xrFXfmAaN5fzkFOi
 n2i/O0KS8tA3BjHgb5vok6xoXGhQvHlLm82C7hlAVKM66SCnFDsshT1d5+4S8H30XfgU
 OT16noeMYYjsK/Gg9Bcbot+0T0i/x+8tZsgUgt6R2HyhfW59zfa5a8e609rCm9/vuNuR
 qRBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAuSULfSDrhDHtkLS0GsVZpP8QRQVHWmbDT1QCBhrJ27XORUeNBfrit95f+aj0G6rFuvDsWl/4ozOjB3a4IFtzlkw8BiTd2Q==
X-Gm-Message-State: AOJu0YzhETAC4E+D/1pegDSR+soBDneR3/k2PXSYxnfZHuhoOMBlyx5J
 /AMYZJORxmnQvRZRkVhqgbQjH42r8COZOPcpvtuQdGFfHqOAJnLrssohu3IQbdm+kgqgmr4Tsdd
 HP0I=
X-Google-Smtp-Source: AGHT+IGPraM7fPtEN8r/ZlviPi1b0JxDGoZC0/DICIcWHO26NaqTW89EuHIBsWd2ks5n0eQTWt1KSQ==
X-Received: by 2002:adf:eeca:0:b0:35f:1dce:8671 with SMTP id
 ffacd0b85a97d-367cea6b80fmr8390667f8f.25.1720822717197; 
 Fri, 12 Jul 2024 15:18:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa078fsm11072639f8f.71.2024.07.12.15.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 15:18:36 -0700 (PDT)
Message-ID: <3a11ac96-136d-4df3-a3a8-c5418d6277c1@mind.be>
Date: Sat, 13 Jul 2024 00:18:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231002165235.346092-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20231002165235.346092-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720822717; x=1721427517; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Cbofc3iWTHdSo2CmFKeb4jrw0H9iieBRE0CI7FgIGY=;
 b=ImKd5DdzVU67tccVHDMfokcdNLZ2RUi1qZRl+kAp2dKvVw5zsYMl9CeKAIQwj/Hwu0
 AC3bDBErRYSXFRd9YxvyprWALe0lz2FaLTeiNB/Zeji8e2+l5cOvOnnOCbVXpVOlD1ot
 I6MBA1xXGSJ/zcXCl0Vw/IiPE8EUcWBLB/dVqWM3o64h5srtgP2y4dkWJNJF9pejcNcs
 pVLE2z7KQTVC7uOi/1hVX/yjdbHLTRC/7OcFDnODtN2Pqv3RbVGk86lU6LbrzERY7bbX
 Q2vrzADUsb+bal7DtaSUWY8LY8awWc7jxQIZOvX5yv3uxBl0cghB5rDOdVwfr0N/CxwG
 Oigw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ImKd5Ddz
Subject: Re: [Buildroot] [PATCH 1/1] package/sunxi-tools: sunxi-fel needs
 dynamic library
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/10/2023 18:52, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version
> 1.4.2-168-ged3039c in commit 2e330dff6a7ce7965ceb0dccdc9dcbcb329167bb:
> 
> /home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: attempted static link of dynamic object `libfdt/libfdt-1.6.1.so'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6788d86c10d551b3d617e33c85083b817eb5d0b2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sunxi-tools/Config.in | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
> index 14f7da5bf2..16550f4e55 100644
> --- a/package/sunxi-tools/Config.in
> +++ b/package/sunxi-tools/Config.in
> @@ -23,6 +23,7 @@ config BR2_PACKAGE_SUNXI_TOOLS_BOOTINFO
>   
>   config BR2_PACKAGE_SUNXI_TOOLS_FEL
>   	bool "sunxi-fel"
> +	depends on !BR2_STATIC_LIBS # dtc
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
>   	select BR2_PACKAGE_DTC
> @@ -33,8 +34,8 @@ config BR2_PACKAGE_SUNXI_TOOLS_FEL
>   	  fel mode. This allows do download code to memory and execute
>   	  it.
>   
> -comment "sunxi-fel needs a toolchain w/ threads, gcc >= 4.9"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +comment "sunxi-fel needs a toolchain w/ dynamic library, threads, gcc >= 4.9"
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   
>   config BR2_PACKAGE_SUNXI_TOOLS_NAND_PART
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
