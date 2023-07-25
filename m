Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C343FC001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 17:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83CE9610DE;
	Tue, 25 Jul 2023 17:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83CE9610DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uud1IsNXegni; Tue, 25 Jul 2023 17:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD4976112C;
	Tue, 25 Jul 2023 17:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD4976112C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 659AF1BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DE2A40632
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DE2A40632
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ax-JoN1irkm9 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 17:33:57 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0B0940965
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 17:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0B0940965
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-316feb137a7so5315551f8f.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 10:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690306435; x=1690911235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okWpVew/w7VA7kfYm9usSmDPGDPlvgwbs360o96ohxI=;
 b=ZRgriyrEiuIM8o7rYYBc/65KpgXCzNVFTGQWLNmRf+bAIJx26A87R3Qr837DfDBymr
 qRTTEKy6SDzFd74wR/vbL9HD38ut+eIFFwnMvq4FEbqD7QKv4HBmGWlMFwYYM7BVsbLs
 A/pBTuxO2BpfG0n6f3p/hvJsGdkyNwOhDiirZgRL4MFQobBQGHImsph7N/1O2zEBSNfg
 +3OtufHrfMw5Rfy2H77rD3y8x2M25nsL2lN40b2PB1I2Z2UxzW+UBHIjRllstBlqIAx2
 phAfOtr4UmxJk+ZSYcK/HYFxyA3LSDUv8+DHqH7Pk6p31qdIci3qRI64YEpS8vBALe5q
 3QHw==
X-Gm-Message-State: ABy/qLZvRgkFR6AkLebkUVDYE3MpXkUZ1XqFXayJBDbIdto32tF0oOgn
 m75+rV858KIclbzXIirjodxzMFXFahVHqXOr9n4=
X-Google-Smtp-Source: APBJJlElK2jqThmTOBYnYhWqGD7uwEjIpx4/sCeL5Fbo3tRv4DQ/0HwYEHtZ4EtRoB7Mc5SAJc6pHg==
X-Received: by 2002:a5d:66c8:0:b0:314:4473:5bad with SMTP id
 k8-20020a5d66c8000000b0031444735badmr11006871wrw.65.1690306434740; 
 Tue, 25 Jul 2023 10:33:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b00316eb7770b8sm11721541wrv.5.2023.07.25.10.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:33:54 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 19:30:58 +0200
Message-Id: <20230725173102.543874-7-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725173102.543874-1-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690306435; x=1690911235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okWpVew/w7VA7kfYm9usSmDPGDPlvgwbs360o96ohxI=;
 b=Kp1F9Gzib3SSDqGQptgXDHLhEVLFiXVf7w8fO+x3A9YiY1+R+RwUkaS7Hykvykyqf4
 Kkh2PWtWh7DXNnCePbSgWC7+Sd28bNqHfM+i4FKj6mPKVGUWpctbzpCD3Z6Darkpvf4U
 t2owqcdLd/OV4mL5/zcgL4qZ1H4GGM7/sH8eOeVCRcgb5o6k4WmdGvFOB/Xx1wJUNfq3
 d143WYKwy/liGGaI2+btKtyWB42CaFgGiNEaGstKoEVMHHDOUCRxmWJYUrHx9AeoXRT1
 Po2nM+AsPIeBjEMg7an4rFRTHFKZMZ10QP66E7rj5+vvW4bVQHiqihBSD3kbqlF6NDVw
 oRCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=Kp1F9Gzi
Subject: [Buildroot] [PATCH v2 6/9] package/spirv-llvm-translator: add
 target variant to provide LLVMSPIRVLib
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
Cc: Romain Naour <romain.naour@smile.fr>, Samuel Martin <s.martin49@gmail.com>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

This target version is needed for Rusticl which is an LLVM based OpenCL
framework:

https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/Config.in                             |  1 +
 package/spirv-llvm-translator/Config.in       | 22 +++++++++++++++++++
 .../spirv-llvm-translator.mk                  | 13 ++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 package/spirv-llvm-translator/Config.in

diff --git a/package/Config.in b/package/Config.in
index aa917264d7..f7b369b42a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -327,6 +327,7 @@ comment "Graphic applications"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
 	source "package/spirv-headers/Config.in"
+	source "package/spirv-llvm-translator/Config.in"
 	source "package/spirv-tools/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/sway/Config.in"
diff --git a/package/spirv-llvm-translator/Config.in b/package/spirv-llvm-translator/Config.in
new file mode 100644
index 0000000000..73ca787d8a
--- /dev/null
+++ b/package/spirv-llvm-translator/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
+	bool "spirv-translator"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
+	select BR2_PACKAGE_LLVM
+	select BR2_PACKAGE_SPIRV_HEADERS
+	select BR2_PACKAGE_ZLIB
+	help
+	  LLVM/SPIR-V Bi-Directional Translator is a library and tool
+	  for translation between LLVM IR and SPIR-V.
+
+	  https://github.com/khronosGroup/SPIRV-LLVM-Translator
+
+comment "spirv-translator needs a toolchain w/ threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 37db47340e..7a3457a1fa 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -10,11 +10,22 @@ SPIRV_LLVM_TRANSLATOR_VERSION = v15.0.0-46-ge82ecc2bd7295604fcf1824e47c95fa6a09c
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm
+
+HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm spirv-headers zlib
 HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
 	-DLLVM_BUILD_TOOLS=ON \
 	-DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
 	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
 	-DLLVM_SPIRV_INCLUDE_TESTS=OFF
 
+SPIRV_LLVM_TRANSLATOR_INSTALL_STAGING = YES
+SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm llvm
+SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
+	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_DIR}/usr \
+	-DLLVM_BUILD_TOOLS=ON \
+	-DLLVM_DIR=$(STAGING_DIR)/lib/cmake/llvm \
+	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
+	-DLLVM_SPIRV_INCLUDE_TESTS=OFF
+
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
