Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A6DC47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 21:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABF7F40502;
	Fri, 26 Jan 2024 21:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF7F40502
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVnz9MRnV2X5; Fri, 26 Jan 2024 21:33:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B71064018F;
	Fri, 26 Jan 2024 21:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B71064018F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EFE01BF2EC
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17D704212A
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17D704212A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68_ojlsBtMeS for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 21:33:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CF594210D
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 21:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CF594210D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DE32865B3; Fri, 26 Jan 2024 21:33:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 22:33:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40f7130a671ad5fc15628d9ecf852ece12d013da
X-Git-Newrev: a33827760823b1455326e0fc8cf6089a3081e782
X-Patchwork-Hint: ignore
Message-Id: <20240126213347.1DE32865B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/faad2: force arm mode instead of
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

commit: https://git.buildroot.net/buildroot/commit/?id=a33827760823b1455326e0fc8cf6089a3081e782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure in Thumb mode:

/tmp/ccfzn6FH.s:36: Error: selected processor does not support `smull r2,r3,r1,r0' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/838808b4751244ee01cde6b8261212b49e511a32

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: reword comment slightly]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/faad2/faad2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 686e5045c0..0b249b3450 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -12,4 +12,11 @@ FAAD2_CPE_ID_VENDOR = audiocoding
 FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
 FAAD2_INSTALL_STAGING = YES
 
+# faad2 contains assembly routines using ARM instructions not present in thumb1 mode:
+# Error: selected processor does not support `smull r2,r3,r1,r0' in Thumb mode
+# so force ARM mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+FAAD2_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
