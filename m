Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F48C02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C376040130;
	Sat, 14 Sep 2024 13:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMR8LauYtmMm; Sat, 14 Sep 2024 13:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F03A9401C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F03A9401C2;
	Sat, 14 Sep 2024 13:19:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 011F41BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1D10401C2
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6jlRYP7wdxM for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB24240130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB24240130
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB24240130
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:19:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-374bd0da617so2059418f8f.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 06:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726319974; x=1726924774;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=335j8QZif1KjGF0eT5Z1oCrJiYPgSyZEgCphdeiewew=;
 b=qweIxqliNjUrxcHOdwBd0DLRgU59gHKd6JWUpfVTBrSkUnmmlY4BuifxKLEYa9oUa0
 ZjruNS8exKCKmqR0/UPKBG2fMyKoLsmeG4sF7l7ghvnsulyqoIiEPY3UoNvgs/SOUI/c
 zynOBUhSqXQ1KkFyfAuMpLEuPxpXMtMFg69vpNWxxdSLVksuhclLVcKxhRnV3AGouobB
 LaBcVCXRgHHyGLA0aAAhBBtCzaHFL9ZypdXCE7oKvFWFpDrXHLZ42ZETP7syj5V8/0WJ
 2a2XwB9/EEAJG+Xtust8LyCykAGmcb+Lc+qWX+QBm4/c+ufkl/w9b+/6BeAEANqgpKHH
 q55A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu2gdbWSlR8KNMsEIBPjhHutiHq+3vLeTtI0xNzDU24iNAOavi3WEtKHEc0sS7/NkVpoUnoJ1Ib6c=@buildroot.org
X-Gm-Message-State: AOJu0YzL0lWqD2g7n2qCjHqOr8TPFoZjf8MlW57ou/XblWVZaXTjJVvk
 1gAr9ywOueYxYMAELHlhVvaxB2FtzV99q0oB/zGXGO4pj1fOq25ejPRPxmSJgpzk6CdR1ZXCgjd
 rz4LjGA==
X-Google-Smtp-Source: AGHT+IEwA7Qpp8ao4rWdHbppwQ5QhNfmRpN5wkAQqKkpCR4yDSwJnC+nC2ax3rUL0/bzFrAvX1sGOA==
X-Received: by 2002:a05:6000:90:b0:374:b97b:c69 with SMTP id
 ffacd0b85a97d-378c2d5514fmr5750180f8f.48.1726319973382; 
 Sat, 14 Sep 2024 06:19:33 -0700 (PDT)
Received: from ?IPV6:2a02:61:a2::9b5? ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e71f0600sm1774430f8f.9.2024.09.14.06.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 06:19:32 -0700 (PDT)
Message-ID: <4a227922-5fc5-421a-82e5-eda9b7b30cf9@mind.be>
Date: Sat, 14 Sep 2024 15:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Taubert <info@arachnodroid.de>, buildroot@buildroot.org
References: <20240506083220.4066-2-info@arachnodroid.de>
Content-Language: en-GB
In-Reply-To: <20240506083220.4066-2-info@arachnodroid.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726319974; x=1726924774; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=335j8QZif1KjGF0eT5Z1oCrJiYPgSyZEgCphdeiewew=;
 b=ROa+xd6DvQr/ZnH308D9qspIF5Gsxs2aY3xADJLdt+AqHdX0YBbpKyiC8jqIATbogU
 4+hJCUtELFT3QPqjMEHTgp62CAzGaEc4OXiYnUIosOHDgcaPGWoNXkO+FckVzjTb8bOX
 PN66ZMETwlrKpUoihaDQ7M/Qv2SUIOz/52kXkt5u1LhVOUAc9CE89ed/nowAyZiooj/O
 h0/QNUgtLB5WWDh+kk2Ow4g3vVbrmXsK9G/a5tcC9Qy5UH9K5XGuw6nrC7jR4J0vqEqe
 A5nW7sKrHdnKKezUAX+8REInBCVnSAcfxEnMtiTRnjDorpOYr/Hs9bKUsA1iPaNaydO/
 VmyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ROa+xd6D
Subject: Re: [Buildroot] [RESEND PATCH 1/1] package/gstreamer1: bump version
 to 1.24.3
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
Cc: Michael Taubert <michael@arachnodroid.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Michael,

  Sorry for not reacting for so long - especially because I'm going to react 
negatively... Bumping gstreamer is obviously a great thing, but I can't apply it 
as is.

On 06/05/2024 10:32, Michael Taubert wrote:
> From: Michael Taubert <michael@arachnodroid.de>
> 
> Sorry for the wrapped lines in the first submission. This time using git.

  Comments like this shouldn't be in the commit history. Instead, it should be 
