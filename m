Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACD1C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1430813B5;
	Sun, 14 Jul 2024 09:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fR3_Ae3SyblA; Sun, 14 Jul 2024 09:08:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 182E3813ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 182E3813ED;
	Sun, 14 Jul 2024 09:08:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA201BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C094581393
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRy5SW8MuJru for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8623F81372
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8623F81372
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A41B86735; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 09:18:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5836b797626db56958fec09810e16af1c75d2b4c
X-Git-Newrev: d2dd96f0eed99770c3e873284df397f134dc173e
X-Patchwork-Hint: ignore
Message-Id: <20240714090820.7A41B86735@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-download: symplify calling
 parameters
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2dd96f0eed99770c3e873284df397f134dc173e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DOWNLOAD macro is always called in package context, so the PKG
variable is always set, and thus we do not need to pass the package
as a parameter.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-download.mk | 33 ++++++++++++++++-----------------
 package/pkg-generic.mk  |  6 +++---
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 17c8a244c4..90da201bab 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -103,32 +103,31 @@ endif
 # source from the list returned by DOWNLOAD_URIS.
 #
 # Argument 1 is the source location
-# Argument 2 is the upper-case package name
-# Argument 3 is a space-separated list of optional arguments
+# Argument 2 is a space-separated list of optional arguments
 #
 ################################################################################
 
 define DOWNLOAD
-	$(Q)mkdir -p $($(2)_DL_DIR)
+	$(Q)mkdir -p $($(PKG)_DL_DIR)
 	$(Q)$(EXTRA_ENV) \
-	$($(2)_DL_ENV) \
+	$($(PKG)_DL_ENV) \
 	TAR="$(TAR)" \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
-		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
-		-c '$($(2)_DL_VERSION)' \
-		-d '$($(2)_DL_DIR)' \
+		flock $($(PKG)_DL_DIR)/.lock $(DL_WRAPPER) \
+		-c '$($(PKG)_DL_VERSION)' \
+		-d '$($(PKG)_DL_DIR)' \
 		-D '$(DL_DIR)' \
 		-f '$(notdir $(1))' \
-		$(foreach f,$($(2)_HASH_FILES),-H '$(f)') \
-		-n '$($(2)_DL_SUBDIR)-$($(2)_VERSION)' \
-		-N '$($(2)_RAWNAME)' \
-		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
-		$(if $(filter YES,$($(2)_SVN_EXTERNALS)),-r) \
-		$(if $($(2)_GIT_SUBMODULES),-r) \
-		$(if $($(2)_GIT_LFS),-l) \
-		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
-		$(3) \
+		$(foreach f,$($(PKG)_HASH_FILES),-H '$(f)') \
+		-n '$($(PKG)_DL_SUBDIR)-$($(PKG)_VERSION)' \
+		-N '$($(PKG)_RAWNAME)' \
+		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
+		$(if $(filter YES,$($(PKG)_SVN_EXTERNALS)),-r) \
+		$(if $($(PKG)_GIT_SUBMODULES),-r) \
+		$(if $($(PKG)_GIT_LFS),-l) \
+		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(PKG)),-u $(uri)) \
+		$(2) \
 		$(QUIET) \
 		-- \
-		$($(2)_DL_OPTS)
+		$($(PKG)_DL_OPTS)
 endef
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 66eba848e7..af9a42c884 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -182,8 +182,8 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 			break ; \
 		fi ; \
 	done
-	$(if $($(PKG)_MAIN_DOWNLOAD),$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(PKG),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS))))
-	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
+	$(if $($(PKG)_MAIN_DOWNLOAD),$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS))))
+	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
 	@$(call step_end,download)
@@ -192,7 +192,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 # Retrieve actual source archive, e.g. for prebuilt external toolchains
 $(BUILD_DIR)/%/.stamp_actual_downloaded:
 	@$(call step_start,actual-download)
-	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL),$(PKG))
+	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL))
 	$(Q)mkdir -p $(@D)
 	@$(call step_end,actual-download)
 	$(Q)touch $@
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
