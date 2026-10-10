Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFB0CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAEDE60A77;
	Sat, 10 Oct 2026 09:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QIPje2EAN-G; Sat, 10 Oct 2026 09:32:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA53160A79
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624761;
	b=oxhq3Bz3evArqknCHHT5BGYkgLv74yGu5JEaPknDnTd/E95iv9I4XIDhckOJoxSrKZV9
	 zaPc+A3cdLtKl3/OzVeiiJHcAdQw0iFSDnvJE1M9hy6G2RsbzYpmUuDHDfWvsfCK0+CBX
	 Zn1TID+szEfgOWG6A/KKov4JrnG5y3dl7gp/HkDgY6jreT0GkfQAdsQx4GucheS3lJmIO
	 JtyHHf0VAcbogfRpRIG83nrH3qn/lMO9VamjatauiAa20iuc2zS4unOm43nwkW+rb0fV5
	 xNesAsAAJAThM1JwQ9YamFI8U7FuXhnlCt5qZZC5qAtJBz2hZoar583NVQGSXLbD10g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624761;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rsXbLKrxPKS4uRpi6ohDeXVhjr0cra+zLovYfq9X08s=;
	b=DS8/X5ZM3qDG6lOXdZuiXcl934u0l3Ba2fQwppDBU+s0wKLzXojD3HEE1+VQupwEU3Mo
	 nUEVL7RKqJjjS6V0kJn3DgUoVzGD2ZLtuCSQQbjo9Gdjtzy6be5O9zQD1q/Mtq0BK/G64
	 6bE4q0brOr2p/oJZxil0tY7BPwPt9rLSUHcW0SP+/jjQTtYMRnUJ0mizYILEh0NOAJDwJ
	 HyfunJ8SM+wgW6keYP+uvyPPkZ6saSzxqPn6AyIIAiUbpGfx8W0KxLpxvSRLLL9KbV9o0
	 eji+A+Detq24Cx36bnqCr5KUw+THiOumKk7/YcfEElC3ZSUrZIwb4v6T1PfxC7nAjbA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624761;
	bh=rsXbLKrxPKS4uRpi6ohDeXVhjr0cra+zLovYfq9X08s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XWJyIWc9KMWJfT3Fh0XJNiQbxsMOHpciz2cloA5WoIcUiRw1+7xHLew2Ch1dBLxG4
	 d4ul81lHMlZedkQEXOgY8U2oyX4KNuz+EhB/OaOs/Mo6Ql0C1qHXKaN7kY8JQtMZ2J
	 UvPXhhWdvRS4W9JX8r8IV8Izyq6mzzCcuVuJQekqeSN5NEEzYMPFlMtFqLQA8fAqK9
	 5u3EYKHKfeOKfmyVpOS+kfLS7ITUqbzfPnbXKYsN5jzG0qU5EJo62qEcmjfp0vslUj
	 LL4S7bDnnlC3EnyLPfKe+pAk6Jz6uBOCr9+3Pjjuo6A5R1o/jUVrX7NuegK85FCkQo
	 w+zZnYjd9MrpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA53160A79;
	Sat, 10 Oct 2026 09:32:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BC549D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1159860A77
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJcDtGDzuORK for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:32:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 306E260A79
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624758;
 b=LXHAQQlkEEDmaDi7vIzl8+iAX9qDmZv9Y2/Stdj6/pANsBLo524+q9q9nc0zhGtmfI45
 Z5OEs/jPmJUFKjoNvmJIA0xCjyHggJgfIwW+7Ya9GMU6WLkWBHIWVnABbnwp2muqq/R1z
 +iLRdcUZOmVHWQMEYDHpReZ3uYjVmZNk36d0cJqdXVdQ24q9SpueB3wHeDuJdIf/JrxsQ
 cl2bMDTio3GMooCbLxtRnV02hFtryiRSv4RNg9tYE9k2L5TTP2L9+OjRPWQZU+3Hz7+zW
 O+7z3ojlHy32c1OkR+4ppAzFQovfUEWnnEyvU6pRQVxAH2XizbtNizOloH8qsc7Ej/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624758;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rELTY+2I/ftUzmPk38DA2aZT963+ikHs7+O0qrZaink=;
 b=KqXX4QAGhoeaPYJo288JJZ97luMu2fah7oPQvO++z0S6wladj/ZuwNmQHYBhm5CxQXGw
 VJsE3MmOhioq63QXdKwp3oJNRlfHeQHHm1L8pAaQ6otImoMnr9dXLXR73bI2BX5j73yij
 vJJngN8d50rapbA+TgpbOyiLJ34Ut8trmr8iIocSl2BdB6qt4VEqOHE/yNNeOlFERyTwA
 f52whw80arVwPkhnPN6NUunjXSboeRPvcn2pBsbvWb2eU3XTopMHCWZEGYQwjBOmlMRPP
 r04BMdf2Bjp5f2rmIymSGrOmSSr5IZxI450Dn7GT9DWOcRrJjevXhL6/wlncofqakDg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 306E260A79
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:32:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B0168EF4D; Sat, 10 Oct 2026 09:31:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d267b59fa9219f3a6127dd687cf68a0c51e189ac
X-Git-Newrev: cb7df79cc1e5d9afa6e5a4c61930630f5e07f631
X-Patchwork-Hint: ignore
Message-Id: <20261010093120.0B0168EF4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luvi: bump version to
 102-g9fa6c141a
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0284455598446735830=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0284455598446735830==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb7df79cc1e5d9afa6e5a4c61930630f5e07f631
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This bump includes a bump of the lua-openssl submodule
https://github.com/luvit/luvi/commit/98fa10f2823d4a9bb93306bf445d596aa8c4a75f
which is a prerequisite for the upcoming bump of OpenSSL to 4.0.2.

