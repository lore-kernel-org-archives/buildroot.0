Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D032AC61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 858FB60E66;
	Sun,  5 Mar 2023 18:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 858FB60E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QVD6MaPOwNyR; Sun,  5 Mar 2023 18:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDC9C60FCA;
	Sun,  5 Mar 2023 18:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDC9C60FCA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC7C81BF3DA
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5A70400F3
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5A70400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjxO82D4Pky0 for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:28:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F128740949
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F128740949
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC2DA866ED; Sun,  5 Mar 2023 18:28:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 19:26:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f931ac28192b59fce36e5e63bb5770b598d26def
X-Git-Newrev: 90e1a64cb0abff65bc2a3e8ba811c732d820a910
X-Patchwork-Hint: ignore
Message-Id: <20230305182821.DC2DA866ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opus: force arm mode instead of
 Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=90e1a64cb0abff65bc2a3e8ba811c732d820a910
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure:

/tmp/cckXvlOO.s:352: Error: selected processor does not support `smull r6,ip,r5,r0' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/fdedcc8f68651ec34417d609b40effbac456c80d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: tweak comment]
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
