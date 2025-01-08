Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BEBC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7557E50012;
	Fri, 28 Feb 2025 16:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMWwnhaSHuvB; Fri, 28 Feb 2025 16:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A79B50018
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A79B50018;
	Fri, 28 Feb 2025 16:52:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19FF3711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1300442F6E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIN5OkhqmXvs for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1612424A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1612424A7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D479787C2C; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 19:40:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b4b7a46fb80730caf4d407a2ec6f7693f0c00a2
X-Git-Newrev: 1220b505bc454643b1d7e7d812669beb9afc8dc9
X-Patchwork-Hint: ignore
Message-Id: <20250228162959.D479787C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/uboot: add support for
 embedded TEE in binary format
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============8853977759043477227=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8853977759043477227==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1220b505bc454643b1d7e7d812669beb9afc8dc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We can embed a TEE in ELF format into U-Boot, but versions of OP-TEE since
3.8.0 must be embedded in binary format, as the tee.bin contains important
meta-data. [1]

Update the configuration menu and the Makefile to allow selecting to
embed either tee.elf or tee.bin.

By default, embed the TEE in ELF format to stay compatible with existing
configurations.

[1] https://github.com/OP-TEE/optee_os/issues/4542

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/uboot/Config.in | 26 +++++++++++++++++++++++++-
 boot/uboot/uboot.mk  |  4 ++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8648d6eb7e..f6823d537b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -274,7 +274,31 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
 	  Some platforms (such as Rockchip) encapsulate the TEE inside
 	  U-Boot. This option makes sure optee-os gets built prior to
 	  U-Boot, and that the TEE variable pointing to OPTEE's
-	  tee.elf, is passed during the Buildroot build.
+	  core file, is passed during the Buildroot build.
+
+choice
+	prompt "U-Boot OPTEE TEE format"
+	default BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF
+	depends on BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
+	help
+	  Select the TEE format.
+	  You may select the TEE in ELF format only for OP-TEE
+	  versions before 3.8.0.
+	  Since this version, the TEE in binary format must be used as
+	  it contains important meta-data.
+
+config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF
+	bool "tee.elf"
+	help
+	  ELF format may be used only for OP-TEE versions before
+	  3.8.0.
+
+config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_BIN
+	bool "tee.bin"
+	help
+	  Binary format must be used for OP-TEE versions since 3.8.0.
+
+endchoice
 
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d8faef648f..b3094029e7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -196,7 +196,11 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
 UBOOT_DEPENDENCIES += optee-os
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF),y)
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
+else ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_BIN),y)
+UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.bin
+endif
 endif
 
 # TI K3 devices needs at least ti-sysfw (System Firmware) provided

--===============8853977759043477227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8853977759043477227==--
