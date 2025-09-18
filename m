Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48730CAC5AC
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DDE08228F;
	Fri, 19 Sep 2025 12:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joXfGq3jqNzN; Fri, 19 Sep 2025 12:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 513378230B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 513378230B;
	Fri, 19 Sep 2025 12:42:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D08E273
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBAC66103B
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DLuBBbElHCw for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB8EA61039
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB8EA61039
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9FED85E81; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 16:44:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b17c2eecb9f5061d91a0596dfe30a177ae5421ca
X-Git-Newrev: 8549ce667e60883cdf86136e22cd73f8dff362c2
X-Patchwork-Hint: ignore
Message-Id: <20250919124235.D9FED85E81@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/luvi: bump to
 version 2.15.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3614404770456713787=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3614404770456713787==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8549ce667e60883cdf86136e22cd73f8dff362c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Luvi 2.14.0 fails to build with GCC 14.x for several reasons due to
too old lua-openssl 0.8.2-0 submodule:

TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/ocsp.c: In function 'openssl_ocsp_request_read':
TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/ocsp.c:124:29: error: passing argument 1 of 'PEM_ASN1_read_bio' from incompatible pointer type [-Wincompatible-pointer-types]
  124 |   OCSP_REQUEST *req = pem ? PEM_read_bio_OCSP_REQUEST(bio, NULL, NULL)
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
      |                             |
      |                             char * (*)()

Fixed in lua-openssl by [1].

TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/x509.c: In function 'openssl_push_general_name':
TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/x509.c:377:45: error: passing argument 2 of 'openssl_push_asn1type' from incompatible pointer type [-Wincompatible-pointer-types]
  377 |     openssl_push_asn1type(L, general_name->d.x400Address);
      |                              ~~~~~~~~~~~~~~~^~~~~~~~~~~~
      |                                             |
      |                                             ASN1_STRING * {aka struct asn1_string_st *}

Fixed in lua-openssl by [2].

TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/openssl.c: In function 'luaclose_openssl':
TestLuvi/build/luvi-2.14.0/deps/lua-openssl/src/stdatomic.h:387:9: error: implicit declaration of function '__c11_atomic_fetch_sub'; did you mean '__atomic_fetch_sub'? [-Wimplicit-function-declaration]
  387 |         __c11_atomic_fetch_sub(object, operand, order)

Fixed in lua-openssl by [3].

Instead of fixing one by one each issues, update to the latest release
that include lua-openssl 0.9.0-0. Luvi v2.15.0 still have some GCC 14.x
issues, backport two additional patches.

Download luvi sources using git method since the release archive
no longer include the release version in its name [4].

Luvi switched to PCRE2 [5], update the optional dependency.

Update TestLuvi to select PCR2 package.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124430 (TestLuvi)

[1] https://github.com/zhaozg/lua-openssl/commit/bfeedbe8c06d8b4400fa670edecd452a433ddac4
[2] https://github.com/zhaozg/lua-openssl/commit/e5b5420cc506c7507d1d0e7302ea3f1979a6b2ed
[3] https://github.com/zhaozg/lua-openssl/commit/cfcaa16d1acaab17f4f0178e61ea77ebc2c8f24c
[4] https://github.com/luvit/luvi/releases/download/v2.15.0/luvi-source.tar.gz
[5] https://github.com/luvit/luvi/releases/tag/v2.15.0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 00317f0aff243986983650671fd220ab040af50f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ctively-disable-GCC-diagnostics-in-ocsp.c.patch | 80 ++++++++++++++++++++++
 ...txt-disable-Wincompatible-pointer-types-f.patch | 54 +++++++++++++++
 package/luvi/luvi.hash                             |  2 +-
 package/luvi/luvi.mk                               | 17 ++---
 support/testing/tests/package/test_luvi.py         |  2 +-
 5 files changed, 145 insertions(+), 10 deletions(-)

