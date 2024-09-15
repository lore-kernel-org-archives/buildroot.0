Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C9BC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 09:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B00A3405F3;
	Sun, 15 Sep 2024 09:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apvKK6vRM8rx; Sun, 15 Sep 2024 09:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C113405E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C113405E5;
	Sun, 15 Sep 2024 09:31:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC9BE1BF357
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB1E340173
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmH-Xh2Vkbm7 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 09:31:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37978400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37978400EF
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37978400EF
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:31:53 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-374c3eef39eso2110672f8f.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 02:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726392712; x=1726997512;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jTb0uHR56jSDWyQi8BCQ5eowyLgrUM1jSq9q6AlHfGc=;
 b=XwVg32tOFRUsovSyETCq7u9UBmVqMMR6wZnzQB5i7E3eXeHyg1Hn/xtBecReBBUoj/
 h+Q5oZ5XvPQxs6LjoCBXJJ4jphosgDbiWzQHgp9jBRsUUjoAM7uUZwZixedAfNGEhJCq
 BI1IQYcQnMA0OkJVam2jKcOFpZPBdr73DFWAyVap8fKMLPJ+Jo2J1r+qMNx5HfwjFkvv
 ufRs692ikHp1XSl0qTxKII/Ol1sJ5bm36PPph8kS+lAN5n3dQfSDx4sMm85qtaYOj7HB
 VwX3CyfQ3S/KreZG7Xf/AcsBtSaIVIOLBsTrKaeQV1gvJrwlBym4W/Pra5cJAhp9X2x9
 VBXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAgDVXjErptu7nLelT5ASpXFoGO3A3UDfyuSqH5k3GzKGISREpDVD828u6D9FoWTlmcyYfD0QH8Qs=@buildroot.org
X-Gm-Message-State: AOJu0Yzl5jfjZemD7dLyr+CIJMwyzqyy52juftFyytQqK3xVQx2EsvGq
 vb2DQOL2pazawcSUNFlR0n2mGNyJD/1H+bLBO1HHe6Tg0WXOb6bcSFwhvNLxlZOx4aDY8gJVO6e
 r/Loj0g==
X-Google-Smtp-Source: AGHT+IFt17asUCGv4+5YsXX14sZjREkL+4TgEs/VLKlIGPuGjidS3S+8zBpI9KDIDZy+u9X00FKifQ==
X-Received: by 2002:a5d:6e8a:0:b0:374:bd70:fb85 with SMTP id
 ffacd0b85a97d-378c2d5b321mr6420485f8f.50.1726392711812; 
 Sun, 15 Sep 2024 02:31:51 -0700 (PDT)
