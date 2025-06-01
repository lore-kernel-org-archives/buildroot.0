Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD07C5B549
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A641405E9;
	Sun,  1 Jun 2025 10:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyL9TYUMAOiS; Sun,  1 Jun 2025 10:41:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6075B41DD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6075B41DD0;
	Sun,  1 Jun 2025 10:41:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED633222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2E0C60A51
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLjzjZqzJhhr for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:41:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D53C9606E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D53C9606E7
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D53C9606E7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:44 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55329bd977aso4575352e87.1
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748774502; x=1749379302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iihJBgc8p1knhYnKxgQfxi+LXRUDOxlPNmfLuy2at8U=;
 b=wmdfA2XgBveiAqzufu7e81VrQYi6i/gSus1aZkDDw/FKs+YiUfA7AFz/0f0JT1xhIB
 xjOPSb/rd6zEtEB52xKrbdi/7NUJVRj/VPeloSYAScupbUl5MJSu6yyGTn2vJzcgSo1K
 Y1U2nSJc/V1ePqvYNQjq8aVYfQGWxTl7svbB1NbJP8CvAR5VKNxDaqesz58xwrxe4Yr7
 Gf3shvpo97KiQiNxs7ZSv6EH9Bn3tLy2zhZhJgLXpyYOUkohQlTlo6o0ddwCGt7ePqWR
 /Y4jvH1ZD2e02yBevB1RjdBEJx/azctu2ndQaqvvRujR1MlbZjXwPdg5rkQuLWV2+afN
 xjDw==
X-Gm-Message-State: AOJu0Yy2vJtUN1/V8R27KuxoBah/rN0BFZzsnntxfPHE/7MpQwSXFGeT
 0uTERhVMY2N2Dakjz4AiQEHNvzg1V+jN7TBr99Wl5IkyyUMYuvxdgIDRtWx/OA==
X-Gm-Gg: ASbGnctVewyn/ErKgzB/ngaXBgW2ColZ3Xr4Ifw4+OS2CiCoN138Bnzkxeb3P8OFLDs
 k+FuCGDnTGBTFpB6u3IDTJrsAb/lonqFfiTeqAuoAb9ECZE7axc1xn2NKdDBtRKJ5fLM3TzoOL7
 49jo8ZsSl/wySr0AA9kzqBz6SzBmqCsFjyGxYlSakYRRUyDdt0KCWXQUU55/BK0sCVwor1Rxtad
 LAj4DEuS0nw/o9rulSay4pzsoYNgD/6SIhxtzsUuMdNBhBgXCIxrdVtXZFgxwdeb5YEGkPLFPiB
 eB52j7Z9JCnFtV4BHhfIhNf2wWwVN6G7ShIxSjo/2I+Ul1Uo5QEMzGW7yAYEiJ7i42iN/3F3d0r
 pnNKnwUs7FmKkuS2Xku8r
X-Google-Smtp-Source: AGHT+IGiAjq6eQUaQoQGm5U4W/vVQwreaIxChgOIH/eGGy9zlvhdL1AVZSq2LhObIwMolXU/KjcS6A==
X-Received: by 2002:a05:6512:3ca4:b0:553:35bb:f7ba with SMTP id
 2adb3069b0e04-5533ba4772fmr2674822e87.11.1748774502257; 
 Sun, 01 Jun 2025 03:41:42 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553379378easm1266670e87.240.2025.06.01.03.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:41:40 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jun 2025 12:41:23 +0200
Message-ID: <20250601104133.3238551-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601104133.3238551-1-roykollensvendsen@gmail.com>
References: <20250601104133.3238551-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748774502; x=1749379302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iihJBgc8p1knhYnKxgQfxi+LXRUDOxlPNmfLuy2at8U=;
 b=hiTInVCbEhXvmI5v1ZA70+7gFzxU7LiUMxMyhRc/hTgVG6DPs+UmjX4YC0TfZG31cU
 rT+0D6FOb993fOz3VU7ugXVnXcJ7jcW3k0fIFiK1yqbbrt0dqYLvZgv3zF123u+gi2Sm
 QulFXxOlZfL5JEBH66YLEFpo2FC4bTUYuZh3+1xsOkg2uT4owNbAOr3e4NGV1HQWK+2F
 2Pl59OpJb06ppk1rxWFdxOasaGl+A4JZ5JfN242/0ARpQv0qYDY8xgQMEe9zkts+hkLd
 S7bW9gRfTlmkpy1bmAjptyPpDJ13u4s0jP4gYy2InfEK/NggyxwfXyM6oN41tarpYwlf
 0cKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hiTInVCb
