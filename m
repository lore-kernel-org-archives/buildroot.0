Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A81D3B9BD
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 05:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 162178545E;
	Wed, 27 Nov 2024 05:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLm_W7ouNpjR; Wed, 27 Nov 2024 05:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCDE68544B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCDE68544B;
	Wed, 27 Nov 2024 05:27:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1199D1DA8
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 05:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3C1685451
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 05:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uFrwsfzL-ua for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 05:27:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=abelino.romo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D121D8544A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D121D8544A
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D121D8544A
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 05:27:23 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-7ee020ec76dso5490786a12.3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 21:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732685243; x=1733290043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Kn8qHJpPEBinhTI7nXo5GOAj5sKTBHS4upS9ceJavs=;
 b=I6XnDQnjY5ysf/imqn+nJH1SbwbjEYxgymDKDrTHX97mTc7gjkkEPuxm79NOxjhebZ
 pi8VvFidUXoZpX44/hZGgg52u/SFV6WMguDJ9apSIDUBedxYfoE7BWvSAmTJIVTcy0pA
 jkbvJ7CeMVL1dR/FASP0QmQZVKmAFz6ywx7U38dGHV85zjap+QyLLGIrvM2TKno4UNXZ
 zGyliT1kNzOPedLNrmKn9u/7O2H44tRpG6hqd3tHiYlERvwphxCEGqugTsQX5UB/24/T
 N4mldKeLjsJYnLbGGJ/ik/oJK9Z4Rfo2EeoJvuo3hvRWyu0N5mr9pUqNbmxfvb5yiO3X
 J+tg==
X-Gm-Message-State: AOJu0Yxk9KmsDpkbi4UQANIT5Vb/1NRk5KyNWXhT4mlDvjAzvhAYJywQ
 wItrSUpOQ4nSS/erJJbVcKBGSOPpXZMDJjcbg/Ype8VQalMM/s3HgyksCQ==
X-Gm-Gg: ASbGncspQ7PnIsu4H7HmnrwgJdPlmCE5mNqkPULiIacV28QU1Rn55ZaHkkMs8wS3US6
 CnDQRp6g2BWUk1kERbZl+yjoURBhWRowkUlVnDDKNGBmhL2fLh/PGCRrSmmaNHyX9/WoNdbchrE
 LmXKNjJD4J7WY6hb33WLMfYU/9kW614YhO0bwY0QvasdA+h601YHzbBD9Q+gSiEmXPtElLS9kpn
 dGMhdw8oFyNtjv4Y6HtZFMk1Onu+rvbfBO02BoMK+H6wmW8UPJXgZymh3v9fh/+bfszavrBESJv
 JCrvYpHgyCkERGzX4SE3PsWdIYsn9yM=
X-Google-Smtp-Source: AGHT+IGsRAL1z4YT5ufVbbc7g60t4bes7jyU/w03nNgnd24PAvZU3U2aa/VI/bcMVda7UII9vOG/sQ==
X-Received: by 2002:a05:6a20:6a28:b0:1db:f01a:cf12 with SMTP id
 adf61e73a8af0-1e0e0b5cc80mr3283508637.34.1732685242817; 
 Tue, 26 Nov 2024 21:27:22 -0800 (PST)
