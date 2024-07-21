Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B02C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 07:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 201174040A;
	Sun, 21 Jul 2024 07:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5No-cFnNBg6v; Sun, 21 Jul 2024 07:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A486440474
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A486440474;
	Sun, 21 Jul 2024 07:41:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6242F1BF868
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 07:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FB4840042
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 07:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKv4i-eqqsQq for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 07:41:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 945AA4040A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 945AA4040A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 945AA4040A
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 07:41:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-427cede1e86so22086695e9.0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 00:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721547687; x=1722152487;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vz+L0mnOtCXe8Ql8BN0eR7L7nZtR0rI1JV07Sih1nQI=;
 b=lECURFnm5GH62hDvPhWeP0TNO+jqHKHDLqw0yuy9YxEP/xJF1hQobLdLn4Ss6eiSsl
 qEkCDnGalUbO0JCW0Ynn9DwT5ZYlbkSB2FQkvw1rDKpwEK09+YuWy/iwMotmh61lIkwX
 I9Jiao0xbp8PsLOagQCczosKQbAIucBOG/kvGmgp1NM+Nlf5QIZrow3sWS60a65nQMCM
 IjSgSua4KQYNCpwhwkGlgy/wUsKHWaPO1A0sj/fTE9i/h69x0TKjGgisasC41VRofcWh
 /gN4o6eq1f9x0Yo+lpFer+AdLOz+NkeLl4Ix9zX+IcZcY5sz602PtLWevhYlaAmMyN5q
 2J5A==
X-Gm-Message-State: AOJu0YziPowwWHPziommoCWJDLEQZ+WXvcekOewfptyNcAfbJF1vaIz5
 uWvVE4nxgBzKsE+4iXkav/GG0CkiFGA3ZgYB4tunDCQ/qrz1ngT+8ZYB/w==
X-Google-Smtp-Source: AGHT+IFODRTgvBHxoUN1bYSJmI/9BzJX+/CMnZwxk8SUJyC+MNotFy3kaC66NzxuVFqgMnuj0fWEdw==
X-Received: by 2002:a05:600c:4fcd:b0:426:5587:752e with SMTP id
 5b1f17b1804b1-427dc520548mr20407335e9.14.1721547686534; 
 Sun, 21 Jul 2024 00:41:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787eced0sm5323126f8f.98.2024.07.21.00.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 00:41:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 09:40:52 +0200
Message-ID: <20240721074053.90620-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721547687; x=1722152487; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vz+L0mnOtCXe8Ql8BN0eR7L7nZtR0rI1JV07Sih1nQI=;
 b=brHmxz/BNPTpGz61EFU+3hbpodehhBzM06UmWnY98T635KHqgiLSFFZLiERkF8ZjqY
 +duhspVTVMaxWiTm4LYEaHwS/hFPSrpiYvpyWZ3JOIHJrze3ObavcU572t3l908sNM+R
 d/p/POf+4iqNlxhjMbwyvoE+AQToONhjdMzsSRFmFsWZIzWVNnhQ4r/5nt5/1kqY/hY1
 tVsFF0Lj0QexOJDTLcfTgnyj/zgPNDkcOx1r5qy7O2OrfDOGmr51ALSaq7C7qW01IDJr
 uKS7fGYrVSioq3r+byNCTbXhS3OVmE+Hf/863khhYimOsVuRmIGcnGUAYakbsl1mnWKa
 KrkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=brHmxz/B
Subject: [Buildroot] [PATCH 1/2] package/ibm-sw-tpm2: bump to version
 rev183-2024-03-27
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
Cc: Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Refresh first patch
- Drop second patch (fix differentl by
  https://sourceforge.net/p/ibmswtpm2/tpm2/ci/ebe82ac82fef97feddc558f3c3ad16baf67e6921/)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-Use-LONG_BIT-to-define-RADIX_BITS.patch | 65 +++++++++----------
 .../0002-Add-support-for-OpenSSL-3-2-x.patch  | 28 --------
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash          |  2 +-
 package/ibm-sw-tpm2/ibm-sw-tpm2.mk            |  2 +-
 4 files changed, 33 insertions(+), 64 deletions(-)
 delete mode 100644 package/ibm-sw-tpm2/0002-Add-support-for-OpenSSL-3-2-x.patch

diff --git a/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
index bb5d3a96ee..8d83116dfc 100644
--- a/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
+++ b/package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch
@@ -14,52 +14,49 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 [Bernd: rebased for git rev 5452af422edeff70fcae8ea99dd28a0922051d7b]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Fabrice: rebase for rev183-2024-03-27]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/LibSupport.h     | 21 +++------------------
  src/TcpServerPosix.c |  1 +
  src/makefile         |  2 ++
  3 files changed, 6 insertions(+), 18 deletions(-)
 
-diff --git a/src/LibSupport.h b/src/LibSupport.h
+diff --git a/src/tpm_radix.h b/src/tpm_radix.h
 index 5055560..48b1e16 100644
---- a/src/LibSupport.h
-+++ b/src/LibSupport.h
-@@ -64,32 +64,9 @@
- #ifndef _LIB_SUPPORT_H_
- #define _LIB_SUPPORT_H_
- 
--/* kgold added power and s390 */
+--- a/src/tpm_radix.h
++++ b/src/tpm_radix.h
+@@ -61,27 +61,9 @@
+ //** Introduction
+ // Common defines for supporting large numbers and cryptographic buffer sizing.
+ //*********************
 -#ifndef RADIX_BITS
