Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E250C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 676CB6100F;
	Fri, 26 Jun 2026 14:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmCt-41UUYwu; Fri, 26 Jun 2026 14:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1510F60EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485726;
	bh=vs5yXzS+mTfZM9G5mAUskN8UaGZdWGOlAdOPo5MfYiw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h2jjfmmxuvvgtleYERCOniBPQO3kTmlunVkgzoVTfsP7yKPPyDjbHWjAs8EmVZaI/
	 BZrwlM7rki4kQtQmTibMgm+HXbu8N3sruv6Wdt6x1Ed6zXdFOs18d/e7zh2zmx5o6m
	 8ZoCa9ZU+p4+2x88dhcmOZagtnR1cI6xEL3UV0Wk0iToXkhF3Yr6R4a2IyTTa7NdqS
	 sajTISmpJArUN4yYjIrEe5B9cNeQ1qPPYi1jOfHf0TgZcz7kJBOmPhFJjde2yssXtk
	 wdS8UVcl1k5HTznE2dCTib4/0W+VSneMv39SyW592144E343nFJi1imui3izP8HXFw
	 zn56amTinHL+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1510F60EA2;
	Fri, 26 Jun 2026 14:55:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F144231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80AEF60EA2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6PEEGpBMEDL for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29FC360E88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29FC360E88
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29FC360E88
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4927014c0deso1557145e9.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485722; x=1783090522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T+HLC6kX/khhdJBawNiqsa1W/iO3M+8mCyiOmPhJuso=;
 b=T+FxYf0mve3Mqxl0d3CYqnKnEmnBMgbbk6tXo8myFIyazdrnbls/LvE+yZIbkLlNr/
 /5aoQ/mWfFKcvonfrWhxf0QoZejTXYdxYi8RYMua9kbwWJchNsxxQqkX9ShwUd+PYJ8r
 Dm99hMts8PMs2Z1Kg/VWOxLawXeVi3uv81F2TV5tMp8f40dahAZdXEENOBm2DC3zov9e
 z/gp+vTVOpd17KNer4LacXqT4TKQCLsw4Aptdy86GM7WYUoDeoGsOc8N1IlBhoHJwz/S
 kTS2wdpM79LkRWADcSf4S/fsvYe1aTIq5mLnLJXY8DNrHxIaC7UqL3ynb8bgsRTEOrIA
 7D/g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1Gw6Ncu5JQ66tLpQKVrcOFPkGnTUun1aKigUYGMBt6RTqbceIRL/hUDH8NGYo8RnTIHcwzZuLHMQ=@buildroot.org
X-Gm-Message-State: AOJu0Yx150JaeSsim/1HK0IT7DTF79RlNHU/V1hXFptVxCiaJ5HLg0Dd
 2baIb4R5HwP2kdiy1Iip9OtdPfFoelQO9vP3Zd6c+umDgihFOBvbhmGQdbGh69T/YjsI95xJpej
 t5vwW
X-Gm-Gg: AfdE7cn4B7g6sWLRIcWn2aWn7vo93obQD0G3b4BBEhyMAaf4EN02RK2aj9HkB6RgLre
 glwNjQUm02yyru8xGDAZ92aw7mYQ8ZlHzqTB0c4/jOvLjjoxQWUqVvfbqXu9ecqpLlaufNilX3Q
 JoLAXef5CE4Y2JDLgJl2GUSuOviBdY/5C25nZ7854MJ6kuXs3h7bZx+XYWiGE4MIOrSgyXhf2FS
 CwaOm2I1A5WWvc52Xsp0GKfy5SIXF+g4nFwj7gksVjJOkJKRfDeBuulpAl699kNd++Mm65SM/Hl
 tzeoiOdSByyRUGqnL95G7/O7cL3sxmcBRxWJrSojSeyjXebI1bn7t1XGYk7qTN1+25sTtmcQf9x
 K2wSe9sXvRphTmn8qFr0v9Rvs4WiTuHnwtZ+LBbXL1IW6jucxl+G4xPjI5mWjc+e9GnYlnQOfaI
 BPr9pJYYv6mV5AROY=
X-Received: by 2002:a05:600c:4b9a:b0:490:c2a3:23d3 with SMTP id
 5b1f17b1804b1-4926689acf5mr76470735e9.35.1782485721788; 
 Fri, 26 Jun 2026 07:55:21 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1eef84d7sm27452800f8f.16.2026.06.26.07.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:21 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:21 +0200
