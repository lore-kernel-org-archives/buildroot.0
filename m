Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1979C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 19:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E6AE40990;
	Fri, 27 May 2022 19:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VsFkIt2uUtFQ; Fri, 27 May 2022 19:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F101418D8;
	Fri, 27 May 2022 19:12:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 707801BF296
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59E7C4298E
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id byrn_9NhDyyO for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4489642996
 for <buildroot@buildroot.org>; Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 57DE286682; Fri, 27 May 2022 19:00:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 20:55:14 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 30fe3922815ee46d78b9cdec2f5fe6befadb94aa
X-Git-Newrev: 9b5db11a9fabb63a676128ab44fb947eb42b18dc
X-Patchwork-Hint: ignore
Message-Id: <20220527190009.57DE286682@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/afboot-stm32: add
 patch fixing build issue with recent binutils
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b5db11a9fabb63a676128ab44fb947eb42b18dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The afboot-stm32 build system was initially linking with gcc, but that
was changed upstream following a Buildroot contribution to use ld
instead.

However, the build system was still passing -nostartfiles, which is a
gcc option. By luck, this option was simply ignored by older versions
of ld (such as binutils 2.32), but newer versions of ld (2.36 and
newer, at least) no longer accept/ignore this option.

This commit adds a patch that drops the use of this option, since it
is useless for ld.

The first patch is slightly updated because the upstream pull request
has been updated to contain both build fixes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cf5206ea981162bec3479298164cb4650ec31cdc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Pass-fno-builtin-to-fix-build-with-gcc-10.patch |  6 ++--
 .../0002-Makefile-drop-nostartfiles.patch          | 40 ++++++++++++++++++++++
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/boot/afboot-stm32/0001-Pass-fno-builtin-to-fix-build-with-gcc-10.patch b/boot/afboot-stm32/0001-Pass-fno-builtin-to-fix-build-with-gcc-10.patch
index 5ef47b59ff..aef283270e 100644
--- a/boot/afboot-stm32/0001-Pass-fno-builtin-to-fix-build-with-gcc-10.patch
+++ b/boot/afboot-stm32/0001-Pass-fno-builtin-to-fix-build-with-gcc-10.patch
@@ -1,4 +1,4 @@
-From 5448f328ff63a6ca4a64519c2f1dfc63a33df4b7 Mon Sep 17 00:00:00 2001
+From 9901603e18524c4c52fd1dd47bda4ab4016628fc Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Thu, 10 Sep 2020 11:37:33 +0200
 Subject: [PATCH] Pass -fno-builtin to fix build with gcc 10
@@ -23,7 +23,7 @@ stm32f429i-disco.c:(.text.reset+0x1a): undefined reference to `memcpy'
 /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: stm32f429i-disco.c:(.text.reset+0x34): undefined reference to `memset'
 make[1]: *** [Makefile:26: stm32f429i-disco] Error 1
 
-Upstream: https://github.com/mcoquelin-stm32/afboot-stm32/pull/9
+Upstream: https://github.com/mcoquelin-stm32/afboot-stm32/pull/11
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
  Makefile | 1 +
@@ -42,5 +42,5 @@ index f699176..1e8557d 100644
  
  obj-y += gpio.o mpu.o qspi.o start_kernel.o
 -- 
-2.26.2
+2.35.1
 
diff --git a/boot/afboot-stm32/0002-Makefile-drop-nostartfiles.patch b/boot/afboot-stm32/0002-Makefile-drop-nostartfiles.patch
new file mode 100644
index 0000000000..7e5a6430bc
--- /dev/null
+++ b/boot/afboot-stm32/0002-Makefile-drop-nostartfiles.patch
@@ -0,0 +1,40 @@
+From be760c062c5d05bd2223f3916afafd37120d3318 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 28 Apr 2022 22:47:09 +0200
+Subject: [PATCH] Makefile: drop -nostartfiles
+
+In commit 0f3e61c9dd48fd8b4248ce4672c044c2562e4de1 ("Use ld instead of
+gcc for linking "), we started using ld instead of gcc for the link
+step. This worked fine for a while, but recent versions of ld no
+longer accept the -nostartfiles option, causing the build to break:
+
+Error: unable to disambiguate: -nostartfiles (did you mean --nostartfiles ?)
+
+In fact, -nostartfiles was passed to gcc prior to
+0f3e61c9dd48fd8b4248ce4672c044c2562e4de1, but it is not a ld
+option. It is only by luck that it was accepted and ignored by older
+ld versions. Since this option is useless when calling ld directly, we
+can simply drop it.
+
+Upstream: https://github.com/mcoquelin-stm32/afboot-stm32/pull/11
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1e8557d..8f42be1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -14,7 +14,7 @@ CFLAGS := -mthumb -mcpu=cortex-m4
+ CFLAGS += -ffunction-sections -fdata-sections
+ CFLAGS += -Os -std=gnu99 -Wall
+ CFLAGS += -fno-builtin
+-LINKERFLAGS := -nostartfiles --gc-sections
++LINKERFLAGS := --gc-sections
+ 
+ obj-y += gpio.o mpu.o qspi.o start_kernel.o
+ obj-f4 += $(obj-y) usart-f4.o
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
