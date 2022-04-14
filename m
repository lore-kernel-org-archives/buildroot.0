Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CA6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99BDE418FF;
	Thu, 14 Apr 2022 20:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNUksrZJPO6N; Thu, 14 Apr 2022 20:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E401418FB;
	Thu, 14 Apr 2022 20:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE4971BF290
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD63482B1E
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXOEFhD7MHMd for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:02:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 636E082A53
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:02:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id u18so7722926eda.3
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 13:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ENl/Pm5WWtbw51qRE75baB3nzY9xlc0s9GKBvhxgFiU=;
 b=RobHtawgZpAa5mqNWNnSe8hFQkXesBAxUQs9Sf8xY8dQhbUKfIntHdWln64XcFbY0N
 NuxRanBMpFV72sBT22ByrsdjTaUi9x1nD6jGxF9iPXrE5nSTFqAn8Ds+gvGHAiY9M3LK
 iflc0/qRsMmObOExW1kV/3IpPtqcbhxtzAQJeNV91HwkpXA9WIx6sxK/t3vMEbpFP3PO
 pyIz7RrBXjbfkxQOKWyy6b/Uz3gXJXxN6hgc/Qlwod/VDIzkoiwW/OeBPHA+cll/xqMO
 oqq5GWAa30kVP2L/jKUYxPdqNolq0St7O20I2/Ne/UhRzx4I9zzI9EIjmTQYJDugFvRd
 MUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ENl/Pm5WWtbw51qRE75baB3nzY9xlc0s9GKBvhxgFiU=;
 b=HUpw2gb4lEGVYG9kXK1eIkIfrGIKP88ORin5QM+ViaNnmG9UhkkqtgKk9YUVXezYOg
 7zH5CoqkILK+2jljNMPsU2ioCKXCXebwB0TTr2vSImHUpvyieNMW2gnaRCPJQD293eoI
 +i/luLYajXklCUz+GPYXKWB+6WtCuv3FlmlBq54/urIVmiwU6xyjA2njM/GXNzI6sA1J
 Nocs8Ha97aM6qYlf8dj8/9seKNiXtRVmF/V1VMyI3c5HnX/1zXsbFrk7FFDJcaZ5GA/2
 my0szN7Kj8Aa5FRkeEiKua/2atHCjXquFhzUU/BWn1nsqfmHUjlPeaAwAPdFyFcsAiog
 Qr4Q==
X-Gm-Message-State: AOAM533LoOS+0gGLEjWkz5gzAsNcAshwyw2j7kqoLH58j5U5mWsdQ5Rh
 mmg4K/bX4wtObrEg9gkNp5ZC4g==
X-Google-Smtp-Source: ABdhPJz+SLRpFj8jXR0HsEhorI1rMRZWpqjPol2B+pRNX1CHZZntuPx/wCKiNeCKYNqQj1Dj3c8X4A==
X-Received: by 2002:a05:6402:2999:b0:418:eb22:64f9 with SMTP id
 eq25-20020a056402299900b00418eb2264f9mr4685428edb.391.1649966550721; 
 Thu, 14 Apr 2022 13:02:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 fq6-20020a1709069d8600b006e891c0b7e0sm951153ejc.129.2022.04.14.13.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 13:02:30 -0700 (PDT)
