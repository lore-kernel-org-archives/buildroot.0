Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158BDC27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 16:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C0245BD3;
	Fri, 21 Jun 2024 16:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBUXlS8rvakn; Fri, 21 Jun 2024 16:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C56C455DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C56C455DD;
	Fri, 21 Jun 2024 16:11:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C00B1BF232
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1512D616C8
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaaih_N_v4Yp for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 16:11:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B351A616C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B351A616C1
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B351A616C1
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 16:11:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4217dbeb4caso18942225e9.1
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 09:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718986263; x=1719591063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7nbFXXAtJDUJgic97IzJJXpEtb4q8J3Dv0uo3JRg3xo=;
 b=RjqHYnIu6k6P9cBirZPzmWRBFDeDkF+zlPl88nbr5R0cwegS8+YXB5GyMS3twdEIBs
 M5tCOZ390tR5wDHyEr6pmtt2ek3K8fQ6RmpQs5hFpsKBxLmlXHFD+CdFWQ5ww3fUZqhG
 4h/z98C+9Or81R7oJoY12zkEyAG8k6le2ssV/veB9GUP08JIb3TUWk8SGSjzU2rLnaua
 c6RtgRLpV+NLAV1FWrpzkV9jcH2EDqFxp49VYyblKVrcO9Bq9u1uhF7C/ULxpxgDG4Uf
 j2pdUKG1M5wc8KuNH1i/PmkAN3nryphP3tZ9mUXjxeJIKBaV68FcmTswxnHAI58JzvWU
 ufVA==
X-Gm-Message-State: AOJu0Ywz++VNRnROEMEXoW+swdjAgUlz5m32W4j9BxGUHMvBAgzJTKgl
 k6EpKALX4/wMmEryn2+trj2Q2IvZO+qsEL0EZn8pD1wTr1cBwuWe0XPAUFylv8UMRZ7T5iT+u48
 j
X-Google-Smtp-Source: AGHT+IHQtbCFh7N1j+NKgCRHli6WWdgAXwF/Bsp15+NpEismi7BzWy4hcyRYfXu/lkqvG86d6EFK9A==
X-Received: by 2002:a5d:456d:0:b0:365:980c:d281 with SMTP id
 ffacd0b85a97d-365980cd35cmr2841997f8f.45.1718986263402; 
 Fri, 21 Jun 2024 09:11:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8922sm2185522f8f.28.2024.06.21.09.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 09:11:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 18:10:49 +0200
Message-ID: <20240621161049.4085310-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
References: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718986263; x=1719591063;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7nbFXXAtJDUJgic97IzJJXpEtb4q8J3Dv0uo3JRg3xo=;
 b=ToSnSP81Xgf24AjXvM1V7tielcBZfvYh0tNTvCsrnsPQ8DnZ7776+Tp9znrw79hxTE
 buGyOV0EEnhbP6G9GTFv2Vbi2RiSHMIO1MEUGLYm9nrAnPfOlA4f8MLj9V2dhgBXSv4W
 aJnzDxzHANfTx6qWWlOrUW4GMtikf83dsGWbg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ToSnSP81
Subject: [Buildroot] [PATCH 6/6] package/libopenssl: add new configuration
 options
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

The transition from version 1.1 to 3.0.9, and subsequently to 3.3.1,
added new compilation options. This led to a significant increase in the
size of the library. These options allow user to disable these features
to obtain a smaller library size.

To ensure backward compatibility, all items are selected by default.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libopenssl/Config.in     | 106 +++++++++++++++++++++++++++++++
 package/libopenssl/libopenssl.mk |  14 ++++
 2 files changed, 120 insertions(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 0c8db52e2e1d..036b68241864 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -133,4 +133,110 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP
 	bool "enable compression"
 	default y
 
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_ARGON2
+	bool "enable ARGON2"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_CACHED_FETCH
+	bool "enable cached fetch"
+	default y
+	help
+	  Cache algorithms when they are fetched from a provider.
+	  Normally, a provider indicates if the algorithms it supplies
+	  can be cached or not. Using this option will reduce run-time
+	  memory usage but it also introduces a significant performance
+	  penalty. This option is primarily designed to help with
+	  detecting incorrect reference counting.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_CMP
+	bool "enable CMP"
+	default y
+	help
+	  Build support for Certificate Management Protocol (CMP) and
+	  Certificate Request Message Format (CRMF).
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL
+	bool "enable thread pool"
+	default y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Build with thread pool functionality. If enabled, OpenSSL
+	  algorithms may use the thread pool to perform parallel
+	  computation. This option in itself does not enable OpenSSL
+	  to spawn new threads. Currently the only supported thread
+	  pool mechanism is the default thread pool.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_DEFAULT_THREAD_POOL
+	bool "enable default thread pool"
+	default y
+	depends on BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL
+	help
+	  Build with default thread pool functionality. If enabled,
+	  OpenSSL may create and manage threads up to a maximum number
+	  of threads authorized by the application. Supported on POSIX
+	  compliant platforms.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_ECX
+	bool "enable ECX"
+	default y
+	help
+	  Build with ECX support. Disabling this option can be used
+	  to disable support for X25519, X448, and EdDSA.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_LOADER_ENGINE
+	bool "enable 'loader_attic' engine"
+	default y
+	depends on BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
+	help
+	  Build with 'loader_attic' engine support, which is meant
+	  just for internal OpenSSL testing purposes and supports
+	  loading keys, parameters, certificates, and CRLs from files.
+	  When this engine is used, files with such credentials are
+	  read via this engine.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_PADLOCK_ENGINE
+	bool "enable padlock engine"
+	default y
+	help
+	  Build the padlock engine.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MODULE
+	bool "enable modules"
+	default y
+	help
+	  Build modules.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_QUIC
+	bool "enable QUIC"
+	default y
+	help
+	  Build with QUIC support.
+
+config BR2_PACKAGE_LIBOPENSSL_SECURE_MEMORY
+	bool "enable secure memory"
+	default y
+	help
+	  Build with secure memory support.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SIV
+	bool "enable SIV"
+	default y
+	help
+	  Build with RFC5297 AES-SIV support.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SM2_PRECOMP_TABLE
+	bool "enable SM2 precomputed table"
+	default y
+	depends on BR2_aarch64
+	help
+	  Enable using the SM2 precomputed table. Disabling this option
+	  makes the library smaller.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE
+	bool "enable SSL trace"
+	default y
+	help
+	  Build with SSL Trace support. Disabling this option may
+	  provide a small reduction in libssl binary size.
+
 endif # BR2_PACKAGE_LIBOPENSSL
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 89a9189bb851..ab8454657ebf 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -107,6 +107,20 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_LIBOPENSSL_UNSECURE),,no-unit-test no-crypto-mdebug no-autoerrinit) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),,no-dynamic-engine ) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_ARGON2),,no-argon2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CACHED_FETCH),,no-cached-fetch) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CMP),,no-cmp) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL),,no-thread-pool) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_DEFAULT_THREAD_POOL),,no-default-thread-pool) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_ECX),,no-ecx) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_LOADER_ENGINE),,no-loadereng) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_PADLOCK_ENGINE),,no-padlockeng) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MODULE),,no-module) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_QUIC),,no-quic) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_SECURE_MEMORY),,no-secure-memory) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SIV),,no-siv) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SM2_PRECOMP_TABLE),,no-sm2-precomp) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE),,no-ssl-trace) \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
 			$(if $(BR2_STATIC_LIBS),no-dso)
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
