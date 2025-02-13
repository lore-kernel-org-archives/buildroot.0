Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04216C0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 14:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB0E483A51;
	Thu, 13 Feb 2025 14:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSFg9BVunKtt; Thu, 13 Feb 2025 14:58:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D81C83A5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D81C83A5C;
	Thu, 13 Feb 2025 14:58:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE2E2C2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BAF283A5C
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-nPtHQ4hTLM for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 14:58:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 804DE83A47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804DE83A47
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 804DE83A47
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:03 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-308f53aef4fso9435011fa.0
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 06:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739458681; x=1740063481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hOTBnsR4ta6an4QSl/rIXU/YqGtPeycVL6GovdNCn4=;
 b=S/QskmiYA+xqvXfMudwPfWMmeYd1ADNVxpDKALvIp+IjThz2Iu/JLoaNGuls5ntt8C
 P+F+LmCbsLYnqLfSKnjhWMwnNtY6W+wbtiXV3OJrKpB9ZqSop5Rkn7cjF5Ic3eZzOuia
 mVEOUa5djhNzpkoYVABbjB4wVSyISEh3Imbuy3X5zUV9NZVGCg0or3yg0zORxyLxMtvn
 yhwrvIW0se9UBBK1rkS7HW2OGfKEHsY9omnpcogQPdfD0jADluyHnnMTwnFMJGxsNZCk
 4Ws+GE7PmUYw2luiJRtVTr1p86y+2AKfEA3iczZh/tTlhZOY2vHwLFRddYT0PDzJ+Xhh
 //mA==
X-Gm-Message-State: AOJu0Ywa8/4ZN9LZ7EPnzNbN3gK8XIHo2SepQrqktOPNqAEDwNHN3PjZ
 8S+pqIptswwIXGGKSghmpk/MWhlTnpw9A9eMX8pSDWLb0j5nQaM91OAdf5wp
X-Gm-Gg: ASbGncutJ0pkxf4DjGAiyBrcDNbAqwfVUXs0887iMU1LOvU0E4ezrrts0PirvaG2cxO
 vwmeWZhsQhMCbPGe2ibzW1NzEKplXw5jC1/ip4HcG4f0yk98RI4yPMSCGrciB/bgx8kM+SkTv1G
 MqK3rXqduvhB1dyoMnH1tYO/S7Ibykr+RwQBGes16J3BWbDBDKEYNO49vjbphAoudjEOphycYuD
 Sjya2rsyjrPBfBM2yjiVEhGVUohOGej4rmqLI1uk7XeymNEg+nmPdArv/gWg0fphmPOZdSfzydy
 ZoYxdoxJ5dCdRGAEEFhP00T3pSW4sLVS5JwULi4fq/ETiA==
X-Google-Smtp-Source: AGHT+IE2iO2fLL/wzzNfB4Kn14rAru1Z/nCPREAjmnCE/hNf/QhQDmiVnaHsgeCBVRlnBaM7tROlMg==
X-Received: by 2002:a2e:be22:0:b0:302:3003:97e with SMTP id
 38308e7fff4ca-309036dbf25mr29561451fa.30.1739458680858; 
 Thu, 13 Feb 2025 06:58:00 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029be88sm2094681fa.96.2025.02.13.06.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 06:57:59 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Andreas Naumann <ANaumann@ultratronik.de>, Baxiche Su <baxiche@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Thu, 13 Feb 2025 15:57:41 +0100
