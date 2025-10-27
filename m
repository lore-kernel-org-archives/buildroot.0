Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537CCCCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 21:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CD7E61404;
	Mon, 27 Oct 2025 21:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpUECi_p0Ii8; Mon, 27 Oct 2025 21:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF8CD61407
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF8CD61407;
	Mon, 27 Oct 2025 21:06:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9507770B
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91D4B413C1
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-mSmnfI3zjl for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 21:06:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77DE5413A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77DE5413A2
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77DE5413A2
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:06:40 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-b5a631b9c82so3168658a12.1
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 14:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761599199; x=1762203999;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/UN0krlNI9SGhXSeapZqVscOGKtH3ABCqpgtPvRzwlU=;
 b=J0gSn3O4+NXl0nuC6vQw2YMbdWuKw+O2ZjfBw70lTeCgRbOPCdzkE2KnR2Ie6FwuRH
 ao5RHpw+IzsT7XIP9Xv84a2N2VxO7EDL6Bf6FNDHFJBQV3ZdYbTIOFVW+BlK8SLNzNcm
 9oCHDvNIdXzD4mWWQHnmBL6RLuZ2Ez72+yCRE+oejS6wZE/jqx4PomBg9VoaJmUk75O7
 5FnAqhNhaC0s/HbNISeQmFpoINTWd01Yw01F7oCReX2bNL4DsIE+GGuwKTLxrv5xDja6
 iTLZ0L0puNhsjmMbm8vu4dvHloZXa3xP/2fi5Q3dw7jCJ7igoUp+UiIewtex4iWzi+hv
 yx6g==
X-Gm-Message-State: AOJu0YxLFJFvB7qUEgpkgrRjJ6XYhE28utPeGGunYc8J2ezOB9+fEBnO
 U8IFLVuXUnEUQGV2nuFbxlwohqnYo8f3bDAzLqb1m8ieeHsCUoGljwTPXEUE0w==
X-Gm-Gg: ASbGncvs7ODiIzMRfYIamn76TWjdaYUNUioZ3+B6DHIbBNhViOdESLtsDE6LAIBKCqT
 wlfp7JyBnStg04piz/UiLXw1hkhSPxRmRRZxJwXvbRXJto1oZZmVpAtO0gkE4amvugJKiUEYkZ6
 Kx2OVxUNva5T1S0NfMd71h4SrpEN4EUCDMoXOFa7dOe7TOK6cw2pSGFZA7VKZt/Ny0PK1GfvzAb
 kJULRMsBCkYDqdjn1KMDAIF33Ly8/65busfPnvcMpNRNVfEWMWQ5lrjQPX1iuvyynLw0ZvHW/qa
 C7tJ4B79/KetB9UIDjX+Lefuw9f7KhAI/T5fS7na5Z17d7RCPgAY+2+r/Ye9ZsFaoRy9y4wSvEp
 OXEnPrm1LO6aJ17no03gft0OUX0oGRuL/QnQRPzGUfjiIUOhqAahWU5Ij1K2mOxFsoMa0Fnhvtp
 2DJ2uWjSYRvfE=
X-Google-Smtp-Source: AGHT+IE94CebtU1t0ZSYOx9y+K/uxTJMimA7D9lKl7nWZG0OBS4U74PcF2BXhMW1yr1qPGmnKbHdvA==
X-Received: by 2002:a17:903:18e:b0:276:842a:f9a5 with SMTP id
 d9443c01a7336-294cb6747ebmr15723955ad.48.1761599199338; 
 Mon, 27 Oct 2025 14:06:39 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d39048sm92288675ad.66.2025.10.27.14.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 14:06:38 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 27 Oct 2025 14:06:37 -0700
MIME-Version: 1.0
Message-Id: <20251027-llama-cpp-v2-v3-1-9b1f851cbf70@gmail.com>
X-B4-Tracking: v=1; b=H4sIANze/2gC/1XMQQ6CMBBA0auQWTuGTiGoK+9hXAx1Ck0okCkhJ
 oS7W1zp8i/+2yCJBklwKzZQWUMK05jDngpwPY+dYHjlBiqpNiVVOAwcGd0840pYe9u00nhDhiE
 vs4oP7y/3eOb2OkVcehX+RegfMegqw5W1Fyqv9t5FDsPZTfEAW06CrfLo+gOInBZR2PcPF0RiX
 bgAAAA=
