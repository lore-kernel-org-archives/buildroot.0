Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104A5C001E0
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 19:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80DBF4016C;
	Sat, 21 Oct 2023 19:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80DBF4016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25K48WTh96jA; Sat, 21 Oct 2023 19:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7B39404D5;
	Sat, 21 Oct 2023 19:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7B39404D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 189131BF3D2
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 19:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F233A4F258
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 19:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F233A4F258
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdxVFADR2iEQ for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 19:24:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 650564F24A
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 19:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 650564F24A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5243285644; Sat, 21 Oct 2023 19:24:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Oct 2023 21:18:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f1487d6fa4cde5330f73e2432c264c0bd7940c6
X-Git-Newrev: 23edf9837c93445ff32db718b1ab6b0baa32c7a7
X-Patchwork-Hint: ignore
Message-Id: <20231021192400.5243285644@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils: teach per-package-rsync
 to copy or hardlink dest
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

commit: https://git.buildroot.net/buildroot/commit/?id=23edf9837c93445ff32db718b1ab6b0baa32c7a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit 21d52e52d8de (package/pkg-utils.mk: break hardlinks in global
{TARGET, HOST}_DIR on per-package build) was recently reverted, so we
are back to a situation where it is possible for packages and post-build
scripts to modify files in-place, and thus impact files in any arbitrary
per-package directory, which may break things on rebuild for example.

21d52e52d8de was too big a hammer, but we can still apply the reasoning
from it, to the aggregation of the final target and host directories.

This solves the case for post-build scripts at least. We leave the case
of inter-package modification aside, as it is a bigger issue that will
need more than just copying files around.

We use --hard-links, so that hard-links in the source (the PPD), are
kept as new hard-links (i.e. "copy" of hard-links) in the destination.
This contributes to limiting the size of target/.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Herve Codina <herve.codina@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
---
 Makefile             |  4 ++--
 package/pkg-utils.mk | 15 ++++++++++++---
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index f87f4458ba..3e85d5ef09 100644
--- a/Makefile
+++ b/Makefile
@@ -717,7 +717,7 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
 .PHONY: host-finalize
 host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
 	@$(call MESSAGE,"Finalizing host directory")
-	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR))
+	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR),copy)
 
 .PHONY: staging-finalize
 staging-finalize: $(STAGING_DIR_SYMLINK)
@@ -725,7 +725,7 @@ staging-finalize: $(STAGING_DIR_SYMLINK)
 .PHONY: target-finalize
 target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
 	@$(call MESSAGE,"Finalizing target directory")
-	$(call per-package-rsync,$(sort $(PACKAGES)),target,$(TARGET_DIR))
+	$(call per-package-rsync,$(sort $(PACKAGES)),target,$(TARGET_DIR),copy)
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 5d5980b098..dcab7d9b2a 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -214,10 +214,19 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 # $1: space-separated list of packages to rsync from
 # $2: 'host' or 'target'
 # $3: destination directory
+# $4: literal "copy" or "hardlink" to copy or hardlink files from src to dest
 define per-package-rsync
 	mkdir -p $(3)
 	$(foreach pkg,$(1),\
-		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
+		rsync -a \
+			--hard-links \
+			$(if $(filter hardlink,$(4)), \
+				--link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/, \
+				$(if $(filter copy,$(4)), \
+					$(empty), \
+					$(error per-package-rsync can only "copy" or "hardlink", not "$(4)") \
+				) \
+			) \
 			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 			$(3)$(sep))
 endef
@@ -230,8 +239,8 @@ endef
 #
 # $1: space-separated list of packages to rsync from
 define prepare-per-package-directory
-	$(call per-package-rsync,$(1),host,$(HOST_DIR))
-	$(call per-package-rsync,$(1),target,$(TARGET_DIR))
+	$(call per-package-rsync,$(1),host,$(HOST_DIR),hardlink)
+	$(call per-package-rsync,$(1),target,$(TARGET_DIR),hardlink)
 endef
 
 # Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
