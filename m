Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC54ED1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B297C616FE;
	Wed,  3 Dec 2025 22:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDyUzHZM8e2m; Wed,  3 Dec 2025 22:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2D1261772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799511;
	bh=J5PeZ5fM8/MQjycU6leeYjAcMfWscgMCl9HmSVvKITg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SYWGjmH68VgoOPB2dxLIwTvho4Bbfmh05lsfRZ0Ji1aD8xigd5GxwuLEUV88/2DGA
	 IoM7kI7N4VDhB2cq0x7ZRASeWniUqOLESJYy+t+PqEkGE0jCwZ6VsFn4NGF9ksukF2
	 zKvPENvvJAFl53YbdEaOj2aPKA5wwJaNyw4CkM8tOWLYnOQ1HcHVQyDuI3WwcZmcpz
	 5VpRWRNu4oJwfbynGMgG/pu3hA56Dg0OWL7Pof0qAyfBu9ZujOkv2uq0LgRP0V1o3M
	 +LEu+SK6K22zf0bSs/OCsDwRMz9E3/fw1N2jMsuE4FN/pz2auneiMBhseflnF//oda
	 mgs2M4bWRVfYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D1261772;
	Wed,  3 Dec 2025 22:05:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F24D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57DA040A80
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wztJPTDXWXXU for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:05:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAAF140884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAAF140884
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAAF140884
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7DED5A4C79D6;
 Wed,  3 Dec 2025 22:59:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqi-000000002OS-0kcK;
 Wed, 03 Dec 2025 21:57:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:20 +0100
Message-ID: <20251203215723.2323032-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799147;
 bh=IMQdMt0kOTSbYi/113NinFKrwW+qiJpMRqAsV3QeSJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vEDYsBRVkiBGU7tcwBx/GujkOnzhNo9sg3X7Tj17FWmfr0/sX0+AYtt9T7PzSmb1Z
 HE5fUSUGiGCA2T8HRL0ecSc2rw/i0X/6jtCRuzV+IU0EI3QRs6iA/1HrCznPdnE1fW
 UHZCl0ipVRO0DSQh+U/EfluQKBKdMIGu5Ld4dyl+iuQVLrB9AR/rZLlWxiXfyZ86iN
 0IS45/XPclYmn/UfSzzfAwLHzvTAeFp+k55YlZWVNp4GUa4fjCF7U2f45vHkGTGrdl
 AU3FrIq6gCjbiYOsFc9cCZfUyFzzr2N5BjP3pWCRieNDxAekMOLI/z/Vdgpo+yu5cB
 O3/LNnCKMneQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vEDYsBRV
Subject: [Buildroot] [PATCH/next 13/16] package/pistache: bump version to
 0.4.26
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patches which are included in this release.

Rapidjson was converted into an optional dependency:
https://github.com/pistacheio/pistache/commit/52abf5a86b21d574df471fa1a05f2e6d22c7fbff

Removed configure option PISTACHE_ENABLE_NETWORK_TESTS:
https://github.com/pistacheio/pistache/commit/7d71e3b99fbe515f1854aeb039d2964507f03125

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  2 -
 ...port.cc-fallback-value-for-RUSAGE_TH.patch | 33 ----------------
 ...erver-listener.cc-fix-libressl-build.patch | 38 -------------------
 ...-missing-cstdint-header-include-1142.patch | 23 -----------
 package/pistache/Config.in                    |  1 -
 package/pistache/pistache.hash                |  2 +-
 package/pistache/pistache.mk                  | 13 +++++--
 7 files changed, 10 insertions(+), 102 deletions(-)
 delete mode 100644 package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
 delete mode 100644 package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch
 delete mode 100644 package/pistache/0003-Add-missing-cstdint-header-include-1142.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index b7d66c3be2..9374db5856 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -830,8 +830,6 @@ package/pifmrds/0001-Makefile-cross-compile-friendly.patch lib_patch.Upstream
 package/pifmrds/0002-Makefile-use-LDFLAGS.patch lib_patch.Upstream
 package/pifmrds/0003-Makefile-fix-static-link.patch lib_patch.Upstream
 package/pigpio/S50pigpio Shellcheck lib_sysv.Variables
-package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch lib_patch.Upstream
-package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch lib_patch.Upstream
 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch lib_patch.Upstream
 package/pkgconf/pkg-config.in Shellcheck
 package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch lib_patch.Upstream
