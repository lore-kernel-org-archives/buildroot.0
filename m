Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82741C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22EE94017E;
	Thu, 13 Jan 2022 19:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3Q-rAiLgNPE; Thu, 13 Jan 2022 19:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFECE40127;
	Thu, 13 Jan 2022 19:37:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B5ED1BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77BBB83E19
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZFJGHE_ucvp for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:37:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8CE583E02
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:37:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 92D7E831C4; Thu, 13 Jan 2022 19:31:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:37:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a10835fac773e68eef18d48cb89d76f9f553c33a
X-Git-Newrev: 57ea2264d78dcc66dff1e904c538fa8c23ae3a0a
X-Patchwork-Hint: ignore
Message-Id: <20220113193119.92D7E831C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btrfs-progs: fix build with kernel
 < 5.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=57ea2264d78dcc66dff1e904c538fa8c23ae3a0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with kernel < 5.11 raised since commit
f363bc2958812539cf248f6cf44fe519445adf7a:

/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: kernel-shared/volumes.o: in function `create_chunk':
volumes.c:(.text+0x17f8): undefined reference to `__ALIGN_KERNEL'

Fixes:
 - http://autobuild.buildroot.org/results/b630dbd078656a974c6ac9645b2e87279ef2adc0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...add-local-definition-for-alignment-macros.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch b/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch
new file mode 100644
index 0000000000..86c63edc30
--- /dev/null
+++ b/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch
@@ -0,0 +1,46 @@
+From b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58 Mon Sep 17 00:00:00 2001
+From: David Sterba <dsterba@suse.com>
+Date: Thu, 13 Jan 2022 14:47:08 +0100
+Subject: [PATCH] btrfs-progs: kerncompat: add local definition for alignment
+ macros
+
+There's still problem left with compilation on musl and kernel < 5.11,
+because __ALIGN_KERNEL is not defined anymore:
+
+../bin/ld: kernel-shared/volumes.o: in function `create_chunk':
+volumes.c:(.text+0x17f8): undefined reference to `__ALIGN_KERNEL'
+
+Due to the entangled includes and unconditional definition of
+__ALIGN_KERNEL, we can't use #ifdef in kerncompat.h to define it
+eventually (as kerncompat.h is the first include). Instead add local
+definitions of the macros and rename them to avoid name clashes.
+
+Pull-request: #433
+Signed-off-by: David Sterba <dsterba@suse.com>
+[Retrieved from:
+https://github.com/kdave/btrfs-progs/commit/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ kerncompat.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/kerncompat.h b/kerncompat.h
+index 6ca1526e2..f0a6e196e 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -359,7 +359,14 @@ do {					\
+ 
+ /* Alignment check */
+ #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
+-#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
++
++/*
++ * Alignment, copied and renamed from /usr/include/linux/const.h to work around
++ * issues caused by moving the definition in 5.12
++ */
++#define __ALIGN_KERNEL__(x, a)		__ALIGN_KERNEL_MASK__(x, (typeof(x))(a) - 1)
++#define __ALIGN_KERNEL_MASK__(x, mask)	(((x) + (mask)) & ~(mask))
++#define ALIGN(x, a)		__ALIGN_KERNEL__((x), (a))
+ 
+ static inline int is_power_of_2(unsigned long n)
+ {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
