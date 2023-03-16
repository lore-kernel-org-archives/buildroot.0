Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1ABC74A5B
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 21:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDD674015F;
	Thu, 16 Mar 2023 21:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDD674015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wOmmVX7U24f0; Thu, 16 Mar 2023 21:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D771C41B6F;
	Thu, 16 Mar 2023 21:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D771C41B6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25DAB1BF31B
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE628820C1
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE628820C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54CaGwaVq-A2 for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 21:36:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FA75820CB
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 21:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FA75820CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CFFE87495; Thu, 16 Mar 2023 21:36:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 22:32:48 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d407399dd7d1854d20bd3e1a6a143c4e1443e8d2
X-Git-Newrev: 160828f4431eafde024aed85a30efd7960513f98
X-Patchwork-Hint: ignore
Message-Id: <20230316213654.0CFFE87495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libev: force arm
 mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=160828f4431eafde024aed85a30efd7960513f98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure:

/tmp/ccHc3Awn.s:825: Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/1c597c9da724d6cac06b09b1ecd456a28440a3a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 964254bfd99a5bb7c405a03bdd165f11ddc36f4a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libev/libev.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 9f3c19d46c..cbd5433d76 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -10,6 +10,13 @@ LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
 LIBEV_LICENSE_FILES = LICENSE
 
+# libev has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 # The 'compatibility' event.h header conflicts with libevent
 # It's completely unnecessary for BR packages so remove it
 define LIBEV_DISABLE_EVENT_H_INSTALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
