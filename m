Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46219C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF4DC60D96;
	Sun, 12 Dec 2021 14:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMcZgabQFIi6; Sun, 12 Dec 2021 14:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0897560D69;
	Sun, 12 Dec 2021 14:07:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5360B1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44737424EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2VMglkbwwCF for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:06:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DF68424E9
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:06:59 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y13so43784395edd.13
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r6AjqJo1xUmgYs26hInSBc5HYdPWlIO4Vgf/y3+RFjY=;
 b=R/Yf5EYFnISnyyO5enCevckO2FE/JUXaw4x06aF1+keUwsoH/HOOzIKmcMQRw4300x
 kynY7xfAQP+GssPK/r3F3dao1/kKhbJuw4+XZYRUY8FkjweZwe4Lys8juvOFxnPMOfpl
 TTG4iebIz8Gm14xdb65KnB0PCNSxZqtlfOccNEDOnE6XBcNTLbbVho9j1B5bRfawcmHF
 ZswAiTcC6eBbeBV1zfGh5zEX8mB75QOYvhb/EkYLv2Rl2ogL9jvqCre1QAWJG0SuVo8J
 TFig/rreOQ/8LJ4LtXDLaItUfnPwAGxt9CMD/tsu4YiCb8MkIZ4kCqy6Fj5EqThAurOy
 sdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r6AjqJo1xUmgYs26hInSBc5HYdPWlIO4Vgf/y3+RFjY=;
 b=wjw4wNSqIJdFarEroKPZgfKfIu8bgydHvHZ8TBMbdYKLpgfu8+R8z2JAGZd9H4Nc7/
 SRhPgDM9xBRrUYiGsM9TKfp/vRs5WN7945TdfoXjFWwvFQ8Mp5MQbQpWhYqcgXPu7Ngk
 0K+YIaLl7yyQsg6Uel7Yk23Pe5TOS/2++UwoEBsZdT0+KVQG7/ekDrPgRnTR1fc+/BPP
 pksZZP8FK7+1LP+GRswZOK3PIqlL83aE1UL+5ze8Rto5zqbxGM2EsoHiGTBAljfAtLcb
 IwwfMiikGtFuNHZMZe/K8TeDCtYSamwMuswUi1poph2CtuZPg7l82kd0NnplV+LKhnFF
 2sOQ==
X-Gm-Message-State: AOAM5329WgQ/kS4KkCofy1FF54tp5Uk46fz1vUw6adG4aPZ9hJpxrq8f
 Zh6IHIrP78Jy2W0m+Epji4kI6g==
X-Google-Smtp-Source: ABdhPJxIyXU0Sy7LvmMVINK2m9Y1Ci4bOfMQZoqXP8LnOm4m6ogDsO3khU2apDCuK062whwpaMW+8A==
X-Received: by 2002:a05:6402:2067:: with SMTP id
 bd7mr55263493edb.240.1639318017322; 
 Sun, 12 Dec 2021 06:06:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id sd2sm4815197ejc.22.2021.12.12.06.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:06:57 -0800 (PST)
