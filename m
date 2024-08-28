Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB64AC54EDA
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 11:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A099D8131C;
	Wed, 28 Aug 2024 11:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFpcrz99Xx-U; Wed, 28 Aug 2024 11:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BC3981320
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BC3981320;
	Wed, 28 Aug 2024 11:07:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7E301BF852
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 11:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94AD381320
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 11:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWAyDqwlHuIh for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 11:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 48F6E8131C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48F6E8131C
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48F6E8131C
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 11:07:13 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f409c87b07so77373671fa.0
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 04:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724843231; x=1725448031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2AyQY+D+hU5P9xXL5/2aEoJDT3GV8IWzdxW8zp9lUeo=;
 b=v24uu+5Hv5rG1S3QO1q3y3ZCS1NbNWDv3iAIosXA9h3/ExcL7+9Dh3VBiEM9wFqFlt
 3HtTnlQMQOtTJcZTTAft8KKJ7j8ARSklYM1b3HIBbLHt9kr921cq3C71ugrOUC3jjSRi
 dSKM3IdjmAj8raymATeBmvomS3OWWx/3uWr+R2WYXtA0c/3QruuSwXCh+U1clFhl6B7c
 oqFwcMITqapxBc7o/WCRW/Zt04mLo76FMPnT+8iNG5dUJeR+9EjNlg96Xc0tb0cu8CjM
 M49MG1qSTj0zpojtEfrmRJei5/N1iyZEfjcjyX/JH57nFgwafj99Zc7t+5En+E6whKkt
 1mZQ==
X-Gm-Message-State: AOJu0Yxlk6F/SIT+uhoLsGC6l5faazdTqDMCgQjOajPf3PHvraogOKmU
 dqSZERrRkTgZWYPs7eF89rYGR5elu038jlSWB7oKGRC22AL/MnpnPCwVGQ==
X-Google-Smtp-Source: AGHT+IGdgewTNOH7ENPpZ8FmtTLQK8rAswrnOlxRMVFabj+7WnJvvOFDRrsXswsl6eSvDz2maSGEAA==
X-Received: by 2002:a05:6512:10d6:b0:533:4ed9:904d with SMTP id
 2adb3069b0e04-53438772c07mr9888125e87.17.1724843230542; 
 Wed, 28 Aug 2024 04:07:10 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea363a0sm2108063e87.72.2024.08.28.04.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 04:07:09 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 13:06:46 +0200
Message-ID: <20240828110647.150583-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724843231; x=1725448031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2AyQY+D+hU5P9xXL5/2aEoJDT3GV8IWzdxW8zp9lUeo=;
 b=LjGMHrATz6QX94qiyZNpvsu8d93utLBFGz6Mn1gV0Wr+jk9oZ0iqrT+DhCAzHy9UJF
 4Jc74B69PTCNDYPBZGGqbyfFbNRni1d9Q8v7U6x+92ofgPBKGcfP/9AavJARAT1TzBnh
 1RM5nx7Y3Pe8JT/0AgktrBXmEZmQTuQy1iJXSVwru8DP+mF9zY278NjRY4U4sg3nZPLy
 SMDTZM3kY+D2XOE1L7w3PR3eq13TB85cEEXHZv3g5ahxGzMXXvbP+ar1mY2L6Nbxqwi6
 SEhrR2gXzHXsZE9iNW7j76zfPFwhd0jQZVNQ/uJpQ4XssKLQ3L2INpabOx+vPZZEzdHY
 BqiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LjGMHrAT
