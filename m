Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC3FC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A26A40572;
	Sun, 24 Mar 2024 15:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-I5s1HUv50i; Sun, 24 Mar 2024 15:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B20C4034A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B20C4034A;
	Sun, 24 Mar 2024 15:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBDF31BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8CF181B71
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvKTc0fGQh59 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54C2881B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54C2881B26
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54C2881B26
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:45:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4148863c863so2080105e9.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711295153; x=1711899953;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=usPHnsHdY1hZJ8f3x2IFKEor0DzN/FIxQ1hMsfE5+0I=;
 b=WfRa/DhkjZBx7Qffb0wNcZ1VcNno1mDFjem7V4a0JVrYIOJWB9jwutTu+bnt4D8z6o
 z1ouB4MAoHau6jFSL4YVuvpX5j1bJaiFk2FWZeuBAN/6XilFvEDebmEs9D3J/O48fo5d
 SyDPQXSUiiIWb1m3WH2Ma50w0nOnxMOF/00XyMdj1UggpuhXFBZjfoygl4Vv55d/X/gC
 Wgi8+5mOkd1BNont9PdSnSTgvS4i1if5a72DnGBqD9qwp+MdilYQ7+Ba50Wwb6kEuhGc
 I7H/P9DuunVBDCOUQpvGix/0MgfQ3ncZwUcPIU0mCBMkIAHdaz649L3pE2Yypewy9C8K
 j9iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrTpmHpwgTgXppHhJVcrbX4VlQKg8KM9Mpw3aFzP3d837e796n+bvZqjTL+f93/3nlj4C4WSInwzqFZ8hxleCrmZMl0nngqw==
X-Gm-Message-State: AOJu0YxI71kpGdWqWn/klXu7ev1KxiMf9OlgVIy7inHV9uFCynlhKeZA
 LPqo8b1mPkTX84LBCRH1/3KTwvdBl6NuurbrSLKnuQMcd5QeCTxClUfl0FYyWxg=
X-Google-Smtp-Source: AGHT+IEzpJeazo1WnNozkJKJU+xOl/qDlHTg/UBZG1Ur+ZZ2bdqAg1WhGWdfj5o+YNvMEebrYuF5Pg==
X-Received: by 2002:a05:600c:3b07:b0:414:f50:3588 with SMTP id
 m7-20020a05600c3b0700b004140f503588mr3744696wms.27.1711295152993; 
 Sun, 24 Mar 2024 08:45:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fl15-20020a05600c0b8f00b00414881b2ecbsm1926026wmb.3.2024.03.24.08.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:45:52 -0700 (PDT)
Message-ID: <e00c95be-f593-4458-a9a1-13854e305488@mind.be>
Date: Sun, 24 Mar 2024 16:45:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240315211327.635139-1-bernd@kuhls.net>
In-Reply-To: <20240315211327.635139-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711295153; x=1711899953; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=usPHnsHdY1hZJ8f3x2IFKEor0DzN/FIxQ1hMsfE5+0I=;
 b=DEHMgHceYcsdUdeTVLHyzk2VVeI+AhlK76YvetgGLvotnAdO1ITcG1nlBE1MVWjoce
 K/unKfb5FPoBDV/q68lM4PUvioPUfKP3pDDJQKuEaz6rqbFbnleRM6N9Y064u1QLL1Af
 BoFW+Va77wWSmdoxnC0oc4phxJakNWcA+8UwgHYq6/2CxvVehXcO6NgTIndRFMcO8cJQ
 bU85xqjNrGwqsVPAbx93GfoMQbfceyf2Q8W4hntX+PmZ4V3OGWb+dDbW2zOkSFPV9TR0
 +nZ5NZ3/HoJkA8qoc343kUy2eZ3g2RMejdSuNbe2LDpRafVwKNZPjYx27cbOaXWfqTxT
 bCjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DEHMgHce
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2024 22:13, Bernd Kuhls wrote:
> Removed patch 0006 which is included in this release.

  It would be nice to get the first 5 upstream as well...

