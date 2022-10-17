Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9025C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 07:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A558409F8;
	Mon, 17 Oct 2022 07:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A558409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6Cn_dU3JkBe; Mon, 17 Oct 2022 07:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63B0D40573;
	Mon, 17 Oct 2022 07:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63B0D40573
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4B9D1BF3F4
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B037160B28
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B037160B28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXq64V9Pq1El for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 07:48:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7552F60AAD
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7552F60AAD
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 07:48:15 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id d26so22925555eje.10
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 00:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=geJaxNeJ/XVUNLCshlhbJAdrUvauMFjbFLmdd3KJMsI=;
 b=4qSpfrvb/skIlMxfvRIuFENN6hZSKKIjtLtmqzu3wuW9F/B2TedPyeaieo+sPpyNRE
 /sgWLBbhwXhE/N/8OUOWN2dE4yaV5wBIgBOUztJ9+4dNxYqPRgR25/FsLUXLLOXshdPe
 ii5BQntlCsSju/1L0QVwQ9wEapdWiv/7uOIuhQaYoiPPMgCq6uztdPhpOZO79C/+nO0e
 GrU515222fv3TZBd0zORM45FRut2J5JhyO1L79q7JO90Y/iyfsaS2OOawAtwBVR61808
 Cjk020FiSEiPabbVw2+Pmk2eCk7JeE8YOf/TACIQZ9QBQmU4BxjK2tPVM4eu/Yb2KxIO
 xZkQ==
X-Gm-Message-State: ACrzQf1p0wjrS9EbJHwnx4CKACTs7qKBDdlyuWioZkAltIsP5/BXMOTF
 Te81G1yYy9T9BnH6SNeG22OWDkCEPA7jjA==
X-Google-Smtp-Source: AMsMyM7bVc87DzS7hWnv/m/ctrOHcpN57qQNjOgwq8mueQxcbfZQkK7D/NqRpn/qfagm4mUcuVJ2wQ==
X-Received: by 2002:a17:907:97d4:b0:78e:1b8f:5767 with SMTP id
 js20-20020a17090797d400b0078e1b8f5767mr7708904ejc.473.1665992893035; 
 Mon, 17 Oct 2022 00:48:13 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a17090669d600b007708130c287sm5699176ejs.40.2022.10.17.00.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 00:48:12 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 09:48:04 +0200
Message-Id: <20221017074804.717851-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=geJaxNeJ/XVUNLCshlhbJAdrUvauMFjbFLmdd3KJMsI=;
 b=IdZxvQiJB1bSHXsDOvGjBtzQNVKMDalSY5vypIowEGLWdBHERojOzSLlxt4HrUMj3c
 alPCjwnzBbnqk/z3xcSf5jY5rbWeyDjwIE97WAimjU3Nw3+d2f/CvK7/n4XqPAlxg4G+
 LaJZGMFlwKw1YyjBgQVVXFt+8kJuHyU+rcu2iovtNuD/PFKJTxwFBLfmJWrXE+5ewAHz
 O47UFreFsq+Ft3/Oee27FaSabSOejhIVr3oWb32/igUoVtG08E0VCZ6jktTyXLdGaChZ
 dItSWihXhHU/97Jau74wYelCLfQlG7kUCayvFZUvBt4k8Pkd7J0ZR/5xlURO54XtavnP
 F9/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IdZxvQiJ
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6serialbus: new package
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The min. header check for canfd was also ported but to me it does not
seems necessary anymore, though I can't say this for this sure, please
feel free to drop these lines from this patch if that is the case.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/Config.in                      |  1 +
 package/qt6/qt6serialbus/Config.in         | 14 ++++++++
 package/qt6/qt6serialbus/qt6serialbus.hash | 11 +++++++
 package/qt6/qt6serialbus/qt6serialbus.mk   | 37 ++++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 package/qt6/qt6serialbus/Config.in
 create mode 100644 package/qt6/qt6serialbus/qt6serialbus.hash
 create mode 100644 package/qt6/qt6serialbus/qt6serialbus.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 4b2b9a1174..b0cc008df5 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -39,6 +39,7 @@ menuconfig BR2_PACKAGE_QT6
 if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
+source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 
 endif
diff --git a/package/qt6/qt6serialbus/Config.in b/package/qt6/qt6serialbus/Config.in
new file mode 100644
index 0000000000..e0b2b937b3
--- /dev/null
+++ b/package/qt6/qt6serialbus/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_QT6SERIALBUS
+	bool "qt6serialbus"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6 # CAN FD
+	select BR2_PACKAGE_QT6SERIALPORT
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6serialbus module.
+
+	  https://doc.qt.io/qt-6/qtserialbus-index.html
+
+comment "qt6serialbus needs headers >= 3.6"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
new file mode 100644
index 0000000000..57b68f47e8
--- /dev/null
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -0,0 +1,11 @@
+# Downloaded from https://download.qt.io/archive/qt/6.4/6.4.0/submodules/qtserialbus-everywhere-src-6.4.0.tar.xz.sha256
+sha256  efca55677c12085a85b6c0e0f401332922ebc8226b18b7fc9bb9c0d48549ea91  qtserialbus-everywhere-src-6.4.0.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.mk b/package/qt6/qt6serialbus/qt6serialbus.mk
new file mode 100644
index 0000000000..e7cd5b764a
--- /dev/null
+++ b/package/qt6/qt6serialbus/qt6serialbus.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# qt6serialbus
+#
+################################################################################
+
+QT6SERIALBUS_VERSION = $(QT6_VERSION)
+QT6SERIALBUS_SITE = $(QT6_SITE)
+QT6SERIALBUS_SOURCE = qtserialbus-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALBUS_VERSION).tar.xz
+QT6SERIALBUS_INSTALL_STAGING = YES
+QT6SERIALBUS_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6SERIALBUS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0, GFDL-1.3 no invariants (docs)
+QT6SERIALBUS_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt LICENSES/LGPL-3.0-only.txt LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6SERIALBUS_CONF_OPTS = \
+	-GNinja \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SERIALBUS_DEPENDENCIES = \
+	qt6serialport
+
+define QT6SERIALBUS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERIALBUS_BUILDDIR)
+endef
+
+define QT6SERIALBUS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6SERIALBUS_BUILDDIR) --prefix $(STAGING_DIR)/usr
+endef
+
+define QT6SERIALBUS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6SERIALBUS_BUILDDIR) --prefix $(TARGET_DIR)/usr
+endef
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
