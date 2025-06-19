Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBA7C7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 13:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41AD16084F;
	Thu, 19 Jun 2025 13:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBwNhHuYGoq8; Thu, 19 Jun 2025 13:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DACD608A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DACD608A6;
	Thu, 19 Jun 2025 13:53:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D5C8E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F0BB608A6
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TxM9QYxoeedb for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 13:53:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 428E96084F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 428E96084F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 428E96084F
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:01 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso6740185e9.2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 06:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750341179; x=1750945979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TGDLdUG95lwKn3tBfnn3HZWV9PbAl5gCb7MMkp297fk=;
 b=i+EHyGLLt0XLzXEvoVV0wSF77IohLXAjVgqPDQqTGMXAd4UzYWVgByhWe/KIZV/i5g
 SFmFiO+gE1Cma6RTuXYsODFjKO+AW2o0m5NRaTgbv4MqJO3prJxpwyqNCZIHcXgPlzN6
 dlruyNQ2EkNGbTpyVKfD9/3b1Asn6+Z7qmhLEOcYOta53piPYIusRFQ4HQn+20Cqs5K+
 2ZBlgtYKMBefv/O8D+8IivUkLtPVn+Wvrz4JTFjOhXXPLStssgjg1nbL9NQRhIAkW0zK
 0qbv5eFRkhLVMoVlWHOZmwkeNK7FsWrj3qfz/OZAlu4BmzgX6yhTDcVuRCn4Ty1D3Kaw
 IQmQ==
X-Gm-Message-State: AOJu0Yw85nB4SE+t6S38Mdk8wvlUNuzF3n8tKMHuKbP8VLDCNFfURgEn
 /qiQjEvOLx9Ly/xui6mXLGDJE47ktl0pURKCE4LRPtGPpvvBjqqJmIgk9HssVLRCf2zrAYQGdYs
 VFCKC
X-Gm-Gg: ASbGncvvzFauSnuSnwC8ejme+3Y9QDVVO1tBUFPyWh+2bQ62pJu1s32ydJg3a26Hh6B
 Sc/opBJLC82FDNbSIPnPOlUYQrtSL9swbeE0DS4v+69kbtjcmWyjzRp2bYtAE5gK+nPIWCPSM4T
 YrZux+u3e/QhtZWqJHxKFBDs3wR6GiatoZS2Yp2cetcqQwP1/t3UzJNMXu/9xTCHVTsO9pI+Hs8
 SNl6HJ3F3VyeDe+5uOZjr9pwHxJhZrfoxrCU5rjJWi0Ux8p1LMKtGFxLwN+yagj4pU8yGynX8sV
 iDecbiDnblYmTTnncbf+c6CHkXc9a9AZaFhFYhnEPzkSX+eRCznzHCfwvOcKhoUUMiQrOmXGdRy
 R
X-Google-Smtp-Source: AGHT+IGL/uwQbNGP2Pxx+JlrMQCrDj9JxYcJBikbH4Akpa7igkZv8c7ujI5+DdkoncXvB7z3eIdUAg==
X-Received: by 2002:a05:600c:1912:b0:442:e147:bea7 with SMTP id
 5b1f17b1804b1-4533cac30b4mr198207455e9.29.1750341178944; 
 Thu, 19 Jun 2025 06:52:58 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a7ddefsm19666930f8f.39.2025.06.19.06.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 06:52:58 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 19 Jun 2025 15:52:50 +0200
Message-ID: <20250619135250.405800-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750341179; x=1750945979; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TGDLdUG95lwKn3tBfnn3HZWV9PbAl5gCb7MMkp297fk=;
 b=A4NMVi5GMLWFcxQMyz3AGt1x4IVfNzP+4BaY3caRXuLmLDyw3GqqXuXS37RJsJaebQ
 sKsOnQpTHoZHRHRS2UPxJtVyc1Ve76qZ/K/EPMZgj9bhlASqYPTMHi9rgrDuiOzMoDBK
 LNzIIUb5Ao9lYuRBaQPzj+oVosOCjRmildw4rSyjw5xmZC1d0W+PTAFoFhVHQyJa/YZo
 11YlzUbLRWyXXf0j6+7to3zl8KDJ5NSbQD+QLwAI6nEZI191qRmYtRMN3BTpLLStgD/n
 KRHA5kUVxoshVg8BWBebfNZowYXfSvulUWjGWBKbuH5IOBjt5rIFYr1J9lmF9i5mwGYk
 mxpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A4NMVi5G
