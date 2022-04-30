Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B8BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D42D60B8B;
	Sat, 30 Apr 2022 18:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id se79KEd5PeIf; Sat, 30 Apr 2022 18:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AC8060B58;
	Sat, 30 Apr 2022 18:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 513391BF94D
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29E1A60B58
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MD9RV-NwtIM7 for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5396960B73
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E213F84B55; Sat, 30 Apr 2022 18:44:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:40:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60aa067d74e41a7a598eb7ac44978f84d77a0eae
X-Git-Newrev: b03e8e693a62256289adb8db715622c3447d34ad
X-Patchwork-Hint: ignore
Message-Id: <20220430184417.E213F84B55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: add -lz to fix static builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=b03e8e693a62256289adb8db715622c3447d34ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to remove a patch which needs frequent updates on major version
bumps and to get rid of autoreconf we just add -lz when creating a static
build. This make sure that static linking occurs in the right order.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../tor/0001-Fix-static-linking-with-OpenSSL.patch | 94 ----------------------
 package/tor/tor.mk                                 |  7 +-
 2 files changed, 5 insertions(+), 96 deletions(-)

diff --git a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
deleted file mode 100644
index 26ed6fe819..0000000000
--- a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From ba6b8ee5b6dee19493a150c3715b0e202440d206 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Thu, 24 Jan 2019 18:19:51 +0100
-Subject: [PATCH] Fix static linking with OpenSSL
-
-Adjust link order of libz to solve bug with static linking
-and remove host paths when looking for openssl.
-
-[Vincent:
- - Adapt the patch to make it apply on the new version.]
-[Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7, 0.3.2.10,
-        0.3.4.8, 0.3.5.7, 0.4.4.5, 0.4.5.6 & 0.4.6.7]
-[Fabrice: fix detection of openssl functions in 0.3.5.8]
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac         | 4 ++--
- src/test/include.am  | 8 ++++----
- src/tools/include.am | 4 ++--
- 4 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 05e1392cf..580befa6b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1074,7 +1074,7 @@ AC_ARG_WITH(ssl-dir,
-   ])
- 
- AC_MSG_NOTICE([Now, we'll look for OpenSSL >= 1.0.1])
--TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto $TOR_LIB_GDI $TOR_LIB_WS32 $TOR_LIB_CRYPT32],
-+TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI $TOR_LIB_WS32 $TOR_LIB_CRYPT32],
-     [#include <openssl/ssl.h>
-      char *getenv(const char *);],
-     [struct ssl_cipher_st;
-@@ -1104,7 +1104,7 @@ dnl Now check for particular openssl functions.
- save_LIBS="$LIBS"
- save_LDFLAGS="$LDFLAGS"
- save_CPPFLAGS="$CPPFLAGS"
--LIBS="$TOR_OPENSSL_LIBS $LIBS"
-+LIBS="$TOR_OPENSSL_LIBS -lz $LIBS"
- LDFLAGS="$TOR_LDFLAGS_openssl $LDFLAGS"
- CPPFLAGS="$TOR_CPPFLAGS_openssl $CPPFLAGS"
- 
-diff --git a/src/test/include.am b/src/test/include.am
-index ecb768957..39a622e88 100644
---- a/src/test/include.am
-+++ b/src/test/include.am
-@@ -399,8 +399,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
- src_test_test_ntor_cl_LDADD = \
- 	libtor.a \
- 	$(rust_ldadd) \
--	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
--	$(TOR_LIBS_CRYPTLIB) @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
-+	@TOR_LIB_MATH@ \
-+	$(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
- 	@CURVE25519_LIBS@ @TOR_LZMA_LIBS@ @TOR_TRACE_LIBS@
- src_test_test_ntor_cl_AM_CPPFLAGS =	       \
- 	$(AM_CPPFLAGS)
-@@ -409,8 +409,8 @@
- src_test_test_hs_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
- src_test_test_hs_ntor_cl_LDADD = \
- 	libtor.a \
--	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
--	$(TOR_LIBS_CRYPTLIB) @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ \
-+	@TOR_LIB_MATH@ \
-+	$(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ \
-         @CURVE25519_LIBS@ @TOR_TRACE_LIBS@
- src_test_test_hs_ntor_cl_AM_CPPFLAGS =	       \
- 	$(AM_CPPFLAGS)
-diff --git a/src/tools/include.am b/src/tools/include.am
-index f7aa7e0d1..4c4e8aa7a 100644
---- a/src/tools/include.am
-+++ b/src/tools/include.am
-@@ -35,7 +35,7 @@ src_tools_tor_gencert_LDADD = \
- 	$(TOR_CRYPTO_LIBS) \
- 	$(TOR_UTIL_LIBS) \
- 	$(rust_ldadd) \
--	@TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ $(TOR_LIBS_CRYPTLIB) \
-+	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ \
- 	@TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ @CURVE25519_LIBS@
- endif
- 
-@@ -45,7 +45,7 @@ src_tools_tor_print_ed_signing_cert_LDADD = \
- 	src/trunnel/libor-trunnel.a \
-         $(TOR_CRYPTO_LIBS) \
-         $(TOR_UTIL_LIBS) \
--	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) \
-+	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ \
- 	@TOR_LIB_WS32@ @TOR_LIB_USERENV@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@
- 
- if USE_NSS
--- 
-2.20.1
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index d16b3541eb..78a6de66dc 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -11,7 +11,6 @@ TOR_LICENSE_FILES = LICENSE
 TOR_CPE_ID_VENDOR = torproject
 TOR_SELINUX_MODULES = tor
 TOR_DEPENDENCIES = libevent openssl zlib
-TOR_AUTORECONF = YES
 
 TOR_CONF_OPTS = \
 	--disable-gcc-hardening \
@@ -64,8 +63,12 @@ endif
 TOR_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-TOR_CONF_ENV += LIBS=-latomic
+TOR_LIBS += -latomic
 endif
+ifeq ($(BR2_STATIC_LIBS),y)
+TOR_LIBS += -lz
+endif
+TOR_CONF_ENV += LIBS="$(TOR_LIBS)"
 
 define TOR_INSTALL_CONF
 	$(INSTALL) -D -m 644 $(@D)/src/config/torrc.minimal \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
