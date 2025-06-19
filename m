Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58FFC7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 18:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AF8E60D7D;
	Thu, 19 Jun 2025 18:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_G6Bx9QeDD5; Thu, 19 Jun 2025 18:00:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A4DE60EAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A4DE60EAB;
	Thu, 19 Jun 2025 18:00:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFC2416B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3C3060E32
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zo2rmaTWdPo0 for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 18:00:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E02CD60DA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02CD60DA3
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E02CD60DA3
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:00:25 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-312116d75a6so801777a91.3
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 11:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750356025; x=1750960825;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I2t4Dn6vVWKWNYxg0IF477QK0uv8cP2Jnd4epHzLP6w=;
 b=Bu2PTcJ/ruUXSurd3UJrkYsyE3UZS8XqkGnU5Bs67W/cYyxOnZtTRfudgOv+IBhrpw
 Nzm6N2JZ3WzkzTqfqXrRAdea/cZm8Pq6wzIx3ZKNNZNNml8NUCqZTZt/XL9jjxm28Np9
 3SuKWbfcoPX4UZf/HyrxJPNBCVHzuSNqY+XKUkdzfgOwkuZ07yexQH7zhOzzWvCVdF/q
 tV0HpUqiDcftAjaHC2flTxTYa58H/vm8facs1VjZmvedIjLgKZepRSw4PdveRJzuKBa8
 h52qeRidmsQTbgxR2gV2KwZDhRaTnuL+ubjq60/2+wdT4HxK/ixvDYdBP4A7A4vHxIVd
 ItGw==
X-Gm-Message-State: AOJu0Yw2jqSpH9PzG3TmGorlQCNRJe/by76bH04md9mJxXu4pkg09TEh
 AbXD4/yJHApH4Ccork2uscd3kP7b8QYV9/aHsiZLUQwdlg3G5HFehk92oje45u4w
X-Gm-Gg: ASbGncvj2JoTyhHFS+YkIpwaHLKo5x9L5p+wnjzW5IiEivVWS8uTqKfFkirZierJaae
 lopbhzi2djPz4G7O2fenc52nYNqrmxRNaoWzJoe+LrJlE/ZKqvIx1avDYafd74AeAy8UduRj+Pg
 kztQD/oMLhBsHkeTawD1yB/CqcIX2iBnHetGTlm7OAsg8NT5NiZfVkm24ItEpADGp81Bd/K1Vwb
 nx1YQA8zqYuSojmpHNwF+CEKD2b+vSskcig4CeXUVxIRRABgeNVhI1DtFIW9DXsmWAx/rbjC7TQ
 7SYNRe8G9mGc/W/dRTWBdXF/Hsk3w7CDBSGnVRSkzTun/9BGqWJ7ucJg69zi0Q==
X-Google-Smtp-Source: AGHT+IEY3ho3ifGkfxbzgsdWNEVlfzttao9UzIETIhpsF/Ng0OfBcqbJ0lB3+l+YmSfLRyBPwlOHQQ==
X-Received: by 2002:a17:90b:38c6:b0:313:27e5:7ff1 with SMTP id
 98e67ed59e1d1-3159d628b64mr260006a91.1.1750356024444; 
 Thu, 19 Jun 2025 11:00:24 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3158a22418dsm2582151a91.9.2025.06.19.11.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 11:00:23 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 19 Jun 2025 11:00:23 -0700
MIME-Version: 1.0
Message-Id: <20250619-llama-cpp-v1-1-0d4fe6710102@gmail.com>
X-B4-Tracking: v=1; b=H4sIADZQVGgC/x3MQQqDMBBA0avIrDtUUxXpVUoXk2SiAzENEysF8
 e5Nu3zw+QcUVuEC9+YA5V2KvFJFd2nALZRmRvHVYFoztGM3YYy0Erqc0d+CM5Pth9EEqH1WDvL
 5vx7PakuF0Solt/wOtr/uonNUTp6VFd+5bMq0wnl+AbjPcjKHAAAA
X-Change-ID: 20250618-llama-cpp-d3fc28b4562f
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750356025; x=1750960825; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I2t4Dn6vVWKWNYxg0IF477QK0uv8cP2Jnd4epHzLP6w=;
 b=cxyQ6jwhGCAp3fEoVMwEFjieHnIwLbwrOnsQ5N7Sz+xc3JesGvpaIhY2l6DA5/OFoQ
 ILGCYakw99Z8EKucBlgPKbqKCVv9lH/TvalBBG6hOyr6JnCNeQKRzlOfbvVzec+KsGHS
 /Dy+b5GdHQ5TUoeeIpXWfVRvMJ3m40mXXWu3mgiOb2VdKQdAfLth9lh2RWYtsX1EJhUU
 7EFYEUR3PguSV7y8PhS84Pzkxa4fm1Qn8ArMWp3WUdl+noWr9/XtRnq/lGeXlUD8Hn3l
 x3ZCqJpWA3y3O6mF91C47j6sSQ4s2D5ySEFvdpDqXLfXVhUOQ/F5Jl/tXDAlzJYYIwJx
 2e4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cxyQ6jwh
