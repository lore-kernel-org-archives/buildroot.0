Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755BEC6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 13:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2417382F40;
	Tue, 21 Feb 2023 13:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2417382F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EfB0S0kZsCvf; Tue, 21 Feb 2023 13:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5051A82CCA;
	Tue, 21 Feb 2023 13:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5051A82CCA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DE9E1BF215
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77B0C40FD0
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77B0C40FD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fdr5xDxbCqC8 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 13:30:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 525664013B
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 525664013B
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 13:30:49 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id 6so4034895wrb.11
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 05:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tX1xAPo2xd5rDKVB7LG4LSPrY99GJiwLzklFQohoKe8=;
 b=PMVS7yiJz42qolfP9Xhv/cM1IUFI8e7ebWKTA+fm7C4VbvQFtr0CaNnXFERcHJg+sM
 c1mqRsOoJ1mc2g5ORJ/q5dsi32l+nz64FyMmKzSA00HQg8K1ZfDarCrijC+MVVMqFU+t
 +CDXwnybgY9u0hJ+j6ho5SixLKvuNjwTp261iINbsjot0z6Idy4zsFgU5rLC9eV2Bxth
 6nY4nm7164fCIFo+GHjZzvAWN/Dlm+HlbKnxGDFLF9bCf9Dk/5cwAqQeSAhPV+EKGw48
 w4zxw1Uko3BZVVVEVQLwj563U9WiuyoHgVlIm9kzER4Q1SE/csQaqlXeXCDE4UgZR6YN
 pOwQ==
X-Gm-Message-State: AO0yUKUZn8VEkeTNSvITBkvDzJgwU6QgnrC/sI58RpF2pPVG9MeAz7iI
 tVLeMPDZ7F73B8VbK/u3Ufz2gYfppq4=
X-Google-Smtp-Source: AK7set/Ht/FXFQPg15wEMVi9aGd1kwBSsdQ0tYkiCsnQEDk2m4GhMGDsviSZeuxv3ZaVP5Y1BhmfjA==
X-Received: by 2002:a5d:5645:0:b0:2c5:a4fc:58a9 with SMTP id
 j5-20020a5d5645000000b002c5a4fc58a9mr3639586wrw.55.1676986247059; 
 Tue, 21 Feb 2023 05:30:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 iz4-20020a05600c554400b003e203681b26sm1801167wmb.29.2023.02.21.05.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 05:30:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 14:30:41 +0100
Message-Id: <20230221133041.963258-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tX1xAPo2xd5rDKVB7LG4LSPrY99GJiwLzklFQohoKe8=;
 b=mlqlC4bSluTnjuuGroZUHzlTzTizBGMty1apqBzcnBf6Sr2YAbJqqcus2LCX3rdBs6
 p0F7w642BhIkDathr689A1K5t7oIxacKTcGh/c61YNGGMj1jdjsamjIsqt8l13HgtaxX
 SdKjSXJ1tW1orlvVWF2Y2ciuoOO+5QX6KhPynC1ADftDVN/PrpNAK/JGVmExPKqMrcvC
 rA4RzhMBljPv+LNEHhDd9KI5pVOr4VJsm/p7ttCx9/ZRgCVdyayfdOzZvAjvsaQHMqOG
 4I6HUkZlLA4dz+C4pSNn6pBY+5H9Uqs0hFvLHMy0Zvl8Pz1KhAkM2doHjOLpiGTi5MEk
 S/cQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mlqlC4bS
Subject: [Buildroot] [PATCH 1/1] package/ace: fix build with libressl >=
 3.5.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

/tmp/instance-17/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:45:19: error: variable 'BIO_METHOD methods_ACE' has initializer but incomplete type
   45 | static BIO_METHOD methods_ACE =
      |                   ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7f40d6dde03134238151c248fbbd66e4713546cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Asynch_BIO.cpp-fix-build-with-libres.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch

diff --git a/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch b/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
new file mode 100644
index 0000000000..4f9fde5579
--- /dev/null
+++ b/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
@@ -0,0 +1,56 @@
+From 82b139f921ddb549c1bd236030bbc86e314852b3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 21 Feb 2023 14:20:11 +0100
+Subject: [PATCH] ACE/ace/SSL/SSL_Asynch_BIO.cpp: fix build with libressl >=
+ 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+/tmp/instance-17/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:45:19: error: variable 'BIO_METHOD methods_ACE' has initializer but incomplete type
+   45 | static BIO_METHOD methods_ACE =
+      |                   ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7f40d6dde03134238151c248fbbd66e4713546cb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/DOCGroup/ACE_TAO/pull/2053]
+---
+ ACE/ace/SSL/SSL_Asynch_BIO.cpp | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/ace/SSL/SSL_Asynch_BIO.cpp b/ace/SSL/SSL_Asynch_BIO.cpp
+index 0faa775fc0..5543598873 100644
+--- a/ace/SSL/SSL_Asynch_BIO.cpp
++++ b/ace/SSL/SSL_Asynch_BIO.cpp
+@@ -41,7 +41,8 @@ extern "C"
+ 
+ #define BIO_TYPE_ACE  ( 21 | BIO_TYPE_SOURCE_SINK )
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ static BIO_METHOD methods_ACE =
+   {
+     BIO_TYPE_ACE, // BIO_TYPE_PROXY_SERVER,
+@@ -68,14 +69,15 @@ static BIO_METHOD methods_ACE =
+ #else
+ static BIO_METHOD* methods_ACE;
+ # define BIO_set_num(b, val)
+-#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER) */
++#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L) */
+ 
+ ACE_BEGIN_VERSIONED_NAMESPACE_DECL
+ 
+ BIO *
+ ACE_SSL_make_BIO (void * ssl_asynch_stream)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+   BIO * const pBIO = BIO_new (&methods_ACE);
+ #else
+   if (!methods_ACE)
+-- 
+2.39.0
+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
