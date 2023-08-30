Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB0FC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D6676126D;
	Wed, 30 Aug 2023 20:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D6676126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axFqVsusnj8k; Wed, 30 Aug 2023 20:02:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC0946128C;
	Wed, 30 Aug 2023 20:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC0946128C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2ED3B1BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0681341786
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0681341786
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8wvF5Xm26oS for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:02:37 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC104402A8
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC104402A8
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so3575966b.0
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 13:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425755; x=1694030555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dVvV67Gyrjm3FCPtIOiLYakXr2CFnvX3pIU7rRp3Kl4=;
 b=YbcPlq3UmkbfYfEPzs7Uz4WPsB/9cPvagrMOBDVQbj6MVRVCGf4UcDP0y5ZidzBjP0
 42C1VEh62DuhqXlsdG27ilfgMomS8W7ersSXJLuBR7MnXrSKyNjeDIPHzXRELdspF2mL
 dcjRJuqZX4MJSFbFibPN2LuX3zvTZIo164Fs63xW+VR1I7JRPmITlf/K45JmJyWH2UPY
 DiSpccikbGcoIXp3oviGpWR+gqIIdFNTf8/rUTaFbrgpHi4QcAk0sEj1uPr8pRrXiWi8
 LIrKnGw/NdlrOdbOBJooYY7sbfVfLv6VNEnJ8WusbS2oAehtz6vK6v2UjX0d24fuvoy/
 2t4g==
X-Gm-Message-State: AOJu0Yzay2QH1l//EQr0EQkpurv+f235fOCAyHZ7vxU9efY6UTs2lq1K
 qkx8iNfMg8puOUrpObG400GkgA==
X-Google-Smtp-Source: AGHT+IFmGcJzleL5F8n81a3Wxt3GBL0BF3bCYEa5CxOT6c8ca5aMBbis4j26yce2GCQeO1bKVnkBQA==
X-Received: by 2002:a17:906:3287:b0:9a1:ca55:b668 with SMTP id
 7-20020a170906328700b009a1ca55b668mr2436975ejw.59.1693425754831; 
 Wed, 30 Aug 2023 13:02:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 oy25-20020a170907105900b0099364d9f0e6sm7496403ejb.117.2023.08.30.13.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 13:02:34 -0700 (PDT)
Message-ID: <4eff133c-6673-7fcb-29eb-16c13c3cd635@mind.be>
Date: Wed, 30 Aug 2023 22:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20230830155926.2831345-1-aduskett@gmail.com>
In-Reply-To: <20230830155926.2831345-1-aduskett@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693425755; x=1694030555; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dVvV67Gyrjm3FCPtIOiLYakXr2CFnvX3pIU7rRp3Kl4=;
 b=HAavTrbgCx5DocAb24xeUY4Vj68wixVQbUEz9P4klx5DHSnTvV9whrbhQywHgvjUH1
 cqgumuGgKQUdRRYhWEnzda3QWNxBAxtnVBkVEMZ1LNEfJmOkLnlPToGWA1AIkdhIXdU3
 /sIyL2E45msURRm4QPuj5oKGu7N/VZdY/2nKsM0g2s0hcrxWECqqfFaLIm21UoCHfhQe
 HSDD15usncl+AtFMTfcaTTPihcTfsnFwTMpX8u1ECZKMdypVFY58Yp57I5eGtdrdKTa7
 sU6x4R9V0u4aspnCxrnQJrYhwDD8/WiCnI2638QVMaTa73B8tMMsHBS3BSy3LOEAIywZ
 u1Fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HAavTrbg
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: security bump
 versions to 11.0.20+8 and 17.0.8+7
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
Cc: Tudor Holton <buildroot@tudorholton.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/08/2023 17:59, Adam Duskett wrote:
> Fixed the following security issues:
> 
> * CVEs
>    - CVE-2023-22006
>    - CVE-2023-22036
>    - CVE-2023-22041
>    - CVE-2023-22044
>    - CVE-2023-22045
>    - CVE-2023-22049
>    - CVE-2023-25193
> * Security fixes
>    - JDK-8298676: Enhanced Look and Feel
>    - JDK-8300285: Enhance TLS data handling
>    - JDK-8300596: Enhance Jar Signature validation
>    - JDK-8301998, JDK-8302084: Update HarfBuzz to 7.0.1
>    - JDK-8302475: Enhance HTTP client file downloading
>    - JDK-8302483: Enhance ZIP performance
>    - JDK-8303376: Better launching of JDI
>    - JDK-8304468: Better array usages
>    - JDK-8305312: Enhanced path handling
>    - JDK-8308682: Enhance AES performance
> 
> For details, see the announcements:
> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-July/024064.html
> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-July/024063.html
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>   package/openjdk-bin/openjdk-bin.hash                      | 8 ++++----
>   package/openjdk-bin/openjdk-bin.mk                        | 4 ++--
>   .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch   | 0
>   package/openjdk/openjdk.hash                              | 4 ++--
>   package/openjdk/openjdk.mk                                | 4 ++--
>   5 files changed, 10 insertions(+), 10 deletions(-)
>   rename package/openjdk/{17.0.7+7 => 17.0.8+7}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)

  You forgot to apply this rename to the .checkpackageignore file as well. So I 
