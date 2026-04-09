Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937BFEA3C5D
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 13:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BA7060705;
	Thu,  9 Apr 2026 13:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMY0cz89OXhv; Thu,  9 Apr 2026 13:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 564766082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775740626;
	bh=vJPVB6D/fOUSX3zODZ6gGpBHLXUhkdot+5UYefKwIVI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KoAjwPKHqJqqxTpBja3Zl5+wzegQL5Q5jrFJYAByPA7g4LhUMj3o1AoFsHYtWPMiQ
	 sXUH0GfN292D2WzZDjkgI1DZbIXAw/uaCy8/gFSvbSehh92nPhiKsJzxfOGQ4DDiI7
	 DWwPpzbUXdHWSCWag2ZgpvNCHOZ8A1UzHK7LZMxSRKRb0goSEqWav96zr7QBxIXAhL
	 6T1Pp9ewkpxy1a/JCbv20W5osnmqvdWcad/qB5JGEJ7+/wr96/v9fkQzMdgXMIM5wo
	 FZB/4FriEk3XSK+2g2TgR111EAKSCTIGWdvEsproQE0Rs2OWpwbXPWCcHsZDboMQoQ
	 oG8oZR4e/L0AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 564766082A;
	Thu,  9 Apr 2026 13:17:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D091D1F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE36A6082A
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MebA7JrXfJaF for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 13:17:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FB1960705
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FB1960705
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FB1960705
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:17:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 61F8DA4C00FD
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:17:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41074)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wApFl-000000002Hg-1Cln
 for buildroot@buildroot.org; Thu, 09 Apr 2026 13:17:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 15:17:00 +0200
Message-ID: <20260409131700.278723-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775740621;
 bh=eZRbD6IuX/ZR1I1tB8M9AbDavtJBfIrENBrVnIlTzWg=;
 h=From:To:Subject:Date:From;
 b=FGGFSqMRQVy1hzQXVuRraE/ENQhE+RPHRtPZVZR8Vdu1ehRh5jAb3P0caeO/4Ks+6
 FDJyNfyVZ80PaBWJZagD5yaVDVfBpzFi/B2lhPdMHbRqJDMt3bUXn5Yg48h2iljjss
 +/TqM7AbpdgswGaJiX/TsPYrNttQLlR8XE80KxhIJl26Fyu+otky0qEE7KaqVUNXuK
 dJfT3waeOwQ/aHralSQQ+6u3SQnstrfv+Sh6X8kK/sYoKE6bEp4/TSiwAhzxATflfX
 e4C41yH1BzTJ6euITXm/c9NyfvGsoQwIEmo9HaaitXNFNuf+dSDbrONG5wcWfGfaNm
 KdBLXWwrgOnXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=FGGFSqMR
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 3.6.2
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

https://openssl-library.org/post/2026-04-07-release-announcement/

Fixes the following vulnerabilities:

CVE-2026-31790 - Incorrect Failure Handling in RSA KEM RSASVE Encapsulation.
CVE-2026-28386 - Out-of-bounds Read in AES-CFB-128 on X86-64 with AVX-512 Support.
CVE-2026-28387 - Potential Use-after-free in DANE Client Code.
CVE-2026-28388 - NULL Pointer Dereference When Processing a Delta CRL.
CVE-2026-28389 - Possible NULL Dereference When Processing CMS KeyAgreeRecipientInfo.
CVE-2026-28390 - Possible NULL Dereference When Processing CMS KeyTransportRecipientInfo.
CVE-2026-31789 - Heap Buffer Overflow in Hexadecimal Conversion.

Removed patch 0004 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ppc.pl-Removed-.localentry-directive.patch | 69 -------------------
 package/libopenssl/libopenssl.hash            |  4 +-
 package/libopenssl/libopenssl.mk              |  2 +-
 3 files changed, 3 insertions(+), 72 deletions(-)
 delete mode 100644 package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch

diff --git a/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch b/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
deleted file mode 100644
index 7c507a2687..0000000000
--- a/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 5aaa7e5fdc59e88a13d2911cb86d814d4e2669da Mon Sep 17 00:00:00 2001
-From: Danny Tsen <dtsen@us.ibm.com>
-Date: Wed, 28 Jan 2026 07:23:13 -0500
-Subject: [PATCH] aes-gcm-ppc.pl: Removed .localentry directive
-
-Otherwise there is mixing of  ELFv1 ABI and ELFv2 ABI directives
-and PPC64 big endian builds fail.
-
-Fixes #29815
-
-Signed-off-by: Danny Tsen <dtsen@us.ibm.com>
-
-Reviewed-by: Paul Dale <paul.dale@oracle.com>
-Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-MergeDate: Tue Feb  3 08:39:50 2026
-(Merged from https://github.com/openssl/openssl/pull/29827)
-
-Upstream: https://github.com/openssl/openssl/commit/5aaa7e5fdc59e88a13d2911cb86d814d4e2669da
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- crypto/modes/asm/aes-gcm-ppc.pl | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/crypto/modes/asm/aes-gcm-ppc.pl b/crypto/modes/asm/aes-gcm-ppc.pl
-index 68918a9305a2b..fd5dcc22a6117 100644
---- a/crypto/modes/asm/aes-gcm-ppc.pl
-+++ b/crypto/modes/asm/aes-gcm-ppc.pl
-@@ -409,7 +409,6 @@
- ################################################################################
- .align 4
- aes_gcm_crypt_1x:
--.localentry	aes_gcm_crypt_1x,0
- 
- 	cmpdi	5, 16
- 	bge	__More_1x
-@@ -492,7 +491,6 @@
- ################################################################################
- .align 4
- __Process_partial:
--.localentry	__Process_partial,0
- 
- 	# create partial mask
- 	vspltisb 16, -1
-@@ -564,7 +562,6 @@
- .global ppc_aes_gcm_encrypt
- .align 5
- ppc_aes_gcm_encrypt:
--.localentry     ppc_aes_gcm_encrypt,0
- 
- 	SAVE_REGS
- 	LOAD_HASH_TABLE
-@@ -752,7 +749,6 @@
- .global ppc_aes_gcm_decrypt
- .align 5
- ppc_aes_gcm_decrypt:
--.localentry	ppc_aes_gcm_decrypt, 0
- 
- 	SAVE_REGS
- 	LOAD_HASH_TABLE
-@@ -1032,7 +1028,6 @@
- .size   ppc_aes_gcm_decrypt,.-ppc_aes_gcm_decrypt
- 
- aes_gcm_out:
--.localentry	aes_gcm_out,0
- 
- 	mr	3, 11			# return count
- 
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 0e0dbd3926..05777cdac2 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.6.1/openssl-3.6.1.tar.gz.sha256
-sha256  b1bfedcd5b289ff22aee87c9d600f515767ebf45f77168cb6d64f231f518a82e  openssl-3.6.1.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.2/openssl-3.6.2.tar.gz.sha256
+sha256  aaf51a1fe064384f811daeaeb4ec4dce7340ec8bd893027eee676af31e83a04f  openssl-3.6.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index d580947899..bd4b889c88 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.6.1
+LIBOPENSSL_VERSION = 3.6.2
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
