Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB8BC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:18:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AABE160F37
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AABE160F37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62681606E8;
	Sun, 25 Jul 2021 16:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jLnStZ-sbdjP; Sun, 25 Jul 2021 16:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B868E60670;
	Sun, 25 Jul 2021 16:18:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79E0B1BF2B4
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 696C660670
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uge75XfM4X37 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 16:18:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 613C560612
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 16:18:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 89F9588F0D; Sun, 25 Jul 2021 15:43:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 18:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7d79731d1c79bf53577f88b4620627045880de1
X-Git-Newrev: b500d4731a66fa15dab4d2a10ea053d143421a56
X-Patchwork-Hint: ignore
Message-Id: <20210725154354.89F9588F0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: update lib{mtd,ubi}.h path
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

commit: https://git.buildroot.net/buildroot/commit/?id=b500d4731a66fa15dab4d2a10ea053d143421a56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update lib{mtd,ubi}.h path to fix the following build failure raised
since bump of swupdate to version 2021.04 in commit
2c6b0359c3b819fadb4437b2d780e95c32fdab21:

In file included from corelib/mtd-interface.c:21:
include/flash.h:13:10: fatal error: libmtd.h: No such file or directory
   13 | #include <libmtd.h>
      |          ^~~~~~~~~~

This build failure is raised because of
https://github.com/sbabic/swupdate/commit/0c672866d4a9fe8f0808b5d8a0afb95c13c4c138

Fixes:
 - http://autobuild.buildroot.org/results/d475bdb341d2afecf12e404dfa093e58221b9882

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mtd/mtd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 121dfa554b..189736b877 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -124,8 +124,8 @@ endef
 # Those libraries are not installed by "make install", but are needed
 # by other packages, such as swupdate.
 define MTD_INSTALL_LIBS
-	$(INSTALL) -D -m 0755 $(@D)/include/libmtd.h $(STAGING_DIR)/usr/include/mtd/libmtd.h
-	$(INSTALL) -D -m 0755 $(@D)/include/libubi.h $(STAGING_DIR)/usr/include/mtd/libubi.h
+	$(INSTALL) -D -m 0755 $(@D)/include/libmtd.h $(STAGING_DIR)/usr/include/libmtd.h
+	$(INSTALL) -D -m 0755 $(@D)/include/libubi.h $(STAGING_DIR)/usr/include/libubi.h
 	$(INSTALL) -D -m 0755 $(@D)/include/mtd/ubi-media.h $(STAGING_DIR)/usr/include/mtd/ubi-media.h
 	$(INSTALL) -D -m 0755 $(@D)/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
 	$(INSTALL) -D -m 0755 $(@D)/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
