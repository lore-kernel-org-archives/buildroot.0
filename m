Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83A4CA0EC1
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79C3140608;
	Thu,  7 Aug 2025 18:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_kchS5VwAeC; Thu,  7 Aug 2025 18:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6860E405B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6860E405B6;
	Thu,  7 Aug 2025 18:25:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E137910A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5F5480DC3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5Qk3mAOxQHL for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B6AE80E59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B6AE80E59
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B6AE80E59
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:48 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-459e7ea3ebeso5744125e9.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591087; x=1755195887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dpJgRabtomEgeCSCA1PWZ1Gc89ZC9RQ5mbhN3QQBIoc=;
 b=r+oZQTYjiztDzS6hPaBk58/R6CYHrPgbc2jUKuPSsrgkMzcOleeHs2Pe0w47mQGSDR
 t91uGMwFAG38svFExkcN0fowgO694+SZyH5R16Oq+8Ly+8nHM1nMvrIUDbf6Kd5ol1y7
 9fZZLyQcoqpSmIHpOGeG1cppd/zIgUpnnmX80tGlJXoRP22BG76uZ8hp40YUTcA0zvA4
 QKIv55bEA0BBvv5yNAJyidAYEMiagOJGREA1acc89AQgBD5PMcIwhrAhypcAGfyjv2Yj
 OJ3dXnTnLVPpzMaFQW73BLL1XifWWiCz/S5IHairhTcKc08za0bgvM/MevvzJ8+uKdBs
 eiRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz2dpnO32jkgxzvSi6qs8dLkw55bnDiHg33WUgbWMqhO+JOBD8Itjgf4zTzsLHKnU+XdOLrYObJ0c=@buildroot.org
X-Gm-Message-State: AOJu0YxWcWYmH/zqIbd5unLmDyTx46OO9xByaEl56kdhu9SW7iFcsSuP
 5Uz+SUyljRUjTkYWZ7yR3NXTZRO6byOIlUw+6g7i/BuD7jUC5M7yMHptBR6E2r6Mbh46J8tWGGe
 ikFUN
X-Gm-Gg: ASbGnctSwSHiq5nyK2D9w0383VR5x9i2vJKA00aldNYe6BgnnOZBySzdPWsS9at6E5j
 Xrd9zx/nM9O2TRp+XF2XrMVnvvw+zim+8gFO0bYZ466PCrP0+ck6ZOv7VVvV2G7Y8gtXFywMZC+
 URdE/uUnGdp9jDL12J2raucn9iuIntC/dEqiUG3De2vdH2/fDn/8UXtesE3E/ja2KhjtQIwUEPC
 V2SB6xzFhWGx7iHu+iNSzgE8pPmjgAjPKHbu2cldGCmNFLmSjS+4IHUXuPVaPp5vR7RrtaBy6/P
 HHDD376jbLjqS3ic0ZwNR+m5APHvrbSfaOrc15++v2tlKXmc6DTP9F33t+04cnOsUBb8WGItNzb
 QOiZq3OrBYxpEqA==
X-Google-Smtp-Source: AGHT+IEElvTG0NArty1YwwalrZhypGTWZ72/tVb2xDxDYenB3b5G+HgY+RHf1nF7yT9kCqWsP16rRA==
X-Received: by 2002:a05:600c:4f8e:b0:456:1e5a:8879 with SMTP id
 5b1f17b1804b1-459e7098c94mr75656605e9.9.1754591087143; 
 Thu, 07 Aug 2025 11:24:47 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e87487fcsm87278475e9.3.2025.08.07.11.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:46 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:46 +0200
Message-ID: <20250807182446.726325-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730202455.1059438-1-thomas.petazzoni@bootlin.com>
References: <20250730202455.1059438-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591087; x=1755195887; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dpJgRabtomEgeCSCA1PWZ1Gc89ZC9RQ5mbhN3QQBIoc=;
 b=NH5+/0zfRyV6CdpIZKEr8vtG8CuwlRJrF6FRyuSDlLqtjd4ZM2lsahJfs5ZiCGsJLB
 lZWcKo7v0X9v1gvrpcS+PaSi6nC9z9e54KE9riBMTdu+mUIDUENxX0AZjl0OZTob//h9
 XHZCiIQuLoPM1lLTFlMmr4UWakE0Nme7GuLEsCOlnG4g/BMonmXaLxDpDva1lWztuGKF
 nFJVbYLt+3hzlLbvbjJdgsBS+039i5LurJRJMIncz3qpSl8rrtVGkqV9seThB67oVGJ6
 EXfOOlhZGRasp5MSU57I6tOvihSEw9lUpoKFoNHC2EGGY1FbWUE1FnHAlmBzF+NYt97f
 c9Eg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NH5+/0zf
