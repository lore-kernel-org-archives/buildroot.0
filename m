Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AC7C54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 20:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04DDC4049F;
	Sun, 10 Mar 2024 20:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zjytaiAfO0IO; Sun, 10 Mar 2024 20:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D99A40207
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D99A40207;
	Sun, 10 Mar 2024 20:21:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C30A01BF40B
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 20:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B00808174C
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 20:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yos-Tcmu0cn9 for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 20:21:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 298568174A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 298568174A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 298568174A
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 20:21:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b401.dip0.t-ipconnect.de [84.161.180.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 110FFA4C2ECD
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 21:21:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34566)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rjPfq-000000000y4-1mng
 for buildroot@buildroot.org; Sun, 10 Mar 2024 20:21:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 21:21:34 +0100
Message-Id: <20240310202134.724727-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710102095;
 bh=0IvIOfhMAXNRa2ZcTQ3pBWwzKZqMppb2tsImWA5qzeY=;
 h=From:To:Subject:Date:From;
 b=cD+hxWQnuWK+UIL4LDG6se+wcNn7KMxNKjMFTJ3wVXOSPe72MBt9Y0pFecR7DWxFO
 qcPaVxDJwc/igEZpbvL6/7DS6qVwXzKufek4UyA6d5Ry3YcEffs+xUa7GqLI0XbSN9
 hOj4T0duTgrbc1ubKjKLkGQMstJyQhR1NiyeUiY90wL6LEZRWZOV6MZiUqOk75aex+
 fW8N0SC2vcCct31fHgluiCfiEyowzpp6/Vgf8NkXJAgGy8Cgzp2cqoWlrD+VQDVMK9
 Y5082FA+u/CZ6hw4FKBun0spSsZbE1wvxLOJsxm4yXQxcDUcelLZ/z6bzBjkAWH0jj
 JixrOzTIoicWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=cD+hxWQn
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.3
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

Changelog: https://www.php.net/ChangeLog-8.php#8.3.3
Release notes: https://www.php.net/releases/8_3_3.php

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
index 4ce3616de3..451a8708c6 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  28cdc995b7d5421711c7044294885fcde4390c9f67504a994b4cf9bc1b5cc593  php-8.2.16.tar.xz
+sha256  b0a996276fe21fe9ca8f993314c8bc02750f464c7b0343f056fb0894a8dfa9d1  php-8.3.3.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 28893be4c6..ca90df5d76 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.16
+PHP_VERSION = 8.3.3
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
