Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59B4C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FCC9405AC;
	Mon,  5 Dec 2022 12:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FCC9405AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uuNDdNEIn4Wg; Mon,  5 Dec 2022 12:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 884E340577;
	Mon,  5 Dec 2022 12:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 884E340577
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0786E1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71BED408A5
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71BED408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-148AWS7dQD for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F8BE405E0
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F8BE405E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8550A85B9B; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 11:44:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1692691e45fcaaad9572330fb9f7b35b72ad0854
X-Git-Newrev: fb449c72cd6a2983e1d9ebffcd6b0f87fbe7df96
X-Patchwork-Hint: ignore
Message-Id: <20221205112611.8550A85B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-kconfig: fix bad config with
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb449c72cd6a2983e1d9ebffcd6b0f87fbe7df96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_PER_PACKAGE_DIRECTORIES is enabled and Buildroot is using
HOST_MAKE for a Kconfig package. The $(1)_KCONFIG_RULES does not work
correctly, and kconfig-package-regen-dot-config will always run the
'oldconfig' target.

This is because $(1)_KCONFIG_RULES expands before the first recipe line
of .stamp_dotconfig. $(1)_KCONFIG_RULES attempts to call $(HOST_MAKE),
which requires that the per-package/<pkg>/host directory has been setup.
But that directory is not setup until a later recipe line. This results
in $(1)_KCONFIG_RULES silently failing, and so always configuring with
'oldconfig'.

Fix the issue by calling the command as part of the recipe, so
$(HOST_MAKE) will be ready in time. As the comment on $(1)_KCONFIG_RULES
describes, we should not use backticks. Use an intermediary file to
store the output of the command, so that backticks are not needed.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-kconfig.mk | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 32dcfea0bc..f4f35bf96a 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -45,11 +45,16 @@ endef
 # only, as this can fail in complex cases.
 # $(1): the name of the package in upper-case letters
 define kconfig-package-regen-dot-config
-	$(if $(filter olddefconfig,$($(1)_KCONFIG_RULES)),
-		$(Q)$($(1)_KCONFIG_MAKE) olddefconfig,
-		$(if $(filter oldnoconfig,$($(1)_KCONFIG_RULES)),
-			$(Q)$($(1)_KCONFIG_MAKE) oldnoconfig,
-			$(Q)(yes "" | $($(1)_KCONFIG_MAKE) oldconfig)))
+	$(Q)[ -e $($(1)_DIR)/.br_regen_dot_config ] || \
+		$($(1)_KCONFIG_MAKE) -pn config 2>/dev/null \
+		| sed 's/^\([_0-9a-zA-Z]*config\):.*/\1/ p; d' >$($(1)_DIR)/.br_regen_dot_config
+	$(Q)if grep -q '\bolddefconfig\b' $($(1)_DIR)/.br_regen_dot_config; then \
+		$($(1)_KCONFIG_MAKE) olddefconfig; \
+	elif grep -q '\boldnoconfig\b' $($(1)_DIR)/.br_regen_dot_config; then \
+		$($(1)_KCONFIG_MAKE) oldnoconfig; \
+	else \
+		yes "" | $($(1)_KCONFIG_MAKE) oldconfig; \
+	fi
 endef
 
 # Macro to create a .config file where all given fragments are merged into.
@@ -147,19 +152,6 @@ $(2)_KCONFIG_MAKE = \
 	$$($(2)_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_DIR) \
 		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS)
 
-# $(2)_KCONFIG_MAKE may already rely on shell expansion. As the $() syntax
-# of the shell conflicts with Make's own syntax, this means that backticks
-# are used with those shell constructs. Unfortunately, the backtick syntax
-# does not nest, and we need to use Make instead of the shell to handle
-# conditions.
-
-# A recursively expanded variable is necessary, to be sure that the shell
-# command is called when the rule is processed during the build and not
-# when the rule is created when parsing all packages.
-$(2)_KCONFIG_RULES = \
-	$$(shell $$($(2)_KCONFIG_MAKE) -pn config 2>/dev/null | \
-		sed 's/^\([_0-9a-zA-Z]*config\):.*/\1/ p; d')
-
 # The specified source configuration file and any additional configuration file
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
