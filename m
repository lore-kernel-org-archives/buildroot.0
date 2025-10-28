Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8ADCCD1BF
	for <buildroot@archiver.kernel.org>; Tue, 28 Oct 2025 08:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D5084771;
	Tue, 28 Oct 2025 08:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHsujNDucfEN; Tue, 28 Oct 2025 08:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B8484766
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3B8484766;
	Tue, 28 Oct 2025 08:36:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 450D8939
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 08:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 362724085F
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 08:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acOF2R-fHOGF for <buildroot@buildroot.org>;
 Tue, 28 Oct 2025 08:36:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCFAE405C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCFAE405C4
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCFAE405C4
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 08:36:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-421851bcb25so3464661f8f.2
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 01:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761640581; x=1762245381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5ZZ1Z2pu8Yyc28vQIcsnSthk3yEjEB80r0XlY60RCY=;
 b=LPBwFCfop/dv92N+VMzekbcYisSOxweNu/NBltEGSlpOWpruW47M5sABLaawt8JA5q
 2WulggOWwRzrI1Vd0szRFHlH26HE4JYcdhhtxvF0GqWSAPuvrxDrMRrsujIdgA2qS2ye
 QYnHDpPNuavRQC3eVIMUCxkEr4TRfOCMrEo4QWNvZML/Lv2nXbQ/o/tkUCBP28/v44n2
 xSXt/PFw/ufgj5Dhrc4+42lpK++8QTarhFDNI9Jo400bYJSOKD9J49uvMsAoXMvTsGmm
 QNycOWR7Vz5ouuTbPouWAe9I12UP9SMJLEPGKmFIFEgKAsnIIzFNGOS3ZAM86JGZ92+3
 6lYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqSgqnRimIbP2pVd1tZZ0g8OKTugQho9cC66yhPx2r4/HDc6mYwPDnWcquAptHboDiJM4oX7GrzFw=@buildroot.org
X-Gm-Message-State: AOJu0YxgzFlgwQsIX6Ne1wsS/pQnfxU+d3sXOadAUGY9KoHooTipNbUX
 wWmHwa32Nk6LHBnw0rcp6K8nIO/SpGUyZWq80zoLKI60jGVg2ic6KeDhSr87LbaJs60QP5BQJqZ
 dVPSb
X-Gm-Gg: ASbGncuUoGea1xXXlcsJtycwNh95bpBzZRgft/UzC3m0DC5KoyXt4LOldhnLzDm64Fc
 SA3H3uq33uGPuOSUAn6vDISY1l1V9hRqYwQdftrVSHkdShCSaJe7YT5ep/7MPobZYqqQMyHwO88
 Tdq1QKQJVpIgULy7m68Mqk6SR+xn3j797k4G65HKnFhrpMX9GOmekx+yyx6nRK5faUVce5CvUfF
 3fOlBaJevv1lp5uYiBa/NWY8bzO6g4ht5BjUbhkWviPYo/VEl8V6LlQXZFLQrV50B0KMsgkEWdb
 9cvxaXj0joNy26bFHbiC/y+prE7rEp2utTlczYVgPmb6MZVITAuo8Ii73vgBaZSC4WxGmA0B9gM
 d0vEPnF3QG6B9J1qLmhWX3Ggqi13j70IqZAbzi5P8Pc62oW7NUaEOwcOXEE1nK4vG+EeBszQ1ha
 5VJLXREnXmN7EVK1n24cuhWYuY8g==
