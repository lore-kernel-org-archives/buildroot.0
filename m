Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8E2CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 13:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E109242081;
	Fri, 13 Oct 2023 13:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E109242081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vw_22iPQA294; Fri, 13 Oct 2023 13:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E92A4207B;
	Fri, 13 Oct 2023 13:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E92A4207B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0169F1BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 13:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD6C441FE0
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 13:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD6C441FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8kn0hCHZ1-V2 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 13:56:13 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 625F940875
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 13:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 625F940875
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9be02fcf268so26051666b.3
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205371; x=1697810171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKpSPwVE7bu+haU+2iX/931Szw27/jLMSTaprY34Cqw=;
 b=pF1JlDNoz+IxB1eKjPzPhvQ5AiQ5TNsSRLBDbDC4pIOhzFP74q81a7s0ejA1hucorM
 9/tkG+P9Eklb5dXiy4IpqJif5jYAihKI3spyOskKVD8d8rL1rK0jDMy31f+L1jiohEN+
 KX+GP4NbvyvsToBu8LG2SBr74hiCvLGZIsHdUoqT6CbGqhmujHUsvFu0c5bBHptYwjfF
 U3lK8r5dxDGtYgs2Yggc5lhFc670U0qtSlgCt80yp9t2KG/w9UCtaBWS/oVB4lJHBa+Q
 7rL+CcH5X/KYaBpPGNUW/B6yJnMsrIwSR1pLcqHQzR+oeix55W4miMsdeMKz/HxAH4+Z
 SqVw==
X-Gm-Message-State: AOJu0YxAZM/8pfAsfoaa7XmuXTTGjcpS3SDwoOiO/Q9ZXzCG6mTuKdJY
 Gl8c8ET/90CIplfgaSW0RljNNlm988kSpVz/Pq+Hlw==
X-Google-Smtp-Source: AGHT+IG+hr3AzLFjS3oCWkUFYpnDYa2X9jG/2MybSbsay0Yo7/23G34epGO1el9+m87u/Xv+CS5r8Q==
X-Received: by 2002:a17:906:23e9:b0:9b2:c583:cd71 with SMTP id
 j9-20020a17090623e900b009b2c583cd71mr25455534ejg.50.1697205370883; 
 Fri, 13 Oct 2023 06:56:10 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a170906045b00b009b655c43710sm12406706eja.24.2023.10.13.06.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 06:56:10 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 15:56:06 +0200
Message-ID: <20231013135606.3382121-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013135606.3382121-1-adam.duskett@amarulasolutions.com>
References: <20231013135606.3382121-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697205371; x=1697810171;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKpSPwVE7bu+haU+2iX/931Szw27/jLMSTaprY34Cqw=;
 b=fYXfocMgklANKijP8+RDfTvVkxEhRmkysZuVLoHmrKdiKWd0mgURhKmgJDaXvALOv8
 WFSAKC12zmkhHPB2uR0eIoFC2pA8Rzx0mySdZt8p/0qZ5jyQA6foTK5VgetLKclnaAwO
 qOamjnKjtO5O11pkkYjIwFgRtvTO9EcodboWQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fYXfocMg
Subject: [Buildroot] [PATCH 2/2] package/qt6/qt6shadertools: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Based off of previous work by Jesse Van Gavere found here:
https://patchwork.ozlabs.org/project/buildroot/patch/20230808172231.1114696-1-jesse.vangavere@scioteq.com/

Changes:
  - Select BR2_PACKAGE_HOST_QT6BASE_GUI
  - Select BR2_PACKAGE_QT6BASE_GUI
  - Add host-qt6base to HOST_QT6SHADERTOOLS_DEPENDENCIES
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6shadertools/Config.in          | 14 ++++++
 .../qt6/qt6shadertools/qt6shadertools.hash    | 13 +++++
 package/qt6/qt6shadertools/qt6shadertools.mk  | 49 +++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 package/qt6/qt6shadertools/Config.in
 create mode 100644 package/qt6/qt6shadertools/qt6shadertools.hash
 create mode 100644 package/qt6/qt6shadertools/qt6shadertools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3fffc4346c..bdc1463e83 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/qt6/qt6shadertools/
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 276a0217ab..b7e95a6885 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -47,6 +47,7 @@ source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
+source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
 
 endif
diff --git a/package/qt6/qt6shadertools/Config.in b/package/qt6/qt6shadertools/Config.in
new file mode 100644
index 0000000000..423c686444
--- /dev/null
+++ b/package/qt6/qt6shadertools/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_QT6SHADERTOOLS
+	bool "qt6shadertools"
+	select BR2_PACKAGE_HOST_QT6BASE
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  The Qt Shader Tools module builds on the SPIR-V Open
+	  Source Ecosystem as described at the Khronos SPIR-V web
+	  site.
+
+	  https://doc.qt.io/qt-6/qtshadertools-index.html
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
new file mode 100644
index 0000000000..803a083518
--- /dev/null
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -0,0 +1,13 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtshadertools-everywhere-src-6.4.3.tar.xz.sha256
+sha256  c648b74ce3e769a20bd62792a589c540bceacfedf2f38fc7273d2c39782768f8  qtshadertools-everywhere-src-6.4.3.tar.xz
+
+# Hashes for license files
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  c7d81f456bf5488fec8b2d249eec6b02e70bbdc353c373cd5a077e898345e943  src/3rdparty/SPIRV-Cross/KHRONOS-LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/SPIRV-Cross/LICENSE
+sha256  5b1050253c0b933016f0538bce3354bb062e42b4d59d1082c0d0f9eca9b439c7  src/3rdparty/glslang/LICENSE.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.mk b/package/qt6/qt6shadertools/qt6shadertools.mk
new file mode 100644
index 0000000000..4cc6d6fcbf
--- /dev/null
+++ b/package/qt6/qt6shadertools/qt6shadertools.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# qt6shadertools
+#
+################################################################################
+
+QT6SHADERTOOLS_VERSION = $(QT6_VERSION)
+QT6SHADERTOOLS_SITE = $(QT6_SITE)
+QT6SHADERTOOLS_SOURCE = qtshadertools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SHADERTOOLS_VERSION).tar.xz
+QT6SHADERTOOLS_INSTALL_STAGING = YES
+QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6SHADERTOOLS_CMAKE_BACKEND = ninja
+
+QT6SHADERTOOLS_LICENSE = \
+	GPL-3.0-only WITH Qt-GPL-exception-1.0, \
+	GPL-2.0-only or LGPL-3.0-only, \
+	GFDL-1.3-no-invariants-only, \
+	Apache-2.0 or MIT, \
+	BSD-3-Clause, \
+	BSD-2-Clause, \
+	Apache-2.0, \
+	GPL-3.0-or-later WITH Bison-Exception-2.2
+
+QT6SHADERTOOLS_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/3rdparty/SPIRV-Cross/KHRONOS-LICENSE.txt \
+	src/3rdparty/SPIRV-Cross/LICENSE \
+	src/3rdparty/glslang/LICENSE.txt
+
+QT6SHADERTOOLS_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SHADERTOOLS_DEPENDENCIES = \
+	host-pkgconf \
+	qt6base \
+	host-qt6shadertools
+
+HOST_QT6SHADERTOOLS_DEPENDENCIES = host-qt6base
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