Received: from [192.168.197.114] (92-184-117-99.mobile.fr.orangecustomers.net.
 [92.184.117.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e78052efsm4220429f8f.97.2024.09.15.02.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 02:31:51 -0700 (PDT)
Message-ID: <48a35b05-a379-421c-a5b7-147fa50682c3@mind.be>
Date: Sun, 15 Sep 2024 11:31:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20240904085140.1307904-1-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240904085140.1307904-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726392712; x=1726997512; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jTb0uHR56jSDWyQi8BCQ5eowyLgrUM1jSq9q6AlHfGc=;
 b=XLGu9g1f6LtXaFx8rhheZHHnk3o45LZNu5EqQ5/fGc8xOO9InNbYejvFfs4Ftf9n3B
 Asylf9Ps9Fq0vaHoF3biEZVQaRKd2vpVhnsmv0g3SE83hwDyeZxcN3bwVdbECEhisDlK
 Itm1WW/fSXppPdaVLyu0xbcz9zN0LZhA0myQVx+XK37WncwC1rqfUopVZd0lTkq5QpZ4
 +IroEasgLSEiC0H4DeVL++mBbyUa3r0pDXAGMliLCMmZJB2cf4dTzvkCZUcu1SUTJCr7
 wcrRh3mlzPREODUdKcO3xeSisMME7mxIJ8Y3MvTDRR+QOJZRqURiP6tCp0UsQy51bBWj
 OpCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XLGu9g1f
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: bump versions to
 17.0.12+7 and 21.0.4+7
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



On 04/09/2024 10:51, Adam Duskett wrote:
> ./support/testing/run-tests tests.package.test_openjdk.TestOpenJdk.test_run
> passed without issue.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/openjdk-bin/{17.0.9_9 => 17.0.12_7}/openjdk-bin.hash | 4 ++--
>   package/openjdk-bin/{21.0.1_12 => 21.0.4_7}/openjdk-bin.hash | 4 ++--
>   package/openjdk-bin/openjdk-bin.mk                           | 4 ++--
>   package/openjdk/openjdk.hash                                 | 4 ++--
>   package/openjdk/openjdk.mk                                   | 4 ++--
>   5 files changed, 10 insertions(+), 10 deletions(-)
>   rename package/openjdk-bin/{17.0.9_9 => 17.0.12_7}/openjdk-bin.hash (53%)
>   rename package/openjdk-bin/{21.0.1_12 => 21.0.4_7}/openjdk-bin.hash (53%)
> 
> diff --git a/package/openjdk-bin/17.0.9_9/openjdk-bin.hash b/package/openjdk-bin/17.0.12_7/openjdk-bin.hash
> similarity index 53%
> rename from package/openjdk-bin/17.0.9_9/openjdk-bin.hash
> rename to package/openjdk-bin/17.0.12_7/openjdk-bin.hash
> index 29f39c5d36..4a7c84eb87 100644
> --- a/package/openjdk-bin/17.0.9_9/openjdk-bin.hash
> +++ b/package/openjdk-bin/17.0.12_7/openjdk-bin.hash
> @@ -1,6 +1,6 @@
>   # https://github.com/adoptium/temurin17-binaries/releases
> -sha256  7b175dbe0d6e3c9c23b6ed96449b018308d8fc94a5ecd9c0df8b8bc376c3c18a  OpenJDK17U-jdk_x64_linux_hotspot_17.0.9_9.tar.gz
> -sha256  e2c5e26f8572544b201bc22a9b28f2b1a3147ab69be111cea07c7f52af252e75  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.9_9.tar.gz
> +sha256  9d4dd339bf7e6a9dcba8347661603b74c61ab2a5083ae67bf76da6285da8a778  OpenJDK17U-jdk_x64_linux_hotspot_17.0.12_7.tar.gz
> +sha256  8257de06bf37f0c8f19f8d542e2ab5a4e17db3ca5f29d041bd0b02ab265db021  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.12_7.tar.gz
>   
>   # Locally calculated
>   sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
> diff --git a/package/openjdk-bin/21.0.1_12/openjdk-bin.hash b/package/openjdk-bin/21.0.4_7/openjdk-bin.hash
> similarity index 53%
> rename from package/openjdk-bin/21.0.1_12/openjdk-bin.hash
> rename to package/openjdk-bin/21.0.4_7/openjdk-bin.hash
> index 35be28bb4f..a73bea1a77 100644
> --- a/package/openjdk-bin/21.0.1_12/openjdk-bin.hash
> +++ b/package/openjdk-bin/21.0.4_7/openjdk-bin.hash
> @@ -1,6 +1,6 @@
>   # From https://github.com/adoptium/temurin21-binaries/releases
> -sha256  1a6fa8abda4c5caed915cfbeeb176e7fbd12eb6b222f26e290ee45808b529aa1  OpenJDK21U-jdk_x64_linux_hotspot_21.0.1_12.tar.gz
> -sha256  e184dc29a6712c1f78754ab36fb48866583665fa345324f1a79e569c064f95e9  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.1_12.tar.gz
> +sha256  51fb4d03a4429c39d397d3a03a779077159317616550e4e71624c9843083e7b9  OpenJDK21U-jdk_x64_linux_hotspot_21.0.4_7.tar.gz
> +sha256  d768eecddd7a515711659e02caef8516b7b7177fa34880a56398fd9822593a79  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.4_7.tar.gz
>   
>   # Locally calculated
>   sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
> diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> index 0280151fba..17056e80b7 100644
> --- a/package/openjdk-bin/openjdk-bin.mk
> +++ b/package/openjdk-bin/openjdk-bin.mk
> @@ -6,10 +6,10 @@
>   
>   ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
>   HOST_OPENJDK_BIN_VERSION_MAJOR = 21
> -HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_12
> +HOST_OPENJDK_BIN_VERSION_MINOR = 0.4_7
>   else
>   HOST_OPENJDK_BIN_VERSION_MAJOR = 17
> -HOST_OPENJDK_BIN_VERSION_MINOR = 0.9_9
> +HOST_OPENJDK_BIN_VERSION_MINOR = 0.12_7
>   endif
>   
>   ifeq ($(HOSTARCH),x86_64)
> diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
> index 949a62e527..209004a292 100644
> --- a/package/openjdk/openjdk.hash
> +++ b/package/openjdk/openjdk.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256  9943e3814d3c1a31f1449f09a8b67df54841944f855a1d372be892c5e6b19217  openjdk-21.0.1+12.tar.gz
> -sha256  836adb5fec5a58ce2f49a0faeaf9e69a3cb89865f4d855c6098f0264843672ad  openjdk-17.0.9+9.tar.gz
> +sha256  b8b37fa6fcc284d91e7458c703ca4c893a1dd5a6e0f6b9e198e7d13cd8efd24d  openjdk-21.0.4+7.tar.gz
> +sha256  ccb7d37c24f9f5808f9d25419d93680570dc600f292e68944032338cb4b2c51e  openjdk-17.0.12+7.tar.gz
>   sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index f4e1920e6c..446e4aa3c2 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -6,10 +6,10 @@
>   
>   ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
>   OPENJDK_VERSION_MAJOR = 21
> -OPENJDK_VERSION_MINOR = 0.1+12
> +OPENJDK_VERSION_MINOR = 0.4+7
>   else
>   OPENJDK_VERSION_MAJOR = 17
> -OPENJDK_VERSION_MINOR = 0.9+9
> +OPENJDK_VERSION_MINOR = 0.12+7
>   endif
>   OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
>   OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
