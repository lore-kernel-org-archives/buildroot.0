Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3362DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 20:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A782F419AA;
	Thu, 28 Apr 2022 20:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TAU_eXmaXUQm; Thu, 28 Apr 2022 20:43:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64452417B0;
	Thu, 28 Apr 2022 20:43:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E65F1BF36D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BC67401AD
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxLHcIsVTNVY for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 20:43:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFC93400E3
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 20:43:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d5so8269608wrb.6
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 13:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWpxoU8+EHnnUhX0bFJJdxt0xKKThILFiWHoUnsKzL0=;
 b=NZJvvK741lD4VaUbJujYSbtIedag14A7kHxhC/vCDwLwXGz27BnumotVHNp/7SpQxj
 ap9Kmu+TQf1RqNrSqJGbQfppvj8wMzCmu+YK1hU91HDyGY9KMGRqNcYur9Xwzfe3y06D
 bx0/jCvhMYEcaS8lSOsUGPr5fsh8kd/0fsRVxJyRzrJ7ClGlli30UAFOZoPjjk3giaQy
 ISrCY79IUYVRQ/PH8VaRIi3PG/KmvKvPZCPJdjYOZdFGDrSq3ZH32JP8jj/DVwdy/ET0
 H3kq+k9AVqrlGGJ8+jFAObboumN8NQ5/b5nxayhorisBcWYXOE2//YxhpN7tSoqgpQDN
 TOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWpxoU8+EHnnUhX0bFJJdxt0xKKThILFiWHoUnsKzL0=;
 b=4+KfAMSTnIoXCGxO2RDrCesW9Rd8wOE2pfYT84ioEFgqJQZlQdB9GQxW9DnuPUMZaA
 V0tUGLCEKqIP+ftnVp9D84H1XA+akWGQtQLGOWa7fDtS54+oU1eEHg+eh+/JPFlf9mYM
 W5x6mfvIvBahnXVyQWVrK4MGBMPIZa0i7CiARhManG2JUmkGRlcTa4qV3Hw9Ueb6EJb/
 BCqQ6KNbVM3TJVnXj6X2lnvivr+wPLSGRTW9twyaLib8LVODnpwqm8YmqDw1nWkfYo+Z
 8s/w4oCuILJe308z53Z8SyRhnI/9vZo04Oyh87QzJS6x3fhgTqUn3DRHqz7RjjMeuPjC
 QXEw==
X-Gm-Message-State: AOAM5336FpB94xHmH/i6VJLPTxWOowmiwdFZlu2uZjGiRPTaAKItj8K+
 TcP4NT70xMYKgH0p34LT9zAN0oA2MZ4=
X-Google-Smtp-Source: ABdhPJxEJ6nkOJ+exOzsXYuGdZleal5BZNs5D2G0clYiOoYEmZeD8HCM0QEY3vdLv0h2vmpmySHm2g==
X-Received: by 2002:adf:ba8f:0:b0:1e9:4afb:179b with SMTP id
 p15-20020adfba8f000000b001e94afb179bmr27698570wrg.57.1651178578602; 
 Thu, 28 Apr 2022 13:42:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i15-20020adfaacf000000b0020aee621955sm728843wrc.34.2022.04.28.13.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 13:42:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 22:40:48 +0200
Message-Id: <20220428204048.4003582-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libldns: fix build with libressl >=
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

./dnssec.c: In function 'ldns_key_buf2dsa_raw':
./dnssec.c:386:5: error: invalid use of incomplete typedef 'DSA' {aka 'struct dsa_st'}
  386 |  dsa->p = P;
      |     ^~

Fixes:
 - http://autobuild.buildroot.org/results/d754fbaa8f6687597682fbf0b71c16527c8cd603

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...se-accessors-for-DSA-and-RSA-objects.patch | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch

diff --git a/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch b/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch
new file mode 100644
index 0000000000..f7ebbbf8b2
--- /dev/null
+++ b/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch
@@ -0,0 +1,96 @@
+From 887d618239312cc8c11e41c45492eee02a8f28a2 Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Tue, 11 Jan 2022 21:14:24 +0100
+Subject: [PATCH] Use accessors for DSA and RSA objects
+
+In the upcoming LibreSSL version 3.5, the DSA and RSA structs will
+become opaque, so we should use the OpenSSL 1.1 setters and getters
+to fix the build.  The relevant API has been available since
+LibreSSL 2.7. The last LibreSSL version (2.6) not having these
+accessors was EOL late 2018, so no users should be affected by this
+change.
+
+[Retrieved from:
+https://github.com/NLnetLabs/ldns/commit/887d618239312cc8c11e41c45492eee02a8f28a2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ dnssec.c   | 4 ++--
+ host2str.c | 4 ++--
+ keys.c     | 6 +++---
+ 3 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/dnssec.c b/dnssec.c
+index 63fece52..fbaa518a 100644
+--- a/dnssec.c
++++ b/dnssec.c
+@@ -381,7 +381,7 @@ ldns_key_buf2dsa_raw(const unsigned char* key, size_t len)
+ 		BN_free(Y);
+ 		return NULL;
+ 	}
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ #ifndef S_SPLINT_S
+ 	dsa->p = P;
+ 	dsa->q = Q;
+@@ -468,7 +468,7 @@ ldns_key_buf2rsa_raw(const unsigned char* key, size_t len)
+ 		BN_free(modulus);
+ 		return NULL;
+ 	}
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ #ifndef S_SPLINT_S
+ 	rsa->n = modulus;
+ 	rsa->e = exponent;
+diff --git a/host2str.c b/host2str.c
+index a207a913..634c5676 100644
+--- a/host2str.c
++++ b/host2str.c
+@@ -2451,7 +2451,7 @@ ldns_key2buffer_str(ldns_buffer *output, const ldns_key *k)
+ 					const BIGNUM *n=NULL, *e=NULL, *d=NULL,
+ 						*p=NULL, *q=NULL, *dmp1=NULL,
+ 						*dmq1=NULL, *iqmp=NULL;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ 					n = rsa->n;
+ 					e = rsa->e;
+ 					d = rsa->d;
+@@ -2504,7 +2504,7 @@ ldns_key2buffer_str(ldns_buffer *output, const ldns_key *k)
+ 				if(1) {
+ 					const BIGNUM *p=NULL, *q=NULL, *g=NULL,
+ 						*priv_key=NULL, *pub_key=NULL;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ #ifndef S_SPLINT_S
+ 					p = dsa->p;
+ 					q = dsa->q;
+diff --git a/keys.c b/keys.c
+index 91a3dffd..78bea972 100644
+--- a/keys.c
++++ b/keys.c
+@@ -861,7 +861,7 @@ ldns_key_new_frm_fp_rsa_l(FILE *f, int *line_nr)
+ 	}
+ #endif /* splint */
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ # ifndef S_SPLINT_S
+ 	rsa->n = n;
+ 	rsa->e = e;
+@@ -982,7 +982,7 @@ ldns_key_new_frm_fp_dsa_l(FILE *f, ATTR_UNUSED(int *line_nr))
+ 	}
+ #endif /* splint */
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ # ifndef S_SPLINT_S
+ 	dsa->p = p;
+ 	dsa->q = q;
+@@ -1660,7 +1660,7 @@ ldns_key_rsa2bin(unsigned char *data, RSA *k, uint16_t *size)
+ 	if (!k) {
+ 		return false;
+ 	}
+-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
+ 	n = k->n;
+ 	e = k->e;
+ #else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
