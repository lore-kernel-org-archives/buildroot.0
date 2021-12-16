Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC42C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DDF74014B;
	Thu, 16 Dec 2021 18:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZrKeyASpwaA; Thu, 16 Dec 2021 18:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29EE64017B;
	Thu, 16 Dec 2021 18:22:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 620F41BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 501576104E
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ttaKFU4x1546 for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:22:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F75960FD6
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:22:40 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z9so34694892edb.5
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ij0VJaYXUKNj7xWOvAvjmPgaZ/AMUFcCgDsqj1oZXOc=;
 b=K5uGqz/zn0SNKIrsd9aj6ZK/EveTwaANW2doySZHCb9P7mNfPmAWhdo3rKGsH04RMi
 Ve2lVjTuV1EOqLaKKraoPC/lSUGgHVJsialL7G7ouus8eaBkw/MIrMNvKLJuhIztFDo2
 S4rK57g6I7MWAUmpTMGmTneoYKf55zpE+NY+vhuuYPeWkevfbn0XU9b1XljPahiFqtQC
 nTvHHp1gO6EYxJXJIwiKT+CeRzHNQkEnA606RO/wNmow/1Y71+9SizO4TW9gjHt34xVu
 8YyJU7ojDOfXl+zFf/MUjbT+SxpVWDx211xIAmcNROakMJz+XveDqUd1Ya4GF2X3jpKL
 iAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ij0VJaYXUKNj7xWOvAvjmPgaZ/AMUFcCgDsqj1oZXOc=;
 b=P5wFOh2vNO77ZunCKDmk4MiTcwyVwCFkXqV62wkVoI56wKm1dSq+SEPD+7wM686728
 qhfdLVKVgp9Zq7krubWvcZsuZKO4JqFiINGJLdt7et11X1HZu3mcpaZPAg1Ilw3yaQTo
 gOPvb8/1LPdN4udoQrR3QiCi7A36ai9+NQ4ECPa0ifg3MiE7UVQK2FFaRU1E++x+dKEL
 TYsNd2X6odTvtExL59VF98gKG1jWNVVbuBuszoMqrfbFsp0aEI/crKXDsE7tyxo7i6cN
 223qotoHUISOuPOWTr1dj1hurBo+SEjigA50i1wHK0aQR6/AHhrsFesFj/26iiWtUlYu
 vnuw==
X-Gm-Message-State: AOAM531h/w7pSKr1bgzZfQ0oMreVcaIEWuqXaE9VEh19Wq3vnmOxQDvv
 hmENk0PAJuBv14t23ySm/OQO6g==
X-Google-Smtp-Source: ABdhPJxocl0hO0kzO4F6IZcBsL6FVVxy2+KVxJGdNw5V3A5sMXpaOmY4PzRDDVfVdlxifodEgEaEZQ==
X-Received: by 2002:a05:6402:1291:: with SMTP id
 w17mr14198159edv.335.1639678958463; 
 Thu, 16 Dec 2021 10:22:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z6sm2869489edc.76.2021.12.16.10.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:22:38 -0800 (PST)
