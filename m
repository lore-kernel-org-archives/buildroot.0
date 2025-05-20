Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDC7C54799
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16EC26107E;
	Tue, 20 May 2025 11:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VAH_P5e19ew; Tue, 20 May 2025 11:34:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFE9B61025
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFE9B61025;
	Tue, 20 May 2025 11:34:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F982D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EE96402D1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HuUl6WCsb7De for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:34:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47C8F400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47C8F400C8
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47C8F400C8
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:04 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-310447fe59aso55394001fa.0
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740842; x=1748345642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8JVYWcWOt1Kv6x4ottqErfC+1gFk6EunBLAlJklxf18=;
 b=kb/J1qxp+wt/Pjv5Pu1kvZm0xl4etKKZ7EGHlKe6JLFGpPspiieRn1wPTHZXFEpaLD
 eR9pNYgxgSS4D3wjw1UEVRTRQaVQCRJDn6PHxwiheLwcAlu1boKrDdwz8BlvvdrfzrO8
 RN4G8ilk1Xcyr3QsvLkkE4hCcd/npmwPQx5VkcbG0mnCGCTFLc0KCHsU9XYlqurn+P+m
 3dU5Hop2jzTqmBKZ3FpvvoDBF8YzaztReDQGnA089Ou8qR/r1Ex92lLy6nAIhbiU66Jy
 6dldmarUI4QOmO+zWxwVnQuVpksws6NVk0jt+rA7FG7IefHDGPcWIIAEzilV1GamZFRe
 +Ivw==
X-Gm-Message-State: AOJu0YzP0e6wYrL3O5NdYf+3BYp/EuPMqqkMh+YLSca3Jy2L0+A6jJrg
 1QPL5Q60wcrahPtvlWgnfyxBgohbTNfnS3ui/cVaEgP5ar4Bjyyo79edhK1zIQ==
X-Gm-Gg: ASbGncskEFFgZE+aG/d8G0Fsoq9tfAVHZE6gGbpran2+oMN15QWlgN0+Q98oaCY/552
 52U+Nwcy3t9aWKvwbh7Ed/IhA69mSUUXSSv2ohPtT2pQl/WYZxHUNH/cqiWl2EKC2vIBgeAreJX
 YO80ipeY5Hgio/7Rq7MvQiPftaogSAYzK1YuadJvae/RNaFmsAQxrXvzvZe94UPLDv0W3I98ayp
 1ykTckOsIE7cQVKdsgkzlpThUmjqwoUfQeOI2aCbRmYyLyatlbmEhqjVCFe8R3KcAUVQeZzUF8O
 x8y/wpur2Ur8Vt7CGfrz0sZS4nSH0ZxZJQHZ2X6j7N12lr9zAOIzj4QDZlTzKkqKAS0MskeDxDt
 UDKodXljK8YI3k7Yr
X-Google-Smtp-Source: AGHT+IHOVMddWzC0+D5ZGR2aHn5Gj1Fvc4OA815Xrvk465rvuF2fG5UtSi9/GtMRuJb6rfw1PoYVxQ==
X-Received: by 2002:a2e:ab0a:0:b0:326:d406:f16d with SMTP id
 38308e7fff4ca-3280774af16mr61335261fa.23.1747740841846; 
 Tue, 20 May 2025 04:34:01 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8bdfsm23324841fa.76.2025.05.20.04.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:34:01 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 13:33:29 +0200
Message-ID: <20250520113339.2525537-11-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747740842; x=1748345642; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8JVYWcWOt1Kv6x4ottqErfC+1gFk6EunBLAlJklxf18=;
 b=diAxQZSOGQOVHWKJrL5+B5y+dRZqNv0Lcyq8BCUxiCyY9okyxD1MgG9u4YJ7x6TqSl
 c9NVkxjZ3Q23WgJB5wPFAL2CUFAWw2EyuHFyUXPz/fNzgGy9Y/leaJUyZgs3rMetJtkm
 iqWF42vc2enZgRO92DNql2iwJv2UPj/fr+yruG+EKWYUM2U6W8hpMCOYwkw663LhBuSi
 Zt6Mzost8P6frN/vt65NwPtbAqn5BG+ImW+vDcJPLkvgAEox/ejDgMDbqJE9wQvgqzl3
 iUWqQiXKk470spOCe64pnvpUhOgSJ52BLK5FMCr+zWIlSIhrFYJaFkBM4rgYWIlQuuBG
 BbCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=diAxQZSO
Subject: [Buildroot] [PATCH v3 10/12] package/qt6/qt6tools: fix linguist
 build failure
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
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
-- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)
CMake Error at <...>/output/build/qt6base-6.9.0/cmake/QtToolHelpers.cmake:784 (message):
  Failed to find the host tool "Qt6::lconvert".  It is part of the
  Qt6LinguistTools package, but the package could not be found.  Make sure
  you have built and installed the host Linguist module, which will ensure
  the creation of the Qt6LinguistTools package.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.9.0/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
  src/linguist/lconvert/CMakeLists.txt:9 (qt_internal_add_tool)

The above error can be triggered by the following defconfig:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_PNG=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
BR2_PACKAGE_QT6TOOLS=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/Config.in   | 10 ++++++++++
 package/qt6/qt6tools/qt6tools.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index e86011e7f1..cc0c507b86 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -39,4 +39,14 @@ config BR2_PACKAGE_QT6TOOLS_DESIGNER
 	  Graphical tool for designing and building Qt user interfaces
 	  with a drag-and-drop editor.
 
+config BR2_PACKAGE_QT6TOOLS_LINGUIST
+	bool "linguist"
+	select BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS # lconvert is needed for linguist to build
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.9.0#n17
+	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.9.0#n17
+	help
+	  Tool for translating Qt applications, including editors and
+	  utilities for managing translation files.
+
 endif
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index c38630f5a7..2e3268558e 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -53,6 +53,12 @@ else
 QT6TOOLS_CONF_OPTS += -DFEATURE_designer=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6TOOLS_LINGUIST),y)
+QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
+else
+QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
+endif
+
 HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