Message-ID: <1e66dccd-a0aa-a1a6-a239-7af5324e69b5@mind.be>
Date: Sun, 12 Dec 2021 15:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211209091242.3072262-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211209091242.3072262-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2021.11
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/12/2021 10:12, James Hilliard wrote:
> Add new optional dependencies.
> 
> Add new env variables for dependencies.
> 
> Don't disable mbedtls if openssl is selected as swupdate configuration
> will select which gets used.
> 
> License update details
> 
> LICENSES/BSD-2-Clause.txt removed:
> https://github.com/sbabic/swupdate/commit/c1cc280425b9f0bf22187d991dd5414dde257813
> 
> LICENSES/CC-BY-ND-4.0.txt -> LICENSES/CC-BY-SA-4.0.txt:
> https://github.com/sbabic/swupdate/commit/3612a85f3664356b8d52f9c36974f58d879052ee
> 
> LICENSES/LicenseRef-OpenSSL-Exception.txt removed:
> https://github.com/sbabic/swupdate/commit/b6c0adbc545675babf0a324e3410407f9d985b1e
> 
> LICENSES/OFL-1.1.txt added:
> https://github.com/sbabic/swupdate/commit/1b41348e8cc77d30c46eb9cd4ac8051aced2f2ea
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/swupdate/swupdate.hash |  7 +++---
>   package/swupdate/swupdate.mk   | 41 ++++++++++++++++++++++------------
>   2 files changed, 30 insertions(+), 18 deletions(-)
> 
> diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
> index 8bfbc7c8b9..e431ecf40b 100644
> --- a/package/swupdate/swupdate.hash
> +++ b/package/swupdate/swupdate.hash
> @@ -1,13 +1,12 @@
>   # Locally calculated
> -sha256  5afe78ae94e869bcb911d8592251641cdab80096d8e5149d483054ea49f9aab8  swupdate-2021.04.tar.gz
> +sha256  4d078e57bb91e17025ee8cb1bb54c25532e8d2dbe329bba6a7a0328ac34a07e3  swupdate-2021.11.tar.gz
>   sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
> -sha256  3139f288c2e4cbe4a8c0e8c13c82661f3c798d446e1fbbc27a48a69aa7b4ec0d  LICENSES/BSD-2-Clause.txt
>   sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
>   sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
> -sha256  6e4efcb1952c7976d3fae93b802c591384c4f50949225a802adf41bc266fa3e6  LICENSES/CC-BY-ND-4.0.txt
> +sha256  cde7883b9050a1104f4ac19a1572aafd6e5d7323b68351aaf51fbf4beba54966  LICENSES/CC-BY-SA-4.0.txt
>   sha256  5d51b52a40391a26cbb2accf5dc5d1c165de49a022d9d5efb50b22204d2682ec  LICENSES/GPL-2.0-only.txt
>   sha256  43fd695e9b198a9a4997cc2d02e10d26cae937e2c4930b9eff9c6d349c85cd32  LICENSES/GPL-2.0-or-later.txt
>   sha256  492e801f1b0632185431472f148885a4fe8e990b10da57b4986a8bcf140a5374  LICENSES/ISC.txt
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
> -sha256  43492b377cf2fb67942d1dd231146bd4e6578646ad13ef289297c9dd75cbc478  LICENSES/LicenseRef-OpenSSL-Exception.txt
>   sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
> +sha256  8f2368a292194be10b1223a8875815240a9208bb30785cb13d8849eb6a750fe9  LICENSES/OFL-1.1.txt
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index 5ed2ca55d2..e16060f5cb 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -4,20 +4,19 @@
>   #
>   ################################################################################
>   
> -SWUPDATE_VERSION = 2021.04
> +SWUPDATE_VERSION = 2021.11
>   SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
> -SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+ with OpenSSL exception, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-2-Clause, BSD-3-Clause, CC0-1.0, CC-BY-ND-4.0
> +SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
>   SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
> -	LICENSES/BSD-2-Clause.txt \
>   	LICENSES/BSD-3-Clause.txt \
>   	LICENSES/CC0-1.0.txt \
> -	LICENSES/CC-BY-ND-4.0.txt \
> +	LICENSES/CC-BY-SA-4.0.txt \
>   	LICENSES/GPL-2.0-only.txt \
>   	LICENSES/GPL-2.0-or-later.txt \
>   	LICENSES/ISC.txt \
>   	LICENSES/LGPL-2.1-or-later.txt \
> -	LICENSES/LicenseRef-OpenSSL-Exception.txt \
> -	LICENSES/MIT.txt
> +	LICENSES/MIT.txt \
> +	LICENSES/OFL-1.1.txt
>   
>   # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
>   # available in all external toolchains, and use CC for linking. Ensure
> @@ -28,6 +27,9 @@ SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
>   
>   ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
>   SWUPDATE_DEPENDENCIES += e2fsprogs
> +SWUPDATE_MAKE_ENV += HAVE_LIBEXT2FS=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_LIBEXT2FS=n
>   endif
>   
>   ifeq ($(BR2_PACKAGE_EFIBOOTMGR),y)
> @@ -72,6 +74,13 @@ else
>   SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
>   endif
>   
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),y)
> +SWUPDATE_DEPENDENCIES += util-linux
> +SWUPDATE_MAKE_ENV += HAVE_LIBFDISK=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_LIBFDISK=n
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
>   SWUPDATE_DEPENDENCIES += libgpiod
>   SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=y
> @@ -104,6 +113,13 @@ else
>   SWUPDATE_MAKE_ENV += HAVE_LUA=n
>   endif
>   
> +ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +SWUPDATE_DEPENDENCIES += mbedtls
> +SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=n
> +endif
> +
>   ifeq ($(BR2_PACKAGE_MTD),y)
>   SWUPDATE_DEPENDENCIES += mtd
>   SWUPDATE_MAKE_ENV += HAVE_LIBMTD=y
> @@ -113,21 +129,13 @@ SWUPDATE_MAKE_ENV += HAVE_LIBMTD=n
>   SWUPDATE_MAKE_ENV += HAVE_LIBUBI=n
>   endif
>   
> -# OpenSSL or mbedTLS
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   SWUPDATE_DEPENDENCIES += openssl
>   SWUPDATE_MAKE_ENV += HAVE_LIBSSL=y
>   SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=y
> -SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=n
>   else
>   SWUPDATE_MAKE_ENV += HAVE_LIBSSL=n
>   SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=n
> -ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> -SWUPDATE_DEPENDENCIES += mbedtls
> -SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=y
> -else
> -SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=n
> -endif
>   endif
>   
>   ifeq ($(BR2_PACKAGE_P11_KIT),y)
> @@ -139,10 +147,12 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>   SWUPDATE_DEPENDENCIES += systemd
> +SWUPDATE_MAKE_ENV += HAVE_LIBSYSTEMD=y
>   define SWUPDATE_SET_SYSTEMD
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_SYSTEMD)
>   endef
>   else
> +SWUPDATE_MAKE_ENV += HAVE_LIBSYSTEMD=n
>   define SWUPDATE_SET_SYSTEMD
>   	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSTEMD)
>   endef
> @@ -185,6 +195,9 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_LIBRSYNC),y)
>   SWUPDATE_DEPENDENCIES += librsync
> +SWUPDATE_MAKE_ENV += HAVE_LIBRSYNC=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_LIBRSYNC=n
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SWUPDATE_WEBSERVER),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
