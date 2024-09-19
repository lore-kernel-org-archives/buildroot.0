Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C07CE8D52
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 07:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 167A961228;
	Thu, 19 Sep 2024 07:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GP-hlafHcQjU; Thu, 19 Sep 2024 07:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBA87615B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBA87615B1;
	Thu, 19 Sep 2024 07:19:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2785A1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 07:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2366160730
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 07:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtZXuPDjLp_R for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 07:19:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 341DF606A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 341DF606A7
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 07:19:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2130383C62; Thu, 19 Sep 2024 07:19:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 09:13:23 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 02bc5cffcf3842e984008e02dc262d9828b476ba
X-Git-Newrev: 0199796dc917fe20775159632d55d74340276297
X-Patchwork-Hint: ignore
Message-Id: <20240919071901.2130383C62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Makefile: run PPD and
 RPATH fixup in host-fialize
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

commit: https://git.buildroot.net/buildroot/commit/?id=0199796dc917fe20775159632d55d74340276297
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Currently, the gdbinit is generated and installed during post install
hooks, either from the gdb package, or from the external-toolchain
package. When using per-package directories (PPD), the staging directory
of the either package is stored in the generated gdbinit, which is not
going to be valid when all the PPD staging dirs get merged into the
final staging: it would lack any library installed afterwards, i.e.
mostly everything would be missing (but the libraries from the C
toolchain in the case of an external toolchain).

Similarly, all the RPATH will point to various PPD drectories. This
does not cause any issue when the final host is aggregated, because the
PPD directories still exist when we call programs from there (e.g. from
the fs infra, or from post-image scripts).

However, we knew that would not always be possible to keep the PPD
directories: we have the prepare-sdk rule that runs a cleanup pass on
the RPATH, and also applies the generic PPD fixups.

When we introduced prepare-sdk in c32ad51cbf2a (core/sdk: generate the
SDK tarball ourselves), we did not yet have support for PPD for the host
directory, and especially, we did not have the host-finalize rule, which
was only introduced in d0f4f95e390b (Makefile: rework main directory
creation logic) which kick-started the introduction of PPD.

At that point, we did not realise that the rpath fixups from
prepare-sdk, would be better moved to the new host-finalize rule,
because that had no impact unless one would need an SDK.

Later, in 25e60fbe1cab (Makefile: fix SDK relocation for
per-package-dirs), we eventually introduced the PPD generic fixups in
the prepare-sdk rule. Again, we did not realise that those fixups would
be better placed in the host-finalize rule rather than the prepare-sdk.

While fixing the RPATH in host-finalize is not critical, fixing up the
PPD paths actually is, as the gdbinit case demonstrate.

As such, move the PPD fixups to the host-finalize step, and while at it,
also move the RPATH fixups.

This now does not leave much to do in the prepare-sdk step, and that
could very well be moved to the host-finalize rule as well. However,
some people may have started to rely on prepare-sdk in its 6 years of
existence, and the little script it installs is not needed unless one
really needs an SDK. So leave it as it is for now.

Reported-by: Casey Reeves <casey@xogium.me>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Casey Reeves <casey@xogium.me>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Brandon Maier <Brandon.Maier@collins.com>
Tested-by: Brandon Maier <brandon.maier@collins.com>
Acked-by: TIAN Yuanhao <tianyuanhao3@163.com>
(cherry picked from commit a87abcf6da65f3e6aa257aaab58a24eec32a5903)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index e3e2d4377d..ae47e178c9 100644
--- a/Makefile
+++ b/Makefile
@@ -591,14 +591,7 @@ world: target-post-image
 
 .PHONY: prepare-sdk
 prepare-sdk: world
-	@$(call MESSAGE,"Rendering the SDK relocatable")
-	PARALLEL_JOBS=$(PARALLEL_JOBS) \
-		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
-		$(TOPDIR)/support/scripts/fix-rpath host
-	PARALLEL_JOBS=$(PARALLEL_JOBS) \
-		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
-		$(TOPDIR)/support/scripts/fix-rpath staging
-	$(call ppd-fixup-paths,$(BASE_DIR))
+	@$(call MESSAGE,"Preparing the SDK")
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
@@ -716,6 +709,13 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
 host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
 	@$(call MESSAGE,"Finalizing host directory")
 	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR),copy)
+	$(Q)PARALLEL_JOBS=$(PARALLEL_JOBS) \
+		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
+		$(TOPDIR)/support/scripts/fix-rpath host
+	$(Q)PARALLEL_JOBS=$(PARALLEL_JOBS) \
+		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
+		$(TOPDIR)/support/scripts/fix-rpath staging
+	$(call ppd-fixup-paths,$(BASE_DIR))
 
 .PHONY: staging-finalize
 staging-finalize: $(STAGING_DIR_SYMLINK)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