Subject: [Buildroot] [PATCH v4 1/6] package/qt6: bump version to 6.9.0
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

For details see:
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.2/release-note.md
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.3/release-note.md
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.9.0/release-note.md

Qt6 Multimedia:
legal-info broke because license files were removed. This problem was fixed
by removing the corresponding hashes and LICENSE_FILES entries.

Qt6 SVG:
Fix legal-info after license file was removed.

Qt6 Quick 3d:
Fix legal-info after license files were removed.

Qt6 Virtual Keyboard:
Fix legal-info after change in license file.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6.mk                                   |  4 ++--
 package/qt6/qt6base/qt6base.hash                     |  4 ++--
 package/qt6/qt6charts/qt6charts.hash                 |  4 ++--
 package/qt6/qt6core5compat/qt6core5compat.hash       |  4 ++--
 package/qt6/qt6declarative/qt6declarative.hash       |  4 ++--
 package/qt6/qt6graphs/qt6graphs.hash                 |  4 ++--
 package/qt6/qt6languageserver/qt6languageserver.hash |  4 ++--
 package/qt6/qt6mqtt/qt6mqtt.hash                     |  2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash         | 12 ++----------
 package/qt6/qt6multimedia/qt6multimedia.mk           |  8 --------
 package/qt6/qt6opcua/qt6opcua.hash                   |  2 +-
 package/qt6/qt6quick3d/qt6quick3d.hash               |  6 ++----
 package/qt6/qt6quick3d/qt6quick3d.mk                 |  4 +---
 package/qt6/qt6quicktimeline/qt6quicktimeline.hash   |  4 ++--
 package/qt6/qt6scxml/qt6scxml.hash                   |  4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash           |  4 ++--
 package/qt6/qt6serialport/qt6serialport.hash         |  4 ++--
 package/qt6/qt6shadertools/qt6shadertools.hash       |  4 ++--
 package/qt6/qt6svg/qt6svg.hash                       |  5 ++---
 package/qt6/qt6svg/qt6svg.mk                         |  3 +--
 package/qt6/qt6tools/qt6tools.hash                   |  4 ++--
 .../qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash   |  6 +++---
 package/qt6/qt6wayland/qt6wayland.hash               |  4 ++--
 package/qt6/qt6websockets/qt6websockets.hash         |  4 ++--
 24 files changed, 43 insertions(+), 65 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 33cbf7551f..9c353e4049 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QT6_VERSION_MAJOR = 6.8
