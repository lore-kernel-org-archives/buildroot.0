Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F04C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:35:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5252D60F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5252D60F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 268B0600C9;
	Tue,  3 Aug 2021 09:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cT-jjgOFpxwn; Tue,  3 Aug 2021 09:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FA4960591;
	Tue,  3 Aug 2021 09:35:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6BB1BF2B0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38BC24027A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3ie8kg4_CcZ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 09:35:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C73340219
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 09:35:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AD2358A63F; Tue,  3 Aug 2021 09:35:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 11:33:53 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 2b82d31c2780c43951c228fdbabb13a6d6b18b29
X-Git-Newrev: 0eadf4f0ac339e3e8881ea1b3b060fae0dc33506
X-Patchwork-Hint: ignore
Message-Id: <20210803093502.AD2358A63F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/kexec-tools: fix
 build with gcc 10
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

commit: https://git.buildroot.net/buildroot/commit/?id=0eadf4f0ac339e3e8881ea1b3b060fae0dc33506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Build is broken with gcc 10 since bump to version 2.0.22 in commit
cadb8f2f317bf37c13aea98ac1c81bf8566aad92:

/tmp/instance-1/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: kexec/arch/ppc/kexec-elf-ppc.o:(.sbss+0x0): multiple definition of `ramdisk'; kexec/arch/ppc/kexec-ppc.o:(.sbss+0x0): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/22932529f925630ec6db3c6a4eaebbda68b3fc16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 487c7ba95db8097d206119868fd1187b656e3a9c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ls-Remove-duplicate-definition-of-ramdisk.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch b/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
new file mode 100644
index 0000000000..173323bff8
--- /dev/null
+++ b/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
@@ -0,0 +1,32 @@
+From 5e7ce27626a44428c01e0e5ab3fe60ef98ca788c Mon Sep 17 00:00:00 2001
+From: Petr Tesarik <ptesarik@suse.cz>
+Date: Mon, 26 Apr 2021 15:29:51 +0200
+Subject: kexec-tools: Remove duplicate definition of ramdisk
+
+The ramdisk variable is defined in kexec/arch/ppc/kexec-ppc.c. This
+other definition is not needed and breaks build with -fno-common.
+
+Signed-off-by: Petr Tesarik <ptesarik@suse.com>
+Signed-off-by: Simon Horman <horms@verge.net.au>
+[Retrieved from:
+https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=5e7ce27626a44428c01e0e5ab3fe60ef98ca788c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ kexec/arch/ppc/kexec-elf-ppc.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/kexec/arch/ppc/kexec-elf-ppc.c b/kexec/arch/ppc/kexec-elf-ppc.c
+index ad43ad1..4a4886e 100644
+--- a/kexec/arch/ppc/kexec-elf-ppc.c
++++ b/kexec/arch/ppc/kexec-elf-ppc.c
+@@ -33,7 +33,6 @@
+ static const int probe_debug = 0;
+ 
+ unsigned char reuse_initrd;
+-const char *ramdisk;
+ int create_flatten_tree(struct kexec_info *, unsigned char **, unsigned long *,
+ 			char *);
+ 
+-- 
+cgit 1.2.3-1.el7
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
