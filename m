Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E92EC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 21:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E1F483032;
	Sun, 11 Sep 2022 21:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E1F483032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L4gjgO3411QL; Sun, 11 Sep 2022 21:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DA3B82F84;
	Sun, 11 Sep 2022 21:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DA3B82F84
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2FAB1BF36D
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAF6760B51
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAF6760B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h06GpNUcX1tn for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 21:16:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ACF560B24
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ACF560B24
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 21:16:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e16so12446837wrx.7
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 14:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=GeiAluv3O4O1GXbuQBaYoTh5XoW6NDywm3veDWMGPfI=;
 b=wiDoBD8jQOM9ITVxvjoGi9a78ThYsD/MdG6/2UhdzQRe6+703x5D+h7jpyjYMrKW5p
 xv9rEVgzaTah7cxP79DQ8CWVb+PU4HTCpD5A/s1MgIsvEbSe8WrvTqFxCElMwaPuO3Fz
 mHRObVJ7TmFGnRlSi/499r4aMGsul05idfmt1IZ41aHHS0plDTPFb14vpUYrjbqo8NWz
 xrCHJ9QLelcwOh/kzs4lcLtd2jRx0Jk0QNtfhkGniKIkHa/J+/G3qHK3dF4/UB8c40s2
 4u2CRmYK/+JmnAfj1QQaPdWm+u9bcntrmZMaEx0AGatgXyxWQGcxtexZyUV5T1EISyLe
 xujw==
X-Gm-Message-State: ACgBeo1ipQTTecer53dweOrQ1tv/J/3bGdAjhdGRc6i9izqS2osJc4+Q
 EfL5liBws8RIX0dkPvy1FHA7qQgzx8c=
X-Google-Smtp-Source: AA6agR7BvWZXwhx5N+U49xO/EKdRxHGyvmQZ+7dekf79EtmIlU9TwwpCyXaQKkMqRMIXJwvBqZSifA==
X-Received: by 2002:adf:fb8d:0:b0:225:4d57:17a6 with SMTP id
 a13-20020adffb8d000000b002254d5717a6mr13351570wrr.251.1662930959311; 
 Sun, 11 Sep 2022 14:15:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k13-20020adfe8cd000000b00228dc1c7063sm5571911wrn.85.2022.09.11.14.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 14:15:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 23:15:56 +0200
Message-Id: <20220911211556.147212-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=GeiAluv3O4O1GXbuQBaYoTh5XoW6NDywm3veDWMGPfI=;
 b=M6iQqI3eDPXby50GplYsWsu3qwltZ4quY7/KunB4RZY/UJPCgIuDT/9Nubz4LtoIRr
 VcLt1n5jE8dvelqMuujV6g8XyZwLrQdwcXmV4wFMFGlFkTFUZuKsMSIsCL36vO5DpKgu
 amntTWhhT0thdLmwmiQU0B0Zxg/aVC2whqGSuWZBMkxPnP9JXgrno2koxPAD1dbDz++7
 TOVIFfpnG5sxu8Kdd87h1TkcxvZliOlBe8/k//TH63f08vYuRW3TQO2TGU8JVSe4xEox
 /JP9Q0lCJg96JviXc6jio9+X30WnY1kstjXDjpFDZWEDdLDGzBCiYi13N44/VcNqENut
 cZEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M6iQqI3e
Subject: [Buildroot] [PATCH 1/1] package/libldns: bump to version 1.8.3
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/NLnetLabs/ldns/blob/1.8.3/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...se-accessors-for-DSA-and-RSA-objects.patch | 96 -------------------
 package/libldns/libldns.hash                  |  8 +-
 package/libldns/libldns.mk                    |  2 +-
 3 files changed, 5 insertions(+), 101 deletions(-)
 delete mode 100644 package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch

