Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3537C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82C4D402A4;
	Sat, 11 Dec 2021 23:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBKXOMSldY_c; Sat, 11 Dec 2021 23:08:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EBB340236;
	Sat, 11 Dec 2021 23:08:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 543AD1BF95C
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 434C260C0E
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 42zf6UHkOoPF for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:06:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FED260A98
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:06:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1BF4582ABC; Sat, 11 Dec 2021 23:01:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 23:35:55 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: f86b3d0b1ffe631a40c11087bfad754239b1a222
X-Git-Newrev: 117e8a460dd346a44ceb94fcf6df2abee951a3d2
X-Patchwork-Hint: ignore
Message-Id: <20211211230119.1BF4582ABC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/gmp: fix
 CVE-2021-43618
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

commit: https://git.buildroot.net/buildroot/commit/?id=117e8a460dd346a44ceb94fcf6df2abee951a3d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

GNU Multiple Precision Arithmetic Library (GMP) through 6.2.1 has an
mpz/inp_raw.c integer overflow and resultant buffer overflow via crafted
input, leading to a segmentation fault on 32-bit platforms.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9d0536d82d722f46c235ab99e916c4ab67f46292)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-mpz-inp_raw.c-Avoid-bit-size-overflows.patch | 27 ++++++++++++++++++++++
 package/gmp/gmp.mk                                 |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch b/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
new file mode 100644
index 0000000000..0003f342c3
--- /dev/null
+++ b/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
@@ -0,0 +1,27 @@
+# HG changeset patch
+# User Marco Bodrato <bodrato@mail.dm.unipi.it>
+# Date 1634836009 -7200
+# Node ID 561a9c25298e17bb01896801ff353546c6923dbd
+# Parent  e1fd9db13b475209a864577237ea4b9105b3e96e
+mpz/inp_raw.c: Avoid bit size overflows
+
+[Retrieved from: https://gmplib.org/repo/gmp-6.2/rev/561a9c25298e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -r e1fd9db13b47 -r 561a9c25298e mpz/inp_raw.c
+--- a/mpz/inp_raw.c	Tue Dec 22 23:49:51 2020 +0100
++++ b/mpz/inp_raw.c	Thu Oct 21 19:06:49 2021 +0200
+@@ -88,8 +88,11 @@
+ 
+   abs_csize = ABS (csize);
+ 
++  if (UNLIKELY (abs_csize > ~(mp_bitcnt_t) 0 / 8))
++    return 0; /* Bit size overflows */
++
+   /* round up to a multiple of limbs */
+-  abs_xsize = BITS_TO_LIMBS (abs_csize*8);
++  abs_xsize = BITS_TO_LIMBS ((mp_bitcnt_t) abs_csize * 8);
+ 
+   if (abs_xsize != 0)
+     {
+
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 5e16ef1916..9b402767fd 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -14,6 +14,9 @@ GMP_CPE_ID_VENDOR = gmplib
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
 
+# 0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
+GMP_IGNORE_CVES += CVE-2021-43618
+
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 # Disable for ARM v7m since it has different asm constraints
 ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