--#   if defined(__x86_64__) || defined(__x86_64)				\
--    || defined(__amd64__) || defined(__amd64)				\
--    || defined(_WIN64) || defined(_M_X64)		 		\
--    || defined(_M_ARM64) || defined(__aarch64__) 			\
--    || defined(__powerpc64__) || defined(__PPC64__) || defined(__ppc64__) \
--    || defined(__s390x__)
--#       define RADIX_BITS                      64
--#   elif defined(__i386__) || defined(__i386) || defined(i386)		\
--    || defined(_WIN32) || defined(_M_IX86)				\
--    || defined(_M_ARM) || defined(__arm__) || defined(__thumb__)	\
--    || defined(__powerpc__) || defined(__PPC__)
--#       define RADIX_BITS                      32
--#   elif defined(__riscv) || defined(__riscv__)
--#       if __riscv_xlen == 32
--#            define RADIX_BITS                 32
--#       elif __riscv_xlen == 64
--#            define RADIX_BITS                 64
--#       else
--#            error Unsupported __riscv_xlen value
--#       endif
--#   else
--#       error Unable to determine RADIX_BITS from compiler environment
--#   endif
--#endif // RADIX_BITS
+-#  if defined(__x86_64__) || defined(__x86_64) || defined(__amd64__)	\
+-    || defined(__amd64) || defined(_WIN64) || defined(_M_X64) || defined(_M_ARM64) \
+-    || defined(__aarch64__) || defined(__PPC64__) || defined(__s390x__) \
+-    || defined(__powerpc64__) || defined(__ppc64__)
+-#    define RADIX_BITS 64
+-#  elif defined(__i386__) || defined(__i386) || defined(i386) || defined(_WIN32) \
+-    || defined(_M_IX86)
+-#    define RADIX_BITS 32
+-#  elif defined(_M_ARM) || defined(__arm__) || defined(__thumb__)
+-#    define RADIX_BITS 32
+-#  elif defined(__riscv)
+-// __riscv and __riscv_xlen are standardized by the RISC-V community and should be available
+-// on any compliant compiler.
+-//
+-// https://github.com/riscv-non-isa/riscv-toolchain-conventions
+-#    define RADIX_BITS __riscv_xlen
+-#  else
+-#    error Unable to determine RADIX_BITS from compiler environment
+-#  endif
+-#endif  // RADIX_BITS
 +#include <limits.h>
 +
 +#define RADIX_BITS LONG_BIT
  
- // These macros use the selected libraries to the proper include files.
- #define LIB_QUOTE(_STRING_) #_STRING_
+ #if RADIX_BITS == 64
+ #  define RADIX_BYTES 8
 diff --git a/src/TcpServerPosix.c b/src/TcpServerPosix.c
 index cad0402..6293cdd 100644
 --- a/src/TcpServerPosix.c
diff --git a/package/ibm-sw-tpm2/0002-Add-support-for-OpenSSL-3-2-x.patch b/package/ibm-sw-tpm2/0002-Add-support-for-OpenSSL-3-2-x.patch
deleted file mode 100644
index 6732efce8c..0000000000
--- a/package/ibm-sw-tpm2/0002-Add-support-for-OpenSSL-3-2-x.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From beea0f97b3c95ec69f3e269df1af87eb2cdd3c46 Mon Sep 17 00:00:00 2001
-From: Otto Hollmann <otto@hollmann.cz>
-Date: Tue, 12 Dec 2023 13:58:32 +0100
-Subject: [PATCH] Add support for OpenSSL 3.2.x
-
-Upstream: https://github.com/kgoldman/ibmswtpm2/pull/13
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/TpmToOsslMath.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/TpmToOsslMath.h b/src/TpmToOsslMath.h
-index 0b18191..1271937 100644
---- a/src/TpmToOsslMath.h
-+++ b/src/TpmToOsslMath.h
-@@ -76,10 +76,10 @@
-  * As of release 3.0.0, OPENSSL_VERSION_NUMBER is a combination of the
-  * major (M), minor (NN) and patch (PP) version into a single integer 0xMNN00PP0L
-  */
--#if OPENSSL_VERSION_NUMBER > 0x30100ff0L
-+#if OPENSSL_VERSION_NUMBER > 0x30200ff0L
- // Check the bignum_st definition in crypto/bn/bn_lcl.h or crypto/bn/bn_local.h and either update
- // the version check or provide the new definition for this version.
--// Currently safe for all 3.1.x
-+// Currently safe for all 3.2.x
- #   error Untested OpenSSL version
- #elif OPENSSL_VERSION_NUMBER >= 0x10100000L
- // from crypto/bn/bn_lcl.h
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
index 392fb59815..3c2d0e758f 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  da7799baa1d38cd9d2f491006de45d38805db9d5a77c38af6e78728bd318f93e  ibm-sw-tpm2-5452af422edeff70fcae8ea99dd28a0922051d7b-git4.tar.gz
+sha256  239cea3ec99cb31fb25c1ba4fe9b98a862bb20daefefeba8908d370bedd42a31  ibm-sw-tpm2-rev183-2024-03-27-git4.tar.gz
 sha256  dd2d31b560011ea673e197251e710e52669d911367d83cd3cfd018f8ed58bde9  LICENSE
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
index 4df61fe028..67ecd45923 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IBM_SW_TPM2_VERSION = 5452af422edeff70fcae8ea99dd28a0922051d7b
+IBM_SW_TPM2_VERSION = rev183-2024-03-27
 IBM_SW_TPM2_SITE = https://git.code.sf.net/p/ibmswtpm2/tpm2
 IBM_SW_TPM2_SITE_METHOD = git
 IBM_SW_TPM2_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
