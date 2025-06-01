Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B255C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 08:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2269E80E55;
	Sun,  1 Jun 2025 08:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-2q3yRwO_SA; Sun,  1 Jun 2025 08:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3142E80E2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3142E80E2E;
	Sun,  1 Jun 2025 08:46:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFCB4222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 961004006B
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjCOAs_1-6Yb for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 08:46:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B3B5400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B3B5400AB
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B3B5400AB
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:28 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-54e7967cf67so4110180e87.0
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 01:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748767586; x=1749372386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTmqjls+OikcY8HxqziQ5lKySzOEswY5CPCEPyoSLhc=;
 b=OMnUXXjBWZInuZqd6cw+NB9KecwqRz0tzMaE5vWY/A7U2UA6oSYfcHhglCowoJa+kT
 zU3zCFpLHgs5K4t81vvT1L5joG4N6+4DKVOOXGo6XEb8heP1a8VzplOBMuGYapZLc3bI
 VjuTRO+5vsbzYge1MlSEkN8IEjbQ91ViLbtny6LIyLlyXK6fjEn9MiigeUulnlnbc5p0
 dLgoggz4wGZVyF1NGX+R0JUvqrjw/oFK9OTwvvdVHGBXIxGXPzCM3BYF2Z3CQypointa
 rq01GOICgxB8f9dDQFbzJsonNtwF/+tVAciARgdMr653RvspqPDdLr8oLneDH+x3BJWa
 krZQ==
X-Gm-Message-State: AOJu0YzsZifFmrhNw7viR7lEBM99cwDWwuGRvfYgAhPGBWoaHBkViRcG
 jSVmSPmBUpxz5hmpAXwC9/K+TeqT/WqQQBoEYxccG+kGWZT5Em01vg4UdV7gdA==
X-Gm-Gg: ASbGncvUcSXNfag2/aT5Nc2exqOtT/qJ1o+1P2VXpDb6tMBQVHoJlZIvlgE6WC21z5Z
 U4tchnt2PU4bTLf0fy/vj5tgsz65fMRIkiiJYHnlLULKgHddzN00pbIDP7j8WrIo/j/ZyNmEru+
 G+oYC4EFdke+Hvzo/C62zSltbW0ESfM+Cxj5MfNgryml1uBvSWkuLtNPGFN7A3IyIov7WxfyjBs
 xEH7b2gICoijtEeN1QuqeroBpSZxLl+3Abx8QbjGANZiQfNP55WFibKVShD8PoU6fh30Bm0a/Yn
 CwHcCR9TGn0ZoWD+z4Myv2y9GR9ug4Bgm/hgh0Kl4HcNQGYlh6gaUooSiADOoVbY/Jlbe7MiA4A
 zO+YXRtBL2w==
X-Google-Smtp-Source: AGHT+IFBz9KwztG//F1lImSonS4Hx4Obh4Nsm5gwweAJ+3N89bQI+33JjidLVNQKfk8TPP14+cFLTg==
X-Received: by 2002:a05:6512:138d:b0:553:2191:d32f with SMTP id
 2adb3069b0e04-55343183dd1mr1105938e87.44.1748767586127; 
 Sun, 01 Jun 2025 01:46:26 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55337937764sm1227020e87.231.2025.06.01.01.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 01:46:24 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 10:46:09 +0200
Message-ID: <20250601084616.3104736-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
References: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748767586; x=1749372386; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTmqjls+OikcY8HxqziQ5lKySzOEswY5CPCEPyoSLhc=;
 b=U2tOVcoIp1o+jnfNPQfXr39dRFGMB05eXjnbxKEJfj/qTdds0k0NUvI4cFoxaIV4KC
 kuaoxhZUnCWku4Ls2nkulT+ccYRcx58fZtqnV22IW7z/pHlZ4m7E2qHjQcjekWokMM74
 wYgD9+nXj+o7wTU5sIfDvcbjHgmPL/hashqX8+ZY4Ez0y+HDaj0LZJWIn1TIpJO+EkbF
 Va++KilL/vHf1a2Wsu3Usznuuv0qGz/GhmnYQ3lT56BHDHIV00EHdyxiXrQy+BgsSN8C
 juBGhL9ROQiaCFg9AgGHiipy+lcc3p/FtFW8EQ69gF9gG8zzfihBrIjFceo4jqdbvTr2
 xwBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U2tOVcoI
Subject: [Buildroot] [PATCH 2/5] package/qt6/qt6tools: fix linguist build
 failure
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

Fixes:
-- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
  Failed to find the host tool "Qt6::lconvert".  It is part of the
  Qt6LinguistTools package, but the package could not be found.  Make sure
  you have built and installed the host Linguist module, which will ensure
  the creation of the Qt6LinguistTools package.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
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
 package/qt6/qt6tools/Config.in   | 14 ++++++++++++++
 package/qt6/qt6tools/qt6tools.mk |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 1828e5f043..8fff08b3e6 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -11,3 +11,17 @@ config BR2_PACKAGE_QT6TOOLS
 	  and design of applications.
 
 	  https://github.com/qt/qttools
+
+if BR2_PACKAGE_QT6TOOLS
+
+config BR2_PACKAGE_QT6TOOLS_LINGUIST
+	bool "linguist"
+	select BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS # lconvert is needed for linguist to build
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.8.1#n17
+	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.8.1#n17
+	help
+	  Tool for translating Qt applications, including editors and
+	  utilities for managing translation files.
+
+endif
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index b063f08887..25cbb82c84 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -41,6 +41,12 @@ ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6TOOLS_DEPENDENCIES += qt6declarative
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
