Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59CDC27C5E
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 14:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A91F7401A4;
	Tue, 11 Jun 2024 14:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j53Pygb9gRHB; Tue, 11 Jun 2024 14:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EE2940590
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EE2940590;
	Tue, 11 Jun 2024 14:12:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1241BF38D
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 14:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3720A811F2
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 14:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDXwQfPp6h-x for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 14:12:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25A19810C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25A19810C8
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25A19810C8
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 14:12:40 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ebe3bac6c6so13092401fa.1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 07:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718115158; x=1718719958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zU1ZrAtSpKVppS5UtqSqkdgVB1IxAvazWVQPhlQg0Sg=;
 b=wni6xPFJ4sjp454t/UmJ4e2kOY9BSe0dui7nvAkCGqwUuKgD1Z4gv41ZMTVqV3CawE
 WoAEMN5WQ364eZdc72K9NBSxIxHP0iQebWEtIVwN8mFI2MCOJBabMsoM77ib+LSnuS5M
 tL3UWHIUaf7S1UuN5Z4m/JeuLG2Ki94kAYcuf4CKm+LoWF620S0Ct0wjVTlHK4YZCckN
 PL0jGrZodh7Kj+O5dRNhxYoaLiQZZKSZpRyf2qmPXzupfmGUX+vEbUAPMadhReMBOO7v
 HopcJAbbY/RkjPUQ+4yLFS6K+dOeuySLHny+U9KSveibtfTJk2pcmaM1Q9W25WOeWOqN
 hGBg==
X-Gm-Message-State: AOJu0YxPrc28+ib+Yz2QKrR5Ehl/n7TRFQzIBhf0F+DGATDCy5X6aH+5
 ETYGW7fWBnd+p4iso/KSNGnmgBsawZoxfgaoTEuwaDZEDZivSW7NavuKWmxc
X-Google-Smtp-Source: AGHT+IHVK79Pkg/jYX61Ti66Aco9IIjh6tWdkchyEwSIawNdRzRxV4/O/i9uSnL5kjTa3yWI5vGMWw==
X-Received: by 2002:a2e:9a81:0:b0:2ea:eaaf:bb72 with SMTP id
 38308e7fff4ca-2eaeaafbbfemr81169061fa.33.1718115157514; 
 Tue, 11 Jun 2024 07:12:37 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ebd68bda76sm15806981fa.118.2024.06.11.07.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 07:12:36 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen <roy.kollen.svendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 16:12:16 +0200
Message-ID: <20240611141216.1211627-1-roy.kollen.svendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718115158; x=1718719958; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zU1ZrAtSpKVppS5UtqSqkdgVB1IxAvazWVQPhlQg0Sg=;
 b=it7k+kWFOqqx3MdETUnAAWQnTUdVd7YPk2OkUzQ0mSsUMNOBtCtPy7UlIvT+46vt/+
 h0Q9HWEGka5pbMDMiiFLZrTy2N3glr/beFlVFB1DhqiEuZ/k1Bk+XmG3J1ha23WBIhGO
 PmHchaXbLw3GpjSG2a6Y4jorPlyyYx4i3zEx/KT9rvvTpLSBCEJyPQi8jdAcm0u3Xxk7
 Y6lDStrrLV2DWI7DaUYaENqGIoXVMlKD/Fak2blvYFoX6ulPZOd+EjDDpFhiSrJuUTtO
 OASfGQjw7EtvIQP1PiOUAEES7UJVta6DFDzW8p6gGBEC3ASw7HzJJO88LSbYHwgA/s/y
 3L4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=it7k+kWF
