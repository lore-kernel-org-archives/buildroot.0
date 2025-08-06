Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC79C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 11:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2971E845B2;
	Wed,  6 Aug 2025 11:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KwnJkOzSj7C; Wed,  6 Aug 2025 11:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9504D845D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9504D845D6;
	Wed,  6 Aug 2025 11:53:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C7E531
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E8B6608A9
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9H2qfa3LXju for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 11:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5391060B8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5391060B8F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5391060B8F
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so57849245e9.3
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 04:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754481200; x=1755086000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmWSYwXOcPmSXa8Lu26abcCknd4OLA+/OVCekEU4hHg=;
 b=XjkLZkftH4ytiqLUoQ4FrS+8nr4Fcxt6guJkLcCDjY8Vnya+5HPhhl+df09BVZkbwO
 piyWqpByM5BWXd4+StMV536cxpxsyXh5fdf1RPLOIxS2zEv6XTpU/vRFpYvB9AX49+if
 OS/a1tDg0zCtrh2/l80uVsBf1/8ND5RPGoORkWcZnwg6RB1Pa/oa1Pv6qMZ5eb5v/fQP
 tKxqdbD/hb6qMLQkSfLtOu+ewcDPYDChstND5jFuXes23fiuK31VYsPPgPcVOyxby3yn
 Jw0FWX82xB/0h5idSUgUNKnRgg/IfIjt7HVEVJcnvJL4ZalpE/8dnNqwSTlpQeLGTwF6
 205Q==
X-Gm-Message-State: AOJu0YygerTiDtp8a1v5iw0Fnh85EopZYrToHSZVRg12UHz2PkPVuk2A
 qjWvIoPjl2sBIvEgn/wKnt/nSS7zGynOZt7VRIrFXsQADGI9kgWG+qHSKC/fVWSmNW5Qlgef8pW
 O/4Vn
X-Gm-Gg: ASbGncuh7P4jYDHBx36426cOWtaWBV0jFlcewgMdBCEto+kVfK+T0b2YsZilfnfsjp0
 //grl84ws/rN4LlKMXmDV+FEI6g34QX4pZynrf7UP83Sw782JQU7HjgvlgdQzKc9eAkXOjlUdKp
 /Hbz/6+xr7Wj7qH11dM1Kli84ZpGvtbxe+el2nB/RG/DoNxs/4g/nKpFOxJibWuKrC2dZKoPskl
 2NWecN3s7FU2q7GaCCknsG4qK6N5uFZZn+OgwclQCGK7d9E4MiqjrcznpSP4DLIqShmSL1MZqno
 8sEofrZGHpBqQEqz88bmxNDZKW6LMSPqkIHt2KvRSYIGub6AHu6uGTHkJgRXlCDtpRDFH24clIC
 YFL+3q5IPjBjr3uWwz+miTPlM9TBtNLiNBIu4ubTUtci5MlPJq/0Abl+GKIU8OnlYgPkDOawVJA
 vm8VoZJVZoq7WGqBrx862W5eCkFZgm
X-Google-Smtp-Source: AGHT+IHo3X9B7EVOC3AXlFy0vRrNPgGe/tTpIodxomlkN2no0uFdgyDpLOMSHP4V9ZxTEAynsFwoEA==
X-Received: by 2002:a05:600c:a342:b0:459:e3a1:a0c4 with SMTP id
 5b1f17b1804b1-459e70f63cfmr25010995e9.30.1754481200076; 
 Wed, 06 Aug 2025 04:53:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:3f96:8759:f916:8982])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459c58ed07fsm142606555e9.22.2025.08.06.04.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 04:53:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  6 Aug 2025 13:52:19 +0200
Message-ID: <20250806115219.3307438-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250806115219.3307438-1-dario.binacchi@amarulasolutions.com>
References: <20250806115219.3307438-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754481200; x=1755086000;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmWSYwXOcPmSXa8Lu26abcCknd4OLA+/OVCekEU4hHg=;
 b=mSP1IYV1lgoerWMu+xB7EVf6o9uku2Ut+w0su+gVriFgdK4vqFP2T0A1tJx8L+6Mfr
 LRO5Taurrl8UtSZtRTorI+ykW3t9bWbBZORHNGj1y1UuHNb1j+OCTFXPH/qz5CH6l1vt
 e7Nuja2ommWH7d2y9fEsh4Lsyul0XoBdDYk9s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mSP1IYV1
Subject: [Buildroot] [RFC PATCH 4/4] package/qwt: enable build with Qt6
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 6.3.0 added support for Qt6, so enable building Qwt with Qt6 as
well.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/qwt/Config.in | 22 ++++++++++++++--------
 package/qwt/qwt.mk    |  4 ++++
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 736ccc2a5ea5..c816b48a0851 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
-	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_WIDGETS # printsupport
-	select BR2_PACKAGE_QT5BASE_CONCURRENT
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_WIDGETS if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_CONCURRENT if BR2_PACKAGE_QT6
 	help
 	  Qwt is a graphics extension to the Qt GUI application
 	  framework. It provides a 2D plotting widget and more.
@@ -14,15 +18,17 @@ if BR2_PACKAGE_QWT
 
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
-	select BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6SVG if BR2_PACKAGE_QT6
 
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
 
 config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
-	select BR2_PACKAGE_QT5BASE_OPENGL
-	select BR2_PACKAGE_QT5BASE_OPENGL_LIB
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6
 
 endif
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 67292ee025be..0e835c700e16 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -18,8 +18,12 @@ QWT_CONFIG += -e 's%/features%/mkspecs/features%'
 
 ifeq ($(BR2_PACKAGE_QWT_SVG),y)
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
+ifeq ($(BR2_PACKAGE_QT5),y)
 QWT_DEPENDENCIES += qt5svg
 else
+QWT_DEPENDENCIES += qt6svg
+endif
+else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
