Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D57CD98C1
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39833606A9;
	Tue, 10 Oct 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39833606A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7eTe9NJi_Xwx; Tue, 10 Oct 2023 20:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2167960AF1;
	Tue, 10 Oct 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2167960AF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1576D1BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E126C61473
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E126C61473
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGYKDF1FSTUs for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:52:39 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B6436147B
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 20:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B6436147B
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so10000311a12.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696971157; x=1697575957;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SR9Fx5R+qNESg6bv4bUtsrsJ8xxbYPpLA2Nedq4BhYc=;
 b=b9ZZpItCRZOndw15Giw7ixLCFMgfJZKx/TIIV4Rc5P2FM4njFwri6KfnLUVulpN5Nx
 ttDsymqrT+jLF+Cnx6plsJNfmVdE1UPWwm2kj9QBtBNEk0UpocQBVznhV3vUWl4vnDR1
 uruHS227SdNBcTRcg0dF4s/9mzmRCxg7J2rn/rv+BWfw0fJ3uQ1i5eaki1chm8LNd8TJ
 S9urAgASORzFxmsZpzIwQ08+eJ94T56ihH7yXaPbP4ah1+h+5pkjtxCEQlYcoA+MUZ1X
 9Tf1ScyxYR0+xC4rME509olTz62hs21s46gIRZdAxThcKL3WUUp7upV5XyAFT+QN7in8
 LIkg==
X-Gm-Message-State: AOJu0YyheP4UqvD9aoHPz98f8J9VbJtJBDc43K+FlfOhgm3cqVhoyay/
 kw3FcJiZdb0E5XtoQjYjE9104LjEEe/ET5qYK2c=
X-Google-Smtp-Source: AGHT+IHh9mUA30QztPIlUyb5SufPqUgX9a1/uGyqvldy5ciVZWQkk8nJD22+NXAP11z/aOqVs15+Kw==
X-Received: by 2002:a17:906:24d:b0:9a5:ca42:f3a9 with SMTP id
 13-20020a170906024d00b009a5ca42f3a9mr19008540ejl.2.1696971157594; 
 Tue, 10 Oct 2023 13:52:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a170906685800b009828e26e519sm8843333ejs.122.2023.10.10.13.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:52:37 -0700 (PDT)
Message-ID: <ce397ffd-5a8f-c4d4-327e-b45f110b5548@mind.be>
Date: Tue, 10 Oct 2023 22:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231008212643.67946-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20231008212643.67946-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696971157; x=1697575957; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SR9Fx5R+qNESg6bv4bUtsrsJ8xxbYPpLA2Nedq4BhYc=;
 b=UtdkNtJb9m0gJpS4dURtuao/Lmamfgc07ONKoduGy+J0ykckjf+5gTjjBk/DrdCjij
 pfL3lAgALWBj4IxGsd39Q3lhaeyKCpqIhEdwnf05k98IGCoraRkc9MxG3po6u9V5H3D/
 W8rg0LyLDWcasf7bxsT6+qS55me2irr8uUQPtLhMgmJs/1PfAe74IVFesO0XZtm0ivPR
 m12YJ+TzrlFcPap6HPCUqt+AR48eoMruZ1UUrLGBpyPa5QoN5GuY/3pRIb56dRQK+vqR
 zecHf6ZBkpEsNlKoFY2k8yeQIKNhW/KnKtCWSnbkmSJSP4/O7hpuly50vVDtN7p6EVZL
 jDcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UtdkNtJb