at the end of the commit message, below the --- line. This way, it gets stripped 
when we apply it.

> GStreamer 1.24.3 fixes some 'garbled video' problems, caused by missing DRM dmabuf modifiers.
> There are a lot of changes and fixes. Please check https://gstreamer.freedesktop.org/releases/1.24/
> for more details.
> 
> Outline:
> - bumped gstreamer version to 1.24.3
> - bumped gst-plugins-* version to 1.24.3

  There should be a separate commit for every individual package. This is not 
super important for everything that has the same 1.24.3 version, but for the 
more independent ones (like gst-imx), it really has to be a separate patch.

> - bumped gst-devtools version to 1.24.3
> - bumped gst-imx version to 2.2.0
> - bumped gst-python version to 1.24.3
> - bumped gst-rtsp-server version to 1.24.3
> - bumped gst-vaapi version to 1.24.3 (should be considered deprecated now)
> - bumped gstreamer-editing-service version to 1.24.3
> - removed gst-omx (obsolete; use v4l2codecs instead)

  This also really has to be a separate patch, with a little more explanation 
(e.g. it may not work any more with 1.24.3 to begin with).

> - select missing wpe_mux for plugin wpe
> - removed webrtc-audio-processing patch (already applied now)
> 
> Runtime test of gst1-python succeeded with the reference docker image. Additionally, I've compiled
> with as much plugins enabled as possible.

  When it is split up, you typically would also write a cover letter, and this 
would be perfect for the cover letter.

> 
> Best regards,
> Michael
> 
> Signed-off-by: Michael Taubert <michael@arachnodroid.de>
[snip]
> diff --git a/package/gstreamer1/gst-omx/Config.in b/package/gstreamer1/gst-omx/Config.in
> deleted file mode 100644
> index efe3d211d6..0000000000
> --- a/package/gstreamer1/gst-omx/Config.in
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -config BR2_PACKAGE_GST_OMX

  When you remove (or rename) a package, the symbol should be added to 
Config.in.legacy.

> -	bool "gst-omx"
> -	depends on BR2_PACKAGE_HAS_LIBOPENMAX
> -	select BR2_PACKAGE_GST1_PLUGINS_BASE
> -	help
> -	  GStreamer plug-in to use OpenMAX API.
> -
> -	  https://cgit.freedesktop.org/gstreamer/gst-omx

[snip]
> diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
> index 6cf7c9597f..689d10451b 100644
> --- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
> +++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
> @@ -1,3 +1,5 @@
>   # From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.9.tar.xz.sha256sum
>   sha256  02e29400b44e9cc603aa6444dee5726b57edabef6455e6d0921ffed6f13840ee  gst-devtools-1.22.9.tar.xz
> +# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.3.tar.xz.sha256sum
> +sha256  b91114a2fd958f42acf441186e87e2bec93538ef35a9f8248111197360ffb237  gst-devtools-1.24.3.tar.xz

  Don't just add the new hash, instead replace the existing one.
[snip]
> diff --git a/package/gstreamer1/gst1-plugins-bad/0001-webrtcdsp-Update-code-for-webrtc-audio-processing-1.patch b/package/gstreamer1/gst1-plugins-bad/0001-webrtcdsp-Update-code-for-webrtc-audio-processing-1.patch
> deleted file mode 100644
> index a2ab0ef6d8..0000000000
> --- a/package/gstreamer1/gst1-plugins-bad/0001-webrtcdsp-Update-code-for-webrtc-audio-processing-1.patch
> +++ /dev/null
> @@ -1,883 +0,0 @@
> -From d5755744c3e2b70e9f04704ae9d18b928d9fa456 Mon Sep 17 00:00:00 2001
> -From: Arun Raghavan <arun@asymptotic.io>
> -Date: Wed, 2 Dec 2020 18:31:44 -0500
> -Subject: [PATCH] webrtcdsp: Update code for webrtc-audio-processing-1

  The commit message (for the gst1-plugins-bad bump) should explain why this 
patch is removed. Something like "Removed patch 0001, comes from upstream."
[snip]

> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index d2c60ec9ce..4aacf2951a 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -32,6 +32,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AIFF
>   	help
>   	  Create and parse Audio interchange File Format (AIFF) files
>   
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ANALYTICSOVERLAY
> +	bool "analyticsoverlay"
> +	help
> +	  Visualises object-detection metas on a video stream
> +
>   config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASFMUX
>   	bool "asfmux"
>   	help
> @@ -77,6 +82,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CAMERABIN2
>   	help
>   	  Take image snapshots and record movies from camera
>   
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CODEC2JSON
> +	bool "codec2json"
> +	depends on BR2_PACKAGE_JSON_GLIB

  This should be select instead of depends on. Normally this means you have to 
