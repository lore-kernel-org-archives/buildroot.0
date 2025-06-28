Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D716FC7EE39
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 14:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9069B403FB;
	Sat, 28 Jun 2025 14:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcumRkxUNChs; Sat, 28 Jun 2025 14:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5045403A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5045403A7;
	Sat, 28 Jun 2025 14:06:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C904AF7
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 14:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D6C0842FA
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 14:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcBIEOPZD_AC for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 14:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 064C3842F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 064C3842F3
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 064C3842F3
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 14:06:09 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-553b16a0e38so3342088e87.1
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 07:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751119568; x=1751724368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2q4dPzr38SfOip03kh5LCbhoQafmBka0W6Ouzr39U1U=;
 b=OtwPKcS9jDFJCoM8UpHGkEP4RZwstHYIYrAwdE6CluIh9wTkmzF0m5WTznCRdCsr+P
 1Jkf03nS5NOolnKdD7pm2PJI94hR4vAAkISxhU/VHmNWevG56unhmezLIc+jijipHyX0
 6n/tkfkrbfiZg7upRioyvwjJXKEJz15ZsJXw3gHFsFcIYwTzINoK7MDK6uOhxNi0hHp5
 hNQh8XlAL4MKOT2CLzqc4g/P22FkRCVu6omVICyME0wwORxvVpYpmyoKuwDlC9EUSrdM
 c00JGCpxlypM/0f0dgmQhrdFl9x7h3tTQFSkShvxO1NuDMcBBl5eSDZ8CJxdISWxW9H0
 qbJw==
X-Gm-Message-State: AOJu0YxUd46ruNekz7iT74YWbJLUmXZaGAUkEF5aX3Is1JisP/+uWLdE
 CGLY6/y61Yu4Y4iOh2hrEIcoAfVVp4zVnfjBIfePkM1HdPspEBC47kT5SBXOfA==
X-Gm-Gg: ASbGncv8XjniJHGG6cWjS13MzdNx7JnyWIW7g4eIwlLU9WZy5rkjfhD0K9kIYhDzjbw
 i8TGu9ruwaCwCPta9AhIZZNdmZsyl1PTIWpuC2TawPELJsJtrmgPkVNZpDx/u1wj2UowydHvr24
 nHwu9NUhrLz61Kawgogv/s1qBKW3ROdgt7ZX6tRE1HTzYAI11Qb6aE9TXYLXBUpojPLG1KTFVIM
 snbJc9g+T98wnx0xFzhbRTLiFxp0Y867ZbbQxPHZGRAVEGygWQOSguKG3tDOJkvMDuIs+EhyvN1
 mImRkoajohnaSQtsgAjw9F1BO6pC8PGlfPGSsxrtrZn9IcYLy6Iv6qQsdg7u8xlE4JgWCu2z37W
 b0vUtbckNgr0bGZOF1eR/5dN6pKAgrxc=
X-Google-Smtp-Source: AGHT+IG0mUCFGc9xD1NpGcg6DTLnwXMVumxsS2OnJSOB8qngeQH8EL0RiGedhp/v8OaOfGjSoryoxQ==
X-Received: by 2002:a05:6512:350b:b0:553:202e:a405 with SMTP id
 2adb3069b0e04-5550b74c278mr2340064e87.0.1751119567518; 
 Sat, 28 Jun 2025 07:06:07 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2b8d6dsm814507e87.109.2025.06.28.07.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 07:06:06 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 16:05:47 +0200
Message-ID: <20250628140550.4030996-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250628140550.4030996-1-roykollensvendsen@gmail.com>
References: <20250628140550.4030996-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751119568; x=1751724368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2q4dPzr38SfOip03kh5LCbhoQafmBka0W6Ouzr39U1U=;
 b=L+k9UV9tWIVEfIikrmcQw/3l/XKC++33VhShyctW6YlHl/38obYHDJ2YPWLIdDoTIt
 LrjsSobOSctKB1g5OJWD42HUFR6f/puGxPF+sEsjjF2WpgC9rFWp3Hju9ZFxLLSkBCuK
 6b2pnghg0m63xSfeKbRPPsZtfWSAWN3TDE2jDJm63l4zNPwyAHtKmyqu9Z9OywqfG/tD
 5qOGvUnYSt8PsyvTivUjl/nZO3m2SNA1kJQwNbMEDtN/IbeGPti0vZ+SNR8oooXaPEk7
 W7T/7RlNJAh0R+NjOjaKHodj096fTK0xKPOif2gaJB64Te+hClFleEg6k/da5DvDgIhz
 5r/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=L+k9UV9t
