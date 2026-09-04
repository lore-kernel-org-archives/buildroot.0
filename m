Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB65C79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 18:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0137C40B65;
	Fri,  4 Sep 2026 18:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecVgpW6IODMj; Fri,  4 Sep 2026 18:41:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 03C3340B6C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788547316;
	b=diXc8ya1wcem8V8HlcWf0OOHlEb5AzujZQgru2nuQ5dyOyaed/kcT/QP+dgVuBgBlx0x
	 KtFcYZ2WCXAWnUHzsaAKR2f89Ds+m2dTJS7oCwDnWQmkoOXkBJ1317qrB4IHAvF6P2HO6
	 KlIP7/7zmmYLTeHbr5QN4pWdcuMP1tt7qWLLYyoL/NfJ/8r7yXg30saETErfaj7i51uhS
	 oWFUT4z51dw2mwv9dKQvjHOMVI85oM9hjBsfycphvWJ96AMul7VvKqQzC9wvvBxe37tS8
	 sTI1U8Fo0WVT9dIoXtAuOGmkawubaKUXA6qs86001MPAMZ9b4fIuo7NLDopX5fVd6KQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788547316;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=YyQ5azfgG/SGbv3a2LQ7wJZ0ngOrTq55PCiNk53Os0Y=;
	b=YoIDRU0nlulxEDHUo+h4ShSJtBbIuKjgpkq5iyoqWHsVVziIrYBrgB2Xcg7/wDJD7Eyk
	 p7YKxFK0h7kL9ecmq/YWLoYLTdD3CZpzsIQij9wRT8mMP9/xmhLhsxq4wDluMQAuS0u+l
	 vWNn0lyH3UKhf/un9hyGRCed2nRPAVvLiexAa15t0oXoNcRf1wJFO6pCftCYerwEIGE99
	 aTDzUZ+FIY32W9In134N6Tn7pg3xxLzJuMBHgpNeli34s7+ODVL7ALdcG42wJvdGaIHgw
	 prbLQLfRIKq0lki9l66bcdvoeiZHLb71rVEGuV+BKeDmkMa4coj86Q6HhVawC4SlGJw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788547316;
	bh=YyQ5azfgG/SGbv3a2LQ7wJZ0ngOrTq55PCiNk53Os0Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nNaF43qFa1d1QRZz7vddpWFKjfh7BZi8yl0GlvgR9NsfwMu+awmsCp1CiLbPGU69Q
	 Ppgbsuo1vN4bMGhPivEGy92/ON2bn8hdmxWL5/iHg0OOOtSvd6l5+2UiS5xt6fsX41
	 QV96hjwe/ChUsBFoK75hjXf4VRW7OyHlAFJvZ6bKlv1rjQaQz30Y64VxSbPiqIqSc9
	 bYZ76vP0JfVg9cdon1XvFPSQWfVf8yHP16RyCtq18kUQSF2Dxjyu56PDxwEBdyEh7h
	 eRbRD9aDcZAbsW+hICWp+ljmOOjj3oj9FF2Em3hiseupmFCDyGE91C7xO9cw7Gf5I6
	 8kv2nFe2zUK1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C3340B6C;
	Fri,  4 Sep 2026 18:41:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 913D13DA
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77A2D404F9
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyeCZWS1Oz8g for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 18:41:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5F924404F8
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788547313;
 b=fDo0oW6OMj4x3Uad/1SNk/zeoaChJiXgbKzY1jAwFg3YcKzeCKQPL0XjW4227K1SCxhZ
 Umkvosng5kVYOGgn2fzHlP4fYsgxRN1LG+Lx98UPVCkWLUN6YBqYl4JQTUuNHTMAZupwE
 9lFGmDnms+mCFO0XONp/CDtq1QByoz3cQQXceQp55LBs//ZMwM+LP0k995dcxONvr4w4y
 aqe1GpqwvuZ0lDiqc7WP4IiJ4/BS0GYkUzEhXxzZzqQJH+5kEPtV8UO2/7IWroz0FY+1p
 8QDeeoaxvXoiyM3QZPZbJ82C+Ta3gD4A17b4kbNjK9Uns3CO0o3Y5esglWbEiCTitAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788547313;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=MTbGycoeZkF6LUh5XdZ43K3qPyZ8cF+co78E+xBCdHs=;
 b=rEeL0S77rzYpYR9rgLBL0n0esRgujbh5G9TqT0KAB3Ftjncn5JwIcdpGhUuG4MT23l7S
 OMJYRCXmVa5F7yh4HHWZVhxlrBsveiBAqGZ/HPnZBLrTY7v8A14HZZ/JCOpNAtkrOyLGp
 BP4F+Y2Z3hKB8hgZdp9jTNGl7Y78axpVJs57tFNc4RegDI5um4+PDZ8eEcouxfKoskTX5
 SF5BRksgmSccYJ05DYW07wfRK852ffSsTIJ319E5A4Alv+dZ0LFPlLX3Htn8yqssGbI7N
 Hftpr8pC8VDGLdEXxBBMzE0XlLn/DIcqVJZpTHpOHJtBi7cR2WcqOFXGUQjPVFoI2LQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bhJZas2b; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bhJZas2b
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F924404F8
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788547296;
 bh=MTbGycoeZkF6LUh5XdZ43K3qPyZ8cF+co78E+xBCdHs=;
 h=From:To:Cc:Subject:Date:From;
 b=bhJZas2bNlCmSahzni0qAQZKmmu9B5/sdLfvCcIgCYhCA1AebrHU62naNQtSmHOTR
 nMPjDO6iUq4s2x8QEZ0QfnPly/qbPRBTiwzkvI4GD61j02Bc9Sm6ybCvT9qz3vhIBN
 0B2QSvXfNihrusY63F6ceDligb7AJpbqNdAISdY0twaErGTFXbfJiBcki1+Nvcazzm
 LiRocY8Dp8LO+Po/rmQuHQcvMvkN7Zty21+0v+YLjcuEjXRMNAhYGfN153hyPMjWOB
 ZM0OnPDDkOpjL3gjKTO2Pge+MK37l3KUopW+igPC0JxKgxTJw52JZlFw0WQABrQGvu
 e5sa4H0O14nQA==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1B469A4C1FC3;
 Fri,  4 Sep 2026 20:41:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51846)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2Yr1-000000004rO-36lV;
 Fri, 04 Sep 2026 18:41:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri,  4 Sep 2026 20:41:33 +0200
