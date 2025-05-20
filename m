Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6837C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B25460F71;
	Tue, 20 May 2025 11:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4VmM_Si3SqG; Tue, 20 May 2025 11:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 810F860FBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 810F860FBE;
	Tue, 20 May 2025 11:33:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2C6A193
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C49E840A6A
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WktdoLNcctc3 for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B309440A62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B309440A62
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B309440A62
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-32805a565e6so53468471fa.1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740829; x=1748345629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UYOiowDtPW8eBrd6wrgIvLvh4J4oI54jpVl6Nw+WYqU=;
 b=oL4WhLRqUVxbiLhDE/0JowVVyGbRIxxkIDkLJajR1382TMDIJRitXE/5deFwFnEyc7
 omCzjrt1O6KNJ6dTsdjQ+ZOnEZVejbiaVkutvbtXsORxB2btPgEhfKAw4sCS9nNR9lhn
 dGXrWK3Si8j2M0p8ke8o04M7CE8+tQ8JeP4T9oHaWbNXdUQA2pkVhajllrCPhETevy1A
 yvp4uBe9FrlwiXEd1BSkg0AU0k27X9j73VUIj4GGVLhSZ89wTnXdE4tGVF37UiyVeklq
 XeSBZW7VYV5q3h0E+eZNWWrnnhUCjMsyMi/W5B7l/U0h3ZuNXgEsoOp4LPnGO8ptn3Ss
 EvPw==
X-Gm-Message-State: AOJu0YxRlZ6W8w16XojK4UTYuQ+8c0MQrMGTMxsaFEbh9eJSogBugvrp
 U0CN7m05+W1vq31nVF/0cHtjtvlP9ify52/ftScZG5oWRbUCFll5RbGiZre+iA==
X-Gm-Gg: ASbGncvlzmECElSvJzYWz+KcsgeAOdtbx01t5UIeACN520UtjIbh7rLf1nVBAGbRwJs
 aokRxZ5guu09H9EbeikjFCCSQx54L5Dx9R8aFnyKFYyDuAfycTGzVxaa6dI7Ahv/kHBfT57UhdW
 4Zj/+6BNuLAdYW55EjnsnSllOic/PFhww/1wjHA+2cnTtJ+TFpRnETEARqH8OdXPAi4Gf0EPG/E
 pW6kaz2BBf/0AmBr4C5FT8VMkadBIJJFi1AnVF+nBFlX/+WcwaV3EPjCDIyu1FgANC7adk8FhTw
 PUMwbk3TEpICfzGERdZNynFSdVu+U06iuDuAL8y3Bpl3TpEjaOYeshIM017LReIcM0ebLBIFg6i
 xaTHYt7zczuQii0A8
X-Google-Smtp-Source: AGHT+IHl2RfyKosMlEVi8e594AUQ6mZcQEBjnrgu02YHqOjlJ5VbTFIU5x9Mdc5o+yYnj36Ondh9TQ==
X-Received: by 2002:a2e:a9a3:0:b0:329:1302:a521 with SMTP id
 38308e7fff4ca-3291302a7a6mr31419811fa.2.1747740829364; 
 Tue, 20 May 2025 04:33:49 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8bdfsm23324841fa.76.2025.05.20.04.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:33:48 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 13:33:22 +0200
Message-ID: <20250520113339.2525537-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747740829; x=1748345629; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UYOiowDtPW8eBrd6wrgIvLvh4J4oI54jpVl6Nw+WYqU=;
 b=BiHfqbD7krevItuL5VQxaCrdND7HHv6IDjH6mNfUFvKG5kJ8ddtkfpxWZCxHXfBaCK
 EfKuJQOHJBbe3CWBtSfJaLTSMLgQwlzcLXJ+nnMcCxcvab2gePd/6XNCIs2vr3h/t2RH
 xFQVTifHHXZLXYpRQiRhSdnzHKiKtO7ch74w35gbFd99vHlsd2kXtT86zfpTstKaJJ3C
 X4SBsfljDrnxMLueWcOm1uwQkdcHdeVCJOiHusF+rbbJuAGL2LhH1j9SwxHXhJv2A3bh
 /EdXQhwEPnjaEMc5+14OEOdXwwn7yxm0bX5/E2frxfxohZI7wt4MdBSIETft0CadVqHJ
 SqPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BiHfqbD7
