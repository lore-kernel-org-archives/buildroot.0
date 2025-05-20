Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B112C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D262D61071;
	Tue, 20 May 2025 11:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcpiOYTx22iy; Tue, 20 May 2025 11:34:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F66D61072
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F66D61072;
	Tue, 20 May 2025 11:34:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50F22D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36EC481991
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gzgazumzZVx for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:33:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4968781858
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4968781858
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4968781858
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:55 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30effbfaf4aso59372201fa.3
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740833; x=1748345633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WzewFMDwekxmue0tmBfahDHs0L44uksTbY3u11Zj3U=;
 b=ipkhGIxgW+ZvT1ftNH8L2y3ly2tS5Pfu8nn9KNqD+WC7BgVx2ZW5AIDyKXImhHSR5J
 vsHR7sIuQ5NMs6etgluOLRjatKrQAiag254/XMAhba7GQynEViFYcaUzEiANaNuGVK3d
 JI2m3LIzJiKchpdKOVh2qMy2ZVz14EXhVed0Xx5p14DV7jwkpjhU06Wpc9JoH49al5CA
 JtO1NFg6T17i4lZ/iJsDhRUHgNnlUtuZY+OB9TJWcdqkxN1NcSbOrJqMdZTOCKyNxNuj
 cJgN2JgjDZA5hfXkFcN2EcB9fJ5a87kuuAzdgVywzM58SckA3iXNPisy7QTkUuCxouQg
 veSw==
X-Gm-Message-State: AOJu0YxjIfEi3+j67F5g/HURr0pmKyDpabSgXb7A1sjOEQN3QJt/G/7y
 YhXMfERz0sKWx+cek5xNUDM+E6X4d6t+rQrXuTDQa/c75DKeKG5Tkb69LZzPiA==
X-Gm-Gg: ASbGncuamd/4phLjSr+2/Ykb+Vsq5o5eN5a0B0Wn3Jm5gIpmUDyoH1a7D/xNvNogt3c
 IXYRvYHWudh8bvEabkj/5LMSDZaK15WzdwAWNjYFuiMyjnXA8ktboG73L3fHsGuijxgd4aSdHim
 ioKDuxH3EhbtDZOmImxhauI6RlG0mjjhM7pCnpmqtr4KlliOQGDMl9xwAt9TOrYQcWE/1lRxr36
 k/mUHaB4JTrOHD6vj3JAvjE5DHuj54s7/5ZdsSy4CLTh4IbaJxiFynKQgP1yGcUeD31/Rbkom3T
 /conVFPWP43XQcdfYWGDQnjBPqXMWuGw33eWoa6sCU4ImnI7oZaaZ+8RtwofXjzrEPrQsk5luHQ
 Q+89UDQ==
X-Google-Smtp-Source: AGHT+IEIVDOkUeDMUrqU0cUP8sfY+nhixDkiy0mi2UnA4DsrUr1yyr3eISIJbzDoSPuc2+gs01GtZA==
X-Received: by 2002:a05:651c:e18:b0:2ff:56a6:2992 with SMTP id
 38308e7fff4ca-3280979ffc8mr47239741fa.37.1747740832916; 
 Tue, 20 May 2025 04:33:52 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8bdfsm23324841fa.76.2025.05.20.04.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:33:52 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 13:33:24 +0200
Message-ID: <20250520113339.2525537-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747740833; x=1748345633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WzewFMDwekxmue0tmBfahDHs0L44uksTbY3u11Zj3U=;
 b=RmX4xpkcZ1HltQep3EzZGW3wKzofjakQXj4vzkQBrCKDJ0CN6zrgEj1uk+yXRkjmz2
 hfPAaOjOs4DqLM2mDuEW4RXD8soOhcR0iYvM6kMkj+wcMWCNn8Nk6hJuY8NvyXCQb7Ec
 5P2HzfE/5Jem26dyVIPoKaOnAWc58tu/M0SMHm2x/Ee+X4CpktVI+wtxbw2khHTdYI4l
 rRfoa5dtV994afsi4c1W9jOezG82iowdlroTFS3WnNFpOw9SbWGr//FEzIhBnxbVUKaj
 RiDod0aoI4hM7w9QkJsU8LNJnYrSfLBYBvqYsEOQpK/3CcdSWrQEz+rfQau5BT1B4xxo
 zlew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RmX4xpkc
Subject: [Buildroot] [PATCH v3 05/12] package/qt6/qt6sensors: new package
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                  |  1 +
 package/qt6/qt6sensors/Config.in       |  6 +++++
 package/qt6/qt6sensors/qt6sensors.hash |  7 ++++++
 package/qt6/qt6sensors/qt6sensors.mk   | 32 ++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/qt6/qt6sensors/Config.in
 create mode 100644 package/qt6/qt6sensors/qt6sensors.hash
 create mode 100644 package/qt6/qt6sensors/qt6sensors.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index c1ea543242..05f0540db0 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -58,6 +58,7 @@ source "package/qt6/qt6positioning/Config.in"
 source "package/qt6/qt6quick3d/Config.in"
 source "package/qt6/qt6quicktimeline/Config.in"
 source "package/qt6/qt6scxml/Config.in"
+source "package/qt6/qt6sensors/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
diff --git a/package/qt6/qt6sensors/Config.in b/package/qt6/qt6sensors/Config.in
new file mode 100644
index 0000000000..db87e437b2
--- /dev/null
+++ b/package/qt6/qt6sensors/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_QT6SENSORS
+	bool "qt6sensors"
+	help
+	  This package provides the Qt Sensors module:
+
+	  https://doc.qt.io/qt-6/qtsensors-index.html
diff --git a/package/qt6/qt6sensors/qt6sensors.hash b/package/qt6/qt6sensors/qt6sensors.hash
new file mode 100644
index 0000000000..53af41c58d
--- /dev/null
+++ b/package/qt6/qt6sensors/qt6sensors.hash
@@ -0,0 +1,7 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtsensors-everywhere-src-6.9.0.tar.xz.sha256
+sha256  a46137c1f4a768d00397a2f83de7018318b0ca35d39c848da62d1783b368e467  qtsensors-everywhere-src-6.9.0.tar.xz
+
+# Hashes for license files:
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
diff --git a/package/qt6/qt6sensors/qt6sensors.mk b/package/qt6/qt6sensors/qt6sensors.mk
new file mode 100644
index 0000000000..c06b31c45e
--- /dev/null
+++ b/package/qt6/qt6sensors/qt6sensors.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# qt6sensors
+#
+################################################################################
+
+QT6SENSORS_VERSION = $(QT6_VERSION)
+QT6SENSORS_SITE = $(QT6_SITE)
+QT6SENSORS_SOURCE = qtsensors-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SENSORS_VERSION).tar.xz
+QT6SENSORS_INSTALL_STAGING = YES
+QT6SENSORS_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6SENSORS_CMAKE_BACKEND = ninja
+QT6SENSORS_LICENSE = LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
+
+QT6SENSORS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt
+
+QT6SENSORS_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR)
+
+QT6SENSORS_DEPENDENCIES = qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6SENSORS_DEPENDENCIES += qt6declarative
+endif
+
+$(eval $(cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
