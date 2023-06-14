Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F20EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 14:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 056A9612CA;
	Wed, 14 Jun 2023 14:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 056A9612CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxml9Tszm7Nq; Wed, 14 Jun 2023 14:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF90561346;
	Wed, 14 Jun 2023 14:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF90561346
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB7771BF969
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B43C840221
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B43C840221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTrR9ea76ycv for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 14:54:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEC6740205
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 14:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEC6740205
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAB3683700; Wed, 14 Jun 2023 14:54:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 16:52:10 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 17289b98e1f72b3ed148f60472edbd8e0f63d4ec
X-Git-Newrev: 4fa90a2f6dd39ab18ff4da103fac44bb3ddec531
X-Patchwork-Hint: ignore
Message-Id: <20230614145426.AAB3683700@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/php: Fix GCC 12
 -Og
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fa90a2f6dd39ab18ff4da103fac44bb3ddec531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:
http://autobuild.buildroot.net/results/316451459139e250ba2d0c7b554606fd97eebd9a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 29e79c1f54407d0bb6cd9a3a27c65a4cbe3ccdcd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/0006-xxhash-h-Fix-GCC-12-Og.patch | 94 +++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch b/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch
new file mode 100644
index 0000000000..9b5b9966cd
--- /dev/null
+++ b/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch
@@ -0,0 +1,94 @@
+From adcb38b1ffa8e401293e5028ee5af586fd304e00 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 12 Apr 2023 13:33:07 +0800
+Subject: [PATCH] xxhash.h: Fix GCC 12 -Og
+
+Change whether to inline XXH3_hashLong_withSecret to a config option
+
+Ref: https://github.com/Cyan4973/xxHash/commit/ace22bddc7a366a5dd8a71e8b8247694530684ec
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+Closes GH-11062.
+
+Upstream: https://github.com/php/php-src/commit/adcb38b1ffa8e401293e5028ee5af586fd304e00
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ ext/hash/xxhash/xxhash.h | 35 +++++++++++++++++++++++++++++++++--
+ 1 file changed, 33 insertions(+), 2 deletions(-)
+
+diff --git a/ext/hash/xxhash/xxhash.h b/ext/hash/xxhash/xxhash.h
+index b5bd286496c7..8e816c0584eb 100644
+--- a/ext/hash/xxhash/xxhash.h
++++ b/ext/hash/xxhash/xxhash.h
+@@ -1375,6 +1375,23 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
+  */
+ #  define XXH_NO_INLINE_HINTS 0
+ 
++/*!
++ * @def XXH3_INLINE_SECRET
++ * @brief Determines whether to inline the XXH3 withSecret code.
++ *
++ * When the secret size is known, the compiler can improve the performance
++ * of XXH3_64bits_withSecret() and XXH3_128bits_withSecret().
++ *
++ * However, if the secret size is not known, it doesn't have any benefit. This
++ * happens when xxHash is compiled into a global symbol. Therefore, if
++ * @ref XXH_INLINE_ALL is *not* defined, this will be defined to 0.
++ *
++ * Additionally, this defaults to 0 on GCC 12+, which has an issue with function pointers
++ * that are *sometimes* force inline on -Og, and it is impossible to automatically
++ * detect this optimization level.
++ */
++#  define XXH3_INLINE_SECRET 0
++
+ /*!
+  * @def XXH32_ENDJMP
+  * @brief Whether to use a jump for `XXH32_finalize`.
+@@ -1439,6 +1456,15 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
+ #  endif
+ #endif
+ 
++#ifndef XXH3_INLINE_SECRET
++#  if (defined(__GNUC__) && !defined(__clang__) && __GNUC__ >= 12) \
++     || !defined(XXH_INLINE_ALL)
++#    define XXH3_INLINE_SECRET 0
++#  else
++#    define XXH3_INLINE_SECRET 1
++#  endif
++#endif
++
+ #ifndef XXH32_ENDJMP
+ /* generally preferable for performance */
+ #  define XXH32_ENDJMP 0
+@@ -1515,6 +1541,11 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
+ #  define XXH_NO_INLINE static
+ #endif
+ 
++#if XXH3_INLINE_SECRET
++#  define XXH3_WITH_SECRET_INLINE XXH_FORCE_INLINE
++#else
++#  define XXH3_WITH_SECRET_INLINE XXH_NO_INLINE
++#endif
+ 
+ 
+ /* *************************************
+@@ -4465,7 +4496,7 @@ XXH3_hashLong_64b_internal(const void* XXH_RESTRICT input, size_t len,
+  * so that the compiler can properly optimize the vectorized loop.
+  * This makes a big performance difference for "medium" keys (<1 KB) when using AVX instruction set.
+  */
+-XXH_FORCE_INLINE XXH64_hash_t
++XXH3_WITH_SECRET_INLINE XXH64_hash_t
+ XXH3_hashLong_64b_withSecret(const void* XXH_RESTRICT input, size_t len,
+                              XXH64_hash_t seed64, const xxh_u8* XXH_RESTRICT secret, size_t secretLen)
+ {
+@@ -5263,7 +5294,7 @@ XXH3_hashLong_128b_default(const void* XXH_RESTRICT input, size_t len,
+  * It's important for performance to pass @secretLen (when it's static)
+  * to the compiler, so that it can properly optimize the vectorized loop.
+  */
+-XXH_FORCE_INLINE XXH128_hash_t
++XXH3_WITH_SECRET_INLINE XXH128_hash_t
+ XXH3_hashLong_128b_withSecret(const void* XXH_RESTRICT input, size_t len,
+                               XXH64_hash_t seed64,
+                               const void* XXH_RESTRICT secret, size_t secretLen)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
