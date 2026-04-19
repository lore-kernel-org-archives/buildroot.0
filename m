Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDFDEA7190
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 13:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE452814AB;
	Sun, 19 Apr 2026 13:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCsWepI4EEw7; Sun, 19 Apr 2026 13:32:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B8D0814B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776605550;
	bh=JiSXbiukw35m4KHANJNf3dgPJbONsbPBtvIkHa/sEDk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gY+0ItB1WJj25jLmR+Jdwd4aAnPZKTqblLUK8MLVwTBDylIQTMZyB1RT4vdZmtL0R
	 NUTSwqh5eAJPKTodA4FcxRRkHshyjNouoIVOHpJXooS8P8c0AKsn5NUfkCtmeYwsNw
	 M96TpGN/4krZp3s/Dd9f68vYURL6flFeAZMpzkfA11J7S0TShM7uqodkQzHx+1hNEU
	 xHx4X4P+AxqwjYGRe42HyqlVbczShkUIQyVNsPWYiEcCP6CgNhfNaSUfQL6K8lpfEv
	 PnEDIiygIEkeAk7ssJcWAEoF6jn/avW+Ql6klSBKiQAhX2J2eKsSgKov+S76N97VPx
	 pQRFQZ1JWQNEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B8D0814B5;
	Sun, 19 Apr 2026 13:32:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A3BB2B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BAAF814AB
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BskXr0GRg2WK for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 13:32:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C71998149A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C71998149A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C71998149A
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:32:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 825F7A4C37AD;
 Sun, 19 Apr 2026 15:32:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35468)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wESG9-0000000046E-0N5l;
 Sun, 19 Apr 2026 13:32:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Apr 2026 15:32:25 +0200
Message-ID: <20260419133225.3179593-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776605545;
 bh=1O7iE3dQui65c+tsnWMeXJpSxxVNtAB2h/YuiFIIhy0=;
 h=From:To:Cc:Subject:Date:From;
 b=RRm0sGrPxz7/a/4CFINDsAdVoPvO2tXZ1Ij3j/FQdNGevPhKtCE3V6WOHegRIdTbE
 xQ2gApaphBApl0FfUqRgmUeciyQFNw5SkhBwHhGf/oHMQY/KAY8R0CMHT3YLFXOj2P
 s2RtYZpvmP08dmzvq47Y6ExslAG87NTzDoJF2QR0VjYD1LBQ+zd/QyPCzBs1WOOH27
 UEe8A4HYC3theTbpp3rgnQlS1eg9LoGoR1TB1CsA25ZOUEjoCappDdjwqGC5HjsJDr
 4aiKNejNlrt6nicVpVq4YuGxuCpiVNDCAwW/gID2i812mmO2zs/BwlR3xm5XDc1yG/
 kgPfkwU7G3m+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=RRm0sGrP
Subject: [Buildroot] [PATCH 1/1] package/lftp: bump version to 4.9.3
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

https://github.com/lavv17/lftp/releases/tag/v4.9.3

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  2 -
 ...-LibreSSL-following-commit-537f37898.patch | 46 -------------------
 ..._ssl.c-fix-build-with-libressl-2.7.0.patch | 36 ---------------
 package/lftp/lftp.hash                        |  6 +--
 package/lftp/lftp.mk                          |  2 +-
 5 files changed, 4 insertions(+), 88 deletions(-)
 delete mode 100644 package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
 delete mode 100644 package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 26c13d5387..3e06e60fa2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -474,8 +474,6 @@ package/leafnode2/0001-cross_makefile.patch lib_patch.Upstream
 package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch lib_patch.Upstream
 package/leveldb/0002-CMake-install-libmemenv.a.patch lib_patch.Upstream
 package/leveldb/0003-CMakeLists.txt-check-for-atomic-library.patch lib_patch.Upstream
-package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch lib_patch.Upstream
-package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch lib_patch.Upstream
 package/libabseil-cpp/0001-force-position-independent-code.patch lib_patch.Upstream
 package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch lib_patch.Upstream
 package/libart/0001-art-config-cross.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch b/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
