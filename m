Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAF5CA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9594561C2B;
	Thu, 21 Aug 2025 19:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxnibw-WOwQp; Thu, 21 Aug 2025 19:21:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C79F961C38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C79F961C38;
	Thu, 21 Aug 2025 19:21:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12FA81C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D079B413C4
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9aZAXvLkK36 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD06840D75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD06840D75
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD06840D75
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45a15fd04d9so16588335e9.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804052; x=1756408852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJfmAvSsVhuBByJYE0amkn35udzOrPZrHeeSFMchRW0=;
 b=jNrGhwrhs7FOD3KmAK59bNMYGfcufHUWtUVrQse+T/CtbWJS7Cb++6nWAt91eBUARx
 3bYbcIETz0c4UlPX5sElESs8EF3t+pjgotOc54h0h4PDCohW1hac9ZBPoJF4KFOTnCva
 8KzHbRyc/9tyS/MUjnqR1hHDlNeugH0KcyxFr/HJv5+aWYZq2CH27swsrXHqBrpInK2Q
 CIiWl6oDjO2yip5QETaXD+dag1eCEbKLFZsBRANw6lLC2OVWNKkmNZmQfZGlNYWPwclp
 vSsml6sebcXVQdgVPmRrwkyfp6pNve7tC4wk5ihJ4nhH4SNwdLifW0ja0oEIpNUKVp41
 vb1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtK1gfLcpqQnl+mskPhrVDn0wIUOI5eq3y4GTScLcLmX+CvfpawFLr1vHVwjF0CTqhja8OmDdYlGE=@buildroot.org
X-Gm-Message-State: AOJu0Yw0VkheOBnJ4Bks5mvTRDteC9tsVf0x3p6Blf8uOM1oNaAuCGOQ
 5ggRqetbjP4tcxvUVfaLfw+Ne48/34Tmhe/8YK8LEABxreBbEs4tc/XC8xPo4oQzIo0=
X-Gm-Gg: ASbGncub56CZ0/PLVZLKsuwF2KZlScS6m21Y1lDnkypXTnAj5aFGBKu4Mo7NAlJl360
 ciS/ylOmR5+O9GK6fYCdE/vvAJkzNtI95UMdMIKlWgwuMom/XnGDvfV7AOdi7uqu2DqF5nhQHhK
 IQtJQDw7pUlz9p0+t737BPV67lc1K69SbcpHML2YlDhpYYW0eYIfpzCNid9t1SJYr8oQGN3e/rV
 lChuLewZxUhh7dvGG8JzPVGGFJbyx3Ug1AQTrqQ+PFRqXXtE8uER8qHKS8ZpiWcjDRZKgBFSx6Z
 LLmKEE7EL3OW5PEirQUX18HwT58KYCo34/bf9NaJbnwu3ceOtmdlO6YdIfqek8h5c5JA1RZa6Og
 keJh0bhZYBLG87Q==
X-Google-Smtp-Source: AGHT+IG5EPzp3aTNYBqjm9CqSXYHB2Anx/OxPAb+yAYsxugIB8pCXIPMIFB6vMcitPN47wSoCtgZxg==
X-Received: by 2002:a05:6000:144a:b0:3b7:8ca6:bc15 with SMTP id
 ffacd0b85a97d-3c4b10fdba8mr3296382f8f.29.1755804051680; 
 Thu, 21 Aug 2025 12:20:51 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077c576b7sm12406011f8f.63.2025.08.21.12.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:20:51 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:20:50 +0200
Message-ID: <20250821192050.23777-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810220807.131029-1-giulio.benetti@benettiengineering.com>
References: <20250810220807.131029-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804052; x=1756408852; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJfmAvSsVhuBByJYE0amkn35udzOrPZrHeeSFMchRW0=;
 b=EWwTpLi3aHQAFs6kG/rvHS2IJNLpPYN/rNnTK7k7ikk03aS9nm58mzDQyl1F7eaW5S
 sYDIjSvhdzbkxBYjuL4w5EyKmOimsO02mZy7FpnZhoBPC/u80tDRENT02MvRd7/xGqTC
 7dq3AmDrGNQmLHdYiZM39IwFho0k3icyyWnW3Jz6deMLz0NeMIFtQ0tVeRvLMF5DbeFX
 8d7qYBTNefllDE9TY/ygbGTVXfcWLaQBIf+HeUqroC7FGj8PzHli7rn4zroyKwvfQWFr
 foETLIR9U49/nkDIqNvFmXNHAtYMs3mJHG7Jn/nAIBhveQkk5MiM0CepYdqaKf2Cvl15
 4Rcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EWwTpLi3
