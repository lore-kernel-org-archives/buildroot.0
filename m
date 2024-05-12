Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2419C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 20:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C5D381370;
	Sun, 12 May 2024 20:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ou1kg80vu9Sx; Sun, 12 May 2024 20:20:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E306E822E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E306E822E5;
	Sun, 12 May 2024 20:20:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A58C1BF8B4
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADBBE60600
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoABgG85OO4o for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 20:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0EC760630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0EC760630
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0EC760630
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:19:26 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e34e85ebf4so30182101fa.2
 for <buildroot@buildroot.org>; Sun, 12 May 2024 13:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715545165; x=1716149965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F30OF1HR0o2hQcSwOdfe4MroQ0IUpJFFld4/sQ/peL8=;
 b=rfhONKn+RQSdwm1/Bv/rr3fcqXKXXoNWzBGwwNQ6gIuO8tb4IYw2VzcP3v4+EyPUfn
 xIrQswBbJXgTuVE6vl5xQaapXX7hQvO4KGmjGrSveiRZI4OXog7VRDgmsPuQXLdGHnWf
 BDd0YcUK4uAnuKptzEaf5P9F4EBOLdX7UciWkghibR5NZLgAHF7YRuZ27Xyt7M7Y9aTZ
 9h4uOvn1T1PWy1jTujt4VyZkqMZreULZ72oIxMrxSoX5h1bzPyc8hat8h4KYjlC0Grnu
 K7ScXlBNl6JZ3X18lm8HrxlR/V+vf8AQN/5upL+wbzm/k9HA15YPbHgE5QtUMN2yEGir
 Ei3A==
X-Gm-Message-State: AOJu0Yxzw+dZM9AXzMJ5zX/+8UMrDv8ZZJAmzZR71jEJmu7xHaDNwfUD
 OZ2IP07y4ucbU3UR4HbbLhBPlWDP00oX1Sah9Jp/LFm0heMKU8tDH7RC86po
X-Google-Smtp-Source: AGHT+IH6r3fucwwd6AFQ/hVXbNZXud+p09NFVwA2EW42mY8vgS+qXq+auMIWoKS5nkE23VS+zynzRw==
X-Received: by 2002:a2e:8506:0:b0:2e1:cb22:a4d with SMTP id
 38308e7fff4ca-2e52028b155mr57412651fa.36.1715545164711; 
 Sun, 12 May 2024 13:19:24 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d1515580sm11400791fa.79.2024.05.12.13.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 13:19:24 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 13:45:58 +0200
Message-ID: <20240512114617.2564569-11-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
References: <1924535>
 <20240512114617.2564569-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715545165; x=1716149965; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F30OF1HR0o2hQcSwOdfe4MroQ0IUpJFFld4/sQ/peL8=;
 b=nCtf98tbeQ49QZqccY0S/9xHcd/6oFIuEJn3n6bM+Mj9JuBMe2Xh3zlXAQ+utdahMn
 Dl07vtddPXneVd2MEVbjkd6prWjwyByDB5xGRnYHzLLjaVMbpCvz/3D2gUGTDsG81B43
 LH8Wz97565xa8UBwd7J0guCDuY/q5C9W+5k1f2XukQ7oM/Tp1Ha9s3XvboTqFGzdz3fs
 GKMWO4lMqJ1ef6FYBXOwhLCp3tJctvwsqvJUnAeHSsIdaywGquWu5hHLut9g5mg/6vE9
 +c0aBbu1DL6WuSxTOP0lCu5+j1iut4KfP74XsnYYp30Ro+gYOpTRfsH2jinXWnw9eKbz
 wShQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nCtf98tb
Subject: [Buildroot] [PATCH v3 11/14] package/qt6/qt6base: add blind option
 to enable Network support on host
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
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

Qt Network is a required dependency of Qt Tools. Therefor we need a way
to enable the Qt Network module when building for host.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v2 -> v3:
  - Separate out this change from patch adding qttools package. (suggested by Yann)
 
 package/qt6/qt6base/Config.in.host | 5 +++++
 package/qt6/qt6base/qt6base.mk     | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 326c06278e..286da0ff03 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -2,3 +2,8 @@
 # Qt Shader Baker(qsb)).
 config BR2_PACKAGE_HOST_QT6BASE_GUI
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Network module
+# (e.g. Qt Tools).
+config BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 47f47b6f8c..7c3540ce01 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -88,7 +88,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
 	-DFEATURE_testlib=OFF \
-	-DFEATURE_network=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -103,6 +102,12 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_NETWORK),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
