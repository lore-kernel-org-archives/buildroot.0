Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5940C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66CD240AB6;
	Sat, 23 Jul 2022 08:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66CD240AB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSEvTz57CXdl; Sat, 23 Jul 2022 08:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E69454031E;
	Sat, 23 Jul 2022 08:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E69454031E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44D4A1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AD5A422E2
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AD5A422E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4LCygM0We8u for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:36:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D7B1422B3
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D7B1422B3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:36:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso3621720wmq.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 01:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H3UOpwgXIzTlIrKaVS0AYFTnrdeCV3NN4ifnmLKK/p4=;
 b=ubwh6COxlm8Nfv6JKB2YfCnRmLKh3RMVG2a+4XADqx9cHW787NiOozm5xKumEMsXwy
 ANTvcCaJ49mNKnU512EpQ/pCXfGGITm9bzEGjPDiYa5TkMGDCVsRQ4FJ7qZeSLOXSnRW
 gZpb1QgvMFXv/T2Cu6FPH+Z+TC+832WmMUWTM8XVIyQy8bnLLDd6OHzsqXaEvilIWwBq
 wkh2wE2H9OeVLKU1Qrg3k1FLGcBLk3bmGZMrcZ3GoSJePMMmDSizNOQ5Xd1+vbi1F2Sk
 Kp9zE+5ZqCVVVPivGSCKY3+EGDhFzl8Xq1iuvpqyN+GUVlNRTNIV2PGXtGUlUIxxlbwp
 +Oyg==
X-Gm-Message-State: AJIora/eHLUbdB8YcoYI+IYxPStpmSjIHXs00KKoqCkLCYqO1MZByr0o
 ZDewRqtZx5HgHepk9VVrX0k0MWHJiSWpU9RY
X-Google-Smtp-Source: AGRyM1skpEht+s1akbInXwFes4fS1v/oADrfip3HmQldsJc54yOvUcrRV1MN99+CTKEaL+qDU9r5Wg==
X-Received: by 2002:a7b:c8ce:0:b0:3a3:2cf8:edb with SMTP id
 f14-20020a7bc8ce000000b003a32cf80edbmr2274377wml.70.1658565417146; 
 Sat, 23 Jul 2022 01:36:57 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adff845000000b0021dd08ad8d7sm6668662wrq.46.2022.07.23.01.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 01:36:56 -0700 (PDT)
Message-ID: <e49e6492-a3d7-a63a-e1b8-771ed2e6ab3b@mind.be>
Date: Sat, 23 Jul 2022 10:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220721110342.3624588-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220721110342.3624588-1-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=H3UOpwgXIzTlIrKaVS0AYFTnrdeCV3NN4ifnmLKK/p4=;
 b=Ef4wPlueLlMmbCxboVrkZNvWiIsxwcy+3WOkc8kgmoOV7Wnagwpvce/t69J7S41Qrk
 qS7G7RxRJ0PthEMZIXxdiVMPkmtvEYqyfy+80HTG3GG6ZVmSckSFRmrx3xjpL6pRvUA9
 w5Fk0Oq0UZyUUu0bhT8KbfTHWW2IqcBwRjwp2vWWVnpGN5ZER6S3kx6sRcjiPPAYycgh
 U3GW+gCelVGNKjDToKTjsW4a8wtfxo99vRcqyZjpRceE6aLJJVvpIzBsM2NlBADr7fKF
 vv/zLM/WCjNOiPFF2PyhkjE5R/YSR/5dv/k7wiomP+Px4pM3Jxu2nNzw4eDTbnLWeBH7
 OAzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ef4wPlue
Subject: Re: [Buildroot] [PATCH] package/libabseil-cpp: bump version to
 20220623.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/07/2022 13:03, Michael Nosthoff via buildroot wrote:
> - drop upstreamed patches
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0002-fix-build-with-uclibc-ng.patch       | 62 -------------------
>   ...direct_mmap-h-fix-musl-build-on-mips.patch | 55 ----------------
>   package/libabseil-cpp/libabseil-cpp.hash      |  2 +-
>   package/libabseil-cpp/libabseil-cpp.mk        |  2 +-
>   4 files changed, 2 insertions(+), 119 deletions(-)
>   delete mode 100644 package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch
>   delete mode 100644 package/libabseil-cpp/0003-PR-1197-absl-base-internal-direct_mmap-h-fix-musl-build-on-mips.patch
> 
> diff --git a/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch b/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch
> deleted file mode 100644
> index 0797d8e51b..0000000000
> --- a/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From b9ad9bbfed92199a1a58504306d026cd2597539e Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Wed, 30 Mar 2022 21:56:20 +0200
> -Subject: [PATCH] Fix build with uclibc-ng (#1145)
> -
> -uclibc-ng doesn't provide getauxval which results in the following build
> -failure on arm or ppc with any user of abseil-cpp such as grpc:
> -
> -/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libabsl_random_internal_randen_hwaes.so.2111.0.0: undefined reference to `getauxval'
> -
> -To fix this build failure, check that __UCLIBC__ is not defined before
> -using getauxval (as Babel is not able to check function availability)
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/775f3ca3dedebff29e212b29dfa896b7613b7a02
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/abseil/abseil-cpp/commit/b9ad9bbfed92199a1a58504306d026cd2597539e]
> ----
> - absl/debugging/internal/vdso_support.cc | 2 +-
> - absl/random/internal/randen_detect.cc   | 7 ++++++-
> - 2 files changed, 7 insertions(+), 2 deletions(-)
> -
> -diff --git a/absl/debugging/internal/vdso_support.cc b/absl/debugging/internal/vdso_support.cc
> -index c655cf452..e63ac4a3b 100644
> ---- a/absl/debugging/internal/vdso_support.cc
> -+++ b/absl/debugging/internal/vdso_support.cc
> -@@ -33,7 +33,7 @@
> - #endif
> - #include <unistd.h>
> -
> --#if defined(__GLIBC__) && \
> -+#if !defined(__UCLIBC__) && defined(__GLIBC__) && \
> -     (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
> - #define ABSL_HAVE_GETAUXVAL
> - #endif
> -diff --git a/absl/random/internal/randen_detect.cc b/absl/random/internal/randen_detect.cc
> -index 9bb58fc68..6dababa35 100644
> ---- a/absl/random/internal/randen_detect.cc
> -+++ b/absl/random/internal/randen_detect.cc
> -@@ -24,6 +24,11 @@
> -
> - #include "absl/random/internal/platform.h"
> -
> -+#if !defined(__UCLIBC__) && defined(__GLIBC__) && \
> -+    (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
> -+#define ABSL_HAVE_GETAUXVAL
> -+#endif
> -+
> - #if defined(ABSL_ARCH_X86_64)
> - #define ABSL_INTERNAL_USE_X86_CPUID
> - #elif defined(ABSL_ARCH_PPC) || defined(ABSL_ARCH_ARM) || \
> -@@ -31,7 +36,7 @@
> - #if defined(__ANDROID__)
> - #define ABSL_INTERNAL_USE_ANDROID_GETAUXVAL
> - #define ABSL_INTERNAL_USE_GETAUXVAL
> --#elif defined(__linux__)
> -+#elif defined(__linux__) && defined(ABSL_HAVE_GETAUXVAL)
> - #define ABSL_INTERNAL_USE_LINUX_GETAUXVAL
> - #define ABSL_INTERNAL_USE_GETAUXVAL
> - #endif
> diff --git a/package/libabseil-cpp/0003-PR-1197-absl-base-internal-direct_mmap-h-fix-musl-build-on-mips.patch b/package/libabseil-cpp/0003-PR-1197-absl-base-internal-direct_mmap-h-fix-musl-build-on-mips.patch
> deleted file mode 100644
> index 0f77236843..0000000000
> --- a/package/libabseil-cpp/0003-PR-1197-absl-base-internal-direct_mmap-h-fix-musl-build-on-mips.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 53a90f079af7ab491530d432bb318a95371ba877 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 16 Jun 2022 14:28:53 -0700
> -Subject: [PATCH] PR #1197: absl/base/internal/direct_mmap.h: fix musl build on
> - mips
> -
> -Imported from GitHub PR https://github.com/abseil/abseil-cpp/pull/1197
> -
> -Fix the following musl build failure on mips:
> -
> -```
> -In file included from /nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/low_level_alloc.cc:26:
> -/nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/direct_mmap.h:49:10: fatal error: sgidefs.h: No such file or directory
> -   49 | #include <sgidefs.h>
> -      |          ^~~~~~~~~~~
> -```
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/3fa027e602bacb22316fb5d9b233baa0b0f0e845
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Merge c9b5b5c5471213a871f7d6d1d2fc8f6899effbac into a184bab83ffcffc2aaac49a3900361158ab3890f
> -
> -Merging this change closes #1197
> -
> -COPYBARA_INTEGRATE_REVIEW=https://github.com/abseil/abseil-cpp/pull/1197 from ffontaine:master c9b5b5c5471213a871f7d6d1d2fc8f6899effbac
> -PiperOrigin-RevId: 455467767
> -Change-Id: I1905f7d70e914288bc1524a52adce3476a779fd8
> -
> -[Retrieved from:
> -https://github.com/abseil/abseil-cpp/commit/53a90f079af7ab491530d432bb318a95371ba877]
> ----
> - absl/base/internal/direct_mmap.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
> -index a01d61220..e492bb004 100644
> ---- a/absl/base/internal/direct_mmap.h
> -+++ b/absl/base/internal/direct_mmap.h
> -@@ -41,13 +41,13 @@
> -
> - #ifdef __mips__
> - // Include definitions of the ABI currently in use.
> --#ifdef __BIONIC__
> -+#if defined(__BIONIC__) || !defined(__GLIBC__)
> - // Android doesn't have sgidefs.h, but does have asm/sgidefs.h, which has the
> - // definitions we need.
> - #include <asm/sgidefs.h>
> - #else
> - #include <sgidefs.h>
> --#endif  // __BIONIC__
> -+#endif  // __BIONIC__ || !__GLIBC__
> - #endif  // __mips__
> -
> - // SYS_mmap and SYS_munmap are not defined in Android.
> diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
> index 2d6c598880..14be313137 100644
> --- a/package/libabseil-cpp/libabseil-cpp.hash
> +++ b/package/libabseil-cpp/libabseil-cpp.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  dcf71b9cba8dc0ca9940c4b316a0c796be8fab42b070bb6b7cab62b48f0e66c4  libabseil-cpp-20211102.0.tar.gz
> +sha256  4208129b49006089ba1d6710845a45e31c59b0ab6bff9e5788a87f55c5abd602  libabseil-cpp-20220623.0.tar.gz
>   sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
> diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
> index 7c6bda7659..eb22da3e2b 100644
> --- a/package/libabseil-cpp/libabseil-cpp.mk
> +++ b/package/libabseil-cpp/libabseil-cpp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBABSEIL_CPP_VERSION = 20211102.0
> +LIBABSEIL_CPP_VERSION = 20220623.0
>   LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
>   LIBABSEIL_CPP_LICENSE = Apache-2.0
>   LIBABSEIL_CPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