Message-ID: <471d300a-ccae-04f1-0850-6d3f9afde712@mind.be>
Date: Thu, 16 Dec 2021 19:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211214230408.3255076-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211214230408.3255076-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/leveldb: bump to version 1.23
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
Cc: Steve James <ste@junkomatic.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 00:04, Fabrice Fontaine wrote:
> - Refresh second and fourth patches
> - Update indentation in hash file (two spaces)
> 
> https://github.com/google/leveldb/releases/tag/1.23
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/leveldb/0002-CMake-install-libmemenv.a.patch   |  4 +++-
>   .../0004-cmake-Use-find_package-to-find-Snappy.patch   | 10 ++++++----
>   package/leveldb/leveldb.hash                           |  4 ++--
>   package/leveldb/leveldb.mk                             |  2 +-
>   4 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/package/leveldb/0002-CMake-install-libmemenv.a.patch b/package/leveldb/0002-CMake-install-libmemenv.a.patch
> index ab23a1881a..ea742b0c49 100644
> --- a/package/leveldb/0002-CMake-install-libmemenv.a.patch
> +++ b/package/leveldb/0002-CMake-install-libmemenv.a.patch
> @@ -8,6 +8,8 @@ https://git.busybox.net/buildroot/commit/?id=8a10d9ce311c6cb0490d76921cae55618c2
>   https://git.busybox.net/buildroot/commit/?id=16f847340d07dce620e4c3fc0a099aa79898d86a
>   
>   Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +[Fabrice : updated for 1.23]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   ---
>    CMakeLists.txt | 26 +++++++++++++++++++++++++-
>    1 file changed, 25 insertions(+), 1 deletion(-)
> @@ -48,9 +50,9 @@ index a65afbf..83b2425 100644
>      target_sources(leveldb
>        PRIVATE
>   @@ -418,7 +436,7 @@ endif(LEVELDB_BUILD_BENCHMARKS)
> + endif(LEVELDB_BUILD_BENCHMARKS)
>    
>    if(LEVELDB_INSTALL)
> -   include(GNUInstallDirs)
>   -  install(TARGETS leveldb
>   +  install(TARGETS leveldb memenv
>        EXPORT leveldbTargets
> diff --git a/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch b/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
> index 2626e88652..714e1b0827 100644
> --- a/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
> +++ b/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
> @@ -7,6 +7,8 @@ Upstream: https://github.com/google/leveldb/pull/686/commits/3e73a396a082efc76e0
>   [Thomas: this commit allows to fix the detection of the snappy library
>   in static link configurations]
>   Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +[Fabrice : updated for 1.23]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   ---
>    CMakeLists.txt         | 12 ++++++++----
>    cmake/FindSnappy.cmake | 31 +++++++++++++++++++++++++++++++
> @@ -19,14 +21,14 @@ index 78fead6..2efccda 100644
>   +++ b/CMakeLists.txt
>   @@ -6,6 +6,9 @@ cmake_minimum_required(VERSION 3.9)
>    # Keep the version below in sync with the one in db.h
> - project(leveldb VERSION 1.22.0 LANGUAGES C CXX)
> + project(leveldb VERSION 1.23.0 LANGUAGES C CXX)
>    
>   +# Include local CMake modules.
>   +list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
>   +
> - # This project can use C11, but will gracefully decay down to C89.
> - set(CMAKE_C_STANDARD 11)
> - set(CMAKE_C_STANDARD_REQUIRED OFF)
> + # C standard can be overridden when this is used as a sub-project.
> + if(NOT CMAKE_C_STANDARD)
> +   # This project can use C11, but will gracefully decay down to C89.
>   @@ -31,13 +34,14 @@ option(LEVELDB_INSTALL "Install LevelDB's header and library" ON)
>    include(TestBigEndian)
>    test_big_endian(LEVELDB_IS_BIG_ENDIAN)
> diff --git a/package/leveldb/leveldb.hash b/package/leveldb/leveldb.hash
> index c4a8499dec..068cb09b0a 100644
> --- a/package/leveldb/leveldb.hash
> +++ b/package/leveldb/leveldb.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 55423cac9e3306f4a9502c738a001e4a339d1a38ffbee7572d4a07d5d63949b2  leveldb-1.22.tar.gz
> -sha256 ccc19f1da0798ed666609b65a5b44dd8b3abe6fc08b9c0592eb76e82e174db19  LICENSE
> +sha256  9a37f8a6174f09bd622bc723b55881dc541cd50747cbd08831c2a82d620f6d76  leveldb-1.23.tar.gz
> +sha256  ccc19f1da0798ed666609b65a5b44dd8b3abe6fc08b9c0592eb76e82e174db19  LICENSE
> diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
> index 684b618679..a8f9dc3a1b 100644
> --- a/package/leveldb/leveldb.mk
> +++ b/package/leveldb/leveldb.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LEVELDB_VERSION = 1.22
> +LEVELDB_VERSION = 1.23
>   LEVELDB_SITE = $(call github,google,leveldb,$(LEVELDB_VERSION))
>   LEVELDB_LICENSE = BSD-3-Clause
>   LEVELDB_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