Subject: [Buildroot] [PATCH] package/qt5: bump packages to lateste kde
 submodule versions
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@gmail.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump qt5 packages to latest submodule versions from:
https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
---
 package/qt5/qt5.mk                                       | 2 +-
 package/qt5/qt53d/qt53d.hash                             | 2 +-
 package/qt5/qt53d/qt53d.mk                               | 2 +-
 package/qt5/qt5base/qt5base.hash                         | 2 +-
 package/qt5/qt5base/qt5base.mk                           | 2 +-
 package/qt5/qt5charts/qt5charts.hash                     | 2 +-
 package/qt5/qt5charts/qt5charts.mk                       | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.hash         | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk           | 2 +-
 package/qt5/qt5declarative/qt5declarative.hash           | 2 +-
 package/qt5/qt5declarative/qt5declarative.mk             | 2 +-
 package/qt5/qt5doc/qt5doc.hash                           | 2 +-
 package/qt5/qt5doc/qt5doc.mk                             | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk   | 2 +-
 package/qt5/qt5imageformats/qt5imageformats.hash         | 2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk           | 2 +-
 package/qt5/qt5location/qt5location.hash                 | 2 +-
 package/qt5/qt5location/qt5location.mk                   | 2 +-
 package/qt5/qt5lottie/qt5lottie.hash                     | 2 +-
 package/qt5/qt5lottie/qt5lottie.mk                       | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash             | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk               | 2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk         | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk       | 2 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.hash       | 2 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.mk         | 2 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.hash       | 2 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.mk         | 2 +-
 package/qt5/qt5script/qt5script.hash                     | 2 +-
 package/qt5/qt5script/qt5script.mk                       | 2 +-
 package/qt5/qt5scxml/qt5scxml.hash                       | 2 +-
 package/qt5/qt5scxml/qt5scxml.mk                         | 2 +-
 package/qt5/qt5sensors/qt5sensors.hash                   | 2 +-
 package/qt5/qt5sensors/qt5sensors.mk                     | 2 +-
 package/qt5/qt5serialbus/qt5serialbus.hash               | 2 +-
 package/qt5/qt5serialbus/qt5serialbus.mk                 | 2 +-
 package/qt5/qt5serialport/qt5serialport.hash             | 2 +-
 package/qt5/qt5serialport/qt5serialport.mk               | 2 +-
 package/qt5/qt5speech/qt5speech.hash                     | 2 +-
 package/qt5/qt5speech/qt5speech.mk                       | 2 +-
 package/qt5/qt5svg/qt5svg.hash                           | 2 +-
 package/qt5/qt5svg/qt5svg.mk                             | 2 +-
 package/qt5/qt5tools/qt5tools.hash                       | 2 +-
 package/qt5/qt5tools/qt5tools.mk                         | 2 +-
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash   | 2 +-
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk     | 2 +-
 package/qt5/qt5wayland/qt5wayland.hash                   | 2 +-
 package/qt5/qt5wayland/qt5wayland.mk                     | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.hash             | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk               | 2 +-
 package/qt5/qt5websockets/qt5websockets.hash             | 2 +-
 package/qt5/qt5websockets/qt5websockets.mk               | 2 +-
 package/qt5/qt5webview/qt5webview.hash                   | 2 +-
 package/qt5/qt5webview/qt5webview.mk                     | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash               | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk                 | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk             | 2 +-
 61 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index a43b36dd51..783dbd8c14 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5_VERSION_MAJOR = 5.15
