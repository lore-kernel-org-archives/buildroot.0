Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928F9E77360
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 07:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3602480CBB;
	Sat, 30 Sep 2023 07:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3602480CBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDzvULb-zSPI; Sat, 30 Sep 2023 07:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3527280D20;
	Sat, 30 Sep 2023 07:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3527280D20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCDE91BF86B
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A396842DFD
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A396842DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4sYZkNGgglQ for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 07:54:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CAD542DFC
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 07:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CAD542DFC
Received: by mail.gandi.net (Postfix) with ESMTPA id E521440005;
 Sat, 30 Sep 2023 07:54:28 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 30 Sep 2023 09:54:17 +0200
Message-ID: <20230930075426.513345-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
References: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696060469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FocqeQ6yTz9nL13027iUmERuzq7MS49cdTLN/1JfF9w=;
 b=cmLThh9Zo4tpwqkjbOYsJDlm77izZPvRKDmLH6VFNOUCKpNTYwEypoFrnwr+DsX/TDB0IC
 +AI84m3wryoFd5yBHhanR5/OsisZX84AO9PKQkjGG9U9PYW/0OEcmaEqXRylwyfRHZ3YCh
 g8fvw8ahPVegW0Zh0EPRBkhi4TPDo3dxNR1zcNUT31xFH5fBcQNiM7sXkIALxtSCiMYhLW
 mdmwlwKp/21qYOmKvz4T0C5sC1jdTLXWx075pnd0TtbGnFw1LT9L5vmTvApeCZasBLpbcD
 rgTa+PItnyYz/nNCMwnwXu7ypB8Js3iYhlgWgiaMO9UcdtPTpnRe/RS3CHPXrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cmLThh9Z
Subject: [Buildroot] [PATCH v2 1/7] package/gcc/gcc-final: rework
 installation of libgcc_s/libatomic
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

The installation of libgcc_s/libatomic (which have to go in /lib) is
handled differently than all the other libraries (which go in
/usr/lib). For consistency, and in preparation for additional changes
in this area, handle both in a more consistent manner, with a new
HOST_GCC_FINAL_LIBS that looks like HOST_GCC_FINAL_USR_LIBS.

Consequently, the hook HOST_GCC_FINAL_INSTALL_USR_LIBS is renamed to
HOST_GCC_FINAL_INSTALL_LIBS, and made unconditional rather than being
conditional on ifneq ($(HOST_GCC_FINAL_USR_LIBS),). Indeed, we now
need to install libraries in /lib unconditionally, and if
HOST_GCC_FINAL_USR_LIBS is empty, the loops will simply not iterate on
any element, and they will not install anything in /usr/lib.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc-final/gcc-final.mk | 38 +++++++++++-------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index aa883beb7b..0b390d1b10 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -144,25 +144,7 @@ endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
 endif
 
-# Cannot use the HOST_GCC_FINAL_USR_LIBS mechanism below, because we want
-# libgcc_s to be installed in /lib and not /usr/lib.
-define HOST_GCC_FINAL_INSTALL_LIBGCC
-	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libgcc_s* \
-		$(STAGING_DIR)/lib/
-	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libgcc_s* \
-		$(TARGET_DIR)/lib/
-endef
-
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBGCC
-
-define HOST_GCC_FINAL_INSTALL_LIBATOMIC
-	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libatomic* \
-		$(STAGING_DIR)/lib/
-	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libatomic* \
-		$(TARGET_DIR)/lib/
-endef
-
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBATOMIC
+HOST_GCC_FINAL_LIBS = libgcc_s libatomic
 
 # Handle the installation of libraries in /usr/lib
 HOST_GCC_FINAL_USR_LIBS =
@@ -189,8 +171,11 @@ endif
 
 HOST_GCC_FINAL_USR_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_LIBS))
 
-ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
 define HOST_GCC_FINAL_INSTALL_STATIC_LIBS
+	for i in $(HOST_GCC_FINAL_LIBS) ; do \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.a \
+			$(STAGING_DIR)/lib/ ; \
+	done
 	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
 		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.a \
 			$(STAGING_DIR)/usr/lib/ ; \
@@ -199,6 +184,12 @@ endef
 
 ifeq ($(BR2_STATIC_LIBS),)
 define HOST_GCC_FINAL_INSTALL_SHARED_LIBS
+	for i in $(HOST_GCC_FINAL_LIBS) ; do \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
+			$(STAGING_DIR)/lib/ ; \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
+			$(TARGET_DIR)/lib/ ; \
+	done
 	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
 		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
 			$(STAGING_DIR)/usr/lib/ ; \
@@ -208,12 +199,11 @@ define HOST_GCC_FINAL_INSTALL_SHARED_LIBS
 endef
 endif
 
-define HOST_GCC_FINAL_INSTALL_USR_LIBS
-	mkdir -p $(TARGET_DIR)/usr/lib
+define HOST_GCC_FINAL_INSTALL_LIBS
+	mkdir -p $(TARGET_DIR)/lib $(TARGET_DIR)/usr/lib
 	$(HOST_GCC_FINAL_INSTALL_STATIC_LIBS)
 	$(HOST_GCC_FINAL_INSTALL_SHARED_LIBS)
 endef
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
-endif
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBS
 
 $(eval $(host-autotools-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
