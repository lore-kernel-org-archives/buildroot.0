Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A81E77360
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 07:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F383481F27;
	Sat, 30 Sep 2023 07:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F383481F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBRF8Jqf8zgZ; Sat, 30 Sep 2023 07:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3082B820D3;
	Sat, 30 Sep 2023 07:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3082B820D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D94621BF681
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0E9F42DFC
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0E9F42DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRVMNFGpeEPg for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 07:54:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96ED042E08
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 07:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96ED042E08
Received: by mail.gandi.net (Postfix) with ESMTPA id 96F0140006;
 Sat, 30 Sep 2023 07:54:32 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 30 Sep 2023 09:54:21 +0200
Message-ID: <20230930075426.513345-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
References: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696060473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1lnURC2KY1IB8JD5rwMCWmQUe3tJOSQjOmhT2cYtoc=;
 b=DI4e6J451WVgkDn54va/oRrAI3pDCRkUOu5OT7xXm1DgIHq/czSnOsgv0Em/roxZoJzYkX
 uKu8H1GkPQO0wCYwDhgwL6VaD73hWgMutyG1ckgh2g4zndfB5m5+MuQJxtEaYRPzh5zJZd
 M9Cr8xugw1yI9MUERlRT0vSYohS48dggb/Hh64zDovNC+sVBdszvOZ4bVDgJYfYPTZvhx5
 kp/JRWTtXQtSlDnxFP4i78UqwQUdWNWc2QzEXsB6HfkvF8N0zHEEu2QbmPPG+Ni/oZrWiw
 Opxku1Z6ubBxHUtuqzYyyxoCAmEPvXq1rwhW4kEanmmxIxfsrcQoJfBPRlKlFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DI4e6J45
Subject: [Buildroot] [PATCH v2 5/7] package/gcc/gcc-final: move hook further
 down
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

The HOST_GCC_FINAL_M68K_LIBGCC_FIXUP hook is tweaking the staging
directory. In preparation for additional rework, let's move it further
down in the file so that the diff of the rework will be easier to look
at.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc-final/gcc-final.mk | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index c6ed0e35b9..ae6aedb2e7 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -135,15 +135,6 @@ HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
 # -cc symlink to the wrapper is not created.
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
-# coldfire is not working without removing these object files from libgcc.a
-ifeq ($(BR2_m68k_cf),y)
-define HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
-	find $(STAGING_DIR) -name libgcc.a -print | \
-		while read t; do $(GNU_TARGET_NAME)-ar dv "$t" _ctors.o; done
-endef
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
-endif
-
 HOST_GCC_FINAL_LIBS = libgcc_s libatomic
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
@@ -199,4 +190,13 @@ define HOST_GCC_FINAL_INSTALL_LIBS
 endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBS
 
+# coldfire is not working without removing these object files from libgcc.a
+ifeq ($(BR2_m68k_cf),y)
+define HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
+	find $(STAGING_DIR) -name libgcc.a -print | \
+		while read t; do $(GNU_TARGET_NAME)-ar dv "$t" _ctors.o; done
+endef
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
+endif
+
 $(eval $(host-autotools-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
