Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE25C5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 18:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94753409C3;
	Fri,  7 Aug 2026 18:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPJjgY2LrvoW; Fri,  7 Aug 2026 18:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87AD5409C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786128514;
	bh=llyNyLt7EkpQAz0BZnFw8h7tPDGj2cCZJKbcjBXUIxE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m6GtyhE7CqQdN7WUBECDq9f++Zetlviui+xTBM4DRHCJZkyCq14yByYPKSY13J21C
	 A29wN1HyrSS00WCG+QRcbSGrGKVy9H5627Gb4svVhzN/szyOLlx0B6+0odV6N1J7WQ
	 sqIEDx4F/HvZOxwyG6U0hqD3f+aKAn5fXKBt4kZaq98GE66K7GxUjO1FRPMIieIlXt
	 qgv2vgMtREWjhYUsel7Ffxi+xRqojSBQL9c1EBBqdpHDQTUQYQGIJSzdZfneJrCsT8
	 wPN9EgJBOUCNgCEUumCL9/AYB1zUPKedU4fxSQAFjhN5etoeX0IYjvHqoMUBE4yzl+
	 kGPAF5crhL6ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87AD5409C7;
	Fri,  7 Aug 2026 18:48:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3DE1282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 18:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C54FC8128A
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 18:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jrvg9pdoGcp5 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 18:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A98D381283
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A98D381283
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A98D381283
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 18:48:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c228.dip0.t-ipconnect.de [79.214.194.40])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51BFCA4C4912;
 Fri,  7 Aug 2026 20:48:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41014)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wsPcJ-000000002Bw-2imD;
 Fri, 07 Aug 2026 18:48:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  7 Aug 2026 20:48:27 +0200
Message-ID: <20260807184827.2636726-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786128508;
 bh=PPYS1ulyYd5AN4mXi7wcZ/4YKzLZvQri9+6LRSdYOgU=;
 h=From:To:Cc:Subject:Date:From;
 b=ELinxRuCxAqdP6WV18bG5C57rziJXTImldrpeDjjHY095h4kKXdehRGBw6vV7eImn
 pKqp3BK0vXTawJ2kVcxBntJXUe/KgtYn7Vpw1W4C36FP6g+ZqZRleuSjIMO4kcUIeG
 aBRZWdgoFjDGmoPELye7V55arDtDIuHW14RBlr15ge+3Q+DloditWI/ioCFewaEy21
 nAYmhSLglOmMPZOQyqETSt/pNc14mqj8CTCHKHIM3UiMrfy6idpOt9dmHJyngrk29n
 WBhyJ6BIGqlrOdN9RWRTVSiovxK3xVHtBmb3Si2oLif8C9XPHzNpvTUFOKc2neFQ81
 mL9CKJN/FY3KQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ELinxRuC
Subject: [Buildroot] [PATCH 1/1] package/gcc: bump 16.x series to 16.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gcc.gnu.org/pipermail/gcc-announce/2026/000193.html

GCC 16.2 is a bug-fix release from the GCC 16 branch
containing important fixes for regressions and serious bugs in
GCC 16.1 with more than 102 bugs fixed since the previous release.

For the list of bugs fixed in this version, see:
https://gcc.gnu.org/gcc-16/changes.html#16.2

