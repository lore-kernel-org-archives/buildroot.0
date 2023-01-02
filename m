Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE24C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 16:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D636A400AA;
	Mon,  2 Jan 2023 16:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D636A400AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIiiDPXYGS41; Mon,  2 Jan 2023 16:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A85AB40056;
	Mon,  2 Jan 2023 16:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A85AB40056
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA7A81BF2EC
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 16:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0AD4416B4
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 16:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0AD4416B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_nZkSMDlZ_F for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3C42416B9
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C42416B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B8918711C; Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Jan 2023 17:56:05 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 3ce37efe7f8940ecb9410190c70e924e7ade03af
X-Git-Newrev: 7f1b0cd321a8294754a7193918aef48c27cbe216
X-Patchwork-Hint: ignore
Message-Id: <20230102165752.7B8918711C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/xxhash: optimize
 XXHASH_{TARGETS, INSTALL_TARGETS}
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f1b0cd321a8294754a7193918aef48c27cbe216
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Optimize XXHASH_{TARGETS,INSTALL_TARGETS} as suggested by Thomas
Petazzoni in
https://patchwork.ozlabs.org/project/buildroot/patch/20221228221522.280696-1-fontaine.fabrice@gmail.com/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3de4ae012141803bdf8abda12e27d10e55f6953f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xxhash/xxhash.mk | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 6932113f14..04bc98690f 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -10,28 +10,20 @@ XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
 XXHASH_LICENSE_FILES = LICENSE cli/COPYING
 XXHASH_INSTALL_STAGING = YES
 
-XXHASH_TARGETS = xxhsum
-XXHASH_INSTALL_TARGETS = install_xxhsum
-
-ifeq ($(BR2_STATIC_LIBS),y)
-XXHASH_TARGETS += libxxhash.a libxxhash.pc
-XXHASH_INSTALL_TARGETS += \
-	install_libxxhash.a \
-	install_libxxhash.includes \
-	install_libxxhash.pc
-else ifeq ($(BR2_SHARED_LIBS),y)
-XXHASH_TARGETS += libxxhash libxxhash.pc
-XXHASH_INSTALL_TARGETS += \
-	install_libxxhash \
-	install_libxxhash.includes \
-	install_libxxhash.pc
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-XXHASH_TARGETS += libxxhash.a libxxhash libxxhash.pc
-XXHASH_INSTALL_TARGETS += \
-	install_libxxhash.a \
-	install_libxxhash \
+XXHASH_TARGETS = xxhsum libxxhash.pc
+XXHASH_INSTALL_TARGETS = \
 	install_libxxhash.includes \
-	install_libxxhash.pc
+	install_libxxhash.pc \
+	install_xxhsum
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+XXHASH_TARGETS += libxxhash.a
+XXHASH_INSTALL_TARGETS += install_libxxhash.a
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+XXHASH_TARGETS += libxxhash
+XXHASH_INSTALL_TARGETS += install_libxxhash
 endif
 
 define XXHASH_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
