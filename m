Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D53BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16F5F84060;
	Sun, 10 Apr 2022 15:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCk0vTfkSQ5a; Sun, 10 Apr 2022 15:08:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9DEB8405B;
	Sun, 10 Apr 2022 15:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A678E1BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 949AE607C9
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hr1eJrDxbab6 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:07:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33421607A4
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:07:58 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id c64so3215081edf.11
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VG0kSOp5TZT0VUSzG7V8ijKbwq3v4bwuMaqFFZ5JsEQ=;
 b=AD1eU9lmQQqU6EKuLPyTXu8sx61nv0sMyIs1CYsgScKwgt4B4bGT4/SW8WsomQiq/j
 +CKgS6UiyLRU57k0pucq/hoGYQBMH9SktsucJ+2p+EBimDtj+pxcuc3MpWz/fkU4D4Om
 I6XXHEK0Jd03T49AIP8kJ/gLF2xbyHjOFRwxHhsDGhwSCQKvaFy/e4NJss6D7ofndzyz
 p1ybOh7j1PB3uTukf/OImJeViskQBFEHyalcdt8NByxcsx4Iq4gIIByrVWcWmmJyG00U
 MZqH3r6yxTx3HH87/3HsJqQQFqW+X8xbjIG4Ju43QyrfAG1R9Gqy8nSDkvuhYlr9Oi55
 uABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VG0kSOp5TZT0VUSzG7V8ijKbwq3v4bwuMaqFFZ5JsEQ=;
 b=dxolaRrRaO4OCDnQtuWg9P/P8/bu19fptwF/xH55yyEkgChNUMwdr63UU0hO1/kCST
 D1D/Q1fLW0exJVjG6vl8m6ZpEBXQqThcoJUSx1k7WTvmrg3PRpJD7OZ9/0M1ApIO5kio
 Jg6kttbqJHYzbvs/gm4naFQPnynJMIP1q5gXoES/QQPFNE9Tg14VD6Quvw77eguETlz0
 9GY5/mWabQ0irPVODfoSY/CQNjIJ940Ndv5ccG4E/F6xqmeGp/oS5KwopJuBIM8Zsy7s
 OsVWPQ12qtRX3Wah+3Z7sLkZgMSOtGfFXQdcpSPpaGpvls/91X7wr5s7p3D4OIcSU5Xp
 MXqA==
X-Gm-Message-State: AOAM531HVygkHxGbkBxCgaaC6zvC8BBcm2vAh8RK2oQx8M6Z9ukfOx9w
 urtGb57h7HKNjIVXFJ5KNbjn+Fmj2kq79Q==
X-Google-Smtp-Source: ABdhPJzheOATo+Ec7bAVw5IJt3jGRQvHFKxDx/6acehFXJmUxkmQivhhR2axEjrw8WTFPSHfjJoKYw==
X-Received: by 2002:a05:6402:524c:b0:419:4d8c:e959 with SMTP id
 t12-20020a056402524c00b004194d8ce959mr29422575edd.398.1649603277214; 
 Sun, 10 Apr 2022 08:07:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 wn10-20020a170907068a00b006e87d354452sm1245295ejb.29.2022.04.10.08.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 08:07:56 -0700 (PDT)
Message-ID: <835e1fb4-8e41-4402-fdbc-17032be4cd6d@mind.be>
Date: Sun, 10 Apr 2022 17:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220405194916.1754126-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405194916.1754126-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 needs C++
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
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 21:49, Fabrice Fontaine wrote:
> gst1-plugins-bad needs C++ since switch to meson-package in commit
> 5d6c408e9535be4b5ba0c8a49215d2d03dcb5cd5:
> 
> The following exception(s) were encountered:
> Running "/home/autobuild/autobuild/instance-8/output-1/host/bin/microblaze-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-8/output-1/host/bin/microblaze-buildroot-linux-musl-g++'"

  Again, I looked at instead fixing the meson.build so C++ is only required for 
the modules that really use C++, but it doesn't look to be that simple. So 
applied to master, thanks.

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8f924cebeb8a1ed73e57103bf3073fb8f8d8752e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/gstreamer1/gst1-imx/Config.in         | 6 ++++--
>   package/gstreamer1/gst1-plugins-bad/Config.in | 4 ++++
>   package/gstreamer1/gst1-vaapi/Config.in       | 5 +++--
>   3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
> index 7b46233b53..41ef8548c5 100644
> --- a/package/gstreamer1/gst1-imx/Config.in
> +++ b/package/gstreamer1/gst1-imx/Config.in
> @@ -88,11 +88,13 @@ config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC
>   config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSINK
>   	bool "imxv4l2videosink"
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2 # V4L2_COLORSPACE_DEFAULT
> +	depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
>   	select BR2_PACKAGE_GST1_PLUGINS_BAD
>   	help
>   	  Elements for V4L2 output
>   
> -comment "imxv4l2videosink needs a toolchain w/ headers >= 4.2"
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
> +comment "imxv4l2videosink needs a toolchain w/ headers >= 4.2, C++"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2 || \
> +		!BR2_INSTALL_LIBSTDCPP
>   
>   endif
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 234d57636b..669360adb1 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -1,5 +1,6 @@
>   menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD
>   	bool "gst1-plugins-bad"
> +	depends on BR2_INSTALL_LIBSTDCPP
>   	select BR2_PACKAGE_GST1_PLUGINS_BASE
>   	help
>   	  A set of plug-ins for GStreamer that may be of poor quality
> @@ -724,3 +725,6 @@ comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
>   		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
>   
>   endif
> +
> +comment "gst1-plugins-bad needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
> index 91bd4f85dd..ade8b83a5f 100644
> --- a/package/gstreamer1/gst1-vaapi/Config.in
> +++ b/package/gstreamer1/gst1-vaapi/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_GST1_VAAPI
>   	bool "gst1-vaapi"
>   	depends on !BR2_STATIC_LIBS # dlopen(), libva
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libva, libdrm
> +	depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
>   	depends on BR2_PACKAGE_HAS_UDEV
>   	select BR2_PACKAGE_LIBVA
>   	select BR2_PACKAGE_LIBDRM
> @@ -45,6 +46,6 @@ config BR2_PACKAGE_GST1_VAAPI_ENCODERS
>   
>   endif
>   
> -comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library"
> +comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library, C++"
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> -		!BR2_PACKAGE_HAS_UDEV
> +		!BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
