Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB26C433FE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 20:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7110782726;
	Tue, 25 Jan 2022 20:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3aeMYywdvcoc; Tue, 25 Jan 2022 20:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9C9B82451;
	Tue, 25 Jan 2022 20:49:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2F921BF5A1
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1C0641496
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPqNpgK7s3t6 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 20:49:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 027484148B
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 20:49:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D5D9182810; Tue, 25 Jan 2022 20:42:37 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 21:47:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b06294e9897e90862656416e8b67fdace15488d7
X-Git-Newrev: 2f9a1c621302c6cdf01dfff88f0343d7b03a6107
X-Patchwork-Hint: ignore
Message-Id: <20220125204237.D5D9182810@busybox.osuosl.org>
Subject: [Buildroot] [git commit] core/pkg-generic: apply post-prepare hooks
 before monitoring directories
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f9a1c621302c6cdf01dfff88f0343d7b03a6107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Monitoring the target/ and host/ directories and so on, will serve to
generate lists of files installed by the packages. Those lists are then
used to generate graphs of the size those package take on the target
for example.

With PPD, we will also want to use those lists to only copy those files
actually installed by each dependencies of a package, recursively.

Currently, those lists are not entirely reliable, as the starting points
are established before we apply PPD fixup hooks. As such, at the end of
a package installation, fixed up files will be found to belong to the
current package, while they were in fact provided by one of its
dependency.

While this does no big harm, if at all, for the size graphs, it will
trigger overwrite detection when we eventually gather packages together
to aggregate a PPD or te final host and target. So, we better have the
lists of files be reliable.

So, we only start monitoring the directories after we apply the PPD
fixups (or seen the other way around for a smaller diff: we apply the
PPD fixups before we start monitoring the directories).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 78226ee266..b3a7e1d60e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -273,11 +273,11 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call MESSAGE,"Configuring")
 	$(Q)mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR) $(BINARIES_DIR)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
+	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	@$(call pkg_size_before,$(TARGET_DIR))
 	@$(call pkg_size_before,$(STAGING_DIR),-staging)
 	@$(call pkg_size_before,$(BINARIES_DIR),-images)
 	@$(call pkg_size_before,$(HOST_DIR),-host)
-	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
