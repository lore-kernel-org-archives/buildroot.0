Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F165FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:00:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B89F760F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B89F760F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95EF76068D;
	Tue,  3 Aug 2021 22:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJ4JxBJM7aNq; Tue,  3 Aug 2021 22:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08E9560664;
	Tue,  3 Aug 2021 22:00:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B58E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBDFA83ACF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJHla5KP-Esw for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C87C82862
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 86D1886A84; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jul 2021 23:22:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 14e4f25483c56db94e7adcbcc2e3cac804d16073
X-Git-Newrev: 487c7ba95db8097d206119868fd1187b656e3a9c
X-Patchwork-Hint: ignore
Message-Id: <20210803211004.86D1886A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kexec-tools: fix build
 with gcc 10
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

commit: https://git.buildroot.net/buildroot/commit/?id=487c7ba95db8097d206119868fd1187b656e3a9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Build is broken with gcc 10 since bump to version 2.0.22 in commit
cadb8f2f317bf37c13aea98ac1c81bf8566aad92:

/tmp/instance-1/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: kexec/arch/ppc/kexec-elf-ppc.o:(.sbss+0x0): multiple definition of `ramdisk'; kexec/arch/ppc/kexec-ppc.o:(.sbss+0x0): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/22932529f925630ec6db3c6a4eaebbda68b3fc16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
