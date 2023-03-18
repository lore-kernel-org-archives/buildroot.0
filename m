Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76C4C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 12:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D7F54058B;
	Sat, 18 Mar 2023 12:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D7F54058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMC2NUQRJ7Xi; Sat, 18 Mar 2023 12:32:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8476E40147;
	Sat, 18 Mar 2023 12:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8476E40147
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0871BF834
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 12:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 552CE60B04
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 12:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 552CE60B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KK-a75qvdmWh for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 12:32:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C71760774
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C71760774
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 12:32:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id g18so4820231wmk.0
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 05:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679142740;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9CVt6kkYMZDqRb2C/BN9AmTne1vQngcHrqM1kUyjKzk=;
 b=Me4e4NfJVk4KjYSgGPO81g6p9SWWsWH39pN2k7fQ0RYiGOpKfN5ApKupYg4I0P5Unz
 KbMJQOXuC4kCjQ//fjHUPEorVxHsbo/V1xST027cMHlIPwNsvwa8LhMrA9ikyx6WTJbs
 h2F/ymla3EAYkEbijyl2AruzjYmpeA8oy04CUeDZo2z8rr54snVU26RNBcKnXDeYWQxT
 12kxCaIW9RMYeGjCtzK8J6zTGGw4s6WkqG87v7UuqMVSN/AMWnMydi89/MzGtt+of+pc
 rtlxL+Non07b0Dsk4yQDFNCRzPMyavYw3aH1jpvnqZvPX4HcAvBFmtqPIUBKwuiDCnoe
 L94g==
X-Gm-Message-State: AO0yUKXCzjhLL5WBEB85/EXtOPljRcohKVVTHUivgU4/FOVjG79omdIG
 +isxTxEfQXIjl3eDpeJILO3UTEOOzRE=
X-Google-Smtp-Source: AK7set/lPxzqR034epw0rglmemPau/pomN12s49vBZ7EvVD7dnWLCSo3XhLyMt+EQORZlK2d6menNw==
X-Received: by 2002:a05:600c:a0a:b0:3ed:2105:9ac6 with SMTP id
 z10-20020a05600c0a0a00b003ed21059ac6mr21505513wmp.28.1679142739850; 
 Sat, 18 Mar 2023 05:32:19 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x20-20020a1c7c14000000b003edc11c2ecbsm663085wmc.4.2023.03.18.05.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 05:32:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 13:32:17 +0100
Message-Id: <20230318123217.4940-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679142740;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9CVt6kkYMZDqRb2C/BN9AmTne1vQngcHrqM1kUyjKzk=;
 b=pVE5fasQGU6oKDENx4PIDbK7v4eSzfb20e95gO6hcGRm65SLQYJ0zKXp1ht9GLcZdH
 ZyVanLzm9kQ2vb0nz2nEDdbN3mZ/hXPl9NF15O1iMsM/d15Wu3tAQ/O1PyCIgquNd5Hw
 F4BHyO/FABEhtnHC6BHwdHAcQMuCHdgayLGEYuPtQQEgFC+dRRmRf6ai4f/KemIZUoWz
 lUYNqYyfsjWO+w9P+5QuDGPlDscZzoo7OQc2Ki7ONjkax8l40x2je3Au/KSQ97hue1Tt
 JBNaBOqS7X2B0v7831zjXsJO5bEWrMacVIeRkdZjZY71NznOCdZjsaaCfbQeF6DL4rYp
 7ANw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pVE5fasQ
Subject: [Buildroot] [PATCH 1/1] package/snmppp: security bump to version
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Improved (security): Avoid timing attacks on authentication
  verification.
- Drop patch (already in version)

https://www.agentpp.com/download/changes_snmp++v3.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-with-libressl-3-5-0.patch  | 39 -------------------
 package/snmppp/snmppp.hash                    |  2 +-
 package/snmppp/snmppp.mk                      |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/snmppp/0001-fix-build-with-libressl-3-5-0.patch

diff --git a/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch b/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch
deleted file mode 100644
index f60f84f9a2..0000000000
--- a/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-fix build with libressl >= 3.5.0
-
-Fix the following build failure with libressl >= 3.5.0:
-
-auth_priv.cpp: In member function 'virtual int Snmp_pp::AuthMD5::password_to_key(const unsigned char*, unsigned int, const unsigned char*, unsigned int, unsigned char*, unsigned int*)':
-auth_priv.cpp:1132:20: error: aggregate 'Snmp_pp::MD5HashStateType md5_hash_state' has incomplete type and cannot be defined
-   MD5HashStateType md5_hash_state;
-                    ^~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/b50b883c03e82564198a8b7e91bd14bf007772e0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: merged (emailed to katz.agentpp.com@magenta.de)]
-
-diff -Naurp snmp++-3.4.9.orig/src/auth_priv.cpp snmp++-3.4.9/src/auth_priv.cpp
---- snmp++-3.4.9.orig/src/auth_priv.cpp	2022-05-13 11:39:14.083038544 +0200
-+++ snmp++-3.4.9/src/auth_priv.cpp	2022-05-13 15:00:42.576102348 +0200
-@@ -79,8 +79,9 @@ static const char *loggerModuleName = "s
- 
- /* -- START: Defines for OpenSSL -- */
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
--// OpenSSL versions up to 1.0.x and LibreSSL
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
-+// OpenSSL versions up to 1.0.x and LibreSSL versions up to 3.4.x
- typedef EVP_MD_CTX            EVPHashStateType;
- 
- int evpAllocAndInit(EVP_MD_CTX *ctx, const EVP_MD *md)
-@@ -138,7 +139,7 @@ typedef EVP_MD_CTX*           MD5HashSta
- #define MD5_PROCESS(s, p, l)  EVP_DigestUpdate(*(s), p, l)
- #define MD5_DONE(s, k)        evpDigestFinalAndFree(s, k)
- 
--#endif // OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+#endif // OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
- 
- typedef DES_key_schedule      DESCBCType;
- #define DES_CBC_START_ENCRYPT(c, iv, k, kl, r, s) \
diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 6dc3d39ced..74c6a3e98f 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d7a77fd05ecd99b25c51cbab08dfeef22a5edf2677875695c213631af59d5bae  snmp++-3.4.10.tar.gz
+sha256  43a433bd5f6fd67add5a26add6521ca664c41aead438405658ed57483664b4bf  snmp++-3.5.0.tar.gz
 sha256  61337e799c8274e596e5783b22607beea8073ee296c6b27fc5c7487296e56851  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 005a5a9f35..9f1916dd66 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.4.10
+SNMPPP_VERSION = 3.5.0
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