Message-ID: <20260904184135.875634-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/3] package/libgcrypt: bump version to 1.12.3
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

https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000508.html

Added upstream patch to fix a build error introduced by this bump that
was detected by the Gitlab pipelines:

sm4-intel-avx512-amd64.S: Assembler messages:
sm4-intel-avx512-amd64.S:138: Error: operand size mismatch for `vsm4rnds4'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/641bea0dd5838e2ecb955efdb4a17684a35deaef

 ...-configure-check-for-AVX512-SM4-inst.patch | 108 ++++++++++++++++++
 package/libgcrypt/libgcrypt.hash              |   4 +-
 package/libgcrypt/libgcrypt.mk                |   2 +-
 3 files changed, 111 insertions(+), 3 deletions(-)
 create mode 100644 package/libgcrypt/0002-sm4-add-separate-configure-check-for-AVX512-SM4-inst.patch

diff --git a/package/libgcrypt/0002-sm4-add-separate-configure-check-for-AVX512-SM4-inst.patch b/package/libgcrypt/0002-sm4-add-separate-configure-check-for-AVX512-SM4-inst.patch
new file mode 100644
index 0000000000..67bcf667f5
--- /dev/null
+++ b/package/libgcrypt/0002-sm4-add-separate-configure-check-for-AVX512-SM4-inst.patch
@@ -0,0 +1,108 @@
+From f0bc379e0f3585908707095db5d3c505e664726f Mon Sep 17 00:00:00 2001
+From: Jussi Kivilinna <jussi.kivilinna@iki.fi>
+Date: Sun, 30 Aug 2026 11:16:11 +0300
+Subject: [PATCH] sm4: add separate configure check for AVX512 SM4 instructions
+
+* cipher/sm4-intel-avx512-amd64.S: Check for
+HAVE_GCC_INLINE_ASM_SM4_AVX512 instead of HAVE_GCC_INLINE_ASM_SM4.
+* cipher/sm4.c (USE_INTEL_SM4_AVX512): Require USE_INTEL_SM4_AVX2 and
+HAVE_GCC_INLINE_ASM_SM4_AVX512.
+* configure.ac (gcry_cv_gcc_inline_asm_sm4_avx512)
+(HAVE_GCC_INLINE_ASM_SM4_AVX512): New.
+--
+
+Toolchain may support VEX encoded SM4 instructions but not EVEX encoded
+ones. Commit adds separate check for EVEX coding and gates SM4-AVX512
+implementation behind the new check.
+
+Reported in FreeBSD bugtracker:
+ https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=297987
+
+Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
+
+Upstream: https://github.com/gpg/libgcrypt/commit/f0bc379e0f3585908707095db5d3c505e664726f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cipher/sm4-intel-avx512-amd64.S |  4 ++--
+ cipher/sm4.c                    |  8 +++-----
+ configure.ac                    | 24 ++++++++++++++++++++++++
+ 3 files changed, 29 insertions(+), 7 deletions(-)
+
+diff --git a/cipher/sm4-intel-avx512-amd64.S b/cipher/sm4-intel-avx512-amd64.S
+index c5eaa723..ac8076ec 100644
+--- a/cipher/sm4-intel-avx512-amd64.S
++++ b/cipher/sm4-intel-avx512-amd64.S
+@@ -23,7 +23,7 @@
+ #ifdef __x86_64
+ #if (defined(HAVE_COMPATIBLE_GCC_AMD64_PLATFORM_AS) || \
+      defined(HAVE_COMPATIBLE_GCC_WIN64_PLATFORM_AS)) && \
+-    defined(ENABLE_AVX512_SUPPORT) && defined(HAVE_GCC_INLINE_ASM_SM4)
++    defined(ENABLE_AVX512_SUPPORT) && defined(HAVE_GCC_INLINE_ASM_SM4_AVX512)
+ 
+ #include "asm-common-amd64.h"
+ 
+@@ -164,5 +164,5 @@ ELF(.size __sm4_intel_crypt_blk32,.-__sm4_intel_crypt_blk32;)
+ #define SM4_CRYPT_BLK32 __sm4_intel_crypt_blk32
+ #include "sm4-avx512-amd64.h"
+ 
+-#endif /*defined(ENABLE_AVX512_SUPPORT) && defined(HAVE_GCC_INLINE_ASM_SM4)*/
++#endif /*ENABLE_AVX512_SUPPORT && HAVE_GCC_INLINE_ASM_SM4_AVX512*/
+ #endif /*__x86_64*/
+diff --git a/cipher/sm4.c b/cipher/sm4.c
+index 482a7983..58aaea10 100644
+--- a/cipher/sm4.c
++++ b/cipher/sm4.c
+@@ -87,11 +87,9 @@
+ /* USE_INTEL_SM4_AVX512 indicates whether to compile with Intel SM4
+  * instructions (VSM4RNDS4) based AVX512 code. */
+ #undef USE_INTEL_SM4_AVX512
+-#if defined(ENABLE_AVX512_SUPPORT) && defined(HAVE_GCC_INLINE_ASM_SM4)
+-# if defined(__x86_64__) && (defined(HAVE_COMPATIBLE_GCC_AMD64_PLATFORM_AS) || \
+-     defined(HAVE_COMPATIBLE_GCC_WIN64_PLATFORM_AS))
+-#  define USE_INTEL_SM4_AVX512 1
+-# endif
++#if defined(USE_INTEL_SM4_AVX2) && defined(ENABLE_AVX512_SUPPORT) && \
++    defined(HAVE_GCC_INLINE_ASM_SM4_AVX512)
++# define USE_INTEL_SM4_AVX512 1
+ #endif
+ 
+ /* Assembly implementations use SystemV ABI, ABI conversion and additional
+diff --git a/configure.ac b/configure.ac
+index a5e8d683..ea7ea7ae 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1659,6 +1659,30 @@ if test "$gcry_cv_gcc_inline_asm_sm4" = "yes" ; then
+ fi
+ 
+ 
++#
++# Check whether GCC inline assembler supports EVEX encoded Intel SM4
++# instructions.
++#
++AC_CACHE_CHECK([whether GCC inline assembler supports AVX512 Intel SM4 instructions],
++       [gcry_cv_gcc_inline_asm_sm4_avx512],
++       [if test "$mpi_cpu_arch" != "x86" ||
++           test "$try_asm_modules" != "yes" ; then
++          gcry_cv_gcc_inline_asm_sm4_avx512="n/a"
++        else
++          gcry_cv_gcc_inline_asm_sm4_avx512=no
++          AC_LINK_IFELSE([AC_LANG_PROGRAM(
++          [[void a(void) {
++              __asm__("vsm4key4 %%zmm2, %%zmm1, %%zmm3\n\t":::"cc");
++              __asm__("vsm4rnds4 %%zmm2, %%zmm1, %%zmm3\n\t":::"cc");
++            }]], [ a(); ] )],
++          [gcry_cv_gcc_inline_asm_sm4_avx512=yes])
++        fi])
++if test "$gcry_cv_gcc_inline_asm_sm4_avx512" = "yes" ; then
++   AC_DEFINE(HAVE_GCC_INLINE_ASM_SM4_AVX512,1,
++     [Defined if inline assembler supports AVX512 Intel SM4 instructions])
++fi
++
++
+ #
+ # Check whether GCC inline assembler supports SSE4.1 instructions.
+ #
+-- 
+2.47.3
+
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 7be6554d56..e76496a7e4 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  7b8ff21966a0b6e7a735466b9b9b55d9dac9fa87  libgcrypt-1.12.2.tar.bz2
-sha256  7ce33c2492221a0436f96a8500215e9f3e3dcb5fd26a757cd415e7a843babd5e  libgcrypt-1.12.2.tar.bz2
+sha1  b4654d75f0e5d0850cc699f02c9b44a06367502f  libgcrypt-1.12.3.tar.bz2
+sha256  98d1b0b3202d2b03fa754a35aa3cbbfcf526a3260d8d2ee213748001b1043006  libgcrypt-1.12.3.tar.bz2
 # Locally calculated
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 0bc281da42..a49897fd4f 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.12.2
+LIBGCRYPT_VERSION = 1.12.3
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
