Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C44ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C46EE40515;
	Fri, 26 Aug 2022 12:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C46EE40515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z45MLzrXkHJG; Fri, 26 Aug 2022 12:57:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2B88404BB;
	Fri, 26 Aug 2022 12:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2B88404BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08CF91BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8952610F7
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8952610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N17Vd_tOQ5jq for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0147660761
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0147660761
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:19 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z8so2038921edb.0
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uQpWEsGAk7itpXAxvcJtgFDv+aFQ54EpM4OAulFWPuA=;
 b=qIl6PSRaGn29o6HaFX667+cNB8obeg1rM6rtjsd0FW589r5Xh8OR6v3s3R1hUhi2Rh
 dSXIievJmNhOfIEowRLLpGe0ScrXb5A2ctHdqvSyPsZvBHBLKo2r+N9NXsU8rgNpvIab
 xRk2bea1WkxFibIl3j/5KNY/HdwxnytWjgdO+kzzueqXWit3XRvFNydgALTDgXm+Gjw+
 LY8Yu1gGASizfyZk09wp/nLFYf+QMWFJDiNSQXiX4JLBGrpRx2ALQd8MpDGEEwExkIpe
 pKCX3KfrirYzXvVEprHU4HbfiUCMZx6HbXb7gMlldkAGiaBsxl7k2YEbu6XFB8Xyc7pd
 7J2A==
X-Gm-Message-State: ACgBeo3UWx3p7SYiOGILhGm3Tzdyxpi/TQ0uaBvzGBbijuMHATO2uHCA
 UVUpMg0+86Dy8UDO1prXc5RciTOHjzJaqxHC
X-Google-Smtp-Source: AA6agR5gcwoonskQ1nPtAkY0Ld+7tqp/q/N2OLzDEJBItcui6u84tahTVLPRbVDBwnpWEy0AsgwWCw==
X-Received: by 2002:aa7:d995:0:b0:447:ea61:d7d8 with SMTP id
 u21-20020aa7d995000000b00447ea61d7d8mr2139112eds.118.1661518397739; 
 Fri, 26 Aug 2022 05:53:17 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:16 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:44 +0200
Message-Id: <20220826125252.16782-22-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uQpWEsGAk7itpXAxvcJtgFDv+aFQ54EpM4OAulFWPuA=;
 b=CDwm3/tP1E2CDxEoDr3/SJ8q8j38FIZHb5j3cC5tO6htU0CpC2wbaOb++nJcdvnKTX
 lukqVj85Z/7tRDe2D4LyPgTFAKv7yBzmSDAw+Gdkx9cLPqx3C9JVoYLQXoUkrE3XPm8D
 CtWGkWloeIA7y5dtjB5MfRFCPsmWbNZyPSNvhO09OuBBs/WqDKp+jK3K/iLy8U+LMu6i
 FflyeF7yPxRLkcrgnO81ewB4Bjfa/NyxrmyylKY+9AtMol+G8XFpr0rfgk9JHI9YChOR
 8A9gW7AJ1UBEwpP9qNlJSSfGzy8dL8cPx4HaO9qmyYcPCZX2/jVUvCjP6dTmdcDySbdK
 8paA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CDwm3/tP
Subject: [Buildroot] [PATCH v3 21/29] package/qt6/qt6base: add support for
 gui module
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

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/Config.in  | 6 ++++++
 package/qt6/qt6base/qt6base.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 5ae11afdb1..710e027602 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -40,6 +40,12 @@ config BR2_PACKAGE_QT6BASE_DBUS
 	help
 	  This option enables the D-Bus module.
 
+config BR2_PACKAGE_QT6BASE_GUI
+	bool "gui module"
+	select BR2_PACKAGE_FREETYPE
+	help
+	  This option enables the Qt6Gui library.
+
 config BR2_PACKAGE_QT6BASE_ICU
 	bool "Enable ICU support"
 	depends on !BR2_BINFMT_FLAT # icu
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index e7c403b75a..2e63d0b4f3 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -135,6 +135,14 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gui=ON -DFEATURE_freetype=ON -DINPUT_opengl=no -DFEATURE_vulkan=OFF
+QT6BASE_DEPENDENCIES += freetype
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
