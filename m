Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B77C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B228461040;
	Tue, 18 Jun 2024 13:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pn1cE1_o6FvY; Tue, 18 Jun 2024 13:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E04461206
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E04461206;
	Tue, 18 Jun 2024 13:20:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 870251BF3BB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 822B960B93
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xz7dRfrA5yac for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:20:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC71260777
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC71260777
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC71260777
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:20:07 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52bd48cf36bso6219964e87.3
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718716806; x=1719321606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3u5ftWRKyCtSsapCJleD4RtUcU23PDuPbI/0OtkBiJI=;
 b=a7/gPvwKJNHtP2eNfOcmY0XmkX32T2IAF5OSCcYQhGideD3Bpsbd4nzJfJEyBcVfp/
 ezw1uvRJQrJWg8pCFr5YAXW1b/cfDIbARbunCmP0nNLljWyrWZj39i7KGGPkwfh2L8YN
 6/jpPyCzawQX3YU/2Dq2hpCB2RyKnwX/f/nzdHZPPsHo1ueNsXq+R5dKr1Ri5sr7sIS/
 UbpJx4LrFZfRPOFs8zySnxF993qkCr2AT8ypCxe3f+p5hx5JVRQ8Odfn4QpZBvlo2SbQ
 VQm7wv2O5M/MOrFTnPAE8dnRDyCSdYl4JbLme2tFkCJWRjRZ/+VegnMeQrpLlHZnw9Ww
 vejw==
X-Gm-Message-State: AOJu0YwnQIFAN7A45p92PC0iIQeawh7AhcjRE0zmPAZb3qZLPPRpvgyb
 hvvbDq+dnmVuC8JL0s/BUN2f8kHvy+w2KPn2m4AMCwMkulOgpQB46AqZNw==
X-Google-Smtp-Source: AGHT+IFlmUstQuYkpkHvsG/vRcRKGHbRVUXWN3d/I14k73/T1FSBtUe9Y9CjyJuwoY0wGi1/906gNg==
X-Received: by 2002:a19:ca1a:0:b0:52c:9d68:7433 with SMTP id
 2adb3069b0e04-52ca6e92f1cmr7776543e87.50.1718716804707; 
 Tue, 18 Jun 2024 06:20:04 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287228bsm1497540e87.163.2024.06.18.06.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:20:04 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 15:18:29 +0200
Message-ID: <20240618131902.2912459-8-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618131902.2912459-1-roykollensvendsen@gmail.com>
References: <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
 <20240618131902.2912459-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718716806; x=1719321606; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3u5ftWRKyCtSsapCJleD4RtUcU23PDuPbI/0OtkBiJI=;
 b=F0OoUVx4uWN6YNhIjVUEkZ9tLb7GxexIh5LJ3qy+8emvXowHdAUjaWqxR6c2lVoWrV
 9Igk4s1HJjJhiSAA9ZZ4wfHxP2AfgUhgLkpZBSsZgK4NWEri0IEgLFNAaKigBusSM/th
 hOwVs3+egif/FyuWfVp/ymcNe6iRQquzk5EVbyAWqd7NSdE4qyxkhMl2u/VFa264ENWI
 8WEFl8U09wp1ro6wC6fuNKxuJvt+k66X3UNfeSBnFkSHZnW1vZj8PEb8YmICrNZ80bBi
 uYr6yhV28WzjIJWnd8SegRxHI9BEccOzQv/bhBmo39sR+Ule6iQhjknP6DpZkqCebDEf
 scHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F0OoUVx4
Subject: [Buildroot] [PATCH v7 08/14] package/qt6/qt6languageserver: new
 package
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
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6languageserver/Config.in       |  9 +++++
 .../qt6languageserver/qt6languageserver.hash  | 11 ++++++
 .../qt6languageserver/qt6languageserver.mk    | 34 +++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/qt6/qt6languageserver/Config.in
 create mode 100644 package/qt6/qt6languageserver/qt6languageserver.hash
 create mode 100644 package/qt6/qt6languageserver/qt6languageserver.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index b7e95a6885..81682af476 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
+source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
diff --git a/package/qt6/qt6languageserver/Config.in b/package/qt6/qt6languageserver/Config.in
new file mode 100644
index 0000000000..8a54ae1911
--- /dev/null
+++ b/package/qt6/qt6languageserver/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT6LANGUAGESERVER
+	bool "qt6languageserver"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6languageserver module.
+
+	  https://doc.qt.io/qt-6/qtlanguageserver-index.html
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
new file mode 100644
index 0000000000..8193d7d14a
--- /dev/null
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtlanguageserver-everywhere-src-6.7.1.tar.xz.sha256
+sha256  a0fcda1464760e10d9d78d4260e78c94f7ef51343193d8fd2cfef991a4fa94f9  qtlanguageserver-everywhere-src-6.7.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.mk b/package/qt6/qt6languageserver/qt6languageserver.mk
new file mode 100644
index 0000000000..6f96feb275
--- /dev/null
+++ b/package/qt6/qt6languageserver/qt6languageserver.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# qt6languageserver
+#
+################################################################################
+
+QT6LANGUAGESERVER_VERSION = $(QT6_VERSION)
+QT6LANGUAGESERVER_SITE = $(QT6_SITE)
+QT6LANGUAGESERVER_SOURCE = qtlanguageserver-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6LANGUAGESERVER_VERSION).tar.xz
+QT6LANGUAGESERVER_INSTALL_STAGING = YES
+QT6LANGUAGESERVER_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6LANGUAGESERVER_CMAKE_BACKEND = ninja
+
+QT6LANGUAGESERVER_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6LANGUAGESERVER_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6LANGUAGESERVER_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6LANGUAGESERVER_DEPENDENCIES = \
+	qt6base
+
+$(eval $(cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
