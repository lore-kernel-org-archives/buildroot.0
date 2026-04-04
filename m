Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C01E88D8B
	for <buildroot@archiver.kernel.org>; Sat,  4 Apr 2026 11:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFDCA605BD;
	Sat,  4 Apr 2026 11:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zht_I2YOd5FO; Sat,  4 Apr 2026 11:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4777607AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775303016;
	bh=/axmVL3jR5iKa/kE8ArDNuY3PGT6MC8Fu1WYqlRlwXk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qjKy3TFEVHr1urcfkT2kNYnlCQWREvE7V8Cy8NADIPdRRvxSm7TNOA3I8SFn/ibfH
	 CcjYLYYKenX5enVu12ILb4mSxihQV7ImsXzhll91bi1ozVP/n97t+2N2xC8HhXPsHo
	 MXcfFmAsftHIm7iiJ4buv79qSKpdkevqN8ythgS7uQzhO+ifPkTg0bkhhd2nJGFLAJ
	 Y3QOzTTJ//cy+uq5ADZdtX8mnmCHSs3T+++jtG76gUksGhu2wlRsZDVvMfd+927pqX
	 OsArva2sXvAgY1DgdruAcIHlKVGIeDfMLOc2ZRPZvcESqjtXigAyhvCARjCpURlSgM
	 TYln+wamn8WJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4777607AA;
	Sat,  4 Apr 2026 11:43:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A510DF2
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 11:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D74881141
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 11:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bq8tLDGcp4gi for <buildroot@buildroot.org>;
 Sat,  4 Apr 2026 11:43:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6E178113D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6E178113D
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6E178113D
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 11:43:33 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c76b9efc299so1001908a12.0
 for <buildroot@buildroot.org>; Sat, 04 Apr 2026 04:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775303012; x=1775907812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B0+ROlkzPuvv1S6diAxOGNkwTAHMVBVKcCoKZCztClo=;
 b=Lq8sni6R1KBXaYTIxTiYyxyXOa+cYp9X3cAuliqoNpQW3Cz+1tEazauwg7np5yf8nN
 NPV3p4iYGqZdVtiHCr2t9sY4N5nelgvyS7wjyuEE/s1l+ItmMRIfrN5os+YRFwsGdXPK
 nDTlC4ouOAwN3ag+sGuYAJSqqv33zMqzriw0fibHA+KcNsZsfngljcStapzroxtHOQat
 qIv/vnhzmtjaKBoRKoujhbCidYBquUyXgmt7bWMAf7e6BLsT22PI7pQL3x3d5uKIdoDo
 7Ad8fhX1JCLWZmTpRJ6Qb2p8kdkqReT+SBNMEbt6brDyQYSE34k3sHMXaNJ7rZ1vtZi8
 yYkQ==
X-Gm-Message-State: AOJu0Yw9/GYRG6+5EUGfrwJTYIvZICAX6mJR9+9DoPbYuJm541cV9u/u
 GSxLIqbAbyf6CJUpwYN2/86t+sQ0jjatyfreT0vuDpF0Kod4YsgKGM85t2K6iA==
X-Gm-Gg: AeBDietNPEYrokc9429DcEr+6LC4hjLsGKkF6Z7j29qFaAT+Q/8cT0t3hA63/MHba30
 N1cluqAihc0A2Bwu9ORe6FieiIcnhESZScGBuc1cueG9aYuDXDGORQ88+d5CrGaNs0ZIFReylSY
 BjOORhgCT6ICM0DiZRpsisL7VeQtkLG3/qXKYg5d6UTMscejzMMjeiKt7mIAkjpTnH81ymmUp6O
 Pa8vMLhOVEzG3lYC/SYApkGA6Yrt9USCADjIf80frIgC8FuR0L5saHOwxAt3FT4qMfV86QUQaLX
 1rKHdTL0koEG0+MvpuTNywd84dMzgZ2P68jODdglQmzKQB7YnSNbJ05yySkD6lNIOOOQTID+uWI
 zLYWKg/ji5NvkwZEm0urQrIpX7g7VvA7zaAaeJeavAyRbJjQgtkPlptL7gd7YnK6BzBu74HLwno
 q1j34od+qhpwcN5G+rAWEmYEhbuFVNSr+IpbY=
