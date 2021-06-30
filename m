Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892D8C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:53:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FBDF603E7
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FBDF603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E29383B6A;
	Tue,  3 Aug 2021 21:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPRamim9HqLT; Tue,  3 Aug 2021 21:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72C2783BD2;
	Tue,  3 Aug 2021 21:53:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8774B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 611DC4049A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m_jHZwvNLjPl for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE53A40483
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 14FEF860D3; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 30 Jun 2021 23:37:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 95c09d121987ef3503beacc088d2b21f8566f1f4
X-Git-Newrev: 7cb51d4843caaa9144270d92f86e60d8b5a2a1ec
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.14FEF860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/grub2: workaround
 breakage with -O2, -O3 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cb51d4843caaa9144270d92f86e60d8b5a2a1ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When grub2 (i386-pc) is built with -O2 or -O3 it is unable to boot
and the system will reboot in a loop.

Tony Battersby has bisected [0] the error down to this security bugfix:
boot/grub2/0132-kern-parser-Fix-a-stack-buffer-overflow.patch
There is also a bug report by Peter Seiderer about this [1].

As discussed on the mailing list [2], this patch introduces a workaround
in the grub2.mk overriding the global optimization settings with -Os
which results in a booting system.

References:
[0] https://savannah.gnu.org/bugs/?60458
[1] https://bugs.busybox.net/show_bug.cgi?id=13586
[2] http://lists.busybox.net/pipermail/buildroot/2021-May/311524.html

Signed-off-by: Andreas Hilse <andreas.hilse@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/grub2/grub2.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index af16ee91e1..52e9199ae9 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -118,9 +118,11 @@ HOST_GRUB2_CONF_ENV = \
 GRUB2_CONF_ENV = \
 	CPP="$(TARGET_CC) -E" \
 	TARGET_CC="$(TARGET_CC)" \
-	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
-	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -fno-stack-protector" \
-	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
+	CFLAGS="$(TARGET_CFLAGS) -Os" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS) -Os" \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -Os -fno-stack-protector" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -Os -fno-stack-protector" \
+	TARGET_LDFLAGS="$(TARGET_LDFLAGS) -Os" \
 	TARGET_NM="$(TARGET_NM)" \
 	TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
 	TARGET_STRIP="$(TARGET_CROSS)strip"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
