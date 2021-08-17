Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4D8C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:40:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0236D60EFE
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0236D60EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE22480C2B;
	Tue, 17 Aug 2021 08:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9Ghgj3FKtno; Tue, 17 Aug 2021 08:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C9980E5A;
	Tue, 17 Aug 2021 08:39:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BDE21BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B9D6607FC
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5j7avBzarFce for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:39:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8744607F8
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:39:41 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id EF2B41BF20A;
 Tue, 17 Aug 2021 08:39:38 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:15 +0200
Message-Id: <20210817083930.3718711-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 01/16] package/pkg-python: fix
 PKG_PYTHON_FIXUP_SYSCONFIGDATA
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

Find used by PKG_PYTHON_FIXUP_SYSCONFIGDATA can fail if directories
are not present. This failure is silently ignored because find is
on the LHS of a pipe.

This commit fixes the find failure. HOST_DIR is used as the starting
point and the search is filtered on the expected directories.

This commit also adds -print0 and the $(Q) verbosity flag as minor
changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---

New patch in this v3 series.

The find failure was highlighted in 836528f03eb89fdc64432f7a7470145ddf553b8c
and reverted in b928074e2d83f5b873bf1ba381b212dfad9bf207.

 package/pkg-python.mk | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 59a48e5a87..cd48402e02 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -92,11 +92,22 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--root=/ \
 	--single-version-externally-managed
 
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
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define PKG_PYTHON_FIXUP_SYSCONFIGDATA
-	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
-		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
-		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g"
+	$(Q)find $(HOST_DIR) \
+		\( -path '$(HOST_DIR)/lib/python*' -o -path '$(STAGING_DIR)/usr/lib/python*' \) \
+		-name "_sysconfigdata*.py" -print0 | xargs -0 --no-run-if-empty \
+		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
 endef
 endif
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
