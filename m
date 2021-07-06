Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61747C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:23:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D21560F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D21560F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDE77404BF;
	Tue,  3 Aug 2021 23:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGLPFD5mLAaO; Tue,  3 Aug 2021 23:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB568404A8;
	Tue,  3 Aug 2021 23:22:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36C3B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3496240E7F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9AHLtp3Jw6k2 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBBC9406B0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4FA4787F55; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Jul 2021 22:45:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b7c8cc67280c3ee8ec79d4e381519b18386bd8c
X-Git-Newrev: d8898380984ff93c6064d971ba9282a5d1c0e81f
X-Patchwork-Hint: ignore
Message-Id: <20210803211000.4FA4787F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-generic.mk: Remove
 Info documents dir entry
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d8898380984ff93c6064d971ba9282a5d1c0e81f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some packages (autotools for instance) install documentation
files using install-info. This program adds an entry in
the Info directory file (share/info/dir) and this causes
TARGET_DIR and/or HOST_DIR overwrite.

In order to avoid this overwrite this patch removes the Info
directory file right after any installation.

In order to be as generic as possible, this patch introduces
a new tooling to remove useless and conflicting files based
on the file and/or directory list <PKG>_DROP_FILES_OR_DIRS.
share/info/dir file is added for every packages in this list.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
[yann.morin.1998@free.fr:
  - don't expand when nothing to remove
  - do not add '/' between $(1) and % as files' paths are
    already absolute
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 45589bcbb4..7afcd05de9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -135,6 +135,23 @@ define check_bin_arch
 		-a $(BR2_READELF_ARCH_NAME)
 endef
 
+# Functions to remove conflicting and useless files
+
+# $1: base directory (target, staging, host)
+define remove-conflicting-useless-files
+	$(if $(strip $($(PKG)_DROP_FILES_OR_DIRS)),
+		$(Q)$(RM) -rf $(patsubst %, $(1)%, $($(PKG)_DROP_FILES_OR_DIRS)))
+endef
+define REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
+	$(call remove-conflicting-useless-files,$(HOST_DIR))
+endef
+define REMOVE_CONFLICTING_USELESS_FILES_IN_STAGING
+	$(call remove-conflicting-useless-files,$(STAGING_DIR))
+endef
+define REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET
+	$(call remove-conflicting-useless-files,$(TARGET_DIR))
+endef
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
@@ -823,6 +840,16 @@ $$(error "Package $(1) defines host variant before target variant!")
 endif
 endif
 
+# Globaly remove following conflicting and useless files
+$(2)_DROP_FILES_OR_DIRS += /share/info/dir
+
+ifeq ($$($(2)_TYPE),host)
+$(2)_POST_INSTALL_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
+else
+$(2)_POST_INSTALL_STAGING_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_STAGING
+$(2)_POST_INSTALL_TARGET_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET
+endif
+
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
 $(1)-install:		$$($(2)_TARGET_INSTALL)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
