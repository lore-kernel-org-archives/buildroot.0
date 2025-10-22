Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8844ECCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 17:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 898136118C;
	Wed, 22 Oct 2025 17:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-ivw9JK6i6l; Wed, 22 Oct 2025 17:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 833FD61117
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 833FD61117;
	Wed, 22 Oct 2025 17:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC64F43F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 17:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 934F8812D5
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 17:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9B-O6oRGJKHp for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 17:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B909812AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B909812AE
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B909812AE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 17:35:06 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-78125ed4052so8613362b3a.0
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 10:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761154505; x=1761759305;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QoNHuC3y3d3mjvhguEWMjUydPHkySCBnUxxvD8vLS3g=;
 b=jWwJq5/RWu6zwDHrIrsgQAd11tsVSpfqUq2uL27sT+D1Vju1FltGWbBlvFW/Uw8LcD
 3CRTJkALaQmlNBUJDw0HsyKchPkuZwTp2iihSCgoKIiM3KPFN1IL+nFwHtZXo49Ux0/v
 tTB/Tb8PAGR2zKSFhZTRbIXh7Z/b8jddyss2h84fR8rGAKNEHcYFWYLY5BjcxpMzOUgL
 ZHk9j88Q2VO7wb9+BvC6E1RqFKxMLdagd7DWCUwvSIeyUPo3XnFHIobt7u9MnpaaoCgz
 KTzrZ48GcPZS50sWtIhV1CPlB17tVu+jzKyYO8OVKjf6DPggeO2TMOT3QBY1rWQp90WW
 8Dzg==
X-Gm-Message-State: AOJu0YwSukWnVJDuuHqfFodR/wUC4LVldQKQUYgrhhHm77r1CIn7B6h4
 NvRXiIf6h4KbDzsRe9IrBcHdRUV7to2r1IHmJVdau1+ws577eoy+ajUmJvDXfA==
X-Gm-Gg: ASbGnct7utlwmLWfa6F88lg3YYRSSiDJpLL9+7/Zfjrhn0pdL2C4cJ0EWc6PYw3XdLL
 LurnX4ZKqpqVF8Hfu47wtVWwh3M4JszU+FD6peXI4yOYWp53HqiIUbPqf9g0XSQkU9F9KZNuCKm
 GpF0E7bkJReICng/NmOo5AmOQuN+20YaAwF3VkYfWSfyw/mdH9Z4QdimG9eJFrgDAottWZUK50s
 HTkrwFneItcydUEL3TE54KXWJJJmMb0o4Kahdz5id2gZq/NJIXZVgctrBsUbVPNqKxRmIrYVtpi
 jAKIT3JeP2eFUHaw+09XqzvZ/KqMS8LLgub4pXGBqZKVcN01aqmh5jZdjq80O4rSD4pHqHOdpys
 MVvdmotysr+sl40QEkP1aQXmdFj1c/He1hSRmxPZZXvr/WzWQVbsPGGI3kjKycbgbItr2EdGz60
 gNQEAu34xHZF4=
X-Google-Smtp-Source: AGHT+IFZSKdsvB/DSzhddUk0Mj92i9ddspGY7IMPqyKyTC1dvXM9NRt/dWCa70J++rUyhUU/QWHlOg==
X-Received: by 2002:a05:6a00:182a:b0:781:8680:3175 with SMTP id
 d2e1a72fcca58-7a220adb84cmr23447312b3a.21.1761154505302; 
 Wed, 22 Oct 2025 10:35:05 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a22ff184basm15200651b3a.15.2025.10.22.10.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 10:35:04 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 22 Oct 2025 10:35:02 -0700
MIME-Version: 1.0
Message-Id: <20251022-llama-cpp-v2-1-c41a43382093@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMUV+WgC/02Oyw6CMBREf8V0bbWtgOjK/zAs+riFJqU0t9hoC
 P9uITFxeZKZM7OQBOggkfthIQjZJTeFAuJ4IHqQoQfqTGEimKhZw1vqvRwl1TFSc7FatKqqG2F
 JyUcE696769kVVjIBVSiDHjaDqs7ZYe8RggEEpK+YZgQ5bt3BpXnCz34j883wW7z9LWZOOWWms
 tBcOeNMPPpROn/S00i6dV2/qTFVgs4AAAA=
X-Change-ID: 20250618-llama-cpp-d3fc28b4562f
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761154504; l=5923;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=Qm21n5GKNede7sJ7S01Jxo1ni+MYYGshpS2UjU/Yr2Q=;
 b=Ekg8mZIdY+1xFG9VXo5dRdOOT7KutsF7k0eDc3Vkw9hzfQxPMN13CQ7i1wJ7Rpsdz/yfl1iMx
 Yp3KVI0zhCMCUBVeP4gNmEpTI75RTg5kxq4jv6NPwL+6XFz1AwuL8cp
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761154505; x=1761759305; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QoNHuC3y3d3mjvhguEWMjUydPHkySCBnUxxvD8vLS3g=;
 b=dQHuaW/MMey3f7LPQrDXuoqtq7d7oLBCvz5ZYdnV7Y7JgkZfhXfeqF4DcY0BTEE9jw
 JtrzWh4SDIPreD2FM8A9TIBjFUCKqQ8XBFFzgPRwDpvIj9SnEm1yP5Zp6fTKbbwSI/sT
 7kq0Sqdm43vLPlF8lwLJ5YRSW5TXHo2yOShIFQAGuPGgZnAEYb5AKqEwOB1Ok4dMg8A0
 UnK1gaOQ1F0k6IS1RLPhvokMXE2o9o5XNaOqpghdo4MAaCqMQb54N+ihnPyGOgtFXFRJ
 vjAxdoAqYPJrtxaydgPIUiIHcOc1LkluuxzH8c1ubpX53guavxNTbQtRdfRkd2bKHy3l
 PZnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dQHuaW/M
Subject: [Buildroot] [PATCH v2] package/llama-cpp: new package
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
I've bumped this package to the latest revision and I'm resending it for
review as a v2.

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
Changes in v2:
- Bump version to b6818
- Link to v1: https://lore.kernel.org/r/20250619-llama-cpp-v1-1-0d4fe6710102@gmail.com
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/llama-cpp/Config.in      | 36 +++++++++++++++++++++++++++++++++
 package/llama-cpp/llama-cpp.hash |  4 ++++
 package/llama-cpp/llama-cpp.mk   | 43 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e31f6b515..157e3d3149 100644
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
index 10f6856dea..97cd5c616a 100644
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
index 0000000000..5bba0067cf
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
index 0000000000..9eb950a5c7
--- /dev/null
+++ b/package/llama-cpp/llama-cpp.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  44fb7508b578d7e263fb4c5ef8252f406cb5951a9891c107ee8553a5f1b2e186  b6818.tar.gz
+# License
+sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
new file mode 100644
index 0000000000..92dde059d2
--- /dev/null
+++ b/package/llama-cpp/llama-cpp.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# llama.cpp
+#
+################################################################################
+
+LLAMA_CPP_VERSION = 6818
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
