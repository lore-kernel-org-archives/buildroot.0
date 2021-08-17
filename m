Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31467C432BE
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:40:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F155160EFE
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F155160EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF5B9404C4;
	Tue, 17 Aug 2021 08:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oo6SCuow3ptc; Tue, 17 Aug 2021 08:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB3C44025A;
	Tue, 17 Aug 2021 08:40:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 427A11BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2E09401F8
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evCL0QsU_sh9 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:39:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EF48401EF
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:39:47 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id 381A71BF208;
 Tue, 17 Aug 2021 08:39:45 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:17 +0200
Message-Id: <20210817083930.3718711-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 03/16] package/pkg-generic.mk: move python
 fixup to generic package infrastructure
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
---
Changes v1 to v2:
 - Used '... -print0 | xargs -0 -r ...' construction.
 - Used '-deleted' to remove files.

Changes v2 to v3:
 - Used find syntax discussed in the previous review.
   https://lore.kernel.org/buildroot/20210709084820.37830e5f@bootlin.com/

 package/pkg-generic.mk | 24 +++++++++++++++++++++++-
 package/pkg-python.mk  | 23 -----------------------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 97ee204b80..38381d93b5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -103,6 +103,27 @@ define fixup-libtool-files
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
+		\( -path '$(HOST_DIR)/lib/python*' -o -path '$(STAGING_DIR)/usr/lib/python*' \) \
+		\(    \( -name "_sysconfigdata*.pyc" -delete \) \
+		   -o \( -name "_sysconfigdata*.py" -print0 \) \) \
+	| xargs -0 --no-run-if-empty \
+	$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
+endef
+endif
+
 # Functions to collect statistics about installed files
 
 # $(1): base directory to search in
@@ -836,7 +857,8 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
-$(2)_POST_PREPARE_HOOKS         ?=
+
+$(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 0f65bd0f75..e6b81bdfd3 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -92,27 +92,6 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
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
-		\( -path '$(HOST_DIR)/lib/python*' -o -path '$(STAGING_DIR)/usr/lib/python*' \) \
-		\(    \( -name "_sysconfigdata*.pyc" -delete \) \
-		   -o \( -name "_sysconfigdata*.py" -print0 \) \) \
-		| xargs -0 --no-run-if-empty \
-		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
-endef
-endif
-
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -257,8 +236,6 @@ $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/$$($(2)_NEEDS_HOST_PYTHON)
 endif
 endif
 
-$(2)_PRE_CONFIGURE_HOOKS += PKG_PYTHON_FIXUP_SYSCONFIGDATA
-
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
