Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B23ED7831C
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 17:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD71860B24;
	Mon,  2 Dec 2024 17:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kot6JxRgAsNz; Mon,  2 Dec 2024 17:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2C6F60B76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2C6F60B76;
	Mon,  2 Dec 2024 17:40:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DB7860
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 17:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B80242A79
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 17:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_uuAa6CEXY0 for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 17:40:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E089941E85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E089941E85
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E089941E85
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 17:40:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c998.dip0.t-ipconnect.de [79.214.201.152])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6D732A4C3D62;
 Mon,  2 Dec 2024 18:40:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38332)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tIAP4-0000000031f-2o8a;
 Mon, 02 Dec 2024 17:40:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>,
 Antoine Coutant <antoine.coutant@smile.fr>
Date: Mon,  2 Dec 2024 18:40:04 +0100
Message-Id: <20241202174008.1134667-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202174008.1134667-1-bernd@kuhls.net>
References: <20241202174008.1134667-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1733161211;
 bh=MbEWKTMcRhAUsAcSTl1tLsjQ6DfIkYaHBs7whaKSXQE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p7v4fn3EprMsO1sP78T27M+Os7Wsm0ZIvJJeIvKdouBVaWwZmqB/wX+Bb0RyLg8G0
 GK5cA75uuH7j5t8B3ku7S8uizwsbAss0LwisNwygZScx6eRwaJqQzhdxSRWhMBGtAQ
 qmbdBaJ4N1VLtXpa7WH5t05R6z/vXKukzjVKTHM8iSS1ca1YY28HMimm1N2TciNbez
 p/S/NX3a4wzbNVTA+qkrXHx22RS7VfrNlqmboszzUiXlu1wY8g7qtW268RVjIJVsYI
 dE/fixhACrukcxWFlfpIUuEndOMEpfIWA3gq3HZDIZ/IjVQgQNJolJyCuRWutHQ5vX
 0vx7+hVESAEXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=p7v4fn3E
Subject: [Buildroot] [PATCH 3/7] package/spirv-llvm-translator: add target
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
index 3e54dd6b8f..3cf312eaf0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -335,6 +335,7 @@ comment "Graphic applications"
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
