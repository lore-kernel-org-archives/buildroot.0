Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D328FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 18:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 748B360AF6;
	Fri, 29 Apr 2022 18:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1h9LuGf_bw8z; Fri, 29 Apr 2022 18:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E2E260A98;
	Fri, 29 Apr 2022 18:37:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD1B1BF855
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 18:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F16883EBF
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 18:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WFVwVUqpSNj for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 18:37:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C826183EBD
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 18:37:13 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout05.t-online.de (Postfix) with SMTP id 11A8C12D0F
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 20:37:11 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.204.173]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nkVUL-1c5Fdx0; Fri, 29 Apr 2022 20:37:09 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:38672)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nkVUK-0006Xb-RV
 for buildroot@buildroot.org; Fri, 29 Apr 2022 20:37:08 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 29 Apr 2022 20:37:07 +0200
Message-Id: <20220429183708.3819668-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1651257429-0001606D-1ACC8ACB/0/0 CLEAN NORMAL
X-TOI-MSGID: e07162ef-5e10-4c24-b98b-0be30e93bce8
Subject: [Buildroot] [PATCH 1/2] package/tor: add -lz to fix static builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to remove a patch which needs frequent updates on major version
bumps and to get rid of autoreconf we just add -lz when creating a static
build. This make sure that static linking occurs in the right order.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Tested using this defconfig

BR2_PACKAGE_XZ=y
BR2_PACKAGE_ZSTD=y
BR2_PACKAGE_TOR=y

                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
                bootlin-m68k-5208-uclibc [ 9/45]: SKIPPED
               bootlin-m68k-68040-uclibc [10/45]: OK
             bootlin-microblazeel-uclibc [11/45]: OK
                bootlin-mipsel32r6-glibc [12/45]: OK
                   bootlin-mipsel-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
        bootlin-powerpc64le-power8-glibc [16/45]: OK
           bootlin-powerpc-e500mc-uclibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: OK
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: OK
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 ...0001-Fix-static-linking-with-OpenSSL.patch | 94 -------------------
 package/tor/tor.mk                            |  7 +-
 2 files changed, 5 insertions(+), 96 deletions(-)
 delete mode 100644 package/tor/0001-Fix-static-linking-with-OpenSSL.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
