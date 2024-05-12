Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAB2C25B5F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A16F24209B;
	Sun, 12 May 2024 10:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLdcXqoZww4P; Sun, 12 May 2024 10:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57DD342130
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57DD342130;
	Sun, 12 May 2024 10:06:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16F6A1BF27A
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EAA784105
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGZ6vqmj_Xgf for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D10A1840EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D10A1840EF
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D10A1840EF
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:06:30 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id F024B35282A0; Sun, 12 May 2024 12:06:27 +0200 (CEST)
Date: Sun, 12 May 2024 12:06:27 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkCUo5vHs4Mc3cQx@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715508388; bh=hpX3MKCPxXO7VHfZcNouXCyEPtEDZTOHK0gDDjNK4wU=;
 h=Date:From:To:Subject:From;
 b=qlyDmwYi/Hfl7gmSMz1Yn+yqOr20QYBOh9ej7CClquFmiZ+GlD9O0HzMBdsw1xsA2
 RNkSD8V7+4gNgrv9QNWZTC2pR6jm/7BmMXnosCC9ln+Lz21+bKqmp/ZmTqBY5Rc3be
 7Uyk/DFKgNVOBUe6jt4FBj0kyyltgoQYD39G2ZF0JBwer3ukgjjM/xYcqjbsHaqJRM
 68QBsIWOOn7nEJFHFw/rQG/FjAsldHRps+gVxAg1pUZ5wvcNpKn0KKVzVwNgLOZ643
 HC2vlfEtWejRcZUf4Pv/euCmaMEJHSlsEkDRQBMLbzhuDPnvsVcWrsX6iiKjd93VVE
 d1Du1XY1oK4Kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=qlyDmwYi
Subject: [Buildroot] [PATCH 1/2] arch: allow riscv32 noMMU configuration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in.riscv | 3 +--
 package/Makefile.in  | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index d62e4ebc6c..3461f75800 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -51,7 +51,6 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
-	select BR2_USE_MMU
 
 config BR2_RISCV_64
 	bool "64-bit"
@@ -62,7 +61,7 @@ endchoice
 config BR2_RISCV_USE_MMU
 	bool "MMU support"
 	default y
-	depends on BR2_RISCV_64
+	depends on BR2_RISCV_64 || BR2_RISCV_32
 	select BR2_USE_MMU
 	help
 	  Enable this option if your RISC-V core has a MMU (Memory
diff --git a/package/Makefile.in b/package/Makefile.in
index b350c4b7b5..0a965c3a02 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -43,7 +43,7 @@ GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
 # FLAT binary format needs uclinux, except RISC-V 64-bits which needs
 # the regular linux name.
-ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
+ifeq ($(BR2_BINFMT_FLAT):$(BR2_riscv),y:)
 TARGET_OS = uclinux
 else
 TARGET_OS = linux
@@ -181,7 +181,7 @@ TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
 endif
 
 ifeq ($(BR2_BINFMT_FLAT),y)
-ifeq ($(BR2_RISCV_64),y)
+ifeq ($(BR2_riscv),y)
 TARGET_CFLAGS += -fPIC
 endif
 ELF2FLT_FLAGS = $(if $($(PKG)_FLAT_STACKSIZE),\
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
