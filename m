Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78452C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 16:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E7C3416C0;
	Wed, 24 Apr 2024 16:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDx6008hPaNx; Wed, 24 Apr 2024 16:11:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3FB8416B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3FB8416B3;
	Wed, 24 Apr 2024 16:11:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8DFC1BF575
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 16:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A509B60C1E
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 16:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7jWYjaBMxWF for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 16:11:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C86060C1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C86060C1C
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C86060C1C
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 16:11:40 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5D1C03528241; Wed, 24 Apr 2024 18:11:37 +0200 (CEST)
Date: Wed, 24 Apr 2024 18:11:36 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZikvOACQEGe9oG7x@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1713975097; bh=6IRsk3U+dt7kLydfqe2U2FyYfB28BgIJWbB4iYfrHPw=;
 h=Date:From:To:Cc:Subject:From;
 b=TN3YsymGM8zJe+x+ZC46MegPU4NslqqI2GWrLH4V6fOjvxsvxFe32njY80e0vx+ja
 vMVNszqbE1pc7eHei1tShyM6YGsWOabcyeSIxNEg3tRtIti8yoS8l+aRJjjKPIVj1z
 uYGimiiutAhQh+A3k9GJjYA+BZmStpZAkkxXVyOEHzdE3E4r3HWkPx7SJGgKL2mvCo
 AmHEwtCXejW7l8OQzycwcfuvGDY/9V4Saafw64FTi9Bel6bCVF3T5AfFZSfOlK3hmD
 H78HEskVdfUBeVE2eDHnm5JwkEhMApi9Wvd0XgFrnCssRfXYpWDBaYm8YJqnEtIAml
 ZFn4LTuONYFgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=TN3YsymG
Subject: [Buildroot] [PATCH] package/elf2flt: fix riscv64 noMMU build
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...r-new-style-ctors-when-using-riscv64.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/elf2flt/0001-fix-alignment-for-new-style-ctors-when-using-riscv64.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
