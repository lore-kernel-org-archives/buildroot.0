Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48475E77360
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 07:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF4D081E5F;
	Sat, 30 Sep 2023 07:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF4D081E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNZG89vU6d10; Sat, 30 Sep 2023 07:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5CD81FA7;
	Sat, 30 Sep 2023 07:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB5CD81FA7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5F9B1BF681
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D1C542DFD
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D1C542DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fQkAQuh3f4ki for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 07:54:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09F3742DFC
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 07:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09F3742DFC
Received: by mail.gandi.net (Postfix) with ESMTPA id C2E2E40003;
 Sat, 30 Sep 2023 07:54:30 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 30 Sep 2023 09:54:19 +0200
Message-ID: <20230930075426.513345-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
References: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696060471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drzUpVa9lxmMPVEDb925zEjLRPy+WzJFs5n6uCDGZys=;
 b=KsdaIWF5hm3lcGkUAwt4DbJEneMQ8mozimjE+DE0fwY8ewwDiwwbHgcaiDLXPYf3/T6hpO
 wyO8X6mL8VNAmQOfxHzQeyGNGK4t4WpudZj9hzcyz4GiuA9IvgxxBTSLhay9GXQ7cKonY8
 vi1pbGcj5VG8urmrTmPLse4bQTETYR7qhiJjGWejeYPwTg9yXFXaUzV8WEfb+HtKhP9VyZ
 Y06XsuOUtKf6fIgfncZNe/f9ZPei1ijuNx5UC6e/cD/lCj1SqbKiS+aq1NY0e8GlAK45Le
 KnC2N0qTaA1ACl+2VB0c6+ACYtNL0BbbbA6l464YF5467yOGuTr7kCvGzoDKZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KsdaIWF5
Subject: [Buildroot] [PATCH v2 3/7] package/gcc/gcc-final: move to make
 foreach loops
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

This provides better error handling, and is more in line with our
current coding style. We also replace ";" by "&&" for the same reason
of proper error handling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc-final/gcc-final.mk | 40 +++++++++++++++---------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 0f94579ac4..7951b0f1a9 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -169,30 +169,30 @@ endif
 HOST_GCC_FINAL_USR_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_LIBS))
 
 define HOST_GCC_FINAL_INSTALL_STATIC_LIBS
-	for i in $(HOST_GCC_FINAL_LIBS) ; do \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.a \
-			$(STAGING_DIR)/lib/ ; \
-	done
-	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.a \
-			$(STAGING_DIR)/usr/lib/ ; \
-	done
+	$(foreach lib,$(HOST_GCC_FINAL_LIBS), \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).a \
+			$(STAGING_DIR)/lib/
+	)
+	$(foreach lib,$(HOST_GCC_FINAL_USR_LIBS), \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).a \
+			$(STAGING_DIR)/usr/lib/
+	)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
 define HOST_GCC_FINAL_INSTALL_SHARED_LIBS
-	for i in $(HOST_GCC_FINAL_LIBS) ; do \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
-			$(STAGING_DIR)/lib/ ; \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
-			$(TARGET_DIR)/lib/ ; \
-	done
-	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
-			$(STAGING_DIR)/usr/lib/ ; \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
-			$(TARGET_DIR)/usr/lib/ ; \
-	done
+	$(foreach lib,$(HOST_GCC_FINAL_LIBS), \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).so* \
+			$(STAGING_DIR)/lib/ && \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).so* \
+			$(TARGET_DIR)/lib/
+	)
+	$(foreach lib,$(HOST_GCC_FINAL_USR_LIBS), \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).so* \
+			$(STAGING_DIR)/usr/lib/ && \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).so* \
+			$(TARGET_DIR)/usr/lib/
+	)
 endef
 endif
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
