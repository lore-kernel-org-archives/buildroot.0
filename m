Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261C4C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 17:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A293F4077E;
	Mon,  6 Jul 2026 17:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEV9xtDDweSy; Mon,  6 Jul 2026 17:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4796407CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783359960;
	bh=NapIhWQmbhdEVMr8B6kDyjUJo0fpk1PzB1U7VGc8Sdo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BDJySO80JH4Vq2BnI+IMCxbXMUUD8iceDHQQk4Zkt3zaL7akB6qemVpgti9ni0paS
	 YaSO/mHCE0Yya5/yad1bXaUK5PeG8GL5PHvdMIJVJcs7OtEKyYRctzO3o5vUyLoDZs
	 nT/+HRwjnhaDzrBKPzCrTr+2Bon0QVpVrJsfRCdC9CXdzgwEFDlz+ATfYovFrYiBCt
	 0Koomohs6x0EMMhusbhHwOSRY6l7b/evk8/fJW5QaV+VVHYx4WKxxm9hxe5lsBvCwB
	 /SX1GTWbGLlFO5Y3Wgbd+mn0/1/AUdZCW6l5j6K4IkxdJ38BNx0PGYI9S3H5nKIzaz
	 VDLx13VU27jCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4796407CE;
	Mon,  6 Jul 2026 17:46:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06CA9316
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 17:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E11A3407CE
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 17:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxm43F6BcKID for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 17:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 80B574077E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80B574077E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80B574077E
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 17:45:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb1c.dip0.t-ipconnect.de [84.161.187.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3DFB3A4C00F4;
 Mon,  6 Jul 2026 19:45:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57530)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wgnOF-0000000016n-3TgA;
 Mon, 06 Jul 2026 17:45:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jul 2026 19:45:55 +0200
Message-ID: <20260706174555.2892229-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783359956;
 bh=POv2uw4Gx2/0aCH5x3pz3YV2KmpyL1LCHPxOsAEjbFs=;
 h=From:To:Cc:Subject:Date:From;
 b=HCzSQJbJAzwGamMgTB86XKzIiAhkXbXTYHd7zAceescNDJUN4v+5fdMI5VAcuAsmA
 KSRu51EX4kplgE+1UBO2TlMNgEoKCy5XLwU3ZHhzkIT4VfcOR4LW7y+ZIsBsvuXZA/
 32OXdvxKODLMnNL84mwGDS7vDpgKiXhE40j/1bgqTSpRhsQE5OhRq6NAzPmRpJmM6U
 KM8K91g3E1sNIIM9YYvVUla+4UnzCVj1vLsreEnPeXVT8MJx3pIGJzcxmuMR8+4dLz
 tUz5MVAoHe42BvxaMX3ngvqF7Rekn3vGRGBp//dNWpoCDAVle6KszGTBsUOor6diMr
 05SmTPYq/q0Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HCzSQJbJ
Subject: [Buildroot] [PATCH 1/1] package/gcc: 15.3.0: add GCC patch to fix
 mips/glibc build issue
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

Fixes a build error with glibc:

programs/locfile.c: In function 'align_locale_data':
programs/locfile.c:584:1: internal compiler error:
 in mips_load_store_insns, at config/mips/mips.cc:3137

by backporting an upstream fix which is already included in gcc 16.1.

The build error does not occur with gcc 14.x.

Fixes:
https://autobuild.buildroot.org/results/b925a444bb3ef03354224ac643b0b3160c4c5e8a/

The oldest recorded build error dates back to July 2025:
https://autobuild.buildroot.net/results/cb1/cb156fb938de26dd5dfe7fc48a1e061efa0284c7/

so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ion-123833-Use-of-insn-attributes-in.patch | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 package/gcc/15.3.0/0003-PR-rtl-optimization-123833-Use-of-insn-attributes-in.patch

