Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA2FC61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 993B880F17;
	Fri, 28 Aug 2026 14:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBkNzEI1IRtL; Fri, 28 Aug 2026 14:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927042;
	bh=C28ldLANOwCcQNbpXui0LPHH2ffhOp8lPcQaNNSIWEY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BpNkGK9kxy3nEm1Pm9aa/56cN869dLHa4CgKtOLcJIAz3oR3P9Gr32A3mr/uyBqLW
	 0nVIACLLywQlk9Dg3A3JwE77074kaZA9eA+CSwEGFUBIHsZMG+mL0xOrC/2NrUMZE2
	 KJeIssPkt//cZz3+NHtqRn/c0PpgnsaGCoSevO0nTfyX/CfMpnHcRXVo4YVCRbtR4K
	 d63aav60H9NbodScRCJx7717COKei/y7M9QiMX6DEztkBV+0DX0hwEP3qUVmEmJ0zF
	 g4/JS4MrSk9FaIIkMaj7SZ3pD7ZyckeMnuPVvM7DHsWHw9lwWty+nXgIqP4Hkq01We
	 AcwKXjc4jlYaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 192A580F7F;
	Fri, 28 Aug 2026 14:24:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01B65386
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3FC5407D6
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJ7KdFlveSQV for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D235407B3
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F10F921F9; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a6c86f85118caaec7e07188947f10fa38214e614
X-Git-Newrev: bc5042f1d1085bb9e9f8ca87a02c093ecd20857e
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.1F10F921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/Makefile.in: fix
 support for $(PKG)_FLAT_STACKSIZE
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc5042f1d1085bb9e9f8ca87a02c093ecd20857e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

When a package defines $(PKG)_FLAT_STACKSIZE, ELF2FLT_FLAGS contains
-Wl,-elf2flt="-r -s<stack-size>". The embedded quotes are needed to
keep both elf2flt options in single linker argument.

However, many package Makefiles wrap $(TARGET_CFLAGS) in double quotes,
for example:

  CFLAGS="$(TARGET_CFLAGS)"

After expansion, the embedded quote terminates the outer CFLAGS quote.
As a result, the shell interprets "-s<stack-size> ..." as a command
instead of passing it to the compiler.

Pass -r and -s<stack-size> in separate -Wl arguments instead. This
avoids embedded quotes; GCC forwards both -elf2flt options to
ld-elf2flt, which collects them before invoking elf2flt.

This got broken by commit
04d7ea4720cbc1e9c4d7ec6307aff71567b0653d ("package: Makefile.in: fix
elf2flt invocation options"), which by adding -r as an elf2flt
argument, did not correctly handle -s$($(PKG)_FLAT_STACKSIZE).

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
[Thomas: improve commit message]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e913afbeb1ad67ba43829aee94d01d8ca32120fe)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 829636900b..5a1c4fa63c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -210,7 +210,7 @@ ifeq ($(BR2_riscv),y)
 TARGET_CFLAGS += -fPIC
 endif
 ELF2FLT_FLAGS = $(if $($(PKG)_FLAT_STACKSIZE),\
-	-Wl$(comma)-elf2flt="-r -s$($(PKG)_FLAT_STACKSIZE)",\
+	-Wl$(comma)-elf2flt=-r -Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
         -Wl$(comma)-elf2flt=-r)
 TARGET_CFLAGS += $(ELF2FLT_FLAGS)
 TARGET_CXXFLAGS += $(ELF2FLT_FLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
