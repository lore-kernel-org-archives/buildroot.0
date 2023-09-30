Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B465E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20CBC40B5E;
	Sat, 30 Sep 2023 13:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20CBC40B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2X82gnAlW9Yp; Sat, 30 Sep 2023 13:11:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39C36400A6;
	Sat, 30 Sep 2023 13:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C36400A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 268EA1BF870
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0002060F84
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0002060F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-J2gykGC9hH for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3625960B51
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3625960B51
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21401839F5; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 14:49:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21eb27c76e0e265ccdb4bfbb51411e16e910fe63
X-Git-Newrev: f2bad2e0bf2704d261bb7552b561d30be8c27c9c
X-Patchwork-Hint: ignore
Message-Id: <20230930131103.21401839F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc/gcc-final: split lib install
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2bad2e0bf2704d261bb7552b561d30be8c27c9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Right now the library installation was split between installation of
static libs vs. shared libs. In preparation for additional rework, it
makes more sense to split it between target installation and staging
installation.

For staging installation we simply install $(lib)* so that both static
and shared libraries are copied.

For target installation, we only install when shared libraries are
used, and we copy $(lib).so*

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
