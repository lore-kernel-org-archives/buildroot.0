Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793BCC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 21:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6488410E9;
	Tue, 18 Jun 2024 21:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04EbRPFcd5Bd; Tue, 18 Jun 2024 21:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4E0E412F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4E0E412F9;
	Tue, 18 Jun 2024 21:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39C391BF2EA
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32D76410E9
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqlUSgydRDXQ for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 21:27:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77B5A410C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B5A410C5
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77B5A410C5
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 21:27:09 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e72224c395so59934551fa.3
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 14:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746027; x=1719350827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3A4NmuM7mY13RY/iB8WV1vQZCqwd3thMBosyUiiGmd8=;
 b=T085S3oYkAhwSUZajlF7LlPESMAyJOQUr7XnQPReWWxOmrXFWqgoAv51PO6s+TnccZ
 UqmvVdCedaLnV+mldHJ7V/uGrmR6tJAbCyE9+P8pVZzZAgtiRcEct2dc6oAL0y0KXoNA
 pHB0DLslSNh76Yd4VKWdSLdWImiPOM8o2owdvIpKV93US1L72G6IJh9TXySJkVsXrjhm
 LY4bm39W3c+ShUuucIlYOCUoT1lM4FP6MnjSdL0NiW/8ENVXdmdjQtiyMycvTf7QMWDp
 wVUY2Wsv66DN8fZYobOR+RV7r4E37KH3zCIs86VkimNTIXtC1K+u/nh3wEkHDuRQImOn
 fb0w==
X-Gm-Message-State: AOJu0Yy7YCr6qVTHhzBeRrXvgKuDbGn7BQWv0Hc+D28NFO538K82MWu0
 ztOw/YgXMJ6fESlROBSi7DyENELYlTuQoq9HgGtqvE/NamzXdtozsG38ng==
X-Google-Smtp-Source: AGHT+IGRR7kaJYEMsln3ASqsTl0FSb0o/aEFQ0dOSyBbXa2REIFYp4EWHRJ/+IXvB3Z+TEVDfqsbGA==
X-Received: by 2002:a2e:a0d6:0:b0:2ec:28ae:288 with SMTP id
 38308e7fff4ca-2ec3cfea4f5mr5848681fa.39.1718746025733; 
 Tue, 18 Jun 2024 14:27:05 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7838fsm17240521fa.100.2024.06.18.14.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:27:05 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 23:26:24 +0200
Message-ID: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
References: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746027; x=1719350827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3A4NmuM7mY13RY/iB8WV1vQZCqwd3thMBosyUiiGmd8=;
 b=mi+zTrEdFY6QJ/G+Lq9TpbnVkimbERH2/PxFOt/NN/fGTOENvGuRiukpdsr+K2lbJp
 4CQ4MhhMOCSBvPTM2fAOOIhjdftgQixyFVfRukTr4y4YLYwdfoz+yu29DASQin40umyp
 LnTgY8OiKRB1to1tUki/SRjBm8jYV5Husdn6ZbgQo+aQQlaxGlym9zUnbuxg8iJ8t+9K
 T6xYqDUCDMBtQCx/gb5va0eQbaBXxWXiCCdypBNRDwPR+D+rFQDOE1wwf13PEZCbd//H
 BncxV6Xygm4JjxPLT0oOf1lRlyM3cgCfynotGlNv8HHqQjtvm3gs4aAFcRVllXSXe0Fn
 jjYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mi+zTrEd
Subject: [Buildroot] [PATCH v8 01/14] package/qt6: bump version to 6.7.1
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

For details see [1], [2], [3], [4], [5], [6], [7], [8], [9] and [10].

[1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.0/release-note.md
[2] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.1/release-note.md
[3] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.2/release-note.md
[4] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.3/release-note.md

[5] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.0/release-note.md
[6] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.1/release-note.md
[7] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.2/release-note.md
[8] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.3/release-note.md

[9] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.0/release-note.md
[10] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.1/release-note.md

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6.mk                             | 4 ++--
 package/qt6/qt6base/qt6base.hash               | 4 ++--
 package/qt6/qt6base/qt6base.mk                 | 1 -
 package/qt6/qt6core5compat/qt6core5compat.hash | 4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash     | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash   | 4 ++--
 package/qt6/qt6svg/qt6svg.hash                 | 4 ++--
 7 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 1edb252c96..ee426884f9 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QT6_VERSION_MAJOR = 6.4
-QT6_VERSION = $(QT6_VERSION_MAJOR).3
+QT6_VERSION_MAJOR = 6.7
+QT6_VERSION = $(QT6_VERSION_MAJOR).1
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index cb111bd405..488f4b0136 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtbase-everywhere-src-6.4.3.tar.xz.sha256
-sha256  5087c9e5b0165e7bc3c1a4ab176b35d0cd8f52636aea903fa377bdba00891a60  qtbase-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtbase-everywhere-src-6.7.1.tar.xz.sha256
+sha256  b7338da1bdccb4d861e714efffaa83f174dfe37e194916bfd7ec82279a6ace19  qtbase-everywhere-src-6.7.1.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 211808d2af..13999bbd44 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -9,7 +9,6 @@ QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
 QT6BASE_CPE_ID_VENDOR = qt
 QT6BASE_CPE_ID_PRODUCT = qt
-
 QT6BASE_CMAKE_BACKEND = ninja
 
 QT6BASE_LICENSE = \
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index 0735df3af2..c50093c0a9 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
-sha256  d4b249abb823d575eee9045c24d924ba8d1276e6be7735b287689991d998aa7a  qt5compat-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qt5compat-everywhere-src-6.7.1.tar.xz.sha256
+sha256  41c4bbe419158fc170ee3ef3ecffead506e70802109deec036d86e4244086009  qt5compat-everywhere-src-6.7.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 98c8931962..d9cf2260c1 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialbus-everywhere-src-6.4.3.tar.xz.sha256
-sha256  b6446a7516d1f04e561c00f9c50ce4d39dad72150f067722ba759f00b4b34366  qtserialbus-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtserialbus-everywhere-src-6.7.1.tar.xz.sha256
+sha256  513905d545b81b040fc9d7a996aa2d6fa310048c36b24919a973f2a6a555628f  qtserialbus-everywhere-src-6.7.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 9341978d86..527bc14fe4 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
-sha256  5f97ad9067efa39a8a2a39fbbc1e03d2191f305733d9c2f3060f8017ecfc95de  qtserialport-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtserialport-everywhere-src-6.7.1.tar.xz.sha256
+sha256  e543a3788bfd522f2e4a111ba568214f1f5be6e55f08318c2dcd376124ea5886  qtserialport-everywhere-src-6.7.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index bb239cb012..80924035f0 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtsvg-everywhere-src-6.4.3.tar.xz.sha256
-sha256  88315f886cf81898705e487cedba6e6160724359d23c518c92c333c098879a4a  qtsvg-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtsvg-everywhere-src-6.7.1.tar.xz.sha256
+sha256  3ed5b80f7228c41dd463b7a57284ed273d224d1c323c0dd78c5209635807cbce  qtsvg-everywhere-src-6.7.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