> Rebased patch 0005.
> 
> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
> Release notes: https://www.php.net/releases/8_3_4.php
> Release notes: https://www.php.net/releases/8_3_3.php
> Release notes: https://www.php.net/releases/8_3_2.php
> Release notes: https://www.php.net/releases/8_3_1.php
> Release notes: https://www.php.net/releases/8_3_0.php
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0005-allow-opcache-cross-compiling.patch  |  4 +-
>   package/php/0006-xxhash-h-Fix-GCC-12-Og.patch | 94 -------------------
>   package/php/php.hash                          |  2 +-
>   package/php/php.mk                            |  2 +-
>   4 files changed, 4 insertions(+), 98 deletions(-)
>   delete mode 100644 package/php/0006-xxhash-h-Fix-GCC-12-Og.patch
> 
> diff --git a/package/php/0005-allow-opcache-cross-compiling.patch b/package/php/0005-allow-opcache-cross-compiling.patch
> index f9bc8b3ef5..468864b0a4 100644
> --- a/package/php/0005-allow-opcache-cross-compiling.patch
> +++ b/package/php/0005-allow-opcache-cross-compiling.patch
> @@ -14,7 +14,7 @@ CFLAGS when opcache is enabled:
>   
>   Signed-off-by: Adam Duskett <aduskett@gmail.com>
>   Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -[Bernd: rebased for 8.1.7]
> +[Bernd: rebased for 8.1.7 & 8.3.3]
>   ---
>    ext/opcache/config.m4 | 4 ----
>    1 file changed, 4 deletions(-)
> @@ -23,7 +23,7 @@ diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
>   index 5492fd92..10c150ff 100644
>   --- a/ext/opcache/config.m4
>   +++ b/ext/opcache/config.m4
> -@@ -331,10 +331,6 @@ int main() {
> +@@ -315,10 +315,6 @@ int main() {
>    
>      PHP_ADD_EXTENSION_DEP(opcache, pcre)
>    
> diff --git a/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch b/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch
> deleted file mode 100644
> index 9b5b9966cd..0000000000
> --- a/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -From adcb38b1ffa8e401293e5028ee5af586fd304e00 Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Wed, 12 Apr 2023 13:33:07 +0800
> -Subject: [PATCH] xxhash.h: Fix GCC 12 -Og
> -
> -Change whether to inline XXH3_hashLong_withSecret to a config option
> -
> -Ref: https://github.com/Cyan4973/xxHash/commit/ace22bddc7a366a5dd8a71e8b8247694530684ec
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> -
> -Closes GH-11062.
> -
> -Upstream: https://github.com/php/php-src/commit/adcb38b1ffa8e401293e5028ee5af586fd304e00
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - ext/hash/xxhash/xxhash.h | 35 +++++++++++++++++++++++++++++++++--
> - 1 file changed, 33 insertions(+), 2 deletions(-)
> -
> -diff --git a/ext/hash/xxhash/xxhash.h b/ext/hash/xxhash/xxhash.h
> -index b5bd286496c7..8e816c0584eb 100644
> ---- a/ext/hash/xxhash/xxhash.h
> -+++ b/ext/hash/xxhash/xxhash.h
> -@@ -1375,6 +1375,23 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
> -  */
> - #  define XXH_NO_INLINE_HINTS 0
> -
> -+/*!
> -+ * @def XXH3_INLINE_SECRET
> -+ * @brief Determines whether to inline the XXH3 withSecret code.
> -+ *
> -+ * When the secret size is known, the compiler can improve the performance
> -+ * of XXH3_64bits_withSecret() and XXH3_128bits_withSecret().
> -+ *
> -+ * However, if the secret size is not known, it doesn't have any benefit. This
> -+ * happens when xxHash is compiled into a global symbol. Therefore, if
> -+ * @ref XXH_INLINE_ALL is *not* defined, this will be defined to 0.
> -+ *
> -+ * Additionally, this defaults to 0 on GCC 12+, which has an issue with function pointers
> -+ * that are *sometimes* force inline on -Og, and it is impossible to automatically
> -+ * detect this optimization level.
> -+ */
> -+#  define XXH3_INLINE_SECRET 0
> -+
> - /*!
> -  * @def XXH32_ENDJMP
> -  * @brief Whether to use a jump for `XXH32_finalize`.
> -@@ -1439,6 +1456,15 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
> - #  endif
> - #endif
> -
> -+#ifndef XXH3_INLINE_SECRET
> -+#  if (defined(__GNUC__) && !defined(__clang__) && __GNUC__ >= 12) \
> -+     || !defined(XXH_INLINE_ALL)
> -+#    define XXH3_INLINE_SECRET 0
> -+#  else
> -+#    define XXH3_INLINE_SECRET 1
> -+#  endif
> -+#endif
> -+
> - #ifndef XXH32_ENDJMP
> - /* generally preferable for performance */
> - #  define XXH32_ENDJMP 0
> -@@ -1515,6 +1541,11 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
> - #  define XXH_NO_INLINE static
> - #endif
> -
> -+#if XXH3_INLINE_SECRET
> -+#  define XXH3_WITH_SECRET_INLINE XXH_FORCE_INLINE
> -+#else
> -+#  define XXH3_WITH_SECRET_INLINE XXH_NO_INLINE
> -+#endif
> -
> -
> - /* *************************************
> -@@ -4465,7 +4496,7 @@ XXH3_hashLong_64b_internal(const void* XXH_RESTRICT input, size_t len,
> -  * so that the compiler can properly optimize the vectorized loop.
> -  * This makes a big performance difference for "medium" keys (<1 KB) when using AVX instruction set.
> -  */
> --XXH_FORCE_INLINE XXH64_hash_t
> -+XXH3_WITH_SECRET_INLINE XXH64_hash_t
> - XXH3_hashLong_64b_withSecret(const void* XXH_RESTRICT input, size_t len,
> -                              XXH64_hash_t seed64, const xxh_u8* XXH_RESTRICT secret, size_t secretLen)
> - {
> -@@ -5263,7 +5294,7 @@ XXH3_hashLong_128b_default(const void* XXH_RESTRICT input, size_t len,
> -  * It's important for performance to pass @secretLen (when it's static)
> -  * to the compiler, so that it can properly optimize the vectorized loop.
> -  */
> --XXH_FORCE_INLINE XXH128_hash_t
> -+XXH3_WITH_SECRET_INLINE XXH128_hash_t
> - XXH3_hashLong_128b_withSecret(const void* XXH_RESTRICT input, size_t len,
> -                               XXH64_hash_t seed64,
> -                               const void* XXH_RESTRICT secret, size_t secretLen)
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 4ce3616de3..96f16ff2a7 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>   # From https://www.php.net/downloads.php
> -sha256  28cdc995b7d5421711c7044294885fcde4390c9f67504a994b4cf9bc1b5cc593  php-8.2.16.tar.xz
> +sha256  39a337036a546e5c28aea76cf424ac172db5156bd8a8fd85252e389409a5ba63  php-8.3.4.tar.xz
>   
>   # License file
>   sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 28893be4c6..99dbec9de7 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PHP_VERSION = 8.2.16
> +PHP_VERSION = 8.3.4
>   PHP_SITE = https://www.php.net/distributions
>   PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>   PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