X-Google-Smtp-Source: AGHT+IHLtMHCZfvtWErbHPpCszQq3WK1WSrQqnbD8CiM7V7IUEj5SDysBWmZ2oYO1GDAb6Rhxa+gdw==
X-Received: by 2002:a05:6000:26d2:b0:429:66bf:1463 with SMTP id
 ffacd0b85a97d-429a7e93340mr2250562f8f.44.1761640581087; 
 Tue, 28 Oct 2025 01:36:21 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb7d1sm19247991f8f.16.2025.10.28.01.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 01:36:20 -0700 (PDT)
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 28 Oct 2025 09:36:20 +0100
Message-ID: <20251028083620.21061-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027-llama-cpp-v2-v3-1-9b1f851cbf70@gmail.com>
References: <20251027-llama-cpp-v2-v3-1-9b1f851cbf70@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761640581; x=1762245381; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5ZZ1Z2pu8Yyc28vQIcsnSthk3yEjEB80r0XlY60RCY=;
 b=YCBLYGbE/gd9X5mTfp8P79FXw1o31iPOnrQ6U+MFnO4TtwChP09bMrjOgBmLZkiwtt
 fcd75PGwEGZX5vstO8M5KQ+gYnex2C4w2L3G/49QaOOnmd4ME9dR6q0gJt5B6Uxw8Kvw
 uQjCqce/u6jbhsRE2UqL0pC5FV7iMLzOMPDEviMa6KfYtPwHzfp9XPEoVtpQl3vRba6r
 9k9psMc+6IDZyNmqyTMWnUZoaBrIdSZIm5yzXNzCBzy8O8yXalQ9ccGWZOYRVA1jDcT1
 IPU318d39axQFO4QoBtaT8Rj+zrdLKeSv8KaUoZBZAyFaolX4EB9eLEz1JHz8r5LS6Mr
 12oQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YCBLYGbE
Subject: Re: [Buildroot] [PATCH v3] package/llama-cpp: new package
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
> Add a package for llama.cpp, a C/C++ LLM inference library, used in
> popular projects like Ollama, RamaLama, and more.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Hi Joseph,

