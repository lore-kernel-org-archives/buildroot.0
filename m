Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2411AFD88C6
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D169D4188F;
	Tue, 10 Mar 2026 22:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUbtxMFSwVTV; Tue, 10 Mar 2026 22:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F89140C92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773182667;
	bh=NsbFpB3sg0wKh+AmAwQNml6Tk08SY8tJHCx8IeABt60=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dDVMC9DYzJF8LsQretvhlA0tu56HAZtmLXqtw7LmUdU+CQnuQaOInx/RiYr1co61v
	 hZ0xb+qKKF0u/i5S78ZYDHhSuyeteh+XdmedXMULx69M8y5P6agiBEX1D8+4HJ7BY9
	 iP0tquvcu11E+8iIGU0OjHU05KBUP9yrqPSv2GYhIChVDsrf9EVK64PodTkNUVcCN+
	 FuxYLCM5ClGYsL8QIm3iejcx5Qmu7kIo0AeEjLZ5g0yYjJbvHRjKrfdX7uwDyVLdGD
	 G4F7JXtuxm/U7QpTjuitWBlkgA5BIu9pMrP7t+4zNo/Jb+UjE2ETZuOdFOInu1Gbkz
	 StzyEz6b3amfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F89140C92;
	Tue, 10 Mar 2026 22:44:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 981DE33A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95F45827B5
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6s7Db7lDR7iH for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4229E82313
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4229E82313
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AE5B869CB; Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 23:20:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5f5c08dcd34452023cbf79ea30071828fb66c1a
X-Git-Newrev: d18531b529491a70397a73690b17304a93a127ab
X-Patchwork-Hint: ignore
Message-Id: <20260310224423.4AE5B869CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add support for embedded TEE
 in raw binary format
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3397208758388622848=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3397208758388622848==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d18531b529491a70397a73690b17304a93a127ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Some platforms such Texas Instrument’s K3 familly of SoCs requires
TEE in raw binary format to support their boot flow [1].

Add a new option to select tee-raw.bin instead of tee.bin.

[1] https://docs.u-boot.org/en/latest/board/ti/k3.html#building-tispl-bin

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/uboot/Config.in | 12 ++++++++++++
 boot/uboot/uboot.mk  |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 17b7f95f50..3331b81e8c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -314,6 +314,18 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_BIN
 
 	  Binary format must be used for OP-TEE versions since 3.8.0.
 
+config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN
+	bool "tee-raw.bin"
+	help
+	  Raw binary suitable to copy into physical memory where OP-TEE
+	  be can executed from.
+
+	  OP-TEE since 3.21 suggests to use tee-raw.bin instead of (the
+	  still identical) tee-pager_v2.bin.
+
+	  Texas Instrument’s K3 family of SoCs embed tee-raw.bin in
+	  U-Boot (using Binman tool) to support their boot flow.
+
 endchoice
 
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6ddbb9e438..5b3f46ac74 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -204,6 +204,8 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF),y)
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 else ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_BIN),y)
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.bin
+else ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN),y)
+UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee-raw.bin
 endif
 endif
 

--===============3397208758388622848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3397208758388622848==--