Message-ID: <20260626145521.342661-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615182915.1888004-1-bernd@kuhls.net>
References: <20260615182915.1888004-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485722; x=1783090522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+HLC6kX/khhdJBawNiqsa1W/iO3M+8mCyiOmPhJuso=;
 b=C6e+8dub3O9K+YhOtwCL1h/cahX27tgi9Fv1ePtcuDZMLffz95K/KNxscpr/dFKIpE
 UbvGT2qWF0zQqaSHWnaIbpoHu9wXiI2i3ll1nQ42c8PxR7kWauftOykGqzU7oI9qJ+m0
 8EzuHinirsfBIv3P7rHjIRM/+ceowOrofSAx8MlOujt/lUOqrymu6HkzLMDB8U7V25P7
 3Hx1fJgLZSbjeQ4x7v23HZaN6qFWUV70nEK4s0NY5hTt40S0cv/ljBOFk8w5LgH4HBjy
 s56hwNDz33ipH8TRrhE56Cv0arhGjNUzIbhcdatvUb28z8PosYTlF1wqRK4I299Eq+Ma
 KYzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C6e+8dub
Subject: Re: [Buildroot] [PATCH 1/4] package/kodi-screensaver-rsxs: fix
 build with cmake 4.x
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
> Fixes build error not caught by the autobuilders with this defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_FORCE_HOST_BUILD=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_KODI_SCREENSAVER_RSXS=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON3_PY_ONLY=y
> BR2_PACKAGE_LIBUDEV_ZERO=y
> 
> Raised minimum version for all addons as requested by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/ad40439fbf81d306cc35d33bf35e93c320dbefa8
> 
>  .../0001-Fix-build-with-CMake-4.x.patch       | 346 ++++++++++++++++++
>  1 file changed, 346 insertions(+)
>  create mode 100644 package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
> 
> diff --git a/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch b/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
> new file mode 100644
> index 0000000000..e9f80a98c4
> --- /dev/null
> +++ b/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
> @@ -0,0 +1,346 @@
> +From f6ad95576920944e64a368ae4074812efbcedc4b Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Wed, 11 Mar 2026 21:58:40 +0100
> +Subject: [PATCH] Fix build with CMake 4.x
> +
> +Fixes build errors with CMake 4.x:
> +
> +CMake Error at lib/Implicit/CMakeLists.txt:1 (cmake_minimum_required):
> +  Compatibility with CMake < 3.5 has been removed from CMake.
> +
> +CMake Error at lib/Rgbhsl/CMakeLists.txt:1 (cmake_minimum_required):
> +  Compatibility with CMake < 3.5 has been removed from CMake.
> +
> +CMake Error at lib/rsMath/CMakeLists.txt:1 (cmake_minimum_required):
> +  Compatibility with CMake < 3.5 has been removed from CMake.
> +
> +Raise minimum version for all addons.
> +
> +Upstream: https://github.com/xbmc/screensavers.rsxs/commit/0635422964b6797d693866483d16dff51bcf4b57
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + CMakeLists.txt                    | 2 +-
> + depends/common/bz2/CMakeLists.txt | 2 +-
> + lib/Implicit/CMakeLists.txt       | 2 +-
> + lib/Rgbhsl/CMakeLists.txt         | 2 +-
> + lib/kodi/gui/gl/CMakeLists.txt    | 2 +-
> + lib/rsMath/CMakeLists.txt         | 2 +-
> + src/biof/CMakeLists.txt           | 2 +-
> + src/busyspheres/CMakeLists.txt    | 2 +-
> + src/colorfire/CMakeLists.txt      | 2 +-
> + src/cyclone/CMakeLists.txt        | 2 +-
> + src/drempels/CMakeLists.txt       | 2 +-
> + src/euphoria/CMakeLists.txt       | 2 +-
> + src/feedback/CMakeLists.txt       | 2 +-
> + src/fieldlines/CMakeLists.txt     | 2 +-
> + src/flocks/CMakeLists.txt         | 2 +-
> + src/flux/CMakeLists.txt           | 2 +-
> + src/helios/CMakeLists.txt         | 2 +-
> + src/hufosmoke/CMakeLists.txt      | 2 +-
> + src/hufotunnel/CMakeLists.txt     | 2 +-
> + src/hyperspace/CMakeLists.txt     | 2 +-
> + src/lattice/CMakeLists.txt        | 2 +-
> + src/lorenz/CMakeLists.txt         | 2 +-
> + src/matrixview/CMakeLists.txt     | 2 +-
> + src/microcosm/CMakeLists.txt      | 2 +-
> + src/plasma/CMakeLists.txt         | 2 +-
> + src/skyrocket/CMakeLists.txt      | 2 +-
> + src/solarwinds/CMakeLists.txt     | 2 +-
> + src/spirographx/CMakeLists.txt    | 2 +-
> + src/sundancer2/CMakeLists.txt     | 2 +-
> + 29 files changed, 29 insertions(+), 29 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index e93c31bc..1a9ca89c 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensavers.rsxs)
> + 
> + set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
> +diff --git a/depends/common/bz2/CMakeLists.txt b/depends/common/bz2/CMakeLists.txt
> +index 6b1a0a56..b83f34dd 100644
> +--- a/depends/common/bz2/CMakeLists.txt
> ++++ b/depends/common/bz2/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(bzip2)
> + 
> + if(NOT WIN32)
> +diff --git a/lib/Implicit/CMakeLists.txt b/lib/Implicit/CMakeLists.txt
> +index eef20e3b..14fb63d7 100644
> +--- a/lib/Implicit/CMakeLists.txt
> ++++ b/lib/Implicit/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.0)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + 
> + project(Implicit)
> + 
> +diff --git a/lib/Rgbhsl/CMakeLists.txt b/lib/Rgbhsl/CMakeLists.txt
> +index 984ce9ba..ca01c592 100644
> +--- a/lib/Rgbhsl/CMakeLists.txt
> ++++ b/lib/Rgbhsl/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.0)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + 
> + project(Rgbhsl)
> + 
> +diff --git a/lib/kodi/gui/gl/CMakeLists.txt b/lib/kodi/gui/gl/CMakeLists.txt
> +index 6fc4d87b..1b096d79 100644
> +--- a/lib/kodi/gui/gl/CMakeLists.txt
> ++++ b/lib/kodi/gui/gl/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + 
> + project(kodiOpenGL)
> + 
> +diff --git a/lib/rsMath/CMakeLists.txt b/lib/rsMath/CMakeLists.txt
> +index cc31d308..76100e89 100644
> +--- a/lib/rsMath/CMakeLists.txt
> ++++ b/lib/rsMath/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.0)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + 
> + project(rsMath)
> + 
> +diff --git a/src/biof/CMakeLists.txt b/src/biof/CMakeLists.txt
> +index 810bec46..ec344ba8 100644
> +--- a/src/biof/CMakeLists.txt
> ++++ b/src/biof/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.biof)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/busyspheres/CMakeLists.txt b/src/busyspheres/CMakeLists.txt
> +index 41650ca6..cc829bd9 100644
> +--- a/src/busyspheres/CMakeLists.txt
> ++++ b/src/busyspheres/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.busyspheres)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/colorfire/CMakeLists.txt b/src/colorfire/CMakeLists.txt
> +index 3667cbd4..f8da4884 100644
> +--- a/src/colorfire/CMakeLists.txt
> ++++ b/src/colorfire/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.colorfire)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/cyclone/CMakeLists.txt b/src/cyclone/CMakeLists.txt
> +index 8af4172f..084f928b 100644
> +--- a/src/cyclone/CMakeLists.txt
> ++++ b/src/cyclone/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.cyclone)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/drempels/CMakeLists.txt b/src/drempels/CMakeLists.txt
> +index 1ebd427f..d4c38a95 100644
> +--- a/src/drempels/CMakeLists.txt
> ++++ b/src/drempels/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.drempels)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/euphoria/CMakeLists.txt b/src/euphoria/CMakeLists.txt
> +index d3f55ee3..de2e2f67 100644
> +--- a/src/euphoria/CMakeLists.txt
> ++++ b/src/euphoria/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.euphoria)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/feedback/CMakeLists.txt b/src/feedback/CMakeLists.txt
> +index b37c430a..fd417d61 100644
> +--- a/src/feedback/CMakeLists.txt
> ++++ b/src/feedback/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.feedback)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/fieldlines/CMakeLists.txt b/src/fieldlines/CMakeLists.txt
> +index de60dda8..b0dc30b6 100644
> +--- a/src/fieldlines/CMakeLists.txt
> ++++ b/src/fieldlines/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.fieldlines)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/flocks/CMakeLists.txt b/src/flocks/CMakeLists.txt
> +index c2b4a793..a15db4d8 100644
> +--- a/src/flocks/CMakeLists.txt
> ++++ b/src/flocks/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.flocks)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/flux/CMakeLists.txt b/src/flux/CMakeLists.txt
> +index a2de0b2a..6aeda787 100644
> +--- a/src/flux/CMakeLists.txt
> ++++ b/src/flux/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.flux)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/helios/CMakeLists.txt b/src/helios/CMakeLists.txt
> +index d64a6194..6feb0ac2 100644
> +--- a/src/helios/CMakeLists.txt
> ++++ b/src/helios/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.helios)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/hufosmoke/CMakeLists.txt b/src/hufosmoke/CMakeLists.txt
> +index 44d13231..b4fe79a5 100644
> +--- a/src/hufosmoke/CMakeLists.txt
> ++++ b/src/hufosmoke/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.hufosmoke)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/hufotunnel/CMakeLists.txt b/src/hufotunnel/CMakeLists.txt
> +index b18ce736..f8c67c85 100644
> +--- a/src/hufotunnel/CMakeLists.txt
> ++++ b/src/hufotunnel/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.hufotunnel)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/hyperspace/CMakeLists.txt b/src/hyperspace/CMakeLists.txt
> +index 6bd303e2..5733be37 100644
> +--- a/src/hyperspace/CMakeLists.txt
> ++++ b/src/hyperspace/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.hyperspace)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/lattice/CMakeLists.txt b/src/lattice/CMakeLists.txt
> +index ef884e4c..9f9455f4 100644
> +--- a/src/lattice/CMakeLists.txt
> ++++ b/src/lattice/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.lattice)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/lorenz/CMakeLists.txt b/src/lorenz/CMakeLists.txt
> +index ab3026f6..35f749d9 100644
> +--- a/src/lorenz/CMakeLists.txt
> ++++ b/src/lorenz/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.lorenz)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/matrixview/CMakeLists.txt b/src/matrixview/CMakeLists.txt
> +index d98a8f14..d5f77ec7 100644
> +--- a/src/matrixview/CMakeLists.txt
> ++++ b/src/matrixview/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.matrixview)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/microcosm/CMakeLists.txt b/src/microcosm/CMakeLists.txt
> +index d05b639d..65437c28 100644
> +--- a/src/microcosm/CMakeLists.txt
> ++++ b/src/microcosm/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.microcosm)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/plasma/CMakeLists.txt b/src/plasma/CMakeLists.txt
> +index e7fc7956..fd25963f 100644
> +--- a/src/plasma/CMakeLists.txt
> ++++ b/src/plasma/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.plasma)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/skyrocket/CMakeLists.txt b/src/skyrocket/CMakeLists.txt
> +index 8a89f28f..8e9e0500 100644
> +--- a/src/skyrocket/CMakeLists.txt
> ++++ b/src/skyrocket/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.skyrocket)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/solarwinds/CMakeLists.txt b/src/solarwinds/CMakeLists.txt
> +index f1ef41c7..2417edf0 100644
> +--- a/src/solarwinds/CMakeLists.txt
> ++++ b/src/solarwinds/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.solarwinds)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/spirographx/CMakeLists.txt b/src/spirographx/CMakeLists.txt
> +index 2ccb751d..41a245d4 100644
> +--- a/src/spirographx/CMakeLists.txt
> ++++ b/src/spirographx/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.spirographx)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +diff --git a/src/sundancer2/CMakeLists.txt b/src/sundancer2/CMakeLists.txt
> +index a0e47a6d..a3bfbbe9 100644
> +--- a/src/sundancer2/CMakeLists.txt
> ++++ b/src/sundancer2/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.5)
> ++cmake_minimum_required(VERSION 3.5...4.0)
> + project(screensaver.rsxs.sundancer2)
> + 
> + message(STATUS "--------------------------------------------------------------------------------")
> +-- 
> +2.47.3
> +
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
