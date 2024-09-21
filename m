Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EEBCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 19:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69C59400DD;
	Sat, 21 Sep 2024 19:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfyN8VL0A6TU; Sat, 21 Sep 2024 19:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2B4A4025D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2B4A4025D;
	Sat, 21 Sep 2024 19:55:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23DC31BF869
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 19:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A09126065A
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 19:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzaMtdeSWsKI for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 19:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89A246062D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89A246062D
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 19:55:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 825C983DA5; Sat, 21 Sep 2024 19:55:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 21:54:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab34bdcb38f950ac5232397e1168a9c1b66b2af4
X-Git-Newrev: d2f6d6da32a35aeb3f54b80ab6c672e1134378bc
X-Patchwork-Hint: ignore
Message-Id: <20240921195543.825C983DA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: add new configuration
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2f6d6da32a35aeb3f54b80ab6c672e1134378bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The transition from version 1.1 to 3.0.9, and subsequently to 3.3.1,
added new compilation options. This led to a significant increase in the
size of the library. These options allow user to disable these features
to obtain a smaller library size.

To ensure backward compatibility, all items are selected by default.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libopenssl/Config.in     | 96 ++++++++++++++++++++++++++++++++++++++++
 package/libopenssl/libopenssl.mk | 13 ++++++
 2 files changed, 109 insertions(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 0c8db52e2e..03d3def802 100644
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
index 82b924c557..a90e599c17 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