Removed patch 0003 which was backported from the gcc-16 branch and is
included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...w-SImode-for-condition-flag-register.patch | 90 -------------------
 ...le-split-stack-for-non-thread-builds.patch |  0
 ...-config-microblaze-fix-ira-for-GCC15.patch |  0
 package/gcc/Config.in.host                    |  2 +-
 package/gcc/gcc.hash                          |  4 +-
 5 files changed, 3 insertions(+), 93 deletions(-)
 delete mode 100644 package/gcc/16.1.0/0003-or1k-Allow-SImode-for-condition-flag-register.patch
 rename package/gcc/{16.1.0 => 16.2.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
 rename package/gcc/{16.1.0 => 16.2.0}/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch (100%)

diff --git a/package/gcc/16.1.0/0003-or1k-Allow-SImode-for-condition-flag-register.patch b/package/gcc/16.1.0/0003-or1k-Allow-SImode-for-condition-flag-register.patch
deleted file mode 100644
index dfb3abcb13..0000000000
--- a/package/gcc/16.1.0/0003-or1k-Allow-SImode-for-condition-flag-register.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 3f1812fd97467bbc69c53169c663a9c4d26c1550 Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Mon, 4 May 2026 05:08:51 +0800
-Subject: or1k: Allow SImode for condition flag register
-
-Commit
-
-eb2ea476db2 emit-rtl: Allow extra checks for paradoxical subregs [PR119966]
-
-changed validate_subreg to return false on the paradoxical SImode subreg
-of the OpenRISC condition flag register (reg:BI sr_f), which triggered
-
-internal compiler error: in emit_move_multi_word, at expr.cc:4497
-
-c0694f95f59 or1k: Fix ICE in libgcc caused by recent validate_subreg changes
-
-changed or1k_can_change_mode_class to allow changing flags mode from BI
-to SI.  But or1k_hard_regno_mode_ok still returns false for condition
-flag register in SImode.  Update or1k_hard_regno_mode_ok to also allow
-condition flag register in SImode.
-
-Tested with or1k Linux cross compiler for or1k glibc build.
-
-gcc/
-
-	PR target/120587
-	PR target/125155
-	* config/or1k/or1k.cc (or1k_hard_regno_mode_ok): Allow condition
-	condition flag register in SImode.
-
-gcc/testsuite/
-
-	PR target/120587
-	PR target/125155
-	* gcc.target/or1k/pr125155.c: New test.
-
-Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
-(cherry picked from commit 710581c80b2fd39fa7a8674eccf7dca8cbc7c9c0)
-
-Upstream: https://gcc.gnu.org/cgit/gcc/commit/?h=releases/gcc-16&id=3f1812fd97467bbc69c53169c663a9c4d26c1550
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- gcc/config/or1k/or1k.cc                  |  7 ++++---
- gcc/testsuite/gcc.target/or1k/pr125155.c | 14 ++++++++++++++
- 2 files changed, 18 insertions(+), 3 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/or1k/pr125155.c
-
-diff --git a/gcc/config/or1k/or1k.cc b/gcc/config/or1k/or1k.cc
-index 17240e3ee48d..66fd784f8b91 100644
---- a/gcc/config/or1k/or1k.cc
-+++ b/gcc/config/or1k/or1k.cc
-@@ -1389,10 +1389,11 @@ or1k_trampoline_init (rtx m_tramp, tree fndecl, rtx chain)
- static bool
- or1k_hard_regno_mode_ok (unsigned int regno, machine_mode mode)
- {
--  /* For OpenRISC, GENERAL_REGS can hold anything, while
--     FLAG_REGS are really single bits within SP[SR].  */
-+  /* For OpenRISC, GENERAL_REGS can hold anything, while FLAG_REGS are
-+     really single bits within SP[SR].  Also allow condition flag register
-+     in SImode to match or1k_can_change_mode_class.  */
-   if (REGNO_REG_CLASS (regno) == FLAG_REGS)
--    return mode == BImode;
-+    return mode == BImode || mode == SImode;
-   return true;
- }
- 
-diff --git a/gcc/testsuite/gcc.target/or1k/pr125155.c b/gcc/testsuite/gcc.target/or1k/pr125155.c
-new file mode 100644
-index 000000000000..8ca95475b666
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/or1k/pr125155.c
-@@ -0,0 +1,14 @@
-+/* { dg-do compile } */
-+/* { dg-options "-O2" } */
-+
-+int __pthread_keys_0_0;
-+int
-+___pthread_key_delete (void)
-+{
-+  int result = 22;
-+  int __atg3_old = 0;
-+  if (__atomic_compare_exchange_n (&__pthread_keys_0_0, &__atg3_old,
-+				   0, 0, 2, 0))
-+    result = 0;
-+  return result;
-+}
--- 
-cgit 
-
diff --git a/package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/16.2.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/16.2.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/16.1.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch b/package/gcc/16.2.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch
similarity index 100%
rename from package/gcc/16.1.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch
rename to package/gcc/16.2.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e80c864cf1..d8b89d942c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -70,7 +70,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "14.4.0"    if BR2_GCC_VERSION_14_X
 	default "15.3.0"    if BR2_GCC_VERSION_15_X
-	default "16.1.0"    if BR2_GCC_VERSION_16_X
+	default "16.2.0"    if BR2_GCC_VERSION_16_X
 	default "arc-2024.12-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index edd8ab7061..a1230d758e 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
 sha512  725ed8bdd43ef1726ffe8b5e8615a13e247fac9575b7626ae013a2975d000ea213212dc414b2f2631ac4785c1c8beca85555222faf9904d3b2fa6a3807a83a15  gcc-14.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.3.0/sha512.sum
 sha512  0de9e296153b52c021b1c7e63c9c62151d7a0ac03f23ce6e9f772c1b0eb783f6acdd81cc4567bfe4128a6f64968c2cfc8eff40b36229cba7425349f7d637c654  gcc-15.3.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.1.0/sha512.sum
-sha512  b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b295ca94c98964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a  gcc-16.1.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.2.0/sha512.sum
+sha512  c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1  gcc-16.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  7f08ae335d9112be65e92c3744c095d8fa265994b8282274948f99fe37409531e627e6dadfb77b138a82fa09d012c56d8c075b482a5a5186814a57f9db63c29e  gcc-arc-2024.12-release.tar.gz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
