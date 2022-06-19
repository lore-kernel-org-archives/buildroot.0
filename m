Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA342C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F0CF81919;
	Sun, 19 Jun 2022 16:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F0CF81919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8upttp7iss2w; Sun, 19 Jun 2022 16:59:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33CDF815AC;
	Sun, 19 Jun 2022 16:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33CDF815AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FCEB1BF20B
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2308D60A90
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2308D60A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NuBXwvXktfcD for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:59:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B496760A7B
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B496760A7B
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:59:19 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id s12so17028932ejx.3
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=teJJh5/S+HC0mJ3czWWwJ24IMzq63QiCl6zBT7Ltp5g=;
 b=KeSr00bn9eglvNksXrZo34Yn3RVQKD6sH5XuwlqWNSwFhiz+I8CL3nIdllaKt3q+bV
 xG3pMKHJ9FlrQcikF0g9JXBZCsC2oQuXHPY7imjo0rW55SoUR89P8CeSE+T9gWRoPFts
 4vikgYPL5ptIR7zasN64YEz0PD6Tdpy7a0jL+oFHq6BvIDQh4HxXvRXh1jsaWvpB3rxE
 yAmt0QvTtbwPqffWtZ5h+oJTwoclK5R69O9z7qd5+Az2uNOI9RfdE6HjCvW2w6FDV9HS
 5mdqZDmHBV/SXdfhO808YV1F9S8piMc5yeuMgb5cBSVWmXJ/kJzTbSOjycY1VGEN5uk3
 EI4w==
X-Gm-Message-State: AJIora+gMG4o2DRy4N9cD+L6KFrtyYtHyYEtbWoKmwsuTL7jb7cprb5m
 VIyzfGEWXh6VCqcbXUgz0QUr1A==
X-Google-Smtp-Source: AGRyM1sKu0qHt1Zo+6mjJ9tCx2AN+i4cBXjVCOiF6ZPTCvmHupPGGn2mhP2wwnJ/6P48QreYnFgUmA==
X-Received: by 2002:a17:906:4a83:b0:70b:156f:9098 with SMTP id
 x3-20020a1709064a8300b0070b156f9098mr18519456eju.109.1655657957724; 
 Sun, 19 Jun 2022 09:59:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056402524100b0042bae6fbee2sm8388050edd.74.2022.06.19.09.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 09:59:17 -0700 (PDT)
Message-ID: <1b11f175-3554-9236-26f7-9876961b03ea@mind.be>
Date: Sun, 19 Jun 2022 18:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: kory.maincent@bootlin.com, buildroot@buildroot.org
References: <20220531143502.464179-1-kory.maincent@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220531143502.464179-1-kory.maincent@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=teJJh5/S+HC0mJ3czWWwJ24IMzq63QiCl6zBT7Ltp5g=;
 b=BDmPWH3FvLORA7E4oFdvXoc0svfE583lEQIFRqdOC1FWW4t9v80alrgmlSi+s3+w9H
 0aIMN7RBGTT/dWoXHZCLSHqPrBZfZ9jS0hXe1V2rL/HIDj/h4Vf67b04QtRYR5I1xmZE
 Skl8Zx2JEdf7h1VYpIoWUmbj7T2sQL8y846MpidX0NparfyS5mJTOdZHtfRffJRxIoBs
 C9oASfQ52x5gPXJ4mEhZXlFy3d40OwOrJw/A0ayiOwoXYwDDuyPMB4Xr93slLM2TiJCR
 26n9e9yPYuiApqeQxfEXN8zkbTBt0J6729CW3VQkHK7lDV5aKFK2bP521zXcIlIVaB++
 DvNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BDmPWH3F
Subject: Re: [Buildroot] [PATCH] package: Rename and update
 arm-gnu-a-toolchain to arm-gnu-toolchain
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
Cc: thomas.petazzoni@bootlin.com, sunil@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/05/2022 16:35, Kory Maincent via buildroot wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> arm-gnu-a-toolchain is now deprecated to be replaced by arm-gnu-toolchain.
> This patch rename the package and update to the new version.
> It also update TF-A package that depends on it.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

  Applied to master, after adding the links mentioned by Thomas and also 
