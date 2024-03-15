Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1A5C54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 21:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0BA341781;
	Fri, 15 Mar 2024 21:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ujsg7fDQgJVV; Fri, 15 Mar 2024 21:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F88417E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2F88417E0;
	Fri, 15 Mar 2024 21:13:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B70271BF389
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 21:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A35AE40487
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 21:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lfXe4po84Xuf for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 21:13:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 856AF40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 856AF40025
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 856AF40025
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 21:13:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb75.dip0.t-ipconnect.de [84.161.187.117])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7F749A4C20A9
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 22:13:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55846)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rlErn-000000006JJ-1cmL
 for buildroot@buildroot.org; Fri, 15 Mar 2024 21:13:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 22:13:27 +0100
Message-Id: <20240315211327.635139-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710537208;
 bh=H5rJj+HzvApacAA4d3UUWAe2XyJaUzZ2RBrHM+HaxO4=;
 h=From:To:Subject:Date:From;
 b=ZfE0+mAIBar9AyIM0OULBI3wF/q3Ut8ea8GRyVoK5xXiyp/pvbKdkcO1qyRm+x7np
 QgDKLIFK2EaF/LftBboB71LMIQ2UDL/fRtPRFFMTnVp2JeZJSw7p0IZu5DUQCwB6Vq
 6J7ZG5th7KTBc2iw8Q2RYK1WoGBuxThakM0kXZdze+6EbC93YH85xlqnHxqzvdTWn9
 eWJnpOfBxk+AyeYX3qt4kNY6wGqhNQjr8FiYSgKkXw9GmBnn1UqiqxO8J1ubibC7BZ
 cMxNLyOx3/wcpdegARRbcEma0KL260eAp3uUVXQ/l9iDdd+pBU9h1gO7i/dY/RLtbz
 0ebtWCcUn6iww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=ZfE0+mAI
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.4
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

Removed patch 0006 which is included in this release.
Rebased patch 0005.

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
Release notes: https://www.php.net/releases/8_3_4.php
Release notes: https://www.php.net/releases/8_3_3.php
Release notes: https://www.php.net/releases/8_3_2.php
Release notes: https://www.php.net/releases/8_3_1.php
Release notes: https://www.php.net/releases/8_3_0.php

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0005-allow-opcache-cross-compiling.patch  |  4 +-
 package/php/0006-xxhash-h-Fix-GCC-12-Og.patch | 94 -------------------
 package/php/php.hash                          |  2 +-
 package/php/php.mk                            |  2 +-
 4 files changed, 4 insertions(+), 98 deletions(-)
 delete mode 100644 package/php/0006-xxhash-h-Fix-GCC-12-Og.patch

diff --git a/package/php/0005-allow-opcache-cross-compiling.patch b/package/php/0005-allow-opcache-cross-compiling.patch
index f9bc8b3ef5..468864b0a4 100644
--- a/package/php/0005-allow-opcache-cross-compiling.patch
+++ b/package/php/0005-allow-opcache-cross-compiling.patch
@@ -14,7 +14,7 @@ CFLAGS when opcache is enabled:
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for 8.1.7]
+[Bernd: rebased for 8.1.7 & 8.3.3]
 ---
  ext/opcache/config.m4 | 4 ----
  1 file changed, 4 deletions(-)
