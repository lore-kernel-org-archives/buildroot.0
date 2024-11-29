Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406FAD6EC18
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 22:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A8F4053B;
	Fri, 29 Nov 2024 22:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6f933AsjhSw; Fri, 29 Nov 2024 22:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1CE840403
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1CE840403;
	Fri, 29 Nov 2024 22:13:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2746D6C
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 22:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05B244034A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 22:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEdONVwIFzsc for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 22:13:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=abelino.romo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FC2D4070C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC2D4070C
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FC2D4070C
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 22:13:39 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-214d1c6d724so18506875ad.3
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 14:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732918418; x=1733523218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JoKx2TxQz1BRT3ztSB9/5xaMHO0mGXf2YF07EIwPSPM=;
 b=Zo06EvX8dNZCQDrVnmf8+qfrNUwzjZt+IzS9Dj/knuTkPfhvUcepFSD6Txthr9tAVW
 tZ3V/Zr495bO0fG701J7U4W1HYo+Fy+vQgwSxSeB8GQrzmBNFQQgjBDxuOn/CkMqo62b
 OUxcEzmpe/4cGQUbOYXuBactQAB6YJ2M0WSIYFLzOIEdE7xjYm41TvHQaAgQYCcx3v9s
 0Fnvp1Z9uAwjXxJdDPIV4u96xjAcDzOQD3COnT0IeKkrhK4vJOASSyBKVWTw2cFMJWrV
 wGHKssTiMRPHFKli5p8MY8GkfiZ+HRBDWkVKSfPSfHsHBZYW5D1qGotuyiG/4kLP+qPB
 4d/Q==
X-Gm-Message-State: AOJu0Ywikp2NQ1XEg9E6WEDee2aw63wzXkc5uykTfY6WiFnnDut/eEFj
 IUytMGJlgqYtUbkcX+YXRku09TyxEqLXpkpH6VOUdhDGLqp5dl8EkZpm6A==
X-Gm-Gg: ASbGncu4xxbWmwmdYcGZWkG6tzhncOPLWL88yOnVKoS4VfhLuvwbZVqtEGocMPhppQt
 LXVoSe5EULkIJo9YnJcJ2d5U4LavjpCAB/lOEGLAoijiaR4cEJZWf/lKlaqoOjRJj8s1kLjR2AZ
 PmwnocRwPDpsr2o0kXV7SEwxO/sqg7lwbmeLsbnpURYuQmmEwxdeG+NaKe5XQJzL7KhoHT2yCBb
 FJv5E/xjLmJ0m9aXdlg7zIHZhX1difk1QOoXGRIINKXq5upxoomDB++KX7/z1rhX8YBotBuwEJx
 15Bgre4DouWTjTlVXykSl2ONRLCLt2I=
X-Google-Smtp-Source: AGHT+IH/hY7s37fwV1FnwAR5rHMK1se8KoaC5SEnXrqvLlatAhp08FVbMB3ph3wtVqXKqY+suTPeyQ==
X-Received: by 2002:a17:902:cf4a:b0:215:4a31:47d4 with SMTP id
 d9443c01a7336-2154a314b2cmr48555265ad.56.1732918418254; 
 Fri, 29 Nov 2024 14:13:38 -0800 (PST)
Received: from localhost.localdomain (47-144-216-38.lsan.ca.frontiernet.net.
 [47.144.216.38]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7254176f788sm3981732b3a.54.2024.11.29.14.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 14:13:37 -0800 (PST)
From: Abelino Romo <abelino.romo@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Abelino Romo <abelino.romo@gmail.com>
Date: Fri, 29 Nov 2024 14:13:24 -0800
Message-ID: <20241129221324.360497-1-abelino.romo@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241127052719.3689847-1-abelino.romo@gmail.com>
References: <20241127052719.3689847-1-abelino.romo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732918418; x=1733523218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JoKx2TxQz1BRT3ztSB9/5xaMHO0mGXf2YF07EIwPSPM=;
 b=XTE+giYDyV8Nq7lqvWSzwACMzXFKf+Eu60HvIgqyhuM3gujG0NbZ8rS3pfV4Gwq3GJ
 FM94coh3wSBhcxqFridkGFRO+p2RowPOQd5iMilX6cxFIK3N5KV1jM3stUDN2jiol5Kb
 vq+yIyT1Hzj+Tf722sbHBiLjIo2GatfECDUfQBNu+I4UHA2pVaM6S0sNk5yuff9oDAtt
 FBJpF6xCLQ8T7RaTocT5odnfRuRmkMBlQd57I7I+qIj+jzPSM6/BDxhQPtN3/iVoCmwC
 AE4LDFOxE2T8HSNh0SO0DpOfiocnZZZryxSq24HcwOSxn/b+YnLbsFMXeg7SuoxU7sg9
 2IMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XTE+giYD
Subject: [Buildroot] [PATCH v3 2/2] package/tpm2-tss-engine: add version
 1.2.0
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

Signed-off-by: Abelino Romo <abelino.romo@gmail.com>
---
Changes v2 -> v3:
  - Use manually uploaded tarball - the artifact from releases/download URL -
	  and not the archive tarball.
	  (suggested by Thomas Petazzoni in tpm2-tss patch thread)

	- Updated Signed-Off formatting.
	  (suggested by Thomas Petazzoni in tpm2-tss patch thread)

 package/Config.in                             |  1 +
 ...-disabling-of-digest-sign-operations.patch | 46 +++++++++++++++++++
 package/tpm2-tss-engine/Config.in             | 21 +++++++++
 package/tpm2-tss-engine/tpm2-tss-engine.hash  |  3 ++
 package/tpm2-tss-engine/tpm2-tss-engine.mk    | 33 +++++++++++++
 5 files changed, 104 insertions(+)
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
index 0000000000..00f8ac7632
--- /dev/null
+++ b/package/tpm2-tss-engine/Config.in
@@ -0,0 +1,21 @@
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
+
+if BR2_PACKAGE_TPM2_TSS_ENGINE
+
+config BR2_PACKAGE_TPM2_TSS_ENGINE_DIGEST_SIGN
+	bool "enable digest and sign support"
+	help
+	  Enable digest-sign hash operations on the TPM.
+
+endif
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
index 0000000000..66c5584505
--- /dev/null
+++ b/package/tpm2-tss-engine/tpm2-tss-engine.mk
@@ -0,0 +1,33 @@
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
+# Since the OpenSSL 3.0 Engine APIs are deprecated, suppress the warnings.
+TPM2_TSS_ENGINE_CFLAGS = $(TARGET_CFLAGS) -Wno-deprecated-declarations
+TPM2_TSS_ENGINE_CONF_ENV += CFLAGS="$(TPM2_TSS_ENGINE_CFLAGS)"
+
+define TPM2_TSS_ENGINE_ENGINESDIR
+	$(PKG_CONFIG_HOST_BINARY) --variable=enginesdir libcrypto \
+		| xargs readlink -f \
+		| sed 's%^$(STAGING_DIR)%%'
+endef
+
+TPM2_TSS_ENGINE_CONF_OPTS = \
+	--disable-defaultflags \
+	--with-enginesdir=`$(TPM2_TSS_ENGINE_ENGINESDIR)`
+
+ifneq ($(BR2_PACKAGE_TPM2_TSS_ENGINE_DIGEST_SIGN),y)
+TPM2_TSS_ENGINE_CONF_OPTS += --disable-digestsign
+endif
+
+$(eval $(autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
