Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3339C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1E1416C5;
	Thu,  3 Nov 2022 14:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E1E1416C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zia1eCyAvlhJ; Thu,  3 Nov 2022 14:11:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF45441682;
	Thu,  3 Nov 2022 14:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF45441682
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0801A1BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E209941682
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E209941682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dLkrNPLDPya for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:11:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE3DB408CB
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE3DB408CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B768C87B80; Thu,  3 Nov 2022 14:11:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 14:48:40 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 88ca169d15af5330490faddf37e564001c375898
X-Git-Newrev: 9bb4f83a08956ed0a038b53b3d4b3244ab974ee8
X-Patchwork-Hint: ignore
Message-Id: <20221103141137.B768C87B80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Makefile: really generate
 glibc locales in parallel
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

commit: https://git.buildroot.net/buildroot/commit/?id=9bb4f83a08956ed0a038b53b3d4b3244ab974ee8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

To generate the glibc locale data, we call into a recursive Makefile,
so as to generate locales in parallel. This is done as part of a
target-finalize hook.

However, that hook is registered after all packages have been parsed,
and as such, it maye be registered after hooks defined in packages.

Furthermore, the expansion of target-finalize hooks is done in a recipe,
so it is not easy to understand whether this generates a "simple" rule
or not.

As a consequence, despite the use of $(MAKE), make may not notice that
the command is a recursive call, and will decide to close the jobserver
file-descriptors, yielding warnings like:
    make[2]: warning: jobserver unavailable: using -j1.  Add '+' to
    parent make rule.

This causes the lcoale data to not be generated in parallel, which is
initially all the fuss about using a sub-makefile...

So, do as suggested, and prepend the hook with a '+', so that it is
explicit to make that it should not close its jobserver fds.

Fixes: 6fbdf5159607 (Makefile: Parallelize glibc locale generation)

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4164ed24f277b24096ab065aa85b7de9d0c80c02)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 93125e16a6..03f2154f9f 100644
--- a/Makefile
+++ b/Makefile
@@ -664,7 +664,7 @@ ifneq ($(GLIBC_GENERATE_LOCALES),)
 PACKAGES += host-localedef
 
 define GENERATE_GLIBC_LOCALES
-	$(MAKE) -f support/misc/gen-glibc-locales.mk \
+	+$(MAKE) -f support/misc/gen-glibc-locales.mk \
 		ENDIAN=$(call LOWERCASE,$(BR2_ENDIAN)) \
 		LOCALES="$(GLIBC_GENERATE_LOCALES)" \
 		Q=$(Q)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
