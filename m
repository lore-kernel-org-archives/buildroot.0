Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454BCC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:44:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0830B61040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0830B61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D91E683A95;
	Tue,  3 Aug 2021 23:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0_oKq4rIqxK; Tue,  3 Aug 2021 23:44:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37DF083A7E;
	Tue,  3 Aug 2021 23:44:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66B3A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A414140F2C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uG8-yoKeWI1q for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B1B40EB3
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E55AE87059; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 21:24:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ce534677cbe8f3dbcb86895c378a2b59b2107a32
X-Git-Newrev: 4210b268928fc10ce576c0bb85981a34263eb7ac
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.E55AE87059@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_FW_FDT_PATH
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

commit: https://git.buildroot.net/buildroot/commit/?id=4210b268928fc10ce576c0bb85981a34263eb7ac
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
 boot/opensbi/Config.in  | 10 ++++++++++
 boot/opensbi/opensbi.mk |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 632eeec88d..f1443498d9 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -109,4 +109,14 @@ config BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
 	help
 	  Build OpenSBI with the U-Boot as a Payload.
 
+config BR2_TARGET_OPENSBI_FW_FDT_PATH
+	bool "Include U-Boot DTB in OpenSBI Payload"
+	depends on BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
+	select BR2_TARGET_UBOOT_FORMAT_DTB
+	help
+	  Build OpenSBI with FW_FDT_PATH set to
+	  $(BINARIES_DIR)/u-boot.dtb. Note that CONFIG_OF_SEPARATE
+	  must be set in the U-Boot configuration for this file to be
+	  produced.
+
 endif
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index a525b8aea3..8e055633a8 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -46,6 +46,9 @@ endif
 ifeq ($(BR2_TARGET_OPENSBI_UBOOT_PAYLOAD),y)
 OPENSBI_DEPENDENCIES += uboot
 OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/u-boot.bin"
+ifeq ($(BR2_TARGET_OPENSBI_FW_FDT_PATH),y)
+OPENSBI_MAKE_ENV += FW_FDT_PATH="$(BINARIES_DIR)/u-boot.dtb"
+endif
 endif
 
 define OPENSBI_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
