Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93121C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 08:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CC1660F3E;
	Mon, 17 Oct 2022 08:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CC1660F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBAUjcfp_Qel; Mon, 17 Oct 2022 08:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7507260BF2;
	Mon, 17 Oct 2022 08:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7507260BF2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB3851BF983
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 979E160BD3
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 979E160BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Io7sQgjQT5kI for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 08:38:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABD6960C1A
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABD6960C1A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 996DF86DF9; Mon, 17 Oct 2022 08:38:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 10:32:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9883ff708e300b93247b4463dc7dcf1681c32354
X-Git-Newrev: 42d66f8fc6d4836dc08f0c75c93ce4ed35b13eee
X-Patchwork-Hint: ignore
Message-Id: <20221017083837.996DF86DF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/mv-ddr-marvell: disable SSP
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

commit: https://git.buildroot.net/buildroot/commit/?id=42d66f8fc6d4836dc08f0c75c93ce4ed35b13eee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to disable SSP. The toolchain enables SSP by default when
one of BR2_SSP_ options is enabled. But ATF code for the Marvell
platform does not provide the required low level routines. This leads to
link time failure.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770000
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230006

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Makefile-disable-stack-protection.patch   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch b/boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch
new file mode 100644
index 0000000000..62b1000727
--- /dev/null
+++ b/boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch
@@ -0,0 +1,34 @@
+From 53e34e3bff26fcbb7cc14178fa9fc80e7a73d556 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 11 Oct 2022 16:34:44 +0300
+Subject: [PATCH] Makefile: disable stack protection
+
+The Buildroot toolchain might enable stack protection by default. That
+breaks linking because ATF does not provide the required __stack_chk
+routines.
+
+The mv-ddr-marvell Makefile provides no way to add custom CFLAGS. Patch
+Makefile to disable stack protection.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: not applicable; Buildroot specific
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 3f0dd89a7381..feae75cc16e4 100644
+--- a/Makefile
++++ b/Makefile
+@@ -331,6 +331,7 @@ OBJ_DIR ?= $(MV_DDR_ROOT)
+ CFLAGS = -DMV_DDR_ATF -DCONFIG_DDR4
+ CFLAGS += -Wall -Werror -Os -ffreestanding -mlittle-endian -g -gdwarf-2 -nostdinc
+ CFLAGS += -march=armv8-a -fpie
++CFLAGS += -fno-stack-protector
+ 
+ # PLATFORM is set in ble/ble.mk
+ ifneq ($(findstring a80x0,$(PLATFORM)),)
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
