Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88754CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55C2C84ABA;
	Thu, 11 Sep 2025 19:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cs3Xh2a6utpU; Thu, 11 Sep 2025 19:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B2B084ABE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B2B084ABE;
	Thu, 11 Sep 2025 19:21:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D7E0443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53C4A60E37
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYu5-8lMmQA0 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:20:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DEE0616AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DEE0616AA
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DEE0616AA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:20:57 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-624fdf51b44so1392367a12.1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618456; x=1758223256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ezPiy1xsn6Rj9AYUv/KfoIaUIGp1b1w9/2c1mkCv/A=;
 b=SHcLiWDrxdwf/D+i2I246SS5ZcBWzNHsbpzT2ScePWWNn/eoXNEd+owYTOYipxMRD+
 eMttWYkPdQiq1xtuvzabv9Dfwhy8JiNF1vq9eCHWObKtJGEAR5ulKcSRX/Y93zMqSjR8
 l4rOgEGvSrqKcTTFm+eFu2r2pnanwFuoiJhmumgDJaM6U+62qKc7thqrLeeCmlaPcBVu
 ILcVw1wgK+fRFbLqoUGTsCdcDGqdQQiPnb2ypdAshc0GbJDrTH/Oib3EpF+Fe1xxVm3u
 Hg5R738V8s3ton38wcQLKsBLghQK3NSoWYgYE4YI4VtLifxnbLniBrbvntAAOnzIv104
 sPLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYTU4F0H2L68fQFN1h+Ltwu5iEme9jdaQoZ0hEqchnJZooibs3cN9bGSZVabxxz30jyA5VaTi1g9I=@buildroot.org
X-Gm-Message-State: AOJu0Yxm8eDq059ZzaDx75WSyLphvNFPuJMfuevYIqHgriHN8m8bneEM
 nNosLCWF5gqdbm/o2pYR2DBgkugNpF1tFCO05/RSPmvD+cw2Z/kGO8+0xogmgt2dClM9XkGOQt1
 M8dHWeuU=
X-Gm-Gg: ASbGncsjA6gAxou50rUTVkTEBXPmTcFBk6hdDEKcJ1IPIGmUKTlT5m9UyHLiMCAbD04
 f+s8xRQ5VUXYVnJ3Mnn+Y+8s5788M8psoBB05K3tQtzFdjbDNvduRq9G9iEZK2zXq2kaUD4g/vh
 WjwjB3hzj4FfAtL8SbTM9uM6xVxPrvE6REWW1YsRayqfygj4vn7sHixLwx9t/nTc02MDyApo+Vf
 xGnPHNsSXzYixmcAMI2hw2/6FhHyT3ICiSbLfAQZhXwXv25DRDHAfj6E51OPXfh972EKed3FRa0
 Th9kmxDPTwvf2oYEn9H48intsHYBv0ahIA8NYaqVp6minNnjNRINw1FRdVwx13NpM5zTcvpZz7p
 Fj6ANnHFXa0HhuYVQ9gMUDVuZ4Uz6B1DWceoH
X-Google-Smtp-Source: AGHT+IFiR+0957jAIiyqrFHSObTGENRPUamefrPD3D0iuGUgil5rVsVkNnuMzGHoOUMAhK1hGR0gIQ==
X-Received: by 2002:a17:907:1ca2:b0:b07:88a9:12b5 with SMTP id
 a640c23a62f3a-b07c3656e44mr28363866b.46.1757618456027; 
 Thu, 11 Sep 2025 12:20:56 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b31715fdsm190859966b.49.2025.09.11.12.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:20:55 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:20:33 +0200
Message-Id: <20250911192033.2671386-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829202817.2631156-1-thomas.petazzoni@bootlin.com>
References: <20250829202817.2631156-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618456; x=1758223256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ezPiy1xsn6Rj9AYUv/KfoIaUIGp1b1w9/2c1mkCv/A=;
 b=RqA/Mt78mKmNAxJ3nznnqoiij1eTYOy+uX8TX9AY9xLTAcK1qqXYIk0gkFmFut36A4
 tRNFhD4NY5CpQ89ygjIQ2Q5PnIiuEqstdTzmnU7ti+93j3iDaYB8i5/BCL+HjjL3HOua
 v7S0XdIcbA9ofIHfAsL5BdZs5naYvenSiArfQbHm2kZFcAAoHDV7zVGvUSrVVqCDBNEt
 S5RYPn1YW7dToclEJCXIWlky4rm00ohz+DMotkKosnFvtV1mtAjQdibZ9HUTMfyDSuH6
 8F97Wwuft5Y71SvaqMOSxo9SYzsXFKB4K7kMBo55QSsIacMqvMgiyVJiYzGpYnrPPaRl
 fO1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RqA/Mt78