diff --git a/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch b/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch
deleted file mode 100644
index f7ebbbf8b2..0000000000
--- a/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 887d618239312cc8c11e41c45492eee02a8f28a2 Mon Sep 17 00:00:00 2001
-From: Theo Buehler <tb@openbsd.org>
-Date: Tue, 11 Jan 2022 21:14:24 +0100
-Subject: [PATCH] Use accessors for DSA and RSA objects
-
-In the upcoming LibreSSL version 3.5, the DSA and RSA structs will
-become opaque, so we should use the OpenSSL 1.1 setters and getters
-to fix the build.  The relevant API has been available since
-LibreSSL 2.7. The last LibreSSL version (2.6) not having these
-accessors was EOL late 2018, so no users should be affected by this
-change.
-
-[Retrieved from:
-https://github.com/NLnetLabs/ldns/commit/887d618239312cc8c11e41c45492eee02a8f28a2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- dnssec.c   | 4 ++--
- host2str.c | 4 ++--
- keys.c     | 6 +++---
- 3 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/dnssec.c b/dnssec.c
-index 63fece52..fbaa518a 100644
---- a/dnssec.c
-+++ b/dnssec.c
-@@ -381,7 +381,7 @@ ldns_key_buf2dsa_raw(const unsigned char* key, size_t len)
- 		BN_free(Y);
- 		return NULL;
- 	}
--#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
- #ifndef S_SPLINT_S
- 	dsa->p = P;
- 	dsa->q = Q;
-@@ -468,7 +468,7 @@ ldns_key_buf2rsa_raw(const unsigned char* key, size_t len)
- 		BN_free(modulus);
- 		return NULL;
- 	}
--#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
- #ifndef S_SPLINT_S
- 	rsa->n = modulus;
- 	rsa->e = exponent;
-diff --git a/host2str.c b/host2str.c
-index a207a913..634c5676 100644
---- a/host2str.c
-+++ b/host2str.c
-@@ -2451,7 +2451,7 @@ ldns_key2buffer_str(ldns_buffer *output, const ldns_key *k)
- 					const BIGNUM *n=NULL, *e=NULL, *d=NULL,
- 						*p=NULL, *q=NULL, *dmp1=NULL,
- 						*dmq1=NULL, *iqmp=NULL;
--#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
- 					n = rsa->n;
- 					e = rsa->e;
- 					d = rsa->d;
-@@ -2504,7 +2504,7 @@ ldns_key2buffer_str(ldns_buffer *output, const ldns_key *k)
- 				if(1) {
- 					const BIGNUM *p=NULL, *q=NULL, *g=NULL,
- 						*priv_key=NULL, *pub_key=NULL;
--#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
- #ifndef S_SPLINT_S
- 					p = dsa->p;
- 					q = dsa->q;
-diff --git a/keys.c b/keys.c
-index 91a3dffd..78bea972 100644
---- a/keys.c
-+++ b/keys.c
-@@ -861,7 +861,7 @@ ldns_key_new_frm_fp_rsa_l(FILE *f, int *line_nr)
- 	}
- #endif /* splint */
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
- # ifndef S_SPLINT_S
- 	rsa->n = n;
- 	rsa->e = e;
-@@ -982,7 +982,7 @@ ldns_key_new_frm_fp_dsa_l(FILE *f, ATTR_UNUSED(int *line_nr))
- 	}
- #endif /* splint */
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
- # ifndef S_SPLINT_S
- 	dsa->p = p;
- 	dsa->q = q;
-@@ -1660,7 +1660,7 @@ ldns_key_rsa2bin(unsigned char *data, RSA *k, uint16_t *size)
- 	if (!k) {
- 		return false;
- 	}
--#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
- 	n = k->n;
- 	e = k->e;
- #else
diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
index cab8b7dbdf..ff86ae348e 100644
--- a/package/libldns/libldns.hash
+++ b/package/libldns/libldns.hash
@@ -1,7 +1,7 @@
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.1.tar.gz.sha1
-sha1  df19a0404a608821b571525214a18988bc88bb46  ldns-1.8.1.tar.gz
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.1.tar.gz.sha256
-sha256  958229abce4d3aaa19a75c0d127666564b17216902186e952ca4aef47c6d7fa3  ldns-1.8.1.tar.gz
+# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.3.tar.gz.sha1
+sha1  2796cc49636f68260c9662b60d5a7c9e6eed195c  ldns-1.8.3.tar.gz
+# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.3.tar.gz.sha256
+sha256  c3f72dd1036b2907e3a56e6acf9dfb2e551256b3c1bbd9787942deeeb70e7860  ldns-1.8.3.tar.gz
 
 # Hash for license file:
 sha256  9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 86e7c0eafc..06564e3d9f 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLDNS_VERSION = 1.8.1
+LIBLDNS_VERSION = 1.8.3
 LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
 LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
