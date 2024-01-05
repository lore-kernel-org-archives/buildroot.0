Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A265C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 198A683EC6;
	Fri,  5 Jan 2024 13:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 198A683EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEPkCFPiuH8m; Fri,  5 Jan 2024 13:20:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0892983EC7;
	Fri,  5 Jan 2024 13:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0892983EC7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A77791BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80BBC83EC7
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80BBC83EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3__Tqe6H-bIk for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:20:31 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7F1483EC6
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7F1483EC6
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3368abe1093so1122569f8f.2
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 05:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704460828; x=1705065628;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kSt1WkECe1gqIup4K9i6gn4DMlwufS7lnntPrr3+JQ8=;
 b=kqq2lMi5oaSIcI2KKzwsJQ9lbmBhCtRFnq02tCiSI4o9v4Qd8ItUcQFtvET+H9Nbn7
 QwwmR8UP00flQpk80j4StoIP+AGxlKTTl39xwFAEr98tKSHhpWLUrIPselwfeuBZfo7+
 MgqISrVUWEOul/OrFGCE7omtl/dOo6eLU0BPSfN6sG8SZqdnHDK7Uj/kO6SvKV9bPuuv
 +zqY6rv51kaQXufIagvT+h42wAb/UHgZ6itogPW7xvctZr0uDVk3vKemugpnQyST1C+l
 ZUB8jamJ5SIBMKszLpISIKpmhtESn7HXbOWDSpDm14x84YScloZDY/LjmRlwj/OZ+nMS
 Y+7A==
X-Gm-Message-State: AOJu0YxslqexNQ9eNaqRc8R45VuWUKf0bQhMjuZX6zTasHOByWSWqdsf
 snSjZBQ/E8SfR991KkRVGLydYtECIoc=
X-Google-Smtp-Source: AGHT+IGX2Qu8bzN4+VZ/7p22R2qI87ixIEeSx7FWpa34JYK2exO+3qOuQbJLnl96u0YQDZqwYmb4Gw==
X-Received: by 2002:a5d:408e:0:b0:336:60ea:319d with SMTP id
 o14-20020a5d408e000000b0033660ea319dmr1007628wrp.63.1704460827899; 
 Fri, 05 Jan 2024 05:20:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v12-20020a5d610c000000b003366da509ecsm1384561wrt.85.2024.01.05.05.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 05:20:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 14:20:23 +0100
Message-ID: <20240105132023.502516-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704460828; x=1705065628; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kSt1WkECe1gqIup4K9i6gn4DMlwufS7lnntPrr3+JQ8=;
 b=LPb/GGWq68V9rG2GySIQ9+Bt/xfUoRCzt9SZUkgbYqAYeiln7pPCk+ESyFLQuSgIPp
 vpfhd0RP2RsAp7UwTTnTaN4+cIA1d49chXzTZrQO/0l7gifUaZ3mxiacxGlkb4l0zrZ+
 t/kZIv+tTJkB6XdUbsq0XekhMZiwuaR89qNSPNFFqQ+/ZEuRDuky2VVjhHEiD1mg6k4G
 7Dx6ZOxaROibyV13E1P1nybHZdbSrhas0G508cpR7U3oxrIboljbojgUF/9rHMzKQLjt
 igeeKWlqKVnEgU44yumj3GCKMu6nSoMpZyNMsbj9mFZoUWMKQUHQNgl3utQafAJPMCoq
 e7Qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LPb/GGWq
Subject: [Buildroot] [PATCH v2,1/1] package/cups: fix build without gnutls
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without gnutls raised since bump to
version 2.4.7 in commit 55c80fdfb379c74c7f7e8c260dea02e0150d7614 and
https://github.com/OpenPrinting/cups/commit/b5b1418da7bfb9f81384c7c47cc59890b4d3ff5d

hash.c:16:12: fatal error: gnutls/crypto.h: No such file or directory
   16 | #  include <gnutls/crypto.h>
      |            ^~~~~~~~~~~~~~~~~

