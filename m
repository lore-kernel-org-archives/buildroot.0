Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C8DCCD193
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 21:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C794641196;
	Thu, 23 Oct 2025 21:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id he1NtQCNZq4c; Thu, 23 Oct 2025 21:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE7AF41255
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7AF41255;
	Thu, 23 Oct 2025 21:10:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE1E119D
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 21:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93FFC41255
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 21:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hFHDFTfYFfh for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 21:10:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 87F1241196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87F1241196
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87F1241196
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 21:10:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5AD8B19F576;
 Thu, 23 Oct 2025 23:10:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Oct 2025 23:10:04 +0200
MIME-Version: 1.0
Date: Thu, 23 Oct 2025 23:10:04 +0200
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251022-llama-cpp-v2-1-c41a43382093@gmail.com>
References: <20251022-llama-cpp-v2-1-c41a43382093@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1f466c852ee75191814e2e2f4f38610e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761253805;
 bh=qyavW8nfVYogBU7F3kfOqCRATcW0CbGH6Hg/jaTM+Zk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JbLCjKLg4GLh707Ll/UHY+BM8xQ2FC7/Xe9PxpqncnH71FG6K5+/upUwdWA5InW62
 UtXzPrGSHe8U267IaSBM3eM2gGUzSKDPyGwYhmDiFRi5lv4lNy35ShGhOdggE9ePcC
 owhmzD2qi4Vgh6p0gzI27OGyh4ze58Ep9WglaKQwi3mCVNmlC3HzzAjWXW5DDvND2b
 dl/9Ob5ilzPE4UKaWaQtYSmNZbnjjMdh2g0Cc4Cc2aiX/xjjHgxneQTVUG+CCJ7uQD
 wv15XQmaIO2hrbxcL+SN5sT1ZoX6Gh4jtWIGDjGl1+grNQGqn8oKujzFguokkvRiFe
 7Tq6ZUieLlngg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JbLCjKLg
Subject: Re: [Buildroot] [PATCH v2] package/llama-cpp: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Joseph,

Thanks for this patch. I have few comments, see below.

On 22/10/2025 19:35, Joseph Kogut wrote:
> Add a package for llama.cpp, a C/C++ LLM inference library, used in
> popular projects like Ollama, RamaLama, and more.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
[...]
> diff --git a/package/llama-cpp/Config.in b/package/llama-cpp/Config.in
> new file mode 100644
> index 0000000000..5bba0067cf
> --- /dev/null
> +++ b/package/llama-cpp/Config.in
> @@ -0,0 +1,36 @@

For restricting this package to some architectures, could you
use the "standard" _ARCH_SUPPORTS pattern, at the beginning of the
file, please?  Like:

config BR2_PACKAGE_LLAMA_CPP_ARCH_SUPPORTS
	bool
	default y
	depends on !BR2_s390x
	depends on !BR2_riscv

> +config BR2_PACKAGE_LLAMA_CPP
> +	bool "llama.cpp"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL

I don't think this libc restriction is needed. This package could build
correctly with uClibc too. It will just need to select libexecinfo
when uclibc is used.

Then, the dependency on the newly introduced _ARCH_SUPPORTS
needs to be added.

I think this package will likely also depends on having a toolchain
with C++.

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	depends on !BR2_s390x
> +	depends on !BR2_riscv

Those dependencies on architectures could be removed, with the
_ARCH_SUPPORTS.

> +	help
> +	  LLM inference in C/C++

In Buildroot help strings, we usually add the upstream homepage url.

With those comments, the block should become:

config BR2_PACKAGE_LLAMA_CPP
	bool "llama.cpp"
	depends on BR2_PACKAGE_LLAMA_CPP_ARCH_SUPPORTS
	depends on BR2_INSTALL_LIBSTDCPP
	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
	select BR2_PACKAGE_LIBEXECINFO if BR2_TOOLCHAIN_USES_UCLIBC
	help
	  LLM inference in C/C++

	  https://github.com/ggml-org/llama.cpp

