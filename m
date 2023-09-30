Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3103E77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C4D44149B;
	Sat, 30 Sep 2023 13:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C4D44149B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLf3HcpvCVh4; Sat, 30 Sep 2023 13:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66D294155D;
	Sat, 30 Sep 2023 13:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66D294155D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30B2B1BF8A8
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07CE14206E
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07CE14206E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gIjYzT8vOsYX for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E5324206C
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E5324206C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18B95839F4; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 14:49:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47918e24b98de3957d67de660fa68a89f5bdd206
X-Git-Newrev: 21eb27c76e0e265ccdb4bfbb51411e16e910fe63
X-Patchwork-Hint: ignore
Message-Id: <20230930131103.18B95839F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc/gcc-final: move to make
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=21eb27c76e0e265ccdb4bfbb51411e16e910fe63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This provides better error handling, and is more in line with our
current coding style. We also replace ";" by "&&" for the same reason
of proper error handling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/gcc-final/gcc-final.mk | 40 +++++++++++++++++++-------------------
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
