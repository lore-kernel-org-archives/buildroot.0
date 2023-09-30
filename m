Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB7CE77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB314401B7;
	Sat, 30 Sep 2023 13:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB314401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4VrLfnq87vD; Sat, 30 Sep 2023 13:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE5E141551;
	Sat, 30 Sep 2023 13:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE5E141551
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20DA71BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC3E2813FF
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC3E2813FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXrXB73_SSFV for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C624813CF
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C624813CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06E25839F1; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 14:49:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a14ef1d24a43bf14b760b76870b30927e1bbb84
X-Git-Newrev: 55e83008fc82cf621d94d60ab4401a4848880bc2
X-Patchwork-Hint: ignore
Message-Id: <20230930131103.06E25839F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc/gcc-final: rework installation
 of libgcc_s/libatomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=55e83008fc82cf621d94d60ab4401a4848880bc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/gcc-final/gcc-final.mk | 38 ++++++++++++++------------------------
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