-QT6_VERSION = $(QT6_VERSION_MAJOR).1
+QT6_VERSION_MAJOR = 6.9
+QT6_VERSION = $(QT6_VERSION_MAJOR).0
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 94269047c5..dd9f38d701 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtbase-everywhere-src-6.8.1.tar.xz.sha256
-sha256  40b14562ef3bd779bc0e0418ea2ae08fa28235f8ea6e8c0cb3bce1d6ad58dcaf  qtbase-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtbase-everywhere-src-6.9.0.tar.xz.sha256
+sha256  c1800c2ea835801af04a05d4a32321d79a93954ee3ae2172bbeacf13d1f0598c  qtbase-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
index 215d18c576..3ed6b339e6 100644
--- a/package/qt6/qt6charts/qt6charts.hash
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtcharts-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2edea3f16e248ef508d99332798645b7f5ab6edbbf2e3d7d78fb674156f07d29  qtcharts-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtcharts-everywhere-src-6.9.0.tar.xz.sha256
+sha256  8a1c9287f25fe47b110ada87e8c73b928a93f05435440d0a27f591d25c317f28  qtcharts-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index ba13da8d4e..bb6e28f8e2 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qt5compat-everywhere-src-6.8.1.tar.xz.sha256
-sha256  05c8c088b4cd8331fa8a9c8b7ff7c42a088cb112e673eae5708048d0131264fc  qt5compat-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qt5compat-everywhere-src-6.9.0.tar.xz.sha256
+sha256  55be0539d3a12071fbe0cd57af17d6dc3fc52578b1649824975e26301f710763  qt5compat-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 81b8ca929b..26c88e5b69 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtdeclarative-everywhere-src-6.8.1.tar.xz.sha256
-sha256  95d15d5c1b6adcedb1df6485219ad13b8dc1bb5168b5151f2f1f7246a4c039fc  qtdeclarative-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtdeclarative-everywhere-src-6.9.0.tar.xz.sha256
+sha256  a3175fa510847a136734f989e2bfea7f7bbb9dc9acc98b40b544d26f5ba20d3d  qtdeclarative-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
index 59d35d9e66..a54b0f256f 100644
--- a/package/qt6/qt6graphs/qt6graphs.hash
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgraphs-everywhere-src-6.8.1.tar.xz.sha256
-sha256  1e46e3de69936835652ab40ef8caf5824ea71e26871274561fb65ec142d54a80  qtgraphs-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtgraphs-everywhere-src-6.9.0.tar.xz.sha256
+sha256  9e5b08cdc1934b2525b5586a458861c180ee9f3aaccf6c36bac37b502afaa0c6  qtgraphs-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index a330ecb323..e18472dae9 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtlanguageserver-everywhere-src-6.8.1.tar.xz.sha256
-sha256  865e9436c1432a53e38a30625b6cee60bf72553ff508047115513a233c8e6d7e  qtlanguageserver-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtlanguageserver-everywhere-src-6.9.0.tar.xz.sha256
+sha256  eee65e036152eee36b63127013fb8e4f0cbbde66bae5f88864b56b70e357492e  qtlanguageserver-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index f13fbaab9c..6d48535fda 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  757c96a645b81e858c19b5407d54b3a40ee288d04ffadc9a96dd52e50c6d8d6b  qt6mqtt-6.8.1-git4.tar.gz
+sha256  46c470c751a780d55e4d5ae9805ad222520d7fcf0ebec803ffe81801f196a23b  qt6mqtt-6.9.0-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index cddafb56a8..800c250a61 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,22 +1,14 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtmultimedia-everywhere-src-6.8.1.tar.xz.sha256
-sha256  75fa87134f9afab7f0a62c55a4744799ac79519560d19c8e1d4c32bdd173f953  qtmultimedia-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtmultimedia-everywhere-src-6.9.0.tar.xz.sha256
+sha256  995c3b194f3de3e1929280639642f7661d94aa57523c459dbbf2f71dbdcaa18c  qtmultimedia-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files
-sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df  LICENSES/BSD-2-Clause.txt
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-sha256  1f1b677d26ab73e159a55c3a914cf12d888e18a9d0d469fedab4aa6e5a48b1c0  LICENSES/BSD-Source-Code.txt
-sha256  84c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591cf060e6380a8f  LICENSES/BSL-1.0.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
-sha256  7658542977bfdced9e1059a6c934ce4281de76d103b831007b825917dc62511a  LICENSES/IJG.txt
-sha256  f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9  LICENSES/ISC.txt
-sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-or-later.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  LICENSES/MPL-2.0.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
-sha256  bfb1112d49db5b1daecdfef24bd7e2f3ea0bafb33aa67aa0ab51e2bf8407c03d  LICENSES/Zlib.txt
 sha256  85da7c29c2d2f2e6b3116b1219584cb513474cab797b3312a779be4c2181e51e  src/3rdparty/eigen/COPYING.BSD
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  src/3rdparty/eigen/COPYING.MPL2
 sha256  8b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8dad97e4d1438bc3c4  src/3rdparty/eigen/COPYRIGHTS
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index c2a9d250cf..d0d08cacc7 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -13,21 +13,13 @@ QT6MULTIMEDIA_CMAKE_BACKEND = ninja
 QT6MULTIMEDIA_LICENSE = GPL-3.0, LGPL-3.0
 
 QT6MULTIMEDIA_LICENSE_FILES = \
-	LICENSES/BSD-2-Clause.txt \
 	LICENSES/BSD-3-Clause.txt \
