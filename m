Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21174EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 08:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A1B160B13;
	Sat, 24 Jun 2023 08:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A1B160B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2Y6qBzvNcUU; Sat, 24 Jun 2023 08:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A755360B70;
	Sat, 24 Jun 2023 08:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A755360B70
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44CB71BF312
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 08:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C868418A5
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 08:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C868418A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyK0ph26IGAD for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 08:50:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B8AF41898
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B8AF41898
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 08:50:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6CA1EA4C0DDD;
 Sat, 24 Jun 2023 10:50:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43108)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qCyyo-0008SH-3C;
 Sat, 24 Jun 2023 10:50:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 10:50:50 +0200
Message-Id: <20230624085050.2927814-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230624085050.2927814-1-bernd@kuhls.net>
References: <20230624085050.2927814-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687596651;
 bh=AMzQnh3ZmhSzMzgjpmdPg60g6kPxfPNNUtOjH+AzWa8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ntSr4qrbeKtKCUvtWxsHx/11xYRkziQc2oJp/EBAMAkKkgPR76b5AlL5K6gJKTTTt
 aHeEVFFNkjiy79t8foZW8b1Ddyu6tK39PHIrKvBiHMrTWd684ygYEiECDFivJBJeAw
 95NwuraBXXvL7+vsPRXMirMczQyEg03X5wdrvk03dZrTVJ61y/hthYQVIPZ2d7rk0P
 bSMhEOIL4AuLazFRpQORe7OuqH/NICeIrp/kud2p0Gt0zGqlaZQcl5IXkZ+/OYoDF2
 VM/bungV/ZQ7KIHNpkRdCvl/ywSNtEDWzLKXUtJzRIoXXKYFjc6JXX5u8ioOoQc+kD
 1wQC+f8mUJ6Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ntSr4qrb
Subject: [Buildroot] [PATCH 2/2] package/opensc: fix build with newer
 versions of LibreSSL
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/913/91318abb98146dd967115ed6233949daa60d8bba/

This patch adds two patches added after the release of 0.23.0 so this
patch depends on the version bump included in this series.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ed-compatibility-with-LibreSSL-3.5.0.patch | 54 +++++++++++++++++++
 ...ed-compatibility-with-LibreSSL-3.7.0.patch | 28 ++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 package/opensc/0001-fixed-compatibility-with-LibreSSL-3.5.0.patch
 create mode 100644 package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch

diff --git a/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.5.0.patch b/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.5.0.patch
new file mode 100644
index 0000000000..0daf75d5ba
--- /dev/null
+++ b/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.5.0.patch
@@ -0,0 +1,54 @@
+From da01e5fab9be9865db1aac203e574e0edbfd6584 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Wed, 14 Dec 2022 09:31:29 +0100
+Subject: [PATCH] fixed compatibility with LibreSSL >= 3.5.0
+
+fixes https://github.com/OpenSC/OpenSC/issues/2664
+
+Upstream: https://github.com/OpenSC/OpenSC/commit/da01e5fab9be9865db1aac203e574e0edbfd6584
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libopensc/card-iasecc.c    | 12 +-----------
+ src/libopensc/sc-ossl-compat.h |  1 +
+ 2 files changed, 2 insertions(+), 11 deletions(-)
+
+diff --git a/src/libopensc/card-iasecc.c b/src/libopensc/card-iasecc.c
+index 480c1cf87b..1347ed2393 100644
+--- a/src/libopensc/card-iasecc.c
++++ b/src/libopensc/card-iasecc.c
+@@ -38,21 +38,11 @@
+ #include <openssl/pkcs12.h>
+ #include <openssl/x509v3.h>
+ 
+-/*
+- * OpenSSL-3.0.0 does not allow access to the SHA data
+- * so this driver can not produces signatures
+- * OpenSSL 1.1.1 uses EVP_MD_CTX_md_data
+- * LibreSSL
+- */
+-
+-#if defined(LIBRESSL_VERSION_NUMBER)
+-# define  EVP_MD_CTX_md_data(x)  (x->md_data)
+-#endif
+-
+ #include "internal.h"
+ #include "asn1.h"
+ #include "cardctl.h"
+ #include "opensc.h"
++#include "sc-ossl-compat.h"
+ /* #include "sm.h" */
+ #include "pkcs15.h"
+ /* #include "hash-strings.h" */
+diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
+index da53ca8cee..8c0f96701c 100644
+--- a/src/libopensc/sc-ossl-compat.h
++++ b/src/libopensc/sc-ossl-compat.h
+@@ -42,6 +42,7 @@ extern "C" {
+ #define X509_get_extension_flags(x)	(x->ex_flags)
+ #define X509_get_key_usage(x)		(x->ex_kusage)
+ #define X509_get_extended_key_usage(x)	(x->ex_xkusage)
++#define EVP_MD_CTX_md_data(x)          (x->md_data)
+ #endif
+ 
+ #if defined(LIBRESSL_VERSION_NUMBER)
diff --git a/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch b/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch
new file mode 100644
index 0000000000..6bbbea6ce6
--- /dev/null
+++ b/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch
@@ -0,0 +1,28 @@
+From 98ad0f93b0a7673cdce82e1b3faa7dc314c64dd6 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Fri, 16 Dec 2022 11:56:28 +0100
+Subject: [PATCH] fixed compatibility with LibreSSL 3.7.0
+
+Upstream: https://github.com/OpenSC/OpenSC/commit/98ad0f93b0a7673cdce82e1b3faa7dc314c64dd6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libopensc/sc-ossl-compat.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
+index 8c0f96701c..4425da93f3 100644
+--- a/src/libopensc/sc-ossl-compat.h
++++ b/src/libopensc/sc-ossl-compat.h
+@@ -54,9 +54,11 @@ extern "C" {
+ #define EVP_sha3_256()                          (NULL)
+ #define EVP_sha3_384()                          (NULL)
+ #define EVP_sha3_512()                          (NULL)
++#if LIBRESSL_VERSION_NUMBER < 0x3070000fL
+ #define EVP_PKEY_new_raw_public_key(t, e, p, l) (NULL)
+ #define EVP_PKEY_get_raw_public_key(p, pu, l)   (0)
+ #endif
++#endif
+ 
+ /* OpenSSL 1.1.1 has FIPS_mode function */
+ #if OPENSSL_VERSION_NUMBER >= 0x30000000L
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
