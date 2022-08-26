Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304ABECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0224812CA;
	Fri, 26 Aug 2022 12:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0224812CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2lJr_DlHRKj; Fri, 26 Aug 2022 12:58:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF6F80F05;
	Fri, 26 Aug 2022 12:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CF6F80F05
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99DB61BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 827E560761
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 827E560761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Go6BVa4uRWq for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B132C6063B
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B132C6063B
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:26 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u6so1961532eda.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FE/8Q8FazO/jEZXHM1uY/9yvsImOovgSikcBVgGOypk=;
 b=Wov/yG5AFS607YFJ7CMhPzK1+K5mz3pZ9LyOjfjaOo7rXXNqPLh4Y28ZuoJVPKcmmo
 aZJEmyMIWU33wv1Cnpj2Hg4kaYrjWvcNxvrMR6O52sqVFC6xFc0QEAsDOCiSBQmRfBgo
 flAZSmHhHIK4uBABGIK0jQGGrBbEsEmRqPKmo0CMkv/Fp9wFbFbwmF6ldeg2eHic152f
 u+fNaZNm6GB4rZEJxfspQY4eirzacMt7C+SjAy7GEQ3En/9JIGKbiSD05DOmMjBo5Sxz
 qrrSRlQUC515uehijualb0SdBPBltM4cRepjiOj2j6aYSOEEssSHG/v1SqeQ05tW4GIz
 V/IA==
X-Gm-Message-State: ACgBeo1K42IJlVqjaF68d7L0RTfRLO8bSDsj8kUcGLrXXq2mI3RWO7Sw
 iW/hgCVbj5lZsaRo5jGA0vpiJJ6scQJtKx/1
X-Google-Smtp-Source: AA6agR4aT7XIWDUQVFBTS5sFoSFPO6VSMaEnUfmJ96lsPeMg99/71maJE2xIvpSzByll5BI2Vf71Fw==
X-Received: by 2002:a05:6402:40c1:b0:447:154e:856d with SMTP id
 z1-20020a05640240c100b00447154e856dmr6678648edb.319.1661518405779; 
 Fri, 26 Aug 2022 05:53:25 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:25 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:52 +0200
Message-Id: <20220826125252.16782-30-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FE/8Q8FazO/jEZXHM1uY/9yvsImOovgSikcBVgGOypk=;
 b=J3x5eK8Sv4/VcUqCfzPROqmoGH7jrc4NDjXERgHjU+DPRs8d2DYlLxmWRNyfinLDZZ
 0QHHVRIzBy78DgiS2XCWsCa+ZBVFAKJ2SIModvG0RM8mcMEHfVlalS9Erfz7ORN2sjpp
 Prl9cQzzbFqTBD+8saRV7XTvogiOL/oTRBlQtpHsZ4GaN846psM8e+Qu7egrBQrd6Xtd
 jG22Ezp0qeewLH0r+Ou/qsWJ0AKmXS1KLsOBg4bGQvjB/CQIAsCh0/0cVZmhJd3hVxSL
 FO4sH8Zb60RcuBz8xiSVmRsYO+OMXvl0pbcS/l3yR2J/BPtOyiKWXYbCTZssThT0gTMU
 7Y3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J3x5eK8S
Subject: [Buildroot] [PATCH v3 29/29] package/qt6/qt6base: add support for
 building examples
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now with dependency on DBus/OpenGL
A minimal set of Qt options was selected for which building the examples
started working.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/Config.in  | 17 +++++++++++++++++
 package/qt6/qt6base/qt6base.mk |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index ffa5a56b40..d85190b6e2 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -40,6 +40,23 @@ config BR2_PACKAGE_QT6BASE_DBUS
 	help
 	  This option enables the D-Bus module.
 
+config BR2_PACKAGE_QT6BASE_EXAMPLES
+	bool "Compile and install examples "
+	depends on BR2_PACKAGE_QT6_GL_AVAILABLE
+	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	select BR2_PACKAGE_QT6BASE_XML
+	select BR2_PACKAGE_QT6BASE_DBUS
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	select BR2_PACKAGE_QT6BASE_OPENGL
+	select BR2_PACKAGE_QT6BASE_OPENGL_LIB
+	help
+	  If unsure, say N.
+
+comment "Building examples needs OpenGL/DBus support"
+	depends on !BR2_PACKAGE_QT6_GL_AVAILABLE || !BR2_PACKAGE_DBUS
+
 config BR2_PACKAGE_QT6BASE_GUI
 	bool "gui module"
 	select BR2_PACKAGE_FREETYPE
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 9b5328e5f2..2324d3825c 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -335,6 +335,12 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_icu=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_EXAMPLES),y)
+QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=ON
+else
+QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
 QT6BASE_CONF_OPTS += -DFEATURE_network=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
