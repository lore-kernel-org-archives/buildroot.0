Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB96ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E1383F26;
	Fri, 26 Aug 2022 13:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E1383F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sowMfyQkye85; Fri, 26 Aug 2022 13:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 695A683F12;
	Fri, 26 Aug 2022 13:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 695A683F12
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4210E1BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1757E41A21
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1757E41A21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2V0zP7Ks6rC for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7A2841A10
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7A2841A10
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:10 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id fy31so2892619ejc.6
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3HRsC6iwm/2ekUOA13PH1ijghkyYJ0DTR4aJCRS9w5Q=;
 b=xW5VJYX5LedvGKeW0T6RVZ0NxB7a3Y2OgVLhTEBk6ZHCR5V91QV4gtjZLJDJ+rw2gb
 RZIkMihZ0krRKdnSaW6rBUGD5fKGnXEp+3vBfq5MPn90B0/kgxeM+oTNGOkkFE3pdu80
 7mejSzVHY74k/JdZzKajHqp5Vqf1I68jJLSJbRNtB024dtx+OrIdZpeB7PdpJ9u6lMfR
 Zltze94h6mnGexM1K0zkP8eAUY1X8iWEg2F3OTwkEoy+LBxKlo/HNm7+CKiy6Oeu754m
 c38aaD8/HKdmZL8iVDxkiS+UFHVWAWTB/e3OiwJaq4bPvaK5mu727IWK9Z5XVJEVHrRC
 999g==
X-Gm-Message-State: ACgBeo2AAndCN9OaHRc7o9q9NIgHDOroM9g5mCobwvNC+62mmMnm88dU
 lAKTxrdKhFi3l6O2PdG4GOOfkO1XFgouOwTt
X-Google-Smtp-Source: AA6agR6oSv8ny57bMXoQzSm3r3Fp/llQGC3QS7lw/shsmSYkm7i7m8ZI0Q8CvOZc+J5cl2QEDlmaPQ==
X-Received: by 2002:a17:907:8a07:b0:731:48ba:792e with SMTP id
 sc7-20020a1709078a0700b0073148ba792emr5572225ejc.397.1661522108477; 
 Fri, 26 Aug 2022 06:55:08 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:07 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:36 +0200
Message-Id: <20220826135503.20612-3-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3HRsC6iwm/2ekUOA13PH1ijghkyYJ0DTR4aJCRS9w5Q=;
 b=d4yQbj54LymrJc9CnhT3CeTyl08XV6x3alio5pyV0t+P5bhBsCWw2wMEGDTPgpr2Q8
 eaUowDTqJj2CKEEkIsgM+/dvJQgXXuhUa+78L/Bumn2+PzraxKkdVwcD9dztZYOhxkze
 BAFX6KQnqZIQTiEZIFI3x0HyMxs88xPqFgZR5qdvCa1rEEZlfsN2qSlFMuvdY1SUebAU
 ngVD3yrOHXuQ+Wg+wZEkCbaYvt9wjAASQi8iMeICluYgaWcJvBBJJLbE+343sOcdhtxU
 2dUTic40iBjVYZhyXifhXgLMSBKNheQ40I8dLj7DiNgtRz4crcsbKOxpnxrfgriWgg6q
 IZiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d4yQbj54
Subject: [Buildroot] [PATCH v4 02/29] package/qt6/qt6base: Add license
 information
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

Add license hashes to the hash file and add the information into the makefile

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.hash | 6 ++++++
 package/qt6/qt6base/qt6base.mk   | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 31ed2494af..5efc5c2815 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,2 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtbase-everywhere-src-6.3.1.tar.xz.sha256
 sha256  0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03  qtbase-everywhere-src-6.3.1.tar.xz
+# Hashes for license files:
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+sha256  88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558  LICENSE.LGPLv3
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index c67d94e193..7a0838b2bc 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -7,6 +7,8 @@
 QT6BASE_VERSION = $(QT6_VERSION)
 QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
+QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
+QT6BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 QT6BASE_DEPENDENCIES = \
 	host-ninja \
 	host-qt6base \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
