Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE47C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C1DA4188C;
	Wed, 30 Aug 2023 22:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C1DA4188C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4O-AqLYNDNV; Wed, 30 Aug 2023 22:32:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59C024187E;
	Wed, 30 Aug 2023 22:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59C024187E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04DEB1BF980
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA0AD402EB
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA0AD402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U6nb5UGszVv3 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 384DD41813
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 384DD41813
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 283EE866BF; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 00:28:05 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 67564d1da2fa738c7d683e0f7cee725b75518aed
X-Git-Newrev: fbc2e83d41c3f1aa723f68c9926311db0a4ed22f
X-Patchwork-Hint: ignore
Message-Id: <20230830223119.283EE866BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/cmocka: fix build
 on Thumb classic configurations
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbc2e83d41c3f1aa723f68c9926311db0a4ed22f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

The cmocka package checks if a toolchain supports the
-fstack-clash-protection compiler flag, and if it does automatically
uses it. That flag is not supported by GCC for Thumb1 builds (at least
as of both GCC 11 and GCC 12). Let's tell cmocka about this by passing
-DWITH_STACK_CLASH_PROTECTION=OFF in this configuration, as suggested
by Arnout Vandecappelle.

Fixes:
http://autobuild.buildroot.net/results/4044b3a71d3130d934c7a7c0c5badfabb2a97030/

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
[Thomas: change the initial patch from Joel to use the suggestion from
Arnout]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5622c76bf42fd29f8dfc231d0fccb623960b3542)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmocka/cmocka.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index eafb4898e1..297f95f465 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -21,4 +21,9 @@ ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 CMOCKA_CONF_OPTS += -DWITH_STATIC_LIB=ON
 endif
 
+# gcc for ARM Thumb1 doesn't implement -fstack-clash-protection
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+CMOCKA_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
