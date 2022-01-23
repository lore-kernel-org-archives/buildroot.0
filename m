Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4349BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E993F401B5;
	Sun, 23 Jan 2022 19:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DHl83nj0KZG; Sun, 23 Jan 2022 19:13:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25C644021F;
	Sun, 23 Jan 2022 19:13:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F63C1BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17100405E3
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1a52fYnUp2tf for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:10:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E76940105
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:10:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0599582968; Sun, 23 Jan 2022 19:04:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 19:32:53 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 0541a7c2103ba500d5a6ed4ddf08cd839290381f
X-Git-Newrev: ee32b0446fd4b202a05e59073c62238dc2aabf6b
X-Patchwork-Hint: ignore
Message-Id: <20220123190408.0599582968@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/xenomai: fix
 build with glibc >= 2.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee32b0446fd4b202a05e59073c62238dc2aabf6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fix the following build failure with glibc >= 2.34:

In file included from timerobj.c:32:
In function 'threadobj_set_current',
    inlined from 'server_prologue' at timerobj.c:94:2:
../../include/copperplate/threadobj.h:252:9: error: 'pthread_setspecific' expecting 1 byte in a region of size 0 [-Werror=stringop-overread]
  252 |         pthread_setspecific(threadobj_tskey, thobj);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ed93f916eda304b30f320816c85d1b0d4488c699

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1b3055cc8d25e496928643ef93f3a47910fa4974)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-valid-addresses-for-pthread_setspecific.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch b/package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch
new file mode 100644
index 0000000000..0c39a4ecf7
--- /dev/null
+++ b/package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch
@@ -0,0 +1,57 @@
+From 627d488db3aa71406e32d4d8934629e8b0f35905 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sat, 16 Oct 2021 15:46:33 +0200
+Subject: [PATCH] lib/{cobalt,copperplate}: Use valid addresses for
+ pthread_setspecific
+
+glibx 2.34 and newer annotated pthread_setspecific in a way that gcc-11
+complains about non-NULL pointers that are outside of what is considered
+valid. So use dummy addresses instead. namely the related pthread keys.
+Those pointers will never be dereferenced in both use cases.
+
+See also https://sourceware.org/bugzilla/show_bug.cgi?id=28458.
+
+Reported-by: Vitaly Chikunov <vt@altlinux.org>
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+
+[Retrieved from:
+https://source.denx.de/Xenomai/xenomai/-/commit/627d488db3aa71406e32d4d8934629e8b0f35905]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/copperplate/threadobj.h | 6 +++++-
+ lib/cobalt/printf.c             | 2 +-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/include/copperplate/threadobj.h b/include/copperplate/threadobj.h
+index 7e6904f4c..c8363415b 100644
+--- a/include/copperplate/threadobj.h
++++ b/include/copperplate/threadobj.h
+@@ -173,7 +173,11 @@ void threadobj_save_timeout(struct threadobj_corespec *corespec,
+ #define __THREAD_M_SPARE6	(1 << 22)
+ #define __THREAD_M_SPARE7	(1 << 23)
+ 
+-#define THREADOBJ_IRQCONTEXT    ((struct threadobj *)-2UL)
++/*
++ * We need to use a valid address here. The object will never be dereferenced
++ * when it is identified as IRQ context, so the pthread key itself is fine.
++ */
++#define THREADOBJ_IRQCONTEXT	((struct threadobj *)&threadobj_tskey)
+ 
+ struct traceobj;
+ struct syncobj;
+diff --git a/lib/cobalt/printf.c b/lib/cobalt/printf.c
+index 8982ddc93..0aa5940c6 100644
+--- a/lib/cobalt/printf.c
++++ b/lib/cobalt/printf.c
+@@ -729,7 +729,7 @@ done:
+ 	pthread_cond_init(&printer_wakeup, NULL);
+ 	spawn_printer_thread();
+ 	/* We just need a non-zero TSD to trigger the dtor upon unwinding. */
+-	pthread_setspecific(cleanup_key, (void *)1);
++	pthread_setspecific(cleanup_key, &cleanup_key);
+ 
+ 	atexit(rt_print_flush_buffers);
+ }
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