-	LICENSES/BSD-Source-Code.txt \
-	LICENSES/BSL-1.0.txt \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
-	LICENSES/IJG.txt \
-	LICENSES/ISC.txt \
-	LICENSES/LGPL-2.1-or-later.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/MIT.txt \
 	LICENSES/MPL-2.0.txt \
 	LICENSES/Qt-GPL-exception-1.0.txt \
-	LICENSES/Zlib.txt \
 	src/3rdparty/eigen/COPYING.BSD \
 	src/3rdparty/eigen/COPYING.MPL2 \
 	src/3rdparty/eigen/COPYRIGHTS \
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 627450af60..d722bdee8a 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0283f634707bf5c88ed30fec604bf7ea3bc22620cd060517812f9fb6304f254b  qt6opcua-6.8.1-git4.tar.gz
+sha256  e54129c55edbb9a7c7b0abd8a8dd361812482637a02f9132434414220651a28d  qt6opcua-6.9.0-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
index 960cda69ad..096606afdd 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.hash
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquick3d-everywhere-src-6.8.1.tar.xz.sha256
-sha256  3f3d345e6c95fcd40ab37e6a37cd31811e5d239dea8e142e632d4ea41bf20ce7  qtquick3d-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtquick3d-everywhere-src-6.9.0.tar.xz.sha256
+sha256  a295268fdca5aeaab6bb4bb1a0a4d2720b19679ab5145c5185dac7ac3399e488  qtquick3d-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
@@ -10,5 +10,3 @@ sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3r
 sha256  063805e3b8e24ceab4c5dea358b03245ee41c31be87cf65c61d836636cb494bb  src/3rdparty/meshoptimizer/LICENSE.md
 sha256  2af9d14c7cd67f13c3e7e91dcfe15ec5c8af42923635441e0f5a75bcadadeb33  src/3rdparty/tinyexr/LICENSE
 sha256  2c16d5b1c2808277fe975b4f70f0fd9afc9b3bcf04e6c676665a82cb2d5579e3  src/3rdparty/xatlas/LICENSE
-sha256  966313e8129db5d0b3b081d1a50ae107da9a3da2d8faa05899e3042a33192525  src/helpers/GODOT_LICENSE.txt
-sha256  966313e8129db5d0b3b081d1a50ae107da9a3da2d8faa05899e3042a33192525  src/runtimerender/GODOT_LICENSE.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.mk b/package/qt6/qt6quick3d/qt6quick3d.mk
index 246bd2d82d..cd31388529 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.mk
+++ b/package/qt6/qt6quick3d/qt6quick3d.mk
@@ -20,9 +20,7 @@ QT6QUICK3D_LICENSE_FILES = \
 	src/3rdparty/embree/LICENSE.txt \
 	src/3rdparty/meshoptimizer/LICENSE.md \
 	src/3rdparty/tinyexr/LICENSE \
-	src/3rdparty/xatlas/LICENSE \
-	src/helpers/GODOT_LICENSE.txt \
-	src/runtimerender/GODOT_LICENSE.txt
+	src/3rdparty/xatlas/LICENSE
 
 QT6QUICK3D_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