@@ -23,7 +23,7 @@ diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
 index 5492fd92..10c150ff 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -331,10 +331,6 @@ int main() {
+@@ -315,10 +315,6 @@ int main() {
  
    PHP_ADD_EXTENSION_DEP(opcache, pcre)
  
diff --git a/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch b/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch
deleted file mode 100644
index 9b5b9966cd..0000000000
--- a/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From adcb38b1ffa8e401293e5028ee5af586fd304e00 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 12 Apr 2023 13:33:07 +0800
-Subject: [PATCH] xxhash.h: Fix GCC 12 -Og
-
-Change whether to inline XXH3_hashLong_withSecret to a config option
-
-Ref: https://github.com/Cyan4973/xxHash/commit/ace22bddc7a366a5dd8a71e8b8247694530684ec
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
-Closes GH-11062.
-
-Upstream: https://github.com/php/php-src/commit/adcb38b1ffa8e401293e5028ee5af586fd304e00
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- ext/hash/xxhash/xxhash.h | 35 +++++++++++++++++++++++++++++++++--
- 1 file changed, 33 insertions(+), 2 deletions(-)
-
-diff --git a/ext/hash/xxhash/xxhash.h b/ext/hash/xxhash/xxhash.h
-index b5bd286496c7..8e816c0584eb 100644
---- a/ext/hash/xxhash/xxhash.h
-+++ b/ext/hash/xxhash/xxhash.h
-@@ -1375,6 +1375,23 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
-  */
- #  define XXH_NO_INLINE_HINTS 0
- 
-+/*!
-+ * @def XXH3_INLINE_SECRET
-+ * @brief Determines whether to inline the XXH3 withSecret code.
-+ *
-+ * When the secret size is known, the compiler can improve the performance
-+ * of XXH3_64bits_withSecret() and XXH3_128bits_withSecret().
-+ *
-+ * However, if the secret size is not known, it doesn't have any benefit. This
-+ * happens when xxHash is compiled into a global symbol. Therefore, if
-+ * @ref XXH_INLINE_ALL is *not* defined, this will be defined to 0.
-+ *
-+ * Additionally, this defaults to 0 on GCC 12+, which has an issue with function pointers
-+ * that are *sometimes* force inline on -Og, and it is impossible to automatically
-+ * detect this optimization level.
-+ */
-+#  define XXH3_INLINE_SECRET 0
-+
- /*!
-  * @def XXH32_ENDJMP
-  * @brief Whether to use a jump for `XXH32_finalize`.
-@@ -1439,6 +1456,15 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
- #  endif
- #endif
- 
-+#ifndef XXH3_INLINE_SECRET
-+#  if (defined(__GNUC__) && !defined(__clang__) && __GNUC__ >= 12) \
-+     || !defined(XXH_INLINE_ALL)
-+#    define XXH3_INLINE_SECRET 0
-+#  else
-+#    define XXH3_INLINE_SECRET 1
-+#  endif
-+#endif
-+
- #ifndef XXH32_ENDJMP
- /* generally preferable for performance */
- #  define XXH32_ENDJMP 0
-@@ -1515,6 +1541,11 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
- #  define XXH_NO_INLINE static
- #endif
- 
-+#if XXH3_INLINE_SECRET
-+#  define XXH3_WITH_SECRET_INLINE XXH_FORCE_INLINE
-+#else
-+#  define XXH3_WITH_SECRET_INLINE XXH_NO_INLINE
-+#endif
- 
- 
- /* *************************************
-@@ -4465,7 +4496,7 @@ XXH3_hashLong_64b_internal(const void* XXH_RESTRICT input, size_t len,
-  * so that the compiler can properly optimize the vectorized loop.
-  * This makes a big performance difference for "medium" keys (<1 KB) when using AVX instruction set.
-  */
--XXH_FORCE_INLINE XXH64_hash_t
-+XXH3_WITH_SECRET_INLINE XXH64_hash_t
- XXH3_hashLong_64b_withSecret(const void* XXH_RESTRICT input, size_t len,
-                              XXH64_hash_t seed64, const xxh_u8* XXH_RESTRICT secret, size_t secretLen)
- {
-@@ -5263,7 +5294,7 @@ XXH3_hashLong_128b_default(const void* XXH_RESTRICT input, size_t len,
-  * It's important for performance to pass @secretLen (when it's static)
-  * to the compiler, so that it can properly optimize the vectorized loop.
-  */
--XXH_FORCE_INLINE XXH128_hash_t
-+XXH3_WITH_SECRET_INLINE XXH128_hash_t
- XXH3_hashLong_128b_withSecret(const void* XXH_RESTRICT input, size_t len,
-                               XXH64_hash_t seed64,
-                               const void* XXH_RESTRICT secret, size_t secretLen)
diff --git a/package/php/php.hash b/package/php/php.hash
index 4ce3616de3..96f16ff2a7 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  28cdc995b7d5421711c7044294885fcde4390c9f67504a994b4cf9bc1b5cc593  php-8.2.16.tar.xz
+sha256  39a337036a546e5c28aea76cf424ac172db5156bd8a8fd85252e389409a5ba63  php-8.3.4.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 28893be4c6..99dbec9de7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.16
+PHP_VERSION = 8.3.4
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