Message-ID: <20250213145747.639358-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213145747.639358-1-roykollensvendsen@gmail.com>
References: <20250213145747.639358-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739458681; x=1740063481; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hOTBnsR4ta6an4QSl/rIXU/YqGtPeycVL6GovdNCn4=;
 b=dBXqdQ/qrrqkX9hklhxC9XHnBu/Ke+0CocQOjjcn6TkVL/BmXJUOV9s3YedTjetEhH
 HJwwl+ySuUPQu4a6mTk9PyJrqCxTVzMxoNAc0F5erSF1/KEsUFg5HvmwCW0ptbRx3K0a
 Ng8cOf553jTNwr4swhb3ngemMRH3DtmKx4s9VNpmNehBrs73fm7witTodU5SllCty2f4
 zBLYLGfn2IvEsd+6Wy+4/uRB+PtLXrRMPZQbeP5hYQ6muZTitpH7+LTglILXCZRgFxo6
 TFRBtnnmKQQBQ5DPaqGok7Gr4vbYEnXxhS00I60NGFC3zJ50CsNRM8k9kROM/Gxx4V+7
 RXRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dBXqdQ/q
Subject: [Buildroot] [PATCH 1/4] package/qt6: bump version to 6.8.2
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

For details see:
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.2/release-note.md

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6.mk                                     | 2 +-
 package/qt6/qt6base/qt6base.hash                       | 4 ++--
 package/qt6/qt6charts/qt6charts.hash                   | 4 ++--
 package/qt6/qt6core5compat/qt6core5compat.hash         | 4 ++--
 package/qt6/qt6declarative/qt6declarative.hash         | 4 ++--
 package/qt6/qt6graphs/qt6graphs.hash                   | 4 ++--
 package/qt6/qt6languageserver/qt6languageserver.hash   | 4 ++--
 package/qt6/qt6mqtt/qt6mqtt.hash                       | 2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash           | 4 ++--
 package/qt6/qt6opcua/qt6opcua.hash                     | 2 +-
 package/qt6/qt6quick3d/qt6quick3d.hash                 | 4 ++--
 package/qt6/qt6quicktimeline/qt6quicktimeline.hash     | 4 ++--
 package/qt6/qt6scxml/qt6scxml.hash                     | 4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash             | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash           | 4 ++--
 package/qt6/qt6shadertools/qt6shadertools.hash         | 4 ++--
 package/qt6/qt6svg/qt6svg.hash                         | 4 ++--
 package/qt6/qt6tools/qt6tools.hash                     | 4 ++--
 package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash | 4 ++--
 package/qt6/qt6wayland/qt6wayland.hash                 | 4 ++--
 package/qt6/qt6websockets/qt6websockets.hash           | 4 ++--
 21 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 33cbf7551f..67bc0e45e4 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.8