Subject: [Buildroot] [RFC 1/2] package/qt6/qt6webchannel: new package
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                        |  1 +
 package/qt6/qt6webchannel/Config.in          |  7 ++++
 package/qt6/qt6webchannel/qt6webchannel.hash |  9 +++++
 package/qt6/qt6webchannel/qt6webchannel.mk   | 38 ++++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/qt6/qt6webchannel/Config.in
 create mode 100644 package/qt6/qt6webchannel/qt6webchannel.hash
 create mode 100644 package/qt6/qt6webchannel/qt6webchannel.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 4251b134d4..7a998b922d 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -67,6 +67,7 @@ source "package/qt6/qt6svg/Config.in"
 source "package/qt6/qt6tools/Config.in"
 source "package/qt6/qt6virtualkeyboard/Config.in"
 source "package/qt6/qt6wayland/Config.in"
+source "package/qt6/qt6webchannel/Config.in"
 source "package/qt6/qt6websockets/Config.in"
 
 endif
diff --git a/package/qt6/qt6webchannel/Config.in b/package/qt6/qt6webchannel/Config.in
new file mode 100644
index 0000000000..e8fce0762a
--- /dev/null
+++ b/package/qt6/qt6webchannel/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QT6WEBCHANNEL
+	bool "qt6webchannel"
+	help
+	  This package provides Qt6 WebChannel:
+
+	  https://doc.qt.io/qt-6/qtwebchannel-index.html
+	  https://code.qt.io/cgit/qt/qtwebchannel.git
diff --git a/package/qt6/qt6webchannel/qt6webchannel.hash b/package/qt6/qt6webchannel/qt6webchannel.hash
new file mode 100644
index 0000000000..a294c2a600
--- /dev/null
+++ b/package/qt6/qt6webchannel/qt6webchannel.hash
@@ -0,0 +1,9 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtwebchannel-everywhere-src-6.9.1.tar.xz.sha256
+sha256  19b401d9210afc416c4080b189b0c9940e90d1f7444f5d046f3d8b1ab5fcf9c0  qtwebchannel-everywhere-src-6.9.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
diff --git a/package/qt6/qt6webchannel/qt6webchannel.mk b/package/qt6/qt6webchannel/qt6webchannel.mk
new file mode 100644
index 0000000000..00ff1c5786
--- /dev/null
+++ b/package/qt6/qt6webchannel/qt6webchannel.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# qt6webchannel
+#
+################################################################################
+
+QT6WEBCHANNEL_VERSION = $(QT6_VERSION)
+QT6WEBCHANNEL_SITE = $(QT6_SITE)
+QT6WEBCHANNEL_SOURCE = qtwebchannel-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WEBCHANNEL_VERSION).tar.xz
+QT6WEBCHANNEL_INSTALL_STAGING = YES
+QT6WEBCHANNEL_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6WEBCHANNEL_CMAKE_BACKEND = ninja
+QT6WEBCHANNEL_LICENSE = LGPL-3.0 or GPL-2.0 or GPL-3.0
+
+QT6WEBCHANNEL_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt
+
+QT6WEBCHANNEL_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR)
+
+QT6WEBCHANNEL_DEPENDENCIES = qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6WEBCHANNEL_DEPENDENCIES += qt6declarative
+endif
+
+ifeq ($(BR2_PACKAGE_QT6WEBSOCKETS),y)
+QT6WEBCHANNEL_DEPENDENCIES += qt6websockets
+endif
+
+$(eval $(cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
