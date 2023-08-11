Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0580C0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 08:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18A7283926;
	Fri, 11 Aug 2023 08:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A7283926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IVBATBXKiHfM; Fri, 11 Aug 2023 08:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C4DD82C98;
	Fri, 11 Aug 2023 08:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C4DD82C98
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3A31BF3D7
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 08:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7102E82C98
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 08:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7102E82C98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLSgXHBxlxos for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 08:57:07 +0000 (UTC)
X-Greylist: delayed 494 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 11 Aug 2023 08:57:06 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8995C82110
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8995C82110
 for <buildroot@busybox.net>; Fri, 11 Aug 2023 08:57:06 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 6919C4408C4;
 Fri, 11 Aug 2023 11:48:24 +0300 (IDT)
To: buildroot@busybox.net
Date: Fri, 11 Aug 2023 11:48:23 +0300
Message-Id: <d4e505a059b4d69ab3d54b1aa034e877066a155b.1691743703.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1691743704;
 bh=kvCWM0fBaEIVCu/5FkomWN4GgtJ4tMdkj9qQSPylsUM=;
 h=From:To:Cc:Subject:Date:From;
 b=ojyu6P3RBDjb8ZnIl+fkDJCBEheRKUDTWpZzlBmeWeAHw+IIu1/bGUOJHc7+JLNdI
 yvZc4MbR5XmWJ9jpdRlNOkadylR6y8bMgsUIHFXNGKgkTZfyn/bQocmdAKron3n1mU
 UJ+Y/U14/9MgYi5PyI3gKBQ5sf4u045VqN+bOdh/MjWftf0g82XjDNwDfhzGkEDGOT
 6bUf5kjPMkSS2xK4XebYT2AXq7XDeP1IAGnGkIQZ4NVASMpmH2Nw4f+swtlnYttoOy
 Ggha9coksj5MKxxhG27xog8+i/MPt7YMnFj/OdjlAPp+3p26Tn2kDTZLYVVfwN6rHB
 /F2S6WmDZXpFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=ojyu6P3R
Subject: [Buildroot] [PATCH] boot/mv-ddr-marvell: fix build with gcc 12
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gcc 12 added a warning that triggers on access to low addresses. Add a
patch to allow access since this is normal for low level code.

Rebase our existing patch on top. While at it, add also a proper
Upstream tag.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673785

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .checkpackageignore                           |  1 -
 ...-access-to-low-addresses-with-gcc-12.patch | 49 +++++++++++++++++++
 ...2-Makefile-disable-stack-protection.patch} | 11 ++---
 3 files changed, 54 insertions(+), 7 deletions(-)
 create mode 100644 boot/mv-ddr-marvell/0001-Allow-access-to-low-addresses-with-gcc-12.patch
 rename boot/mv-ddr-marvell/{0001-Makefile-disable-stack-protection.patch => 0002-Makefile-disable-stack-protection.patch} (80%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 627b0cc92b52..dfc1ba900194 100644
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
index 000000000000..5a623f28f95d
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
index 62b1000727f8..626279eb4714 100644
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
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