Subject: [Buildroot] [PATCH 1/1] package/qt6: fix license information
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
 Jesse Van Gavere <jesseevg@gmail.com>,
 Andreas Naumann <ANaumann@ultratronik.de>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 .../qt6/qt6core5compat/qt6core5compat.hash    |  7 ++++++
 package/qt6/qt6core5compat/qt6core5compat.mk  | 18 ++++++++++----
 .../qt6/qt6declarative/qt6declarative.hash    |  7 +++++-
 package/qt6/qt6declarative/qt6declarative.mk  | 24 +++++++++++++------
 .../qt6languageserver/qt6languageserver.hash  |  1 -
 .../qt6languageserver/qt6languageserver.mk    | 11 ++++++---
 package/qt6/qt6mqtt/qt6mqtt.hash              |  1 -
 package/qt6/qt6mqtt/qt6mqtt.mk                |  9 +++----
 package/qt6/qt6opcua/qt6opcua.hash            |  7 ++++++
 package/qt6/qt6opcua/qt6opcua.mk              | 15 +++++++++---
 package/qt6/qt6serialbus/qt6serialbus.hash    |  1 -
 package/qt6/qt6serialbus/qt6serialbus.mk      | 10 +++++---
 package/qt6/qt6serialport/qt6serialport.mk    |  8 +++----
 .../qt6/qt6shadertools/qt6shadertools.hash    |  5 ++++
 package/qt6/qt6shadertools/qt6shadertools.mk  | 21 ++++++++++++----
 package/qt6/qt6svg/qt6svg.hash                |  1 +
 package/qt6/qt6svg/qt6svg.mk                  | 12 ++++++----
 package/qt6/qt6tools/qt6tools.hash            |  5 +++-
 package/qt6/qt6tools/qt6tools.mk              | 19 ++++++++++-----
 .../qt6virtualkeyboard.hash                   |  1 -
 .../qt6virtualkeyboard/qt6virtualkeyboard.mk  |  9 ++++---
 package/qt6/qt6wayland/qt6wayland.hash        |  2 +-
 package/qt6/qt6wayland/qt6wayland.mk          | 15 +++++++-----
 package/qt6/qt6websockets/qt6websockets.hash  |  1 -
 package/qt6/qt6websockets/qt6websockets.mk    | 12 ++++++----
 25 files changed, 155 insertions(+), 67 deletions(-)

diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index 36421b53ca..5139e66a4a 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -8,3 +8,10 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  425475b78739a2985e61c619ba833af364bba405c69e9cf2eb027e5790cc00c8  src/core5/codecs/QBIG5CODEC_LICENSE.txt
+sha256  a2cc13f96cc199017b0e41c4a44faef0cce9a024fac0710e39d8fc499d738bff  src/core5/codecs/QBKCODEC_LICENSE.txt
+sha256  a2a58c25c18cc5c203b2ebf7a706f6baeb93d43fc443bc095acded6d259842ea  src/core5/codecs/QEUCJPCODEC_LICENSE.txt
+sha256  1c1a8f5823b81498368ba5ff489f1c05fb61a71dcbe4ebd8138bde86837ade2c  src/core5/codecs/QEUCKRCODEC_LICENSE.txt
+sha256  a2a58c25c18cc5c203b2ebf7a706f6baeb93d43fc443bc095acded6d259842ea  src/core5/codecs/QJISCODEC_LICENSE.txt
+sha256  a2a58c25c18cc5c203b2ebf7a706f6baeb93d43fc443bc095acded6d259842ea  src/core5/codecs/QSJISCODEC_LICENSE.txt
+sha256  e749770c43d1287fa0c0855b2fefea4efa34e6cfa806cf3dc1efa5351a7774bc  src/core5/codecs/QTSCIICODEC_LICENSE.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.mk b/package/qt6/qt6core5compat/qt6core5compat.mk
index 0b6d9369cb..98b7487dbc 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.mk
+++ b/package/qt6/qt6core5compat/qt6core5compat.mk
@@ -13,10 +13,12 @@ QT6CORE5COMPAT_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6CORE5COMPAT_CMAKE_BACKEND = ninja
 
 QT6CORE5COMPAT_LICENSE = \
-	GPL-2.0+ or LGPL-3.0, \
-	GPL-3.0 with exception (tools), \
-	GFDL-1.3 (docs), \
-	BSD-3-Clause
+	BSD-2-Clause (codecs), \
+	BSD-3 Clause (buildsystem, examples, snippets), \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 (tests), \
+	GPL-3.0 with exception (utils), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
 
 QT6CORE5COMPAT_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