pushed a follow-up commit fixing that.

  Regards,
  Arnout

> 
> diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
> index eb9d7396e3..401e83e75e 100644
> --- a/package/openjdk-bin/openjdk-bin.hash
> +++ b/package/openjdk-bin/openjdk-bin.hash
> @@ -1,10 +1,10 @@
>   # https://github.com/adoptium/temurin17-binaries/releases
> -sha256  e9458b38e97358850902c2936a1bb5f35f6cffc59da9fcd28c63eab8dbbfbc3b  OpenJDK17U-jdk_x64_linux_hotspot_17.0.7_7.tar.gz
> -sha256  0084272404b89442871e0a1f112779844090532978ad4d4191b8d03fc6adfade  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.7_7.tar.gz
> +sha256  aa5fc7d388fe544e5d85902e68399d5299e931f9b280d358a3cbee218d6017b0  OpenJDK17U-jdk_x64_linux_hotspot_17.0.8_7.tar.gz
> +sha256  c43688163cfdcb1a6e6fe202cc06a51891df746b954c55dbd01430e7d7326d00  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8_7.tar.gz
>   
>   # From https://github.com/adoptium/temurin11-binaries/releases
> -sha256  5f19fb28aea3e28fcc402b73ce72f62b602992d48769502effe81c52ca39a581  OpenJDK11U-jdk_x64_linux_hotspot_11.0.19_7.tar.gz
> -sha256  0c7763a19b4af4ef5fbae831781b5184e988d6f131d264482399eeaf51b6e254  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.19_7.tar.gz
> +sha256  7a99258af2e3ee9047e90f1c0c1775fd6285085759501295358d934d662e01f9  OpenJDK11U-jdk_x64_linux_hotspot_11.0.20_8.tar.gz
> +sha256  eb821c049c2d2f7c3fbf8ddcce2d608d3aa7d488700e76bfbbebabba93021748  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.20_8.tar.gz
>   
>   # Locally calculated
>   sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
> diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> index dad846534b..616c8d917d 100644
> --- a/package/openjdk-bin/openjdk-bin.mk
> +++ b/package/openjdk-bin/openjdk-bin.mk
> @@ -6,10 +6,10 @@
>   
>   ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
>   HOST_OPENJDK_BIN_VERSION_MAJOR = 17
> -HOST_OPENJDK_BIN_VERSION_MINOR = 0.7_7
> +HOST_OPENJDK_BIN_VERSION_MINOR = 0.8_7
>   else
>   HOST_OPENJDK_BIN_VERSION_MAJOR = 11
> -HOST_OPENJDK_BIN_VERSION_MINOR = 0.19_7
> +HOST_OPENJDK_BIN_VERSION_MINOR = 0.20_8
>   endif
>   
>   ifeq ($(HOSTARCH),x86_64)
> diff --git a/package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
> similarity index 100%
> rename from package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
> rename to package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
> diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
> index 3b36289628..ba398b84be 100644
> --- a/package/openjdk/openjdk.hash
> +++ b/package/openjdk/openjdk.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256  43b80a5aec5fce908e80858e9b34efdf1b49255a12ce303650325af65141d3e8  openjdk-17.0.7+7.tar.gz
> -sha256  25fd9ab3042a284aa4e6348969403016404bc2706a4a02c149a0054fbe477337  openjdk-11.0.19+7.tar.gz
> +sha256  643ff42dcdf8751e0fee716c1a1914ddc7348b174e871a5eb2636578a181f20d  openjdk-17.0.8+7.tar.gz
> +sha256  b2a37ef209ae7eaf8f34182b7c9aa3252af20a214d02970f96ce62242c805479  openjdk-11.0.20+8.tar.gz
>   sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index 39d461a87c..d1a2fa23ee 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -6,10 +6,10 @@
>   
>   ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
>   OPENJDK_VERSION_MAJOR = 17
> -OPENJDK_VERSION_MINOR = 0.7+7
> +OPENJDK_VERSION_MINOR = 0.8+7
>   else
>   OPENJDK_VERSION_MAJOR = 11
> -OPENJDK_VERSION_MINOR = 0.19+7
> +OPENJDK_VERSION_MINOR = 0.20+8
>   endif
>   OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
>   OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
