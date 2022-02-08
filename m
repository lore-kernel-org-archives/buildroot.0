Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCDBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73C3D405C1;
	Tue,  8 Feb 2022 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVu8DAS47f0Q; Tue,  8 Feb 2022 21:09:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D289408C3;
	Tue,  8 Feb 2022 21:09:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 192E01BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07DBB60A99
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 087neXjWgpSR for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:09:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE4D5600CA
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:09:47 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id p24so1434387ejo.1
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 13:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n1RpVdW0T4ALCF9pWaQgHD45Pb8WAuovSXLB6ZSwYNo=;
 b=dvrejlrRDMm+XCqqxH5CJdzClVASfJjkkQLoJ/QUrgrohov+Tw2NcLlApI4MbNCIAQ
 QD4QOlFJPHu0un4YeOsmDzdlatL6Wq8Y81f9OkC0Mzz0HoQ057hY6uIr2AkAVlsULrYV
 oiB7+LFbC2F9IgmpdqPCGtDvHY+/prHFYijooQv6hgHKjNgSAvpWHuSnlKKEJ84RbaK/
 lqw4Fyn/3WWoJ0F1bnq92k/IouoJwxaHA6kSPYaDpjuZqTAJiyfDG5sWtFOu6YN4h2Ur
 TAcUtBnEItqapQ6MrRsbIMyltR0TCOVOBsN2RaQbMacRDKZkSGPDIadjVcthEIH3uz6R
 Xzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n1RpVdW0T4ALCF9pWaQgHD45Pb8WAuovSXLB6ZSwYNo=;
 b=DcqwxTCt9ddUxh55Frv/mkKwsFYjJ0zWneAlUIctOh+IaI/Gs2losABBznwYElHmRe
 3oT5U8+CWTxjx3gBDGQy6y5uB4QAETYXAvzAxK8ZIm/SO23vBS3qtraAs9xWBj/odB1J
 D+TCVfVS6uKnEQLeYSZWFZIDwJOoaDrQFo7ktGU/ZlGHqnBU2Np//67i+fwQ9rzY/Gmf
 BK/nI5nZTZCqf6Y33OZ7im2mWf5sFY4P0ZCMn0T/PdgzFWWHG/LdjwFazN43ndHiv58/
 V++PdR+DXd2AjGf9DXwkPt2IGAn38WOFMg5jizJzLFc8Waa8UjmakLtepRZPNnnwQGNh
 9JDA==
X-Gm-Message-State: AOAM530C0ZZmJMPOxdWEvyCx0YlCzdfLgzCmfbd6L2HkcQ5mVifXZCI+
 Jv9Ug+UgvYLSJWzQrqAzJpLm+IKPMui77w==
X-Google-Smtp-Source: ABdhPJyGXRG1IFye31yWFF2zc6qi5OIoVW9lklBeIIU7tTeRFJKrYmJ4xbDaRGBabJPihkKZ4/WCkQ==
X-Received: by 2002:a17:907:2da5:: with SMTP id
 gt37mr5241722ejc.529.1644354585508; 
 Tue, 08 Feb 2022 13:09:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ed11sm2791428edb.81.2022.02.08.13.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 13:09:44 -0800 (PST)
Message-ID: <b471621d-c852-fbe1-54ca-0970480cbc36@mind.be>
Date: Tue, 8 Feb 2022 22:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20210502095925.10744-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210502095925.10744-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v5] package/libcamera-apps: new package
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/05/2021 11:59, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  (Finally) applied to master, thanks. However...

[snip]
> diff --git a/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch b/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
> new file mode 100644
> index 0000000000..11d19fa526
> --- /dev/null
> +++ b/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
> @@ -0,0 +1,25 @@
> +From 22096ef8cfb18563c1955145db24742081910e10 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Fri, 5 Feb 2021 18:24:08 +0100
> +Subject: [PATCH] cmake: remove -Wfatal-errors compiler command line option
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + CMakeLists.txt | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 4191245..199a0f6 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -10,7 +10,6 @@ endif()
> + set (CMAKE_EXPORT_COMPILE_COMMANDS ON)
> + set (CMAKE_CXX_STANDARD 17)
> + set (CMAKE CXX_FLAGS "-Wall -Wextra -pedantic -Wno-unused-parameter -faligned-new")
> +-add_definitions(-Wfatal-errors)

  Why is this patch needed? The only thing that -Wfatal-errors does is to stop 
compilation when there is an error, instead of trying to continue and find more 
errors in the rest of the file. It's not -Werror.

  I kept the patch anyway because I didn't test without it.


  Regards,
  Arnout


> + add_definitions(-Wno-psabi)
> + add_definitions(-DBOOST_LOG_DYN_LINK)
> +
> +--
> +2.30.0
> +
> diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
> new file mode 100644
> index 0000000000..08667eb830
> --- /dev/null
> +++ b/package/libcamera-apps/Config.in
> @@ -0,0 +1,31 @@
> +config BR2_PACKAGE_LIBCAMERA_APPS
> +	bool "libcamera-apps"
> +	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
> +	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost/libdrm
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
> +	depends on !BR2_STATIC_LIBS # gnutls/libcamera
> +	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBCAMERA
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_LIBEPOXY
> +	select BR2_PACKAGE_LIBEXIF
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_TIFF
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	help
> +	  This is a small suite of libcamera-based apps that aim to copy
> +	  the functionality of the existing "raspicam" apps.
> +
> +	  https://github.com/raspberrypi/libcamera-apps
> +
> +comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7 and needs an OpenGL and/or OpenGL EGL backend"
> +	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
> +	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
> new file mode 100644
> index 0000000000..da426434c1
> --- /dev/null
> +++ b/package/libcamera-apps/libcamera-apps.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  9b3475e1c817cbcf942c4be0dac3d1f6bf2ee192b0ca5edb95c85c06c5a12b4f  libcamera-apps-326fdfd120a0f62b7e76f4ee8aa0c82c2bf008e6.tar.gz
> +sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
> diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
> new file mode 100644
> index 0000000000..5edcefefad
> --- /dev/null
> +++ b/package/libcamera-apps/libcamera-apps.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# libcamera-apps
> +#
> +################################################################################
> +
> +LIBCAMERA_APPS_VERSION = 326fdfd120a0f62b7e76f4ee8aa0c82c2bf008e6
> +LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,$(LIBCAMERA_APPS_VERSION))
> +LIBCAMERA_APPS_LICENSE = BSD-2-Clause
> +LIBCAMERA_APPS_LICENSE_FILES = license.txt
> +LIBCAMERA_APPS_DEPENDENCIES = \
> +	host-pkgconf \
> +	boost \
> +	jpeg \
> +	libcamera \
> +	libdrm \
> +	libexif \
> +	libepoxy \
> +	libpng \
> +	tiff \
> +	xlib_libX11
> +
> +LIBCAMERA_APPS_CONF_OPTS = -DENABLE_COMPILE_FLAGS_FOR_TARGET=disabled
> +
> +$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
