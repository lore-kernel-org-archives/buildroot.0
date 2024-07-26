Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202D1C3DA63
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 07:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6E6C40795;
	Fri, 26 Jul 2024 07:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4becRbXMP9N4; Fri, 26 Jul 2024 07:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E893408D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E893408D2;
	Fri, 26 Jul 2024 07:35:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12B131BF311
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F401C408D2
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSD9E-juDqPp for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 07:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E54E240795
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E54E240795
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 07:35:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1D9987508; Fri, 26 Jul 2024 07:35:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 09:34:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea3c465304d1d7a2891d9f47775996855461f117
X-Git-Newrev: b5c1ead57e93b32c900b58f4fd22259313fc5c0d
X-Patchwork-Hint: ignore
Message-Id: <20240726073523.D1D9987508@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc-ng-test: fix build with the
 musl C library
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b5c1ead57e93b32c900b58f4fd22259313fc5c0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Musl doesn't provide sys/asm.h header so we should add some defines
inside mips-specific header file to avoid build errors.

Fixes:

  http://autobuild.buildroot.net/results/af7a1d00930485f87f77762b34cae01873a8cd41/

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-error-absent-sys-asm-h.patch          | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch b/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch
new file mode 100644
index 0000000000..5c8cd3f463
--- /dev/null
+++ b/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch
@@ -0,0 +1,59 @@
+From a99d5bdb51bdab92a303c508b2b938ee0789d614 Mon Sep 17 00:00:00 2001
+From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Date: Thu, 25 Jul 2024 09:15:11 +0300
+Subject: [PATCH] Fix errors due to absent sys/asm.h in mips64 musl build
+
+Upstream: https://patchwork.ozlabs.org/project/uclibc-ng/patch/20240725081519.611076-1-dm.chestnykh@gmail.com/
+Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+---
+ test/tls/tls-macros-mips.h | 33 +++++++++++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+
+diff --git a/test/tls/tls-macros-mips.h b/test/tls/tls-macros-mips.h
+index eed0938..bd4c5c4 100644
+--- a/test/tls/tls-macros-mips.h
++++ b/test/tls/tls-macros-mips.h
+@@ -1,7 +1,40 @@
+ /* Macros to support TLS testing in times of missing compiler support.  */
+ 
+ #include <sys/cdefs.h>
++#if defined(__has_include) && __has_include(<sys/asm.h>)
+ #include <sys/asm.h>
++#else
++
++#define __STRING(x) #x
++
++#if ((_MIPS_SIM == _MIPS_SIM_ABI32 || _MIPS_SIM == _ABI32) && _MIPS_SZPTR == 32)
++#define PTR_ADDIU	addiu
++#define PTR_L		lw
++#endif
++
++#if _MIPS_SIM == _MIPS_SIM_NABI32 || _MIPS_SIM == _NABI32
++
++#if !defined __mips_isa_rev || __mips_isa_rev < 6
++#define PTR_ADDU	add
++#define PTR_ADDIU	addi
++#else
++#define PTR_ADDU        addu
++#define PTR_ADDIU       addiu
++#endif
++
++#define PTR_L		lw
++#endif
++
++#if ((_MIPS_SIM == _MIPS_SIM_ABI32 || _MIPS_SIM == _ABI32) && _MIPS_SZPTR == 64) \
++    || _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM ==  _ABIN32
++
++#define PTR_ADDU	daddu
++#define PTR_ADDIU	daddiu
++#define PTR_L		ld
++
++#endif
++
++#endif
+ 
+ #define __STRING2(X) __STRING(X)
+ #define ADDU __STRING2(PTR_ADDU)
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