Subject: Re: [Buildroot] [PATCH 1/1] package/libebml: bump to version 1.4.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/10/2023 23:26, Fabrice Fontaine wrote:
> - Drop patch (already in version)
> - C++14 is required since
>    https://github.com/Matroska-Org/libebml/commit/4159caf84c18f64137e6cdb5f15c5e76d0bb0976
> 
> https://github.com/Matroska-Org/libebml/blob/release-1.4.4/NEWS.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                           |  1 -
>   ...-header-files-for-std-numeric_limits.patch | 40 -------------------
>   package/libebml/Config.in                     |  6 ++-
>   package/libebml/libebml.hash                  |  2 +-
>   package/libebml/libebml.mk                    |  2 +-
>   package/libmatroska/Config.in                 |  6 ++-
>   6 files changed, 10 insertions(+), 47 deletions(-)
>   delete mode 100644 package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 0e8e5921ce..21a1009a1b 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -650,7 +650,6 @@ package/libdnet/0001-python-makefile.patch Upstream
>   package/libdrm/0001-tests-meson.build-disable-nouveau-tests-for-static-b.patch Upstream
>   package/libdvbcsa/0001-altivec-powerpc64.patch Upstream
>   package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch Upstream
> -package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch Upstream
>   package/libedit/0001-check-bsd-functions-in-libbsd.patch Upstream
>   package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch Upstream
>   package/libfcgi/0001-link-against-math.patch Upstream
> diff --git a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
> deleted file mode 100644
> index c7e789c02e..0000000000
> --- a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From f0bfd53647961e799a43d918c46cf3b6bff89806 Mon Sep 17 00:00:00 2001
> -From: Moritz Bunkus <mo@bunkus.online>
> -Date: Sat, 27 Feb 2021 20:36:52 +0100
> -Subject: [PATCH] include appropriate header files for std::numeric_limits
> -
> -Fixes #80.
> -
> -[Retrieved (and updated to remove ChangeLog update) from:
> -https://github.com/Matroska-Org/libebml/commit/f0bfd53647961e799a43d918c46cf3b6bff89806]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - ChangeLog                 | 4 ++++
> - src/EbmlString.cpp        | 1 +
> - src/EbmlUnicodeString.cpp | 1 +
> - 3 files changed, 6 insertions(+)
> -
> -diff --git a/src/EbmlString.cpp b/src/EbmlString.cpp
> -index 27e55fd..4c05fcf 100644
> ---- a/src/EbmlString.cpp
> -+++ b/src/EbmlString.cpp
> -@@ -34,6 +34,7 @@
> -   \author Steve Lhomme     <robux4 @ users.sf.net>
> - */
> - #include <cassert>
> -+#include <limits>
> -
> - #include "ebml/EbmlString.h"
> -
> -diff --git a/src/EbmlUnicodeString.cpp b/src/EbmlUnicodeString.cpp
> -index 496a16a..99fc073 100644
> ---- a/src/EbmlUnicodeString.cpp
> -+++ b/src/EbmlUnicodeString.cpp
> -@@ -36,6 +36,7 @@
> - */
> -
> - #include <cassert>
> -+#include <limits>
> -
> - #include "ebml/EbmlUnicodeString.h"
> -
> diff --git a/package/libebml/Config.in b/package/libebml/Config.in
> index a00b894358..b770154af7 100644
> --- a/package/libebml/Config.in
> +++ b/package/libebml/Config.in
> @@ -2,11 +2,13 @@ config BR2_PACKAGE_LIBEBML
>   	bool "libebml"
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
>   	help
>   	  Access library for the EBML (Extensible Binary Meta
>   	  Language, a binary derivative of XML) format.
>   
>   	  http://matroska.org
>   
> -comment "libebml needs a toolchain w/ C++, wchar"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
> +comment "libebml needs a toolchain w/ C++, wchar, gcc >= 4.9"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
> index 32ca1e3dd3..c83fde32ab 100644
> --- a/package/libebml/libebml.hash
> +++ b/package/libebml/libebml.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  41c7237ce05828fb220f62086018b080af4db4bb142f31bec0022c925889b9f2  libebml-1.4.2.tar.xz
> +sha256  82dc5f83356cc9340aee76ed7512210b3a4edf5f346bc9c2c7044f55052687a7  libebml-1.4.4.tar.xz
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL
> diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
> index 056cf888e1..c85638c03e 100644
> --- a/package/libebml/libebml.mk
> +++ b/package/libebml/libebml.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBEBML_VERSION = 1.4.2
> +LIBEBML_VERSION = 1.4.4
>   LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.xz
>   LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
>   LIBEBML_INSTALL_STAGING = YES
> diff --git a/package/libmatroska/Config.in b/package/libmatroska/Config.in
> index ec0e8415d7..b2e4354df5 100644
> --- a/package/libmatroska/Config.in
> +++ b/package/libmatroska/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBMATROSKA
>   	bool "libmatroska"
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libebml
>   	select BR2_PACKAGE_LIBEBML
>   	help
>   	  Extensible open standard audio/video container format access
> @@ -9,5 +10,6 @@ config BR2_PACKAGE_LIBMATROSKA
>   
>   	  http://matroska.org
>   
> -comment "libmatroska needs a toolchain w/ C++, wchar"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
> +comment "libmatroska needs a toolchain w/ C++, wchar, gcc >= 4.9"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