Those patches have been requested to upstream by Peter Korsgaard:
https://github.com/OpenPrinting/cups/issues/762

Fixes:
 - http://autobuild.buildroot.org/results/888e9e252821bda1e051400d4aa850cd082e8e76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Split upstream patch and update commit message

 ...-support-for-MacOS-Win-SSL-libs-back.patch | 349 ++++++++++++++++++
 ...sion-does-not-support-several-hashes.patch |  30 ++
 2 files changed, 379 insertions(+)
 create mode 100644 package/cups/0005-cups-hash-c-Put-support-for-MacOS-Win-SSL-libs-back.patch
 create mode 100644 package/cups/0006-cups-hash-c-LibreSSL-version-does-not-support-several-hashes.patch

diff --git a/package/cups/0005-cups-hash-c-Put-support-for-MacOS-Win-SSL-libs-back.patch b/package/cups/0005-cups-hash-c-Put-support-for-MacOS-Win-SSL-libs-back.patch
new file mode 100644
index 0000000000..57c6b61437
--- /dev/null
+++ b/package/cups/0005-cups-hash-c-Put-support-for-MacOS-Win-SSL-libs-back.patch
@@ -0,0 +1,349 @@
+From c6cd5e9c10edc68caf6936a3d3274f758e9cd03d Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Tue, 3 Oct 2023 13:59:40 +0200
+Subject: [PATCH] cups/hash.c: Put support for MacOS/Win SSL libs back
+
+- I mustn't remove their support in patch release - this should happen in
+2.5 only.
+- I have put back support for several hashes as well - they
+should be removed in 2.5.
+- restrict usage of second block hashing only if OpenSSL/LibreSSL/GnuTLS
+  is available
+
+Upstream: https://github.com/OpenPrinting/cups/commit/c6cd5e9c10edc68caf6936a3d3274f758e9cd03d
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ cups/hash.c | 271 +++++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 260 insertions(+), 11 deletions(-)
+
+diff --git a/cups/hash.c b/cups/hash.c
+index 93ca552c8..c447bab4e 100644
+--- a/cups/hash.c
++++ b/cups/hash.c
+@@ -12,8 +12,13 @@
+ #include "md5-internal.h"
+ #ifdef HAVE_OPENSSL
+ #  include <openssl/evp.h>
+-#else // HAVE_GNUTLS
++#elif defined(HAVE_GNUTLS)
+ #  include <gnutls/crypto.h>
++#elif __APPLE__
++#  include <CommonCrypto/CommonDigest.h>
++#elif _WIN32
++#  include <windows.h>
++#  include <bcrypt.h>
+ #endif // HAVE_OPENSSL
+ 
+ 
+@@ -193,17 +198,18 @@ hash_data(const char    *algorithm,	// I - Algorithm
+           const void    *b,		// I - Second block or `NULL` for none
+           size_t        blen)		// I - Length of second block or `0` for none
+ {
++#if defined(HAVE_OPENSSL) || defined(HAVE_GNUTLS)
+   unsigned	hashlen;		// Length of hash
+   unsigned char	hashtemp[64];		// Temporary hash buffer
+-#ifdef HAVE_OPENSSL
+-  const EVP_MD	*md = NULL;		// Message digest implementation
+-  EVP_MD_CTX	*ctx;			// Context
+-#else // HAVE_GNUTLS
+-  gnutls_digest_algorithm_t alg = GNUTLS_DIG_UNKNOWN;
+-					// Algorithm
+-  gnutls_hash_hd_t ctx;			// Context
+-#endif // HAVE_OPENSSL
++#else
++  if (strcmp(algorithm, "md5") && (b || blen != 0))
++  {
++    // Second block hashing is not supported without OpenSSL or GnuTLS
++    _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unsupported without GnuTLS or OpenSSL/LibreSSL."), 1);
+ 
++    return (-1);
++  }
++#endif
+ 
+   if (!strcmp(algorithm, "md5"))
+   {
+@@ -223,6 +229,10 @@ hash_data(const char    *algorithm,	// I - Algorithm
+   }
+ 
+ #ifdef HAVE_OPENSSL
++  const EVP_MD	*md = NULL;		// Message digest implementation
++  EVP_MD_CTX	*ctx;			// Context
++
++
+   if (!strcmp(algorithm, "sha"))
+   {
+     // SHA-1
+@@ -244,6 +254,14 @@ hash_data(const char    *algorithm,	// I - Algorithm
+   {
+     md = EVP_sha512();
+   }
++  else if (!strcmp(algorithm, "sha2-512_224"))
++  {
++    md = EVP_sha512_224();
++  }
++  else if (!strcmp(algorithm, "sha2-512_256"))
++  {
++    md = EVP_sha512_256();
++  }
+ 
+   if (md)
+   {
+@@ -262,7 +280,13 @@ hash_data(const char    *algorithm,	// I - Algorithm
+     return ((ssize_t)hashlen);
+   }
+ 
+-#else // HAVE_GNUTLS
++#elif defined(HAVE_GNUTLS)
++  gnutls_digest_algorithm_t	alg = GNUTLS_DIG_UNKNOWN;	// Algorithm
++  gnutls_hash_hd_t		ctx;				// Context
++  unsigned char		temp[64];			// Temporary hash buffer
++  size_t			tempsize = 0;			// Truncate to this size?
++
++
+   if (!strcmp(algorithm, "sha"))
+   {
+     // SHA-1
+@@ -284,9 +308,32 @@ hash_data(const char    *algorithm,	// I - Algorithm
+   {
+     alg = GNUTLS_DIG_SHA512;
+   }
++  else if (!strcmp(algorithm, "sha2-512_224"))
++  {
++    alg      = GNUTLS_DIG_SHA512;
++    tempsize = 28;
++  }
++  else if (!strcmp(algorithm, "sha2-512_256"))
++  {
++    alg      = GNUTLS_DIG_SHA512;
++    tempsize = 32;
++  }
+ 
+   if (alg != GNUTLS_DIG_UNKNOWN)
+   {
++    if (tempsize > 0)
++    {
++      // Truncate result to tempsize bytes...
++
++      if (hashsize < tempsize)
++        goto too_small;
++
++      gnutls_hash_fast(alg, a, alen, temp);
++      memcpy(hash, temp, tempsize);
++
++      return ((ssize_t)tempsize);
++    }
++
+     hashlen = gnutls_hash_get_len(alg);
+ 
+     if (hashlen > hashsize)
+@@ -302,7 +349,209 @@ hash_data(const char    *algorithm,	// I - Algorithm
+ 
+     return ((ssize_t)hashlen);
+   }
+-#endif // HAVE_OPENSSL
++
++#elif __APPLE__
++  if (!strcmp(algorithm, "sha"))
++  {
++    // SHA-1...
++
++    CC_SHA1_CTX	ctx;			// SHA-1 context
++
++    if (hashsize < CC_SHA1_DIGEST_LENGTH)
++      goto too_small;
++
++    CC_SHA1_Init(&ctx);
++    CC_SHA1_Update(&ctx, a, (CC_LONG)alen);
++    CC_SHA1_Final(hash, &ctx);
++
++    return (CC_SHA1_DIGEST_LENGTH);
++  }
++#  ifdef CC_SHA224_DIGEST_LENGTH
++  else if (!strcmp(algorithm, "sha2-224"))
++  {
++    CC_SHA256_CTX	ctx;		// SHA-224 context
++
++    if (hashsize < CC_SHA224_DIGEST_LENGTH)
++      goto too_small;
++
++    CC_SHA224_Init(&ctx);
++    CC_SHA224_Update(&ctx, a, (CC_LONG)alen);
++    CC_SHA224_Final(hash, &ctx);
++
++    return (CC_SHA224_DIGEST_LENGTH);
++  }
++#  endif /* CC_SHA224_DIGEST_LENGTH */
++  else if (!strcmp(algorithm, "sha2-256"))
++  {
++    CC_SHA256_CTX	ctx;		// SHA-256 context
++
++    if (hashsize < CC_SHA256_DIGEST_LENGTH)
++      goto too_small;
++
++    CC_SHA256_Init(&ctx);
++    CC_SHA256_Update(&ctx, a, (CC_LONG)alen);
++    CC_SHA256_Final(hash, &ctx);
++
++    return (CC_SHA256_DIGEST_LENGTH);
++  }
++  else if (!strcmp(algorithm, "sha2-384"))
++  {
++    CC_SHA512_CTX	ctx;		// SHA-384 context
++
++    if (hashsize < CC_SHA384_DIGEST_LENGTH)
++      goto too_small;
++
++    CC_SHA384_Init(&ctx);
++    CC_SHA384_Update(&ctx, a, (CC_LONG)alen);
++    CC_SHA384_Final(hash, &ctx);
++
++    return (CC_SHA384_DIGEST_LENGTH);
++  }
++  else if (!strcmp(algorithm, "sha2-512"))
++  {
++    CC_SHA512_CTX	ctx;		// SHA-512 context
++
++    if (hashsize < CC_SHA512_DIGEST_LENGTH)
++      goto too_small;
++
++    CC_SHA512_Init(&ctx);
++    CC_SHA512_Update(&ctx, a, (CC_LONG)alen);
++    CC_SHA512_Final(hash, &ctx);
++
++    return (CC_SHA512_DIGEST_LENGTH);
++  }
++#  ifdef CC_SHA224_DIGEST_LENGTH
++  else if (!strcmp(algorithm, "sha2-512_224"))
++  {
++    CC_SHA512_CTX	ctx;		// SHA-512 context
++    unsigned char	temp[CC_SHA512_DIGEST_LENGTH];
++                                        // SHA-512 hash
++
++    // SHA2-512 truncated to 224 bits (28 bytes)...
++
++    if (hashsize < CC_SHA224_DIGEST_LENGTH)
++      goto too_small;
++
++    CC_SHA512_Init(&ctx);
++    CC_SHA512_Update(&ctx, a, (CC_LONG)alen);
++    CC_SHA512_Final(temp, &ctx);
++
++    memcpy(hash, temp, CC_SHA224_DIGEST_LENGTH);
++
++    return (CC_SHA224_DIGEST_LENGTH);
++  }
++#  endif // CC_SHA224_DIGEST_LENGTH
++  else if (!strcmp(algorithm, "sha2-512_256"))
++  {
++    CC_SHA512_CTX	ctx;		// SHA-512 context
++    unsigned char	temp[CC_SHA512_DIGEST_LENGTH];
++                                        // SHA-512 hash
++
++    // SHA2-512 truncated to 256 bits (32 bytes)...
++
++    if (hashsize < CC_SHA256_DIGEST_LENGTH)
++      goto too_small;
++
++    CC_SHA512_Init(&ctx);
++    CC_SHA512_Update(&ctx, a, (CC_LONG)alen);
++    CC_SHA512_Final(temp, &ctx);
++
++    memcpy(hash, temp, CC_SHA256_DIGEST_LENGTH);
++
++    return (CC_SHA256_DIGEST_LENGTH);
++  }
++
++#elif _WIN32
++  // Use Windows CNG APIs to perform hashing...
++  BCRYPT_ALG_HANDLE	alg;		// Algorithm handle
++  LPCWSTR		algid = NULL;	// Algorithm ID
++  ssize_t		hashlen;	// Hash length
++  NTSTATUS		status;		// Status of hash
++  unsigned char		temp[64];	// Temporary hash buffer
++  size_t		tempsize = 0;	// Truncate to this size?
++
++
++  if (!strcmp(algorithm, "sha"))
++  {
++    algid   = BCRYPT_SHA1_ALGORITHM;
++    hashlen = 20;
++  }
++  else if (!strcmp(algorithm, "sha2-256"))
++  {
++    algid   = BCRYPT_SHA256_ALGORITHM;
++    hashlen = 32;
++  }
++  else if (!strcmp(algorithm, "sha2-384"))
++  {
++    algid   = BCRYPT_SHA384_ALGORITHM;
++    hashlen = 48;
++  }
++  else if (!strcmp(algorithm, "sha2-512"))
++  {
++    algid   = BCRYPT_SHA512_ALGORITHM;
++    hashlen = 64;
++  }
++  else if (!strcmp(algorithm, "sha2-512_224"))
++  {
++    algid   = BCRYPT_SHA512_ALGORITHM;
++    hashlen = tempsize = 28;
++  }
++  else if (!strcmp(algorithm, "sha2-512_256"))
++  {
++    algid   = BCRYPT_SHA512_ALGORITHM;
++    hashlen = tempsize = 32;
++  }
++
++  if (algid)
++  {
++    if (hashsize < (size_t)hashlen)
++      goto too_small;
++
++    if ((status = BCryptOpenAlgorithmProvider(&alg, algid, NULL, 0)) < 0)
++    {
++      DEBUG_printf(("2cupsHashData: BCryptOpenAlgorithmProvider returned %d.", status));
++
++      if (status == STATUS_INVALID_PARAMETER)
++	_cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Bad algorithm parameter."), 1);
++      else
++	_cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to access cryptographic provider."), 1);
++
++      return (-1);
++    }
++
++    if (tempsize > 0)
++    {
++      // Do a truncated SHA2-512 hash...
++      status = BCryptHash(alg, NULL, 0, (PUCHAR)a, (ULONG)alen, temp, sizeof(temp));
++      memcpy(hash, temp, hashlen);
++    }
++    else
++    {
++      // Hash directly to buffer...
++      status = BCryptHash(alg, NULL, 0, (PUCHAR)a, (ULONG)alen, hash, (ULONG)hashlen);
++    }
++
++    BCryptCloseAlgorithmProvider(alg, 0);
++
++    if (status < 0)
++    {
++      DEBUG_printf(("2cupsHashData: BCryptHash returned %d.", status));
++
++      if (status == STATUS_INVALID_PARAMETER)
++	_cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Bad hashing parameter."), 1);
++      else
++	_cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Hashing failed."), 1);
++
++      return (-1);
++    }
++
++    return (hashlen);
++  }
++
++#else
++  if (hashsize < 64)
++    goto too_small;
++#endif // __APPLE__
+ 
+   // Unknown hash algorithm...
+   _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unknown hash algorithm."), 1);
diff --git a/package/cups/0006-cups-hash-c-LibreSSL-version-does-not-support-several-hashes.patch b/package/cups/0006-cups-hash-c-LibreSSL-version-does-not-support-several-hashes.patch
new file mode 100644
index 0000000000..be4c6b469d
--- /dev/null
+++ b/package/cups/0006-cups-hash-c-LibreSSL-version-does-not-support-several-hashes.patch
@@ -0,0 +1,30 @@
+From 0dd97fcaeeb16ed836e8542d75e2396fb1d129d9 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Tue, 3 Oct 2023 14:39:33 +0200
+Subject: [PATCH] cups/hash.c: LibreSSL version does not support several hashes
+
+Upstream: https://github.com/OpenPrinting/cups/commit/0dd97fcaeeb16ed836e8542d75e2396fb1d129d9
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ cups/hash.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/cups/hash.c b/cups/hash.c
+index c447bab4e..5eefa1010 100644
+--- a/cups/hash.c
++++ b/cups/hash.c
+@@ -254,14 +254,6 @@ hash_data(const char    *algorithm,	// I - Algorithm
+   {
+     md = EVP_sha512();
+   }
+-  else if (!strcmp(algorithm, "sha2-512_224"))
+-  {
+-    md = EVP_sha512_224();
+-  }
+-  else if (!strcmp(algorithm, "sha2-512_256"))
+-  {
+-    md = EVP_sha512_256();
+-  }
+ 
+   if (md)
+   {
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
