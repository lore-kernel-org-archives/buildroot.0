Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BECC2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 06:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92D32414CC;
	Tue, 16 Aug 2022 06:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92D32414CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f20IkSLLDUY9; Tue, 16 Aug 2022 06:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35592414C9;
	Tue, 16 Aug 2022 06:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35592414C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20F431BF2B8
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 06:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1A80405F6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 06:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1A80405F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cyOVWjDb4wYm for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 06:43:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4370840278
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 06:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4370840278
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 458B287709; Tue, 16 Aug 2022 06:28:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 08:41:34 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9007b94e2bc987e86a637345c3293c6974e17e5a
X-Git-Newrev: ad6ba8d60d0e5d3b6e7024f75afaf6637d34cfd0
X-Patchwork-Hint: ignore
Message-Id: <20220816062856.458B287709@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pimd: fix static
 build with uclibc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ad6ba8d60d0e5d3b6e7024f75afaf6637d34cfd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Pass LDFLAGS (which will contain -static) to fix the following static
build failure with uclibc:

/nvmedata/autobuild/instance-15/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-15/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_FDE':
/nvmedata/autobuild/instance-15/output-1/build/host-gcc-final-10.3.0/build/sparc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469: undefined reference to `dl_iterate_phdr'

Fixes:
 - http://autobuild.buildroot.org/results/168202f65d168acc55b4d946c2e2416bf890c32c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7b29d6dc77304db19a4a6cb82f05d30ab68abf78)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pimd/pimd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pimd/pimd.mk b/package/pimd/pimd.mk
index 7a12f8fe0d..8abfbd5644 100644
--- a/package/pimd/pimd.mk
+++ b/package/pimd/pimd.mk
@@ -26,7 +26,7 @@ endef
 
 define PIMD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CROSS=$(TARGET_CROSS) \
-		CC=$(TARGET_CC) -C $(@D)
+		CC=$(TARGET_CC) LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef
 
 define PIMD_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