Removed patches 0001 & 0002 which are included in this bump.

Renumbered and rebased remaining patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...CMakeLists.txt-only-require-a-C-compiler.patch} |  0
 ...ctively-disable-GCC-diagnostics-in-ocsp.c.patch | 80 ----------------------
 ...txt-disable-Wincompatible-pointer-types-f.patch | 54 ---------------
 package/luvi/luvi.hash                             |  2 +-
 package/luvi/luvi.mk                               |  2 +-
 5 files changed, 2 insertions(+), 136 deletions(-)

diff --git a/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch b/package/luvi/0001-CMakeLists.txt-only-require-a-C-compiler.patch
similarity index 100%
rename from package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
rename to package/luvi/0001-CMakeLists.txt-only-require-a-C-compiler.patch
diff --git a/package/luvi/0001-Selectively-disable-GCC-diagnostics-in-ocsp.c.patch b/package/luvi/0001-Selectively-disable-GCC-diagnostics-in-ocsp.c.patch
deleted file mode 100644
index d29ba37bcf..0000000000
--- a/package/luvi/0001-Selectively-disable-GCC-diagnostics-in-ocsp.c.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 52bc36f5a548543835c24b87e7b7b72a327b1df7 Mon Sep 17 00:00:00 2001
-From: RDW <duckwhale@mail.ru>
-Date: Sun, 14 Sep 2025 00:33:10 +0200
-Subject: [PATCH] Selectively disable GCC diagnostics in ocsp.c
-
-GCC 14 fails to compile the library because -Wincompatible-pointer-types is now fatal.
-Since the warning is already disabled for clang here, might as well include GCC also.
-Needless to say, this is a workaround and a proper fix would require upstream changes.
-
-Upstream: https://github.com/zhaozg/lua-openssl/commit/bfeedbe8c06d8b4400fa670edecd452a433ddac4
-[Romain:
-  - rebase on lua-openssl 0.9.0-0
-  - format the patch as luvi patch (patching lua-openssl submodule)
-]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- deps/lua-openssl/src/ocsp.c | 22 ++++++++++++++++++++++
- 1 file changed, 22 insertions(+)
-
-diff --git a/deps/lua-openssl/src/ocsp.c b/deps/lua-openssl/src/ocsp.c
-index ac67a53..00e3b61 100644
---- a/deps/lua-openssl/src/ocsp.c
-+++ b/deps/lua-openssl/src/ocsp.c
-@@ -183,15 +183,26 @@ static int openssl_ocsp_request_read(lua_State *L)
-   BIO *bio = load_bio_object(L, 1);
-   int pem = lua_gettop(L) > 1 ? auxiliar_checkboolean(L, 2) : 0;
- 
-+#if defined(__GNUC__)
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
-+#endif
-+
- #if defined(__clang__)
- #pragma clang diagnostic push
- #pragma clang diagnostic ignored "-Wincompatible-pointer-types"
- #endif
-   OCSP_REQUEST *req = pem ? PEM_read_bio_OCSP_REQUEST(bio, NULL, NULL)
-                           : d2i_OCSP_REQUEST_bio(bio, NULL);
-+
-+#if defined(__GNUC__)
-+#pragma GCC diagnostic pop
-+#endif
-+
- #if defined(__clang__)
- #pragma clang diagnostic pop
- #endif
-+
-   BIO_free(bio);
- 
-   if (req)
-@@ -359,15 +370,26 @@ static int openssl_ocsp_response_read(lua_State *L)
-   int pem = lua_gettop(L) > 1 ? auxiliar_checkboolean(L, 2) : 0;
-   int ret = 0;
- 
-+#if defined(__GNUC__)
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
-+#endif
-+
- #if defined(__clang__)
- #pragma clang diagnostic push
- #pragma clang diagnostic ignored "-Wincompatible-pointer-types"
- #endif
-   OCSP_RESPONSE *res = pem ? PEM_read_bio_OCSP_RESPONSE(bio, NULL, NULL)
-                            : d2i_OCSP_RESPONSE_bio(bio, NULL);
-+
-+#if defined(__GNUC__)
-+#pragma GCC diagnostic pop
-+#endif
-+
- #if defined(__clang__)
- #pragma clang diagnostic pop
- #endif
-+
-   if (res)
-   {
-     PUSH_OBJECT(res, "openssl.ocsp_response");
--- 
-2.51.0
-
diff --git a/package/luvi/0002-CMakeLists.txt-disable-Wincompatible-pointer-types-f.patch b/package/luvi/0002-CMakeLists.txt-disable-Wincompatible-pointer-types-f.patch
deleted file mode 100644
index b658fed202..0000000000
--- a/package/luvi/0002-CMakeLists.txt-disable-Wincompatible-pointer-types-f.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From c82c147e83d6a21f572353bf6e95dcf3a736490c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sat, 13 Sep 2025 23:21:04 +0200
-Subject: [PATCH] CMakeLists.txt: disable Wincompatible-pointer-types for gcc
- >= 14
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Backport partially a patch [1] disabling GCC 14 warning
-Wincompatible-pointer-types.
-
-From [1]:
-"lua-openssl triggering the incompatible pointer types error by
-silencing the warning, which lua-openssl does internally but only for
-clang."
-
-Latest lua-openssl version (0.9.1-0) also disable this warning [2].
-
-Fixes:
-https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124430 (TestLuvi)
-
-[1] https://github.com/luvit/luvi/commit/85d7d7bf51bc523159ad579d846cbefbbff38fdb
-[2] https://github.com/zhaozg/lua-openssl/commit/bfeedbe8c06d8b4400fa670edecd452a433ddac4
-
-Upstream: https://github.com/luvit/luvi/commit/85d7d7bf51bc523159ad579d846cbefbbff38fdb
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- CMakeLists.txt | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0b0007d..bf10de5 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -141,6 +141,14 @@ if (WIN32)
-   add_library (luvi_renamed src/luvi_renamed.c)
- endif ()
- 
-+if (CMAKE_C_COMPILER_ID MATCHES "Clang|GNU")
-+  add_compile_options(-Wno-incompatible-pointer-types)
-+endif()
-+
-+if(UNIX)
-+  add_definitions(-Wall)
-+endif()
-+
- if (WITH_LUA_ENGINE STREQUAL Lua)
-   add_definitions(-DWITH_PLAIN_LUA)
- endif ()
--- 
-2.51.0
-
diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index d8825487db..4b322c119e 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f933bf1899a5419b26d46d7f111aaa50101831922716ffaed62e355b1bc9de1d  luvi-v2.15.0-git4.tar.gz
+sha256  8dee14773ffa59e3015c2f3923d4fb62f0021961aa5669373f6bcf553847c73b  luvi-102-g9fa6c141abf24a5a7fe49ca39335210fa1be3ab4-git4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 78de76aa45..157d9a1401 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.15.0
+LUVI_VERSION = 102-g9fa6c141abf24a5a7fe49ca39335210fa1be3ab4
 LUVI_SITE = https://github.com/luvit/luvi.git
 LUVI_SITE_METHOD = git
 LUVI_GIT_SUBMODULES = YES

--===============0284455598446735830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0284455598446735830==--
