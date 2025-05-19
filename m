Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7722C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F54460FE2;
	Mon, 19 May 2025 21:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id We0UB3UEcpvq; Mon, 19 May 2025 21:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8862661009
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8862661009;
	Mon, 19 May 2025 21:06:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEFF0193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B000A40E2C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9Dr54E1_gbv for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:06:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92BB1410B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92BB1410B2
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92BB1410B2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:22 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30effbfaf61so62091451fa.0
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747688780; x=1748293580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KFtN6jNUwAKiDw5ksrJMzd9dLmQXeRPyMCW+kcO+Igw=;
 b=gx8kMvGDYVzNshiI+sD4iy0mCr2zSGHEEi9flYd4l4sWFc740kPdqOg0/cL9EOHCTa
 6QvDe2y/VEXQcs9AK8sICEfluCWWTFaCQQviLzwIGw9BWlNj+jeI65qb+z2t4+uFxjml
 C9YegZ0xZu8Du59vdHQYP5t9Q7UASiedKsDszOLUSjKnqjGHlVl0GYS9+U7m7rHkmhX/
 rErMkWiAu86epUuAIdny4PEwZoDAttnOktOY7Lu+F5T3oEeJm8+ZBQdxe3vg73FruyI8
 imj38qhR5QH3MBfDfY5rzAuWRMYfgBtspi00CJ8kb+tO9AMt1/tWou83BaWzt/7egdKn
 sOWg==
X-Gm-Message-State: AOJu0YwEokCed4GiSYk6MHvSXxQ0kQI6BFKid0/+Iz54lRxPCCZJt24C
 I0UvCfXJOp/nhR+Rv714Kxqw0UbA/XhEtT4RHldOfEg6f4Z/xiNnEAOt001pSg==
X-Gm-Gg: ASbGncs+dB+Y1wOJvzEsDa0dtqRpJBo2DpatNrYcdx51x7SSEwHG6/plpFGMH3K9SOs
 /KK8b/xuhtsoPTxD7wqOx4b5/W3tBa3M8Cy7CaAZHlTBodrnmW76uqEBQWeJ9N+q9gvvg1Tpa0u
 0NJBlbIeX4DcpA1swVF/E693TUJlIDBJ+WGRSU65wiNfP54yyCN8qd0ZMpantDVw5RzTvECTpe4
 0UXdWgfN4VvkkCxDvl3RdyUXRPPb+WdCHGWKPL/3MVK4jWqleM4kFmzwE3DH98FW77BwS51Ybco
 G6laQf4VBIAt/dxVF5w9e2XGKnr3IRicLvfa6oYa3PNLrMrnE+sTc/yJxXRK7LQWUu/Wvhkz85c
 utrxSUFXbAhcz5H5Z
X-Google-Smtp-Source: AGHT+IHl4n1rmj7+cFJhGRL56mSEo2mJlsV/5LHeuxT12Gd71lKHuMYe9ilZPy2JOD5uydIRvuSj0A==
X-Received: by 2002:a2e:a009:0:10b0:329:18f7:a77e with SMTP id
 38308e7fff4ca-32918f7a848mr10998931fa.1.1747688780087; 
 Mon, 19 May 2025 14:06:20 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfaebsm20181171fa.100.2025.05.19.14.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 14:06:19 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 23:05:43 +0200
Message-ID: <20250519210553.265725-10-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519210553.265725-1-roykollensvendsen@gmail.com>
References: <20250519210553.265725-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747688780; x=1748293580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KFtN6jNUwAKiDw5ksrJMzd9dLmQXeRPyMCW+kcO+Igw=;
 b=kivPFnMveXNXubHzqFrwOswSIgh9YYLyRD/+qQQVzTmE5u5yTnIvGhMAvT1N8sUM9Q
 yQmsB0Ny5a1aisDWCAg/X6qEZ2Z1Je0dx2wokNIyHnD3vyBwq/5oSdyVoKcc4ERFpJRa
 tYIxhOOz4r8D5dCTMPi5JWsZRi2Rbx7euNv4JE83f8lwLpqcO6OLW/WucytpHu/pURea
 +Ahohpf0y8H0ejM3nUi8sSctFLOKGWD++3pIb21qj2LOwdpnGOah1Zi1/85j1fAKhv/p
 AUkhjrySa5BhwFeuprsYscSivxNCuVyHZjbLnYg7spfCYNu2FzbQu/QOUFpZbbVVm++Z
 ZxfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kivPFnMv
Subject: [Buildroot] [PATCH v2 09/11] package/qt6/qt6tools: fix designer
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
CMake Error at <...>/output/build/qt6base-6.9.0/cmake/QtPublicWalkLibsHelpers.cmake:271 (message):
  The Xml target is mentioned as a dependency for Designer, but not declared.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.9.0/cmake/QtPrlHelpers.cmake:8 (__qt_internal_walk_libs)
  <...>/output/build/qt6base-6.9.0/cmake/QtPrlHelpers.cmake:47 (qt_collect_libs)
  <...>/output/build/qt6base-6.9.0/cmake/QtModuleHelpers.cmake:1149 (qt_generate_prl_file)
  <...>/output/build/qt6base-6.9.0/cmake/QtScopeFinalizerHelpers.cmake:24:EVAL:1 (qt_finalize_module)
  src/designer/src/lib/CMakeLists.txt:DEFERRED

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
 package/qt6/qt6tools/Config.in   | 11 +++++++++++
 package/qt6/qt6tools/qt6tools.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 954f432c41..e86011e7f1 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -28,4 +28,15 @@ config BR2_PACKAGE_QT6TOOLS_ASSISTANT
 	  Viewer for Qt help files (.qch), providing searchable and
 	  navigable documentation for Qt and custom projects.
 
+config BR2_PACKAGE_QT6TOOLS_DESIGNER
+	bool "designer"
+	select BR2_PACKAGE_QT6BASE_GUI # https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/designer/CMakeLists.txt?h=6.9.0#n41
+	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n52
+	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n52
+	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n52
+	select BR2_PACKAGE_QT6BASE_XML # https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/lib/CMakeLists.txt?h=6.9.0#n182
+	help
+	  Graphical tool for designing and building Qt user interfaces
+	  with a drag-and-drop editor.
+
 endif
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index f583d24735..c38630f5a7 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -47,6 +47,12 @@ else
 QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6TOOLS_DESIGNER),y)
+QT6TOOLS_CONF_OPTS += -DFEATURE_designer=ON
+else
+QT6TOOLS_CONF_OPTS += -DFEATURE_designer=OFF
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