-QT6_VERSION = $(QT6_VERSION_MAJOR).1
+QT6_VERSION = $(QT6_VERSION_MAJOR).2
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 94269047c5..ba535f94c2 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtbase-everywhere-src-6.8.1.tar.xz.sha256
-sha256  40b14562ef3bd779bc0e0418ea2ae08fa28235f8ea6e8c0cb3bce1d6ad58dcaf  qtbase-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtbase-everywhere-src-6.8.2.tar.xz.sha256
+sha256  012043ce6d411e6e8a91fdc4e05e6bedcfa10fcb1347d3c33908f7fdd10dfe05  qtbase-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
index 215d18c576..148e30eb0e 100644
--- a/package/qt6/qt6charts/qt6charts.hash
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtcharts-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2edea3f16e248ef508d99332798645b7f5ab6edbbf2e3d7d78fb674156f07d29  qtcharts-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtcharts-everywhere-src-6.8.2.tar.xz.sha256
+sha256  ec7c84da1a5d7b2f8cea610df6f993fa3c48990dc9f6bec995c69c5bfb34c55f  qtcharts-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index ba13da8d4e..9a9a21f774 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qt5compat-everywhere-src-6.8.1.tar.xz.sha256
-sha256  05c8c088b4cd8331fa8a9c8b7ff7c42a088cb112e673eae5708048d0131264fc  qt5compat-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qt5compat-everywhere-src-6.8.2.tar.xz.sha256
+sha256  b53154bc95ec08e2ddc266bef250fbd684b4eb2df96bc8c27d26b1e953495316  qt5compat-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 81b8ca929b..353ebee2d2 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtdeclarative-everywhere-src-6.8.1.tar.xz.sha256
-sha256  95d15d5c1b6adcedb1df6485219ad13b8dc1bb5168b5151f2f1f7246a4c039fc  qtdeclarative-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtdeclarative-everywhere-src-6.8.2.tar.xz.sha256
+sha256  144d876adc8bb55909735143e678d1e24eadcd0a380a0186792d88b731346d56  qtdeclarative-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
index 59d35d9e66..0575eaf628 100644
--- a/package/qt6/qt6graphs/qt6graphs.hash
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgraphs-everywhere-src-6.8.1.tar.xz.sha256
-sha256  1e46e3de69936835652ab40ef8caf5824ea71e26871274561fb65ec142d54a80  qtgraphs-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtgraphs-everywhere-src-6.8.2.tar.xz.sha256
+sha256  05c7a4a3482f6ffd7e9005964bb5ab634062a6d023ccd96f5447db6eae3c46d4  qtgraphs-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index a330ecb323..cdfcc99395 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtlanguageserver-everywhere-src-6.8.1.tar.xz.sha256
-sha256  865e9436c1432a53e38a30625b6cee60bf72553ff508047115513a233c8e6d7e  qtlanguageserver-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtlanguageserver-everywhere-src-6.8.2.tar.xz.sha256
+sha256  9eeb74ac15334c08777548c01e4ede80a4e2d36f1ebcb322423f24f14c2785fb  qtlanguageserver-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index f13fbaab9c..ad2fcbfaa9 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  757c96a645b81e858c19b5407d54b3a40ee288d04ffadc9a96dd52e50c6d8d6b  qt6mqtt-6.8.1-git4.tar.gz
+sha256  bca5d18defb259ac049cbfd261c54ad778d6eac6aa372d9eb3141ec1316a1dfe  qt6mqtt-6.8.2-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index cddafb56a8..61be3ee44c 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtmultimedia-everywhere-src-6.8.1.tar.xz.sha256
-sha256  75fa87134f9afab7f0a62c55a4744799ac79519560d19c8e1d4c32bdd173f953  qtmultimedia-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtmultimedia-everywhere-src-6.8.2.tar.xz.sha256
+sha256  34f561fdc07b158bcc4ad040b596fc6086c48908060e854b473b557e4feb1569  qtmultimedia-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files
 sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df  LICENSES/BSD-2-Clause.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 627450af60..843877e148 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0283f634707bf5c88ed30fec604bf7ea3bc22620cd060517812f9fb6304f254b  qt6opcua-6.8.1-git4.tar.gz