> ---
> This patch adds a package for llama.cpp, an LLM inference library,
> supporting many popular models, including LLaMa, Gemma, Deepseek, Qwen,
> and many more.
> 
> This library includes tools that can be used for standalone inference,
> like llama-cli and llama-server, as well as benchmarking, in
> llama-bench. The library has a variety of software and hardware
> accelerated backends, but this patch focuses on OpenBLAS and Vulkan
> support to start.
> 
> The patch disables building for z13 due to ggml requiring z14 or higher.
> Older GCC versions are also problematic, and GCC > v9 is required.
> 
> As mentioned in the virglrenderer series, this package was used to test
> virglrenderer with venus in a nested qemu guest using virtio-gpu.
> 
> https://lists.buildroot.org/pipermail/buildroot/2025-June/781395.html
> 
> For v3 of this series, enabling building with additional toolchains
> using uclibc and musl surfaced a few new issues, such as lack of support
> for threads, wchar, and linking to libatomic. I've also addressed those.
> 
> $ utils/test-pkg -c llama-cpp.config -p llama-cpp -C12 -a
>                              arm-aarch64 [ 1/35]: OK
>                    bootlin-aarch64-glibc [ 2/35]: OK
>                bootlin-arcle-hs38-uclibc [ 3/35]: OK
>                     bootlin-armv5-uclibc [ 4/35]: OK
>                      bootlin-armv7-glibc [ 5/35]: OK
>                       bootlin-armv7-musl [ 6/35]: OK
>                    bootlin-armv7m-uclibc [ 7/35]: SKIPPED
>                 bootlin-m68k-5208-uclibc [ 8/35]: SKIPPED
>                bootlin-m68k-68040-uclibc [ 9/35]: OK
>              bootlin-microblazeel-uclibc [10/35]: OK
>                    bootlin-mipsel-uclibc [11/35]: OK
>                 bootlin-mipsel32r6-glibc [12/35]: OK
>                  bootlin-openrisc-uclibc [13/35]: OK
>            bootlin-powerpc-e500mc-uclibc [14/35]: OK
>         bootlin-powerpc64le-power8-glibc [15/35]: OK
>                    bootlin-riscv32-glibc [16/35]: OK
>                    bootlin-riscv64-glibc [17/35]: OK
>                     bootlin-riscv64-musl [18/35]: OK
>                  bootlin-s390x-z13-glibc [19/35]: SKIPPED
>                       bootlin-sh4-uclibc [20/35]: OK
>                     bootlin-sparc-uclibc [21/35]: OK
>                    bootlin-sparc64-glibc [22/35]: OK
>                     bootlin-x86-64-glibc [23/35]: OK
>                      bootlin-x86-64-musl [24/35]: OK
>                    bootlin-x86-64-uclibc [25/35]: OK
>                    bootlin-x86-i686-musl [26/35]: OK
>                    bootlin-xtensa-uclibc [27/35]: OK
>                             br-arm-basic [28/35]: SKIPPED
>                     br-arm-full-nothread [29/35]: SKIPPED
>                       br-arm-full-static [30/35]: SKIPPED
>                    br-i386-pentium4-full [31/35]: OK
>                       br-mips64-n64-full [32/35]: SKIPPED
>                  br-mips64r6-el-hf-glibc [33/35]: OK
>                br-powerpc-603e-basic-cpp [34/35]: SKIPPED
>                br-powerpc64-power7-glibc [35/35]: OK
> 
> 35 builds, 8 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
> Changes in v3: 
> - Bump version to b6854
> - Use standard _ARCH_SUPPORTS pattern in Config.in [Julien]
> - Remove dependency on !BR2_riscv, as this is fixed
> - Replace dependency on !BR2_s390x w/ !BR2_s390x_z13
> - Enable builds with uclibc, selecting libexecinfo when needed [Julien]
> - Depend on BR2_INSTALL_LIBSTDCPP [Julien]
> - Add homepage to config help string [Julien]
> - Move comment to end of Config.in and remove condition on glibc/musl
>   [Julien]
> - Fix symbol for libcurl [Julien]
> - Handle disabling build features which are not selected [Julien]
> - Pass ldflags for libexecinfo [Julien]
> - Enable building statically using config from project readme
> - Link with libatomic when available, fixes bootlin-sparc-uclibc
> - Add dependency on toolchain threads, skips br-arm-full-nothread
>   failure
> - Add dependency on wchar, skips br-powerpc-603e-basic-cpp failure
> - Vulkan support depends on !BR2_ARM_CPU_ARMV5, skips
>   bootlin-armv5-uclibc failure
> - Link to v2: https://lore.kernel.org/r/20251022-llama-cpp-v2-1-c41a43382093@gmail.com
> 
> Changes in v2: 
> - Bump version to b6818
> - Link to v1: https://lore.kernel.org/r/20250619-llama-cpp-v1-1-0d4fe6710102@gmail.com
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/llama-cpp/Config.in      | 47 +++++++++++++++++++++++++++
>  package/llama-cpp/llama-cpp.hash |  4 +++
>  package/llama-cpp/llama-cpp.mk   | 68 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 121 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 66199a5b72..44bac1d63f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1753,6 +1753,7 @@ F:	package/at-spi2-core/
>  F:	package/earlyoom/
>  F:	package/gconf/
>  F:	package/libnss/
> +F:	package/llama-cpp/
>  F:	package/llvm-project/clang/
>  F:	package/llvm-project/lld/
>  F:	package/llvm-project/llvm/
> diff --git a/package/Config.in b/package/Config.in
> index 161d61728b..851bc35bc1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2290,6 +2290,7 @@ comment "linux-pam plugins"
>  	source "package/libpam-tacplus/Config.in"
>  endif
>  	source "package/liquid-dsp/Config.in"
> +	source "package/llama-cpp/Config.in"
>  	source "package/llvm-project/llvm/Config.in"
>  	source "package/lttng-libust/Config.in"
>  	source "package/matio/Config.in"
> diff --git a/package/llama-cpp/Config.in b/package/llama-cpp/Config.in
> new file mode 100644
> index 0000000000..d29dbcd311
> --- /dev/null
> +++ b/package/llama-cpp/Config.in
> @@ -0,0 +1,47 @@
> +config BR2_PACKAGE_LLAMA_CPP_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on !BR2_s390x_z13 # ggml requires z14 or higher
> +
> +config BR2_PACKAGE_LLAMA_CPP
> +	bool "llama.cpp"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_LLAMA_CPP_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC \
> +		|| (BR2_TOOLCHAIN_USES_UCLIBC && !BR2_STATIC_LIBS)
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_LIBEXECINFO if BR2_TOOLCHAIN_USES_UCLIBC
> +	help
> +	  LLM inference in C/C++
> +
> +	  https://github.com/ggml-org/llama.cpp
> +
> +if BR2_PACKAGE_LLAMA_CPP
> +
> +config BR2_PACKAGE_LLAMA_CPP_TOOLS
> +	bool "Enable tools"
> +	help
> +	  Build CLI tools like llama-cli, llama-bench, etc.
> +
> +config BR2_PACKAGE_LLAMA_CPP_SERVER
> +	bool "Enable server"
> +	help
> +	  Build OpenAI API-compatible web server, llama-server.
> +
> +config BR2_PACKAGE_LLAMA_CPP_VULKAN
> +	bool "Vulkan support"
> +	depends on !BR2_ARM_CPU_ARMV5
> +	depends on !BR2_STATIC_LIBS # vulkan-loader
> +	select BR2_PACKAGE_VULKAN_LOADER
> +	help
> +	  Enable Vulkan backend for GPU acceleration.
> +endif
> +
> +comment "llama-cpp needs a toolchain w/ C++, wchar, threads, and gcc >= 9"
> +	depends on !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +
> +comment "llama-cpp needs a uclibc toolchain w/ dynamic library"
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC && BR2_STATIC_LIBS
> diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
> new file mode 100644
> index 0000000000..d5c171cdf6
> --- /dev/null
> +++ b/package/llama-cpp/llama-cpp.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  ec824d51e500d9e81a400d85f7f437cc8d1e1a96c09ee3ca8206688ded8a4187  b6854.tar.gz
> +# License
> +sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
> diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
> new file mode 100644
> index 0000000000..0b1682b138
> --- /dev/null
> +++ b/package/llama-cpp/llama-cpp.mk
> @@ -0,0 +1,68 @@
> +################################################################################
> +#
> +# llama.cpp
> +#
> +################################################################################
> +
> +LLAMA_CPP_VERSION = 6854
> +LLAMA_CPP_SOURCE = b$(LLAMA_CPP_VERSION).tar.gz
> +LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
> +LLAMA_CPP_LICENSE = MIT
> +LLAMA_CPP_LICENSE_FILES = LICENSE
> +LLAMA_CPP_INSTALL_STAGING = YES
> +LLAMA_CPP_CONF_OPTS = \
> +	-DLLAMA_BUILD_TESTS=OFF \
> +	-DLLAMA_BUILD_EXAMPLES=OFF \
> +	-DLLAMA_FATAL_WARNINGS=OFF
> +

