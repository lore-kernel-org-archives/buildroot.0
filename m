Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A9ECDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CF4E81DEB;
	Sun, 15 Oct 2023 20:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CF4E81DEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7xsXqmlD6tWn; Sun, 15 Oct 2023 20:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02C0D81DFC;
	Sun, 15 Oct 2023 20:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02C0D81DFC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 183A91BF5A5
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F31F7611A9
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F31F7611A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gmZXUbGJgrAI for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:27:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB7F8611A8
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB7F8611A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D869F85B02; Sun, 15 Oct 2023 20:27:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:24:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0455f957a363e9b6a522a0f13b81715f27af11fe
X-Git-Newrev: 6480774c430227688119cac3935f23b624608824
X-Patchwork-Hint: ignore
Message-Id: <20231015202740.D869F85B02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic: drop support for
 arch-specific patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=6480774c430227688119cac3935f23b624608824
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last architecture-specific patch we had was removed 2015-02-14 with
commit 9863553fe8fa (packages: all salute the passing of avr32), where
we eventually got rid of the avr32-specific patch for fbv.

Since then, we've only had common patches (that apply systematically),
or conditional patches, that are applied in an ad-hoc manner with
post-patch hooks. Currently, we even only have one such patch (for
Linux).

Since we do not advertise that possibility in the manual, and since we
do not want to have such patches, drop the support for it.

This has the potential for breaking existing br2-external trees, but
there is a workaround for those: they can provide a pre-patch ook that
copies the necessary per-arch patches if needed. We document this in the
manual.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/migrating.adoc | 23 +++++++++++++++++++++++
 package/pkg-generic.mk     |  4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 2667aeab96..21277f947b 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -100,3 +100,26 @@ change implies that:
   to be updated appropriately;
 * the archive version suffix has been updated to +-br3+, so the hash
   files must be updated appropriately.
+
+Before Buildroot 2023.11, it was possible (but undocumented and unused)
+to apply architecture-specific patches, by prefixing the patch filename
+with the architecture, e.g. `0001-some-changes.patch.arm` and such a
+patch would only be applied for that architecture. With Buildroot 2023.11,
+this is no longer supported, and such patches are now longer applied at
+all.
+
+If you still need per-architecture patches, then you may provide a
+xref:hooks[pre-patch hook] that copies the patches applicable to the
+configured architecture, e.g.:
+
+----
+define LIBFOO_ARCH_PATCHES
+    $(foreach p,$(wildcard $(LIBFOO_PKGDIR)/*.patch.$(ARCH)), \
+        cp -f $(p) $(patsubst %.$(ARCH),%,$(p))
+    )
+endef
+LIBFOO_PRE_PATCH_HOOKS += LIBFOO_ARCH_PATCHES
+----
+
+Note that no package in Buildroot has architecture-specific patches, and
+that such patches will most probably not be accepted.
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e140145ee3..289fa552b4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -242,9 +242,9 @@ $(BUILD_DIR)/%/.stamp_patched:
 	for D in $(PATCH_BASE_DIRS); do \
 	  if test -d $${D}; then \
 	    if test -d $${D}/$($(PKG)_VERSION); then \
-	      $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
+	      $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION) \*.patch || exit 1; \
 	    else \
-	      $(APPLY_PATCHES) $(@D) $${D} \*.patch \*.patch.$(ARCH) || exit 1; \
+	      $(APPLY_PATCHES) $(@D) $${D} \*.patch || exit 1; \
 	    fi; \
 	  fi; \
 	done; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
