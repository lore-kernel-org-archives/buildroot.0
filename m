Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03853C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 12:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9380581E10;
	Thu,  1 Aug 2024 12:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2r-BFCWmrSoy; Thu,  1 Aug 2024 12:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9556881E55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9556881E55;
	Thu,  1 Aug 2024 12:12:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D10471BF47E
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 12:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE82B40CAF
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 12:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjJFZ0XYIqTi for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 12:12:36 +0000 (UTC)
X-Greylist: delayed 905 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 01 Aug 2024 12:12:35 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4522740BEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4522740BEF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=jonas.blixt@actia.se; receiver=<UNKNOWN> 
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4522740BEF
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 12:12:35 +0000 (UTC)
Received: from W388ANL.actianordic.se (10.12.12.26) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 13:57:26 +0200
From: Jonas Blixt <jonas.blixt@actia.se>
To: <buildroot@buildroot.org>
Date: Thu, 1 Aug 2024 13:57:12 +0200
Message-ID: <20240801115712.1458767-1-jonas.blixt@actia.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.12.12.26]
X-EsetResult: clean, is OK
X-EsetId: 37303A2956B14454667063
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=actia.se
Subject: [Buildroot] [PATCH] package/pkg-util: Prevent per-package syncing
 stale deps
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
Cc: Jonas Blixt <jonas.blixt@actia.se>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, john.ernberg@actia.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This filters out the dependency inputs when syncing the per-package
target directory to only include 'skeleton' and its dependencies, if
they exist.

This mainly solves a problem where stale dependencies might linger in
per-package target directories which end up in the final target
directory causing unecessarly many rebuild steps to ensure that the
latest version of a dependency is included in the final target directory.

Example:

liba
Package B, depends on liba

If liba is changed and rebuilt package B target directory will still
contain a stale version of liba. During the final rsync the package b
target dir will be rsync'ed after liba to the final target directory
which now will contain the stale version of liba.

For our particular configuration the build time was not affected:
Before: 12m4
After: 11m43

CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Jonas Blixt <jonas.blixt@actia.se>
---
 package/pkg-utils.mk | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index e8e508e334..ea2f2c1549 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -231,16 +231,24 @@ define per-package-rsync
 			| rsync -a --hard-links --files-from=- --no-R -r $(PER_PACKAGE_DIR) $(3))
 endef
 
-# prepares the per-package HOST_DIR and TARGET_DIR of the current
-# package, by rsync the host and target directories of the
-# dependencies of this package. The list of dependencies is passed as
-# argument, so that this function can be used to prepare with
-# different set of dependencies (download, extract, configure, etc.)
+# prepares the per-package HOST_DIR and TARGET_DIR of the current package, by
+# rsync the host directories of the dependencies of this package. The list of
+# dependencies is passed as argument, so that this function can be used to
+# prepare with different set of dependencies (download, extract, configure,
+# etc.)
+#
+# The per-package sync of target is filtered to only sync skeleton and
+# skeletons dependencies when they exist. This prevents stale copies of
+# dependencies in the per-package target directory and thus prevents stale
+# files from propagating to the final target directory during rebuilds of
+# packages.
 #
 # $1: space-separated list of packages to rsync from
 define prepare-per-package-directory
 	$(call per-package-rsync,$(1),host,$(HOST_DIR),hardlink)
-	$(call per-package-rsync,$(1),target,$(TARGET_DIR),hardlink)
+	$(call per-package-rsync,\
+		$(filter $(SKELETON_FINAL_RECURSIVE_DEPENDENCIES) skeleton, $(1)),\
+		target,$(TARGET_DIR),hardlink)
 endef
 
 # Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
