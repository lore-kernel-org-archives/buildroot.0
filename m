Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEBCC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:08:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18D5C60F02
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18D5C60F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E24F18356C;
	Tue,  3 Aug 2021 21:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZSXe8hi6xBj; Tue,  3 Aug 2021 21:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C6A88350A;
	Tue,  3 Aug 2021 21:08:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6352C1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D726063A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrrA9zT8cfsE for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:08:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D27D605E0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:08:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E777C8B42E; Tue,  3 Aug 2021 21:08:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 23:07:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d8df5aababc9e50604588b0c99ceaa761d7ac97
X-Git-Newrev: 76e64a175aef5cfbdf24bd457f3568b4ba159b6f
X-Patchwork-Hint: ignore
Message-Id: <20210803210805.E777C8B42E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: risc-v should only add
 risc-v
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

commit: https://git.buildroot.net/buildroot/commit/?id=76e64a175aef5cfbdf24bd457f3568b4ba159b6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This restricts the Erlang RISC-V update from
0bab8c1089983a4b5f0f2acfe5cad77b02d6f654 to only enabling RISCV_64
rather than enabling builds on all platforms with toolchains that
include atomics.

This fixes build errors on SPARCv8 and other platforms that look like
this:

/tmp/ccD9Q9F7.s: Assembler messages:
/tmp/ccD9Q9F7.s:230: Error: Architecture mismatch on "cas [%g3],%g2,%g1".
/tmp/ccD9Q9F7.s:230: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)

Fixes:
http://autobuild.buildroot.net/results/a57/a5779e22c41eb63b8400409f26f96b924fdde1bc/

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/erlang/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index b6b100f38b..15931b5896 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	# __atomic_* builtins
 	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
 		BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel || \
-		BR2_TOOLCHAIN_HAS_ATOMIC
+		BR2_RISCV_64
 	# erlang needs host-erlang
 	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
