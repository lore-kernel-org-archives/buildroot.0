Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD76AC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 630654032F;
	Fri, 12 Jul 2024 20:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeBjoG-b0NNl; Fri, 12 Jul 2024 20:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1010B40343
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1010B40343;
	Fri, 12 Jul 2024 20:48:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CAD21BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47EEA8462C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBRswB7ySMZg for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:48:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 055A684626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 055A684626
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 055A684626
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:48:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52e98087e32so2810696e87.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720817313; x=1721422113;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xdBEddSWUBGiPovmR0zGahrWl1/Ot4qMqHzqtnpOabc=;
 b=cVOZmaLnKDGXgBBVRLkb8nclr8nQ7n9nUkY3HpVyeYu34fJlL/ge0QWiDOPXRUW/u2
 s6BeKNAbSBkr3VBythpTcvq9jAcg2Uf8UF7R6NLItxe7SDNgMXNm347kpHPew0W0cpUp
 mxLfYKcqzMxqfuv8T7mfDmc2AmPMSYKk7ooohmDm/Wh5Wn48j+graoz+UfQSdFuJX8Kl
 SofNvoqpWn7j+Mv8bq+H2yehgGU3yOBkcCL7l9QCWq2B+MPqYSeYJbP6Gl3MG/bf7yZo
 QGNFDt4xL1+KJHgLwceDOlUh8nAE3HiQ7NIbHuAdY3zFCYE+rQz0sbyW9iMJTilAIOui
 4aGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcWRMAx8ckm1OJaGU9usoxLfQ5XeiyYk7cgzkfvAsmafBCGQCFLeYq+p84/SZmA+pWjl9LyoyP2gcTddkntR4KLkLd0Ajn/Q==
X-Gm-Message-State: AOJu0YwIzAXbZmsK23AR6JYHDuH7QFxjp+HLcA2uPOT74yrWXl//nR/W
 lmgfrMyS01lshe8vTjSSw3woIJPYu+izTt/BtES9ulo97SCWyTHHLD1iZungi7Q=
X-Google-Smtp-Source: AGHT+IFzqOMEZvNruy7uwMl3piUuPCrnv9et3moRG5hegzltWAep9YLYgNytlvG9NxCguk/ULPB0AQ==
X-Received: by 2002:a05:6512:10d2:b0:52c:9e51:c3f with SMTP id
 2adb3069b0e04-52eb99cb0camr9692358e87.42.1720817312822; 
 Fri, 12 Jul 2024 13:48:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2397f7sm33665605e9.9.2024.07.12.13.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 13:48:32 -0700 (PDT)
Message-ID: <80bf284b-1b9c-404e-98b8-c0e11b882b7c@mind.be>
Date: Fri, 12 Jul 2024 22:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kazemi.ms@gmail.com, buildroot@buildroot.org
References: <20230919193514.18212-1-kazemi.ms@gmail.com>
Content-Language: en-GB
In-Reply-To: <20230919193514.18212-1-kazemi.ms@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720817313; x=1721422113; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xdBEddSWUBGiPovmR0zGahrWl1/Ot4qMqHzqtnpOabc=;
 b=Fdp31aCZUT7HW/pd9IZBNJLSv2RymC4Yy9pqXh0nrMyy8UkQ/Gl+l4SS+xsFayv2uQ
 YB+z7ChEongl41LVOTteqf/TqoaN4Gx0/cxxST1KxXZh5kKT/s86CJ7xFKyyj5bQLSMP
 n8DwIHNBvgO2ITSByrK1wOHkBO3lb+5hc/QEkEh5pW2X5cfFuGtw7W6VwWrftLAllRFh
 QNP+0BgmoC8aNwr5eaASuyRi2Rz3tUjEp5Me9JejpogdZXCOBu+z5QB0isvOE9aL/4Gn
 6hysWaeBQx9NvCnJqN7waCcnrpl9gzihpa5VTj177eSdDgoI9Fh0NCakfdc4G0IGDfvA
 7roQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fdp31aCZ
