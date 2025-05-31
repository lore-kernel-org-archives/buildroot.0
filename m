Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D426C5AD49
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 00:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22BE641BAE;
	Sat, 31 May 2025 00:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHHyZUMuIGWL; Sat, 31 May 2025 00:22:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 109E641BBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 109E641BBC;
	Sat, 31 May 2025 00:22:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F60A127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 00:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 141D241BBC
 for <buildroot@buildroot.org>; Sat, 31 May 2025 00:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BsqMxGLmxw7 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 00:22:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3178A41BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3178A41BAE
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3178A41BAE
 for <buildroot@buildroot.org>; Sat, 31 May 2025 00:22:22 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2352e3db62cso12726825ad.2
 for <buildroot@buildroot.org>; Fri, 30 May 2025 17:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748650941; x=1749255741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v5VOLy+Uk0VmtWdoPsANdwpBvzWm3HGA+FoR6JOQq6o=;
 b=AcOVsncfqG/T8z2N5W4yfwoYpdfxhgRiMZ/ekS3KccV4FuJfMOrNgLMB/eX1SliigH
 6790TqJs9MyzujeO42L4RtCReSooVmV5iUtOU2nf3WvqI0Q8d9cGzN1ZLCOVMEnVIf42
 9g1JncTj2nQ1dvP8huPHsuZ1jFXChNQnJlCJ5dZ5yhW+HZ3LhcwkvP9g+oRtuPYMBHSO
 MTdKYhWUynHafwTPplrk/cRTFeR+IXDedKbqWmR5Tte5w1LBS0ckwy8H5hqiiRfUBoFW
 7GvK2q3eRg6IP7IAxT0MXUdwOskMtVZSnb8xtnTbEk+pc9Fuo3xonOdzEaBNkYkCEopQ
 r+og==
X-Gm-Message-State: AOJu0YzbrDe0Njw5ErA29KsVHy6SEvorkajw71oulRP4XT6iF54nCz9X
 byHHGS0WaiTXhgLWk+zUlKm6BQUkH4udFq+YOR52dSC2lnrVcIigjXf9zYqhbmCY
X-Gm-Gg: ASbGncsD6/aWlkyhfdjti02nepQvKyvLU/ZZ+v5X2f18rGyyaODbpTtDdP7IhlRvYEg
 E+LSpeu/OHFLjcvzQsheuyXiQ56l713j4MF5GJcseLbuZGDA9WFwslwR3FNIN+Y5IK21Lk7iPLz
 ez2U3qHXzDxicqK/SyQLtk+Vw+XqPyb7S6O3aHdg7ClAKSMNW5gg184gw9wNn0ZfQjy22l5xQ9w
 AugEZZyw80ZWSX40j4pUokqC68c2XjFY4ILJzPFrEdj4aRmpNnyum+EZU+JX/VhtYgiCy9sXx4x
 9h6JJp0jeNJpI+Txx57MYKxlcooO0ySdeRhArFqGiuduRG0oW3qBkWBptQdO/NdI7hrRhfLeGtn
 s0XZXHbjMzqdOlxHDdJrSlxZVMwiTQrdcNdxreQ==
X-Google-Smtp-Source: AGHT+IGKZ8lz9oApyXcH6QR0AqlIQzPvxeIudf5RyT5SjMTSKg29SePgy8BNP28RP7Q/bHgSFP6FNw==
X-Received: by 2002:a17:902:e84b:b0:234:ef42:5d6d with SMTP id
 d9443c01a7336-235290e65bdmr67785165ad.23.1748650940852; 
 Fri, 30 May 2025 17:22:20 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bc8837sm33616325ad.18.2025.05.30.17.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 17:22:20 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Fri, 30 May 2025 17:22:16 -0700
Message-Id: <20250531002216.595139-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748650941; x=1749255741; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v5VOLy+Uk0VmtWdoPsANdwpBvzWm3HGA+FoR6JOQq6o=;
 b=aC/oY2pgFOf7HD7Rk5AhhMVX1nHhX3+r7ZKhBiIDbGWF/xLAk11P9LXItr+FMEFlNu
 JeiipnPGdgkxr5+sisDzzdGBKyC+MVgq7Z3dmyTc4zvaFsTjY8zGsWvqIBO+3ra57rWS
 83zdX3dQ9ufmohvyLK8UiUPYkkKBD72LoGXUN3/jwymvNYoXHlkS5rn95lC4vsRWBeRG
 WhzVi5JceUcOaaqKl0sMtOSItgVBztl7FzzXMPH8BR+GuARXpKyQmgKmmdDx5VRwqJ56
 fUdOpqiJ+O+nJ+8LCxPAe8h7TfpxZI8KT5VaX2Jl3swg61deHiVX/bkiXBLT15dLpZ8c
 ot9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aC/oY2pg
Subject: [Buildroot] [PATCH 1/1] package/gcc: update to 14.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release announcement:
https://gcc.gnu.org/pipermail/gcc-announce/2025/000186.html

List of bugs which were resolved in 14.3.0:
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=14.3

