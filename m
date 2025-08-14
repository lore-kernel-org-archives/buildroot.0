Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29646CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 15:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E67FC40EE4;
	Thu, 14 Aug 2025 15:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBLzApYK5tIP; Thu, 14 Aug 2025 15:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2124941239
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2124941239;
	Thu, 14 Aug 2025 15:33:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 378341BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34E4B40E84
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zppj-aalbaA9 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 15:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74EEC40DDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74EEC40DDD
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74EEC40DDD
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:27 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb61f6044so198458566b.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 08:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755185605; x=1755790405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jo6XNWQjvvZivIg+e9Jllj7wGYs4TiNC3o3+uYMg5Is=;
 b=DTgynqs+WMRIl9pKdZR+Ru/TfsymA1G4fMdBEMhFYamF2xksgf3N8t0EOp6b1WdAif
 hIX4Tk31zPPkO2g2SyLxyYXyXGhXdEaZkaUeHI3r9exL3R4A7gP9ZVUdOdyytGtFtkAy
 Hz/w9mEufQZSybagCXG+Q2sbOptN8PhkVrPpAK7mns0gtOLrtymik2Xv4AZByX1orbI4
 kswn5O7i0/o4ICwirgGg57M8FrpJZbrGEyX+76w2SFaW5yaOx8D+WV7vwK5Pv05Uutd4
 qB568DSMyISXJCs9rPIEgYE/roUKqTpaTXPnTGmE+ek/AOcuIa91MKkd1/SL+849Cmg7
 D3Fw==
X-Gm-Message-State: AOJu0YyNZTm8XW5ot5N39oMxqZ5HSqDHLgxA8Le/cJGCBPyoppFWpU7t
 KNkvuRlLkTFRJyJusWuGZ/0Rp4rjWJMx5Wgj1bZQUxurcrlmDJnx8qrUQgbFpuGDH735XxDeO7l
 +nGZE6kA=
X-Gm-Gg: ASbGncuh+VdYAXoEDPfQwxBvNK61977JUOxaIgGgNJtLJlt3WejAxRZtcFgL+izKqIr
 2u1DcX/urLTlRLOGtZT4w9QGlNbyqGQIlzjAk5nsMddFysu6osqnZDSKxlZqYLhhNdaFLyMPS7u
 4DRgSPEt0U+bSRUGd5G1YFQlWb+PsqRw5vF6i3hphpU/dEV76Sew61v0KA7um29LvECGoawVGi3
 Wi5+aAWGjQc6zwZcs3pl3XP6nX6DXgeuOk1v7uW53otzwZBBAoyBuvCxjb36iIR419IDNS2+XGV
 cky8Z3eSmX5Db/wjWLy6xwkKw/SXQ+dTL4TZZadP9vxdFna+ppm5vSXxtM7Z4NGz4hVUbixciWK
 UI0kIEc8/mZTr1Qt27aaZybm6eQeRnMGSp32TeVAC0vr5qM9u5K3//PXe+VPhocQ0eh98xJ8oC0
 yr
X-Google-Smtp-Source: AGHT+IEXq1mxyW1uFF5xB/V22M6pYWcC0EXnO7OrwqF6HZoZHvnfjWr45pO/gGeJ+zR9VK44nXbxfw==
X-Received: by 2002:a17:907:160c:b0:afc:a3b2:d100 with SMTP id
 a640c23a62f3a-afcbe7c8410mr356831366b.7.1755185605262; 
 Thu, 14 Aug 2025 08:33:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:9b30:e43:d6cd:c58f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c022sm2561928966b.101.2025.08.14.08.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 08:33:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 17:32:59 +0200
Message-ID: <20250814153259.6822-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
References: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755185605; x=1755790405;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jo6XNWQjvvZivIg+e9Jllj7wGYs4TiNC3o3+uYMg5Is=;
 b=R9xzX5CvTZw86ELkqIrCGACg+VhMHD02//9QqGtkuK1hPegbgQzLyyoHeDUVmWXApG
 LBttRnhGiPCzgCtjtsVmhQZxF8kXqsA/gNEMBac5teNiz29syw/n5ocyo42waoo7Pu7W
 hQ3GX5Tqg2SRuQ8JbAcu9h7Vviyj663FhZ9B8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=R9xzX5Cv
Subject: [Buildroot] [RFC v3 5/5] package/cutekeyboard: enable build with Qt6
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
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable building of cutekeyboard with Qt6. With the merge of
QuickControls2 into qtdeclarative, the corresponding Kconfig option has
also disappeared in Buildroot.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Added in v2

 package/cutekeyboard/Config.in       | 13 ++++++++-----
 package/cutekeyboard/cutekeyboard.mk |  6 +++++-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.in
index bd661b0cd42e..4f83316644a2 100644
--- a/package/cutekeyboard/Config.in
+++ b/package/cutekeyboard/Config.in
@@ -1,10 +1,13 @@
 config BR2_PACKAGE_CUTEKEYBOARD
 	bool "cutekeyboard"
-	depends on BR2_PACKAGE_QT5
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
-	select BR2_PACKAGE_QT5QUICKCONTROLS2
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE || BR2_PACKAGE_QT6 # qt5declarative
+	select BR2_PACKAGE_QT5DECLARATIVE if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5QUICKCONTROLS2 if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE_QUICK if BR2_PACKAGE_QT6
 	help
 	  CuteKeyboard is a Qt virtual keyboard plugin for
 	  embedded applications.
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 775bed0fe995..8181950aac50 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -6,7 +6,11 @@
 
 CUTEKEYBOARD_VERSION = v1.3.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
-CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
+ifeq ($(BR2_PACKAGE_QT5),y)
+CUTEKEYBOARD_DEPENDENCIES += qt5declarative qt5quickcontrols2
+else
+CUTEKEYBOARD_DEPENDENCIES += qt6declarative
+endif
 CUTEKEYBOARD_INSTALL_STAGING = YES
 CUTEKEYBOARD_LICENSE = MIT
 CUTEKEYBOARD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
