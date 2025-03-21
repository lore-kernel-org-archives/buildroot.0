Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3993AC36000
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 17:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B565042401;
	Fri, 21 Mar 2025 17:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21THZjgyv0cM; Fri, 21 Mar 2025 17:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3F4A410A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3F4A410A0;
	Fri, 21 Mar 2025 17:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB42012F
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 17:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBC9580D91
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 17:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfH-qOcqVvF0 for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 17:35:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 922AB80D72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 922AB80D72
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 922AB80D72
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 17:35:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5f9.dip0.t-ipconnect.de [79.214.197.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62DBBA4C310E;
 Fri, 21 Mar 2025 18:34:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50732)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tvgGg-000000008Lx-3sHd;
 Fri, 21 Mar 2025 17:34:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Daniel Lang <dalang@gmx.at>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>,
 Antoine Coutant <antoine.coutant@smile.fr>
Date: Fri, 21 Mar 2025 18:34:45 +0100
Message-Id: <20250321173447.71453-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250321173447.71453-1-bernd@kuhls.net>
References: <20250321173447.71453-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742578491;
 bh=M9TJYAuw6NuV1CrHXwteuT7mHliO3EaIKScI8iNg79E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IUUV1uKDu0IxiyKXruSOdLB1RF3DDoAm4h8DP7zTPqW8nWANS9FgmEwSSWK7KMe9m
 gTEzjb1/rSbT3vD7ZDco1Zyslb/EgC7PUNawNXIa4tQa4S+xJR46vQFtoAGm/DFbMB
 KBF0uqnQE/4VJHxYvsP+zauFBHIKqPtja0wtW8zfotvt4Y6db5pSFKzGd8oj5INa1G
 uZy6U5ItGXtDlf8nyqwZjE/Ll9y1tWg9qIYPnN5W2ptSZw9KdA/CUT8pDgrkv78dCz
 NshRdPRxhajnC/1Qz4ixbXEnminMFppj9H7xSkBM+Emh9+NSPWKA5YCkbk2h3H//a/
 UaZ2Lq0evUgGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=IUUV1uKD
Subject: [Buildroot] [PATCH 3/5] package/spirv-llvm-translator: add target
 variant to provide LLVMSPIRVLib
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

From: Romain Naour <romain.naour@smile.fr>

This target version is needed for Rusticl which is an LLVM based OpenCL
framework[1]. Rusticl allow programs to compile OpenCL C/C++ code
at runtime with Clang. Clang generates LLVM IR which is translated into
SPIR-V by spirv-llvm-translator. Finally, mesa can use its internal
tools to manage SPIR-V.

[1]: https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/Config.in                             |  1 +
 package/spirv-llvm-translator/Config.in       | 22 +++++++++++++++++++
 .../spirv-llvm-translator.mk                  | 10 +++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/spirv-llvm-translator/Config.in

diff --git a/package/Config.in b/package/Config.in
index 173785c571..4240ddb916 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -331,6 +331,7 @@ comment "Graphic applications"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
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
index 523890a986..ffc8a63b89 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -19,4 +19,14 @@ HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
 	-DLLVM_EXTERNAL_PROJECTS="SPIRV-Headers" \
 	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=$(HOST_DIR)/include
 
+SPIRV_LLVM_TRANSLATOR_INSTALL_STAGING = YES
+SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm llvm spirv-headers
+SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
+	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=$(STAGING_DIR)/usr \
+	-DLLVM_BUILD_TOOLS=ON \
+	-DLLVM_DIR=$(STAGING_DIR)/lib/cmake/llvm \
+	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
+	-DLLVM_SPIRV_INCLUDE_TESTS=OFF
+
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