deleted file mode 100644
index 8a40351b63..0000000000
--- a/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0276d5c239c41b3a63f738a5dc47fd56ac389cf0 Mon Sep 17 00:00:00 2001
-From: Ganael Laplanche <ganael.laplanche@martymac.org>
-Date: Thu, 20 Aug 2020 12:29:05 +0200
-Subject: [PATCH] Fix build with LibreSSL (following commit 537f37898)
-
-Upstream status: https://github.com/lavv17/lftp/commit/0276d5c239c41b3a63f738a5dc47fd56ac389cf0
-Signed-off-by: Artem Panfilov <artemp@synopsys.com>
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/lftp_ssl.cc | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
-index 14a3b9d4..968d3fb2 100644
---- a/src/lftp_ssl.cc
-+++ b/src/lftp_ssl.cc
-@@ -34,7 +34,7 @@
- #include "misc.h"
- #include "network.h"
- #include "buffer.h"
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
- #define X509_STORE_CTX_get_by_subject X509_STORE_get_by_subject
- #endif
- extern "C" {
-@@ -840,7 +840,7 @@ lftp_ssl_openssl_instance::lftp_ssl_openssl_instance()
-    ssl_ctx=SSL_CTX_new();
-    X509_set_default_verify_paths(ssl_ctx->cert);
- #else
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
-    SSLeay_add_ssl_algorithms();
- #endif
-    ssl_ctx=SSL_CTX_new(SSLv23_client_method());
-@@ -1080,7 +1080,7 @@ void lftp_ssl_openssl::copy_sid(const lftp_ssl_openssl *o)
- 
- const char *lftp_ssl_openssl::strerror()
- {
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
-    SSL_load_error_strings();
- #endif
-    int error=ERR_get_error();
--- 
-2.25.1
-
diff --git a/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch b/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch
deleted file mode 100644
index 4251a5e176..0000000000
--- a/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3ffa0132987bdde986c82c924bc51b13b37f8b54 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 6 Apr 2022 22:56:21 +0200
-Subject: [PATCH] src/lftp_ssl.c: fix build with libressl >= 2.7.0
-
-X509_OBJECT_get0_X509_CRL is provided by libressl since version 2.7.0
-and
-https://github.com/libressl-portable/openbsd/commit/9866ae34c0af718973475296bd9ef036d3aaa94e
-resulting in the following build failure:
-
-/nvmedata/autobuild/instance-21/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblaze-buildroot-linux-musl/11.2.0/../../../../microblaze-buildroot-linux-musl/bin/ld: /nvmedata/autobuild/instance-21/output-1/host/microblaze-buildroot-linux-musl/sysroot/usr/lib/libcrypto.a(x509_lu.c.o): in function `X509_OBJECT_get0_X509_CRL':
-(.text+0xc3c): multiple definition of `X509_OBJECT_get0_X509_CRL'; /nvmedata/autobuild/instance-21/output-1/build/lftp-4.9.2/src/.libs/liblftp-network.a(liblftp_network_la-lftp_ssl.o):(.text+0x894): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/7fd1dfd5bc750ae5a3278ca950c838ae90704b23
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/lavv17/lftp/commit/3ffa0132987bdde986c82c924bc51b13b37f8b54]
----
- src/lftp_ssl.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
-index 26e91e4b..a814543d 100644
---- a/src/lftp_ssl.cc
-+++ b/src/lftp_ssl.cc
-@@ -664,7 +664,7 @@ int gnutls_x509_crt_list_import(gnutls_x509_crt_t *certs, unsigned int* cert_max
- #elif USE_OPENSSL
- //static int lftp_ssl_passwd_callback(char *buf,int size,int rwflag,void *userdata);
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || (defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000L)
- // for compatibility with older versions
- X509_OBJECT *X509_OBJECT_new()
- {
diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index e4c3305c03..8a548fba0a 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,7 +1,7 @@
-# From http://lftp.yar.ru/ftp/lftp-4.9.2.md5sum
-md5  b3a272ecb7a2b60e3827776f90ffb2f3  lftp-4.9.2.tar.xz
+# From http://lftp.yar.ru/ftp/lftp-4.9.3.md5sum
+md5  f2e4ffa81b68106a14d354d50635bbf4  lftp-4.9.3.tar.xz
 # Locally calculated after checking gpg signature
-sha256  c517c4f4f9c39bd415d7313088a2b1e313b2d386867fe40b7692b83a20f0670d  lftp-4.9.2.tar.xz
+sha256  96e7199d7935be33cf6b1161e955b2aab40ab77ecdf2a19cea4fc1193f457edc  lftp-4.9.3.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 483ca298cd..50b3f9809f 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.9.2
+LFTP_VERSION = 4.9.3
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
