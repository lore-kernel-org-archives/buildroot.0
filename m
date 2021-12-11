Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5A0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 09:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45B8C41FB1;
	Sat, 11 Dec 2021 09:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VNHQ030XPDC; Sat, 11 Dec 2021 09:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8206641FB3;
	Sat, 11 Dec 2021 09:52:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F0241BF363
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B80B42363
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvTSfj3FZq4U for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 09:52:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BD7B400C6
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 09:51:59 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id t5so36737245edd.0
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 01:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9vTn+b0/RmW/o/ZUqdR+LMyp09mkcIVRjwsGPbehtHM=;
 b=GngPSf+e0PiJ8Cc6wOE/08uFkgKO5/a6sMPmi0pwkTdkMdyybRuFxZBVEYtzjAunSW
 Pb1LYtQGGVeDSXybe+paKbxsndAfM4oawOCMfGBKgKWilSCEkKXG7o21s4QwY+R8k+Wu
 LXLxRBOyyVL8AxN+gmswKF70vi1qnAUSC9+r0r67exMxFMeKSufsVnsQOyUlNISXs7Bj
 JDq0Dmh4tlRBoH4zNU1GT2sYc+M19whOp4yxblZEjuMRBcCNBv6R+OnEcy7xVUzxAst8
 c1/Z2WwenphNwdcdo1DK3G0bybf/utJQIn2G7sdQIFqt46VimduQjwZwXTOR8Zti+t9J
 PHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9vTn+b0/RmW/o/ZUqdR+LMyp09mkcIVRjwsGPbehtHM=;
 b=xQG/82qHMRpDIwKn/Rt421XxFGgqr3kltw2I9L6s1hD22WCzHNvnaxh3Su6gMuiNLP
 Ff5tlYOYvFGUxd61BIAQtRMAL16+2mPZXHAT+vrIl+rSIkT3mhzIYrOPyEnioW32JrAy
 eUBPAB7mqgoGOFhA04nkOhJMFovycaFZYjoItQPXH2pCPNkblODDVvdCgeU3yWtsy3BZ
 rrjrbhy+KKsR1mwaApzDDJQ4HEfu12pzHygygfY8A+wZriJKeM88zdL49tlxXU+Olsk0
 j9ZkxwkWysQ2aJSn63TsC6xroDcRAP9Jej8VI5f/CL6HorYXq98ZH4KHTWrwAsnJv/a2
 WhnA==
X-Gm-Message-State: AOAM5322ZGB1xGgcuYrcBKv0TsRtkc9PBvtFUVkcL2mnhbTWL0oloucI
 iin8IsbM4ZB4roSi7piDt1ivh2XBlaqceIhFuVU=
X-Google-Smtp-Source: ABdhPJwV9ZkMN8VNnxP432DeJnxt2/FGmiTR/qobNxx0mjMEDFHo6fnvbEQlmZmmGG40VlxiRsocVw==
X-Received: by 2002:a17:906:48cd:: with SMTP id
 d13mr29635794ejt.35.1639216317849; 
 Sat, 11 Dec 2021 01:51:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h7sm3102745ede.40.2021.12.11.01.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 01:51:57 -0800 (PST)
