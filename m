Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA665C5DF81
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 19:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E7FA80F69;
	Thu, 20 Aug 2026 19:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ycPyOWW4dqU; Thu, 20 Aug 2026 19:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787253479;
	bh=pJhxQLy/1U/4AkrwpdC2uve4L2AaF13GH9VXcDVcIDY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o/jroa8WTU/1iI8/URmYlKnsf7fngUzReYMxfSBzsyfupi2PSmucbORZekVnWhhRp
	 HIxZpGodOiSFVV2LM8J5gU44N9tn0hLF+9hg9RjwX1jgJBcuDDxd6WkqdAa0gfXIUX
	 Kl8AgKitQ5+JYGEZ+4e3NUA42T58TOJj7D1YtB2yS5BipK9NeoaqZ92urHsEoR+yVt
	 3jYxUGUFMNYL6dUrydLP6vIBYeg792vfaDiVMO1r2Mk1zI1SV5QWmFuGYx/aP3hi83
	 Svbp3cefQbwjrUeCKh3UZuGSNviv25of35QCBVutNoqBdx0QzjNzKVqOejba0FVp+S
	 xK3pIhIUtv1zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D49E680E6A;
	Thu, 20 Aug 2026 19:17:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3760B198
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 19:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 272954081E
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 19:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mkcm6bkxGioI for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 19:17:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FDEB4081B
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 19:17:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CF448DF53; Thu, 20 Aug 2026 19:17:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 21:14:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5245c41441bacca292d129d4339e79e5179af79c
X-Git-Newrev: e913afbeb1ad67ba43829aee94d01d8ca32120fe
X-Patchwork-Hint: ignore
Message-Id: <20260820191704.3CF448DF53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: fix support for
 $(PKG)_FLAT_STACKSIZE
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e913afbeb1ad67ba43829aee94d01d8ca32120fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index eac28b3a96..229206d393 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -218,7 +218,7 @@ ifeq ($(BR2_riscv),y)
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
