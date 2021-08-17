Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587BFC432BE
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:41:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA8660EFE
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AA8660EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0495A4052F;
	Tue, 17 Aug 2021 08:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nc_uxTqLcikQ; Tue, 17 Aug 2021 08:41:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624A6404EF;
	Tue, 17 Aug 2021 08:41:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A62DB1BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 965F240259
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FDYUBPAzdxEr for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:39:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AE07401EF
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:39:54 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id 3FF721BF20A;
 Tue, 17 Aug 2021 08:39:52 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:21 +0200
Message-Id: <20210817083930.3718711-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 07/16] package/pkg-generic.mk: detect files
 overwritten in TARGET_DIR and HOST_DIR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Without per-package directory support, a package can happily overwrite
files installed by other packages. Indeed, because the build order
between packages is always guaranteed, Buildroot will always produce
the same output.

However, with per-package directory support, it is absolutely critical
that a given package does not overwrite files already installed by
another package, due to how the final aggregation is done to create
the complete target/, staging/ and host/ folders. Unfortunately, we
currently don't have anything in Buildroot that detects this
situation.

We used to have check-uniq-files, but it was dropped in commit
2496189a4207173e4cd5bbab90256f911175ee57.

This commit is a new implementation of such a detection, which is
based on calculating and verifying MD5 hashes of installed files: the
calculation is done at the beginning of the configure step, the
verification during the newly introduced "install" step that takes
place after all installation steps.

Since preventing file overwrites is really only needed when
per-package directory support is used, and due to this verification
having some overhead, it is only enabled when
BR2_PER_PACKAGE_DIRECTORIES=y. This additional verification cost is
however not too bad as on average, with per-package directory support,
the per-package target/ and host/ directories will contain less files
than with a build that doesn't use per-package directory support. This
helps a bit in mitigating the additional cost of this verification.

Note that we are not handling separately HOST_DIR and STAGING_DIR,
like we're doing with the pkg_size_{before,after} functions. Instead,
the verification on HOST_DIR walks down into the STAGING_DIR.

During per-package build, original files are modified by
fixup-libtool-files and fixup-python-files calls.
But since these fixups modify files using sed --in-place, these
modifications are done using a temporary file and a call to rename.
Rename breaks the hardlink to the original file and leave the temporary
file in per-package TARGET dir.
As the original file is not modified, this is no longer considered as
an overwrite. This patch simply considers that what is done by
fixup-libtool-files and fixup-python-files is part of the original
snapshot used to detect overwrites. And so, the original snapshot is
taken after fixup-libtool-files and fixup-python-files calls.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
This commit is retreived from Thomas's work.
The first version was discussed
https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-9-thomas.petazzoni@bootlin.com/
This new version was not already submitted by Thomas or I missed it.
Compared to the first version, this patch has an improved commit message and
generates the md5sum snapshot using
 'LC_ALL=C find $(1) -type f -print0 | xargs -0 -r md5sum > $($(PKG)_DIR)/.files$(2).md5;'
instead of
 'cd $(1); LC_ALL=C find . -type f -exec md5sum {} \; > $($(PKG)_DIR)/.files$(2).md5'

Changes v1 to v2:
 - Added note about why fixup-{libtool,python}-files are not considered overwrites
   and so take the overwrite snapshot after fixup-{libtool,python}-files call.
 - Removed 'LC_ALL=C'

Changes v2 to v3:
None

 package/pkg-generic.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 38381d93b5..414862e267 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -124,6 +124,25 @@ define FIXUP_PYTHON_SYSCONFIGDATA
 endef
 endif
 
+# Functions to detect overwritten files
+
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+# $(1): base directory to search in
+# $(2): suffix of file (optional)
+define pkg_detect_overwrite_before
+	find $(1) -type f -print0 | xargs -0 -r md5sum > $($(PKG)_DIR)/.files$(2).md5;
+endef
+
+# $(1): base directory to search in
+# $(2): suffix of file (optional)
+define pkg_detect_overwrite_after
+	if test -s $($(PKG)_DIR)/.files$(2).md5 ; then \
+		md5sum --quiet -c $($(PKG)_DIR)/.files$(2).md5 || \
+		{ echo "ERROR: package $($(PKG)_NAME) has overwritten files installed by a previous package, aborting."; exit 1; } ; \
+	fi
+endef
+endif
+
 # Functions to collect statistics about installed files
 
 # $(1): base directory to search in
@@ -277,6 +296,8 @@ $(BUILD_DIR)/%/.stamp_configured:
 	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
+	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
+	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -401,6 +422,8 @@ $(BUILD_DIR)/%/.stamp_installed:
 	@$(call pkg_size_after,$(STAGING_DIR),-staging)
 	@$(call pkg_size_after,$(HOST_DIR),-host)
 	@$(call check_bin_arch)
+	@$(call pkg_detect_overwrite_after,$(TARGET_DIR))
+	@$(call pkg_detect_overwrite_after,$(HOST_DIR),-host)
 	$(Q)touch $@
 
 # Remove package sources
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