Subject: Re: [Buildroot] [PATCH 1/1] package/mxt-app: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/09/2023 21:35, kazemi.ms@gmail.com wrote:
> From: Saeed Kazemi <kazemi.ms@gmail.com>
> 
> mxt-app is a utility for managing Atmel maXTouch touch controllers
> and other devices that support Atmel Object Based Protocol.
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                   |  3 +++
>   package/Config.in            |  1 +
>   package/mxt-app/Config.in    | 20 ++++++++++++++++++++
>   package/mxt-app/mxt-app.hash |  3 +++
>   package/mxt-app/mxt-app.mk   | 19 +++++++++++++++++++
>   5 files changed, 46 insertions(+)
>   create mode 100644 package/mxt-app/Config.in
>   create mode 100644 package/mxt-app/mxt-app.hash
>   create mode 100644 package/mxt-app/mxt-app.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e8b78a8d46..19d637d847 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2604,6 +2604,9 @@ F:	package/agent-proxy/
>   N:	Ryan Wilkins <ryan@deadfrog.net>
>   F:	package/biosdevname/
>   
> +N:	Saeed Kazemi <kazemi.ms@gmail.com>
> +F:	package/mxt-app/
> +
>   N:	Sam Lancia <sam@gpsm.co.uk>
>   F:	package/lrzip/
>   
> diff --git a/package/Config.in b/package/Config.in
> index e8dbadadf3..e8d39b74b8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -556,6 +556,7 @@ endmenu
>   	source "package/mhz/Config.in"
>   	source "package/minicom/Config.in"
>   	source "package/msr-tools/Config.in"
> +	source "package/mxt-app/Config.in"
>   	source "package/nanocom/Config.in"
>   	source "package/neard/Config.in"
>   	source "package/nvidia-driver/Config.in"
> diff --git a/package/mxt-app/Config.in b/package/mxt-app/Config.in
> new file mode 100644
> index 0000000000..2b153901de
> --- /dev/null
> +++ b/package/mxt-app/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_MXT_APP
> +	bool "mxt-app"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
> +	select BR2_PACKAGE_LIBUSB
> +	help
> +	  mxt-app is a utility for managing Atmel maXTouch touch
> +	  controllers and other devices that support Atmel Object Based
> +	  Protocol.
> +
> +	  https://github.com/atmel-maxtouch/mxt-app/
> +
> +config BR2_PACKAGE_MXT_APP_DEBUG
> +	bool "mxt-app debugging"
> +	help
> +	  Compile mxt-app with debug enabled
> +
> +comment "mxt-app needs a toolchain w/ threads, gcc >= 4.9"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.hash
> new file mode 100644
> index 0000000000..b7851cea37
> --- /dev/null
> +++ b/package/mxt-app/mxt-app.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  3639720ae1ea033bd982d68c5cab84432ce046fe14a66d9b2de07f115b642722  mxt-app-1.36.tar.gz
> +sha256  3682b125a40a4da00b6ab69bdbd38c25ed4beae69b3fe32458d2e32638477c4c  LICENSE
> diff --git a/package/mxt-app/mxt-app.mk b/package/mxt-app/mxt-app.mk
> new file mode 100644
> index 0000000000..da0aa65328
> --- /dev/null
> +++ b/package/mxt-app/mxt-app.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# mxt-app
> +#
> +################################################################################
> +
> +MXT_APP_VERSION = 1.36
> +MXT_APP_SITE = $(call github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))
> +MXT_APP_LICENSE = BSD-2-Clause
> +MXT_APP_LICENSE_FILES = LICENSE
> +MXT_APP_DEPENDENCIES = libusb
> +MXT_APP_INSTALL_STAGING = YES
> +MXT_APP_AUTORECONF = YES
> +
> +ifeq ($(BR2_PACKAGE_MXT_APP_DEBUG),y)
> +MXT_APP_CONF_OPTS += --enable-debug
> +endif
> +
> +$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
