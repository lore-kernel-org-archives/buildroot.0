Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6972EC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 17:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2AA34011F;
	Sat, 11 Feb 2023 17:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2AA34011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 254cSZ4azfZS; Sat, 11 Feb 2023 17:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4C214012D;
	Sat, 11 Feb 2023 17:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4C214012D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 674E11BF580
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 17:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DD6141600
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 17:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DD6141600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfSMd2WMLjR3 for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 17:06:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A29B6415FC
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A29B6415FC
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 17:06:28 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id x29so10042268ljq.0
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 09:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+SCk9FBG/Sb7a0EOKOXUXe+YfuzIIFy966AcPsOeEZc=;
 b=d3+kCOSEknFVOp2e4sjKc4bhI0Rj7WaroK5Zbcn8E4SK99ALIHgu5z6uZNLlPwqHR2
 4fmugr4ZTWt85GT7snNTjP7txmBaq7HqU2jT+YXQaKCHOP8Sfcv0RClueSeY7FJKPkRv
 rMrn1sf8Trv58T+uZPkLfXoTpOx73fZlgqvCAYJpkxi3e11TqU6VAnI7iFspUh3tu4TC
 9enLDjHtMhSLZT/PpfuD2wCqOcb3CscIvCI1u5Z7fQmTJr+JnuLoAwmBJDCfDgDs7/8Y
 pWWNKEEXFWa85JwEdiQXWzeDVuRSe1MqIVBxFgwSZEsu5S59a/JByUPA5FxxFxrrEHA2
 heEA==
X-Gm-Message-State: AO0yUKVcYRc3KERSeAJOJMsdwfT/JOIGPXJlEwJfCG7C0zkk3XlWRk3g
 q9DS7a8ZqPmA8GBGk0C8E1kDIXRRzotB9Spt
X-Google-Smtp-Source: AK7set9YkRPa5JodxH1G/68L7EDbQC0iInHiP2OFm7A0MVOOyBogl1UMqzErp5l1tGjHxRaf/ofCQg==
X-Received: by 2002:a05:651c:b22:b0:293:2b29:4b85 with SMTP id
 b34-20020a05651c0b2200b002932b294b85mr4534456ljr.37.1676135186485; 
 Sat, 11 Feb 2023 09:06:26 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 a16-20020a2eb170000000b0028bbe8c08a1sm1012573ljm.43.2023.02.11.09.06.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 09:06:25 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id g28so479295lfv.0
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 09:06:25 -0800 (PST)
X-Received: by 2002:a05:6512:4c2:b0:4d5:9153:b261 with SMTP id
 w2-20020a05651204c200b004d59153b261mr3421108lfq.38.1676135185117; Sat, 11 Feb
 2023 09:06:25 -0800 (PST)
MIME-Version: 1.0
References: <20230202071518.3961314-1-thomas@devoogdt.com>
In-Reply-To: <20230202071518.3961314-1-thomas@devoogdt.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 11 Feb 2023 18:06:13 +0100
X-Gmail-Original-Message-ID: <CACXRmJhmt9e0q8i7+x3cVvEnna+CvrYozwFXNUxXWnnWkdcKMA@mail.gmail.com>
Message-ID: <CACXRmJhmt9e0q8i7+x3cVvEnna+CvrYozwFXNUxXWnnWkdcKMA@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Subject: Re: [Buildroot] [PATCH] package/fluent-bit: add support for non
 glibc toolchain
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

The patches need to be rebased if
https://patchwork.ozlabs.org/project/buildroot/patch/20230211143356.173296-1-thomas@devoogdt.com/
gets to the master first.

Kr,

Thomas