@@ -24,7 +26,13 @@ QT6CORE5COMPAT_LICENSE_FILES = \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/core5/codecs/QBKCODEC_LICENSE.txt \
+	src/core5/codecs/QEUCJPCODEC_LICENSE.txt \
+	src/core5/codecs/QEUCKRCODEC_LICENSE.txt \
+	src/core5/codecs/QJISCODEC_LICENSE.txt \
+	src/core5/codecs/QSJISCODEC_LICENSE.txt \
+	src/core5/codecs/QTSCIICODEC_LICENSE.txt
 
 QT6CORE5COMPAT_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 006b49e4b1..0229e17902 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -2,10 +2,15 @@
 sha256  4c29cba1af8c42d425d8eb6e01bad24cb80f4b983d71eef566a0542dfdb9b999  qtdeclarative-everywhere-src-6.7.2.tar.xz
 
 # Hashes for license files:
+sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  e6bc9e9c474700b708f568bac9e5a8a9bcb2b1dad53442f5ba449fcb848b8e76  LICENSES/CC-BY-3.0.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
+sha256  1d361a8f8e8ce6e68457dcd93fb56e162e6baa3bbb7e7573a290d44399f6b57e  LICENSES/OFL-1.1.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  9ba0c20a2972274f27e975d79ed3582e322d6891338266a52e2d3a9417fc0a72  src/3rdparty/masm/LICENSE
+sha256  a1c1daa9eec4db907907c0ccc42a4843bb996410f888b972a39fe152e829bc3d  src/quickcontrols/material/LICENSE_ANGULARJS.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
index 57a89a3b6e..6bff6c9594 100644
--- a/package/qt6/qt6declarative/qt6declarative.mk
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -14,20 +14,30 @@ QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6DECLARATIVE_CMAKE_BACKEND = ninja
 
 QT6DECLARATIVE_LICENSE = \
-	LGPL-3.0 or GPL-3.0 or GPL-2.0, \
-	BSD-3-Clause (docs), \
+	Apache-2.0 (examples, weather-icons), \
+	BSD-2-Clause (masm), \
+	BSD-3-Clause (buildsystem, examples, snippets), \
+	CC-BY-3.0 (examples, map-of-europe), \
 	GFDL-1.3 no invariants (docs), \
-	BSD-3-Clause (examples), \
-	GPL-3.0 (tests), \
-	GPL-3.0 WITH Qt-GPL-exception-1.0 (tools)
+	GPL-3.0 (tests,	tools), \
+	GPL-3.0 with exception (plugins, tests, tools), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins), \
+	MIT (examples, gear-icon, shadow_angular_material), \
+	OFL-1.1 (work-sans-font)
 
 QT6DECLARATIVE_LICENSE_FILES = \
+	LICENSES/Apache-2.0.txt \
 	LICENSES/BSD-3-Clause.txt \
+	LICENSES/CC-BY-3.0.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/MIT.txt \
+	LICENSES/OFL-1.1.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/3rdparty/masm/LICENSE \
+	src/quickcontrols/material/LICENSE_ANGULARJS.txt
 
 QT6DECLARATIVE_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index 7266474428..d6dea6f05f 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -7,5 +7,4 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.mk b/package/qt6/qt6languageserver/qt6languageserver.mk
index 7ef5b9d92d..3089e5226d 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.mk
+++ b/package/qt6/qt6languageserver/qt6languageserver.mk
@@ -13,14 +13,19 @@ QT6LANGUAGESERVER_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6LANGUAGESERVER_CMAKE_BACKEND = ninja
 
 QT6LANGUAGESERVER_LICENSE = \
-	GPL-2.0 or LGPL-3.0 or GPL-3.0, \
-	GPL-3.0 (tests)
+	BSD-3 Clause (buildsystem), \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 (tests), \
+	GPL-3.0 with exception (utils), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0
 
 QT6LANGUAGESERVER_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt
+	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6LANGUAGESERVER_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index 67ae6d0de3..efcb5af41c 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -4,5 +4,4 @@ sha256  be2d3f12378a8e2a103c328201b1e308f8c6c09bd752322592b3164cebba5bde  qt6mqt
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.mk b/package/qt6/qt6mqtt/qt6mqtt.mk
index 00c6705cc8..48f2057bdb 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.mk
+++ b/package/qt6/qt6mqtt/qt6mqtt.mk
@@ -14,14 +14,15 @@ QT6MQTT_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6MQTT_CMAKE_BACKEND = ninja
 
 QT6MQTT_LICENSE = \
-	BSD-3-Clause (examples), \
-	GFDL-1.3-invariants-only (docs), \
-	GPL-3.0
+	BSD-3-Clause (buildsystem, examples), \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 (modules, tests)
 
 QT6MQTT_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
