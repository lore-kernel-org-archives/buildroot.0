Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FDACCF9E0
	for <buildroot@archiver.kernel.org>; Tue, 28 Oct 2025 17:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A57380D74;
	Tue, 28 Oct 2025 17:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DR085hQOFmnZ; Tue, 28 Oct 2025 17:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4899080D8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4899080D8E;
	Tue, 28 Oct 2025 17:16:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42195707
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 17:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32DFA404B8
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 17:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eV-XDqn_JdMw for <buildroot@buildroot.org>;
 Tue, 28 Oct 2025 17:16:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34076404B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34076404B7
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34076404B7
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 17:16:21 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-780fc3b181aso3965299b3a.2
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 10:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761671780; x=1762276580;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Ct3dYs8LI+f/8v28FiRlv3beVDB5fLyX+b3OAoLSzA=;
 b=tp6zegz5xdlU/KsPo62CcECIBY5O0xNxFagNvTzZqPXlpuLuSl2LSQnjjjDzZuoNYl
 Goz/vLuFB/VDAb677uIyZv4msXXBGEScyxxQvFHUy+5FKjSITWWsFliKs9Vwu0iOGVKs
 4Zcuv22F3x8HrNKM9ATdXndQ1xKkBCkIe/Pg7XbhBqrIdIPGoO6EP1OqKBzT2Vl5IRxD
 Wse5gq38lyJ3mCvTmp8UwLing7qssVowOH8t15b2xidipNzxOytZcrkbpgrx9QwABX4/
 elTqreRRFeRDbbb/ztlyGhelC1KP10q2wMUjF1/omDbSBE9rthnf74q+ZO6OiKQzjt9J
 Hh5g==
X-Gm-Message-State: AOJu0Ywd5LcQ8Kl0vZmif8cwADhPrlvmo7/kS+ic7JTeuPXrqryqQt2/
 Fw5OahUi7ScvW8Uack54VUSeDemFoYrri9n9gIJfKfZFyZK936l36UFz9I9bfw==
X-Gm-Gg: ASbGnctHY1UyoD8YO/nXlPMDwZMy0bOPefgXtNPVnD3Ue41tYOJwuZ2QOEF5aQKKZ0Y
 6xhlUEiA24N9PSFp4cquhRKuvg2mLH3lYrAuoOhZOEnyloO69WnpyG3hG5j8rfmTUck9rmVRIkw
 NrYimaRsYb+O7aO9kiI6DumRnbbzGU6UBkF7gE/66KKwu6xQZA9XOPfi9/CMawOaAsOC8v/f2jx
 hMt99JrdrVOIWkiXE5U1AIvrV5OVRMywjgfSNNr5TWfiDHoM/9CkBlsOWbOxqIyRtSDuvlfOY2l
 +5mhYW17KA0zOur78qgpIH4zOByNNGyTKSUMMxtnZc0I2Ph9sAuHJeZI9ONx70Lu/woxEmpamuN
 xy5hD9V9Gb4tl/wrp4qu/UmlFdSD+1SkrkHkiGzQhIuTdHRtRIRaV+gIqnBrvEqVgAt7fh7kdka
 FW
X-Google-Smtp-Source: AGHT+IGFetQyS5opI3SNzWwvyWHJwcGmEKhgMutKCrwiXEjYEA0QCnHL4CNDF+qBkqVv6bzoponczw==
X-Received: by 2002:a05:6a20:12d3:b0:340:4bb7:8cf3 with SMTP id
 adf61e73a8af0-344d209b258mr5134749637.17.1761671780207; 
 Tue, 28 Oct 2025 10:16:20 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b712f4a8833sm10903569a12.37.2025.10.28.10.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 10:16:19 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 28 Oct 2025 10:16:16 -0700
MIME-Version: 1.0
Message-Id: <20251028-llama-cpp-v2-v4-1-5f21e78c9c6a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF/6AGkC/1XOTQqDMBAF4KtI1k3Jj6J21XsUF5N0ogFjJJHQI
 t69USjo8vGY781KIgaLkTyKlQRMNlo/5VDeCqIHmHqk9p0zEUxUnImSjiM4oHqeaRK0MrJWWBs
 uOJB8Mgc09nNwry5nE7yjyxAQzoi4IpzqkkMpZSNYK5+9AzvetXc7qCAiVQEmPeyAg7hg2IvBx
 sWH7/F3kvveX6+vepJ5oFXcNBXXytTsNNBt2/YDnMWBJAIBAAA=
X-Change-ID: 20251024-llama-cpp-v2-5f37be7f121a
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Thomas Perale <thomas.perale@mind.be>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761671779; l=9960;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=JDyqV10M+slUkU8O/itpa/oki9gdIZFa8Vy5RdZLltI=;
 b=SUhSWY7Sic1NpyrJzorOC6GN2/nw8cZdATBbi8hp6TmOH7wHR5nqku0nArr/YuckHJW/Mtvyi
 qxx2V2D7eciDbMARfBw4QOEACrDkGYmky6CPh9KP4my77pRe/ki02F6
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761671780; x=1762276580; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Ct3dYs8LI+f/8v28FiRlv3beVDB5fLyX+b3OAoLSzA=;
 b=KPMj+PGegG2ohybL4KCy+TcWSZ0HlgHP1gcNunJk/jtrKCENUqDXSCuAiSFagl9gSF
 qA0SMMH2M5gGDXMI5SH9f3Dtp4xZP0s61ONYrwy4EBxUvpCZQXVtyelA5rSgmwLDAXGS
 ksfoAln9+Av9YBpt9ihUVEUirBGtwvP7MsanEJJDTpNMT3w1xtje+XGVZ0w4FQ4yhUg7
 vo3lW8Rba/TKYuBsncIaiVISCplcGCObcV89J0JNK0GiByA+ebfENdWXKwPDCK1+jHjK
 CYhppzo027taHu86h5TmJPz0oBxSqa0ZRnxLUEkYuBQvOmtEKNePvi7A8V4fItv7W9QB
 wzyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KPMj+PGe
Subject: [Buildroot] [PATCH v4] package/llama-cpp: new package
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
Changes in v4:
- Bump version to b6865
- Add CPE identifiers [Thomas Perale]
- Update versioning to match CPE [Thomas Perale]
- Link to v3: https://lore.kernel.org/r/20251027-llama-cpp-v2-v3-1-9b1f851cbf70@gmail.com

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
 package/llama-cpp/llama-cpp.mk   | 70 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 123 insertions(+)

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
index 0000000000..81ddf4508f
--- /dev/null
+++ b/package/llama-cpp/llama-cpp.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  c108fadd61d34da6ff2cfdf085821ff03a45acde2245d9eeeba9358482b305c3  b6865.tar.gz
+# License
+sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
new file mode 100644
index 0000000000..7554d80a1e
--- /dev/null
+++ b/package/llama-cpp/llama-cpp.mk
@@ -0,0 +1,70 @@
+################################################################################
+#
+# llama.cpp
+#
+################################################################################
+
+LLAMA_CPP_VERSION = b6865
+LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz
+LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
+LLAMA_CPP_LICENSE = MIT
+LLAMA_CPP_LICENSE_FILES = LICENSE
+LLAMA_CPP_CPE_ID_VENDOR = ggml
+LLAMA_CPP_CPE_ID_PRODUCT = llama.cpp
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