Subject: [Buildroot] [PATCH v3 03/12] package/qt6/qt6positioning: new package
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
 Jesse Van Gavere <jesseevg@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Needed for GPS support in Stellarium.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6positioning/Config.in          |  8 ++++
 .../qt6/qt6positioning/qt6positioning.hash    | 16 +++++++
 package/qt6/qt6positioning/qt6positioning.mk  | 47 +++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/qt6/qt6positioning/Config.in
 create mode 100644 package/qt6/qt6positioning/qt6positioning.hash
 create mode 100644 package/qt6/qt6positioning/qt6positioning.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 3597417ef7..6b7152d902 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -53,6 +53,7 @@ source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6multimedia/Config.in"
 source "package/qt6/qt6opcua/Config.in"
+source "package/qt6/qt6positioning/Config.in"
 source "package/qt6/qt6quick3d/Config.in"
 source "package/qt6/qt6quicktimeline/Config.in"
 source "package/qt6/qt6scxml/Config.in"
diff --git a/package/qt6/qt6positioning/Config.in b/package/qt6/qt6positioning/Config.in
new file mode 100644
index 0000000000..a083dcffb3
--- /dev/null
+++ b/package/qt6/qt6positioning/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_QT6POSITIONING
+	bool "qt6positioning"
+	select BR2_PACKAGE_QT6BASE_GUI
+	help
+	  This package provides Qt6 Positioning:
+
+	  https://doc.qt.io/qt-6/qtpositioning-index.html
+	  https://code.qt.io/cgit/qt/qtpositioning.git
diff --git a/package/qt6/qt6positioning/qt6positioning.hash b/package/qt6/qt6positioning/qt6positioning.hash
new file mode 100644
index 0000000000..1e6b65829e
--- /dev/null
+++ b/package/qt6/qt6positioning/qt6positioning.hash
@@ -0,0 +1,16 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtpositioning-everywhere-src-6.9.0.tar.xz.sha256
+sha256  c00b4c01d92bf99c5562910aab59f80146b976cdb1dcb7bd2f27833624605ed1  qtpositioning-everywhere-src-6.9.0.tar.xz
+
+# Hashes for license files
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSES/Apache-2.0.txt
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5  LICENSES/BSL-1.0.txt
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
+sha256  ed0df7c746c39b27f297cc1bf5e8cdfa5b53c7056572092a77db02278435a689  LICENSES/OFL-1.1.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6positioning/qt6positioning.mk b/package/qt6/qt6positioning/qt6positioning.mk
new file mode 100644
index 0000000000..718abbd941
--- /dev/null
+++ b/package/qt6/qt6positioning/qt6positioning.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# qt6positioning
+#
+################################################################################
+
+QT6POSITIONING_VERSION = $(QT6_VERSION)
+QT6POSITIONING_SITE = $(QT6_SITE)
+QT6POSITIONING_SOURCE = qtpositioning-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6POSITIONING_VERSION).tar.xz
+QT6POSITIONING_INSTALL_STAGING = YES
+QT6POSITIONING_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6POSITIONING_CMAKE_BACKEND = ninja
+
+QT6POSITIONING_LICENSE = \
+	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
+	BSL-1.0, \
+	CC0-1.0, \
+	GFDL-1.3 no invariants (docs), \
+	GPL-3.0 with Qt-GPL-exception-1.0, \
+	OFL-1.1 (TitilliumWeb), \
+	BSD-3-Clause (examples + buildsystem)
+
+QT6POSITIONING_LICENSE_FILES = \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/BSL-1.0.txt \
+	LICENSES/CC0-1.0.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/LicenseRef-Qt-Commercial.txt \
+	LICENSES/MIT.txt \
+	LICENSES/OFL-1.1.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6POSITIONING_DEPENDENCIES = qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE)$(BR2_PACKAGE_QT6DECLARATIVE_QUICK),yy)
+QT6POSITIONING_DEPENDENCIES += qt6declarative
+endif
+
+ifeq ($(BR2_PACKAGE_QT6SERIALPORT),y)
+QT6POSITIONING_DEPENDENCIES += qt6serialport
+endif
+
+$(eval $(cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
