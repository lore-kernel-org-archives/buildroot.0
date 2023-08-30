Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203F1C83F17
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACEB660E83;
	Wed, 30 Aug 2023 19:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACEB660E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MT_3IBl3gRqo; Wed, 30 Aug 2023 19:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6BD160BF4;
	Wed, 30 Aug 2023 19:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6BD160BF4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18A511BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2DF860BF4
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2DF860BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p4bNEgyxJWIq for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:41:14 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9725360A7E
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9725360A7E
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so1400166b.0
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 12:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693424471; x=1694029271;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r8pG/qEmsrGYnbOWXxvf+D2TcWEidp5zlYfVkN+QqlQ=;
 b=cvs/L5BNh4s/fUBrXq1UuE3Bho3iDdUIfRHAd1loJGY4q2xMAjYMOHRYsvIBYgYFPg
 Cn5kixfGAfi2aGL3HlM22cOYim7oIjOJa+8wxSdwfW7rnvHnZngjdOWTcvQaGE4NqXNv
 ElMb3uX8iz6w98SfA6lkwKrkhjokZRBcaArmdXDj+QDtFLjBCLL1YUacQZhOfXTRkf8O
 A91e8+N67RZEJQahYr5EZyIZKvjsoDjXFd3vP8+f6Ad+zHhxibns5CYrm4kPj7ty6TMh
 eOoy6yv2Sk4R9bC0cOX0BqjMlfGcYs2QFkbcYWCcH2h6pIn78ZTL09wfeUEspG6oMnQe
 5a/w==
X-Gm-Message-State: AOJu0Yw0IW6O2bczOtaIVeZZzLHlUUvtO+iE8crBRMEOm/rE0HznIU0i
 SqLlkNbZYzXodeaK/hq5+PsA8g==
X-Google-Smtp-Source: AGHT+IGH3GJ8ptlGmXIqsZfZoqtfCn4Q4HEljobbuCpcc+luB1f7sjjYQ9YMR8nS1ZpRMOhOVz4Ylg==
X-Received: by 2002:a17:906:31d2:b0:9a5:d48f:c906 with SMTP id
 f18-20020a17090631d200b009a5d48fc906mr2290089ejf.15.1693424471387; 
 Wed, 30 Aug 2023 12:41:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a17090626c500b009929d998abcsm7492775ejc.209.2023.08.30.12.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 12:41:10 -0700 (PDT)
Message-ID: <4453d5d9-5194-19ac-dbc8-90eae39f6551@mind.be>
Date: Wed, 30 Aug 2023 21:41:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20230830155926.2831345-1-aduskett@gmail.com>
In-Reply-To: <20230830155926.2831345-1-aduskett@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693424471; x=1694029271; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r8pG/qEmsrGYnbOWXxvf+D2TcWEidp5zlYfVkN+QqlQ=;
 b=HRkRZExG7BChXjWGKi5mAhVdsiqGHSawEb7BX7ma5o6Y5dX35SkNdb5H0/kJ24haDb
 W8bvi07lSu6LJPNdBKyQLzExd3/8pMKbXmoRvpHmbD5mHhTFDCKBkSPt1QNX0oy00/U2
 zda1DB7RIIH9MK9lHS5LbZN4dqKnVqDXNPsEbG1d872Li/fxC/Qo7v8Z5Z/m+dUVL8fU
 HYXkvH39khqW0nn1Hu8dxMHBIYC5SI1aTSgQji4lVEO8A/dwF8YtemXNaSv77vo3xppE
 fE2sygfm8lVX1CgsbpYFBwsH9vKoVRBsd/Aj/PHDLOmSFrZ7+9YbBwhUKES3thJjkw2x
 cFQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HRkRZExG
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

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/openjdk-bin/openjdk-bin.hash                      | 8 ++++----
>   package/openjdk-bin/openjdk-bin.mk                        | 4 ++--
>   .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch   | 0
>   package/openjdk/openjdk.hash                              | 4 ++--
>   package/openjdk/openjdk.mk                                | 4 ++--
>   5 files changed, 10 insertions(+), 10 deletions(-)
>   rename package/openjdk/{17.0.7+7 => 17.0.8+7}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)
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