diff --git a/package/luvi/0001-Selectively-disable-GCC-diagnostics-in-ocsp.c.patch b/package/luvi/0001-Selectively-disable-GCC-diagnostics-in-ocsp.c.patch
new file mode 100644
index 0000000000..d29ba37bcf
--- /dev/null
+++ b/package/luvi/0001-Selectively-disable-GCC-diagnostics-in-ocsp.c.patch
@@ -0,0 +1,80 @@
+From 52bc36f5a548543835c24b87e7b7b72a327b1df7 Mon Sep 17 00:00:00 2001
+From: RDW <duckwhale@mail.ru>
+Date: Sun, 14 Sep 2025 00:33:10 +0200
+Subject: [PATCH] Selectively disable GCC diagnostics in ocsp.c
+
+GCC 14 fails to compile the library because -Wincompatible-pointer-types is now fatal.
+Since the warning is already disabled for clang here, might as well include GCC also.
+Needless to say, this is a workaround and a proper fix would require upstream changes.
+
+Upstream: https://github.com/zhaozg/lua-openssl/commit/bfeedbe8c06d8b4400fa670edecd452a433ddac4
+[Romain:
+  - rebase on lua-openssl 0.9.0-0
+  - format the patch as luvi patch (patching lua-openssl submodule)
+]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ deps/lua-openssl/src/ocsp.c | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/deps/lua-openssl/src/ocsp.c b/deps/lua-openssl/src/ocsp.c
+index ac67a53..00e3b61 100644
+--- a/deps/lua-openssl/src/ocsp.c
++++ b/deps/lua-openssl/src/ocsp.c
+@@ -183,15 +183,26 @@ static int openssl_ocsp_request_read(lua_State *L)
+   BIO *bio = load_bio_object(L, 1);
+   int pem = lua_gettop(L) > 1 ? auxiliar_checkboolean(L, 2) : 0;
+ 
++#if defined(__GNUC__)
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
++#endif
++
+ #if defined(__clang__)
+ #pragma clang diagnostic push
+ #pragma clang diagnostic ignored "-Wincompatible-pointer-types"
+ #endif
+   OCSP_REQUEST *req = pem ? PEM_read_bio_OCSP_REQUEST(bio, NULL, NULL)
+                           : d2i_OCSP_REQUEST_bio(bio, NULL);
++
++#if defined(__GNUC__)
++#pragma GCC diagnostic pop
++#endif
++
+ #if defined(__clang__)
+ #pragma clang diagnostic pop
+ #endif
++
+   BIO_free(bio);
+ 
+   if (req)
+@@ -359,15 +370,26 @@ static int openssl_ocsp_response_read(lua_State *L)
+   int pem = lua_gettop(L) > 1 ? auxiliar_checkboolean(L, 2) : 0;
+   int ret = 0;
+ 
++#if defined(__GNUC__)
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
++#endif
++
+ #if defined(__clang__)
+ #pragma clang diagnostic push
+ #pragma clang diagnostic ignored "-Wincompatible-pointer-types"
+ #endif
+   OCSP_RESPONSE *res = pem ? PEM_read_bio_OCSP_RESPONSE(bio, NULL, NULL)
+                            : d2i_OCSP_RESPONSE_bio(bio, NULL);
++
++#if defined(__GNUC__)
++#pragma GCC diagnostic pop
++#endif
++
+ #if defined(__clang__)
+ #pragma clang diagnostic pop
+ #endif
++
+   if (res)
+   {
+     PUSH_OBJECT(res, "openssl.ocsp_response");
+-- 
+2.51.0
+
diff --git a/package/luvi/0002-CMakeLists.txt-disable-Wincompatible-pointer-types-f.patch b/package/luvi/0002-CMakeLists.txt-disable-Wincompatible-pointer-types-f.patch
new file mode 100644
index 0000000000..b658fed202
--- /dev/null
+++ b/package/luvi/0002-CMakeLists.txt-disable-Wincompatible-pointer-types-f.patch
@@ -0,0 +1,54 @@
+From c82c147e83d6a21f572353bf6e95dcf3a736490c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sat, 13 Sep 2025 23:21:04 +0200
+Subject: [PATCH] CMakeLists.txt: disable Wincompatible-pointer-types for gcc
+ >= 14
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport partially a patch [1] disabling GCC 14 warning
+Wincompatible-pointer-types.
+
+From [1]:
+"lua-openssl triggering the incompatible pointer types error by
+silencing the warning, which lua-openssl does internally but only for
+clang."
+
+Latest lua-openssl version (0.9.1-0) also disable this warning [2].
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124430 (TestLuvi)
+
+[1] https://github.com/luvit/luvi/commit/85d7d7bf51bc523159ad579d846cbefbbff38fdb
+[2] https://github.com/zhaozg/lua-openssl/commit/bfeedbe8c06d8b4400fa670edecd452a433ddac4
+
+Upstream: https://github.com/luvit/luvi/commit/85d7d7bf51bc523159ad579d846cbefbbff38fdb
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ CMakeLists.txt | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0b0007d..bf10de5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -141,6 +141,14 @@ if (WIN32)
+   add_library (luvi_renamed src/luvi_renamed.c)
+ endif ()
+ 
++if (CMAKE_C_COMPILER_ID MATCHES "Clang|GNU")
++  add_compile_options(-Wno-incompatible-pointer-types)
++endif()
++
++if(UNIX)
++  add_definitions(-Wall)
++endif()
++
+ if (WITH_LUA_ENGINE STREQUAL Lua)
+   add_definitions(-DWITH_PLAIN_LUA)
+ endif ()
+-- 
+2.51.0
+
diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 3518a2dc85..d8825487db 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4be4468d01657100967a9c696f503aa3c30de6f23af39050c1aae909fbf0aaf2  luvi-src-v2.14.0.tar.gz
+sha256  f933bf1899a5419b26d46d7f111aaa50101831922716ffaed62e355b1bc9de1d  luvi-v2.15.0-git4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index ebd1066c5c..78de76aa45 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LUVI_VERSION = 2.14.0
-LUVI_SOURCE = luvi-src-v$(LUVI_VERSION).tar.gz
-LUVI_SITE = https://github.com/luvit/luvi/releases/download/v$(LUVI_VERSION)
+LUVI_VERSION = v2.15.0
+LUVI_SITE = https://github.com/luvit/luvi.git
+LUVI_SITE_METHOD = git
+LUVI_GIT_SUBMODULES = YES
 LUVI_LICENSE = Apache-2.0
 LUVI_LICENSE_FILES = LICENSE.txt
 LUVI_DEPENDENCIES = libuv luajit luv host-luajit host-pkgconf
@@ -44,12 +45,12 @@ LUVI_CONF_OPTS = \
 	-DTARGET_ARCH=$(LUVI_TARGET_ARCH) \
 	-DLUA_PATH=$(HOST_DIR)/share/luajit-$(LUVI_LUAJIT_MAJVER).$(LUVI_LUAJIT_MINVER)/?.lua
 
-# Add "rex" module (PCRE via bundled lrexlib)
-ifeq ($(BR2_PACKAGE_PCRE),y)
-LUVI_DEPENDENCIES += pcre
-LUVI_CONF_OPTS += -DWithPCRE=ON -DWithSharedPCRE=ON
+# Add "rex" module (PCRE2 via bundled lrexlib)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+LUVI_DEPENDENCIES += pcre2
+LUVI_CONF_OPTS += -DWithPCRE2=ON -DWithSharedPCRE2=ON
 else
-LUVI_CONF_OPTS += -DWithPCRE=OFF -DWithSharedPCRE=OFF
+LUVI_CONF_OPTS += -DWithPCRE2=OFF -DWithSharedPCRE2=OFF
 endif
 
 # Add "ssl" module (via bundled lua-openssl)
diff --git a/support/testing/tests/package/test_luvi.py b/support/testing/tests/package/test_luvi.py
index 4b55091762..b9d43fe266 100644
--- a/support/testing/tests/package/test_luvi.py
+++ b/support/testing/tests/package/test_luvi.py
@@ -11,7 +11,7 @@ class TestLuvi(infra.basetest.BRTest):
         BR2_PACKAGE_LUAJIT=y
         BR2_PACKAGE_LUVI=y
         BR2_PACKAGE_OPENSSL=y
-        BR2_PACKAGE_PCRE=y
+        BR2_PACKAGE_PCRE2=y
         BR2_PACKAGE_ZLIB=y
         """
 

--===============3614404770456713787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3614404770456713787==--