index b042b4e2f8..149c936bf5 100644
--- a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquicktimeline-everywhere-src-6.8.1.tar.xz.sha256
-sha256  fdbc198e27fd7bce0801fb3cfa336e81932607e6a36c97ae8394880eedfe12a3  qtquicktimeline-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtquicktimeline-everywhere-src-6.9.0.tar.xz.sha256
+sha256  339f2cdd0b731615a215534799ed865e222fc797f431ad4a6677a6d5c862e648  qtquicktimeline-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index f239f18dd3..b1552da1c3 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtscxml-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2f406f44cfacd6eddb90468012a5d1d99d7a64ec05a21a2a7eda9dfc12614fd6  qtscxml-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtscxml-everywhere-src-6.9.0.tar.xz.sha256
+sha256  a73bb5241c124d776d79ea24749d707b71365e395d8af3382a1f1c43a69a6892  qtscxml-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 9777633b85..4f4b341658 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialbus-everywhere-src-6.8.1.tar.xz.sha256
-sha256  40788d92ec5c3ae297818e9f9eea9d21e398a54fa3fd8ddd530d324548ed15da  qtserialbus-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtserialbus-everywhere-src-6.9.0.tar.xz.sha256
+sha256  0d46093411f2256e2c27d7a2d56fccb51b52753f14eb92a1a93e0da04585593f  qtserialbus-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index d30c297d0f..abcc99b2f8 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialport-everywhere-src-6.8.1.tar.xz.sha256
-sha256  098e72a5c06d7db003e3eea1b0ed72d7308e3ea9cb9e89b538816dc96c938395  qtserialport-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtserialport-everywhere-src-6.9.0.tar.xz.sha256
+sha256  fbe762f5ca6b3e58fbbf51604928b50cf14628b670eaeab57751e07a4086b954  qtserialport-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 015ec5b96f..82df6a2177 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtshadertools-everywhere-src-6.8.1.tar.xz.sha256
-sha256  55b70cd632473a8043c74ba89310f7ba9c5041d253bc60e7ae1fa789169c4846  qtshadertools-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtshadertools-everywhere-src-6.9.0.tar.xz.sha256
+sha256  916c40281ac3dee23b163f6ca73fb5bdeee344838b9a922b6f36269642d6f4bb  qtshadertools-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index cd7a148fb7..f6bebecc13 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtsvg-everywhere-src-6.8.1.tar.xz.sha256
-sha256  3d0de73596e36b2daa7c48d77c4426bb091752856912fba720215f756c560dd0  qtsvg-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtsvg-everywhere-src-6.9.0.tar.xz.sha256
+sha256  ec359d930c95935ea48af58b100c2f5d0d275968ec8ca1e0e76629b7159215fc  qtsvg-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
@@ -7,4 +7,3 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 08570c7f9c..c8d5e8fd17 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -23,8 +23,7 @@ QT6SVG_LICENSE_FILES = \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
-	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/LGPL-3.0-only.txt
 
 QT6SVG_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index ede1608ec4..e18512faf9 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qttools-everywhere-src-6.8.1.tar.xz.sha256
-sha256  9d43d409be08b8681a0155a9c65114b69c9a3fc11aef6487bb7fdc5b283c432d  qttools-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qttools-everywhere-src-6.9.0.tar.xz.sha256
+sha256  fa645589cc3f939022401a926825972a44277dead8ec8607d9f2662e6529c9a4  qttools-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index 60b9ab08de..420e35613a 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz.sha256
-sha256  1022a3bc4093ec732e85b659158c8a70a31eecbd0dfef4e4f6c67f474f89a264  qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtvirtualkeyboard-everywhere-src-6.9.0.tar.xz.sha256
+sha256  b85489ffbdd50cc42ea6a74f266215782045668a99cafc73007f6b4b28d69127  qtvirtualkeyboard-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
@@ -8,5 +8,5 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENS
 sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
 sha256  05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1  src/plugins/openwnn/3rdparty/openwnn/NOTICE
-sha256  b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986  src/plugins/pinyin/3rdparty/pinyin/NOTICE
+sha256  554aa1a1047c04056ad6206ce942a43f11c2b2daa0c01cb029f2b165072342d8  src/plugins/pinyin/3rdparty/pinyin/NOTICE
 sha256  9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6  src/plugins/tcime/3rdparty/tcime/COPYING
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index a378097eb4..e1dc51bc6d 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwayland-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2226fbde4e2ddd12f8bf4b239c8f38fd706a54e789e63467dfddc77129eca203  qtwayland-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtwayland-everywhere-src-6.9.0.tar.xz.sha256
+sha256  503416fcb04db503bd130e6a49c45e3e546f091e83406f774a0c703130c91805  qtwayland-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 789f51a71d..364fba2996 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwebsockets-everywhere-src-6.8.1.tar.xz.sha256
-sha256  e4cfdae8760bedd1c2b00429a6c9bf88cc11c5018dcb46bde277fb1edf341e3f  qtwebsockets-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtwebsockets-everywhere-src-6.9.0.tar.xz.sha256
+sha256  6b3add7cacf3a4e0b448d5e69d9dac42795fef63309038af1dc5a454ce514940  qtwebsockets-everywhere-src-6.9.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