X-Change-ID: 20251024-llama-cpp-v2-5f37be7f121a
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761599198; l=9884;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=vmgHBXPpSpIdWBEvJPJYX7cWYtAw86colJkl+K4cgGg=;
 b=VK2YhnLymKTO/EyclbD8dxSZ9TefWKdTcnE6YmuuR+sn3uMe0AARnfADdbf3st/GvBfiR0aMq
 ev+1cCFikHPDegASIxf8T/7ue+qAkm0PtwgwlPDdeY9xm9vMyHy9Xtm
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761599199; x=1762203999; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/UN0krlNI9SGhXSeapZqVscOGKtH3ABCqpgtPvRzwlU=;
 b=eKhcXlUupIlYUowyugznqTWWjoxiKxpKIYmIjVw5sf31U0cZKOqFEoopE1RDQghXP3
 loh6imGCFU3USunUCP67oSK3Koa/A43uRKi1tfibd3TwM1a3+6P2RoUiskf5Mjax3YUJ
 v8bCzdIsdfs2Fb3XBSIkLTpxPhBcCl6nNQVTo8ofCeKM/WuqBl+Xg7lymsdhfuDchULs
 amk/QSik3hqUyeueWwQN99QRIBb8Z44OG+EgUvGmGlZ6GXatgArMD87wDx/xI+8fKA/T
 v/k4QO1KlCv8Uhu730MIKrKpke8nptDd1mA6MF8wTmip1u2WDmM8tSPYJolhtnBBHh3g
 IxKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eKhcXlUu
Subject: [Buildroot] [PATCH v3] package/llama-cpp: new package
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

The patch disables building for z13 due to ggml requiring z14 or higher.
Older GCC versions are also problematic, and GCC > v9 is required.

As mentioned in the virglrenderer series, this package was used to test
virglrenderer with venus in a nested qemu guest using virtio-gpu.

https://lists.buildroot.org/pipermail/buildroot/2025-June/781395.html

For v3 of this series, enabling building with additional toolchains
using uclibc and musl surfaced a few new issues, such as lack of support
for threads, wchar, and linking to libatomic. I've also addressed those.

$ utils/test-pkg -c llama-cpp.config -p llama-cpp -C12 -a
                             arm-aarch64 [ 1/35]: OK
                   bootlin-aarch64-glibc [ 2/35]: OK
               bootlin-arcle-hs38-uclibc [ 3/35]: OK
                    bootlin-armv5-uclibc [ 4/35]: OK
                     bootlin-armv7-glibc [ 5/35]: OK
                      bootlin-armv7-musl [ 6/35]: OK
                   bootlin-armv7m-uclibc [ 7/35]: SKIPPED
                bootlin-m68k-5208-uclibc [ 8/35]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/35]: OK
             bootlin-microblazeel-uclibc [10/35]: OK
                   bootlin-mipsel-uclibc [11/35]: OK
                bootlin-mipsel32r6-glibc [12/35]: OK
                 bootlin-openrisc-uclibc [13/35]: OK
           bootlin-powerpc-e500mc-uclibc [14/35]: OK
        bootlin-powerpc64le-power8-glibc [15/35]: OK
                   bootlin-riscv32-glibc [16/35]: OK
                   bootlin-riscv64-glibc [17/35]: OK
                    bootlin-riscv64-musl [18/35]: OK
                 bootlin-s390x-z13-glibc [19/35]: SKIPPED
                      bootlin-sh4-uclibc [20/35]: OK
                    bootlin-sparc-uclibc [21/35]: OK
                   bootlin-sparc64-glibc [22/35]: OK
                    bootlin-x86-64-glibc [23/35]: OK
                     bootlin-x86-64-musl [24/35]: OK
                   bootlin-x86-64-uclibc [25/35]: OK
                   bootlin-x86-i686-musl [26/35]: OK
                   bootlin-xtensa-uclibc [27/35]: OK
                            br-arm-basic [28/35]: SKIPPED
                    br-arm-full-nothread [29/35]: SKIPPED
                      br-arm-full-static [30/35]: SKIPPED
                   br-i386-pentium4-full [31/35]: OK
                      br-mips64-n64-full [32/35]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/35]: OK
               br-powerpc-603e-basic-cpp [34/35]: SKIPPED
               br-powerpc64-power7-glibc [35/35]: OK

35 builds, 8 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
Changes in v3: 
- Bump version to b6854
- Use standard _ARCH_SUPPORTS pattern in Config.in [Julien]
- Remove dependency on !BR2_riscv, as this is fixed
- Replace dependency on !BR2_s390x w/ !BR2_s390x_z13
- Enable builds with uclibc, selecting libexecinfo when needed [Julien]
- Depend on BR2_INSTALL_LIBSTDCPP [Julien]
- Add homepage to config help string [Julien]
- Move comment to end of Config.in and remove condition on glibc/musl
  [Julien]
