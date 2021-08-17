Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC45C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:42:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28C0C60F39
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28C0C60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01F2840533;
	Tue, 17 Aug 2021 08:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BThueMiIeE5R; Tue, 17 Aug 2021 08:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A96D40539;
	Tue, 17 Aug 2021 08:42:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D0F61BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F114081024
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEwXxGvN2T23 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:40:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BF3781008
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:40:27 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id AB2AD1BF203;
 Tue, 17 Aug 2021 08:40:25 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:30 +0200
Message-Id: <20210817083930.3718711-17-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 16/16] package/pkg-generic.mk: move
 fixup-libtool-files to post-prepare hook
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

This commit moves fixup-libtool-files to the post-prepare hook
infrastructure.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
New patch in this v3 series.

This modification was mentionned in the previous review
https://lore.kernel.org/buildroot/20210625092704.GJ2852@scaer/

 package/pkg-generic.mk | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index bb9f395f27..d8ca8aaf31 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -92,14 +92,19 @@ endif
 
 # Make sure .la files only reference the current per-package
 # directory.
-
-# $1: package name (lower case)
-# $2: staging directory of the package
+#
+# Can't use $(foreach d, $(HOST_DIR)/lib* $(STAGING_DIR)/usr/lib*, ...)
+# because those directories may be created in the same recipe this macro will
+# be expanded in.
+# Additionally, either or both may be missing, which would make find whine and
+# fail.
+# So we just use HOST_DIR as a starting point, and filter on the two directories
+# of interest.
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define fixup-libtool-files
-	$(Q)find $(2) \( -path '$(2)/lib*' -o -path '$(2)/usr/lib*' \) \
+define FIXUP_LIBTOOL_FILES
+	$(Q)find $(HOST_DIR) \( -path '$(HOST_DIR)/lib*' -o -path '$(STAGING_DIR)/usr/lib*' \) \
 		-name "*.la" -print0 | xargs -0 --no-run-if-empty \
-		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g"
+		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g"
 endef
 endif
 
@@ -226,8 +231,6 @@ define prepare-pre-configure
 	@$(call pkg_size_before,$(TARGET_DIR))
 	@$(call pkg_size_before,$(STAGING_DIR),-staging)
 	@$(call pkg_size_before,$(HOST_DIR),-host)
-	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
-	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
 	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
@@ -923,6 +926,7 @@ $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
 
+$(2)_POST_PREPARE_HOOKS += FIXUP_LIBTOOL_FILES
 $(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
 
 ifeq ($$($(2)_TYPE),target)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