> +
> +comment "llama-cpp needs glibc or musl toolchain w/ c++, gcc >= 9"
> +	depends on !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
> +		|| (!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL)

To keep a correct indentation in Kconfig, this comment should be
moved at the end of the Config.in file. Please also adjust the
condition accordingly (i.e. remove conditions on libc).

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
> +	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader

This dependency should not be needed here, since we'll have it
in BR2_PACKAGE_LLAMA_CPP.

> +	depends on !BR2_STATIC_LIBS # vulkan-loader
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
> +	select BR2_PACKAGE_VULKAN_HEADERS
> +	select BR2_PACKAGE_VULKAN_LOADER
> +	help
> +	  Enable Vulkan backend for GPU acceleration.
> +endif
[...]
> diff --git a/package/llama-cpp/llama-cpp.mk 
> b/package/llama-cpp/llama-cpp.mk
> new file mode 100644
> index 0000000000..92dde059d2
> --- /dev/null
> +++ b/package/llama-cpp/llama-cpp.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# llama.cpp
> +#
> +################################################################################
> +
> +LLAMA_CPP_VERSION = 6818
> +LLAMA_CPP_SOURCE = b$(LLAMA_CPP_VERSION).tar.gz
> +LLAMA_CPP_SITE = 
> https://github.com/ggml-org/llama.cpp/archive/refs/tags
> +LLAMA_CPP_LICENSE = MIT
> +LLAMA_CPP_LICENSE_FILES = LICENSE
> +LLAMA_CPP_INSTALL_STAGING = YES
> +LLAMA_CPP_CONF_OPTS = \
> +	-DLLAMA_BUILD_TESTS=OFF \
> +	-DLLAMA_BUILD_EXAMPLES=OFF \
> +	-DLLAMA_FATAL_WARNINGS=OFF
> +
> +ifeq ($(BR2_PACKAGE_CURL),y)

In Buildroot, the symbol for cURL is BR2_PACKAGE_LIBCURL.
So this line should become:

ifeq ($(BR2_PACKAGE_LIBCURL),y)

This can be detected by the check command:
utils/check-symbols

> +LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=ON
> +LLAMA_CPP_DEPENDENCIES += libcurl
> +else
> +LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=OFF
> +endif

Here, you could add the dependency for libexecinfo, to support uclibc.

ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
LLAMA_CPP_DEPENDENCIES += libexecinfo
LLAMA_CPP_LDFLAGS += -lexecinfo
endif

> +
> +ifeq ($(BR2_PACKAGE_LLAMA_CPP_TOOLS),y)
> +LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=ON

Here, you should handle the case which disable the tools,
adding:

else
LAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=OFF

> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLAMA_CPP_SERVER),y)
> +LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=ON

Same comment for the _SERVER, adding:

else
LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=OFF

> +endif
> +
> +ifeq ($(BR2_PACKAGE_LLAMA_CPP_VULKAN),y)
> +LLAMA_CPP_DEPENDENCIES += vulkan-loader
> +LLAMA_CPP_CONF_OPTS += -DGGML_VULKAN=ON

Same comment. Adding here:

else
LLAMA_CPP_CONF_OPTS += -DGGML_VULKAN=OFF

> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENBLAS),y)
> +LLAMA_CPP_DEPENDENCIES += openblas
> +LLAMA_CPP_CONF_OPTS += -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS

Same comment. Adding here:

else
LLAMA_CPP_CONF_OPTS += -DGGML_BLAS=OFF

> +endif

Finally, for handling the libexecinfo for uclibc, we need
to pass the ldflags:

LLAMA_CPP_CONF_OPTS += \
        -DCMAKE_EXE_LINKER_FLAGS="$(LLAMA_CPP_LDFLAGS)"

> +
> +$(eval $(cmake-package))
> 
> ---
> base-commit: f23c810176305604c54b79611d885547f4e45c23
> change-id: 20250618-llama-cpp-d3fc28b4562f
> 
> Best regards,
> --
> Joseph Kogut <joseph.kogut@gmail.com>

Could you send an updated patch including those changes, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
