Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140EBC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:36:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D809960EAF
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D809960EAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F86A40790;
	Thu, 26 Aug 2021 22:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAyrHS0t0wEv; Thu, 26 Aug 2021 22:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02E78407B3;
	Thu, 26 Aug 2021 22:36:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3A861BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7952407C3
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9cL1fYR7nVp for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76F1F407D9
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CB4748DC50; Thu, 26 Aug 2021 22:01:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 25 Aug 2021 21:50:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a223dd4aef256bf1c63881353399e4a18f7c43bc
X-Git-Newrev: 6f911a17257d945eb3cb5c9c9a966f0e5fca0842
X-Patchwork-Hint: ignore
Message-Id: <20210826220133.CB4748DC50@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f911a17257d945eb3cb5c9c9a966f0e5fca0842
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
index dfb2581ed5..5ed149d57d 100644
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
+       if ! find -wholename $(STAGING_DIR)'/lib/ld*.so.*' > /dev/null; then \
+               find -wholename $${ARCH_SYSROOT_DIR}'/lib/ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
 	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
