Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3000BC47079
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C4041E2F;
	Mon,  8 Jan 2024 20:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9C4041E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBPTVrnM-fGn; Mon,  8 Jan 2024 20:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EC6141E13;
	Mon,  8 Jan 2024 20:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EC6141E13
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 856801BF2BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B1E583A93
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B1E583A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2XiTHKKong_x for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:32:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45C1C83A84
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 20:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45C1C83A84
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31C9F84BC9; Mon,  8 Jan 2024 20:32:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 Jan 2024 21:30:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d97f8c41e18534cefbb4604a80e9ad687bf74d1
X-Git-Newrev: a34f0c02f18533abe56a497b6208fbc0401b2538
X-Patchwork-Hint: ignore
Message-Id: <20240108203207.31C9F84BC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libutempter: fix dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=a34f0c02f18533abe56a497b6208fbc0401b2538
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b forgot to add
dependencies resulting in the following static build failure:

/home/autobuild/autobuild/instance-5/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -Wl,-z,relro -Wl,-stats  -static  -shared \
	-Wl,-soname,libutempter.so.0,--version-script=libutempter.map,-z,defs \
	-lc iface.os -o libutempter.so
/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/12.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/autobuild/autobuild/instance-5/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0x190): undefined reference to `__fini_array_start'

Fixes:
 - http://autobuild.buildroot.org/results/781ab393455f0e6823b850f474f6fe38b27d8efa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libutempter/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libutempter/Config.in b/package/libutempter/Config.in
index a06a240418..5b79c1e44d 100644
--- a/package/libutempter/Config.in
+++ b/package/libutempter/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBUTEMPTER
 	bool "libutempter"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+	depends on !BR2_STATIC_LIBS
 	help
 	  The libutempter library provides interface for terminal
 	  emulators such as screen and xterm to record user
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