-	LICENSES/GPL-3.0-only.txt
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6MQTT_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index cf54bef98e..3bf3873950 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -7,3 +7,10 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  a0065c18af521d2a10ab25ec0e4b2ab660bff9fd1624df8bde05e8627613220f  src/3rdparty/open62541/AUTHORS
+sha256  23bb110e608dcaf9bbc303ba34885b34688dad4fccea3bf45762539d4fa4b6bc  src/3rdparty/open62541/BSD-3-CLAUSE
+sha256  5e436ff8ffbb77d8607220e9bce20c8915d860010feeb6c1ebef5a85688e9b39  src/3rdparty/open62541/CC-BY-SA-4.0
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/open62541/LICENSE-2.0.txt
+sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  src/3rdparty/open62541/LICENSE-CC0
+sha256  e239ef69c9c4eead9406bdc6a34f2bd1220c3dcd3b17c8377cb2fb73fdaf0d38  src/3rdparty/open62541/MIT
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  src/3rdparty/open62541/mpl-2.0.815ca599c9df.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.mk b/package/qt6/qt6opcua/qt6opcua.mk
index 6c8ff7af89..74e2b665d2 100644
--- a/package/qt6/qt6opcua/qt6opcua.mk
+++ b/package/qt6/qt6opcua/qt6opcua.mk
@@ -13,16 +13,25 @@ QT6OPCUA_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6OPCUA_CMAKE_BACKEND = ninja
 
 QT6OPCUA_LICENSE = \
-	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
+	BSD-3-Clause (buildsystem, examples, snippets), \
 	GFDL-1.3 no invariants (docs), \
-	BSD-3-Clause (examples + buildsystem)
+	GPL-3.0 (tests), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins, tools)
 
 QT6OPCUA_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
-	LICENSES/LGPL-3.0-only.txt
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/3rdparty/open62541/AUTHORS \
+	src/3rdparty/open62541/BSD-3-CLAUSE \
+	src/3rdparty/open62541/CC-BY-SA-4.0 \
+	src/3rdparty/open62541/LICENSE-2.0.txt \
+	src/3rdparty/open62541/LICENSE-CC0 \
+	src/3rdparty/open62541/MIT \
+	src/3rdparty/open62541/mpl-2.0.815ca599c9df.txt
 
 QT6OPCUA_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 1b854284a3..3d9634d15c 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -7,5 +7,4 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.mk b/package/qt6/qt6serialbus/qt6serialbus.mk
index 631531e14f..6c48ce22c6 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.mk
+++ b/package/qt6/qt6serialbus/qt6serialbus.mk
@@ -13,14 +13,18 @@ QT6SERIALBUS_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6SERIALBUS_CMAKE_BACKEND = ninja
 
 QT6SERIALBUS_LICENSE = \
-	GPL-2.0+ or LGPL-3.0, \
-	GPL-3.0, GFDL-1.3 no invariants (docs)
+	BSD-3-Clause (buildsystem, examples), \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 (tests), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins, tools)
 
 QT6SERIALBUS_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt
+	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6SERIALBUS_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
index bdb16dd892..c2c69382a9 100644
--- a/package/qt6/qt6serialport/qt6serialport.mk
+++ b/package/qt6/qt6serialport/qt6serialport.mk
@@ -13,10 +13,10 @@ QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6SERIALPORT_CMAKE_BACKEND = ninja
 
 QT6SERIALPORT_LICENSE = \
-	GPL-2.0+ or LGPL-3.0, \
-	GPL-3.0 with exception (tools), \
-	GFDL-1.3 (docs), \
-	BSD-3-Clause
+	BSD-3-Clause (buildsystem, examples, snippets), \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 (tests), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules)
 
 QT6SERIALPORT_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 9cb423c90f..06544690d0 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -8,3 +8,8 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  afe3458e2431963def8b2c1520d342566725a07b46344aa34c5d327531bf2873  src/3rdparty/SPIRV-Cross/COPYRIGHT.txt
