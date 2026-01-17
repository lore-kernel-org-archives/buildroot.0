Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD9FC98315
	for <buildroot@archiver.kernel.org>; Sat, 17 Jan 2026 17:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B7461194;
	Sat, 17 Jan 2026 17:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-o42UiR1ZMM; Sat, 17 Jan 2026 17:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B1E461197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768671057;
	bh=IAIAjg98kwFXX0OdtiGScneJaV8DJB5ozKEPfEfpRPY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SK4f5qr+MV3/5av0O86qXlIwJz1TEOkDdcOwhZeQ4oJmrEtFPVViacGgj1z1Fc34l
	 d/yBfEpiXm0LidQ0dfm1UnDpxjCj00G60iZ3J8qESkQ6p9xZWQzLv8CZmKEH4ssDka
	 PHIpA/2+ffzpmRQGTErHJiQQ7wtxpXoHLsrNPIP+ZurN9rueI1S0rRucUnwYlz6Wcu
	 xsglNvEe3c7V4lNg+BXc0DXpnU/80RLbdAn62npFtkgfK2NpeBSK6BGGReCCafnVlT
	 VhZhxQSJApiPrGT27nYpZim5TR4Lw/uQbKHhBVwXmWA+FvWC5GRiFQmfawKL4VuTQ2
	 othOj7yuVllSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B1E461197;
	Sat, 17 Jan 2026 17:30:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1E1D2CC
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 17:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8785861197
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 17:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAdS_MbMumeO for <buildroot@buildroot.org>;
 Sat, 17 Jan 2026 17:30:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 877F161194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 877F161194
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 877F161194
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 17:30:54 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-563497c549cso2023582e0c.3
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 09:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768671053; x=1769275853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JVz5kHwJpSnKKqEeNRRMwIRGxqNqgPbSlK+dc1FpLN4=;
 b=pKD7aeHDR11Sx0rvuQckTFTKPjrPMoYYD3T0msjgNACMCUmifrl51d0CYHzFtccGzO
 4aF0thGsCbgNzeO9hQfj5uETHX3Q0IfQMpniBxoscUqne4vImTtsUq+g61Wzow+20OC+
 zTZQfyY1dklwX5pMt6iZgWzmEnUZs5SoWBS9lRTpyGIrz6qC54SRRbo3O4D4Fevd4v2t
 9UNN+fdCoj6vsGrkOCKsH2hBE+VUcSUJZnM/9Cr1hOE1yvc6ODWZYkLnw1YNRYpe2m4c
 F+P/CWOgmC4SNyLU7p6mucFULbstoTHk1pkdgPjjt6afq1LYssNjoACrGSBLAwyefxC9
 l1iQ==
X-Gm-Message-State: AOJu0YzxQS0sU/E7u0mtrCP00m3paagf+AWm7CzbypJ/vy6Plsx8dpce
 79o8YBZGPzlnP9Y2Me2ooTDjo2hNcHsv1sWAvdHN276RvjnUgwsLi/UHFivvIQ17
X-Gm-Gg: AY/fxX5xgOr8h49GsUjtD9juwBrN7umWkKbfdM9tHHIsj4yzGauKFpCaevE7r/t/ehs
 phSpXlelRFtpikGgBwAqrrmZGFA6khLgG7+PtgOrU599CoU2bcrU/YZD13HOHDwMSiWeNHs23WJ
 wrKRWYm0pHpCsfKXrybDkiOY8+M9Trc8vATe1dpoSJ4+f2YdOX/aNjePZ34Yk1uLqaHynAWVPuZ
 ldDqGqvuQ/DmpJxNPyCgoMPzvI9SBiAVTYZHXNMPc9X/Ne/pEma5zMNYVXRf3nq2V7AcW38vQNG
 nUAEvm9jId7Kyt0k8D92Za2PixW3NWDdKyJRy2o46gSew5b3Z5bf0cGg51G3cjZLskhyOtmo+vN
 VWxhZ0oCaun14qgjP2Kyz4lE2QaW9lncsmiKP7zAvgn20Uq6cj9dv/LhTSE/OlAV/a8v9bwh1lc
 67NowkmJtnwZNjQNb0r4glsCYGHdtrxCA=
X-Received: by 2002:a05:6122:3a15:b0:55b:305b:51b7 with SMTP id
 71dfb90a1353d-563b5cedb84mr2515216e0c.20.1768671052796; 
 Sat, 17 Jan 2026 09:30:52 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:1498:1d08:3d27:ae06:3ea0:39e0])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-563b6fdb23asm1475291e0c.4.2026.01.17.09.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jan 2026 09:30:52 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 17 Jan 2026 13:30:24 -0400
