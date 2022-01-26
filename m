Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E83C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 14:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D5B860A9B;
	Wed, 26 Jan 2022 14:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmEBB6XQlVyv; Wed, 26 Jan 2022 14:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58FA46063B;
	Wed, 26 Jan 2022 14:47:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 606AA1BF577
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B57D40949
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fB7b0OEMZBTg for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 14:47:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73E9F40604
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 14:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A33D4825F5; Wed, 26 Jan 2022 14:40:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 15:46:10 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: ed95b7bbc2b110e19dd97b6a03613b9a51d37288
X-Git-Newrev: b5037ecffd5d42771ece111a220e011fec547764
X-Patchwork-Hint: ignore
Message-Id: <20220126144049.A33D4825F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libnss: fix build
 failure with make version 4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5037ecffd5d42771ece111a220e011fec547764
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Make 4.3 is buggy and when parallel building host-libnss/libnss we end up
with a failure thrown by make itself. So let's work-around this by don't
parallel build the package if Make version is 4.3.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 540029eb4550760c2190a18ecbf0cb4391bb1dea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.mk | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 2e26abdfc0..d885da0480 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -15,6 +15,13 @@ LIBNSS_LICENSE_FILES = nss/COPYING
 LIBNSS_CPE_ID_VENDOR = mozilla
 LIBNSS_CPE_ID_PRODUCT = nss
 
+# Don't parallel build if make version = 4.3
+ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
+LIBNSS_MAKE = $(MAKE1)
+else
+LIBNSS_MAKE = $(MAKE)
+endif
+
 LIBNSS_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85862),y)
@@ -71,12 +78,12 @@ endif
 endif
 
 define LIBNSS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
+	$(TARGET_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(LIBNSS_BUILD_VARS)
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
+	$(TARGET_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
@@ -131,12 +138,12 @@ HOST_LIBNSS_BUILD_VARS += USE_64=1
 endif
 
 define HOST_LIBNSS_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
+	$(HOST_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(HOST_LIBNSS_BUILD_VARS)
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
+	$(HOST_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
