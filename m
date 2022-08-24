Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3B5C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 09:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F78540B0E;
	Wed, 24 Aug 2022 09:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F78540B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xkg5RFnA6dEf; Wed, 24 Aug 2022 09:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EFE440B00;
	Wed, 24 Aug 2022 09:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EFE440B00
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C01D1BF357
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 09:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64DCE41625
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 09:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64DCE41625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nBQjECCuAjry for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 09:49:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA9204161F
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA9204161F
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 09:49:09 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id j21so27044929ejs.0
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 02:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Ir0Ql5zZvkrbX9Iuj4wWNR+gWo1A+ovoKWm8FJMt8LU=;
 b=o2LcQGz9umgv08rstnG9JjrtwZWgl/vtOEPQQvfGFKWpA2+3AklcHLnYRV3i1kReqZ
 MqORRoqF2Mw+2x4XTv3mWDu8nrRszLGk20tWauDc7/aECbeJvf+w6nEGcjYvVstFuJZP
 b+J25ReIR09eN+Bs92SKsXVZSc0Z3qwFy50NaoNpVxQ/O0KrH/+4M2w9P5bzwmakRSiC
 lVfgfUR+RXyfD9O//CGtuu0FfmUcqZR9DRh3uKgM13RAPVoFN495AQRdIazPIUr9SiyR
 5ceJzZMgmLxn3TU+970JDKwPfgzRQF1V5elOn9UhkpsnGSG/I24pgr8dCokpR854DoZ6
 ONfg==
X-Gm-Message-State: ACgBeo1OyDw3PO8kzAhml2txsckZzzygEOlCd8SQX767nPUUPANBhWTg
 anz9FKjYRUvaFKZaiRJBMiz/C4UvaJ0z5A==
X-Google-Smtp-Source: AA6agR4+JEfACkK+qxlMYIWxeWUTmSh4I9ptqQDZzQyQSU0lam0EqTnwOe3X4xEjjP3zkoK+4VAWeg==
X-Received: by 2002:a17:907:2c67:b0:73d:c0fe:254b with SMTP id
 ib7-20020a1709072c6700b0073dc0fe254bmr671660ejc.271.1661334547478; 
 Wed, 24 Aug 2022 02:49:07 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 ga9-20020a170906b84900b006fec4ee28d0sm891611ejb.189.2022.08.24.02.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:49:06 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 11:49:00 +0200
Message-Id: <20220824094900.3639681-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Ir0Ql5zZvkrbX9Iuj4wWNR+gWo1A+ovoKWm8FJMt8LU=;
 b=jJaqmIFH6s+D1UT/SAA/nox7RUCvjuTecMb/f4PL1r3Ig6XE+dP0LcYrgKjedk+ZWk
 nYOQAnXZTjSLmyUcBvNp8duDZqX36jehn9R5ZyDH126fVYx5ATcE/euE/+8iIRUhittN
 L0qlDrgtWULHPZS1yBPvlm2i31JsQvGTUGiiUm0rDejvX8s+YNqbN7ajkwajTPOJk/Ts
 9/xIKue/NrA0lUjt1f9Q+1HgdOK4I5SdMRkv6zIh5JIrdMrnbds4XZw40nJ+fwIv2N86
 uS4ClZXrNyJQqugzSYPmQS6/JT3dzBwsgeLROwescDsQPWQnkjcaUskv91sfdbOux5eW
 2eGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jJaqmIFH
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6serialport: add package
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/Config.in                        |  1 +
 package/qt6/qt6serialport/Config.in          | 11 ++++++
 package/qt6/qt6serialport/qt6serialport.hash |  9 +++++
 package/qt6/qt6serialport/qt6serialport.mk   | 41 ++++++++++++++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 package/qt6/qt6serialport/Config.in
 create mode 100644 package/qt6/qt6serialport/qt6serialport.hash
 create mode 100644 package/qt6/qt6serialport/qt6serialport.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 86394f49ba..4b2b9a1174 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -39,5 +39,6 @@ menuconfig BR2_PACKAGE_QT6
 if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
+source "package/qt6/qt6serialport/Config.in"
 
 endif
diff --git a/package/qt6/qt6serialport/Config.in b/package/qt6/qt6serialport/Config.in
new file mode 100644
index 0000000000..f1fd844f56
--- /dev/null
+++ b/package/qt6/qt6serialport/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT6SERIALPORT
+	bool "qt6serialport"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Serial Port provides the basic functionality, which
+	  includes configuring, I/O operations, getting and setting
+	  the control signals of the RS-232 pinouts.
+
+	  https://doc.qt.io/qt-6/qserialport.html
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
new file mode 100644
index 0000000000..9780eb86fe
--- /dev/null
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -0,0 +1,9 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtserialport-everywhere-src-6.3.1.tar.xz.sha256
+sha256  4eb6d80e65799dd2e0318df4dfba14173c1929e861718cda9bedca24253b616e  qtserialport-everywhere-src-6.3.1.tar.xz
+
+# Hashes for license files:
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
new file mode 100644
index 0000000000..5bfae1ca0c
--- /dev/null
+++ b/package/qt6/qt6serialport/qt6serialport.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# qt6serialport
+#
+################################################################################
+
+QT6SERIALPORT_VERSION = $(QT6_VERSION)
+QT6SERIALPORT_SITE = $(QT6_SITE)
+QT6SERIALPORT_SOURCE = qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz
+QT6SERIALPORT_INSTALL_STAGING = YES
+QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
+QT6SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT6SERIALPORT_CONF_OPTS += \
+        -GNinja \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_SHARED_LIBS=ON \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SERIALPORT_DEPENDENCIES = \
+        host-pkgconf \
+        host-ninja \
+	qt6base
+
+QT6SERIALPORT_INSTALL_STAGING = YES
+QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
+
+define QT6SERIALPORT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERIALPORT_BUILDDIR)
+endef
+
+define QT6SERIALPORT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR) --prefix $(STAGING_DIR)/usr
+endef
+
+define QT6SERIALPORT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR) --prefix $(TARGET_DIR)/usr
+endef
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
