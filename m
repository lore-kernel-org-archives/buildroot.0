Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C85C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3488C40346;
	Thu, 29 Dec 2022 09:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3488C40346
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fzvO6Oadpej; Thu, 29 Dec 2022 09:34:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30133403F5;
	Thu, 29 Dec 2022 09:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30133403F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF2831BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B1D64058E
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B1D64058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ElCaGzf5INBq for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:34:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBEC44010F
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBEC44010F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA4888705E; Thu, 29 Dec 2022 09:34:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:32:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b86de52da2141ed289ad2892c34d3110d02f7b5
X-Git-Newrev: 3de4ae012141803bdf8abda12e27d10e55f6953f
X-Patchwork-Hint: ignore
Message-Id: <20221229093420.AA4888705E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xxhash: optimize XXHASH_{TARGETS,
 INSTALL_TARGETS}
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3de4ae012141803bdf8abda12e27d10e55f6953f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Optimize XXHASH_{TARGETS,INSTALL_TARGETS} as suggested by Thomas
Petazzoni in
https://patchwork.ozlabs.org/project/buildroot/patch/20221228221522.280696-1-fontaine.fabrice@gmail.com/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