+sha256  c7d81f456bf5488fec8b2d249eec6b02e70bbdc353c373cd5a077e898345e943  src/3rdparty/SPIRV-Cross/KHRONOS-LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/SPIRV-Cross/LICENSE
+sha256  7a0986b241205c038dcea76b343dd9b7030a424b644a7d59585200824831dae8  src/3rdparty/glslang/COPYRIGHT.txt
+sha256  adb783e734e906d1f46db5df29991dbde84bdb0ceab502ac2febb44fe3c2b5f4  src/3rdparty/glslang/LICENSE.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.mk b/package/qt6/qt6shadertools/qt6shadertools.mk
index 660dc5a78d..33f4dbc74b 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.mk
+++ b/package/qt6/qt6shadertools/qt6shadertools.mk
@@ -13,17 +13,28 @@ QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6SHADERTOOLS_CMAKE_BACKEND = ninja
 
 QT6SHADERTOOLS_LICENSE = \
+	Apache-2.0 and Khronos License (SPIRV-Cross) \
 	Apache-2.0 or MIT (SPIRV-Cross), \
-	GPL-2.0 or LGPL-3.0 or GPL-3.0, \
-	GPL-3.0 (tests), GFDL-1.3 no invariants (docs), \
-	GPL-3.0 WITH Qt-GPL-exception-1.0 (tools)
+	BSD-3-Clause (buildsystem), \
+	BSD-3-Clause and Khronos License and Apache-2.0 and GPL-3.0+ with Bison exception-2.2 and AML-glslang (glslang), \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 (tests), \
+	GPL-3.0 with exception (tools), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules), \
+	MIT (SPIRV-Cross)
 
 QT6SHADERTOOLS_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/3rdparty/glslang/COPYRIGHT.txt \
+	src/3rdparty/glslang/LICENSE.txt \
+	src/3rdparty/SPIRV-Cross/COPYRIGHT.txt \
+	src/3rdparty/SPIRV-Cross/KHRONOS-LICENSE.txt \
+	src/3rdparty/SPIRV-Cross/LICENSE
 
 QT6SHADERTOOLS_CONF_OPTS = \
 	-DBUILD_WITH_PCH=OFF \
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index 7adfd7f2fb..9d0e5d7690 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -8,3 +8,4 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  3a946598a9f674d44df764279ca0b85b5d6faba08f3bc75d8e0fcf6cd729a9bd  src/svg/XSVG_LICENSE.txt
diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index a9d7eaef51..ce2f84b059 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -13,10 +13,11 @@ QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6SVG_CMAKE_BACKEND = ninja
 
 QT6SVG_LICENSE = \
-	GPL-2.0+ or LGPL-3.0, \
-	GPL-3.0 with exception (tools), \
-	GFDL-1.3 (docs), \
-	BSD-3-Clause
+	BSD-3-Clause (buildsystem, examples, snippets), \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 (tests), \
+	HPND-sell-variant (XSVG), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
 
 QT6SVG_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
@@ -24,7 +25,8 @@ QT6SVG_LICENSE_FILES = \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/svg/XSVG_LICENSE.txt
 
 QT6SVG_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index 622df4a00f..6854e68832 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -8,5 +8,8 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  01728bacf4137aeb434d81a19d9542928d0937976c8f6b54ae0475b5376aa0ee  src/assistant/qlitehtml/src/3rdparty/GUMBO-AUTHORS.txt
+sha256  71bd488e77ee821bf38d89e2b8a9c5ebe687553fcae9cefa00a96499792a3e23  src/assistant/qlitehtml/src/3rdparty/litehtml/LICENSE
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  src/qdoc/catch/CATCH_LICENSE.txt
+sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  src/qdoc/qdoc/src/qdoc/clang/AST/LLVM_LICENSE.txt
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index 09c986cfc6..f68b154651 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -13,19 +13,26 @@ QT6TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6TOOLS_CMAKE_BACKEND = ninja
 
 QT6TOOLS_LICENSE = \
-	BSD-3-Clause (examples), \
-	BSD-3-Clause (corecon), \
-	BSL-1.0 (catch), \
-	LGPL-3.0 or GPL-3.0 or GPL-2.0, \
-	GPL-3.0 WITH Qt-GPL-exception-1.0
+	Apache-2.0 with LLVM-exception (QualTypeNames), \
+	Apache-2.0 and MIT (Gumbo), \
+	BSD-3-Clause (buildsystem, corecon, examples, litehtml, snippets), \
+	BSL-1.0 (Catch2), \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 with exception (tools), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
 
 QT6TOOLS_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
 	LICENSES/BSL-1.0.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/assistant/qlitehtml/src/3rdparty/GUMBO-AUTHORS.txt \
