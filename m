Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021DCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:33:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 956E8615E2
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 956E8615E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62577401CC;
	Tue, 16 Nov 2021 20:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NECCCsQiWOgk; Tue, 16 Nov 2021 20:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B18B40433;
	Tue, 16 Nov 2021 20:33:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0A21BF964
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CC5F80F47
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_UdreolNsZa for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40A1580F1F
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A7A128D362; Tue, 16 Nov 2021 20:28:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 16 Nov 2021 21:05:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b094f88a4d501101bfba9b65491209e6a0fe0397
X-Git-Newrev: 0e0f70b3d1ef747995fcc717fbfcac2e13864ffd
X-Patchwork-Hint: ignore
Message-Id: <20211116202859.A7A128D362@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e0f70b3d1ef747995fcc717fbfcac2e13864ffd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since commit
0ddb20c3adba8a9512caa7249cff8b43828c44e8:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc  -o janet janet.p/meson-generated_.._janet.c.o janet.p/src_mainclient_shell.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -Wl,-O1 -Wl,--start-group -latomic -lm -ldl -Wl,--end-group -pthread
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_registered_FDE':
/home/giuliobenetti/autobuild/run/instance-0/output-1/build/host-gcc-final-10.3.0/build/xtensa-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde.c:1043: undefined reference to `dl_iterate_phdr'

Fixes:
 - http://autobuild.buildroot.org/results/d6cd842bd156abe3d77b72a7a108a5233fa19e20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/janet/janet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 71e9e08e62..b00f82846c 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -17,7 +17,7 @@ endif
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-JANET_LDFLAGS += -latomic
+JANET_LDFLAGS += $(TARGET_LDFLAGS) -latomic
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
