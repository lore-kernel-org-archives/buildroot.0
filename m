Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F4DC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 892F840275;
	Mon, 15 Aug 2022 19:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 892F840275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ymz-XquSjDXw; Mon, 15 Aug 2022 19:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB5E140207;
	Mon, 15 Aug 2022 19:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB5E140207
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 523BE1BF38D
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D71581753
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D71581753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rjjn9GLdpxCL for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:45:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72EDB81751
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 19:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72EDB81751
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7FA55876D2; Mon, 15 Aug 2022 19:31:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 21:44:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3b5e02c4958e11b28ee359f908cbf464b6964fff
X-Git-Newrev: 12d16f037b5e30ce2420df54245d9a47b90aabd1
X-Patchwork-Hint: ignore
Message-Id: <20220815193122.7FA55876D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lshw: add sqlite
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=12d16f037b5e30ce2420df54245d9a47b90aabd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lshw/lshw.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index bf286647b6..bde23d1499 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -22,6 +22,13 @@ LSHW_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	LIBS=$(TARGET_NLS_LIBS)
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+LSHW_DEPENDENCIES += host-pkgconf sqlite
+LSHW_MAKE_OPTS += SQLITE=1
+else
+LSHW_MAKE_OPTS += SQLITE=0
+endif
+
 define LSHW_BUILD_CMDS
 	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src \
 		$(LSHW_MAKE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