diff --git a/package/gcc/15.3.0/0003-PR-rtl-optimization-123833-Use-of-insn-attributes-in.patch b/package/gcc/15.3.0/0003-PR-rtl-optimization-123833-Use-of-insn-attributes-in.patch
new file mode 100644
index 0000000000..81b43a5757
--- /dev/null
+++ b/package/gcc/15.3.0/0003-PR-rtl-optimization-123833-Use-of-insn-attributes-in.patch
@@ -0,0 +1,85 @@
+From 654c733fa3f10531f3fd6b6d89e39f28c0075bd6 Mon Sep 17 00:00:00 2001
+From: Roger Sayle <roger@nextmovesoftware.com>
+Date: Sat, 7 Feb 2026 07:50:41 +0000
+Subject: [PATCH] PR rtl-optimization/123833: Use of insn attributes in
+ insn_costs corrupts recog_data.
+
+Thanks again to Jeff Law and Andrew Pinski.  Here's a revised patch that
+addresses the true underlying cause of PR 128333.  recog.cc's cancel_changes
+was not correctly updating the recog_data cache, which leads to strange
+(incorrect) behavior in fwprop and ifcvt.
+
+2026-02-07  Roger Sayle  <roger@nextmovesoftware.com>
+	    Andrew Pinski  <andrew.pinski@oss.qualcomm.com>
+	    Jeff Law  <jeffrey.law@oss.qualcomm.com>
+
+gcc/ChangeLog
+	PR rtl-optimization/123833
+	* recog.cc (cancel_changes): Update the recog_data cache if it
+	holds the instruction being changed.
+
+gcc/testsuite
+	PR rtl-optimization/123833
+	* gcc.target/mips/pr123833.c: New test case.
+
+Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=654c733fa3f10531f3fd6b6d89e39f28c0075bd6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gcc/recog.cc                             |  6 +++++-
+ gcc/testsuite/gcc.target/mips/pr123833.c | 26 ++++++++++++++++++++++++
+ 2 files changed, 31 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/mips/pr123833.c
+
+diff --git a/gcc/recog.cc b/gcc/recog.cc
+index 48f6b45ec6d..f37e548d6ab 100644
+--- a/gcc/recog.cc
++++ b/gcc/recog.cc
+@@ -608,7 +608,11 @@ cancel_changes (int num)
+       else
+ 	*changes[i].loc = changes[i].old;
+       if (changes[i].object && !MEM_P (changes[i].object))
+-	INSN_CODE (changes[i].object) = changes[i].old_code;
++	{
++	  INSN_CODE (changes[i].object) = changes[i].old_code;
++	  if (recog_data.insn == changes[i].object)
++	    recog_data.insn = nullptr;
++	}
+     }
+   num_changes = num;
+ }
+diff --git a/gcc/testsuite/gcc.target/mips/pr123833.c b/gcc/testsuite/gcc.target/mips/pr123833.c
+new file mode 100644
+index 00000000000..4d0c9e8eaec
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/mips/pr123833.c
+@@ -0,0 +1,26 @@
++/* { dg-do compile } */
++/* { dg-options "-O1 -mabi=64 -mhard-float" } */
++
++typedef short int16_t;
++typedef signed char int8_t;
++typedef long long int64_t;
++typedef unsigned char uint8_t;
++typedef unsigned long long uint64_t;
++
++#define BS_VEC(type, num) type __attribute__((vector_size(num * sizeof(type))))
++BS_VEC(int8_t, 2) backsmith_pure_0(int64_t);
++uint64_t backsmith_pure_4(int16_t BS_ARG_0)
++{
++    BS_VEC(int16_t, 16)
++    BS_VAR_0 = __builtin_convertvector(
++        __builtin_shufflevector(backsmith_pure_0(0), backsmith_pure_0(0), 0, 2,
++                                2, 3, 2, 1, 2, 3, 0, 2, 0, 0, 2, 2, 0, 1),
++        BS_VEC(int16_t, 16));
++    for (;;)
++    {
++        if (__builtin_ctzg((uint8_t)BS_VAR_0[3], BS_ARG_0))
++            for (;;);
++        return 0;
++    }
++}
++
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
