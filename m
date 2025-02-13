Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2C7C0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 14:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B90E283F5A;
	Thu, 13 Feb 2025 14:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6srpYi0Vz8EM; Thu, 13 Feb 2025 14:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FFC983F53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FFC983F53;
	Thu, 13 Feb 2025 14:58:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6D2BC2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B2140531
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmOLc9D9DwDD for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 14:58:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F56A40478
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F56A40478
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F56A40478
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:10 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-308f04beb24so8241121fa.2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 06:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739458688; x=1740063488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=96klme9NZGafQIg4qNmM+rB9Lo5QFwkmU8GHpR479a4=;
 b=nVHhwLsMDPQhQrkaOgSUYB05RtCWoKAHbUzv5ADQw9oS7FWop8T/TlBaYDrf1mX70U
 dqFAADT23s6snrmjSk3pO2YkqXFCdOFUJYbWSghdjCxfo+UKK8ZBs3qVKRK1Egw34cmc
 Oi/3LgPMGiykW6w2RawXOtnczC1gWhQKVP8Vd1qcRZVtAHIHFPZ5n4YEZKGEA+nUPrbR
 h849lAy7y2oudxSfeKaB6kkCvV5emxOiWbE0H0EkiyS4xb9FfMPGVyK2jCGz6goan4b3
 49juvv1XXS5LCZk+d36LUagBBWpa25eD/kJqdsVYcRWtibmbbKBN668Ex2t1l8GGPbbo
 HogA==
X-Gm-Message-State: AOJu0YybzbpjcVfuLYoLqNT48gxKtCpGGNsoauvNqTzZvrBy1826AE0z
 snQqOUZxihT4q3wZagdSie83+UZYCfOw+5G3tSbqo8PPaskjHbUZ6dxO0CH6
X-Gm-Gg: ASbGncvvyVIQzW4JisMGAk4IrOV7hFZVf4hKapkiaIVQ4vHR8DGXSDay2KInYf8eCpw
 naV6gIdxZ2ihxzdXeJhYc19lMycmRZs19DbuL3nHRMk6vCFgawKF49YRPUL1hl0n13nODiYyyvC
 o53aG72mm5VqIF8JfbikYp97DAZ+S7bS2jtsmqpR+PkMr84FukU2cAVGOo+8nM4gTuy7ORtR5kE
 RFuGSp1cRLXgyP9oMX/I606JXpWi0rBxZcLDXZKC2ag7SzBANV4rSuuKQzYs7sCg0s0lghvhyqE
 56SMQReyu9zVWepbSNZMNVzHLiMOhM5TfBjCPMIN4I2y5g==
X-Google-Smtp-Source: AGHT+IGl/VGepPs//jb1olPZvT2tZyWBc4/p3/4uNKUJ6gNsNgA/UMiyQsCux4Y9zk+5vompafJ1GQ==
X-Received: by 2002:a05:651c:19a0:b0:308:fd11:771c with SMTP id
 38308e7fff4ca-309036b51ccmr32874461fa.9.1739458687762; 
 Thu, 13 Feb 2025 06:58:07 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029be88sm2094681fa.96.2025.02.13.06.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 06:58:06 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Andreas Naumann <ANaumann@ultratronik.de>, Baxiche Su <baxiche@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Thu, 13 Feb 2025 15:57:43 +0100
Message-ID: <20250213145747.639358-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213145747.639358-1-roykollensvendsen@gmail.com>
References: <20250213145747.639358-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739458688; x=1740063488; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=96klme9NZGafQIg4qNmM+rB9Lo5QFwkmU8GHpR479a4=;
 b=Oi/JAoRDOuEC+Fnwa/UnrjehaA/Q3u2PqgrXtvODzLlulXj0+aGSRfVFEE6U6l/IEn
 tEVE92h0tEebapct2QSbznL1Uv5BEEq6ox46kQrbKU2gpZAJOoyHUbtJlWqX8YLXCqKj
 J6AyuvCkblIi/DrzT0/aKAaEdKdvTpn2AxlZ5YpiYqXj4qDfS1K8nRdcq4p8ZWXUvqDG
 M+d8JC26AaRnlcFJo26VwZYI3mE4SjlyP5UxlLv680vtv+6xk+anQquDWadMCFpwGl2K
 TKMJXzktQ5yjpWtAJ2tG8hWwQtLhnmGM6w3FQdD2WDi9lG5CvC6RoR57f64Ga7/vHUmv
 kmog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Oi/JAoRD
Subject: [Buildroot] [PATCH 3/4] package/qt6/qt6sensors: new package
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
index 10594691cf..8ae1f05139 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -55,6 +55,7 @@ source "package/qt6/qt6opcua/Config.in"
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
index 0000000000..368f290a5a
--- /dev/null
+++ b/package/qt6/qt6sensors/qt6sensors.hash
@@ -0,0 +1,7 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtsensors-everywhere-src-6.8.2.tar.xz.sha256
+sha256  8a817c9b001ad0abdbf15064826ca6a8ee6b66fef8f04b4343ac9f7b2ddbf4ca  qtsensors-everywhere-src-6.8.2.tar.xz
+
+# Hashes for license files:
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
diff --git a/package/qt6/qt6sensors/qt6sensors.mk b/package/qt6/qt6sensors/qt6sensors.mk
new file mode 100644
index 0000000000..371f5946b4
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
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SENSORS_DEPENDENCIES = qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6SENSORS_DEPENDENCIES += qt6declarative
+endif
+
+$(eval $(cmake-package))
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
