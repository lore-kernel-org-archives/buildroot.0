Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2631FC2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 06:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3A9340614;
	Tue, 16 Aug 2022 06:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3A9340614
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4UR8qa0EuMu; Tue, 16 Aug 2022 06:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADF71405F6;
	Tue, 16 Aug 2022 06:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADF71405F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48A351BF2B8
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 06:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3196E8183D
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 06:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3196E8183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KOoDc7w3SCzf for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 06:43:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 814B9817B3
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 06:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 814B9817B3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8243A876F4; Tue, 16 Aug 2022 06:28:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 08:41:19 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6a7e7e2016c75c196a0023bc9f2df08ec97ee043
X-Git-Newrev: 1e2d8041e1e655bf67d90f61ba900a6eeea65aa7
X-Patchwork-Hint: ignore
Message-Id: <20220816062850.8243A876F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/pimd: fix static
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e2d8041e1e655bf67d90f61ba900a6eeea65aa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