Message-ID: <20260117173024.1589737-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768671053; x=1769275853; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JVz5kHwJpSnKKqEeNRRMwIRGxqNqgPbSlK+dc1FpLN4=;
 b=UN4QTo0ypmqmo+GW9z8PBfC4OK0Mw09rpgIOJtWTcnDfwdlLNtAaEERaDjNbXVTY1F
 aWReMElFbtGlv5fJnIlvFODnh2N3d8DwqjFQvmQda9QH2FbSTwIIyIyzcIpO09DShLCD
 gfMGCIfht0VcCdsG/wZKTNsygPSRetxGXFihtMSLU4JnY68TmxFbt7SJRMlLCI+oEt99
 bflKUZEcJn1hhVJESYe3nn2hShkJPHlNxF33DcKfZFvmFAUaalrF4s54y4D2R8A8klaA
 H+kokHUekI0KueQIR1Zj7DSJcQfBS/L+oGwxzsNtF6SvcrWpS+irMm0Bz5TY+Kvem2Cl
 pgpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UN4QTo0y
Subject: [Buildroot] [PATCH] package/ftxui: new package
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

FTXUI is a simple cross-platform C++ library for terminal based user interfaces

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
Package verified with check-package:
43 lines processed
0 warnings generated

and
test-pkg -a:
35 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/ftxui/Config.in  | 14 ++++++++++++++
 package/ftxui/ftxui.hash |  3 +++
 package/ftxui/ftxui.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 45 insertions(+)
 create mode 100644 package/ftxui/Config.in
 create mode 100644 package/ftxui/ftxui.hash
 create mode 100644 package/ftxui/ftxui.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ed4bdb0a0..15bde8dfd8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1256,6 +1256,7 @@ F:	package/cctz/
 F:	package/clpeak/
 F:	package/faad2/
 F:	package/fdk-aac/
+F:	package/ftxui/
 F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
diff --git a/package/Config.in b/package/Config.in
index 6ce16bce0a..008a805464 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2300,6 +2300,7 @@ menu "Text and terminal handling"
 	source "package/fcft/Config.in"
 	source "package/fmt/Config.in"
 	source "package/fstrcmp/Config.in"
+	source "package/ftxui/Config.in"
 	source "package/icu/Config.in"
 	source "package/inih/Config.in"
 	source "package/libcli/Config.in"
diff --git a/package/ftxui/Config.in b/package/ftxui/Config.in
new file mode 100644
index 0000000000..88cd77e42e
--- /dev/null
+++ b/package/ftxui/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_FTXUI
+	bool "ftxui"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # std::wstring()
+	help
+	  FTXUI is a simple cross-platform C++ library
+	  for terminal based user interfaces
+
+	  https://arthursonzogni.github.io/FTXUI/
+
+comment "ftxui needs a toolchain w/ C++, wchar and threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
diff --git a/package/ftxui/ftxui.hash b/package/ftxui/ftxui.hash
new file mode 100644
index 0000000000..38cd89ccce
--- /dev/null
+++ b/package/ftxui/ftxui.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  45819c1e54914783d4a1ca5633885035d74146778a1f74e1213cdb7b76340e71  source.tar.gz
+sha256  0224d97639ad37047d719a5ed5c0acc98de1c58ae63be0c27183dcad1328fc61  LICENSE
diff --git a/package/ftxui/ftxui.mk b/package/ftxui/ftxui.mk
new file mode 100644
index 0000000000..4cd5a0dd95
--- /dev/null
+++ b/package/ftxui/ftxui.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# ftxui
+#
+################################################################################
+
+FTXUI_VERSION = 6.1.9
+FTXUI_SOURCE = source.tar.gz
+FTXUI_SITE = $(call github,ArthurSonzogni,FTXUI,v$(FTXUI_VERSION))
+FTXUI_LICENSE = MIT
+FTXUI_LICENSE_FILES = LICENSE
+
+FTXUI_INSTALL_STAGING = YES
+
+FTXUI_CONF_OPTS = \
+	-DFTXUI_BUILD_DOCS=OFF \
+	-DFTXUI_BUILD_EXAMPLES=OFF \
+	-DFTXUI_BUILD_TESTS=OFF \
+	-DFTXUI_BUILD_TESTS_FUZZER=OFF \
+	-DFTXUI_CLANG_TIDY=OFF \
+	-DFTXUI_DEV_WARNINGS=OFF \
+	-DFTXUI_ENABLE_COVERAGE=OFF \
+	-DFTXUI_ENABLE_INSTALL=ON \
+	-DFTXUI_QUIET=OFF
+
+$(eval $(cmake-package))
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