diff --git a/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch b/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
deleted file mode 100644
index 327933e26d..0000000000
--- a/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5feed6d2f86750bfe1e7c26d6fd4e8d2195ea81f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 4 Aug 2022 19:54:23 +0200
-Subject: [PATCH] src/common/transport.cc: fallback value for RUSAGE_THREAD
-
-uClibc-ng currently does not define RUSAGE_THREAD, so let's add a
-fallback value until it gets fixed in uClibc-ng. The value is the same
-on all Linux systems, regardless of the CPU architecture.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream bug: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/MEXOUSFSH46UFS3AEMEIEPTL5U4HVEFL/
----
- src/common/transport.cc | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/common/transport.cc b/src/common/transport.cc
-index 62efb8c..0f3abb0 100644
---- a/src/common/transport.cc
-+++ b/src/common/transport.cc
-@@ -515,6 +515,10 @@ namespace Pistache::Tcp
- 
-         rusage now;
- 
-+#if !defined(RUSAGE_THREAD)
-+#define RUSAGE_THREAD 1
-+#endif
-+
-         auto res = getrusage(RUSAGE_THREAD, &now);
-         if (res == -1)
-             loadRequest_.reject(std::runtime_error("Could not compute usage"));
--- 
-2.37.1
-
diff --git a/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch b/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch
deleted file mode 100644
index f2fe2183ae..0000000000
--- a/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 656bff21c1d20b25058da9dbc27d28ad2ac7ae6e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 25 Feb 2023 18:09:39 +0100
-Subject: [PATCH] src/server/listener.cc: fix libressl build
-
-Fix the following libressl build failure:
-
-../src/server/listener.cc: In member function 'void Pistache::Tcp::Listener::setupSSLAuth(const std::string&, const std::string&, int (*)(int, void*))':
-../src/server/listener.cc:582:29: error: 'SSL_verify_cb' was not declared in this scope; did you mean 'RSA_verify'?
-  582 |                            (SSL_verify_cb)cb
-      |                             ^~~~~~~~~~~~~
-      |                             RSA_verify
-
-Fixes:
- - http://autobuild.buildroot.org/results/066fc078980e5216f38411eee455088e15fa1101
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/pistacheio/pistache/pull/1124]
----
- src/server/listener.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/server/listener.cc b/src/server/listener.cc
-index 38d2661..c09cb36 100644
---- a/src/server/listener.cc
-+++ b/src/server/listener.cc
-@@ -609,7 +609,7 @@ namespace Pistache::Tcp
-         SSL_CTX_set_verify(GetSSLContext(ssl_ctx_),
-                            SSL_VERIFY_PEER | SSL_VERIFY_FAIL_IF_NO_PEER_CERT | SSL_VERIFY_CLIENT_ONCE,
- /* Callback type did change in 1.0.1 */
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-                            (int (*)(int, X509_STORE_CTX*))cb
- #else
-                            (SSL_verify_cb)cb
--- 
-2.39.1
-
diff --git a/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch b/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch
deleted file mode 100644
index 3451e4aa4c..0000000000
--- a/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From dabe9fcd3eaaa6b0b8723369b2565778341630c0 Mon Sep 17 00:00:00 2001
-From: a-andre <13609565+a-andre@users.noreply.github.com>
-Date: Thu, 29 Jun 2023 16:34:11 +0200
-Subject: [PATCH] Add missing cstdint header include (#1142)
-
-Upstream: https://github.com/pistacheio/pistache/commit/dabe9fcd3eaaa6b0b8723369b2565778341630c0
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/pistache/flags.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/pistache/flags.h b/include/pistache/flags.h
-index 9be2b32bb..6adcc74bc 100644
---- a/include/pistache/flags.h
-+++ b/include/pistache/flags.h
-@@ -13,6 +13,7 @@
- #pragma once
- 
- #include <climits>
-+#include <cstdint>
- #include <iostream>
- #include <type_traits>
- 
diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index e66c24d86d..57beeced25 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_RAPIDJSON
 	help
 	  Pistache is a modern and elegant HTTP and REST framework
 	  for C++. It is entirely written in pure C++17 and provides
diff --git a/package/pistache/pistache.hash b/package/pistache/pistache.hash
index 9a2cd1d1f9..545a556a24 100644
--- a/package/pistache/pistache.hash
+++ b/package/pistache/pistache.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  f2b3e8b2581cfed5e036d1b97a9b97dc7022b3ddaab69c4691238faff3199bc1  pistache-3ec9d7c4f8b828fdd391550fff81b01e72dd6269.tar.gz
+sha256  29af6562547497acf6f49170661786fe8cf1ed3712ad80e69c53da4661c59544  pistache-0.4.26.tar.gz
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
index f4de5e3b2a..995edb6390 100644
--- a/package/pistache/pistache.mk
+++ b/package/pistache/pistache.mk
@@ -4,18 +4,23 @@
 #
 ################################################################################
 
-PISTACHE_VERSION = 3ec9d7c4f8b828fdd391550fff81b01e72dd6269
-PISTACHE_SITE = $(call github,oktal,pistache,$(PISTACHE_VERSION))
+PISTACHE_VERSION = 0.4.26
+PISTACHE_SITE = $(call github,oktal,pistache,v$(PISTACHE_VERSION))
 PISTACHE_LICENSE = Apache-2.0
 PISTACHE_LICENSE_FILES = LICENSE
 
 PISTACHE_INSTALL_STAGING = YES
-PISTACHE_DEPENDENCIES = rapidjson
+
+ifeq ($(BR2_PACKAGE_RAPIDJSON),y)
+PISTACHE_DEPENDENCIES += rapidjson
+PISTACHE_CONF_OPTS += -DPISTACHE_USE_RAPIDJSON=true
+else
+PISTACHE_CONF_OPTS += -DPISTACHE_USE_RAPIDJSON=false
+endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PISTACHE_DEPENDENCIES += openssl
 PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=true
-PISTACHE_CONF_OPTS += -DPISTACHE_ENABLE_NETWORK_TESTS=false
 else
 PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=false
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
