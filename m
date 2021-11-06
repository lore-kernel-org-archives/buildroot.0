Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CC4C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:47:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2522E6124A
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2522E6124A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBD96400CC;
	Sat,  6 Nov 2021 10:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1PrP3jkfLUMK; Sat,  6 Nov 2021 10:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D7E540189;
	Sat,  6 Nov 2021 10:47:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1974B1BF95F
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16E1A82531
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUHxYYlt0ghY for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:47:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C9B982423
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:47:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BDA25884F5; Sat,  6 Nov 2021 10:43:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 6 Nov 2021 11:47:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: deb67dbca6a38094ae74a2070746dc68b4d2fbb8
X-Git-Newrev: 18911c935cb0b904ab4a0e669774d962e57202f4
X-Patchwork-Hint: ignore
Message-Id: <20211106104350.BDA25884F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: fix build on powerpc
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

commit: https://git.buildroot.net/buildroot/commit/?id=18911c935cb0b904ab4a0e669774d962e57202f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 0.3.39 in
commit d9796f2db9866060b916487784b046bb6b76f9b6:

In file included from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/signal.h:318,
                 from ../spa/include/spa/utils/defs.h:34,
                 from ../spa/include/spa/utils/type.h:32,
                 from ../spa/include/spa/support/log.h:34,
                 from ../spa/plugins/support/cpu.c:37:
../spa/plugins/support/cpu.c: In function 'impl_init':
../spa/plugins/support/cpu.c:88:33: error: called object is not a function or function pointer
   88 | #define impl_cpu_zero_denormals NULL
      |                                 ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/eaf255c46b10cbb6b8a629bc15acf7772d5e274b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...cpu-fix-compilation-on-some-architectures.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch b/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
new file mode 100644
index 0000000000..4465523610
--- /dev/null
+++ b/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
@@ -0,0 +1,28 @@
+From 651f0decea5f83730c271e9bed03cdd0048fcd49 Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Thu, 21 Oct 2021 11:09:48 +0200
+Subject: [PATCH] cpu: fix compilation on some architectures
+
+[Retrieved from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/651f0decea5f83730c271e9bed03cdd0048fcd49]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ spa/plugins/support/cpu.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spa/plugins/support/cpu.c b/spa/plugins/support/cpu.c
+index ee1816512..01cff4854 100644
+--- a/spa/plugins/support/cpu.c
++++ b/spa/plugins/support/cpu.c
+@@ -270,7 +270,7 @@ impl_init(const struct spa_handle_factory *factory,
+ 		if ((str = spa_dict_lookup(info, SPA_KEY_CPU_VM_TYPE)) != NULL)
+ 			this->vm_type = atoi(str);
+ 		if ((str = spa_dict_lookup(info, SPA_KEY_CPU_ZERO_DENORMALS)) != NULL)
+-			impl_cpu_zero_denormals(this, spa_atob(str));
++			spa_cpu_zero_denormals(&this->cpu, spa_atob(str));
+ 	}
+ 
+ 	spa_log_debug(this->log, "%p: count:%d align:%d flags:%08x",
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
