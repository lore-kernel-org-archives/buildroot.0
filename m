Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D024C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:45:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4503060555
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4503060555
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A6EC4254B;
	Sat,  4 Sep 2021 18:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7CaXAaX3_g9; Sat,  4 Sep 2021 18:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400AC42530;
	Sat,  4 Sep 2021 18:44:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12F6F1BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A2B340276
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2OFU2Y0PoSUg for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B9CD402AE
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0F1FD8834C; Sat,  4 Sep 2021 18:23:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 16:44:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afde8fb8f36267e7b025c26e700f76e9bb75706f
X-Git-Newrev: 6c1d9995b5c418080db2b18208a9823b9826aa0f
X-Patchwork-Hint: ignore
Message-Id: <20210904182356.0F1FD8834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: move python fixup
 to generic package infrastructure
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6c1d9995b5c418080db2b18208a9823b9826aa0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixing _sysconfigdata*.{py,pyc} was previously done by python package
infrastructure. Some packages use python stuff without using python
package infrastructure.
These packages perform overwrites and need the specific python fixup
to fix them.

In order to be sure to fix all of these packages, the python fixup
is moved to the generic package infrastructure and applied to all
packages.
This follows the same principle as for the .la libtool files fixup.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 27 ++++++++++++++++++++++++++-
 package/pkg-python.mk  | 26 --------------------------
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 97ee204b80..ded5176428 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -103,6 +103,30 @@ define fixup-libtool-files
 endef
 endif
 
+# Make sure python _sysconfigdata*.py files only reference the current
+# per-package directory.
+#
+# Can't use $(foreach d, $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*, ...)
+# because those directories may be created in the same recipe this macro will
+# be expanded in.
+# Additionally, either or both may be missing, which would make find whine and
+# fail.
+# So we just use HOST_DIR as a starting point, and filter on the two directories
+# of interest.
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define FIXUP_PYTHON_SYSCONFIGDATA
+	$(Q)find $(HOST_DIR) \
+		\(    -path '$(HOST_DIR)/lib/python*' \
+		   -o -path '$(STAGING_DIR)/usr/lib/python*' \
+		\) \
+		\(    \( -name "_sysconfigdata*.pyc" -delete \) \
+		   -o \( -name "_sysconfigdata*.py" -print0 \) \
+		\) \
+	| xargs -0 --no-run-if-empty \
+		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
+endef
+endif
+
 # Functions to collect statistics about installed files
 
 # $(1): base directory to search in
@@ -836,7 +860,8 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
-$(2)_POST_PREPARE_HOOKS         ?=
+
+$(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index ddf9e733fd..e6b81bdfd3 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -92,30 +92,6 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--root=/ \
 	--single-version-externally-managed
 
-# Make sure python _sysconfigdata*.py files only reference the current
-# per-package directory.
-#
-# Can't use $(foreach d, $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*, ...)
-# because those directories may be created in the same recipe this macro will
-# be expanded in.
-# Additionally, either or both may be missing, which would make find whine and
-# fail.
-# So we just use HOST_DIR as a starting point, and filter on the two directories
-# of interest.
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define PKG_PYTHON_FIXUP_SYSCONFIGDATA
-	$(Q)find $(HOST_DIR) \
-		\(    -path '$(HOST_DIR)/lib/python*' \
-		   -o -path '$(STAGING_DIR)/usr/lib/python*' \
-		\) \
-		\(    \( -name "_sysconfigdata*.pyc" -delete \) \
-		   -o \( -name "_sysconfigdata*.py" -print0 \) \
-		\) \
-	| xargs -0 --no-run-if-empty \
-		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
-endef
-endif
-
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -260,8 +236,6 @@ $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/$$($(2)_NEEDS_HOST_PYTHON)
 endif
 endif
 
-$(2)_PRE_CONFIGURE_HOOKS += PKG_PYTHON_FIXUP_SYSCONFIGDATA
-
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