Drop upstream patch 0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch
https://gcc.gnu.org/cgit/gcc/commit/?h=releases/gcc-14&id=8581982e8c977f7158d5fed5131caf0aae330403

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 .checkpackageignore                           |  2 +-
 ...up-libquadmath-math-sqrtq.c-compilat.patch | 57 -------------------
 ...le-split-stack-for-non-thread-builds.patch |  0
 ...o-undef-_TIME_BITS-in-sanitizer_proc.patch |  0
 package/gcc/Config.in.host                    |  2 +-
 package/gcc/gcc.hash                          |  4 +-
 6 files changed, 4 insertions(+), 61 deletions(-)
 delete mode 100644 package/gcc/14.2.0/0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch
 rename package/gcc/{14.2.0 => 14.3.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
 rename package/gcc/{14.2.0 => 14.3.0}/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5a427fe0f1..5ba6234871 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -477,7 +477,7 @@ package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch li
 package/fxload/0001-fix-static-build.patch lib_patch.Upstream
 package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
-package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
diff --git a/package/gcc/14.2.0/0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch b/package/gcc/14.2.0/0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch
deleted file mode 100644
index b6ed2ffed8..0000000000
--- a/package/gcc/14.2.0/0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From ba9356565695728ce0c852f7de3de27f8745611d Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Sat, 3 Aug 2024 20:37:54 +0200
-Subject: [PATCH] libquadmath: Fix up libquadmath/math/sqrtq.c compilation in
- some powerpc* configurations [PR116007]
-
-My PR114623 change started using soft-fp.h and quad.h for the sqrtq implementation.
-Unfortunately, that seems to fail building in some powerpc* configurations, where
-TFmode isn't available.
-quad.h has:
- #ifndef TFtype
- typedef float TFtype __attribute__ ((mode (TF)));
- #endif
-and uses TFtype.  quad.h has:
- /* Define the complex type corresponding to __float128
-    ("_Complex __float128" is not allowed) */
- #if (!defined(_ARCH_PPC)) || defined(__LONG_DOUBLE_IEEE128__)
- typedef _Complex float __attribute__((mode(TC))) __complex128;
- #else
- typedef _Complex float __attribute__((mode(KC))) __complex128;
- #endif
-with the conditional and KCmode use added during porting of libquadmath
-to powerpc*, so I've just defined TFtype for powerpc when __LONG_DOUBLE_IEEE128__
-isn't defined; I could define it to float __attribute__ ((mode (KF))) but it
-seemed easier to just define it to __float128 which should do the same thing.
-
-2024-08-03  Jakub Jelinek  <jakub@redhat.com>
-
-	PR target/116007
-	* math/sqrtq.c (TFtype): For PowerPC without __LONG_DOUBLE_IEEE128__
-	define to __float128 before including soft-fp.h and quad.h.
-
-(cherry picked from commit 3ac02e67503ccffa3dfeeffc0a60fce6bdaca43b)
-Upstream: https://gcc.gnu.org/g:3ac02e67503ccffa3dfeeffc0a60fce6bdaca43b
-Upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116007
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- libquadmath/math/sqrtq.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/libquadmath/math/sqrtq.c b/libquadmath/math/sqrtq.c
-index 8ca2828d42c..a58998a0667 100644
---- a/libquadmath/math/sqrtq.c
-+++ b/libquadmath/math/sqrtq.c
-@@ -9,6 +9,9 @@
-     && defined(FE_TOWARDZERO) \
-     && defined(FE_INEXACT)
- #define USE_SOFT_FP 1
-+#if defined(_ARCH_PPC) && !defined(__LONG_DOUBLE_IEEE128__)
-+#define TFtype __float128
-+#endif
- #include "../../libgcc/soft-fp/soft-fp.h"
- #include "../../libgcc/soft-fp/quad.h"
- #endif
--- 
-2.46.0
-
diff --git a/package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/14.2.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/14.3.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
similarity index 100%
rename from package/gcc/14.2.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
rename to package/gcc/14.3.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 10fe4bf609..0c99ee326a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -78,7 +78,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "12.4.0"    if BR2_GCC_VERSION_12_X
 	default "13.3.0"    if BR2_GCC_VERSION_13_X
-	default "14.2.0"    if BR2_GCC_VERSION_14_X
+	default "14.3.0"    if BR2_GCC_VERSION_14_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index b7c53f8fbe..3f5e68ec70 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,8 +6,8 @@ sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3c
 sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656d5f6e8e2d6717bf2c81f018d326f632fb468f42925b40bd217fc4853  gcc-12.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
 sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.2.0/sha512.sum
-sha512  932bdef0cda94bacedf452ab17f103c0cb511ff2cec55e9112fc0328cbf1d803b42595728ea7b200e0a057c03e85626f937012e49a7515bc5dd256b2bf4bc396  gcc-14.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
+sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  4dca20f517a42bb027fec605965b09fb917a535eebf3fe3e811d93476b02b1962df5ad4665f117bd44c2ec8e8015d51a44c00591761fe5f259c201ac5c7d920f  gcc-arc-2023.09-release.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
