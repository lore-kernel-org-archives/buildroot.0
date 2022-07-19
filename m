Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B460C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1003382DD9;
	Tue, 19 Jul 2022 15:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1003382DD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0JYZYFzJnCG; Tue, 19 Jul 2022 15:36:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF3CF82D57;
	Tue, 19 Jul 2022 15:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF3CF82D57
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F12D41BF4D7
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA78282B97
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA78282B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4QTTu5VsXQ0 for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:34:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDEA482CEC
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDEA482CEC
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D0CAA83D52; Tue, 19 Jul 2022 15:20:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 17:00:25 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6f4a110a741cba9a280c17a67edab4ad91ed5e1f
X-Git-Newrev: 0df3f22a047bb551ebae6077bf4d0692b02684be
X-Patchwork-Hint: ignore
Message-Id: <20220719152049.D0CAA83D52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tor: add -lz to
 fix static builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=0df3f22a047bb551ebae6077bf4d0692b02684be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

In order to remove a patch which needs frequent updates on major version
bumps and to get rid of autoreconf we just add -lz when creating a static
build. This make sure that static linking occurs in the right order.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b03e8e693a62256289adb8db715622c3447d34ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