Message-ID: <8a9a632d-2732-11a4-e16b-e71ec94b5c9a@mind.be>
Date: Thu, 14 Apr 2022 22:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220408212043.3856376-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220408212043.3856376-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.20.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/04/2022 23:20, James Hilliard wrote:
> Drop patches that are now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...01-build-add-option-to-disable-tests.patch | 58 ------------------
>   ...002-meson-only-require-cpp-for-tests.patch | 59 -------------------
>   package/wayland/wayland.hash                  |  6 +-
>   package/wayland/wayland.mk                    |  2 +-
>   4 files changed, 4 insertions(+), 121 deletions(-)
>   delete mode 100644 package/wayland/0001-build-add-option-to-disable-tests.patch
>   delete mode 100644 package/wayland/0002-meson-only-require-cpp-for-tests.patch
> 
> diff --git a/package/wayland/0001-build-add-option-to-disable-tests.patch b/package/wayland/0001-build-add-option-to-disable-tests.patch
> deleted file mode 100644
> index 5ecf100d64..0000000000
> --- a/package/wayland/0001-build-add-option-to-disable-tests.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 88f1605a826ca0c2ff02be6f4cf9ecabf68e8341 Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Tue, 3 Mar 2020 15:27:51 -0700
> -Subject: [PATCH] build: add option to disable tests
> -
> -When building for a product, tests are not needed.
> -
> -Besides, one test requires a C++ compiler, which is not always
> -available.
> -
> -So, add an option to configure to disable building tests altogether.
> -
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -[Upstream status:
> -https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/66]
> -Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> -[yann.morin.1998@free.fr: backport from upstream]
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ----
> - meson.build       | 4 +++-
> - meson_options.txt | 4 ++++
> - 2 files changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index cdb66bc..714a86d 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -84,7 +84,9 @@ subdir('src')
> - if get_option('libraries')
> - 	subdir('cursor')
> - 	subdir('egl')
> --	subdir('tests')
> -+	if get_option('tests')
> -+		subdir('tests')
> -+	endif
> - 	if get_option('documentation')
> - 		subdir('doc')
> - 	endif
> -diff --git a/meson_options.txt b/meson_options.txt
> -index de588d1..4433fa0 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -6,6 +6,10 @@ option('scanner',
> -   description: 'Compile wayland-scanner binary',
> -   type: 'boolean',
> -   value: 'true')
> -+option('tests',
> -+  description: 'Compile Wayland tests',
> -+  type: 'boolean',
> -+  value: 'true')
> - option('documentation',
> -   description: 'Build the documentation (requires Doxygen, dot, xmlto, xsltproc)',
> -   type: 'boolean',
> ---
> -2.25.1
> -
> diff --git a/package/wayland/0002-meson-only-require-cpp-for-tests.patch b/package/wayland/0002-meson-only-require-cpp-for-tests.patch
> deleted file mode 100644
> index 84d0e4cf6f..0000000000
> --- a/package/wayland/0002-meson-only-require-cpp-for-tests.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 4c2105312379b62dc84f6eaaf26e2ab293d51b92 Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Fri, 16 Apr 2021 02:32:38 -0600
> -Subject: [PATCH] meson: only require cpp for tests
> -
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -[Upstream status:
> -https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/130]
> -Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> -[yann.morin.1998@free.fr: backport from upstream]
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ----
> - meson.build       |  2 +-
> - tests/meson.build | 16 +++++++++-------
> - 2 files changed, 10 insertions(+), 8 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 12b4641..cdb66bc 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -1,5 +1,5 @@
> - project(
> --	'wayland', 'c', 'cpp',
> -+	'wayland', 'c',
> - 	version: '1.19.0',
> - 	license: 'MIT',
> - 	meson_version: '>= 0.52.1',
> -diff --git a/tests/meson.build b/tests/meson.build
> -index a32ac50..2e11af4 100644
> ---- a/tests/meson.build
> -+++ b/tests/meson.build
> -@@ -64,15 +64,17 @@ executable(
> - 	dependencies: test_runner_dep
> - )
> -
> --test(
> --	'cpp-compile-test',
> --	executable(
> -+if add_languages('cpp')
> -+	test(
> - 		'cpp-compile-test',
> --		'cpp-compile-test.cpp',
> --		wayland_server_protocol_h,
> --		include_directories: src_inc
> -+		executable(
> -+			'cpp-compile-test',
> -+			'cpp-compile-test.cpp',
> -+			wayland_server_protocol_h,
> -+			include_directories: src_inc
> -+		)
> - 	)
> --)
> -+endif
> -
> - sed_path = find_program('sed').path()
> -
> ---
> -2.31.1
> -
> diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
> index e9dcb63a90..cd4cb1a474 100644
> --- a/package/wayland/wayland.hash
> +++ b/package/wayland/wayland.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2021-January/041692.html
> -sha256  baccd902300d354581cd5ad3cc49daa4921d55fb416a5883e218750fef166d15  wayland-1.19.0.tar.xz
> -sha512  d8a86f5e23e4a88e7c84b82fdb51eb350419086afe462ecb2f4d5c3ba9290ede310cbbcffd60215219ddccf5bad4adec21a5ebfbef6577200f66ac7a1b64a5ef  wayland-1.19.0.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2021-December/042064.html
> +sha256  b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725  wayland-1.20.0.tar.xz
> +sha512  e8a1f410994b947f850799bdd0d95a2429d8467f853e62a0ab3915a4e9fe130f8aa977e03715114ab740c6ec546edea63d275ce7f927d4f3029ea126e6a7d215  wayland-1.20.0.tar.xz
>   
>   # Locally calculated
>   sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
> diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
> index ecfe95d68a..4c19875bba 100644
> --- a/package/wayland/wayland.mk
> +++ b/package/wayland/wayland.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WAYLAND_VERSION = 1.19.0
> +WAYLAND_VERSION = 1.20.0
>   WAYLAND_SITE = https://wayland.freedesktop.org/releases
>   WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
>   WAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
