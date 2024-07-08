Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99591C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 17:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D68C440B2C;
	Mon,  8 Jul 2024 17:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNibbUlWHkCE; Mon,  8 Jul 2024 17:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 752A940B1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 752A940B1E;
	Mon,  8 Jul 2024 17:09:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F08C61BF409
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 17:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E88C480BDC
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 17:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLnJ5oqzoRI8 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 17:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DA5E80BC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA5E80BC8
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DA5E80BC8
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 17:09:06 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso41403061fa.3
 for <buildroot@buildroot.org>; Mon, 08 Jul 2024 10:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720458544; x=1721063344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0idw9Wv9xeqcdcc/MOvIc7s7qNsGBSH1+Z8K5Mp6Pl8=;
 b=IkjpF2HT5MR+xVofLvHcJFEsWk2WUJbK1kFAWnBR61bdFvIF5A8gKORmTlnp469Poi
 b3WdsBw9WLENb8yXDl9dxAWl1Y+H6uUEHytdS7b2gY+YbJYOhax5UPsLG75Mk5cbE7QK
 ye9ZjtDME888bMjVgPmF1/IifdDWVHReHcE1/m4pqCNL3++TKhsGBsO1oF3oUazANCDa
 +ernM98cYq8AeS4NWrG/oFWOGPeH5tM30KLxBkb3g9x++AqKzomtOaMagV0MhCS428gb
 axuDDbU6CST5XIwcZ2Gq8nXH6cyLh9iFsrvRaUYnSbdIS6vh5dl7oMoerBg/rARwkevM
 89nw==
X-Gm-Message-State: AOJu0Yzelnj+IGrlo2cuf8liUpBgyeMv0lMnAR2sbRtu4DY6C2K8fSdC
 ZV3tRlgXeRM8atJHBUQ/KYV3FW2cXzQH4tWvCSkp8e6Z3kIAbpI5RGAXdb8l21H+Ttbc+XFm3RL
 HfKY=
X-Google-Smtp-Source: AGHT+IGzmGiNJfXSiDAXL6nasLWS9v+lTo5Y4IZr6mt9G/MY0Ebvk+8uWzwFKxNSocPyBQXuL8iMUQ==
X-Received: by 2002:a2e:3608:0:b0:2ee:6b86:b098 with SMTP id
 38308e7fff4ca-2eeb30b8446mr2542601fa.8.1720458544098; 
 Mon, 08 Jul 2024 10:09:04 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.100])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bbe2cf88sm56118a12.30.2024.07.08.10.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 10:09:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jul 2024 19:08:56 +0200
Message-ID: <20240708170856.803984-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720458544; x=1721063344;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0idw9Wv9xeqcdcc/MOvIc7s7qNsGBSH1+Z8K5Mp6Pl8=;
 b=D6BikM4NF5RoNtHz71FpXQoixY8exgEd1VVwNtgzav1abpQC36eMVrrRdQIfCV+22m
 E75Gb9zUCJ006C2cMy3NfYCuuBsRkyqj1zjTR11RK09Dfb/GgyqDZTGQZkA4wkbkSYGK
 AvnRbIBAHMJO9KpjYEqnX4+oEa3YaoH1ee4Ag=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=D6BikM4N
Subject: [Buildroot] [PATCH v2] package/libopenssl: add new configuration
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
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
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
Changes v1 -> v2:
 - Drop BR2_PACKAGE_LIBOPENSSL_ENABLE_DEFAULT_THREAD_POOL and use a
   single option (i. e. BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL)
   that enables the default thread-pool.

 package/libopenssl/Config.in     | 96 ++++++++++++++++++++++++++++++++
 package/libopenssl/libopenssl.mk | 13 +++++
 2 files changed, 109 insertions(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 0c8db52e2e1d..03d3def802ff 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -133,4 +133,100 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP
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
index 89a9189bb851..601afb6a7d79 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -107,6 +107,19 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_LIBOPENSSL_UNSECURE),,no-unit-test no-crypto-mdebug no-autoerrinit) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),,no-dynamic-engine ) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_ARGON2),,no-argon2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CACHED_FETCH),,no-cached-fetch) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CMP),,no-cmp) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL),,no-thread-pool no-default-thread-pool) \
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