- Fix symbol for libcurl [Julien]
- Handle disabling build features which are not selected [Julien]
- Pass ldflags for libexecinfo [Julien]
- Enable building statically using config from project readme
- Link with libatomic when available, fixes bootlin-sparc-uclibc
- Add dependency on toolchain threads, skips br-arm-full-nothread
  failure
- Add dependency on wchar, skips br-powerpc-603e-basic-cpp failure
- Vulkan support depends on !BR2_ARM_CPU_ARMV5, skips
  bootlin-armv5-uclibc failure
- Link to v2: https://lore.kernel.org/r/20251022-llama-cpp-v2-1-c41a43382093@gmail.com

Changes in v2: 
- Bump version to b6818
- Link to v1: https://lore.kernel.org/r/20250619-llama-cpp-v1-1-0d4fe6710102@gmail.com
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/llama-cpp/Config.in      | 47 +++++++++++++++++++++++++++
 package/llama-cpp/llama-cpp.hash |  4 +++
 package/llama-cpp/llama-cpp.mk   | 68 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 121 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 66199a5b72..44bac1d63f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1753,6 +1753,7 @@ F:	package/at-spi2-core/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
+F:	package/llama-cpp/
 F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
diff --git a/package/Config.in b/package/Config.in
index 161d61728b..851bc35bc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2290,6 +2290,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
+	source "package/llama-cpp/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/llama-cpp/Config.in b/package/llama-cpp/Config.in
new file mode 100644
index 0000000000..d29dbcd311
--- /dev/null
+++ b/package/llama-cpp/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_LLAMA_CPP_ARCH_SUPPORTS
+	bool
+	default y
+	depends on !BR2_s390x_z13 # ggml requires z14 or higher
+
+config BR2_PACKAGE_LLAMA_CPP
+	bool "llama.cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LLAMA_CPP_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC \
+		|| (BR2_TOOLCHAIN_USES_UCLIBC && !BR2_STATIC_LIBS)
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBEXECINFO if BR2_TOOLCHAIN_USES_UCLIBC
+	help
+	  LLM inference in C/C++
+
+	  https://github.com/ggml-org/llama.cpp
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
+	depends on !BR2_ARM_CPU_ARMV5
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  Enable Vulkan backend for GPU acceleration.
+endif
+
+comment "llama-cpp needs a toolchain w/ C++, wchar, threads, and gcc >= 9"
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
+comment "llama-cpp needs a uclibc toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC && BR2_STATIC_LIBS
diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
new file mode 100644
index 0000000000..d5c171cdf6
--- /dev/null
+++ b/package/llama-cpp/llama-cpp.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  ec824d51e500d9e81a400d85f7f437cc8d1e1a96c09ee3ca8206688ded8a4187  b6854.tar.gz
+# License
+sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
new file mode 100644
index 0000000000..0b1682b138
--- /dev/null
+++ b/package/llama-cpp/llama-cpp.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# llama.cpp
+#
+################################################################################
+
+LLAMA_CPP_VERSION = 6854
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
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+LLAMA_CPP_DEPENDENCIES += libexecinfo
+LLAMA_CPP_LDFLAGS += -lexecinfo
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LLAMA_CPP_LDFLAGS += -latomic
+endif
+
+LLAMA_CPP_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS="$(LLAMA_CPP_LDFLAGS)"
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LLAMA_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF \
+		       -DCMAKE_POSITION_INDEPENDENT_CODE=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=ON
+LLAMA_CPP_DEPENDENCIES += libcurl
+else
+LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LLAMA_CPP_TOOLS),y)
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=ON
+else
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LLAMA_CPP_SERVER),y)
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=ON
+else
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LLAMA_CPP_VULKAN),y)
+LLAMA_CPP_DEPENDENCIES += vulkan-loader
+LLAMA_CPP_CONF_OPTS += -DGGML_VULKAN=ON
+else
+LLAMA_CPP_CONF_OPTS += -DGGML_VULKAN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENBLAS),y)
+LLAMA_CPP_DEPENDENCIES += openblas
+LLAMA_CPP_CONF_OPTS += -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS
+else
+LLAMA_CPP_CONF_OPTS += -DGGML_BLAS=OFF
+endif
+
+$(eval $(cmake-package))

---
base-commit: c555b6565f2747047603dc8022f81b7ea14b4890
change-id: 20251024-llama-cpp-v2-5f37be7f121a

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
