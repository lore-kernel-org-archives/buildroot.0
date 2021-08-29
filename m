Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D64C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:26:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 565A460E97
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 565A460E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B2FB40350;
	Sun, 29 Aug 2021 17:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jiUcdaaLkSoM; Sun, 29 Aug 2021 17:26:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A39954035A;
	Sun, 29 Aug 2021 17:26:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05BB31BF962
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9E2140350
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7t5FtQKko1B for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 17:25:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64A0140345
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 17:25:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 35AF48762A; Sun, 29 Aug 2021 17:24:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 19:20:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8dcd6ae36170282156e0522f9a1e9533d8c4c43d
X-Git-Newrev: 92207bc03f2358b28e0fd2cc3a41e40504b5d3d4
X-Patchwork-Hint: ignore
Message-Id: <20210829172427.35AF48762A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain: handle toolchains
 with multiple ld*.so.* files
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

commit: https://git.buildroot.net/buildroot/commit/?id=92207bc03f2358b28e0fd2cc3a41e40504b5d3d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some 3rd party vendor toolchains have multiple files which match
these glob patterns.  In this case, the shell script failed.
Switching to use find and xargs solves the issue.

Signed-off-by: Jonah Petri <jonah@petri.us>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/helpers.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index dfb2581ed5..1dfb52ac38 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -135,10 +135,8 @@ copy_toolchain_sysroot = \
 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
 		done ; \
 	fi ; \
-	if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
-		if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
-			cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
-		fi ; \
+	if [[ ! $$(find $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
+		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
 	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