Subject: Re: [Buildroot] [PATCH] Update Benetti Engineering URLs to new ones
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
> The company name was changed from "benetti-engineering-sas" to "benetti-engineering"
> to be agnostic to the company legal form. Update all GitHub and LinkedIn links
> accordingly.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  docs/website/support.html                                    | 2 +-
>  package/rtl8188eu/Config.in                                  | 2 +-
>  package/rtl8188eu/rtl8188eu.mk                               | 2 +-
>  package/rtl8723bu/Config.in                                  | 2 +-
>  package/rtl8723bu/rtl8723bu.mk                               | 2 +-
>  package/rtl8723ds/Config.in                                  | 2 +-
>  package/rtl8723ds/rtl8723ds.mk                               | 2 +-
>  package/rtl8821au/Config.in                                  | 2 +-
>  package/rtl8821au/rtl8821au.mk                               | 2 +-
>  package/sunxi-mali-utgard-driver/Config.in                   | 2 +-
>  package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/website/support.html b/docs/website/support.html
> index 9c44980e67..81f7e863e0 100644
> --- a/docs/website/support.html
> +++ b/docs/website/support.html
> @@ -139,7 +139,7 @@
>  	    <a href="https://www.amarulasolutions.com/services/integrated-system/">
>  	      <img src="images/amarula-solutions-logo.png" style="max-width:200px; margin-right:40px;"/>
>  	    </a>
> -	    <a href="https://www.linkedin.com/company/benetti-engineering-sas">
> +	    <a href="https://www.linkedin.com/company/benetti-engineering">
>  	      <img src="images/benetti-engineering-logo.png" style="max-width:260px; margin-right:40px;"/>
>  	    </a>
>  	  </center>
> diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
> index 5acef3cd32..102e8d7bf7 100644
> --- a/package/rtl8188eu/Config.in
> +++ b/package/rtl8188eu/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8188EU
>  	help
>  	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
>  
> -	  https://github.com/benetti-engineering-sas/rtl8188eu
> +	  https://github.com/benetti-engineering/rtl8188eu
>  
>  comment "rtl8188eu needs a Linux kernel to be built"
>  	depends on !BR2_s390x
> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
> index 1ad9452f82..6161ffd5d6 100644
> --- a/package/rtl8188eu/rtl8188eu.mk
> +++ b/package/rtl8188eu/rtl8188eu.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RTL8188EU_VERSION = 702a90b02edca722cc0d139260ba02c23f406333
> -RTL8188EU_SITE = $(call github,benetti-engineering-sas,rtl8188eu,$(RTL8188EU_VERSION))
> +RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
>  RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
>  RTL8188EU_LICENSE_FILES = COPYING
>  RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
> diff --git a/package/rtl8723bu/Config.in b/package/rtl8723bu/Config.in
> index 70d597d23e..2f2f96dfe5 100644
> --- a/package/rtl8723bu/Config.in
> +++ b/package/rtl8723bu/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8723BU
>  	help
>  	  rtl8723bu wifi driver
>  
> -	  https://github.com/benetti-engineering-sas/rtl8723bu
> +	  https://github.com/benetti-engineering/rtl8723bu
>  
>  comment "rtl8723bu needs a Linux kernel to be built"
>  	depends on !BR2_s390x
> diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
> index 05447ecef9..d9719a2cad 100644
> --- a/package/rtl8723bu/rtl8723bu.mk
> +++ b/package/rtl8723bu/rtl8723bu.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RTL8723BU_VERSION = 523cb38e4c62bb181d6b95024884e938835cf8cf
> -RTL8723BU_SITE = $(call github,benetti-engineering-sas,rtl8723bu,$(RTL8723BU_VERSION))
> +RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
>  RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
>  
>  RTL8723BU_MODULE_MAKE_OPTS = \
> diff --git a/package/rtl8723ds/Config.in b/package/rtl8723ds/Config.in
> index 0921a55d37..018e70489d 100644
> --- a/package/rtl8723ds/Config.in
> +++ b/package/rtl8723ds/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8723DS
>  	help
>  	  rtl8723bs wifi driver
>  
> -	  https://github.com/benetti-engineering-sas/rtl8723ds
> +	  https://github.com/benetti-engineering/rtl8723ds
>  
>  comment "rtl8723ds needs a Linux kernel to be built"
>  	depends on !BR2_s390x
> diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
> index f1b345d548..67104fd5d7 100644
> --- a/package/rtl8723ds/rtl8723ds.mk
> +++ b/package/rtl8723ds/rtl8723ds.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RTL8723DS_VERSION = 97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a
> -RTL8723DS_SITE = $(call github,benetti-engineering-sas,rtl8723ds,$(RTL8723DS_VERSION))
> +RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
>  RTL8723DS_LICENSE = GPL-2.0
>  RTL8723DS_LICENSE_FILES = COPYING
>  
> diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
> index 66e7334148..24ea9b8c7d 100644
> --- a/package/rtl8821au/Config.in
> +++ b/package/rtl8821au/Config.in
> @@ -9,4 +9,4 @@ config BR2_PACKAGE_RTL8821AU
>  	help
>  	  rtl8821au wifi driver
>  
> -	  https://github.com/benetti-engineering-sas/rtl8821au
> +	  https://github.com/benetti-engineering/rtl8821au
> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> index 9ecbbbb0b2..aa900839f5 100644
> --- a/package/rtl8821au/rtl8821au.mk
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RTL8821AU_VERSION = d0a49ba401a8661ef0cdc4cf8850bc7c927a062c
> -RTL8821AU_SITE = $(call github,benetti-engineering-sas,rtl8821au,$(RTL8821AU_VERSION))
> +RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
>  RTL8821AU_LICENSE = GPL-2.0
>  RTL8821AU_LICENSE_FILES = LICENSE
>  
> diff --git a/package/sunxi-mali-utgard-driver/Config.in b/package/sunxi-mali-utgard-driver/Config.in
> index ba4d1919ce..22f93d0a0e 100644
> --- a/package/sunxi-mali-utgard-driver/Config.in
> +++ b/package/sunxi-mali-utgard-driver/Config.in
> @@ -36,4 +36,4 @@ config BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER
>  	    since the driver requires at least double buffering and
>  	    fails to work with the default value(100).
>  
> -	  https://github.com/giuliobenetti/sunxi-mali/blob/master/README.md
> +	  https://github.com/benetti-engineering/sunxi-mali/blob/master/README.md
> diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> index ea3bc258a6..38946aa1e4 100644
> --- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> +++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  SUNXI_MALI_UTGARD_DRIVER_VERSION = b47f74c92fbcbdf175a16052d1b0ce8345efc6b2
> -SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,benetti-engineering-sas,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
> +SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,benetti-engineering,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
>  SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
>  SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
>  SUNXI_MALI_UTGARD_DRIVER_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
