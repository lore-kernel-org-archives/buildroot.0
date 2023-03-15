Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EAAC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 14:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 129DA40B5C;
	Wed, 15 Mar 2023 14:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 129DA40B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2g952yx4F5v; Wed, 15 Mar 2023 14:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48EC140BA8;
	Wed, 15 Mar 2023 14:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48EC140BA8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A01371BF3C5
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79E7E4183F
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E7E4183F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZK3WZXrZggQ for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 14:10:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70A704183B
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 14:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70A704183B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DDA6873F6; Wed, 15 Mar 2023 14:10:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 15:08:11 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f953a186d160ff80e2bcb979db53b55b373454f1
X-Git-Newrev: 0a23e43132425bf67137e3e0128fe80a58db1046
X-Patchwork-Hint: ignore
Message-Id: <20230315141044.5DDA6873F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/opus: force arm
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a23e43132425bf67137e3e0128fe80a58db1046
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure:

/tmp/cckXvlOO.s:352: Error: selected processor does not support `smull r6,ip,r5,r0' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/fdedcc8f68651ec34417d609b40effbac456c80d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: tweak comment]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 90e1a64cb0abff65bc2a3e8ba811c732d820a910)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 2fa929c7df..d8e0623e15 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -12,6 +12,13 @@ OPUS_INSTALL_STAGING = YES
 
 OPUS_CFLAGS = $(TARGET_CFLAGS)
 
+# opus has ARM assembly optimizations not compatible with thumb1:
+# Error: selected processor does not support `smull r6,ip,r5,r0' in Thumb mode
+# so force ARM mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+OPUS_CFLAGS += -marm
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 OPUS_CFLAGS += -O0
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
