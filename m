Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069BFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9AC860F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9AC860F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A61634018E;
	Tue,  3 Aug 2021 23:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXOBVU8C5LYU; Tue,  3 Aug 2021 23:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAEC942268;
	Tue,  3 Aug 2021 23:44:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB4ED1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72F7840F28
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nob_PpDbG8Wn for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8639B40EB6
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DCD8686AA7; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 21:22:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2392f76b6b345308baf8d3d2f075793d30185d76
X-Git-Newrev: ce534677cbe8f3dbcb86895c378a2b59b2107a32
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.DCD8686AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/uboot: introduce
 BR2_TARGET_UBOOT_FORMAT_DTB
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce534677cbe8f3dbcb86895c378a2b59b2107a32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

If U-Boot CONFIG_OF_SEPARATE is defined [1], then the device tree will
be built and placed in a u-boot.dtb file alongside u-boot.bin.

When BR2_TARGET_UBOOT_FORMAT_DTB is enabled, buildroot will copy
u-boot.dtb to $(BINARIES_DIR).

This is useful for RISC-V platforms that want to build OpenSBI with an
external DTB by using FW_FDT_PATH [2].

[1] https://github.com/u-boot/u-boot/blob/master/doc/README.fdt-control
[2] https://github.com/riscv/opensbi/blob/master/docs/firmware/fw.md

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 3 +++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 58e0a85803..0854fb13cc 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -252,6 +252,9 @@ config BR2_TARGET_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
 	default y
 
+config BR2_TARGET_UBOOT_FORMAT_DTB
+	bool "u-boot.dtb"
+
 config BR2_TARGET_UBOOT_FORMAT_DTB_BIN
 	bool "u-boot-dtb.bin"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a8a8bedc01..9c2261963d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -48,6 +48,10 @@ ifeq ($(BR2_TARGET_UBOOT_FORMAT_BIN),y)
 UBOOT_BINS += u-boot.bin
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB),y)
+UBOOT_BINS += u-boot.dtb
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
 UBOOT_BINS += u-boot
 # To make elf usable for debuging on ARC use special target
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
