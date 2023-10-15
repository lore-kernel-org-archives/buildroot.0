Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C3CCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62F3F4149E;
	Sun, 15 Oct 2023 18:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62F3F4149E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOFVkMqqVpdA; Sun, 15 Oct 2023 18:21:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3037B414BE;
	Sun, 15 Oct 2023 18:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3037B414BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 771491BF8C7
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 508704149E
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 508704149E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUt7zEMP9EVz for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:21:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13E17414BE
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13E17414BE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF568852ED; Sun, 15 Oct 2023 18:21:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:20:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 708eb34bf4ad8c658c3e46d7d0afe410096a1b23
X-Git-Newrev: 25e60fbe1cabb678952330a8d8d48efe7f8e5048
X-Patchwork-Hint: ignore
Message-Id: <20231015182135.EF568852ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: fix SDK relocation for
 per-package-dirs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=25e60fbe1cabb678952330a8d8d48efe7f8e5048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The relocate-sdk.sh script does not work correctly when
BR2_PER_PACKAGE_DIRECTORIES is enabled. relocate-sdk.sh expects
everything to point at $HOST_DIR, but each package will be pointing at
its $(O)/per-package/*/host.

Use the same command for scrubing host paths during the build, to scrub
to the final host directory location.

Signed-off-by: Brandon Maier <Brandon.Maier@collins.com>
Acked-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile               |  1 +
 package/pkg-generic.mk | 12 +-----------
 package/pkg-utils.mk   | 15 +++++++++++++++
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index dc4dbc64e1..f87f4458ba 100644
--- a/Makefile
+++ b/Makefile
@@ -600,6 +600,7 @@ prepare-sdk: world
 	PARALLEL_JOBS=$(PARALLEL_JOBS) \
 		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
 		$(TOPDIR)/support/scripts/fix-rpath staging
+	$(call ppd-fixup-paths,$(BASE_DIR))
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6e944dd6b7..e140145ee3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -92,18 +92,8 @@ endif
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 
-# Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
-# proper staging and host directories for the current package: find
-# all text files that contain the PPD root, and replace it with the
-# current package's PPD.
 define PPD_FIXUP_PATHS
-	$(Q)grep --binary-files=without-match -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR) \
-	|while read -d '' f; do \
-		file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
-		printf '%s\0' "$${f}"; \
-	done \
-	|xargs -0 --no-run-if-empty \
-		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
+	$(call ppd-fixup-paths,$(PER_PACKAGE_DIR)/$($(PKG)_NAME))
 endef
 
 # Remove python's pre-compiled "sysconfigdata", as it may contain paths to
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index bdbdf20c23..ba3da68a7b 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -233,6 +233,21 @@ define prepare-per-package-directory
 	$(call per-package-rsync,$(1),host,$(HOST_DIR))
 	$(call per-package-rsync,$(1),target,$(TARGET_DIR))
 endef
+
+# Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
+# proper staging and host directories for the current package: find
+# all text files that contain the PPD root, and replace it with the
+# current package's PPD.
+# $1: destination root directory containing host and staging
+define ppd-fixup-paths
+	$(Q)grep --binary-files=without-match -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR) \
+	|while read -d '' f; do \
+		file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
+		printf '%s\0' "$${f}"; \
+	done \
+	|xargs -0 --no-run-if-empty \
+		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(1)/:g'
+endef
 endif
 
 #
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
