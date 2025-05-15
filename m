Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012E2C3ABC9
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 10:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8A9C6114A;
	Thu, 15 May 2025 10:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7ZZhSMHvnZY; Thu, 15 May 2025 10:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFEEE61136
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFEEE61136;
	Thu, 15 May 2025 10:36:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 038ED153
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE1A66113B
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JweDL6_DvxbQ for <buildroot@buildroot.org>;
 Thu, 15 May 2025 10:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B40A6112E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B40A6112E
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B40A6112E
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:36:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54e98f73850so675719e87.1
 for <buildroot@buildroot.org>; Thu, 15 May 2025 03:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747305411; x=1747910211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WzewFMDwekxmue0tmBfahDHs0L44uksTbY3u11Zj3U=;
 b=RbmaqMMyCYAvAYzeiGQDRGjfdTGIPNQo6j7aM7GEUckp/u/AdSNpLUTeLLEUbTQPU2
 GU3OP0z2n7PFwVTPs5XQv0yZgcQWYNGME2fGvTQpUs8VxXCKpX8eMFggNJU4/4hcdKZJ
 43MngjkYwZWwlEkolOD66L0MQDNZPtelzLUIVoRY/VS/N9B7FkQjhNAXddV77va32b0f
 erHrU4Hnp+MUNAZ1aHzTL+pgqgB+upvi6R9AxOFnjbqnZBVkk5EpClHa+MxGwbIGmMv6
 eaywUMjSAYa5HFsq7irZXWZHp3skDgOMw1Bmdza+/EPtukGrALCf4hBXR1doZdImOyRb
 Sjmg==
X-Gm-Message-State: AOJu0YwV08suLI1acHHAiMTjSBaTPe7EJtetVbGs5GtHR68qvvedwfyp
 mkrLrHKsv7xQxax0hKwFAPUI1dXo7ME4EYZHNR6ErIDro+mDLiUWoIqaiA==
X-Gm-Gg: ASbGncvcdZhtxq1gkxqk06FaE5drVQyUNYx3Ilcw0EBNNDHeOplGRijNjFgmeia7Lna
 q4z9cJTMhEfnrbrHTdCt7yuQL9gH6MstgUAdVOiPn8SwW5OKuPmYu3paumwpqzO67QO0snFTAKj
 7cu9Hdlqn7AIrChbkBwX6wcpvzQ6XI2N2kNZcvbDq5CKl3gwjnkH5SzjN+bCf8uVJd58RdxHpdR
 1aYDiOJ0AweKslAX941FUfjNrgxiU0hdVwMje7TwBn48bhjVPhSC42vhOkV92BBdb6vGTwhh71k
 Nda1xhmQFtrCWUwibwNsvErYBvxXsswv4gfL8CwU9j7XBeelGT+eGD7mok98/+K0RyTUkORqkuy
 4qvzm2g==
X-Google-Smtp-Source: AGHT+IExMzz9mom54wm53xBvyvxDiyrr6ht4bVijw+/xlW9uVPAaWDCLacjan+IQ+z1umQTUu5bZig==
X-Received: by 2002:a05:6512:224d:b0:549:6cac:6717 with SMTP id
 2adb3069b0e04-550d61d62b8mr2611990e87.53.1747305410460; 
 Thu, 15 May 2025 03:36:50 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64cbf3fsm2571603e87.211.2025.05.15.03.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:36:49 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 12:36:21 +0200
Message-ID: <20250515103632.2631227-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747305411; x=1747910211; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WzewFMDwekxmue0tmBfahDHs0L44uksTbY3u11Zj3U=;
 b=L/fYmFmCxdrawkjGvaz3Jz1MHYw7uUwHtIfV6sZ9eAr3pOHNXZxWmi9iCbQZKGFGJf
 Fqv8g9KNuz0mPpKNhDqyIv9QN8/9KNcFOYPNgIdUmKB02AUw6P/EXM6SNUPNlqY6oF3x
 SWQVMoIgJThrwyDEa1ZalNxmNOFINmnGSL7/5msTcqMjlegI2KOr+lBfFVusxj+vhXqK
 yj8mMbFb3bZ/ObMGX6xSHGrBzilUcSYcRLwUVy7VD8czx87Cqf4N9Zjv938kwfQSrht4
 9M09EsIP3CYnx8XZ8CjjjgG0RwMYDs9nohLbZS9d3KyBAysUTmpcskx97MkJXH+bRZmB
 0o8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=L/fYmFmC
Subject: [Buildroot] [PATCH 05/10] package/qt6/qt6sensors: new package
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