Message-ID: <4122452e-38c1-7044-398f-81c965bce9f9@mind.be>
Date: Sat, 11 Dec 2021 10:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20211116104534.18868-1-kory.maincent@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211116104534.18868-1-kory.maincent@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3] package/psplash: add support for missing
 configure options
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
Cc: phil.eichinger@gmail.com, thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/11/2021 11:45, Kory Maincent wrote:
> Add support to three configure options:
> --enable-startup-msg: Enable text banner output on startup
> --enable-progress-bar: Enable progress bar
> --enable-img-fullscreen: Enable the logo image in fullscreen mode
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change since v1:
> Remove the crap .config.in.swp
> 
> Change since v2:
> Use both side of enable/disable configure option condition.
> Use positive options in Kconfig.
> 
> 
>   package/psplash/Config.in  | 17 +++++++++++++++++
>   package/psplash/psplash.mk | 18 ++++++++++++++++++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/package/psplash/Config.in b/package/psplash/Config.in
> index da99b264e0..edd30dcb4d 100644
> --- a/package/psplash/Config.in
> +++ b/package/psplash/Config.in
> @@ -35,6 +35,23 @@ config BR2_PACKAGE_PSPLASH_IMAGE
>   	  Use a personalized png image as boot splash.
>   	  Let it empty if you want to keep the psplash default image.
>   
> +config BR2_PACKAGE_PSPLASH_FULL_SCREEN
> +	bool "use fullscreen mode"
> +	help
> +	  Enable the psplash image in fullscreen mode.
> +
> +config BR2_PACKAGE_PSPLASH_STARTUP_MSG
> +	bool "enable startup message"
> +	default y
> +	help
> +	  Enable text banner output on startup.
> +
> +config BR2_PACKAGE_PSPLASH_PROGRESS_BAR
> +	bool "enable progress bar"
> +	default y
> +	help
> +	  Enable the management of the progress bar.
> +
>   endif
>   
>   comment "psplash needs a toolchain w/ wchar"
> diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
> index 5e61f2392f..e5b212381a 100644
> --- a/package/psplash/psplash.mk
> +++ b/package/psplash/psplash.mk
> @@ -18,6 +18,24 @@ else
>   PSPLASH_CONF_OPTS += --without-systemd
>   endif
>   
> +ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
> +PSPLASH_CONF_OPTS += --enable-img-fullscreen
> +else
> +PSPLASH_CONF_OPTS += --disable-img-fullscreen

  Have you actually tested this?

  I haven't, but I see this in configure.ac:

AC_ARG_ENABLE([img-fullscreen],
     AS_HELP_STRING([--enable-img-fullscreen], [Enable the logo image in 
fullscreen mode)]),
     [img_fullscreen=true],
     [img_fullscreen=false])
AS_IF([test x$img_fullscreen = xtrue], [
     EXTRA_GCC_FLAGS="$EXTRA_GCC_FLAGS -DPSPLASH_IMG_FULLSCREEN=1"
])

i.a. AC_ARG_ENABLE is used incorrectly. That means that both 
--enable-img-fullscreen and --disable-image-fullscreen will enable the option 
(because the action-if-present is img_fullscreen=true), while if nothing is set 
it will be disbled.

  Same for the other two options, but there the logic is inverted (i.e. it's 
disabled if present and enabled if not).

  I don't know if psplash is still an active project; if so, I would propose to 
fix this in configure.ac and send the patch upstream. The fix is simple:


AC_ARG_ENABLE([img-fullscreen],
     AS_HELP_STRING([--enable-img-fullscreen], [Enable the logo image in 
fullscreen mode)]))
AS_IF([test "x$enable_img_fullscreen" != "xno"], [
     EXTRA_GCC_FLAGS="$EXTRA_GCC_FLAGS -DPSPLASH_IMG_FULLSCREEN=1"
])


  and for enable-startup-msg:

AC_ARG_ENABLE([startup-msg],
     AS_HELP_STRING([--disable-startup-msg], [Disable text banner output on 
startup]),
     [],[enable_startup_msg=yes])
AS_IF([test "x$enable_startup_msg" = "xno"], [
     EXTRA_GCC_FLAGS="$EXTRA_GCC_FLAGS -DPSPLASH_DISABLE_STARTUP_MSG"
])

(note: you have to use "no" because that is the value that is set when 
--disable-foo is given. You shouldn't use anything else because --enable-foo=no 
or --enable-foo=yes are also allowed).


  Regards,
  Arnout

> +endif
> +
> +ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG),y)
> +PSPLASH_CONF_OPTS += --enable-startup-msg
> +else
> +PSPLASH_CONF_OPTS += --disable-startup-msg
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR),y)
> +PSPLASH_CONF_OPTS += --enable-progress-bar
> +else
> +PSPLASH_CONF_OPTS += --disable-progress-bar
> +endif
> +
>   PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
>   
>   ifneq ($(PSPLASH_IMAGE),)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