X-Received: by 2002:a17:903:94e:b0:2b0:7026:24bf with SMTP id
 d9443c01a7336-2b28180530fmr63050155ad.14.1775303012209; 
 Sat, 04 Apr 2026 04:43:32 -0700 (PDT)
Received: from fedora ([2409:40e5:1126:477b:379d:30fd:d3e2:3b3c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749c38adsm106991035ad.69.2026.04.04.04.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2026 04:43:31 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat,  4 Apr 2026 17:13:14 +0530
Message-ID: <20260404114315.206532-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775303012; x=1775907812; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B0+ROlkzPuvv1S6diAxOGNkwTAHMVBVKcCoKZCztClo=;
 b=qdZXdrhWebmP2QjNhrmKEJ35yGDe7NSQvqMWA+7v8jCNsE/HxRUu4Q7Wjl0QJgPOzX
 sj3EUNFuSwWPkQW6F+/tpcSdXT7wgBD23ZULskFX090w4bR5d5C4UoFuSP+VquFWKtjj
 9rUM41WhUF6Uz3PzO+8ftvf7mOhyajKV1ypQUUb8SHQx8sskedMcFr25BcHrpj4jHyN9
 bQ82S3HAmTRhEiZdKIX2N4to4hWcy+uijVRKdD6+UqkYzeQ3x6RjSP5mK1TJ1DyJ/hDe
 Dp/nwRqeu5eG0O/7x9OKjQbsgy26kr55Xh93vL+eeVDHw1MQiJQqV04rvxx4kyKSIcxu
 ebtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qdZXdrhW
Subject: [Buildroot] [PATCH] package/whisper-cpp: new package
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

Add whisper.cpp, a C/C++ port of OpenAI's Whisper automatic speech
recognition (ASR) model. Supports inference on CPU with optional
hardware acceleration backends.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/whisper-cpp/Config.in        | 48 ++++++++++++++++++++++
 package/whisper-cpp/whisper-cpp.hash |  4 ++
 package/whisper-cpp/whisper-cpp.mk   | 60 ++++++++++++++++++++++++++++
 5 files changed, 114 insertions(+)
 create mode 100644 package/whisper-cpp/Config.in
 create mode 100644 package/whisper-cpp/whisper-cpp.hash
 create mode 100644 package/whisper-cpp/whisper-cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 15de0a3cb6..e6f8bd2af7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3061,6 +3061,7 @@ F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
+F:	package/whisper-cpp/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/package/Config.in b/package/Config.in
index a2b0d885a7..05a58a3552 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -58,6 +58,7 @@ menu "Audio and video applications"
 	source "package/vlc/Config.in"
 	source "package/vorbis-tools/Config.in"
 	source "package/wavpack/Config.in"
+	source "package/whisper-cpp/Config.in"
 	source "package/wireplumber/Config.in"
 	source "package/yavta/Config.in"
 	source "package/ympd/Config.in"
diff --git a/package/whisper-cpp/Config.in b/package/whisper-cpp/Config.in
new file mode 100644
index 0000000000..e70491eacb
--- /dev/null
+++ b/package/whisper-cpp/Config.in
@@ -0,0 +1,48 @@
+config BR2_PACKAGE_WHISPER_CPP_ARCH_SUPPORTS
+	bool
+	default y
+	depends on !BR2_s390x_z13 # ggml requires z14 or higher
+
+config BR2_PACKAGE_WHISPER_CPP
+	bool "whisper.cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_WHISPER_CPP_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	# whisper.cpp needs libexecinfo when built with uclibc,
+	# and libexecinfo needs dynamic libraries.
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC \
+		|| (BR2_TOOLCHAIN_USES_UCLIBC && !BR2_STATIC_LIBS)
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBEXECINFO if BR2_TOOLCHAIN_USES_UCLIBC
+	help
+	  High-performance inference of OpenAI's Whisper automatic
+	  speech recognition model in C/C++.
+
+	  https://github.com/ggml-org/whisper.cpp
+
+if BR2_PACKAGE_WHISPER_CPP
+
+config BR2_PACKAGE_WHISPER_CPP_TOOLS
+	bool "Enable tools"
+	help
+	  Build and install CLI tools like whisper-cli, whisper-server
+	  and whisper-bench.
+
+config BR2_PACKAGE_WHISPER_CPP_VULKAN
+	bool "Vulkan support"
+	depends on !BR2_ARM_CPU_ARMV5
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  Enable Vulkan backend for GPU acceleration.
+
+endif
+
+comment "whisper-cpp needs a toolchain w/ C++, wchar, threads, and gcc >= 9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
+comment "whisper-cpp needs a uclibc toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC && BR2_STATIC_LIBS
diff --git a/package/whisper-cpp/whisper-cpp.hash b/package/whisper-cpp/whisper-cpp.hash
new file mode 100644
index 0000000000..76e561a85a
--- /dev/null
+++ b/package/whisper-cpp/whisper-cpp.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  9ce7b33028793fcbf62f81f1fd087af7778dace8772eaba8c43c66bf0c8a3eed  whisper.cpp-v1.7.4.tar.gz
+# License
+sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
diff --git a/package/whisper-cpp/whisper-cpp.mk b/package/whisper-cpp/whisper-cpp.mk
new file mode 100644
index 0000000000..a55995b0aa
--- /dev/null
+++ b/package/whisper-cpp/whisper-cpp.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# whisper.cpp
+#
+################################################################################
+
+WHISPER_CPP_VERSION = v1.7.4
+WHISPER_CPP_SOURCE = whisper.cpp-$(WHISPER_CPP_VERSION).tar.gz
+WHISPER_CPP_SITE = https://github.com/ggml-org/whisper.cpp/archive/refs/tags
+WHISPER_CPP_LICENSE = MIT
+WHISPER_CPP_LICENSE_FILES = LICENSE
+WHISPER_CPP_CPE_ID_VENDOR = ggml
+WHISPER_CPP_CPE_ID_PRODUCT = whisper.cpp
+WHISPER_CPP_INSTALL_STAGING = YES
+WHISPER_CPP_CONF_OPTS = \
+	-DWHISPER_BUILD_TESTS=OFF \
+	-DWHISPER_FATAL_WARNINGS=OFF \
+	-DWHISPER_CURL=OFF \
+	-DWHISPER_SDL2=OFF \
+	-DGGML_OPENMP=OFF \
+	-DGGML_OPENCL=OFF \
+	-DGGML_BLAS=OFF
+
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+WHISPER_CPP_DEPENDENCIES += libexecinfo
+WHISPER_CPP_LDFLAGS += -lexecinfo
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+WHISPER_CPP_LDFLAGS += -latomic
+endif
+
+WHISPER_CPP_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS="$(WHISPER_CPP_LDFLAGS)" \
+	-DCMAKE_SHARED_LINKER_FLAGS="$(WHISPER_CPP_LDFLAGS)"
+
+ifeq ($(BR2_STATIC_LIBS),y)
+WHISPER_CPP_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=OFF \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON
+endif
+
+ifeq ($(BR2_PACKAGE_WHISPER_CPP_TOOLS),y)
+WHISPER_CPP_CONF_OPTS += \
+	-DWHISPER_BUILD_EXAMPLES=ON \
+	-DWHISPER_BUILD_SERVER=ON
+else
+WHISPER_CPP_CONF_OPTS += \
+	-DWHISPER_BUILD_EXAMPLES=OFF \
+	-DWHISPER_BUILD_SERVER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WHISPER_CPP_VULKAN),y)
+WHISPER_CPP_DEPENDENCIES += vulkan-loader
+WHISPER_CPP_CONF_OPTS += -DGGML_VULKAN=ON
+else
+WHISPER_CPP_CONF_OPTS += -DGGML_VULKAN=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
