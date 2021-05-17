Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096CFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:08:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0FDF60184
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0FDF60184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ED2340627;
	Tue,  3 Aug 2021 22:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5e2LGlWV6XeS; Tue,  3 Aug 2021 22:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 009F9405EE;
	Tue,  3 Aug 2021 22:08:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0901F1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BCA640477
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GzVvMHMMCCZ0 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACDEE404FA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 107E985E95; Tue,  3 Aug 2021 21:09:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 May 2021 22:00:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f6d7b6333367582eef14073af0a490bc87d79f3
X-Git-Newrev: e1137c06a0db69ba0724f22cd09ea92b82ac59a6
X-Patchwork-Hint: ignore
Message-Id: <20210803210940.107E985E95@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] lmbench: lat_rpc: fix stray
 pointer
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1137c06a0db69ba0724f22cd09ea92b82ac59a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

| # ./lat_rpc -S localhost
| potentially unexpected fatal signal 11.
| Path: /lmbench/bin/arc64/lat_rpc
| CPU: 0 PID: 62 Comm: lat_rpc Not tainted 5.6.0-00224-g8e1b159f529e #39
| Invalid Read @ 0x00000001 by insn @ 0x2011f110
|   @off 0x6c110 in [/lib/libc-2.32.so]  VMA: 0x200b3000 to 0x201b8000
| ECR: 0x00050100 EFA: 0x00000001 ERET: 0x2011f110
| STAT32: 0x80081082 [IE U     ]   BTA: 0x2011b87c
|  SP: 0x5fffefe8  FP: 0x00000000 BLK: 0x20103242
| r00: 0x00000001 r01: 0x00000002 r02: 0x00000001
| r03: 0x20101eb0 r04: 0x00000001 r05: 0x00000001
| r06: 0x00000000 r07: 0x00000000 r08: 0x00000001
| r09: 0x2019d8b0 r10: 0x20039fc4 r11: 0x5ffff0f0
| r12: 0x2019d6d0 r13: 0x2019d748 r14: 0x5ffff588
| r15: 0x00000000 r16: 0x00000000 r17: 0x5ffff708
| r18: 0x20039fc0 r19: 0xffffffff r20: 0x201ba010
| r21: 0x00000000 r22: 0x00000000 r23: 0x20039fc0
| r24: 0x00000bd0 r25: 0x00000073
Segmentation fault

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...x-garbage-pointer-for-lat_rpc-S-localhost.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch b/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
new file mode 100644
index 0000000000..619ec38614
--- /dev/null
+++ b/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
@@ -0,0 +1,25 @@
+From 3830453a06269912d2772fe8c31bae44f27bb131 Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <vgupta@synopsys.com>
+Date: Fri, 8 May 2015 11:35:58 +0530
+Subject: [PATCH] Fix garbage pointer for lat_rpc -S localhost
+
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+---
+ src/lat_rpc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lat_rpc.c b/src/lat_rpc.c
+index 9c021926d761..ff4380ff38f3 100644
+--- a/src/lat_rpc.c
++++ b/src/lat_rpc.c
+@@ -101,6 +101,7 @@ main(int ac, char **av)
+ 	char	*usage = "-s\n OR [-p <tcp|udp>] [-P parallel] [-W <warmup>] [-N <repetitions>] serverhost\n OR -S serverhost\n";
+ 
+ 	state.msize = 1;
++	state.server = NULL;
+ 
+ 	while (( c = getopt(ac, av, "sS:m:p:P:W:N:")) != EOF) {
+ 		switch(c) {
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