Subject: [Buildroot] [PATCH] package/llama-cpp: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a package for llama.cpp, a C/C++ LLM inference library, used in
popular projects like Ollama, RamaLama, and more.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
This patch adds a package for llama.cpp, an LLM inference library,
supporting many popular models, including LLaMa, Gemma, Deepseek, Qwen,
and many more.

This library includes tools that can be used for standalone inference,
like llama-cli and llama-server, as well as benchmarking, in
llama-bench. The library has a variety of software and hardware
accelerated backends, but this patch focuses on OpenBLAS and Vulkan
support to start.

The patch disables building for S390X and RISCV due to compilation
errors related to intrinsics, even though they're technically supported.
Older GCC versions are also problematic, and GCC > v9 is required.

As mentioned in the virglrenderer series, this package was used to test
virglrenderer with venus in a nested qemu guest using virtio-gpu.

https://lists.buildroot.org/pipermail/buildroot/2025-June/781395.html

The package was tested against all toolchains with utils/test-pkg:

  40 builds, 28 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Feedback welcome.

Thanks,
Joseph
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/llama-cpp/Config.in      | 36 +++++++++++++++++++++++++++++++++
 package/llama-cpp/llama-cpp.hash |  4 ++++
 package/llama-cpp/llama-cpp.mk   | 43 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e31f6b515578acb2fa199d31d9f6af5551a9830..157e3d3149b4fc41f722f6828e9e4d1edb20f483 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1762,6 +1762,7 @@ F:	package/at-spi2-core/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
+F:	package/llama-cpp/
 F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
diff --git a/package/Config.in b/package/Config.in
index 10f6856dea5dfcc457bd2ce0145ebd5a3f5a2e25..97cd5c616a6f4c3993548706f20cd9d45d959433 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2299,6 +2299,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
+	source "package/llama-cpp/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/llama-cpp/Config.in b/package/llama-cpp/Config.in
new file mode 100644
index 0000000000000000000000000000000000000000..5bba0067cf9090af8feff4792e4fb4c6f9c14b41
--- /dev/null
+++ b/package/llama-cpp/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_LLAMA_CPP
+	bool "llama.cpp"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on !BR2_s390x
+	depends on !BR2_riscv
+	help
+	  LLM inference in C/C++
+
+comment "llama-cpp needs glibc or musl toolchain w/ c++, gcc >= 9"
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
+		|| (!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL)
+
+if BR2_PACKAGE_LLAMA_CPP
+
+config BR2_PACKAGE_LLAMA_CPP_TOOLS
+	bool "Enable tools"
+	help
+	  Build CLI tools like llama-cli, llama-bench, etc.
+
+config BR2_PACKAGE_LLAMA_CPP_SERVER
+	bool "Enable server"
+	help
+	  Build OpenAI API-compatible web server, llama-server.
+
+config BR2_PACKAGE_LLAMA_CPP_VULKAN
+	bool "Vulkan support"
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  Enable Vulkan backend for GPU acceleration.
+endif
diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
new file mode 100644
index 0000000000000000000000000000000000000000..7ebe5757754897e2f21eb5677804bb436ac04366
--- /dev/null
+++ b/package/llama-cpp/llama-cpp.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  35ad7f4e50252a7f8b4ead4d8ad7dd553f31ceb52c9ca325f2fcda0958e70336  b5369.tar.gz
+# License
+sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
new file mode 100644
index 0000000000000000000000000000000000000000..d354b1e629f82d5b04744cfd6499053066be33f8
--- /dev/null
+++ b/package/llama-cpp/llama-cpp.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# llama.cpp
+#
+################################################################################
+
+LLAMA_CPP_VERSION = 5369
+LLAMA_CPP_SOURCE = b$(LLAMA_CPP_VERSION).tar.gz
+LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
+LLAMA_CPP_LICENSE = MIT
+LLAMA_CPP_LICENSE_FILES = LICENSE
+LLAMA_CPP_INSTALL_STAGING = YES
+LLAMA_CPP_CONF_OPTS = \
+	-DLLAMA_BUILD_TESTS=OFF \
+	-DLLAMA_BUILD_EXAMPLES=OFF \
+	-DLLAMA_FATAL_WARNINGS=OFF
+
+ifeq ($(BR2_PACKAGE_CURL),y)
+LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=ON
+LLAMA_CPP_DEPENDENCIES += libcurl
+else
+LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LLAMA_CPP_TOOLS),y)
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LLAMA_CPP_SERVER),y)
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LLAMA_CPP_VULKAN),y)
+LLAMA_CPP_DEPENDENCIES += vulkan-loader
+LLAMA_CPP_CONF_OPTS += -DGGML_VULKAN=ON
+endif
+
+ifeq ($(BR2_PACKAGE_OPENBLAS),y)
+LLAMA_CPP_DEPENDENCIES += openblas
+LLAMA_CPP_CONF_OPTS += -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS
+endif
+
+$(eval $(cmake-package))

---
base-commit: f23c810176305604c54b79611d885547f4e45c23
change-id: 20250618-llama-cpp-d3fc28b4562f

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
