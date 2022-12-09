Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C548BC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 09:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4544841A3F;
	Fri,  9 Dec 2022 09:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4544841A3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jFNVL-Vriyk7; Fri,  9 Dec 2022 09:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1322F41A41;
	Fri,  9 Dec 2022 09:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1322F41A41
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D26AE1BF3F4
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 09:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE1C360B69
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 09:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE1C360B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1edbY1RcnyS for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 09:02:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C9F60B53
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0C9F60B53
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 09:02:07 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3cbdd6c00adso44076917b3.11
 for <buildroot@buildroot.org>; Fri, 09 Dec 2022 01:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJ6xbVji0nLMecrkzjKHbUS1/B17B/HICgzMMUBbaXM=;
 b=Z7ezZCxvMZPC1eUWoRt2myrNx4w6HY59PPE6xSHOmBSUJtJTxbxM8FPjrxQxOxSFBP
 aQbMxhBnxIjn7CeadxvDmeErg5VZDx3I1TWg4mPK7HuJpWVLa+tCSwPyRF9XlCKqNiHo
 ksbkJB2V9PC1GCQ99x/Q8NYcUUnNgxRzEFMwtZ6Iq1pE9bw6rzCpnm488AEakvmvFOW9
 6aLna0NVHwltwLmGVfo8zbwRrVFXrBCP+bInmhkutYPhRTiEzhic8uRGjxPXeZ/DMaZ3
 GzWxPT/Y/FuxG8LYM1/1WhfUEj+nXb2vCBYP3eV0NKbkBgHnOK6tJPS/fKWNDj6sj4pE
 dPiA==
X-Gm-Message-State: ANoB5pkG7qn8fc9nKDxqEPrLeuNx0cMVBXiLJZbPI114dkCSxaFxQ9is
 A9n+KjZZ3DGWhCTWmi2Ay/fmC1IM59/ijFmYAUmTP1pNFJg=
X-Google-Smtp-Source: AA0mqf7b9hGCG+VvHVYHB21xOM1XmtG6tPuYy6pWKlVA20oCEiQ9+Ndxx8b46+jENK0aZdkPLqEEYctCgUcTMz8yC44=
X-Received: by 2002:a81:b807:0:b0:3b3:3f1d:8623 with SMTP id
 v7-20020a81b807000000b003b33f1d8623mr742050ywe.96.1670576526492; Fri, 09 Dec
 2022 01:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20221208202338.4085-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20221208202338.4085-1-fontaine.fabrice@gmail.com>
Date: Fri, 9 Dec 2022 10:01:55 +0100
Message-ID: <CAGm1_ktfBHyEF1bna=+ojXJX7U9V_7-_DveSGK0fKUHkGNMG4Q@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJ6xbVji0nLMecrkzjKHbUS1/B17B/HICgzMMUBbaXM=;
 b=lscnThZiCUC8vdCcDMNTQkXBX4t6q+YJw/2xC50Vfib7KoByJ8RWs9RiB31hhwbpaH
 839CUGAChez2YkoeMbzsnJFmXUMyXA52Knn1YTmZlhNAg+MMdQIvm5LtdeX4nIUthSCw
 OL+17pUln9fI3i5tJCrm2CBqX6hKce9n8n3tpOsMPOg6XYsy9sgh3KvLwhGQVAHRbxni
 NJkIwNeEISZHYesFF7rZHyNPrdG4V+hyRcLQZ021qqfs/1j9FB5incbSCiIL3s/iDgyc
 GMJNOH/Yh41bSh0WjlgcyMLVGpWmYZ3/ZYMZYup0sNY1Zf2W5EXbB47GzkwblY3O6Y1j
 mI+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lscnThZi
Subject: Re: [Buildroot] [PATCH 1/1] package/libftdi1: fix static build with
 libusb and -latomic
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Daniel Sangue <daniel.sangue@sangue.ch>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Dec 8, 2022 at 9:23 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Use pkg-config to retrieve libusb dependencies such as -latomic and
> avoid the following static build failure raised since bump of libusb to
> version 1.0.25 in commit aad609936fc83acfe1eac6ffc86d29ac35dcf54e:
>
> /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libusb-1.0.a(core.o): in function `libusb_unref_device':
> /nvmedata/autobuild/instance-29/output-1/build/libusb-1.0.25/libusb/core.c:1186: undefined reference to `__atomic_fetch_add_4'
>
> Fixes:
>  - http://autobuild.buildroot.org/results/1ca7cd85ae60ad4797a6d8a83b2fb51d7eab96d9
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  ...ix-static-build-with-libusb-and-lato.patch | 47 +++++++++++++++++++
>  package/libftdi1/libftdi1.mk                  |  2 +-
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
>
> diff --git a/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch b/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
> new file mode 100644
> index 0000000000..c818c58d68
> --- /dev/null
> +++ b/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
> @@ -0,0 +1,47 @@
> +From b5b8fab6063ad90bb5ef05a72708ecde1796bc81 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 13 May 2022 18:11:50 +0200
> +Subject: [PATCH] CMakeLists.txt: fix static build with libusb and -latomic
> +
> +Use pkg-config to retrieve libusb dependencies such as -latomic and
> +avoid the following static build failure:
> +
> +/nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libusb-1.0.a(core.o): in function `libusb_unref_device':
> +/nvmedata/autobuild/instance-29/output-1/build/libusb-1.0.25/libusb/core.c:1186: undefined reference to `__atomic_fetch_add_4'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/1ca7cd85ae60ad4797a6d8a83b2fb51d7eab96d9
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +http://developer.intra2net.com/git/?p=libftdi;a=commit;h=b5b8fab6063ad90bb5ef05a72708ecde1796bc81]
> +---
> + CMakeLists.txt |   12 ++++++++++--
> + 1 files changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 58f664a..d20aa94 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -25,8 +25,16 @@ if(${CMAKE_BUILD_TYPE} STREQUAL Debug)
> + endif(${CMAKE_BUILD_TYPE} STREQUAL Debug)
> +
> + # find libusb
> +-find_package ( USB1 REQUIRED )
> +-include_directories ( ${LIBUSB_INCLUDE_DIR} )
> ++find_package( PkgConfig )
> ++if (PkgConfig_FOUND)
> ++  pkg_check_modules( LIBUSB libusb-1.0 )
> ++  if (LIBUSB_FOUND)
> ++    include_directories ( ${LIBUSB_INCLUDE_DIRS} )
> ++  else()
> ++    find_package ( USB1 REQUIRED )
> ++    include_directories ( ${LIBUSB_INCLUDE_DIR} )
> ++  endif()
> ++endif()
> +
> + # Find Boost
> + if (FTDIPP OR BUILD_TESTS)
> +--
> +1.7.1
> +
> diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
> index d2e3f42e14..66798addc4 100644
> --- a/package/libftdi1/libftdi1.mk
> +++ b/package/libftdi1/libftdi1.mk
> @@ -8,7 +8,7 @@ LIBFTDI1_VERSION = 1.5
>  LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
>  LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
>  LIBFTDI1_INSTALL_STAGING = YES
> -LIBFTDI1_DEPENDENCIES = libusb
> +LIBFTDI1_DEPENDENCIES = host-pkgconf libusb
>  LIBFTDI1_LICENSE = LGPL-2.1 (libftdi1), MIT (libftdi1)
>  LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
>  LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
> --
> 2.35.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
