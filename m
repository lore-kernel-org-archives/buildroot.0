Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8FEC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD86D60790;
	Thu, 26 Jun 2025 19:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aq-3U6leLJ4a; Thu, 26 Jun 2025 19:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAB3C612A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAB3C612A7;
	Thu, 26 Jun 2025 19:53:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1583D10A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04613402A7
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kK5ngKhXJXRu for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:53:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00CCD40075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00CCD40075
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00CCD40075
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so1011410f8f.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967616; x=1751572416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1TY1avbqfXioGSI3ZfKSekXihp6OS5qcNTx80qXEtks=;
 b=IIGJtaC7ORw7qXejD/AuYYZjHLTwaLaL1YLqRxbSEZIfWxr/iR7azl8q46aOI9SQIP
 xK5DEno+YnRGAR4+Vd1LPAYbLNpi/30Xl2TvzOcyCsSFJiVzBH2NdmLXgfI2wWPYiAhJ
 nSGuXP3EGanKXj6dkBwhwh4ipXhoSV9dwbqqSHendIpchwV3oKUGWSwXkFIkw5ntfFwo
 mTl19PidL4NRXsyot7TpaO+7nM8nkH+zeJFKZw8yLgxCDj/6jgLZRevi/mtKl5qD4baY
 qNr08FMk8fjjT73itOSBgUKpfi35MqDVjlFMJ4b6Z18pbdSYclil4Ej+elojVJJeQeau
 hjjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3QAy6eN9R9lRDnoi5pXKyqCv5nG2q3YgRK7V1uWsAG6/EEGTgn6qWWhBXcOHvEhzOZJouO1Wotrw=@buildroot.org
X-Gm-Message-State: AOJu0YyDgxZKx4Qy5ysP314IfTsRohv3G4R7B/+GolBDjLfNnKT6uPyV
 lpna+UMzG2Fr+n/JXowmgZ0JtSkLnj3UKdxUbq5yA2Q0nYmCO9UQQ1dCHI2cBznI0kM=
X-Gm-Gg: ASbGncvyBl1BLK7H9TtJYckm5lbfZbiflAz0xaawVKVvKH3OHgiiWp8rjdcBf0/gMd7
 IuVoRmLpoIAxsdG2cHMkqUFmB+qe2eOqUZ0R6LtKGVOhz1ohHbv3o5Kxjl6dhEMeKmaDvkccXmM
 THMY6rVga88T1JcQQdWUkf7xd0iTd+6el/Ra1VSwY20ZR4QcaDea1mioXSGvFF8pYmUHxuh7ggp
 VdxCSobHg+lx64lnNZ61yvq5BxI60QbLx3GGsOsAoauiq7GezzYLTf+SJWmZkSznqrj7DA1I38U
 cOeOezQHm+x340Cr0x31IvZuXHgVx2/YMCwD2Ca+rkAZEsfvDrerGq8oGA85A3olocSuCyeOoNP
 rBuB8gV6eBiN4ljgeZDsmqlOTB/1LShQF
X-Google-Smtp-Source: AGHT+IE6oCdI+wbglVJftbBAhCMIlKJXD1HE5nK8WvMx4XwYDrPE7vNvX0HwJN9jU+0KF2esD9w2Lw==
X-Received: by 2002:a05:6000:18aa:b0:3a8:6260:ea91 with SMTP id
 ffacd0b85a97d-3a917bc76e5mr544892f8f.40.1750967615864; 
 Thu, 26 Jun 2025 12:53:35 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3a72dasm28483175e9.16.2025.06.26.12.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:53:35 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:53:26 +0200
Message-ID: <20250626195326.15181-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614111002.66221-1-bernd@kuhls.net>
References: <20250614111002.66221-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967616; x=1751572416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1TY1avbqfXioGSI3ZfKSekXihp6OS5qcNTx80qXEtks=;
 b=BbuPQYl1PyhmHA5LJ5RaHG9s0kfYAPdf8fyVCTztN9iwJdcYz3m0gVq5/dAkrjWEGp
 9o/mawfPsCk5N3JF+ffp2E0t6iQKZmAZLEBEEpYDBNBI1npkErCNbTWFqiLfZGIf8RR2
 p6Em61kPCeJNz9/GD/QMiVlG11O3WABxgQesoM8HvaYNhc1pCrpYGBf6tfHbyoSCZPa4
 H1oTtBlECxQuZJIFmv/kfAKUhjQSAz8oik1zK3DghGjW1ctgHn6GiL5ZP82Wu9FD4szB
 kJ9lRjoqn9gXUgd21uPmvR+lkzOCgmJtICmFyM3CuY8z9QR1EXi64sHk9WuMcY37xMcV
 OFdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BbuPQYl1
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

Applied to 2025.05.x. Thanks

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
