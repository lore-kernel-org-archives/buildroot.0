Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA380D3B7C9
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 00:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E0FD42CF2;
	Mon, 25 Nov 2024 00:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsBsMylE2V1r; Mon, 25 Nov 2024 00:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A21654034C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A21654034C;
	Mon, 25 Nov 2024 00:02:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D9964961
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 00:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78DDB84795
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 00:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vK7hRKTzgH61 for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 00:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=abelino.romo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E84884794
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E84884794
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E84884794
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 00:02:43 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-212776d6449so42024635ad.1
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 16:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732492962; x=1733097762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fGIcdggs1sEhgGTwKIS67slWkVyynGm0H69QAn+oc5o=;
 b=a3DgUMUvHG9uhqLoHXgIXjJ6tU5k3WqbYw1XgMLJS7HoHZ6MCNGKyANeYpEk7i2GdL
 hrFgv0Vg79yeKltz1XQA4O9MVXtLLhN43xQTkIgSszF6eodwWAHNXuOXDGuxh7qT3klc
 okOx01Vg/xZyImWgfUZZTp+3CTWlMzJ663Y+2RjECfNJmps0q+RQZHqChDYkB71ipXrQ
 kEEi5Tr4OrITFm5vPMnt46XInu0vg4q4OIX3oBuV3s18wbgSqXu6K9pPO+4P19UvojAX
 oaZcrUbOVE0EFDYxtZdToU5/MimYIIrIitpbEPNb2qSg9A3dRI9sbkM/6T9jjikSk3ei
 6K/Q==
X-Gm-Message-State: AOJu0Yyi1x9YKiKNk++rS1IS5wVHOBA1rPA1PGSy4kwq47CZg6mMUQ2M
 aSRSEswlgP4olp4UdcmpJAFkag4f5Os+X5mnnisBiOfck6klwp6LvIH7qg==
X-Gm-Gg: ASbGnctOEJm0Ox80oteEFtOTB+7RVf+Cw/jKb7Wp/OhTIAlVoEOGUWiDENYvpDeqPpQ
 AtrDTBxocy3ujefS9jJD41U1Le7lsZDteCgaDob+Ddms5oRg9HvcTLv2lthS89rfqhuslV86dpL
 8rVRNBFbU5pMo73164z7289lxHpYn7wyHyYC9/ScSkix+ED6HekZ3dofv3VzhmILYsqlMyN+7HD
 huQI58mZJ63yq/z0/s42j5E5ORNFVqf+zrJaalF+np+drlMSQ/mX30QnM+6mp5OOqm/Y0t9v9wB
 4tyw5AW1knth9ESz9zbGAHiZkQqVpW0=
X-Google-Smtp-Source: AGHT+IEmvu2ty0adBrLku6+Bd69N/FqFoUFJfIlfLGdrsqgnShqjL8NmgvbSjBevgeFxVE9EZH+KSA==
X-Received: by 2002:a17:902:f64d:b0:20c:968e:4dcd with SMTP id
 d9443c01a7336-2129f51d3demr153269785ad.7.1732492962426; 
 Sun, 24 Nov 2024 16:02:42 -0800 (PST)