Op do 2 feb. 2023 om 08:15 schreef Thomas Devoogdt <thomas@devoogdt.com>:
>
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
>
> - require threads and dynamic library support
> - require sync_4 support
> - provide fts.h trough musl-fts
>
> 'static_assert()' is not available if no C++ toolchain or no glibc
> is used, so add two patches to fix this
>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  .../0002-lib-c-ares-fixup-static_assert.patch | 56 +++++++++++++++++++
>  .../0003-lib-cfl-fixup-static_assert.patch    | 33 +++++++++++
>  package/fluent-bit/Config.in                  | 10 +++-
>  package/fluent-bit/fluent-bit.mk              | 11 +++-
>  4 files changed, 105 insertions(+), 5 deletions(-)
>  create mode 100644 package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
>  create mode 100644 package/fluent-bit/0003-lib-cfl-fixup-static_assert.patch
>
> No idea if there is an interest in uClibc or musl-enabled toolchains regarding buildroot?
> I was able to compile fluent-bit for most of the supported platforms with a limited amount
> of changes.
>
> I had to create two patches in two libs. One (cfl) was already upstreamed,
> and added the link to it. The other (c-ares) should be fixed by the m4 bump. I guess that
> fluent-bit will bump those sub-libs over time, so we can drop these patches.
>
>                              arm-aarch64 [ 1/44]: OK
>                    bootlin-aarch64-glibc [ 2/44]: OK
>                bootlin-arcle-hs38-uclibc [ 3/44]: OK
>                     bootlin-armv5-uclibc [ 4/44]: OK
>                      bootlin-armv7-glibc [ 5/44]: OK
>                    bootlin-armv7m-uclibc [ 6/44]: SKIPPED
>                       bootlin-armv7-musl [ 7/44]: OK
>                 bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
>                bootlin-m68k-68040-uclibc [ 9/44]: OK
>              bootlin-microblazeel-uclibc [10/44]: OK
>                 bootlin-mipsel32r6-glibc [11/44]: OK
>                    bootlin-mipsel-uclibc [12/44]: OK
>                      bootlin-nios2-glibc [13/44]: OK
>                  bootlin-openrisc-uclibc [14/44]: OK
>         bootlin-powerpc64le-power8-glibc [15/44]: OK
>            bootlin-powerpc-e500mc-uclibc [16/44]: OK
>                    bootlin-riscv32-glibc [17/44]: OK
>                    bootlin-riscv64-glibc [18/44]: OK
>                     bootlin-riscv64-musl [19/44]: OK
>                       bootlin-sh4-uclibc [20/44]: OK
>                    bootlin-sparc64-glibc [21/44]: OK
>                     bootlin-sparc-uclibc [22/44]: SKIPPED
>                     bootlin-x86-64-glibc [23/44]: OK
>                      bootlin-x86-64-musl [24/44]: OK
>                    bootlin-x86-64-uclibc [25/44]: OK
>                    bootlin-xtensa-uclibc [26/44]: OK
>                             br-arm-basic [27/44]: OK
>                     br-arm-full-nothread [28/44]: SKIPPED
>                       br-arm-full-static [29/44]: SKIPPED
>                    br-i386-pentium4-full [30/44]: OK
>                 br-i386-pentium-mmx-musl [31/44]: OK
>                       br-mips64-n64-full [32/44]: OK
>                  br-mips64r6-el-hf-glibc [33/44]: OK
>                br-powerpc-603e-basic-cpp [34/44]: OK
>                br-powerpc64-power7-glibc [35/44]: OK
>                        linaro-aarch64-be [36/44]: OK
>                           linaro-aarch64 [37/44]: OK
>                               linaro-arm [38/44]: OK
>                      sourcery-arm-armv4t [39/44]: OK
>                             sourcery-arm [40/44]: OK
>                      sourcery-arm-thumb2 [41/44]: OK
>                          sourcery-mips64 [42/44]: OK
>                            sourcery-mips [43/44]: OK
>                           sourcery-nios2 [44/44]: OK
> 44 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
>
> diff --git a/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch b/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
> new file mode 100644
> index 0000000000..de5d0d06a8
> --- /dev/null
> +++ b/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
> @@ -0,0 +1,56 @@
> +From aca354ae22c55fa6051d04a9f674fe0825443a94 Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> +Date: Wed, 1 Feb 2023 11:26:56 +0100
> +Subject: [PATCH] lib: c-ares: fixup static_assert
> +
> +"undefined reference to 'static_assert'"
> +
> +Not defined when using uClibc or if not C++ >= 11.
> +
> +upstream: https://github.com/c-ares/c-ares/issues/504
> +
> +Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> +---
> + lib/c-ares-1.18.1/configure                      | 4 ++++
> + lib/c-ares-1.18.1/m4/ax_cxx_compile_stdcxx_11.m4 | 3 +++
> + 2 files changed, 7 insertions(+)
> +
> +diff --git a/lib/c-ares-1.18.1/configure b/lib/c-ares-1.18.1/configure
> +index 737f0a0dd..b99b7ed49 100755
> +--- a/lib/c-ares-1.18.1/configure
> ++++ b/lib/c-ares-1.18.1/configure
> +@@ -6316,6 +6316,8 @@ else $as_nop
> +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> +
> ++#define static_assert _Static_assert
> ++
> +   template <typename T>
> +     struct check
> +     {
> +@@ -6393,6 +6395,8 @@ else $as_nop
> +          cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> +
> ++#define static_assert _Static_assert
> ++
> +   template <typename T>
> +     struct check
> +     {
> +diff --git a/lib/c-ares-1.18.1/m4/ax_cxx_compile_stdcxx_11.m4 b/lib/c-ares-1.18.1/m4/ax_cxx_compile_stdcxx_11.m4
> +index 229de3091..fe4a11c67 100644
> +--- a/lib/c-ares-1.18.1/m4/ax_cxx_compile_stdcxx_11.m4
> ++++ b/lib/c-ares-1.18.1/m4/ax_cxx_compile_stdcxx_11.m4
> +@@ -37,6 +37,9 @@
> + #serial 9
> +
> + m4_define([_AX_CXX_COMPILE_STDCXX_11_testbody], [[
> ++
> ++#define static_assert _Static_assert
> ++
> +   template <typename T>
> +     struct check
> +     {
> +--
> +2.39.0
> +
> diff --git a/package/fluent-bit/0003-lib-cfl-fixup-static_assert.patch b/package/fluent-bit/0003-lib-cfl-fixup-static_assert.patch
> new file mode 100644
> index 0000000000..7b99a8e4de
> --- /dev/null
> +++ b/package/fluent-bit/0003-lib-cfl-fixup-static_assert.patch
> @@ -0,0 +1,33 @@
> +From 8d17fc961fef2e88f4c8fa2316af925d5466ca4d Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> +Date: Wed, 1 Feb 2023 11:38:15 +0100
> +Subject: [PATCH] lib: cfl: fixup static_assert
> +
> +"undefined reference to 'static_assert'"
> +
> +Not defined when using uClibc or if not C++ >= 11.
> +
> +upstream: https://github.com/Cyan4973/xxHash/commit/6189ecd3d44a693460f86280ccf49d33cb4b18e1
> +
> +Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> +---
> + lib/cfl/lib/xxhash/xxhash.h | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/lib/cfl/lib/xxhash/xxhash.h b/lib/cfl/lib/xxhash/xxhash.h
> +index 08ab79457..511c4d12b 100644
> +--- a/lib/cfl/lib/xxhash/xxhash.h
> ++++ b/lib/cfl/lib/xxhash/xxhash.h
> +@@ -1546,8 +1546,7 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
> + /* note: use after variable declarations */
> + #ifndef XXH_STATIC_ASSERT
> + #  if defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)    /* C11 */
> +-#    include <assert.h>
> +-#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
> ++#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { _Static_assert((c),m); } while(0)
> + #  elif defined(__cplusplus) && (__cplusplus >= 201103L)            /* C++11 */
> + #    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
> + #  else
> +--
> +2.39.0
> +
> diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
> index 6c2299e695..f53eacb447 100644
> --- a/package/fluent-bit/Config.in
> +++ b/package/fluent-bit/Config.in
> @@ -1,6 +1,9 @@
>  config BR2_PACKAGE_FLUENT_BIT
>         bool "fluent-bit"
> -       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +       depends on !BR2_STATIC_LIBS # dlfcn.h
> +       select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_LIBYAML
>         help
> @@ -29,5 +32,6 @@ config BR2_PACKAGE_FLUENT_BIT_WASM
>
>  endif
>
> -comment "fluent-bit needs a glibc toolchain"
> -       depends on !BR2_TOOLCHAIN_USES_GLIBC
> +comment "fluent-bit needs a toolchain w/ threads, dynamic library"
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> index 6e9a33e02e..151afc34aa 100644
> --- a/package/fluent-bit/fluent-bit.mk
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -47,12 +47,19 @@ FLUENT_BIT_CONF_OPTS += \
>         -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
>         -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
>
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
> +FLUENT_BIT_DEPENDENCIES += musl-fts
> +FLUENT_BIT_LINKER_FLAGS += -lfts
> +endif
> +
>  # Uses __atomic_compare_exchange_8
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -FLUENT_BIT_CONF_OPTS += \
> -       -DCMAKE_EXE_LINKER_FLAGS=-latomic
> +FLUENT_BIT_LINKER_FLAGS += -latomic
>  endif
>
> +FLUENT_BIT_CONF_OPTS += \
> +       -DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LINKER_FLAGS)"
> +
>  define FLUENT_BIT_INSTALL_INIT_SYSV
>         $(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
>                 $(TARGET_DIR)/etc/init.d/S99fluent-bit
> --
> 2.39.0
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
