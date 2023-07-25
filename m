Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C713C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C75B081FC7;
	Tue, 25 Jul 2023 13:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C75B081FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id At8peV4lxhEe; Tue, 25 Jul 2023 13:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9CF08200B;
	Tue, 25 Jul 2023 13:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9CF08200B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF66F1BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7B24418B0
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7B24418B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mQWKFYFAvHA for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:51:22 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5674B418A7
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5674B418A7
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fd190065a7so46716065e9.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293080; x=1690897880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okWpVew/w7VA7kfYm9usSmDPGDPlvgwbs360o96ohxI=;
 b=El9AuYqTVNo3Kmg1SSm5NcTzLjWEQW2EasTJLAnZGt3dP6nLOurheQikSgmRSzJuws
 5/qldn6fnaZ86cyzEJ/FDjJsFFFxpvejOZxSPKnU/ySQck/9XAQ+5+oKJhEKwv6UEXWP
 70vDwKbzRS6vaLgBuavbFi2OetH7jL/oe+TgvGXsK7f9NZ7/pY9tHAyRpiNPMw5dc/bj
 Zj8B6nTfJgcZ4NaP9sT+qKvZyNYEcLfTh9+vCcsLHa29eaNP/aGBli3TMfxtY/63xYfv
 58EVVQgkEbLX5JKH98BRhnOHlzFrYGjFA2WJ9vhWHecdQGOojmAWboF6Qs2skFZlXMxy
 WlrQ==
X-Gm-Message-State: ABy/qLZYhLiXxY+f+D47XdZZA4ioMj/Pf0ZGzbl0zmZ1x9NH87hHQz34
 dTSbLCN6GUQgDj5Ps3oTrFWB++nBWlbVm0+Lx4w=
X-Google-Smtp-Source: APBJJlEC/NWyrO9VriRXPwN+mGRUUsnUSpel7GOOxA985HF5xv/2JyMBsPRalSYftA7F0fYKu32KXQ==
X-Received: by 2002:a1c:e919:0:b0:3fc:80a:9948 with SMTP id
 q25-20020a1ce919000000b003fc080a9948mr9218357wmc.19.1690293080081; 
 Tue, 25 Jul 2023 06:51:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d6150000000b00313e59cb371sm16604581wrt.12.2023.07.25.06.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:51:19 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 15:51:01 +0200
Message-Id: <20230725135105.536310-7-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725135105.536310-1-sebastian.weyer@smile.fr>
References: <20230725135105.536310-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690293080; x=1690897880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okWpVew/w7VA7kfYm9usSmDPGDPlvgwbs360o96ohxI=;
 b=U0bAAwzx4is8xm8ozfEUG4C3H65aevYK5yDkb3FyXwPV2qzY6nTWb0firnMeJcLdY5
 aSmX82aSkmA/B/WwfoXEpvd9TkIf5Rhp7QRVIDVbumO7Zpm0LsjemYabxj+tuNdPNNO9
 fONIyjm0iV6KGKvxSKHXd4b7qcUsfZDOp43ZEgKrDsCZncbHeudIrqVXXBe351nTAa6e
 nRoPAcRzwMxVpqfKXT+2PKScuSKwxcailbp4qZw3Jmn8/vr2YhEzmO/dRRd6whVwwuwb
 MteR/ddIMapAUn+YX/rT8fb0RqLUytwBHk0uJ6NSc1kX9e5fmjSdxNSAolXGMn0F8VMP
 ip8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=U0bAAwzx
Subject: [Buildroot] [PATCH 6/9] package/spirv-llvm-translator: add target
 variant to provide LLVMSPIRVLib
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