+sha256  c20c55b9f80cc822925aa786a1bde4cc4963700ec13cdc8a37a5c25dbb96389a  qt6opcua-6.8.2-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
index 960cda69ad..57017dcef6 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.hash
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquick3d-everywhere-src-6.8.1.tar.xz.sha256
-sha256  3f3d345e6c95fcd40ab37e6a37cd31811e5d239dea8e142e632d4ea41bf20ce7  qtquick3d-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtquick3d-everywhere-src-6.8.2.tar.xz.sha256
+sha256  084cebccb8c5b1c6bafb7756ab89b08ced23c20cd2e996ed54909a154a9f0b6d  qtquick3d-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
index b042b4e2f8..eef6a91f62 100644
--- a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquicktimeline-everywhere-src-6.8.1.tar.xz.sha256
-sha256  fdbc198e27fd7bce0801fb3cfa336e81932607e6a36c97ae8394880eedfe12a3  qtquicktimeline-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtquicktimeline-everywhere-src-6.8.2.tar.xz.sha256
+sha256  c33dbceed9fabb3d7f6731a68aee602bad5a04bb6f0a473792e61858c0bc1aaa  qtquicktimeline-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index f239f18dd3..ddac88a575 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtscxml-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2f406f44cfacd6eddb90468012a5d1d99d7a64ec05a21a2a7eda9dfc12614fd6  qtscxml-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtscxml-everywhere-src-6.8.2.tar.xz.sha256
+sha256  683c4a11a24001e901cc84853723046a1ba27004bcc06680a72eaac6cf8ea193  qtscxml-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 9777633b85..1b065bc97c 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialbus-everywhere-src-6.8.1.tar.xz.sha256
-sha256  40788d92ec5c3ae297818e9f9eea9d21e398a54fa3fd8ddd530d324548ed15da  qtserialbus-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtserialbus-everywhere-src-6.8.2.tar.xz.sha256
+sha256  1919d6bad2d935587fdb629c9737ced2ffe3c104c6b54bedb350ea9593b9a112  qtserialbus-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index d30c297d0f..b890294b5b 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialport-everywhere-src-6.8.1.tar.xz.sha256
-sha256  098e72a5c06d7db003e3eea1b0ed72d7308e3ea9cb9e89b538816dc96c938395  qtserialport-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtserialport-everywhere-src-6.8.2.tar.xz.sha256
+sha256  ed17e02361e989f149f58d021ab8cd66f21db4cdfb8cde0a462017e6ac1e3be7  qtserialport-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 015ec5b96f..ca7791e36c 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtshadertools-everywhere-src-6.8.1.tar.xz.sha256
-sha256  55b70cd632473a8043c74ba89310f7ba9c5041d253bc60e7ae1fa789169c4846  qtshadertools-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtshadertools-everywhere-src-6.8.2.tar.xz.sha256
+sha256  d1d5f90e8885fc70d63ac55a4ce4d9a2688562033a000bc4aff9320f5f551871  qtshadertools-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index cd7a148fb7..f7b9edf1f8 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtsvg-everywhere-src-6.8.1.tar.xz.sha256
-sha256  3d0de73596e36b2daa7c48d77c4426bb091752856912fba720215f756c560dd0  qtsvg-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtsvg-everywhere-src-6.8.2.tar.xz.sha256
+sha256  aa2579f21ca66d19cbcf31d87e9067e07932635d36869c8239d4decd0a9dc1fa  qtsvg-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index ede1608ec4..a1dae628ac 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qttools-everywhere-src-6.8.1.tar.xz.sha256
-sha256  9d43d409be08b8681a0155a9c65114b69c9a3fc11aef6487bb7fdc5b283c432d  qttools-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qttools-everywhere-src-6.8.2.tar.xz.sha256
+sha256  326381b7d43f07913612f291abc298ae79bd95382e2233abce982cff2b53d2c0  qttools-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index 60b9ab08de..bb09de842b 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz.sha256
-sha256  1022a3bc4093ec732e85b659158c8a70a31eecbd0dfef4e4f6c67f474f89a264  qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtvirtualkeyboard-everywhere-src-6.8.2.tar.xz.sha256
+sha256  2ddce5156978b5da04c97b0de1abb9d5172a06796b56bca53cbb5e976277cb27  qtvirtualkeyboard-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index a378097eb4..2d75282bd4 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwayland-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2226fbde4e2ddd12f8bf4b239c8f38fd706a54e789e63467dfddc77129eca203  qtwayland-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtwayland-everywhere-src-6.8.2.tar.xz.sha256
+sha256  5e46157908295f2bf924462d8c0855b0508ba338ced9e810891fefa295dc9647  qtwayland-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 789f51a71d..7a448e921f 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwebsockets-everywhere-src-6.8.1.tar.xz.sha256
-sha256  e4cfdae8760bedd1c2b00429a6c9bf88cc11c5018dcb46bde277fb1edf341e3f  qtwebsockets-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.2/submodules/qtwebsockets-everywhere-src-6.8.2.tar.xz.sha256
+sha256  919df562ba3446c8393992d112085ad2d96d23aaf802b1cd7a30bf3ba2fe8cbe  qtwebsockets-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
