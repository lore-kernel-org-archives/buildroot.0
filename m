Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01118C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 21:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AAF483EB8;
	Mon, 27 Jun 2022 21:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AAF483EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPuE4aB4P-Xr; Mon, 27 Jun 2022 21:24:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA6383145;
	Mon, 27 Jun 2022 21:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EA6383145
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F10E51BF34B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB29183145
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB29183145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cE3gn1mLwEcr for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 21:24:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFEF883123
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFEF883123
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 21:24:19 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id c65so14882972edf.4
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 14:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7A6DwHrQLHYBHesAmKcJpR+9M9Q5HIK5UMTquHYDL58=;
 b=qyCTei9UIwsbz50Yscv7PAOUP/wmQE3JlY9RQZEJz/JpSmVWF9qYexYcHQgbNcs5wn
 RaGaHnABlZszIoNbpih7wi2ymXFo0CwG773KOCBQ8u5jxJjyhf2yylc9OsI6GYsodRVA
 bTDkBIFhIaboWsM6csdQaULMJ4Trb9TOKzlgJl3RyR513Lger7o3ehX36EDMtG5UhVRz
 FP1yM8YdtE/NM0zr+5NL/BwoAPNiI6KlzjkLVk+T7Qw6wClIzsRinjKc7ww66dsw3P2q
 YwIJUV+EIXIzwr3hPdxx0nT8o/jnC0NECMBp2NJm8UZavxNNXIJyEQS/ZfgfS2TAb6TZ
 vC/Q==
X-Gm-Message-State: AJIora/vGCsTlAdFNBry08siyEwp/uuMD0dzcQJWQb7Wc5Dr2zPJaz89
 nnXBF0idXqXVsMD/PJ03rwwwTzoVjdEbGA==
X-Google-Smtp-Source: AGRyM1tAdKkP8IS/054ER4q5Noi9YobrNwqCyezltPxnUs8kTvMvRjxuRCdFrdIwJJUwll1vnlrIdQ==
X-Received: by 2002:aa7:d5c9:0:b0:435:8099:30e6 with SMTP id
 d9-20020aa7d5c9000000b00435809930e6mr19144034eds.384.1656365057860; 
 Mon, 27 Jun 2022 14:24:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a1709067fc100b0070e238ff66fsm5465755ejs.96.2022.06.27.14.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 14:24:17 -0700 (PDT)
Message-ID: <d8374185-3338-0b14-2263-069bb4c562f3@mind.be>
Date: Mon, 27 Jun 2022 23:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: kory.maincent@bootlin.com, buildroot@buildroot.org
References: <20220622083433.1201789-1-kory.maincent@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220622083433.1201789-1-kory.maincent@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7A6DwHrQLHYBHesAmKcJpR+9M9Q5HIK5UMTquHYDL58=;
 b=Lo/ltKrtUzp7Zua1X79eZ2SxTVtt25MrSK7oZcnVUDFkxF/SbnjwLUdMVmpUrVJZBJ
 i+sHXrLuYKUFdO2plrn16T0P1zAxuQcHHuMUPtN2wVySoW/eFhD9HFzqcqsU6jxkS0Cm
 OahlwxRz3XLE/LiLkxjl1ogknerRIcAT2vmHPv5C2WDij2BAxTU5U59B7gyrWPIdMgmY
 AIKOaGjr8oGNmWnPlc5DwtrZakkMI9cLWK9STsQ363iPCIvcQf4K34OteyjKgA4rj7sJ
 /AJG7RB3KHzBFU3UFAyip14CNsthUhgBLLLaF38CH0NrMUaoX7AaDmx3xx1CiddK4fes
 ypYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Lo/ltKrt
Subject: Re: [Buildroot] [PATCH v2] boot/optee-os: add support for custom
 tarball URL
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
Cc: etienne.carriere@linaro.org, thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/06/2022 10:34, Kory Maincent via buildroot wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> For now only latest release and custom git repository was supported.
> This patch adds support for custom tarball URL.
> 
> It also adds configuration verification for custom git repository and
> tarball URL.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

  Applied to master, thanks.


