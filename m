Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114A1C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 18:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 937C560A98;
	Mon, 22 Apr 2024 18:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btEmA9-mn5x3; Mon, 22 Apr 2024 18:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 393E1608D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 393E1608D9;
	Mon, 22 Apr 2024 18:00:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36DC21BF333
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 18:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2135480BCC
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 18:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3aQDWU_9x-l for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 17:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.54;
 helo=mail-wr1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 354C78174A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 354C78174A
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 354C78174A
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 17:59:52 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-343c891bca5so3758467f8f.2
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 10:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713808790; x=1714413590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oBhK/DmKvZmxnMF0LqO/MPGCu3Omh/M1T62UNd28rFc=;
 b=iZwI9+pnQW3MnDsbwajSq80fb0llgssuyFKVxzZXfrbb8j2WD4lsIxU+LoH3FEcGPU
 v48l7+WMC2GkzDYMw7CQbq4azT9E21Yw9ccKqneTlPWX/IU6majOwBYV+llPxQSHLM/K
 YaTOa7vQrTB0MAfkrCSYvnjufiCVF+fmbTQuncmH/825WdIBVPVpRrmXAsJaGyZJau8S
 yUmfw4ZKxUa/N2OYmoGHM0x6QXCuVtAfaGuwB7AcTqZ2Nxd3w8xDPzg2KnLUlMni3iXj
 qHtsydCxkl8DMgiVx9bx0NQKG33MQIIOhAcP56HK0grh3hUmAlrDQ7hMPEV8aPY6l5g0
 8O6Q==
X-Gm-Message-State: AOJu0YwknGrAYixDIsOw9XJdX13zSttXZ+KQ/2oSwMlfxfwSF81i/lcR
 rN8YyjPmgrpn5lA4aPvSrayYsy5DYXRORBs1atZ37SqcQGr0lFyr4F17kg==
X-Google-Smtp-Source: AGHT+IGpqmR2hYqZdJpdtJvgO9F1tmOPd7BXAAKgYKliyCPRvBGoVECcVOQ1bDC+a5U0sByuGdDtVA==
X-Received: by 2002:a05:6000:b85:b0:347:ced:c7c7 with SMTP id
 dl5-20020a0560000b8500b003470cedc7c7mr9678261wrb.9.1713808789435; 
 Mon, 22 Apr 2024 10:59:49 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:148b:3752:e121:4c3e])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a5d6207000000b00346f9071405sm12628046wru.21.2024.04.22.10.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 10:59:48 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Mon, 22 Apr 2024 19:59:44 +0200
Message-Id: <20240422175944.449122-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/syslog-ng: bump to 4.7.1
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Announcement:
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.4.0
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.5.0
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.6.0
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.7.0
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.7.1

Bump info:
 - sha256 update for COPYING:
 https://github.com/syslog-ng/syslog-ng/commit/52e9e10053f332ba0a4ba0fccc58a67f48c58788

 - json-c is now a hard-dependency:
 https://github.com/syslog-ng/syslog-ng/commit/d9220c79b202cb23209f52bd941f16acac0d0d74

 - enable-cloud-auth requires curl
 https://github.com/syslog-ng/syslog-ng/pull/4755

 - 0001-fix-build-on-uclibc.patch upstream:
 https://github.com/buytenh/ivykis/commit/5100a11a838722d063e67baf3200446861c96027 and
 https://github.com/syslog-ng/syslog-ng/commit/468df07d80d58db806072d1565ec5f63bb02ffc3

 - 0002-lib-transport-tls-context.c-fix-libressl-build.patch upstream:
 https://github.com/syslog-ng/syslog-ng/commit/065c09c52296148b33a273495796cdaaa09bb5e2

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 .../syslog-ng/0001-fix-build-on-uclibc.patch  | 52 ----------
 ...ort-tls-context.c-fix-libressl-build.patch | 97 -------------------
 package/syslog-ng/Config.in                   |  1 +
 package/syslog-ng/syslog-ng.conf              |  2 +-
 package/syslog-ng/syslog-ng.hash              |  4 +-
 package/syslog-ng/syslog-ng.mk                | 17 +---
 6 files changed, 8 insertions(+), 165 deletions(-)
 delete mode 100644 package/syslog-ng/0001-fix-build-on-uclibc.patch
 delete mode 100644 package/syslog-ng/0002-lib-transport-tls-context.c-fix-libressl-build.patch