+	src/assistant/qlitehtml/src/3rdparty/litehtml/LICENSE \
+	src/qdoc/catch/CATCH_LICENSE.txt \
+	src/qdoc/qdoc/src/qdoc/clang/AST/LLVM_LICENSE.txt
 
 QT6TOOLS_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index f34eb11e9e..1e6184a1ab 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -5,7 +5,6 @@ sha256  320664b55a0960ff79c1b822dcf6e8cebe3e08b791147d41b570996d81ce180f  qtvirt
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
 sha256  05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1  src/plugins/openwnn/3rdparty/openwnn/NOTICE
 sha256  b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986  src/plugins/pinyin/3rdparty/pinyin/NOTICE
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk
index 5c61ed7ec4..627214ef9c 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk
@@ -14,12 +14,15 @@ QT6VIRTUALKEYBOARD_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6VIRTUALKEYBOARD_CMAKE_BACKEND = ninja
 
 QT6VIRTUALKEYBOARD_LICENSE = \
-	BSD-3-Clause (examples), \
-	GPL-3.0, \
-	Apache-2.0 (openwnn, pinyin, tcime plugins)
+	Apache-2.0 (openwnn, pinyin), \
+	Apache-2.0 and BSD-3-Clause (tcime), \
+	BSD-3-Clause (buildsystem, examples, snippets), \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 (modules, plugins, tests)
 
 QT6VIRTUALKEYBOARD_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	src/plugins/openwnn/3rdparty/openwnn/NOTICE \
 	src/plugins/pinyin/3rdparty/pinyin/NOTICE \
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index 3d0ded7bec..abdb56011a 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -7,5 +7,5 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  a8341b9c90ef447a77f55d550e6691e370d3ac15d60edb584def356e348ab828  src/3rdparty/protocol/MIT_LICENSE.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.mk b/package/qt6/qt6wayland/qt6wayland.mk
index 29fc25edb0..177f8ba0fb 100644
--- a/package/qt6/qt6wayland/qt6wayland.mk
+++ b/package/qt6/qt6wayland/qt6wayland.mk
@@ -14,18 +14,21 @@ QT6WAYLAND_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6WAYLAND_CMAKE_BACKEND = ninja
 
 QT6WAYLAND_LICENSE = \
-	BSD-3-Clause (examples, tests), \
-	GPL-3.0 (compositor), \
-	LGPL-3.0 or GPL-2.0 or GPL-3.0, \
-	GPL-3.0 WITH Qt-GPL-exception-1.0 (tests), \
-	GFDL-1.3 no invariants (docs)
+	BSD-3-Clause (buildsystem, examples, tests), \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 (compositor, modules, plugins), \
+	GPL-3.0 with exception (tests, tools), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (client, modules, plugins, tests), \
+	MIT (protocol)
 
 QT6WAYLAND_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/3rdparty/protocol/MIT_LICENSE.txt
 
 QT6WAYLAND_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 5dfeeef01d..f222971846 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -7,5 +7,4 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.mk b/package/qt6/qt6websockets/qt6websockets.mk
index 5e6da70e63..4184e23eed 100644
--- a/package/qt6/qt6websockets/qt6websockets.mk
+++ b/package/qt6/qt6websockets/qt6websockets.mk
@@ -14,15 +14,17 @@ QT6WEBSOCKETS_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6WEBSOCKETS_CMAKE_BACKEND = ninja
 
 QT6WEBSOCKETS_LICENSE = \
-	LGPL-3.0 or GPL-2.0 or GPL-3.0, \
-	BSD-3-Clause (examples), \
-	GPL-3.0 (tests)
+	BSD-3-Clause (buildsystem, examples, snippets), \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 (tests), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
 
 QT6WEBSOCKETS_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
-	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/BSD-3-Clause.txt
+	LICENSES/LGPL-3.0-only.txt
 
 QT6WEBSOCKETS_CONF_OPTS = \
 	-DQT_FEATURE_thread=ON \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