Received: from localhost.localdomain (47-144-216-38.lsan.ca.frontiernet.net.
 [47.144.216.38]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fbcbfc4c28sm9684718a12.3.2024.11.26.21.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 21:27:22 -0800 (PST)
From: abelino <abelino.romo@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 abelino <abelino.romo@gmail.com>
Date: Tue, 26 Nov 2024 21:27:19 -0800
Message-ID: <20241127052719.3689847-1-abelino.romo@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125000233.2772592-3-abelino.romo@gmail.com>
References: <20241125000233.2772592-3-abelino.romo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732685243; x=1733290043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Kn8qHJpPEBinhTI7nXo5GOAj5sKTBHS4upS9ceJavs=;
 b=PxCXpLnJ/ywAXZBRXi7v5YTmI2GKoopTukctc6qqW7WdEsF6KIlmwSwwfee2Cni6kp
 wvF1N+aiFuBTiKjWudKZ0PmocW9Wabt8I96Gku9ecFeI7DN66fe8OcpRUS1Xke5TSFpv
 DN0tV1o+lKEhFXVqGOum2gz6t49ZRQDwopBy31ofwG6rWwrD6TCTQXdR0R7W2RXcMBe/
 ROshNpGGVon4MkQtG2rmDvCpIdtDtj8JUooRoQJjHWIxVK3cHFQ8DdnejahIlQW5w0rs
 xox8WZVQBVGQCgb4QS9jkYVDBl4UwNTZHtyGhyBD6juyayzkULEPiZ8i01/tNIlCMHTE
 6Cnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PxCXpLnJ
Subject: [Buildroot] [PATCH v2 2/2] package/tpm2-tss-engine: add version
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

Signed-off-by: abelino <abelino.romo@gmail.com>
---
> When will a tpm2-tss-engine release update be available to avoid this
> patch ? Did you suggest/ask for a new release to the tpm2-tss-engine
> community using a github issue ?

I just did that today. I will check-in periodically and circle back as
soon as a new release is cut.

Changes v1 -> v2:
  - Suppress OpenSSL 3 Engine deprecated API warnings since this package
	  implements an engine and it is known these APIs are deprecated.
	  (suggested by Vincent Jardin)

  - Update `TPM2_TSS_ENGINE_SITE` to use `$(call github,...)` but required
    additional changes to properly bootstrap `configure`. The previous URL
    downloaded the release artifact which contained a `VERSION` file, while
    the tagged source archive does not contain a `VERSION` file.
    (suggested by Vincent Jardin)

  - Added `BR2_PACKAGE_TPM2_TSS_ENGINE_DIGEST_SIGN` to toggle `digestsign`
    compile time option. `digestsign` is enabled by default, hence the use
    of `ifneq`.
    (suggested by Vincent Jardin)

  - Removed hardcoded `enginesdir` in favor of value from `pkg-config`.
    I opted on using the `define` directive in hope that it is easier to
    read/digest.
    (suggested by Vincent Jardin)

 package/Config.in                             |  1 +
 ...-disabling-of-digest-sign-operations.patch | 46 +++++++++++++++++++
 package/tpm2-tss-engine/Config.in             | 21 +++++++++
 package/tpm2-tss-engine/tpm2-tss-engine.hash  |  3 ++
 package/tpm2-tss-engine/tpm2-tss-engine.mk    | 40 ++++++++++++++++
 5 files changed, 111 insertions(+)
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
index 0000000000..176d41390f
--- /dev/null
+++ b/package/tpm2-tss-engine/tpm2-tss-engine.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  2b1b71aab191cf2a3f4c92a12a9dc7a3d362807693148802ab3335431f904eb2  tpm2-tss-engine-1.2.0.tar.gz
+sha256  7a77915f34caf18d47bc31750dae47dbd7f7895e95bbb8370f477c25009388f6  LICENSE
diff --git a/package/tpm2-tss-engine/tpm2-tss-engine.mk b/package/tpm2-tss-engine/tpm2-tss-engine.mk
new file mode 100644
index 0000000000..d6beee4bf3
--- /dev/null
+++ b/package/tpm2-tss-engine/tpm2-tss-engine.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# tpm2-tss-engine
+#
+################################################################################
+
+TPM2_TSS_ENGINE_VERSION = 1.2.0
+TPM2_TSS_ENGINE_SITE = $(call github,tpm2-software,tpm2-tss-engine,$(TPM2_TSS_ENGINE_VERSION))
+TPM2_TSS_ENGINE_LICENSE = BSD-3-Clause
+TPM2_TSS_ENGINE_LICENSE_FILES = LICENSE
+TPM2_TSS_ENGINE_INSTALL_STAGING = YES
+TPM2_TSS_ENGINE_DEPENDENCIES = host-autoconf-archive host-pkgconf tpm2-tss
+TPM2_TSS_ENGINE_AUTORECONF = YES
+TPM2_TSS_ENGINE_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+
+define TPM2_TSS_ENGINE_BOOTSTRAP
+	echo $(TPM2_TSS_ENGINE_VERSION) > $(@D)/VERSION
+endef
+
+TPM2_TSS_ENGINE_PRE_CONFIGURE_HOOKS = TPM2_TSS_ENGINE_BOOTSTRAP
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
