Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71F7C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:46:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E13A60725
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E13A60725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EEB04029D;
	Sat, 28 Aug 2021 14:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVKOyYPV-9Ch; Sat, 28 Aug 2021 14:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF12407DC;
	Sat, 28 Aug 2021 14:46:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22BCF1BF37B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E3BF4012E
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3GdNLVyaEf1 for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 14:45:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8876A40019
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 14:45:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E629C840AF; Sat, 28 Aug 2021 14:44:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 16:43:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0fe536b797cc0ae11bd54ed7046cd39b73780c18
X-Git-Newrev: a4f83d39cf4bb4dd155b8f79d13b4349dd103c49
X-Patchwork-Hint: ignore
Message-Id: <20210828144453.E629C840AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-python: fix
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a4f83d39cf4bb4dd155b8f79d13b4349dd103c49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Find used by PKG_PYTHON_FIXUP_SYSCONFIGDATA can fail if directories
are not present. This failure is silently ignored because find is
on the LHS of a pipe.

This commit fixes the find failure. HOST_DIR is used as the starting
point and the search is filtered on the expected directories.

This commit also adds -print0 and the $(Q) verbosity flag as minor
changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
[yann.morin.1998@free.fr:
  - split long line with the two -path options
  - move "| xargs ..." onto its own line
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 59a48e5a87..8b24aeb3b1 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -92,11 +92,25 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
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
+		\(    -path '$(HOST_DIR)/lib/python*' \
+		   -o -path '$(STAGING_DIR)/usr/lib/python*' \
+		\) \
+		-name "_sysconfigdata*.py" -print0 \
+	| xargs -0 --no-run-if-empty \
+		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
