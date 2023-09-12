Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E171ECA0ECA
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 06:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97CAD61108;
	Tue, 12 Sep 2023 06:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97CAD61108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5RRj7DpI0lB; Tue, 12 Sep 2023 06:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41E5761125;
	Tue, 12 Sep 2023 06:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41E5761125
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35CF81BF964
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D8C841520
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D8C841520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlfndAIvQUWg for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 06:28:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A92A41529
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 06:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A92A41529
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A7DE86D93; Tue, 12 Sep 2023 06:28:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 08:22:28 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 31fa0dcce5a02f4a0e78842cdc9eca9feaebc612
X-Git-Newrev: 5a94d7c160b2b21d570eb067170154df9c8f5ecd
X-Patchwork-Hint: ignore
Message-Id: <20230912062822.0A7DE86D93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] boot/mv-ddr-marvell: fix
 build with gcc 12
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a94d7c160b2b21d570eb067170154df9c8f5ecd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

gcc 12 added a warning that triggers on access to low addresses. Add a
patch to allow access since this is normal for low level code.

Rebase our existing patch on top. While at it, add also a proper
Upstream tag.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673785

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 651429d0b87687d222ac801534fb03e3037b9503)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Allow-access-to-low-addresses-with-gcc-12.patch | 49 ++++++++++++++++++++++
 ...> 0002-Makefile-disable-stack-protection.patch} | 11 +++--
 2 files changed, 54 insertions(+), 6 deletions(-)

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
