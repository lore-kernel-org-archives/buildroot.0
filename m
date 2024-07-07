Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74311C30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 12:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F49981779;
	Sun,  7 Jul 2024 12:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8IZkChXVFJn; Sun,  7 Jul 2024 12:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29DC28177C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29DC28177C;
	Sun,  7 Jul 2024 12:16:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 005691BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 12:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0E4840502
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 12:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-aV6pE2ZXVt for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 12:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3954C400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3954C400BF
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3954C400BF
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 12:16:04 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-58b447c519eso3625015a12.3
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 05:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720354562; x=1720959362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZD0FVqYy/bvHbE3I14b0fIGmJLA4iwWSKvCpgRDPBCU=;
 b=my4CBU4CW4HWVYzHF9pfxoVCKRkhquSaLjmrOx+2ra1lndTcpURb3251bwWkfqj4tw
 uYbeoCd9xAZW/2D+VeOa58nLWYaqpuXKPmPr7cquGTnlXjvlu6hSLIcy/YfIkCRXrNHu
 A5z66i0U8HYp3u0iTfWId4qwipTmevA6sPpHevg/9gRco54oyewcye8uIP8NldvuqaC8
 GWCRKVV9FhUOcdn9Yakg3eguFHjfQXqleU3QvStB0sdRcAvvRX1fguF+zifOndlEiLtL
 W08X3oTP1VxtENOQ03HhVjIM7VJ6NQEI2Z1DhlNPQ8IxqTG99qbKrCHl4o9fzCIVpTcj
 mobQ==
X-Gm-Message-State: AOJu0Yxde7IdAKophahz/9CSSX3muMmI2DQ9GVl0bU3EIib3x9HZL/8z
 vqsqC+IfOmcu0lRM4wmv0ypaWN0S4ICOAYjd5vuXWe/L9UNEYRpvNcJt6P2fQkEOA3hFY20u2S6
 cwS4=
X-Google-Smtp-Source: AGHT+IFy7uxIwKfUny6BZM8fikH36m4rt4Mc+SwwMynmLkGUqdO+cu4iITucGrtzNciXYuGbG4SZ+w==
X-Received: by 2002:a05:6402:4409:b0:57d:24ce:cbc8 with SMTP id
 4fb4d7f45d1cf-58e5c72ffe2mr6504681a12.31.1720354561960; 
 Sun, 07 Jul 2024 05:16:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58fc77ce374sm2724157a12.30.2024.07.07.05.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 05:16:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 14:15:56 +0200
Message-ID: <20240707121556.4039945-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720354562; x=1720959362;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZD0FVqYy/bvHbE3I14b0fIGmJLA4iwWSKvCpgRDPBCU=;
 b=qqiIowvNeVMYkQfN8YFxSMcLowZj6OtmIGv2LcyRUzCqtztiM2fhVDOiQF9sQY7pVr
 YzaAGPaGxop80IdOA9wRvoWBRBq2Rzx+2+8NaOZKKclGBdHGPIdGOkoBdrqNmtYFnQRG
 dlk6t6vXlDtU+9vX8k/LCEPxbKM9kOz+Zt4F8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qqiIowvN
Subject: [Buildroot] [PATCH 1/1] package/vtun: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, vtun fails to build with output:

    Applying 0002-fix-ssl-headers-checks.patch using patch:
    patching file configure.in
    Hunk #1 succeeded at 169 (offset 3 lines).
    Hunk #2 succeeded at 179 (offset 3 lines).
    Hunk #3 FAILED at 193.
    Hunk #4 FAILED at 208.
    2 out of 4 hunks FAILED -- saving rejects to file configure.in.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/vtun/0002-fix-ssl-headers-checks.patch | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/vtun/0002-fix-ssl-headers-checks.patch b/package/vtun/0002-fix-ssl-headers-checks.patch
index 765411af841f..a095a1ba58b0 100644
--- a/package/vtun/0002-fix-ssl-headers-checks.patch
+++ b/package/vtun/0002-fix-ssl-headers-checks.patch
@@ -5,11 +5,13 @@ Do. Not. Do. That. It breaks cross-compilation.
 Also use the SSL headers dir to look for blowfish headers.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -durN vtun-3.0.3.orig/configure.in vtun-3.0.3/configure.in
 --- vtun-3.0.3.orig/configure.in	2009-03-29 12:08:51.000000000 +0200
 +++ vtun-3.0.3/configure.in	2013-02-16 23:44:44.004339680 +0100
-@@ -166,7 +166,7 @@
+@@ -169,7 +169,7 @@
     AC_MSG_RESULT()
     AC_CHECKING( for md5 Library and Header files ... )
  AC_SEARCH_HEADERS(md5.h,
@@ -18,7 +20,7 @@ diff -durN vtun-3.0.3.orig/configure.in vtun-3.0.3/configure.in
      ,
      AC_MSG_ERROR( SSL headers not found. )
     )
-@@ -176,7 +176,7 @@
+@@ -179,7 +179,7 @@
     AC_MSG_RESULT()
     AC_CHECKING( for blowfish Library and Header files ... )
     AC_SEARCH_HEADERS(blowfish.h,
@@ -27,7 +29,7 @@ diff -durN vtun-3.0.3.orig/configure.in vtun-3.0.3/configure.in
  	AC_CHECK_LIB(crypto, BF_set_key,
  	    [
  	       LIBS="$LIBS -lcrypto"
-@@ -193,7 +193,7 @@
+@@ -196,7 +196,7 @@
     AC_MSG_RESULT()
     AC_CHECKING( for AES Library and Header files ... )
     AC_SEARCH_HEADERS(aes.h,
@@ -35,8 +37,8 @@ diff -durN vtun-3.0.3.orig/configure.in vtun-3.0.3/configure.in
 +    $SSL_HDR_DIR ,
  	AC_CHECK_LIB(crypto, AES_set_encrypt_key,
  	    [
- 	       AC_DEFINE(HAVE_SSL_AES)
-@@ -208,7 +208,7 @@
+ 	       AC_DEFINE(HAVE_SSL_AES, [1], [Define to 1 if you have AES in openssl])
+@@ -211,7 +211,7 @@
     AC_MSG_RESULT()
     AC_CHECKING( for EVP Library and Header files ... )
     AC_SEARCH_HEADERS(evp.h,
@@ -44,4 +46,4 @@ diff -durN vtun-3.0.3.orig/configure.in vtun-3.0.3/configure.in
 +    $SSL_HDR_DIR ,
  	AC_CHECK_LIB(crypto, EVP_EncryptInit,
  	    [
- 	       AC_DEFINE(HAVE_SSL_EVP)
+ 	       AC_DEFINE(HAVE_SSL_EVP, [1], [Define to 1 if you have EVP in openssl])
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
