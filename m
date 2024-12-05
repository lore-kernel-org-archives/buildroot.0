Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428BAE7716D
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 15:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB58881EA6;
	Thu,  5 Dec 2024 15:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBTYxfmQw1Wg; Thu,  5 Dec 2024 15:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAFF782078
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAFF782078;
	Thu,  5 Dec 2024 15:51:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A909EAE8
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89F0B4152D
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqohuY9GCe9b for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 15:51:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C4C241C74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C4C241C74
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C4C241C74
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:51:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52D7E1BF20D;
 Thu,  5 Dec 2024 15:50:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tJE80-003I1o-2a;
 Thu, 05 Dec 2024 16:50:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  5 Dec 2024 16:50:55 +0100
Message-Id: <20241205155056.784272-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/pixman: backport an upstream patch to
 fix ARM builds with binutils >= 2.43
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/7e92ee14f714e1699458ea8c9f16ae5cc2f743d9/

Tweak the ARM assembly labels to make binutils >= 2.43 happy.

Upstream issue: https://gitlab.freedesktop.org/pixman/pixman/-/issues/96

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ust-arm-assembly-for-binutils-change.patch | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 package/pixman/0002-pixman-Adjust-arm-assembly-for-binutils-change.patch

diff --git a/package/pixman/0002-pixman-Adjust-arm-assembly-for-binutils-change.patch b/package/pixman/0002-pixman-Adjust-arm-assembly-for-binutils-change.patch
new file mode 100644
index 0000000000..2f0fe9f01a
--- /dev/null
+++ b/package/pixman/0002-pixman-Adjust-arm-assembly-for-binutils-change.patch
@@ -0,0 +1,108 @@
+From 9c000faabe1730c1ec7dbefe7e290e025adf7b69 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Fri, 12 Jul 2024 11:11:17 -0400
+Subject: [PATCH] pixman: Adjust arm assembly for binutils change
+
+A change in the latest version of binutils broke building pixman for arm.
+
+The binutils change:
+https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=226749d5a6ff0d5c607d6428d6c81e1e7e7a994b
+
+Closes: https://gitlab.freedesktop.org/pixman/pixman/-/issues/96
+(cherry picked from commit 865e6ce00bb79a6b925ed4c2c436e1533e4472aa)
+Upstream: https://gitlab.freedesktop.org/pixman/pixman/-/commit/865e6ce00bb79a6b925ed4c2c436e1533e4472aa
+[Peter: rebase on 0.42.2]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ pixman/pixman-arm-simd-asm.S | 44 ++++++++++++++++++------------------
+ 1 file changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/pixman/pixman-arm-simd-asm.S b/pixman/pixman-arm-simd-asm.S
+index a74a0a8..959a0ba 100644
+--- a/pixman/pixman-arm-simd-asm.S
++++ b/pixman/pixman-arm-simd-asm.S
+@@ -818,13 +818,13 @@ generate_composite_function \
+ .macro over_white_8888_8888_ca_1pixel_tail
+         mvn     TMP0, WK1
+         teq     WK1, WK1, asr #32
+-        bne     01f
+-        bcc     03f
++        bne     1f
++        bcc     3f
+         mov     WK3, WK1
+-        b       02f
+-01:     over_white_8888_8888_ca_combine WK1, WK3
+-02:     pixst   , 4, 3, DST
+-03:
++        b       2f
++1:     over_white_8888_8888_ca_combine WK1, WK3
++2:     pixst   , 4, 3, DST
++3:
+ .endm
+ 
+ .macro over_white_8888_8888_ca_2pixels_head
+@@ -835,21 +835,21 @@ generate_composite_function \
+         pixld   , 8, 3, DST
+         mvn     TMP0, WK1
+         teq     WK1, WK1, asr #32
+-        bne     01f
++        bne     1f
+         movcs   WK3, WK1
+-        bcs     02f
++        bcs     2f
+         teq     WK2, #0
+-        beq     05f
+-        b       02f
+-01:     over_white_8888_8888_ca_combine WK1, WK3
+-02:     mvn     TMP0, WK2
++        beq     5f
++        b       2f
++1:     over_white_8888_8888_ca_combine WK1, WK3
++2:     mvn     TMP0, WK2
+         teq     WK2, WK2, asr #32
+-        bne     03f
++        bne     3f
+         movcs   WK4, WK2
+-        b       04f
+-03:     over_white_8888_8888_ca_combine WK2, WK4
+-04:     pixst   , 8, 3, DST
+-05:
++        b       4f
++3:     over_white_8888_8888_ca_combine WK2, WK4
++4:     pixst   , 8, 3, DST
++5:
+ .endm
+ 
+ .macro over_white_8888_8888_ca_process_head  cond, numbytes, firstreg, unaligned_src, unaligned_mask, preload
+@@ -1065,9 +1065,9 @@ generate_composite_function \
+   .if offset != 0
+         ldrb    ORIG_W, [SRC, #offset]
+   .endif
+-        beq     01f
++        beq     1f
+         teq     STRIDE_M, #0xFF
+-        beq     02f
++        beq     2f
+  .endif
+         uxtb16  SCRATCH, d                 /* rb_dest */
+         uxtb16  d, d, ror #8               /* ag_dest */
+@@ -1077,13 +1077,13 @@ generate_composite_function \
+         uxtab16 d, d, d, ror #8
+         mov     SCRATCH, SCRATCH, ror #8
+         sel     d, SCRATCH, d
+-        b       02f
++        b       2f
+  .if offset == 0
+ 48:     /* Last mov d,#0 of the set - used as part of shortcut for
+          * source values all 0 */
+  .endif
+-01:     mov     d, #0
+-02:
++1:     mov     d, #0
++2:
+ .endm
+ 
+ .macro in_reverse_8888_8888_tail  numbytes, reg1, reg2, reg3, reg4
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
