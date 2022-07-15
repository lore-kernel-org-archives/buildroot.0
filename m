Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1614C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Jul 2022 22:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7764285075;
	Fri, 15 Jul 2022 22:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7764285075
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSx_1lQFgvtP; Fri, 15 Jul 2022 22:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E07D84EED;
	Fri, 15 Jul 2022 22:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E07D84EED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C71001BF263
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 22:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A03C940475
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 22:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A03C940475
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGlf1zlcJFgW for <buildroot@lists.busybox.net>;
 Fri, 15 Jul 2022 22:43:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65A37400CB
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65A37400CB
 for <buildroot@buildroot.org>; Fri, 15 Jul 2022 22:43:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a5so8546235wrx.12
 for <buildroot@buildroot.org>; Fri, 15 Jul 2022 15:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ar6cZvnDr6lOl/IdT9uDpjkitefufPULVdPxLZ6t9uA=;
 b=HRUpHT6Hye/3v7IKesPpbiLZag3Jelm8QP2I71kGnrCMrN2frm4IhKvyBGnx3dvin4
 b4o2yRIx/C/zxQY9/ryqxdhEUnLK6dR09lYMrOHijvqOHznHboVHeNjowJqZzc2QHfZL
 XiuP2A/UXc+22NL6pV5p7TtZWAQI6pqF7yXQrDHPccSwcfzcVlqBsZwyouLv2I49+O2O
 quGdR3hJkggTDQbogkKkJZ6/G5tX1yO1TYqqcDqdaMlw35N9oUi5kJB+MzkENjc00pZD
 Uk7tBVENCc6Mn2aAyoqDTjVHrjw3EUnRvLcUIsX9c3B6eIA5pLgA5SjzQcKkQpk+xVvp
 1OPA==
X-Gm-Message-State: AJIora9Ed1egrZF7gyyhl3xCHd3ElU1V/DJ6vJbiiioHFjgs8zSYmUIf
 rSEBgqc/ww3Q3PMZlvivbjLAmOCtXw0=
X-Google-Smtp-Source: AGRyM1s/d0cVjOAPD65jY8wtS/u5O8L2DUyIAORGYghcJsF8JYOo8md99Fok5NGy4x/4DMVPafq0tg==
X-Received: by 2002:a5d:67c9:0:b0:21d:ee08:b0b4 with SMTP id
 n9-20020a5d67c9000000b0021dee08b0b4mr893010wrw.537.1657924992205; 
 Fri, 15 Jul 2022 15:43:12 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1c5444000000b003a30572072esm5616664wmi.6.2022.07.15.15.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 15:43:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 00:39:29 +0200
Message-Id: <20220715223929.118674-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ar6cZvnDr6lOl/IdT9uDpjkitefufPULVdPxLZ6t9uA=;
 b=QIeIiODT/w0VsejayTJkTaqp2paykD8KV3JDhh/++8rsI2Q4v3BIurhJNQxqr4Z638
 TSyTSDCeSxRotx+RDPyERtY1akp4tv5scnm+CKz0Y/YnAVa//nJMUgDOCaC9oG7+fjKL
 oWypYBsFLG0ASpXQNRtUCEj3C+lnSKEjMRcDQVb137fKCeOPvL6Y7skJ/zO0Ln8c20O6
 qLRzrpUlFClwxAKg1CAfxfH9VaixDfeUuA3UhV465vlUv/MuiLRB2dLNfyE7c0tVJH4e
 nnJYGEgA/52K6fYskqtu0tBWRW5zrotN/tQptjed1fzW+77TgStTnxlJf8p6WDfc9GkC
 tTwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QIeIiODT
Subject: [Buildroot] [PATCH 1/1] package/libp11: bump to version 0.4.12
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

- Drop patch (already in version)
- This bump will also fix the following build failure with libressl raised
  since bump to version 3.5.2 in commit
  8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

  p11_cert.c: In function 'pkcs11_store_certificate':
  p11_cert.c:310:34: error: dereferencing pointer to incomplete type 'X509' {aka 'struct x509_st'}
    310 |  signature_nid = OBJ_obj2nid(x509->sig_alg->algorithm);
        |                                  ^~

https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.12

Fixes:
 - http://autobuild.buildroot.org/results/3acfa1419b59f7daa58fa8e61abc63ecb00f853c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libp11/0001-Update-wp11_rsa.c.patch | 26 ---------------------
 package/libp11/libp11.hash                  |  2 +-
 package/libp11/libp11.mk                    |  2 +-
 3 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 package/libp11/0001-Update-wp11_rsa.c.patch

diff --git a/package/libp11/0001-Update-wp11_rsa.c.patch b/package/libp11/0001-Update-wp11_rsa.c.patch
deleted file mode 100644
index 0a2d6e65ce..0000000000
--- a/package/libp11/0001-Update-wp11_rsa.c.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4968cfc64dbaa39bb479a24d9578d75099e2f337 Mon Sep 17 00:00:00 2001
-From: patchMonkey156 <pagorman@asu.edu>
-Date: Mon, 19 Oct 2020 17:12:15 -0400
-Subject: [PATCH] Update p11_rsa.c
-
-Bugfix for new LibreSSL version 3.2.2
-[Retrieved from:
-https://github.com/OpenSC/libp11/commit/4968cfc64dbaa39bb479a24d9578d75099e2f337]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/p11_rsa.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/p11_rsa.c b/src/p11_rsa.c
-index b6beef0..ff12ed7 100644
---- a/src/p11_rsa.c
-+++ b/src/p11_rsa.c
-@@ -336,7 +336,7 @@ int pkcs11_get_key_size(PKCS11_KEY *key)
- 	return RSA_size(rsa);
- }
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100005L || defined(LIBRESSL_VERSION_NUMBER)
-+#if ( ( defined (OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x10100005L ) || ( defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3020199L ) )
- 
- int (*RSA_meth_get_priv_enc(const RSA_METHOD *meth))
- 		(int flen, const unsigned char *from,
diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index 52d73d4206..0e42bdd4cf 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  57d47a12a76fd92664ae30032cf969284ebac1dfc25bf824999d74b016d51366  libp11-0.4.11.tar.gz
+sha256  1e1a2533b3fcc45fde4da64c9c00261b1047f14c3f911377ebd1b147b3321cfd  libp11-0.4.12.tar.gz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index c1873a920c..7718573ace 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.11
+LIBP11_VERSION = 0.4.12
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