-QT5_VERSION = $(QT5_VERSION_MAJOR).11
+QT5_VERSION = $(QT5_VERSION_MAJOR).14
 QT5_SITE = https://invent.kde.org/qt/qt
 
 include $(sort $(wildcard package/qt5/*/*.mk))
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 0f63aab72a..65e6e8e380 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  44955f90a9af19d80136cb51a929f330ba9e3319d30d1f5d0c2bb4adc7fd7173  qt3d-5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016.tar.bz2
+sha256  31b3e52fb0b28f1e99dd25342a0204d239f7f42bcb25fb56393956904ef412ea  qt3d-9bf4d03e2515f7c454647d54542330b6e90f8191.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPL
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 4b748a4972..8d9babd704 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT53D_VERSION = 5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016
+QT53D_VERSION = 9bf4d03e2515f7c454647d54542330b6e90f8191
 QT53D_SITE = $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)
 QT53D_SOURCE = qt3d-$(QT53D_VERSION).tar.bz2
 QT53D_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 77b88fa909..14e0c9b602 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9219c8e5d82b32b351743fb548f248400f3b3eca9db37a43b2b8c929d2625c01  qt5base-da6e958319e95fe564d3b30c931492dd666bfaff-git4.tar.gz
+sha256  2d6ede564444b617a7fe6e8fa65b3d81df3a3308641cf7c35aef6aa471a21269  qt5base-2b9835f5c9bcfe3105b60a8dd33c1db7d8611378-git4.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bbab9b3de1..3fd5d30251 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5BASE_VERSION = da6e958319e95fe564d3b30c931492dd666bfaff
+QT5BASE_VERSION = 2b9835f5c9bcfe3105b60a8dd33c1db7d8611378
 QT5BASE_SITE = $(QT5_SITE)/qtbase
 QT5BASE_SITE_METHOD = git
 QT5BASE_CPE_ID_VENDOR = qt
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index fec54c86b1..009edbd240 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  66dae46a8bcb1dfc10dd3404296701c41e50658792e4a6a7317a182fad6f36c8  qtcharts-e17308d5ce83a8b66aeeaaaf16ce16d4ee6b2826.tar.bz2
+sha256  c66fec01fedf753bee860aedc365730367026c28a2418a6819b0b2550336293c  qtcharts-7315c48bcec88014e78165bbda54abfcd557e0af.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index bfc6021289..25da7f8ed7 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5CHARTS_VERSION = e17308d5ce83a8b66aeeaaaf16ce16d4ee6b2826
+QT5CHARTS_VERSION = 7315c48bcec88014e78165bbda54abfcd557e0af
 QT5CHARTS_SITE = $(QT5_SITE)/qtcharts/-/archive/$(QT5CHARTS_VERSION)
 QT5CHARTS_SOURCE = qtcharts-$(QT5CHARTS_VERSION).tar.bz2
 QT5CHARTS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 776448502b..8185a272ea 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7a44848e113e1d7232c077f9fa8021ab038f59765123920e11936e7d4b8e3c66  qtconnectivity-f0c98c39447894bba493aa91c65053d7f18d68cb.tar.bz2
+sha256  3f7ed280d234a50d21937aecaf5494bbd570fb80e71f49598e082cefe81d41fe  qtconnectivity-99f30db37c63447c59d5fac15bc8feb832a7fd04.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index dc5e647e0b..e1592e80bb 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5CONNECTIVITY_VERSION = f0c98c39447894bba493aa91c65053d7f18d68cb
+QT5CONNECTIVITY_VERSION = 99f30db37c63447c59d5fac15bc8feb832a7fd04
 QT5CONNECTIVITY_SITE = $(QT5_SITE)/qtconnectivity/-/archive/$(QT5CONNECTIVITY_VERSION)
 QT5CONNECTIVITY_SOURCE = qtconnectivity-$(QT5CONNECTIVITY_VERSION).tar.bz2
 QT5CONNECTIVITY_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 3db5c94458..3a5fc44356 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  bebd1205aa087f529b8824f0284e127e08672ff7ce36a6b865cd921514ec1192  qtdeclarative-960a980dc885622cb84990c4da75d5060318302d.tar.bz2
+sha256  9a84a707411c0daa6b3292ebe264ac7e979639d9f6d5fd45bb18799b42ca0c33  qtdeclarative-50c8def854806485d66aabcf6918e8b987032e55.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 99c88e7d06..0dbb69f2e0 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5DECLARATIVE_VERSION = 960a980dc885622cb84990c4da75d5060318302d
+QT5DECLARATIVE_VERSION = 50c8def854806485d66aabcf6918e8b987032e55
 QT5DECLARATIVE_SITE = $(QT5_SITE)/qtdeclarative/-/archive/$(QT5DECLARATIVE_VERSION)
 QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5DECLARATIVE_VERSION).tar.bz2
 QT5DECLARATIVE_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5doc/qt5doc.hash b/package/qt5/qt5doc/qt5doc.hash
index ec84ecdcb5..8139bfddc9 100644
--- a/package/qt5/qt5doc/qt5doc.hash
+++ b/package/qt5/qt5doc/qt5doc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  87ef0ba72ede78148dfae8fbe78c839f0e9966e1ab4a58d7725041144c0de70f  qtdoc-897e90fe304d844beaf694b82a93a50237fa8b9e.tar.bz2
+sha256  2fd5e9d12067e67c1e1cf77862e6e351ce7300a9eb9b3f089627114f40d45165  qtdoc-bc4503b8b70f4cd435d6e64a9e6c623ca44b9fcd.tar.bz2
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5doc/qt5doc.mk b/package/qt5/qt5doc/qt5doc.mk
index 77845a347f..597bc965ad 100644
--- a/package/qt5/qt5doc/qt5doc.mk
+++ b/package/qt5/qt5doc/qt5doc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5DOC_VERSION = 897e90fe304d844beaf694b82a93a50237fa8b9e
+QT5DOC_VERSION = bc4503b8b70f4cd435d6e64a9e6c623ca44b9fcd
 QT5DOC_SITE = $(QT5_SITE)/qtdoc/-/archive/$(QT5DOC_VERSION)
 QT5DOC_SOURCE = qtdoc-$(QT5DOC_VERSION).tar.bz2
 QT5DOC_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index e5fdaf67bf..900edaee05 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  18afbc24b40420ce0fe6bfad8331f43a1d8c8ec22501b7987ecec9334b69e9a2  qtgraphicaleffects-cce7d784237cd2dd4af1abe2757d048e34e02685.tar.bz2
+sha256  dca1697c8dd21e53999df67f0ac59c1c26531ef3a693bfc066408047ea511e7a  qtgraphicaleffects-2c39e673d6c15a84dcc7882d3772fa04cc79f9ed.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index ddf805303b..341f4a70ac 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5GRAPHICALEFFECTS_VERSION = cce7d784237cd2dd4af1abe2757d048e34e02685
+QT5GRAPHICALEFFECTS_VERSION = 2c39e673d6c15a84dcc7882d3772fa04cc79f9ed
 QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)/qtgraphicaleffects/-/archive/$(QT5GRAPHICALEFFECTS_VERSION)
 QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-$(QT5GRAPHICALEFFECTS_VERSION).tar.bz2
 QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 779db8d109..5da2563187 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  bac150b9c5eaf0132a39a0b2a75cfca5400c11f4b8bf60f7362a6e0307f5c19e  qtimageformats-6a1af670d52492ab0955933b830026b2a18ed6d6.tar.bz2
+sha256  d4805fadfd33243c4a1c9f81083f75b5162e25b92a39a56d87558ba03a2fb8a3  qtimageformats-4e4f5fc6bdac96f5281a3ebeb0fee78df7b1a498.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 27ef05777d..1f51e002e9 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5IMAGEFORMATS_VERSION = 6a1af670d52492ab0955933b830026b2a18ed6d6
+QT5IMAGEFORMATS_VERSION = 4e4f5fc6bdac96f5281a3ebeb0fee78df7b1a498
 QT5IMAGEFORMATS_SITE = $(QT5_SITE)/qtimageformats/-/archive/$(QT5IMAGEFORMATS_VERSION)
 QT5IMAGEFORMATS_SOURCE = qtimageformats-$(QT5IMAGEFORMATS_VERSION).tar.bz2
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 062dfd42ff..0b44f09cbb 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7664c9f2bb8a111c939f988c1951737858e91754b9302476ae7cedcf112aa4a3  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-git4.tar.gz
+sha256  fe3b037f9291352d11714a4c1101299d83e561c11b867d77273fb3f5c44384a3  qt5location-3beb9c810611337fde61d89aa981e9f177a9ede9-git4.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 88bf3d289c..01bb4f747b 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5LOCATION_VERSION = 0ec8f5e82da7369a92824167c4d7331f6c502325
+QT5LOCATION_VERSION = 3beb9c810611337fde61d89aa981e9f177a9ede9
 QT5LOCATION_SITE = $(QT5_SITE)/qtlocation
 QT5LOCATION_SITE_METHOD = git
 QT5LOCATION_GIT_SUBMODULES = YES
diff --git a/package/qt5/qt5lottie/qt5lottie.hash b/package/qt5/qt5lottie/qt5lottie.hash
index 642625753c..304b92de86 100644
--- a/package/qt5/qt5lottie/qt5lottie.hash
+++ b/package/qt5/qt5lottie/qt5lottie.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4d8a063687c25675b012821e252a1afd455bdb4ea43e6d79787f9991c68cb5c5  qtlottie-909b79f4810b8ac62baa3544837793cfb132593b.tar.bz2
+sha256  514e4a8e334e69eb345e9ae7186f6254854077ebf5ca30f0ae216df3ea78bacd  qtlottie-b8c1fa109dce6f8bff9f55738d2f1e21ff677796.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5lottie/qt5lottie.mk b/package/qt5/qt5lottie/qt5lottie.mk
index d4ad3afc63..a364f2e10a 100644
--- a/package/qt5/qt5lottie/qt5lottie.mk
+++ b/package/qt5/qt5lottie/qt5lottie.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5LOTTIE_VERSION = 909b79f4810b8ac62baa3544837793cfb132593b
+QT5LOTTIE_VERSION = b8c1fa109dce6f8bff9f55738d2f1e21ff677796
 QT5LOTTIE_SITE = $(QT5_SITE)/qtlottie/-/archive/$(QT5LOTTIE_VERSION)
 QT5LOTTIE_SOURCE = qtlottie-$(QT5LOTTIE_VERSION).tar.bz2
 QT5LOTTIE_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 7925c4fe05..d6aca5c74d 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  3f78ede5dcc231d0e92e9907d11fa1d7a7cf506eb73d3f035e8461b57dc692b4  qtmultimedia-b4d58d8921d6d1c937b5e708e257e2a07a0c5dc4.tar.bz2
+sha256  62d9ab403bae05d3ca1335324143c371a33089ceed6f4124be74a1518b85906e  qtmultimedia-53069c9c6eb52b744333812f42aed36c3db6e752.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 7a56d238f2..07314b3de3 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5MULTIMEDIA_VERSION = b4d58d8921d6d1c937b5e708e257e2a07a0c5dc4
+QT5MULTIMEDIA_VERSION = 53069c9c6eb52b744333812f42aed36c3db6e752
 QT5MULTIMEDIA_SITE = $(QT5_SITE)/qtmultimedia/-/archive/$(QT5MULTIMEDIA_VERSION)
 QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5MULTIMEDIA_VERSION).tar.bz2
 QT5MULTIMEDIA_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 219dc8d588..fda3198571 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8c02691d3eb45b9f144bef64c9705e26e8a4c725a0731b18450d39a589965c49  qtquickcontrols-dcc90558d9c0cba41eec7df290943994289b0e87.tar.bz2
+sha256  0f2244f4425b8886bbeef77c92b807ef4749ace18d31e02ca88183e5af088c18  qtquickcontrols-9325659ec390eda5b160736a926ba58ccb445cce.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 86792ddd8e..ab7b49f0b8 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKCONTROLS_VERSION = dcc90558d9c0cba41eec7df290943994289b0e87
+QT5QUICKCONTROLS_VERSION = 9325659ec390eda5b160736a926ba58ccb445cce
 QT5QUICKCONTROLS_SITE = $(QT5_SITE)/qtquickcontrols/-/archive/$(QT5QUICKCONTROLS_VERSION)
 QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5QUICKCONTROLS_VERSION).tar.bz2
 QT5QUICKCONTROLS_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 91fb31a7b7..9c401c00e3 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  481220682ce3127711465d6ade22c9ce0e4a4130dd9735344f7464f9147d8f0d  qtquickcontrols2-1ce461bd1dc713cd2f79fc16c5454d587b45eefa.tar.bz2
+sha256  90fb0d1b578af622b98a291f7bc1069695c180040b18e9cd8423fe86e325c290  qtquickcontrols2-69fea340f8f4c483a9b2889e4e24a4b1b52ebc87.tar.bz2
 
 # Hashes for license files:
 sha256  d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca  LICENSE.GPLv3
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index a2503eb9a3..34c27b7cb7 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKCONTROLS2_VERSION = 1ce461bd1dc713cd2f79fc16c5454d587b45eefa
+QT5QUICKCONTROLS2_VERSION = 69fea340f8f4c483a9b2889e4e24a4b1b52ebc87
 QT5QUICKCONTROLS2_SITE = $(QT5_SITE)/qtquickcontrols2/-/archive/$(QT5QUICKCONTROLS2_VERSION)
 QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-$(QT5QUICKCONTROLS2_VERSION).tar.bz2
 QT5QUICKCONTROLS2_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
index 1c9f436b1b..602127d769 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ee404943ef00dbac33928cf001b613ca517fdfdf2767b932a8def5f8c2b0797f  qtquicktimeline-b1b4b882dabaa036c3fb73c4a879ba8efbb02ded.tar.bz2
+sha256  72b1e95f7d4235b03c0d3ffcbc67ab3e7fbe4c96a4d9631cb8c9024a2b9d4f50  qtquicktimeline-bf6c73064c82b07fcb1f7e72c263b249e137e224.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
index 3a8542ab1b..4307c9b123 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKTIMELINE_VERSION = b1b4b882dabaa036c3fb73c4a879ba8efbb02ded
+QT5QUICKTIMELINE_VERSION = bf6c73064c82b07fcb1f7e72c263b249e137e224
 QT5QUICKTIMELINE_SITE = $(QT5_SITE)/qtquicktimeline/-/archive/$(QT5QUICKTIMELINE_VERSION)
 QT5QUICKTIMELINE_SOURCE = qtquicktimeline-$(QT5QUICKTIMELINE_VERSION).tar.bz2
 QT5QUICKTIMELINE_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
index a931ce09cb..943ecb268e 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  677b8ccb5c07673296c4fa01bcbc6bd9b8e3a534d332624f61fe0360a5649703  qtremoteobjects-bdc316aca82769b43cb7821c10d80a1ca02b846e.tar.bz2
+sha256  347c89c24480b1f20f12d7415706aba6536ff7277862d3450e34c40cc711016e  qtremoteobjects-3873bdc809ca8d58d91968cb0de34da26646bc79.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
index 5fea3487a5..8848af3c81 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5REMOTEOBJECTS_VERSION = bdc316aca82769b43cb7821c10d80a1ca02b846e
+QT5REMOTEOBJECTS_VERSION = 3873bdc809ca8d58d91968cb0de34da26646bc79
 QT5REMOTEOBJECTS_SITE = $(QT5_SITE)/qtremoteobjects/-/archive/$(QT5REMOTEOBJECTS_VERSION)
 QT5REMOTEOBJECTS_SOURCE = qtremoteobjects-$(QT5REMOTEOBJECTS_VERSION).tar.bz2
 QT5REMOTEOBJECTS_DEPENDENCIES = qt5base
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index d6572be818..655b772595 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7731d8c85636d039a2b35a9ee0de7b5ebb0c3900a9b4845676041ce91f56f01f  qtscript-f237e324508dcf0dbabde9dd498eda9fa61c4ff0.tar.bz2
+sha256  6462533cb1749d76c890cb3c325524835a6ee7f12682d425a2cf19628806b284  qtscript-572daa83e990ce88cca27909470c5404657ec9de.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 96cbbfbbad..4c8a7e1676 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SCRIPT_VERSION = f237e324508dcf0dbabde9dd498eda9fa61c4ff0
+QT5SCRIPT_VERSION = 572daa83e990ce88cca27909470c5404657ec9de
 QT5SCRIPT_SITE = $(QT5_SITE)/qtscript/-/archive/$(QT5SCRIPT_VERSION)
 QT5SCRIPT_SOURCE = qtscript-$(QT5SCRIPT_VERSION).tar.bz2
 QT5SCRIPT_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 0f13743f45..60e64feb88 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  d598238bfa3bbbe283a8bd2907a4e8e813e00c522f08297a856e6595bbd44099  qtscxml-e8727aabe55526956295407d27317ec15e12b283.tar.bz2
+sha256  92191932423bdbb11e3005bf4c8bc43faa623d7b16558ecf884f20564ad8dbff  qtscxml-6834b183966d08d9f061642ee7ea2d482cbbf073.tar.bz2
 
 # Hashes for license files:
 sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index 32ef425e97..f92bfdf645 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SCXML_VERSION = e8727aabe55526956295407d27317ec15e12b283
+QT5SCXML_VERSION = 6834b183966d08d9f061642ee7ea2d482cbbf073
 QT5SCXML_SITE = $(QT5_SITE)/qtscxml/-/archive/$(QT5SCXML_VERSION)
 QT5SCXML_SOURCE = qtscxml-$(QT5SCXML_VERSION).tar.bz2
 QT5SCXML_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 37a23516df..2955e651e7 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f44148d1a21f3959d79f973d8aa233ddfacf37af6e27902fca8c885b91933fcc  qtsensors-a41492b23cde20d1e00427d31e4637d06aea3638.tar.bz2
+sha256  d01ee718ae1c00329a6b3cdadb190a2159e7d1e1e76d7345815cb17a42d48113  qtsensors-bf0b718cd0b6c7823e9d2037d3bdece44185f444.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 29e257fdda..b99440e21e 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SENSORS_VERSION = a41492b23cde20d1e00427d31e4637d06aea3638
+QT5SENSORS_VERSION = bf0b718cd0b6c7823e9d2037d3bdece44185f444
 QT5SENSORS_SITE = $(QT5_SITE)/qtsensors/-/archive/$(QT5SENSORS_VERSION)
 QT5SENSORS_SOURCE = qtsensors-$(QT5SENSORS_VERSION).tar.bz2
 QT5SENSORS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 1d1861a4a3..64a518734c 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  952b145ae64e03208d7c2a0b0b2b94b928e8998eb72c6762b54e4d9760737dde  qtserialbus-c41785c9f36560722b917d373ee97eed8cc4089a.tar.bz2
+sha256  45bf8a97ef2f2e85c023f4e7ce761b64f98ac6a9c3af2a8f232f2cc778762736  qtserialbus-616bc5b962cdcacb1c1ba985d7236392e9cadb8c.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 3315ef5be7..ca22a0ca1c 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SERIALBUS_VERSION = c41785c9f36560722b917d373ee97eed8cc4089a
+QT5SERIALBUS_VERSION = 616bc5b962cdcacb1c1ba985d7236392e9cadb8c
 QT5SERIALBUS_SITE = $(QT5_SITE)/qtserialbus/-/archive/$(QT5SERIALBUS_VERSION)
 QT5SERIALBUS_SOURCE = qtserialbus-$(QT5SERIALBUS_VERSION).tar.bz2
 QT5SERIALBUS_DEPENDENCIES = qt5serialport
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index e95392b880..b18d0d05b4 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2b7584de148f0b6ea2cf162609d44d7ad3bb893b1995427ceed72cb4562db6d7  qtserialport-3380465d5d4977326616c5e57789a81681be650e.tar.bz2
+sha256  c8eea27d6fc031088fc84cf08cdfffda3b72b6fdd279144a0de7a1bcb9f19d91  qtserialport-34c19c6441cd440dc65b59ae7670eadf099d51f8.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 462d1dd7b9..592de6f0a9 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SERIALPORT_VERSION = 3380465d5d4977326616c5e57789a81681be650e
+QT5SERIALPORT_VERSION = 34c19c6441cd440dc65b59ae7670eadf099d51f8
 QT5SERIALPORT_SITE = $(QT5_SITE)/qtserialport/-/archive/$(QT5SERIALPORT_VERSION)
 QT5SERIALPORT_SOURCE = qtserialport-$(QT5SERIALPORT_VERSION).tar.bz2
 QT5SERIALPORT_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5speech/qt5speech.hash b/package/qt5/qt5speech/qt5speech.hash
index 3be66a77fe..a222b16292 100644
--- a/package/qt5/qt5speech/qt5speech.hash
+++ b/package/qt5/qt5speech/qt5speech.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4be0161595806cfc5c9c3160a83d0379269a2813dd4b3ffe2e2a1328f23d8fbc  qtspeech-214dcefc7c408e11a3e9fe9d221e4a384e2eaca1.tar.bz2
+sha256  8414b8e9cedc8bdd7bc70f5a1c5b83dda2147fba22c7c6fa6498ea4c1451d6df  qtspeech-8ad0f08ad7e2a8d27dc5e69806812c6a3f298946.tar.bz2
 
 # Hashes for license files:
 sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
diff --git a/package/qt5/qt5speech/qt5speech.mk b/package/qt5/qt5speech/qt5speech.mk
index c8054431df..22f9d8c9d3 100644
--- a/package/qt5/qt5speech/qt5speech.mk
+++ b/package/qt5/qt5speech/qt5speech.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SPEECH_VERSION = 214dcefc7c408e11a3e9fe9d221e4a384e2eaca1
+QT5SPEECH_VERSION = 8ad0f08ad7e2a8d27dc5e69806812c6a3f298946
 QT5SPEECH_SITE = $(QT5_SITE)/qtspeech/-/archive/$(QT5SPEECH_VERSION)
 QT5SPEECH_SOURCE = qtspeech-$(QT5SPEECH_VERSION).tar.bz2
 QT5SPEECH_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index f3e47da5de..654016d94c 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6a71029b46e71667f86c48923f0b292c3057ea56b2aedb8aeaa5af70e85e71c3  qtsvg-3385b64df939815e9df5955f991d270d47a5515b.tar.bz2
+sha256  8e4d0fbfdd8bd33ec23036af932b12f838974ac322a5d53f487190477b2be286  qtsvg-690128b2b8fb6d6fbdc43b2b2633f0f1de3f0638.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index c1d019000b..1221dedcc9 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SVG_VERSION = 3385b64df939815e9df5955f991d270d47a5515b
+QT5SVG_VERSION = 690128b2b8fb6d6fbdc43b2b2633f0f1de3f0638
 QT5SVG_SITE = $(QT5_SITE)/qtsvg/-/archive/$(QT5SVG_VERSION)
 QT5SVG_SOURCE = qtsvg-$(QT5SVG_VERSION).tar.bz2
 QT5SVG_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index d4ea0dc047..c19eb41e5b 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7214584115d0b89a362c6b0e8586d6228ac138f3ed5e52c97962b8634edbbcfd  qttools-ddf6686e9bce7a3232af14a2966b4c895e654f02.tar.bz2
+sha256  46bd221011a6b4b1b9da6ce13099e10d09548af325a8b2082b8bc2f692a0d95d  qttools-f82ed367d1b80b69d738cfcde534b75854a45476.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 98f3948d17..c03d5d6e38 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5TOOLS_VERSION = ddf6686e9bce7a3232af14a2966b4c895e654f02
+QT5TOOLS_VERSION = f82ed367d1b80b69d738cfcde534b75854a45476
 QT5TOOLS_SITE = $(QT5_SITE)/qttools/-/archive/$(QT5TOOLS_VERSION)
 QT5TOOLS_SOURCE = qttools-$(QT5TOOLS_VERSION).tar.bz2
 
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 89559b63f2..d091df1b94 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c8dfb16614a63e39c714673abe35a7c30107d359356695634af619e62e8ce6cd  qtvirtualkeyboard-817378aa10176fd26eed36542bc657e48d9dd42e.tar.bz2
+sha256  264d7fb33bc7cf1e9a387c7220c997f96e64a2659738a419d558e7c518718bd0  qtvirtualkeyboard-7389450a5de5fdd210f1459abcf73621ec0496bd.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 5657d78c30..b4673f7fd4 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5VIRTUALKEYBOARD_VERSION = 817378aa10176fd26eed36542bc657e48d9dd42e
+QT5VIRTUALKEYBOARD_VERSION = 7389450a5de5fdd210f1459abcf73621ec0496bd
 QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)/qtvirtualkeyboard/-/archive/$(QT5VIRTUALKEYBOARD_VERSION)
 QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5VIRTUALKEYBOARD_VERSION).tar.bz2
 QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5declarative qt5svg
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index f4a1663add..3e1aebb5de 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  d45149cce43ad76f0c8ee43f0469728259d2ab341cf7e2c02ddab6163c5f1d13  qtwayland-b8f1882df7215b6e00f66b7a6a08afafe230de29.tar.bz2
+sha256  49fa530747c14e6dbe17f6c683e3292340db8bbaf4f17f7699467d3004b45b5b  qtwayland-11e099c6b7fbec0e198bffaf8016676ef430cfba.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 4ce89fc46a..41f99801fa 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WAYLAND_VERSION = b8f1882df7215b6e00f66b7a6a08afafe230de29
+QT5WAYLAND_VERSION = 11e099c6b7fbec0e198bffaf8016676ef430cfba
 QT5WAYLAND_SITE = $(QT5_SITE)/qtwayland/-/archive/$(QT5WAYLAND_VERSION)
 QT5WAYLAND_SOURCE = qtwayland-$(QT5WAYLAND_VERSION).tar.bz2
 QT5WAYLAND_DEPENDENCIES = wayland
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 7f2a357dbb..bf613d0785 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7d482e5140d789b417c359f557da783ed2cc07e8148133971caeb5b48b418645  qtwebchannel-48a520c11a0ef57f2553746159acf739c7f3863d.tar.bz2
+sha256  fef1e1180d479293b23569190ddfaff5643737f3da065f8954c24b3a1030ea71  qtwebchannel-fca83088ef430f96257d2014e77d08bd350259af.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 8ba81383d1..fe509045b9 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBCHANNEL_VERSION = 48a520c11a0ef57f2553746159acf739c7f3863d
+QT5WEBCHANNEL_VERSION = fca83088ef430f96257d2014e77d08bd350259af
 QT5WEBCHANNEL_SITE = $(QT5_SITE)/qtwebchannel/-/archive/$(QT5WEBCHANNEL_VERSION)
 QT5WEBCHANNEL_SOURCE = qtwebchannel-$(QT5WEBCHANNEL_VERSION).tar.bz2
 QT5WEBCHANNEL_DEPENDENCIES = qt5websockets
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index fa3cc48995..c7fe153f7c 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2e024a4c0706d58a9c846cc1d036f383906e392f3cd7c3051fc56915b7530eee  qtwebsockets-50f3853a83ffc80a978cfa0882bdc2859e8de71e.tar.bz2
+sha256  00c915dc0f909d91c13aae4fb39e83e7c4bb5b8c6ad98de9f4e1e44f699cc605  qtwebsockets-dbbdc64b804f7c4d0ed92198aaab49b07fa15e7f.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index bb96fefe82..565894e0ba 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBSOCKETS_VERSION = 50f3853a83ffc80a978cfa0882bdc2859e8de71e
+QT5WEBSOCKETS_VERSION = dbbdc64b804f7c4d0ed92198aaab49b07fa15e7f
 QT5WEBSOCKETS_SITE = $(QT5_SITE)/qtwebsockets/-/archive/$(QT5WEBSOCKETS_VERSION)
 QT5WEBSOCKETS_SOURCE = qtwebsockets-$(QT5WEBSOCKETS_VERSION).tar.bz2
 QT5WEBSOCKETS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index 00525dbad2..55aedd54e6 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2427179da946d6df409e334c94ffe3f8589035a5d566caf52db2333cc9bfe47c  qtwebview-f078642eb9a440f6aa88f2beaf10f445de1e29bb.tar.bz2
+sha256  7b5bf69f3037f55a8ff7b9e153bfa5a42dcdecb322ce2749ace8f11562a0780d  qtwebview-bbb1891595aba23ff3c6d137aa74442f9e54479b.tar.bz2
 
 # Hashes for license files:
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
index 01a377c27b..310bfbba42 100644
--- a/package/qt5/qt5webview/qt5webview.mk
+++ b/package/qt5/qt5webview/qt5webview.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBVIEW_VERSION = f078642eb9a440f6aa88f2beaf10f445de1e29bb
+QT5WEBVIEW_VERSION = bbb1891595aba23ff3c6d137aa74442f9e54479b
 QT5WEBVIEW_SITE = $(QT5_SITE)/qtwebview/-/archive/$(QT5WEBVIEW_VERSION)
 QT5WEBVIEW_SOURCE = qtwebview-$(QT5WEBVIEW_VERSION).tar.bz2
 QT5WEBVIEW_DEPENDENCIES = qt5webengine
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 132c28dd96..a84df3f2e2 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7d99fa4d900207c0ae1c7a514e7dc0b607c04e0232d2842a8d84f52534bd16e6  qtx11extras-5fb2e067a38d3583684310130f5d8aad064f512f.tar.bz2
+sha256  85943a927c6e07a2a7b2cdf2b6006b554cd9b52271d8892f6475fe9db67d16f3  qtx11extras-6c3605fcb3b34e55951f597e06c135d97dfa6cd7.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index a6fade0135..922730c4d7 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5X11EXTRAS_VERSION = 5fb2e067a38d3583684310130f5d8aad064f512f
+QT5X11EXTRAS_VERSION = 6c3605fcb3b34e55951f597e06c135d97dfa6cd7
 QT5X11EXTRAS_SITE = $(QT5_SITE)/qtx11extras/-/archive/$(QT5X11EXTRAS_VERSION)
 QT5X11EXTRAS_SOURCE = qtx11extras-$(QT5X11EXTRAS_VERSION).tar.bz2
 QT5X11EXTRAS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 9be7bb7831..9531c02e53 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7770b333f2c0079cf65aa19dafd9e7d80fe058baf8e924f1c0d6e75c0b6e7374  qtxmlpatterns-5a1948ddc05bf44017ac12bd5c2b9bc79fbcb9a2.tar.bz2
+sha256  2dcac1941b2510ea6fd85fe700fead9443f737e93cc12bf9b90dc6b71ff8d844  qtxmlpatterns-087f6f35bd027f940818b1696d0aad822e034377.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 2126d3c915..d346d92f7b 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5XMLPATTERNS_VERSION = 5a1948ddc05bf44017ac12bd5c2b9bc79fbcb9a2
+QT5XMLPATTERNS_VERSION = 087f6f35bd027f940818b1696d0aad822e034377
 QT5XMLPATTERNS_SITE = $(QT5_SITE)/qtxmlpatterns/-/archive/$(QT5XMLPATTERNS_VERSION)
 QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5XMLPATTERNS_VERSION).tar.bz2
 QT5XMLPATTERNS_INSTALL_STAGING = YES
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