Received: from localhost.localdomain (47-144-216-38.lsan.ca.frontiernet.net.
 [47.144.216.38]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dba2eb4sm52072915ad.75.2024.11.24.16.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 16:02:42 -0800 (PST)
From: abelino <abelino.romo@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 abelino <abelino.romo@gmail.com>
Date: Sun, 24 Nov 2024 16:02:18 -0800
Message-ID: <20241125000233.2772592-3-abelino.romo@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125000233.2772592-1-abelino.romo@gmail.com>
References: <20241125000233.2772592-1-abelino.romo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732492962; x=1733097762; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGIcdggs1sEhgGTwKIS67slWkVyynGm0H69QAn+oc5o=;
 b=ZWTPmZu1u/7lWUF0Gdm0ahsK9FW33Wy+/0Miq1i2/ZeZ9Fpby0+5/sEZ88YtA6rBhW
 2/JaxStkC2Bf2sThpn3f54mBWlVyUZ51EX6CY0Mr3oE3YWofG6tbwJGhv4A8RxqAM+lw
 NEYdQpHnTZov1FbU9oHZmnfjwT8veLSDEahbDsy21mrtHMFa3QfKBpil/wQCKkUCkpDV
 jSMYDlsyteSJdkZbdBTzLRVwTOoeHfrSRFvQHr1ywST4gU4viq0X++YNqv7EqMAxbaCN
 fUyDn7Q1p5ilc1HOYun9ltkYk3ecCS+btd6VNd/cSCW0/qH7/Y+YXxNaA+mxEoxaMlSt
 Gv+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZWTPmZu1
Subject: [Buildroot] [PATCH 2/2] package/tpm2-tss-engine: add version 1.2.0
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

Introduce the TPM2-TSS OpenSSL Engine to enable TPM2 device support in
ecosystems that do not yet support OpenSSL Providers. This is
particularly useful in the Erlang space, where OpenSSL 3 Providers are
still under development [1].

[1] https://erlangforums.com/t/openssl-3-support-for-provider-deprecated-engine-replacement/2954/2

Signed-off-by: abelino <abelino.romo@gmail.com>
---
 package/Config.in                             |  1 +
 ...-disabling-of-digest-sign-operations.patch | 46 +++++++++++++++++++
 package/tpm2-tss-engine/Config.in             | 12 +++++
 package/tpm2-tss-engine/tpm2-tss-engine.hash  |  3 ++
 package/tpm2-tss-engine/tpm2-tss-engine.mk    | 19 ++++++++
 5 files changed, 81 insertions(+)
 create mode 100644 package/tpm2-tss-engine/0001-Allow-disabling-of-digest-sign-operations.patch
 create mode 100644 package/tpm2-tss-engine/Config.in
 create mode 100644 package/tpm2-tss-engine/tpm2-tss-engine.hash
 create mode 100644 package/tpm2-tss-engine/tpm2-tss-engine.mk

diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e020..4f4b7a34d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1633,6 +1633,7 @@ menu "Crypto"
 	source "package/tpm2-openssl/Config.in"
 	source "package/tpm2-pkcs11/Config.in"
 	source "package/tpm2-tss/Config.in"
+	source "package/tpm2-tss-engine/Config.in"
 	source "package/trousers/Config.in"
 	source "package/ustream-ssl/Config.in"
 	source "package/wolfssl/Config.in"
diff --git a/package/tpm2-tss-engine/0001-Allow-disabling-of-digest-sign-operations.patch b/package/tpm2-tss-engine/0001-Allow-disabling-of-digest-sign-operations.patch
new file mode 100644
index 0000000000..7ce717df4a
--- /dev/null
+++ b/package/tpm2-tss-engine/0001-Allow-disabling-of-digest-sign-operations.patch
@@ -0,0 +1,46 @@
+From af8b26e7ffe69837197fb841e9a31230ae01c9cc Mon Sep 17 00:00:00 2001
+From: Andreas Fuchs <andreas.fuchs@infineon.com>
+Date: Mon, 22 May 2023 14:06:41 +0200
+Subject: [PATCH] Configure: Allow disabling of digest-sign operations
+
+Since the digest-sign operations perform the hash on the TPM and
+TPMs in general do not support SHA512, this can lead to errors.
+Depending on the use case, it might be preferable to not support
+restricted keys (via digest+sign) but to rely on ordinary keys
+only.
+
+Upstream: https://github.com/tpm2-software/tpm2-tss-engine/commit/af8b26e7ffe69837197fb841e9a31230ae01c9cc
+Signed-off-by: Andreas Fuchs <andreas.fuchs@infineon.com>
+---
+ configure.ac | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d4a9356..b379042 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -116,13 +116,19 @@ PKG_CHECK_MODULES([CRYPTO], [libcrypto >= 1.0.2g],
+ PKG_CHECK_MODULES([TSS2_ESYS], [tss2-esys >= 2.3])
+ PKG_CHECK_MODULES([TSS2_MU], [tss2-mu])
+ PKG_CHECK_MODULES([TSS2_TCTILDR], [tss2-tctildr])
++
+ AC_CHECK_LIB([crypto], EC_KEY_METHOD_set_compute_key,
+       [AM_CONDITIONAL([HAVE_OPENSSL_ECDH], true)],
+       [AM_CONDITIONAL([HAVE_OPENSSL_ECDH], false)])
++
++AC_ARG_ENABLE([digestsign],
++              [AS_HELP_STRING([--disable-digestsign],
++                              [Disable support for digest and sign methods, helps with TPM unsupported hash algorithms.])],,
++              [enable_digestsign=yes])
+ AC_CHECK_LIB([crypto], EVP_PKEY_meth_set_digest_custom,
+-      [AM_CONDITIONAL([HAVE_OPENSSL_DIGEST_SIGN], true)],
++      [AM_CONDITIONAL([HAVE_OPENSSL_DIGEST_SIGN], [test "x$enable_digestsign" != "xno"])],
+       [AM_CONDITIONAL([HAVE_OPENSSL_DIGEST_SIGN], false)])
+-AS_IF([test "x$ac_cv_lib_crypto_EVP_PKEY_meth_set_digest_custom" = xyes],
++AS_IF([test "x$ac_cv_lib_crypto_EVP_PKEY_meth_set_digest_custom" = xyes && test "x$enable_digestsign" = "xyes"],
+       [AC_DEFINE([HAVE_OPENSSL_DIGEST_SIGN], [1],
+                  Have required functionality from OpenSSL to support digest and sign)])
+ 
+-- 
+2.47.0
+
diff --git a/package/tpm2-tss-engine/Config.in b/package/tpm2-tss-engine/Config.in
new file mode 100644
index 0000000000..27d925a60f
--- /dev/null
+++ b/package/tpm2-tss-engine/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_TPM2_TSS_ENGINE
+	bool "tpm2-tss-engine"
+	select BR2_PACKAGE_TPM2_TSS
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
+	help
+	  The tpm2-tss-engine project implements a cryptographic engine
+	  for OpenSSL for Trusted Platform Module (TPM 2.0) using the
+	  tpm2-tss software stack that follows the Trusted Computing
+	  Groups (TCG) TPM Software Stack (TSS 2.0). It uses the
+	  Enhanced System API (ESAPI) interface of the TSS 2.0 for
+	  downwards communication. It supports RSA decryption and
+	  signatures as well as ECDSA signatures.
diff --git a/package/tpm2-tss-engine/tpm2-tss-engine.hash b/package/tpm2-tss-engine/tpm2-tss-engine.hash
new file mode 100644
index 0000000000..294847d5f8
--- /dev/null
+++ b/package/tpm2-tss-engine/tpm2-tss-engine.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  3c94fef110dd3630b3c28c5875febba76b7d5ba2fcc04a14c4a30f5d2157c265  tpm2-tss-engine-1.2.0.tar.gz
+sha256  7a77915f34caf18d47bc31750dae47dbd7f7895e95bbb8370f477c25009388f6  LICENSE
diff --git a/package/tpm2-tss-engine/tpm2-tss-engine.mk b/package/tpm2-tss-engine/tpm2-tss-engine.mk
new file mode 100644
index 0000000000..768f9ee3bd
--- /dev/null
+++ b/package/tpm2-tss-engine/tpm2-tss-engine.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# tpm2-tss-engine
+#
+################################################################################
+
+TPM2_TSS_ENGINE_VERSION = 1.2.0
+TPM2_TSS_ENGINE_SITE = https://github.com/tpm2-software/tpm2-tss-engine/releases/download/$(TPM2_TSS_ENGINE_VERSION)
+TPM2_TSS_ENGINE_LICENSE = BSD-3-Clause
+TPM2_TSS_ENGINE_LICENSE_FILES = LICENSE
+TPM2_TSS_ENGINE_INSTALL_STAGING = YES
+TPM2_TSS_ENGINE_DEPENDENCIES = host-pkgconf tpm2-tss
+TPM2_TSS_ENGINE_AUTORECONF = YES
+
+TPM2_TSS_ENGINE_CONF_OPTS = \
+	--disable-digestsign \
+	--with-enginesdir="/usr/lib/engines-3"
+
+$(eval $(autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