diff --git a/package/syslog-ng/0001-fix-build-on-uclibc.patch b/package/syslog-ng/0001-fix-build-on-uclibc.patch
deleted file mode 100644
index 07c3f0721c..0000000000
--- a/package/syslog-ng/0001-fix-build-on-uclibc.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 98bd6106f8c48bc8f0a27bd712ed4ba6249e9a5f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 13 Jan 2019 11:03:51 +0100
-Subject: [PATCH] fix build on m68k with uclibc
-
-uclibc on m68k defines pthread_spinlock_t but does not define
-pthread_spin_trylock so check for this function before using it
-
-Fixes:
- - http://autobuild.buildroot.org/results/0a6de11c030a4f39e402917809fc6d33fb463d1b
-
-Upstream: https://github.com/buytenh/ivykis/pull/22
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac   | 3 +++
- src/spinlock.h | 4 ++++
- 2 files changed, 7 insertions(+)
-
-diff --git a/lib/ivykis/configure.ac b/lib/ivykis/configure.ac
-index e9b10c0..24152a9 100644
---- a/lib/ivykis/configure.ac
-+++ b/lib/ivykis/configure.ac
-@@ -110,6 +110,9 @@ AC_CACHE_CHECK(for linux/netfilter_ipv4.h, ac_cv_header_linux_netfilter_ipv4_h,
- # Check for pthread_spinlock_t.
- AC_CHECK_TYPES([pthread_spinlock_t], [], [], [[#include <pthread.h>]])
- 
-+# Check for pthread_spin_trylock
-+AC_CHECK_FUNCS([pthread_spin_trylock])
-+
- # Check which header file defines 'struct timespec'.
- for hdr in sys/time.h sys/timers.h time.h pthread.h
- do
-diff --git a/lib/ivykis/src/spinlock.h b/lib/ivykis/src/spinlock.h
-index ebcdbec..d837df8 100644
---- a/lib/ivykis/src/spinlock.h
-+++ b/lib/ivykis/src/spinlock.h
-@@ -76,7 +76,11 @@ static inline void fallback_spin_unlock(fallback_spinlock_t *lock)
- 
- static inline int pthread_spinlocks_available(void)
- {
-+#ifdef HAVE_PTHREAD_SPIN_TRYLOCK
- 	return !!(pthread_spin_trylock != NULL);
-+#else
-+	return 0;
-+#endif
- }
- 
- 
--- 
-2.14.1
-
diff --git a/package/syslog-ng/0002-lib-transport-tls-context.c-fix-libressl-build.patch b/package/syslog-ng/0002-lib-transport-tls-context.c-fix-libressl-build.patch
deleted file mode 100644
index 17cc72b983..0000000000
--- a/package/syslog-ng/0002-lib-transport-tls-context.c-fix-libressl-build.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From ede106afd7d70a8f962acf10a4e3f4a50a70cb15 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 1 Oct 2023 11:27:09 +0200
-Subject: [PATCH] lib/transport/tls-context.c: fix libressl build
-
-Fix the following build failure with libressl raised since version 4.0.0
-and
-https://github.com/syslog-ng/syslog-ng/commit/bc05f28a4b511ac9090195280163a7f822712ceb:
-
-lib/transport/tls-context.c: In function 'tls_context_setup_cmd_context':
-lib/transport/tls-context.c:320:3: error: unknown type name 'SSL_CONF_CTX'; did you mean 'SSL_AEAD_CTX'?
-  320 |   SSL_CONF_CTX *ssl_conf_ctx = SSL_CONF_CTX_new();
-      |   ^~~~~~~~~~~~
-      |   SSL_AEAD_CTX
-
-Fixes:
- - http://autobuild.buildroot.org/results/dc4d60d752e579ef054915eee3d7e3e73c25929b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/syslog-ng/syslog-ng/pull/4655
----
- cmake/openssl_functions.cmake | 1 +
- configure.ac                  | 1 +
- lib/transport/tls-context.c   | 4 ++++
- syslog-ng-config.h.in         | 1 +
- 4 files changed, 7 insertions(+)
-
-diff --git a/cmake/openssl_functions.cmake b/cmake/openssl_functions.cmake
-index 5afbd7f12..da06ca59a 100644
---- a/cmake/openssl_functions.cmake
-+++ b/cmake/openssl_functions.cmake
-@@ -41,6 +41,7 @@ function (openssl_set_defines)
-     X509_get_extension_flags
-     DH_set0_pqg
-     BN_get_rfc3526_prime_2048
-+    SSL_CONF_CTX_new
-     SSL_CTX_set_num_tickets
-     SSL_CTX_set_ciphersuites
-     SSL_CTX_set1_sigalgs_list
-diff --git a/configure.ac b/configure.ac
-index d636bbefa..46e43db7b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1136,6 +1136,7 @@ AC_CHECK_DECLS([EVP_MD_CTX_reset], [], [], [[#include <openssl/evp.h>]])
- AC_CHECK_DECLS([ASN1_STRING_get0_data], [], [], [[#include <openssl/asn1.h>]])
- AC_CHECK_DECLS([DH_set0_pqg], [], [], [[#include <openssl/dh.h>]])
- AC_CHECK_DECLS([BN_get_rfc3526_prime_2048], [], [], [[#include <openssl/bn.h>]])
-+AC_CHECK_DECLS([SSL_CONF_CTX_new],[], [], [[#include <openssl/ssl.h>]])
- AC_CHECK_DECLS([SSL_CTX_set_num_tickets],[], [], [[#include <openssl/ssl.h>]])
- AC_CHECK_DECLS([SSL_CTX_set1_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
- AC_CHECK_DECLS([SSL_CTX_set1_client_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
-diff --git a/lib/transport/tls-context.c b/lib/transport/tls-context.c
-index be2fea68d..713b63f31 100644
---- a/lib/transport/tls-context.c
-+++ b/lib/transport/tls-context.c
-@@ -314,6 +314,7 @@ tls_context_setup_sigalgs(TLSContext *self)
-   return TRUE;
- }
- 
-+#if SYSLOG_NG_HAVE_DECL_SSL_CONF_CTX_new
- static gboolean
- tls_context_setup_cmd_context(TLSContext *self)
- {
-@@ -347,6 +348,7 @@ tls_context_setup_cmd_context(TLSContext *self)
-   SSL_CONF_CTX_free(ssl_conf_ctx);
-   return result;
- }
-+#endif
- 
- static PKCS12 *
- _load_pkcs12_file(TLSContext *self, const gchar *pkcs12_file)
-@@ -593,8 +595,10 @@ tls_context_setup_context(TLSContext *self)
-   if (!tls_context_setup_sigalgs(self))
-     goto error;
- 
-+#if SYSLOG_NG_HAVE_DECL_SSL_CONF_CTX_new
-   if (!tls_context_setup_cmd_context(self))
-     goto error;
-+#endif
- 
-   return TLS_CONTEXT_SETUP_OK;
- 
-diff --git a/syslog-ng-config.h.in b/syslog-ng-config.h.in
-index 412294d2a..6d01b84a0 100644
---- a/syslog-ng-config.h.in
-+++ b/syslog-ng-config.h.in
-@@ -60,6 +60,7 @@
- #cmakedefine ENV_LD_LIBRARY_PATH @ENV_LD_LIBRARY_PATH@
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_EVP_MD_CTX_RESET
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_ASN1_STRING_GET0_DATA
-+#cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CONF_CTX_new
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_GET0_PARAM
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_CIPHERSUITES
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
--- 
-2.40.1
-
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index aa1e71d225..c06a7221bf 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 06e48cdd50..bab628f521 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.3
+@version: 4.7
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 6841ed5eb1..7f829c8b13 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  999dbab62982c3cffba02c0be22c596ee1ce81d6954689dc9b3a6afeb513cce3  syslog-ng-4.3.1.tar.gz
-sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd  COPYING
+sha256  5477189a2d12325aa4faebfcf59f5bdd9084234732f0c3ec16dd253847dacf1c  syslog-ng-4.7.1.tar.gz
+sha256  d7d51f8d0f6ee9757a371080e7f5fa19ac73afbef14db6e981705cf1ec813d6b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index dd02a6e3af..4f9a455e81 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,15 +6,13 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.3.1
+SYSLOG_NG_VERSION = 4.7.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
 SYSLOG_NG_CPE_ID_VENDOR = oneidentity
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
-	libglib2 openssl pcre2
-# We're patching configure.ac
-SYSLOG_NG_AUTORECONF = YES
+	json-c libglib2 openssl pcre2
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
 	--disable-java --disable-java-modules --disable-mongodb \
 	--disable-python
@@ -48,13 +46,6 @@ else
 SYSLOG_NG_CONF_OPTS += --disable-smtp
 endif
 
-ifeq ($(BR2_PACKAGE_JSON_C),y)
-SYSLOG_NG_DEPENDENCIES += json-c
-SYSLOG_NG_CONF_OPTS += --enable-json
-else
-SYSLOG_NG_CONF_OPTS += --disable-json
-endif
-
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 SYSLOG_NG_DEPENDENCIES += util-linux
 endif
@@ -70,10 +61,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 SYSLOG_NG_DEPENDENCIES += libcurl
-SYSLOG_NG_CONF_OPTS += --enable-http
+SYSLOG_NG_CONF_OPTS += --enable-http --enable-cloud-auth
 SYSLOG_NG_CONF_OPTS += --with-libcurl="$(STAGING_DIR)/usr"
 else
-SYSLOG_NG_CONF_OPTS += --disable-http
+SYSLOG_NG_CONF_OPTS += --disable-http --disable-cloud-auth
 endif
 
 ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