Subject: Re: [Buildroot] [PATCH] package/avrdude: disable Python support to
 fix build issues
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
> The build of avrdude sometimes fails with:
> 
> avrdude: installs files in /home/autobuild/autobuild/instance-1/output-1/target//home/autobuild/autobuild/instance-1/output-1
> 
> This is due to an issue in the installation logic for the Python
> code. However, our avrdude.mk doesn't explicitly support building
> avrdude's Python support, so it's really only by luck (or lack
> thereof) that sometimes host-swig and python3 end up built before
> avrdude, causing avrdude to build its Python support, which installs
> at the wrong location.
> 
> In order to address this, we add a small patch, submitted upstream,
> that allows to explicitly disable Python support, which we then use in
> avrdude.mk.
> 
> The actual Python issue can be investigated at a later point if
> someone needs it. But in any case, being able to explicitly disable
> Python support if not needed is useful.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/f18d47289d8b4dee768275a468c25b4f4399cf8c/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...s.txt-allow-disabling-Python-support.patch | 59 +++++++++++++++++++
>  package/avrdude/avrdude.mk                    |  2 +-
>  2 files changed, 60 insertions(+), 1 deletion(-)
>  create mode 100644 package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch
> 
> diff --git a/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch b/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch
> new file mode 100644
> index 0000000000..fc6210c099
> --- /dev/null
> +++ b/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch
> @@ -0,0 +1,59 @@
> +From 41ee27cf1d31bbc62425aab286b7e524acc64bff Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Fri, 29 Aug 2025 22:21:50 +0200
> +Subject: [PATCH] CMakeLists.txt: allow disabling Python support
> +
> +In some cases, even if Swig is found and Python3 is found, it may not
> +be desirable to build Python support in avrdude, so this commit adds
> +an ENABLE_PYTHON_SUPPORT option to be able to explicitly disable using
> +Python support (unfortunately CMake doesn't allow passing arguments
> +that would prevent it from finding Swig/Python 3 if available).
> +
> +To preserve existing behavior, this option defaults to enabled (ON).
> +
> +Upstream: https://github.com/avrdudes/avrdude/pull/2051
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + CMakeLists.txt | 19 +++++++++++--------
> + 1 file changed, 11 insertions(+), 8 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7f3fce92..94263bab 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -34,6 +34,7 @@ option(USE_EXTERNAL_LIBS "Use external libraries from AVRDUDE GitHub repositorie
> + option(USE_LIBUSBWIN32 "Prefer libusb-win32 over libusb" OFF)
> + option(DEBUG_CMAKE "Enable debugging output for this CMake project" OFF)
> + option(BUILD_SHARED_LIBS "Build shared libraries" OFF)
> ++option(ENABLE_PYTHON_SUPPORT "Enable Python support" ON)
> + 
> + if(WIN32)
> +     # Prefer static libraries over DLLs on Windows
> +@@ -281,14 +282,16 @@ if(HAVE_LINUXGPIO)
> + endif()
> + 
> + # -------------------------------------
> +-# Find SWIG
> +-find_package(SWIG 4.0 COMPONENTS python)
> +-if(SWIG_FOUND)
> +-  find_package(Python3 COMPONENTS Interpreter Development)
> +-  if(PYTHON3_FOUND)
> +-    set(HAVE_SWIG 1)
> +-  else()
> +-    message(STATUS "Found SWIG but no Python3 header/library; cannot use SWIG")
> ++# Find SWIG/Python3 if needed
> ++if(ENABLE_PYTHON_SUPPORT)
> ++  find_package(SWIG 4.0 COMPONENTS python)
> ++  if(SWIG_FOUND)
> ++    find_package(Python3 COMPONENTS Interpreter Development)
> ++    if(PYTHON3_FOUND)
> ++      set(HAVE_SWIG 1)
> ++    else()
> ++      message(STATUS "Found SWIG but no Python3 header/library; cannot use SWIG")
> ++    endif()
> +   endif()
> + endif()
> + 
> +-- 
> +2.50.1
> +
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index 79447a6205..6f19e68341 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -9,7 +9,7 @@ AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
>  AVRDUDE_LICENSE = GPL-2.0+
>  AVRDUDE_LICENSE_FILES = COPYING
>  
> -AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON
> +AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON -DENABLE_PYTHON_SUPPORT=NO
>  AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
>  	host-flex host-bison
>  
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