propagate the dependencies of json-glib, but in this case they're just from 
libglib2, which is already a dependency of gstreamer, so not needed.
[snip]
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index a61038376f..ec3724f566 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GST1_PLUGINS_BAD_VERSION = 1.22.9
> +GST1_PLUGINS_BAD_VERSION = 1.24.3
>   GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
>   GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
>   GST1_PLUGINS_BAD_INSTALL_STAGING = YES
> @@ -34,6 +34,7 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
>   
>   # Options which require currently unpackaged libraries
>   GST1_PLUGINS_BAD_CONF_OPTS += \
> +	-Daja=disabled \

  Please also explain in the commit message why these are disabled.

>   	-Dasio=disabled \
>   	-Davtp=disabled \
>   	-Dopensles=disabled \
> @@ -49,8 +50,8 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
>   	-Dflite=disabled \
>   	-Dgs=disabled \
>   	-Dgsm=disabled \
> -	-Dkate=disabled \
>   	-Dladspa=disabled \
> +	-Dlc3=disabled \
>   	-Dldac=disabled \
>   	-Dlv2=disabled \
>   	-Dmediafoundation=disabled \

[snip]
> diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
> index e1e2674a4a..0779b3d71d 100644
> --- a/package/gstreamer1/gst1-plugins-good/Config.in
> +++ b/package/gstreamer1/gst1-plugins-good/Config.in
> @@ -263,6 +263,16 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2
>   	select BR2_PACKAGE_LIBXML2
>   	select BR2_PACKAGE_LIBSOUP3
>   
> +config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AMRNB
> +	bool "amrnb"
> +	help
> +	  Adaptive Multi-Rate Narrow-Band audio codec plugin
> +
> +config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AMRWBDEC
> +	bool "amrwbdec"
> +	help
> +	  Adaptive Multi-Rate Wide-Band audio decoder plugin
> +
>   config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME
>   	bool "lame (*.mp3 audio encoder)"
>   	select BR2_PACKAGE_LAME
> @@ -297,8 +307,8 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
>   	help
>   	  QT5 plugin which includes elements qmlglsrc and qmlglsink
>   
> -comment "qmlgl (qt5) needs the gst1-plugins-base opengl library"
> -	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
> +comment "qmlgl (qt5) needs the gst1-plugins-base opengl library and QT5"
> +	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL || !BR2_PACKAGE_QT5

  This change should also be a separate commit, because it's completely 
independent of the version bump. In particular, this one should be backported to 
the stable branches, which is only possible if it's a separate commit.

>   
>   config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2
>   	bool "shout2"
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
> index 4410da6ef4..3cce274404 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
> @@ -1,3 +1,5 @@
>   # From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.9.tar.xz.sha256sum
>   sha256  26959fcfebfff637d4ea08ef40316baf31b61bb7729820b0684e800c3a1478b6  gst-plugins-good-1.22.9.tar.xz
> +# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.3.tar.xz.sha256sum
> +sha256  150f914e61dc05600b68b88ca103c7cc227130158e389ea9ea159f4050a2ebb0  gst-plugins-good-1.24.3.tar.xz
>   sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> index a1ad63915d..50f8a6db4d 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GST1_PLUGINS_GOOD_VERSION = 1.22.9
> +GST1_PLUGINS_GOOD_VERSION = 1.24.3
>   GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
>   GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
>   GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
> @@ -27,6 +27,7 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
>   	-Dosxvideo=disabled \
>   	-Daalib=disabled \
>   	-Dlibcaca=disabled \
> +	-Dqt6=disabled \

  Also here it would be nice to comment why it's excluded (e.g. never tested 
with qt6 so exclude it for now).

>   	-Ddoc=disabled
>   
>   # Options which require currently unpackaged libraries
> @@ -65,6 +66,18 @@ else
>   GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=disabled
>   endif
>   
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_AMRNB), y)

  This should be BR2_PACKAGE_GST1_PLUGINS_GOOD_APLUGIN_MRNB

  check-package catches that, please use it!

  Regards,
  Arnout

> +GST1_PLUGINS_GOOD_CONF_OPTS += -Damrnb=enabled
> +else
> +GST1_PLUGINS_GOOD_CONF_OPTS += -Damrnb=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_AMRWBDEC), y)
> +GST1_PLUGINS_GOOD_CONF_OPTS += -Damrwbdec=enabled
> +else
> +GST1_PLUGINS_GOOD_CONF_OPTS += -Damrwbdec=disabled
> +endif
> +
>   ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA),y)
>   GST1_PLUGINS_GOOD_CONF_OPTS += -Dalpha=enabled
>   else
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
