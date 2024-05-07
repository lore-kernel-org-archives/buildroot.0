Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D95C25B4F
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 16:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A9A060B15;
	Tue,  7 May 2024 16:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbtqrjOlWWbp; Tue,  7 May 2024 16:13:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96BD260781
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96BD260781;
	Tue,  7 May 2024 16:13:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E09A11BF591
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA2DC40370
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HvB16kVF-_b for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 16:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30E7C401C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30E7C401C2
 for <buildroot@buildroot.org>; Tue,  7 May 2024 16:13:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A77E86A27; Tue,  7 May 2024 16:13:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 18:07:32 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c681f1dc7d3c6b88621fb77ad34bcbc85558cafe
X-Git-Newrev: 95f301fe98d357114f52b3a9ebb4cffae7ca0f7e
X-Patchwork-Hint: ignore
Message-Id: <20240507161335.2A77E86A27@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/elf2flt: fix
 riscv64 noMMU build
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

commit: https://git.buildroot.net/buildroot/commit/?id=95f301fe98d357114f52b3a9ebb4cffae7ca0f7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119961

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 8d366dbf562a959a3dca3ee6972d5a67f67aa885)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nt-for-new-style-ctors-when-using-riscv64.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/elf2flt/0001-fix-alignment-for-new-style-ctors-when-using-riscv64.patch b/package/elf2flt/0001-fix-alignment-for-new-style-ctors-when-using-riscv64.patch
new file mode 100644
index 0000000000..fea726dab2
--- /dev/null
+++ b/package/elf2flt/0001-fix-alignment-for-new-style-ctors-when-using-riscv64.patch
@@ -0,0 +1,34 @@
+From eead8d5e9f3911243182311f16178c25c6ea03c4 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 23 Mar 2024 07:23:45 +0100
+Subject: [PATCH] fix alignment for new-style ctors when using riscv64
+
+Recently uClibc-ng enabled UCLIBC_CTOR_DTOR for riscv64, so
+that f.e. C++ applications are running fine. As a side effect
+this breaks noMMU support. The problem is the alignment for
+the ctors in elf2flt. This patch fixes it.
+
+Tested with Qemu for ARM, M68k and Xtensa with no regressions.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/uclinux-dev/elf2flt/commit/eead8d5e9f3911243182311f16178c25c6ea03c4
+---
+ elf2flt.ld.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/elf2flt.ld.in b/elf2flt.ld.in
+index a99c69e..230c382 100644
+--- a/elf2flt.ld.in
++++ b/elf2flt.ld.in
+@@ -139,7 +139,7 @@ R_RODAT:	*(.gnu.linkonce.r*)
+ 		@SYMBOL_PREFIX@_ssro_size = @SYMBOL_PREFIX@_essro - @SYMBOL_PREFIX@_ssro;
+ 		PROVIDE(@SYMBOL_PREFIX@_SDA2_BASE_ = @SYMBOL_PREFIX@_ssro + (@SYMBOL_PREFIX@_ssro_size / 2));
+ 
+-		. = ALIGN(4) ;
++		. = ALIGN(8) ;
+ TOR:		@SYMBOL_PREFIX@__CTOR_LIST__ = .;
+ TOR:		LONG((@SYMBOL_PREFIX@__CTOR_END__ - @SYMBOL_PREFIX@__CTOR_LIST__) / 4 - 2)
+ SINGLE_LINK:	/* gcc uses crtbegin.o to find the start of
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
