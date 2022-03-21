Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5B4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD0260FBA;
	Mon, 21 Mar 2022 21:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Un1ewq3_PxKF; Mon, 21 Mar 2022 21:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62DA260FB2;
	Mon, 21 Mar 2022 21:19:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DFD41BF9AA
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBED040A6A
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_-vc27AKOG2 for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:18:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF05A40A8A
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:18:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8695784EA5; Mon, 21 Mar 2022 21:09:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 22:15:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33413b7e5326591dbfc29050a0d1136dcae868c7
X-Git-Newrev: 5a4f6c497a5f90833509096ddd520037cede7272
X-Patchwork-Hint: ignore
Message-Id: <20220321210932.8695784EA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tree: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a4f6c497a5f90833509096ddd520037cede7272
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 2.0.2 in commit 11a3989dbf7ac2535fac04b24ab3d959da3686b3:

color.c: In function 'parse_dir_colors':
color.c:103:11: error: redeclaration of 'i' with no linkage
   for(int i=0; i < DOT_EXTENSION; i++) color_code[i] = NULL;
           ^

Fixes:
 - http://autobuild.buildroot.org/results/e05595696727622eaf517944d4ff4414baf66bb2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tree/tree.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index 7c111b47d2..da0acbae49 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -11,7 +11,8 @@ TREE_LICENSE = GPL-2.0+
 TREE_LICENSE_FILES = LICENSE
 
 define TREE_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=c99" \
+		-C $(@D)
 endef
 
 define TREE_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
