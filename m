Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E986EC25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72697414EB;
	Mon,  3 Jun 2024 11:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuZD_atgxVFh; Mon,  3 Jun 2024 11:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775B94148F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 775B94148F;
	Mon,  3 Jun 2024 11:52:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8002F1BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76F6381FA2
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WG1Ol9s-5GLY for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F198A808B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F198A808B0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F198A808B0
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52b8f5d811aso2325683e87.3
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 04:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717415547; x=1718020347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tLxJUGI++CS4/OOx1qfBRLJ+jvH76gRMb9XoBFUfJLc=;
 b=lf27fYOVITDnGvAy3YIuSPaR1zfC6PHYsBwOy76HBU4UG3XcxtCbSn5LrSn28vP4Uw
 2S4a+IemyB1d1nhhzCexlbOMp7ABjpFbjBgw6S8i0lCyANzYRNOQmaxwfdLQWEzjvSrP
 5F99cT+YFz5uOn1CX+aDRTT0tAkd1M2hF+QVJ209cbIwrgSHdGc4/U1FKptj9FbHJ3RR
 rq+C6OGqw2RNI/WustX5OLYkVZlnbWtSYmM/V4fOzd4hWmqL4XSRZBsnNLcAJc2C5jz7
 4Zv1yPJFLfoIjtMp0FwWCyo5/nEEDVhC26JnDnEkmRhkwZQu3y2ZTi0V00HqtXxnUZ88
 g3XA==
X-Gm-Message-State: AOJu0YzFtA+EoX47RqyKOILwiT2YgPBkt6LfwIz8Ltw019JzmtQzPh0W
 66NMGgwF3fkA2Aoetk6iyFpIu9GPF0QEBqpFyR0oTQYGKErJxKSintip+F79
X-Google-Smtp-Source: AGHT+IGbAwoHv2yepfkaUtO+ucDZUVnzKrBLYLlJAeC03QEBfQzct9Nmgxav5QpX6fmtEJqvUaXrQw==
X-Received: by 2002:a05:6512:46c:b0:523:8e07:5603 with SMTP id
 2adb3069b0e04-52b895a0a73mr5433856e87.41.1717415546419; 
 Mon, 03 Jun 2024 04:52:26 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b96035a33sm529058e87.294.2024.06.03.04.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 04:52:25 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 13:51:44 +0200
Message-ID: <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
References: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717415547; x=1718020347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tLxJUGI++CS4/OOx1qfBRLJ+jvH76gRMb9XoBFUfJLc=;
 b=cwGanO7Xo1XnmtRhceXgb1igfw2EKrxadgOE6S1w9BESw+iYm2kHO601ADzYaZvkZY
 an66C100LGXW1HprwazCWPrHrb45wq+yYfGZ1v7od5M3pSVoqcpFFCs9JI+pyKtBHBL2
 ocet/UnWewqMGW2dC+BzflalR5Y6ucJF+cjzuLRnfDTcLVvVETf15SwOruQIGRBPzfai
 UWJzFt91YWbb3clETdmyt+O+Ga7mCQ1Qs0NoJBp2Ry2eFevxhg1TJND16J4mcQPcRoRF
 qlCPGPx3iF3gLr5vatN8gJtxLcfK4x9eNmf55VntrekxbyxZU9Mg6QCwx8lKZ/o61DeV
 Wcvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cwGanO7X
Subject: [Buildroot] [PATCH v6 01/14] package/qt6: bump version to 6.7.1
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
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

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
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
index 6857725ef5..5bc5370834 100644
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
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