updating the comment in the .mk file, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                                    |  2 +-
>   .../arm-trusted-firmware.mk                   |  2 +-
>   .../arm-gnu-a-toolchain.hash                  |  2 --
>   .../arm-gnu-a-toolchain.mk                    | 26 -------------------
>   .../arm-gnu-toolchain/arm-gnu-toolchain.hash  |  2 ++
>   .../arm-gnu-toolchain/arm-gnu-toolchain.mk    | 26 +++++++++++++++++++
>   6 files changed, 30 insertions(+), 30 deletions(-)
>   delete mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
>   delete mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
>   create mode 100644 package/arm-gnu-toolchain/arm-gnu-toolchain.hash
>   create mode 100644 package/arm-gnu-toolchain/arm-gnu-toolchain.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 71cc3da6d7..bc3e6f7eae 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2703,7 +2703,7 @@ F:	configs/rock_pi_4_defconfig
>   F:	configs/rock_pi_n8_defconfig
>   F:	configs/rock_pi_n10_defconfig
>   F:	configs/rockpro64_defconfig
> -F:	package/arm-gnu-a-toolchain/
> +F:	package/arm-gnu-toolchain/
>   
>   N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
>   F:	package/lcdproc/
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 03fa83b7b5..38655a70a0 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -36,7 +36,7 @@ ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-dtc
>   endif
>   
>   ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN),y)
> -ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-a-toolchain
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-toolchain
>   endif
>   
>   ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
> diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
> deleted file mode 100644
> index 73c2708fea..0000000000
> --- a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally calculated
> -sha256 45225813f74e0c3f76af2715d30d1fbebb873c1abe7098f9c694e5567cc2279c  gcc-arm-10.3-2021.07-x86_64-arm-none-eabi.tar.xz
> diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
> deleted file mode 100644
> index 97ab89c9eb..0000000000
> --- a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -################################################################################
> -#
> -# arm-gnu-a-toolchain
> -#
> -################################################################################
> -
> -ARM_GNU_A_TOOLCHAIN_VERSION = 10.3-2021.07
> -ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/$(ARM_GNU_A_TOOLCHAIN_VERSION)/binrel
> -ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
> -ARM_GNU_A_TOOLCHAIN_LICENSE = GPL-3.0+
> -
> -HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
> -
> -define HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_CMDS
> -	rm -rf $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
> -	mkdir -p $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
> -	cp -rf $(@D)/* $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)/
> -
> -	mkdir -p $(HOST_DIR)/bin
> -	cd $(HOST_DIR)/bin && \
> -	for i in ../opt/gcc-arm-none-eabi/bin/*; do \
> -		ln -sf $$i; \
> -	done
> -endef
> -
> -$(eval $(host-generic-package))
> diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
> new file mode 100644
> index 0000000000..48b1b55c73
> --- /dev/null
> +++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326  gcc-arm-11.2-2022.02-x86_64-arm-none-eabi.tar.xz
> diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
> new file mode 100644
> index 0000000000..9beef42ac4
> --- /dev/null
> +++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# arm-gnu-a-toolchain
> +#
> +################################################################################
> +
> +ARM_GNU_TOOLCHAIN_VERSION = 11.2-2022.02
> +ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(ARM_GNU_TOOLCHAIN_VERSION)/binrel/
> +ARM_GNU_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
> +ARM_GNU_TOOLCHAIN_LICENSE = GPL-3.0+
> +
> +HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
> +
> +define HOST_ARM_GNU_TOOLCHAIN_INSTALL_CMDS
> +	rm -rf $(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)
> +	mkdir -p $(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)
> +	cp -rf $(@D)/* $(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/
> +
> +	mkdir -p $(HOST_DIR)/bin
> +	cd $(HOST_DIR)/bin && \
> +	for i in ../opt/gcc-arm-none-eabi/bin/*; do \
> +		ln -sf $$i; \
> +	done
> +endef
> +
> +$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
