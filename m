Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E20CC25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 11:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ECA14178A;
	Thu, 26 Oct 2023 11:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ECA14178A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G96pKYhmhGqC; Thu, 26 Oct 2023 11:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6A4B41797;
	Thu, 26 Oct 2023 11:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6A4B41797
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 440031BF59D
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D9D74176C
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D9D74176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPK_pRZeXXj3 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 11:25:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E968041738
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 11:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E968041738
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCE0B85F05; Thu, 26 Oct 2023 11:25:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 23:10:24 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: d4393ae2710c92d4f51761e3d40a809a343dde09
X-Git-Newrev: 377941f670a4b20702d914aaa50faee8f725620f
X-Patchwork-Hint: ignore
Message-Id: <20231026112538.CCE0B85F05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] Makefile: fix SDK
 relocation for per-package-dirs
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

commit: https://git.buildroot.net/buildroot/commit/?id=377941f670a4b20702d914aaa50faee8f725620f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

The relocate-sdk.sh script does not work correctly when
BR2_PER_PACKAGE_DIRECTORIES is enabled. relocate-sdk.sh expects
everything to point at $HOST_DIR, but each package will be pointing at
its $(O)/per-package/*/host.

Use the same command for scrubing host paths during the build, to scrub
to the final host directory location.

Signed-off-by: Brandon Maier <Brandon.Maier@collins.com>
Acked-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 25e60fbe1cabb678952330a8d8d48efe7f8e5048)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               |  1 +
 package/pkg-generic.mk | 12 +-----------
 package/pkg-utils.mk   | 15 +++++++++++++++
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 3c0e27ce16..9445729f27 100644
--- a/Makefile
+++ b/Makefile
@@ -596,6 +596,7 @@ prepare-sdk: world
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath host
 	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath staging
+	$(call ppd-fixup-paths,$(BASE_DIR))
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9947e4cc6d..30570840a4 100644
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