I see that the llama-cpp project has a 'security' page on github with attached
CVE [1].

It looks like it uses the 'ggml:llama.cpp' vendor:product CPE tuple [2]. So I
would add the following

```
LLAMA_CPP_CPE_ID_VENDOR = ggml
LLAMA_CPP_CPE_ID_PRODUCT = llama.cpp
```

Also the CVE [2] uses package version with the 'b' prefix. So I would change
the following to be matched to the CPE correctly.

LLAMA_CPP_VERSION = b6854
LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz

[1] https://github.com/ggml-org/llama.cpp/security
[2] https://nvd.nist.gov/vuln/detail/cve-2024-41130

Thomas

> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +LLAMA_CPP_DEPENDENCIES += libexecinfo
> +LLAMA_CPP_LDFLAGS += -lexecinfo
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +LLAMA_CPP_LDFLAGS += -latomic
> +endif
> +
> +LLAMA_CPP_CONF_OPTS += \
> +	-DCMAKE_EXE_LINKER_FLAGS="$(LLAMA_CPP_LDFLAGS)"
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +LLAMA_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF \
> +		       -DCMAKE_POSITION_INDEPENDENT_CODE=ON
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=ON
> +LLAMA_CPP_DEPENDENCIES += libcurl
> +else
> +LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLAMA_CPP_TOOLS),y)
> +LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=ON
> +else
> +LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLAMA_CPP_SERVER),y)
> +LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=ON
> +else
> +LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLAMA_CPP_VULKAN),y)
> +LLAMA_CPP_DEPENDENCIES += vulkan-loader
> +LLAMA_CPP_CONF_OPTS += -DGGML_VULKAN=ON
> +else
> +LLAMA_CPP_CONF_OPTS += -DGGML_VULKAN=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENBLAS),y)
> +LLAMA_CPP_DEPENDENCIES += openblas
> +LLAMA_CPP_CONF_OPTS += -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS
> +else
> +LLAMA_CPP_CONF_OPTS += -DGGML_BLAS=OFF
> +endif
> +
> +$(eval $(cmake-package))
> 
> ---
> base-commit: c555b6565f2747047603dc8022f81b7ea14b4890
> change-id: 20251024-llama-cpp-v2-5f37be7f121a
> 
> Best regards,
> -- 
> Joseph Kogut <joseph.kogut@gmail.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
