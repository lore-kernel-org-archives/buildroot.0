Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C686AC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D6A2404AA;
	Mon,  7 Mar 2022 21:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwuzmGXLgc6L; Mon,  7 Mar 2022 21:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EF75403F8;
	Mon,  7 Mar 2022 21:11:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BB4D1BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FF9D41710
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQcOvUfQTavy for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:10:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C036641719
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0CBE782DFB; Mon,  7 Mar 2022 21:02:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:09:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3539f45ca09558a22fb5816baae9088c34490380
X-Git-Newrev: 9ad1437c5ec697bdef0a567ea47f1dc696a7d64d
X-Patchwork-Hint: ignore
Message-Id: <20220307210211.0CBE782DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang: fix build with
 per-package directories
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ad1437c5ec697bdef0a567ea47f1dc696a7d64d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build with per-package directory is broken, because go is not found in
the PATH, when trying to download and vendor a go package.

This is because FOO_DL_ENV contains $(HOST_GO_COMMON_ENV), which defines
the PATH as PATH=$(BR_PATH). This is correct, except this is expanded at
the time the golang-package macro is evaluated, which means PATH
contains the 'global' BR_PATH, i.e.: $(O)/host/bin:$(O)/host/sbin:...

However, with PPD, this does not yet exist at build time; only the
per-package host directory exists.

We want to have it expanded at the time the recipe is run, so like all
other variables, we need to $$-expand it.

At the same time, also $$-expand two other variables (even though those
are benign, it is better for consistency that they be $$-expanded).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Anisse Astier <anisse@astier.eu>
Cc: Christian Stewart <christian@paral.in>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-golang.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index ddefdf1214..f1c5cfd350 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -45,7 +45,7 @@ $(2)_BUILD_OPTS += \
 	-modcacherw \
 	-tags "$$($(2)_TAGS)" \
 	-trimpath \
-	-p $(PARALLEL_JOBS)
+	-p $$(PARALLEL_JOBS)
 
 # Target packages need the Go compiler on the host at download time (for
 # vendoring), and at build and install time.
@@ -86,7 +86,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
-	$(HOST_GO_COMMON_ENV) \
+	$$(HOST_GO_COMMON_ENV) \
 	GOPROXY=direct \
 	BR_GOMOD=$$($(2)_GOMOD)
 
@@ -134,7 +134,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(TARGET_DIR)/usr/bin/$$(d)
+		$$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(TARGET_DIR)/usr/bin/$$(d)
 	)
 endef
 endif
@@ -143,7 +143,7 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(HOST_DIR)/bin/$$(d)
+		$$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(HOST_DIR)/bin/$$(d)
 	)
 endef
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
