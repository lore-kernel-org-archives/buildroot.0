Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C373C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 21:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F484043A;
	Tue, 18 Jun 2024 21:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjVLzljy2wAX; Tue, 18 Jun 2024 21:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E7742B4C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E7742B4C;
	Tue, 18 Jun 2024 21:28:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2705F1BF2EA
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10A3F40254
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ey7Nwx3haS0 for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 21:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77DC8400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77DC8400EA
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77DC8400EA
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 21:27:24 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ebdfe26217so55901301fa.2
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 14:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746042; x=1719350842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fWLvtqc85rpd1dAa4CbaADxVGvHWW0fnxKB5v/tWtZU=;
 b=b+OSV5b9G5sEJcrCk5ovz8PWGgjbrXnWYB8k/xtCFKaAZ+rD0nFRgn6KL0l12Dzep5
 YMoLY4wdfo74kcxaFaDTLKTOGPw3tYGtphBeT6ygjXOkdv7L2V7GLItErAHenGnc2Tn5
 veJxOlNeXruPMJ0ZVhdTiv4mp8cEL7HAwA3h8KLzdviLN/OyEtfdn6E0+c8oe4VY9s2k
 CKgHjpqUynfZtz/Xkrt0DvDeBh2ey5nMfmTTJp77l9Z0RJE0Wh361T+iRY2DxUEmuE42
 bKAAs8uxnq0EamD+LzCn4ofImcU7RsAkSsoUmnibHzvDXi2tvJc6brS7Q77t25ypORTp
 XUfg==
X-Gm-Message-State: AOJu0YzJlEFZe4TnU4IVgfLCT1U9ngqNhG0MS/fpboK8OaPXs7SIvT9e
 aA8tmpR08pNEvPzz2TeWEFW8dO+t96yTlxwy+lUqAvdYGxJzIwaZ+Lc1cA==
X-Google-Smtp-Source: AGHT+IHTDnlXkOA3LndetG2sGIWxEBPEthGNLjp6jrpJEDPwH2kf2sO5kILc7MPugGU8Eb433vb6kg==
X-Received: by 2002:a2e:7a02:0:b0:2ec:476:7c60 with SMTP id
 38308e7fff4ca-2ec3cec59c3mr5636171fa.27.1718746041228; 
 Tue, 18 Jun 2024 14:27:21 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7838fsm17240521fa.100.2024.06.18.14.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:27:20 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 23:26:33 +0200
Message-ID: <20240618212646.4154474-10-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
References: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
 <20240618212646.4154474-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746042; x=1719350842; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fWLvtqc85rpd1dAa4CbaADxVGvHWW0fnxKB5v/tWtZU=;
 b=BbvXVIpJtWRmWokbYrBf4VdXNKN81eNLukGFyykpdhxAyKDvRhShNIFj+FlnoZwcrH
 RV4br4z1Ksyy9dzpq7Sl5HRLJZ8ZhJHVJ9TOhZJ09VfIMRFz6W95ULAqvNZI99tsXacu
 Zikjp9n8nNKSpZwTr1tAFENigqyWpm/kEd2QZxREqxOKSnje66lWs5/KS57du4vsQh3x
 NYyiRq0yZITllohofOfEvRIk+FKu9XzKF0dw6j/uF82YSRz9lEkl8+wmo/hQAs/kdaiQ
 j8rDVJ/TJlMN/sYaPeIzWsFmdUzRRH9p1PZfjoSpEjjnBvgUeLwVphPluS6wdff0Tx/a
 erTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BbvXVIpJ
Subject: [Buildroot] [PATCH v8 10/14] package/qt6/qt6websockets: new package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                        |  1 +
 package/qt6/qt6websockets/Config.in          | 10 +++++
 package/qt6/qt6websockets/qt6websockets.hash | 11 ++++++
 package/qt6/qt6websockets/qt6websockets.mk   | 39 ++++++++++++++++++++
 4 files changed, 61 insertions(+)
 create mode 100644 package/qt6/qt6websockets/Config.in
 create mode 100644 package/qt6/qt6websockets/qt6websockets.hash
 create mode 100644 package/qt6/qt6websockets/qt6websockets.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 625134d281..16f792cff3 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -51,5 +51,6 @@ source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6websockets/Config.in"
 
 endif
diff --git a/package/qt6/qt6websockets/Config.in b/package/qt6/qt6websockets/Config.in
new file mode 100644
index 0000000000..7d65a8e65a
--- /dev/null
+++ b/package/qt6/qt6websockets/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT6WEBSOCKETS
+	bool "qt6websockets"
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6websockets module.
+
+	  https://doc.qt.io/qt-6/qtwebsockets-index.html
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
new file mode 100644
index 0000000000..4fa6bdb79f
--- /dev/null
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtwebsockets-everywhere-src-6.7.1.tar.xz.sha256
+sha256  fe16a6e4d2b819c72a56f671c5c697bae4c7f9fee4df2a4473b14caf7602feeb  qtwebsockets-everywhere-src-6.7.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.mk b/package/qt6/qt6websockets/qt6websockets.mk
new file mode 100644
index 0000000000..5dd5c8c50f
--- /dev/null
+++ b/package/qt6/qt6websockets/qt6websockets.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# qt6websockets
+#
+################################################################################
+
+QT6WEBSOCKETS_VERSION = $(QT6_VERSION)
+QT6WEBSOCKETS_SITE = $(QT6_SITE)
+QT6WEBSOCKETS_SOURCE = qtwebsockets-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WEBSOCKETS_VERSION).tar.xz
+QT6WEBSOCKETS_INSTALL_STAGING = YES
+
+QT6WEBSOCKETS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6WEBSOCKETS_CMAKE_BACKEND = ninja
+
+QT6WEBSOCKETS_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6WEBSOCKETS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6WEBSOCKETS_CONF_OPTS = \
+	-DQT_FEATURE_thread=ON \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6WEBSOCKETS_DEPENDENCIES = qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6WEBSOCKETS_DEPENDENCIES += qt6declarative
+endif
+
+$(eval $(cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
