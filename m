Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670C0C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 19:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F37842F2;
	Fri, 21 Oct 2022 19:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F37842F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIKGe75-64OR; Fri, 21 Oct 2022 19:51:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D8D842E3;
	Fri, 21 Oct 2022 19:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D8D842E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 869591BF9BA
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6270660B35
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6270660B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CyGQgebEkmQB for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 19:51:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9220E607E3
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 19:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9220E607E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77ACB86F75; Fri, 21 Oct 2022 19:51:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 20:59:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c9ef36242341b5f8db171251d737d29fc376e0c
X-Git-Newrev: 4164ed24f277b24096ab065aa85b7de9d0c80c02
X-Patchwork-Hint: ignore
Message-Id: <20221021195123.77ACB86F75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: really generate glibc locales in
 parallel
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

commit: https://git.buildroot.net/buildroot/commit/?id=4164ed24f277b24096ab065aa85b7de9d0c80c02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ec7c034ac1..ededfa491d 100644
--- a/Makefile
+++ b/Makefile
@@ -653,7 +653,7 @@ ifneq ($(GLIBC_GENERATE_LOCALES),)
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
