Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E0BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 21:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44955813FD;
	Sat,  1 Jan 2022 21:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O4TG8AiFZS_Q; Sat,  1 Jan 2022 21:34:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9567A813FA;
	Sat,  1 Jan 2022 21:34:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1D911BF376
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B13B74020E
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMVdBdZmsMVz for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 21:34:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14A744020C
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 21:34:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D87DF82963; Sat,  1 Jan 2022 21:28:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 22:33:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fddaf36edc449c1239b75468cfe75be4cd5132f
X-Git-Newrev: 540029eb4550760c2190a18ecbf0cb4391bb1dea
X-Patchwork-Hint: ignore
Message-Id: <20220101212839.D87DF82963@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: fix build failure with
 make version 4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=540029eb4550760c2190a18ecbf0cb4391bb1dea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make 4.3 is buggy and when parallel building host-libnss/libnss we end up
with a failure thrown by make itself. So let's work-around this by don't
parallel build the package if Make version is 4.3.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnss/libnss.mk | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index e2f7521b47..b6279fa921 100644
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