Subject: Re: [Buildroot] [PATCH] package/gcc: drop stale 13.3.0 patches
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
> Commit 0b8b72d2fe2c8fa6a9d2859ceb8d29b6389cf894 bumped gcc 13.x from
> 13.3.0 to 13.4.0 but forgot to drop the gcc 13.3.0, so let's remove
> those patches.
> 
> Cc: Kadambini Nema <kadambini.nema@gmail.com>
> Fixes: 0b8b72d2fe2c8fa6a9d2859ceb8d29b6389cf894
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...-along-with-_FILE_OFFSET_BITS-on-Lin.patch | 44 ---------------
>  ...o-undef-_TIME_BITS-in-sanitizer_proc.patch | 53 -------------------
>  2 files changed, 97 deletions(-)
>  delete mode 100644 package/gcc/13.3.0/0004-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
>  delete mode 100644 package/gcc/13.3.0/0005-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
> 
> diff --git a/package/gcc/13.3.0/0004-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch b/package/gcc/13.3.0/0004-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
> deleted file mode 100644
> index a3be0914b9..0000000000
> --- a/package/gcc/13.3.0/0004-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 88b73eedcfa0fc58aee2555377e6f7d4de153282 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 3 Feb 2023 11:48:35 -0800
> -Subject: [PATCH] Undef _TIME_BITS along with _FILE_OFFSET_BITS on Linux
> -
> -On 32-bit glibc>=2.34 systems using 64bit time_t build fails because
> -_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
> -
> -Fixes
> -
> -```
> -/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed
> - only with _FILE_OFFSET_BITS=64"
> -| #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
> -|     ^
> -| 1 error generated.
> -```
> -
> -Reviewed By: thesamesam, MaskRay
> -
> -Differential Revision: https://reviews.llvm.org/D140812
> -
> -Upstream: https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
> -Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d53b3d94aaf211ffb2159614f5aaaf03ceb861cc
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - .../sanitizer_common/sanitizer_platform_limits_posix.cpp         | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -index bcbd143d19d..1b23898b374 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> -@@ -18,6 +18,7 @@
> - // depends on _FILE_OFFSET_BITS setting.
> - // To get this "true" dirent definition, we undefine _FILE_OFFSET_BITS below.
> - #undef _FILE_OFFSET_BITS
> -+#undef _TIME_BITS
> - #endif
> - 
> - // Must go after undef _FILE_OFFSET_BITS.
> --- 
> -2.45.2
> -
> diff --git a/package/gcc/13.3.0/0005-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/13.3.0/0005-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
> deleted file mode 100644
> index 73b09ac389..0000000000
> --- a/package/gcc/13.3.0/0005-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 7ad54084a2c07cca6d03dfe274893e903852d359 Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Thu, 18 Jul 2024 23:13:41 +0200
> -Subject: [PATCH] libsanitizer: also undef _TIME_BITS in
> - sanitizer_procmaps_solaris.cpp
> -
> -Upstream commit
> -https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
> -of LLVM added a #undef _TIME_BITS in
> -libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp to
> -fix the build on 32-bit Linux platforms that have enabled 64-bit
> -time_t using _TIME_BITS=64.
> -
> -Indeed, _TIME_BITS=64 can only be used when _FILE_OFFSET_BITS=64, but
> -sanitizer_platform_limits_posix.cpp undefines _FILE_OFFSET_BITS before
> -including any header file. To fix this, the upstream fix was to also
> -undef _TIME_BITS.
> -
> -This commit simply does the same in sanitizer_procmaps_solaris.cpp,
> -which also gets compiled under Linux (despite what the file name
> -says). In practice on Linux hosts (where _TIME_BITS=64 matters),
> -sanitizer_procmaps_solaris.cpp will expand to nothing, as pretty much
> -the rest of the file is inside a #ifdef SANITIZER_SOLARIS...#endif. So
> -the #undef _FILE_OFFSET_BITS and #undef _TIME_BITS are only here
> -before including sanitizer_platform.h, which will set the
> -SANITIZER_LINUX/SANITIZER_SOLARIS define depending on the platform.
> -
> -Fixes:
> -
> -armeb-buildroot-linux-gnueabi/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
> -   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
> -
> -Upstream: https://gcc.gnu.org/pipermail/gcc-patches/2024-July/657811.html
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
> -index eeb49e2afe3..1b23fd4d512 100644
> ---- a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
> -+++ b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
> -@@ -11,6 +11,7 @@
> - 
> - // Before Solaris 11.4, <procfs.h> doesn't work in a largefile environment.
> - #undef _FILE_OFFSET_BITS
> -+#undef _TIME_BITS
> - #include "sanitizer_platform.h"
> - #if SANITIZER_SOLARIS
> - #  include <fcntl.h>
> --- 
> -2.45.2
> -
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
