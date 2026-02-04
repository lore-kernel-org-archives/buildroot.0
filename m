Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F38E83EE2
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 07:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FF3440C9B;
	Wed,  4 Feb 2026 07:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKXavtxJmg46; Wed,  4 Feb 2026 07:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD52F40BD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770190368;
	bh=hLY9AP6wFDOpWRjG0eUb10BjP/NOxsP32hY1CCZUYeo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b3407iI24vr9z/PU55IXKVK/9AqJ+aNcjx3mcTQCZsOD11lQ7oc09T1oLwbDKJJcg
	 LEDawCgtfUwsaUqBrM0Bly3M86ysCv7BTS2rnEJZYhb3G7XJPtVwmFITq/PI8ItvJ/
	 Pfn1CRDYcD7XrnORRPg4p7jbh5rLLLhvJ5SMDXgAhTtoRhhm5VUAtzpWzJa9AVaShJ
	 V8SiKVQQ/p/IFMjaP5a/P8HkguZAOB8YPM8HCFuyaOegpSGaE87XY3cyGI7dZLCEXB
	 bl3JrW23V5d3M9t2i7NlWWM3PSpOUXIPnxT9ZbCyXXBcF4tUsnAoWPVyI8OPUwWSvb
	 nRVzVdATVRKpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD52F40BD5;
	Wed,  4 Feb 2026 07:32:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BCC26173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 07:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9E8D83DF1
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 07:32:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9sV2xrAbdO4 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 07:32:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DACF83DEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DACF83DEC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DACF83DEC
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 07:32:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 842DCA4C537C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:32:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51460)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vnXNO-0000000060Y-1z8k
 for buildroot@buildroot.org; Wed, 04 Feb 2026 07:32:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 08:32:38 +0100
Message-ID: <20260204073238.472889-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770190359;
 bh=+iw+dba1FUoKsqE0+Q3xqHnlb5rb92gA+bMsTasXvcc=;
 h=From:To:Subject:Date:From;
 b=YuQ6mJmENdxp+r0Td7VFYV2c2S+tIGZ1iveupBkkLCcD3OHTWH0gw3J7I29eQyK72
 cmmCeeagLFlVKXsUw76PFqdC53KIBhMtTivF1cL/Y9FQbfr6jJ/BFPteXlXqAkkSWb
 UEWnt4r1njDz+F5s5/WEnci3OA/llxe4I9eYDeUNmQi7To2+qOc6HwETMMRgOdvWT1
 b/9ttNUx7WZKMCqX5FDIV1fXoEUczQM28sufpVRPubRNf3E1Aen+DMh63I5q0THQIP
 vuJumRN8S36jGHFIS6ty5l9Gzr+249PAvk7sO9XPLduoYIPc51l2EmZxE+tQWlstON
 aRpYOOi5LCiPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=YuQ6mJmE
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix powerpc64 build
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

Buildroot commit f710640be5869bb3716e254916ae614f79002f2f bumped the
package to version 3.6.0 that includes upstream commit
https://github.com/openssl/openssl/commit/8f24a148e6f112045cf110c3e3f4e2415d9c11fe
which causes build errors on powerpc64.

The upstream commit was also backported to older libopenssl branches:
https://github.com/openssl/openssl/pull/28990#issuecomment-3675219918
but its first appearance on the buildroot master branch was with said
bump to 3.6.0.

This patch adds an upstream patch to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/b28/b286ad40f2240a85b9cd0dc44e089d1d6babd3ea/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ppc.pl-Removed-.localentry-directive.patch | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch

diff --git a/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch b/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
new file mode 100644
index 0000000000..7c507a2687
--- /dev/null
+++ b/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
@@ -0,0 +1,69 @@
+From 5aaa7e5fdc59e88a13d2911cb86d814d4e2669da Mon Sep 17 00:00:00 2001
+From: Danny Tsen <dtsen@us.ibm.com>
+Date: Wed, 28 Jan 2026 07:23:13 -0500
+Subject: [PATCH] aes-gcm-ppc.pl: Removed .localentry directive
+
+Otherwise there is mixing of  ELFv1 ABI and ELFv2 ABI directives
+and PPC64 big endian builds fail.
+
+Fixes #29815
+
+Signed-off-by: Danny Tsen <dtsen@us.ibm.com>
+
+Reviewed-by: Paul Dale <paul.dale@oracle.com>
+Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+MergeDate: Tue Feb  3 08:39:50 2026
+(Merged from https://github.com/openssl/openssl/pull/29827)
+
+Upstream: https://github.com/openssl/openssl/commit/5aaa7e5fdc59e88a13d2911cb86d814d4e2669da
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ crypto/modes/asm/aes-gcm-ppc.pl | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/crypto/modes/asm/aes-gcm-ppc.pl b/crypto/modes/asm/aes-gcm-ppc.pl
+index 68918a9305a2b..fd5dcc22a6117 100644
+--- a/crypto/modes/asm/aes-gcm-ppc.pl
++++ b/crypto/modes/asm/aes-gcm-ppc.pl
+@@ -409,7 +409,6 @@
+ ################################################################################
+ .align 4
+ aes_gcm_crypt_1x:
+-.localentry	aes_gcm_crypt_1x,0
+ 
+ 	cmpdi	5, 16
+ 	bge	__More_1x
+@@ -492,7 +491,6 @@
+ ################################################################################
+ .align 4
+ __Process_partial:
+-.localentry	__Process_partial,0
+ 
+ 	# create partial mask
+ 	vspltisb 16, -1
+@@ -564,7 +562,6 @@
+ .global ppc_aes_gcm_encrypt
+ .align 5
+ ppc_aes_gcm_encrypt:
+-.localentry     ppc_aes_gcm_encrypt,0
+ 
+ 	SAVE_REGS
+ 	LOAD_HASH_TABLE
+@@ -752,7 +749,6 @@
+ .global ppc_aes_gcm_decrypt
+ .align 5
+ ppc_aes_gcm_decrypt:
+-.localentry	ppc_aes_gcm_decrypt, 0
+ 
+ 	SAVE_REGS
+ 	LOAD_HASH_TABLE
+@@ -1032,7 +1028,6 @@
+ .size   ppc_aes_gcm_decrypt,.-ppc_aes_gcm_decrypt
+ 
+ aes_gcm_out:
+-.localentry	aes_gcm_out,0
+ 
+ 	mr	3, 11			# return count
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
