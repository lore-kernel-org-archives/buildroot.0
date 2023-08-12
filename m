Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F88EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D9F540BE6;
	Mon, 21 Aug 2023 20:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D9F540BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLtHbv9V7TGZ; Mon, 21 Aug 2023 20:20:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8345C40B59;
	Mon, 21 Aug 2023 20:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8345C40B59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 724401BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3276C41554
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3276C41554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTqMz-MZWYnf for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 840C6410DE
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 840C6410DE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63D4E86023; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 16:23:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 898bdbca1f11fe81e8be7924371326f85f466a27
X-Git-Newrev: 651429d0b87687d222ac801534fb03e3037b9503
X-Patchwork-Hint: ignore
Message-Id: <20230821200126.63D4E86023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/mv-ddr-marvell: fix build
 with gcc 12
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

commit: https://git.buildroot.net/buildroot/commit/?id=651429d0b87687d222ac801534fb03e3037b9503
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

gcc 12 added a warning that triggers on access to low addresses. Add a
patch to allow access since this is normal for low level code.

Rebase our existing patch on top. While at it, add also a proper
Upstream tag.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673785

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 ...Allow-access-to-low-addresses-with-gcc-12.patch | 49 ++++++++++++++++++++++
 ...> 0002-Makefile-disable-stack-protection.patch} | 11 +++--
 3 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 627b0cc92b..dfc1ba9001 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -108,7 +108,6 @@ boot/at91dataflashboot/0001-do-not-install.patch Upstream
 boot/at91dataflashboot/0002-eabi-fixes.patch Upstream
 boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch Upstream
 boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch Upstream
-boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch Upstream
 boot/optee-os/3.13.0/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch Upstream
 boot/syslinux/0001-bios-Fix-alignment-change-with-gcc-5.patch Upstream
 boot/syslinux/0002-Disable-PIE-to-avoid-FTBFS-on-amd64.patch Upstream
diff --git a/boot/mv-ddr-marvell/0001-Allow-access-to-low-addresses-with-gcc-12.patch b/boot/mv-ddr-marvell/0001-Allow-access-to-low-addresses-with-gcc-12.patch
new file mode 100644
index 0000000000..5a623f28f9
--- /dev/null
+++ b/boot/mv-ddr-marvell/0001-Allow-access-to-low-addresses-with-gcc-12.patch
@@ -0,0 +1,49 @@
+From 4796a1eacc6a5ccb623e7d2e46a5196f8335e496 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 11 Aug 2023 11:19:49 +0300
+Subject: [PATCH] Allow access to low addresses with gcc 12
+
+gcc 12 added a warning that triggers on access to low addresses. Add a
+compile option that allows access to lower addresses.
+
+Add the 'cc_option' macro to avoid the compile option when the compiler
+does not support it.
+
+This fixes build with TF-A. TF-A added a similar fix in commit
+dea23e245fb89.
+
+See some more details in
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105523
+
+Upstream: https://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell/pull/42
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ Makefile | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 3f0dd89a7381..045284c30cbc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -108,6 +108,10 @@ MV_DDR_VER_CSRC = mv_ddr_build_message.c
+ # create mv_ddr build message and version string source file
+ $(shell $(MV_DDR_ROOT)/scripts/localversion.sh $(MV_DDR_ROOT) $(MV_DDR_VER_CSRC) 2> /dev/null)
+ 
++define cc_option
++	$(shell if $(CC) $(1) -c -x c /dev/null -o /dev/null >/dev/null 2>&1; then echo $(1); fi )
++endef
++
+ # ******************
+ # U-BOOT SPL SUPPORT
+ # ******************
+@@ -331,6 +335,7 @@ OBJ_DIR ?= $(MV_DDR_ROOT)
+ CFLAGS = -DMV_DDR_ATF -DCONFIG_DDR4
+ CFLAGS += -Wall -Werror -Os -ffreestanding -mlittle-endian -g -gdwarf-2 -nostdinc
+ CFLAGS += -march=armv8-a -fpie
++CFLAGS += $(call cc_option, --param=min-pagesize=0)
+ 
+ # PLATFORM is set in ble/ble.mk
+ ifneq ($(findstring a80x0,$(PLATFORM)),)
+-- 
+2.40.1
+
diff --git a/boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch b/boot/mv-ddr-marvell/0002-Makefile-disable-stack-protection.patch
similarity index 80%
rename from boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch
rename to boot/mv-ddr-marvell/0002-Makefile-disable-stack-protection.patch
index 62b1000727..626279eb47 100644
--- a/boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch
+++ b/boot/mv-ddr-marvell/0002-Makefile-disable-stack-protection.patch
@@ -10,25 +10,24 @@ routines.
 The mv-ddr-marvell Makefile provides no way to add custom CFLAGS. Patch
 Makefile to disable stack protection.
 
+Upstream: not applicable; Buildroot specific
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: not applicable; Buildroot specific
 ---
  Makefile | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile b/Makefile
-index 3f0dd89a7381..feae75cc16e4 100644
+index 045284c30cbc..9641354bcf86 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -331,6 +331,7 @@ OBJ_DIR ?= $(MV_DDR_ROOT)
- CFLAGS = -DMV_DDR_ATF -DCONFIG_DDR4
+@@ -336,6 +336,7 @@ CFLAGS = -DMV_DDR_ATF -DCONFIG_DDR4
  CFLAGS += -Wall -Werror -Os -ffreestanding -mlittle-endian -g -gdwarf-2 -nostdinc
  CFLAGS += -march=armv8-a -fpie
+ CFLAGS += $(call cc_option, --param=min-pagesize=0)
 +CFLAGS += -fno-stack-protector
  
  # PLATFORM is set in ble/ble.mk
  ifneq ($(findstring a80x0,$(PLATFORM)),)
 -- 
-2.35.1
+2.40.1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
