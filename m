Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EAFE77360
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 07:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 029EB8128B;
	Sat, 30 Sep 2023 07:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 029EB8128B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rxu1_n6Q_Hgg; Sat, 30 Sep 2023 07:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C009781252;
	Sat, 30 Sep 2023 07:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C009781252
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BECBD1BF86B
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9783B83D7F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9783B83D7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63t5MaaOC2dX for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 07:54:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA01F82EAD
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 07:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA01F82EAD
Received: by mail.gandi.net (Postfix) with ESMTPA id B5E084000A;
 Sat, 30 Sep 2023 07:54:31 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 30 Sep 2023 09:54:20 +0200
Message-ID: <20230930075426.513345-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
References: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696060472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jvtgQexxTjp+zVOPH6uWKzahOLcImwOXY+JS7lO9nvo=;
 b=WVz6TKKBpXAnQMSmf+TPj3E+TK5DGg+/Z3CsJ3eSnE1M4QlOuOMD3hQxlKpxLajGC/7Tow
 SVzZ15Nkcf9aC8jBWWQl2uRd4fA85LSzM9zOu36U4tWMbZ6gyvjVdD9ML+AQiZHectEBEV
 4Yy8kks2+XnM27jkdPKf+p1oH92bjjhl1ZcE9+8XIbuK7oTqX7BYdekNrmXyeowOziNs6N
 b/jiN4Lpwqx5SGWo1pd8ig6yIMUaLfIXmFJFAvzTzFwy74tn+sVSF4dleh7T21njpePYWq
 XWawKaQO8smwHJ9ThMRzHVIwyZKn7lDRuO/hMrHa25xjpdbfh9iExgOv9c0eLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WVz6TKKB
Subject: [Buildroot] [PATCH v2 4/7] package/gcc/gcc-final: split lib install
 by target/staging
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Henri Roosen <henri.roosen@ginzinger.com>,
 Stefan Mayrhofer <stefan.mayrhofer@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Right now the library installation was split between installation of
static libs vs. shared libs. In preparation for additional rework, it
makes more sense to split it between target installation and staging
installation.

For staging installation we simply install $(lib)* so that both static
and shared libraries are copied.

For target installation, we only install when shared libraries are
used, and we copy $(lib).so*

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc-final/gcc-final.mk | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 7951b0f1a9..c6ed0e35b9 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -168,28 +168,25 @@ endif
 
 HOST_GCC_FINAL_USR_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_LIBS))
 
-define HOST_GCC_FINAL_INSTALL_STATIC_LIBS
+define HOST_GCC_FINAL_INSTALL_STAGING_LIBS
 	$(foreach lib,$(HOST_GCC_FINAL_LIBS), \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).a \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib)* \
 			$(STAGING_DIR)/lib/
 	)
 	$(foreach lib,$(HOST_GCC_FINAL_USR_LIBS), \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).a \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib)* \
 			$(STAGING_DIR)/usr/lib/
 	)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
-define HOST_GCC_FINAL_INSTALL_SHARED_LIBS
+define HOST_GCC_FINAL_INSTALL_TARGET_LIBS
+	mkdir -p $(TARGET_DIR)/lib $(TARGET_DIR)/usr/lib
 	$(foreach lib,$(HOST_GCC_FINAL_LIBS), \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).so* \
-			$(STAGING_DIR)/lib/ && \
 		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).so* \
 			$(TARGET_DIR)/lib/
 	)
 	$(foreach lib,$(HOST_GCC_FINAL_USR_LIBS), \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).so* \
-			$(STAGING_DIR)/usr/lib/ && \
 		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).so* \
 			$(TARGET_DIR)/usr/lib/
 	)
@@ -197,9 +194,8 @@ endef
 endif
 
 define HOST_GCC_FINAL_INSTALL_LIBS
-	mkdir -p $(TARGET_DIR)/lib $(TARGET_DIR)/usr/lib
-	$(HOST_GCC_FINAL_INSTALL_STATIC_LIBS)
-	$(HOST_GCC_FINAL_INSTALL_SHARED_LIBS)
+	$(HOST_GCC_FINAL_INSTALL_STAGING_LIBS)
+	$(HOST_GCC_FINAL_INSTALL_TARGET_LIBS)
 endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBS
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