Subject: Re: [Buildroot] [PATCH 1/1] package/libebur128: remove package
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
> libebur128 was added to buildroot in July 2016 with commit
> a32d29cd84789d7406022c7bb9861e5bda530013 to provide an external
> dependency for ffmpeg.
> 
> ffmpeg removed this external dependency and switched to an internal
> version in November 2016 with upstream commit
> http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=005d058f4230f3207ebcf1131df7426d4f57392f
> which was first included in ffmpeg version 3.3.
> 
> Buildroot bumped ffmpeg to version 3.3 in April 2017 with commit
> 21d93a1351ca8d4e5185c22a81becdaf08a9bdd3 and forgot to remove the
> dependency to libebur128.
> 
> This went unnoticed until libebur128 fails to build with cmake 4.x.
> Upstream saw its last commit four years ago. Instead of fixing an
> unused package we removed it from buildroot.
> 
> Fixes:
> https://autobuild.buildroot.org/results/e629bd151cc539f01b909e44d07e17451a29ba27/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  Config.in.legacy                   |  6 ++++++
>  DEVELOPERS                         |  1 -
>  package/Config.in                  |  1 -
>  package/ffmpeg/ffmpeg.mk           |  4 ----
>  package/libebur128/Config.in       | 13 -------------
>  package/libebur128/libebur128.hash |  3 ---
>  package/libebur128/libebur128.mk   | 13 -------------
>  7 files changed, 6 insertions(+), 35 deletions(-)
>  delete mode 100644 package/libebur128/Config.in
>  delete mode 100644 package/libebur128/libebur128.hash
>  delete mode 100644 package/libebur128/libebur128.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 3084e7336e..c94bc1a226 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>  
>  comment "Legacy options removed in 2025.08"
>  
> +config BR2_PACKAGE_LIBEBUR128
> +	bool "libebur128 has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The libebur128 package has been removed from Buildroot.
> +
>  config BR2_KERNEL_HEADERS_6_14
>  	bool "kernel headers version 6.14.x are no longer supported"
>  	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0478e47c98..e664f35a28 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -412,7 +412,6 @@ F:	package/libdvbcsa/
>  F:	package/libdvdcss/
>  F:	package/libdvdnav/
>  F:	package/libdvdread/
> -F:	package/libebur128/
>  F:	package/libfreeglut/
>  F:	package/libfribidi/
>  F:	package/libg7221/
> diff --git a/package/Config.in b/package/Config.in
> index 99a5e2928e..af32b39e44 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1555,7 +1555,6 @@ menu "Audio/Sound"
>  	source "package/libcodec2/Config.in"
>  	source "package/libcue/Config.in"
>  	source "package/libcuefile/Config.in"
> -	source "package/libebur128/Config.in"
>  	source "package/libg7221/Config.in"
>  	source "package/libgsm/Config.in"
>  	source "package/libid3tag/Config.in"
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 5c00ba2dff..30cf7020de 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -243,10 +243,6 @@ FFMPEG_CONF_OPTS += --disable-openssl
>  endif
>  endif
>  
> -ifeq ($(BR2_PACKAGE_FFMPEG_GPL)$(BR2_PACKAGE_LIBEBUR128),yy)
> -FFMPEG_DEPENDENCIES += libebur128
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBDRM),y)
>  FFMPEG_CONF_OPTS += --enable-libdrm
>  FFMPEG_DEPENDENCIES += libdrm
> diff --git a/package/libebur128/Config.in b/package/libebur128/Config.in
> deleted file mode 100644
> index 0d68b39d53..0000000000
> --- a/package/libebur128/Config.in
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -config BR2_PACKAGE_LIBEBUR128
> -	bool "libebur128"
> -	# build system has no support to disable shared linking
> -	# leading to a build error with a static-only toolchain
> -	depends on !BR2_STATIC_LIBS
> -	help
> -	  libebur128 is a library that implements the EBU R 128 standard
> -	  for loudness normalization.
> -
> -	  https://github.com/jiixyj/libebur128
> -
> -comment "libebur128 needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> diff --git a/package/libebur128/libebur128.hash b/package/libebur128/libebur128.hash
> deleted file mode 100644
> index 9c8c9e0c31..0000000000
> --- a/package/libebur128/libebur128.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally computed
> -sha256  baa7fc293a3d4651e244d8022ad03ab797ca3c2ad8442c43199afe8059faa613  libebur128-1.2.6.tar.gz
> -sha256  d6b4754bb67bdd08b97d5d11b2d7434997a371585a78fe77007149df3af8d09c  COPYING
> diff --git a/package/libebur128/libebur128.mk b/package/libebur128/libebur128.mk
> deleted file mode 100644
> index b7272fa7e1..0000000000
> --- a/package/libebur128/libebur128.mk
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -################################################################################
> -#
> -# libebur128
> -#
> -################################################################################
> -
> -LIBEBUR128_VERSION = 1.2.6
> -LIBEBUR128_SITE = $(call github,jiixyj,libebur128,v$(LIBEBUR128_VERSION))
> -LIBEBUR128_LICENSE = MIT
> -LIBEBUR128_LICENSE_FILES = COPYING
> -LIBEBUR128_INSTALL_STAGING = YES
> -
> -$(eval $(cmake-package))
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