> ---
> 
> Change since v1:
> - Update the test condition on custom tarball selection.
> - Remeved extra ending parentheses.
> 
>   boot/optee-os/Config.in   | 11 +++++++++++
>   boot/optee-os/optee-os.mk | 25 +++++++++++++++++++++++--
>   2 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> index 0be6e68b0c..d56cf53c8a 100644
> --- a/boot/optee-os/Config.in
> +++ b/boot/optee-os/Config.in
> @@ -25,6 +25,9 @@ config BR2_TARGET_OPTEE_OS_LATEST
>   	  Use the latest release tag from the OP-TEE OS official Git
>   	  repository.
>   
> +config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
> +	bool "Custom tarball"

  I've added the help text from the kernel here.

> +
>   config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>   	bool "Custom Git repository"
>   	help
> @@ -32,6 +35,13 @@ config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>   
>   endchoice
>   
> +if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
> +
> +config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION
> +	string "URL of custom OP-TEE OS tarball"
> +
> +endif
> +
>   if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>   
>   config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL
> @@ -53,6 +63,7 @@ endif
>   config BR2_TARGET_OPTEE_OS_VERSION
>   	string
>   	default "3.17.0"	if BR2_TARGET_OPTEE_OS_LATEST
> +	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
>   	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
>   				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>   
> diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> index 88f14b48e4..cddc1f2448 100644
> --- a/boot/optee-os/optee-os.mk
> +++ b/boot/optee-os/optee-os.mk
> @@ -13,14 +13,22 @@ endif
>   OPTEE_OS_INSTALL_STAGING = YES
>   OPTEE_OS_INSTALL_IMAGES = YES
>   
> -ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
> +ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL),y)
> +# Handle custom U-Boot tarballs as specified by the configuration

  U-Boot? Copy paste error I guess :-)

  However, this comment is pretty useless, so I just removed it.

> +OPTEE_OS_TARBALL = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION))
> +OPTEE_OS_SITE = $(patsubst %/,%,$(dir $(OPTEE_OS_TARBALL)))
> +OPTEE_OS_SOURCE = $(notdir $(OPTEE_OS_TARBALL))
> +else ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
>   OPTEE_OS_SITE = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL))
>   OPTEE_OS_SITE_METHOD = git
> -BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
>   else
>   OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
>   endif
>   
> +ifeq ($(BR2_TARGET_OPTEE_OS)$(BR2_TARGET_OPTEE_OS_LATEST_VERSION),y)

  It's not immediately obvious that the first should be y and the second empty, 
so I changed this into

ifeq ($(BR2_TARGET_OPTEE_OS):$(BR2_TARGET_OPTEE_OS_LATEST_VERSION),y:)

> +BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
> +endif
> +
>   OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pyelftools
>   
>   ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY),y)
> @@ -130,6 +138,19 @@ ifeq ($(BR2_TARGET_OPTEE_OS)$(BR_BUILDING),yy)
>   ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM)),)
>   $(error No OP-TEE OS platform set. Check your BR2_TARGET_OPTEE_OS_PLATFORM setting)
>   endif
> +
> +ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL),y)
> +ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION)),)
> +$(error No tarball location specified. Please check BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION)

  Normally there should also be a handler in utils/genrandconfig to make sure 
that a fully random config with empty tarball location doesn't fail. However, 
that never happens at the moment because BR2_TARGET_OPTEE_OS_PLATFORM is already 
empty and that already triggers the removal of BR2_TARGET_OPTEE_OS. Still, it 
would be nice to handle this case as well, reverting to 
BR2_TARGET_OPTEE_OS_LATEST if the tarball location is empty.

  Regards,
  Arnout


> +endif
> +endif
> +
> +ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
> +ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL)),)
> +$(error No repository specified. Please check BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL)
> +endif
> +endif
> +
>   endif # BR2_TARGET_OPTEE_OS && BR2_BUILDING
>   
>   $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
