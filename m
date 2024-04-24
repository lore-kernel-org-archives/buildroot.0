Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FEBC4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 19:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ECB560D88;
	Wed, 24 Apr 2024 19:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9fIa-2u5HjY; Wed, 24 Apr 2024 19:42:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D80760D8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D80760D8C;
	Wed, 24 Apr 2024 19:42:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC27E1BF34A
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8583822CD
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_iysWaMIbfY for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 19:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B038A82254
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B038A82254
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 19:42:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6C498610F; Wed, 24 Apr 2024 19:42:17 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 24 Apr 2024 21:39:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 256aa8ed85f8fd65ea0f0f242adb55f95a13eb2b
X-Git-Newrev: 8d366dbf562a959a3dca3ee6972d5a67f67aa885
X-Patchwork-Hint: ignore
Message-Id: <20240424194217.A6C498610F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elf2flt: fix riscv64 noMMU build
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d366dbf562a959a3dca3ee6972d5a67f67aa885
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119961

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
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
