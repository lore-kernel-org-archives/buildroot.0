Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32CFFCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5A32613D8;
	Fri,  6 Mar 2026 19:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBJjZbHAanUj; Fri,  6 Mar 2026 19:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86129613F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826753;
	bh=lkvYpHsgkMvmLhewnQReDE1FjQc3u3XAFkuzbEVT+9k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZSQe6rs+hVWRxyKs4yZ0pkEu4mrJL+TTPsZDxjw3X1QgDAgg8M3+iNPSeKVuz76qR
	 yu7WSaiQPHW6Kl+ahnv+RVvt4OgR6r6oHCNy+Od+KWsXqLNlNZNpBfxElMsmNo9eVI
	 ACrccr4qxFecP0n0OfUvBTLVMON0hPnvPTl6yfCSrbjkKeWcWw3jBqr37KZj9MKwo5
	 cLudYnGwl7Rr1KyCgnSR+ij/UxnVLyF01hvKJwgR6kcPULCy8qQFP7/aDc+7VEqvWn
	 s239RBnj6Bgf76gaXtei37zFGQE1NNANU1XJHa5CZhO3smsqCkhQjkcEh9GlkmXLr1
	 lmWDNC0PxEsZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86129613F8;
	Fri,  6 Mar 2026 19:52:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0159E25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 786E683CDF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9h06BQ7eZdL for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DF6382C8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DF6382C8F
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B311D7FB67; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:51:39 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 094b53a414d6c03e068563135713fa35714acbad
X-Git-Newrev: 4f0460c0492ff4721c2a41d778e48e237cf6456a
X-Patchwork-Hint: ignore
Message-Id: <20260306195222.B311D7FB67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/botan: add patch
 for CVE-2024-50382 & CVE-2024-50383
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f0460c0492ff4721c2a41d778e48e237cf6456a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerabilities:

- CVE-2024-50382:
    Botan before 3.6.0, when certain LLVM versions are used, has compiler-
    induced secret-dependent control flow in lib/utils/ghash/ghash.cpp in
    GHASH in AES-GCM. There is a branch instead of an XOR with carry. This
    was observed for Clang in LLVM 15 on RISC-V.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2024-50382
  - https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957

- CVE-2024-50383:
    Botan before 3.6.0, when certain GCC versions are used, has a
    compiler-induced secret-dependent operation in lib/utils/donna128.h in
    donna128 (used in Chacha-Poly1305 and x25519). An addition can be
    skipped if a carry is not set. This was observed for GCC 11.3.0 with
    -O2 on MIPS, and GCC on x86-i386. (Only 32-bit processors can be
    affected.)

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2024-50383
  - https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e197babd387cea2ab23bb1c1735ba270f6f6edf1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...s-to-avoid-compiler-induced-side-channels.patch | 65 ++++++++++++++++++++++
 package/botan/botan.mk                             |  3 +
 2 files changed, 68 insertions(+)

diff --git a/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch b/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
new file mode 100644
index 0000000000..22f64be1b9
--- /dev/null
+++ b/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
@@ -0,0 +1,65 @@
+From 53b0cfde580e86b03d0d27a488b6c134f662e957 Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Sat, 19 Oct 2024 07:43:18 -0400
+Subject: [PATCH] Add more value barriers to avoid compiler induced side
+ channels
+
+The paper https://arxiv.org/pdf/2410.13489 claims that on specific
+architectures Clang and GCC may introduce jumps here. The donna128
+issues only affect 32-bit processors, which explains why we would not
+see it in the x86-64 valgrind runs.
+
+The GHASH leak would seem to be generic but the authors only observed
+it on RISC-V.
+
+CVE: CVE-2024-50382
+CVE: CVE-2024-50383
+Upstream: https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/lib/utils/donna128.h      | 5 +++--
+ src/lib/utils/ghash/ghash.cpp | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/utils/donna128.h b/src/lib/utils/donna128.h
+index 8212bd349e0..7adf54546df 100644
+--- a/src/lib/utils/donna128.h
++++ b/src/lib/utils/donna128.h
+@@ -8,6 +8,7 @@
+ #ifndef BOTAN_CURVE25519_DONNA128_H_
+ #define BOTAN_CURVE25519_DONNA128_H_
+ 
++#include <botan/internal/ct_utils.h>
+ #include <botan/internal/mul128.h>
+ #include <type_traits>
+ 
+@@ -73,14 +74,14 @@ class donna128 final {
+          l += x.l;
+          h += x.h;
+ 
+-         const uint64_t carry = (l < x.l);
++         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x.l).if_set_return(1);
+          h += carry;
+          return *this;
+       }
+ 
+       constexpr donna128& operator+=(uint64_t x) {
+          l += x;
+-         const uint64_t carry = (l < x);
++         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x).if_set_return(1);
+          h += carry;
+          return *this;
+       }
+diff --git a/src/lib/utils/ghash/ghash.cpp b/src/lib/utils/ghash/ghash.cpp
+index 8c3b1ed6c2a..61b28590002 100644
+--- a/src/lib/utils/ghash/ghash.cpp
++++ b/src/lib/utils/ghash/ghash.cpp
+@@ -131,7 +131,7 @@ void GHASH::key_schedule(std::span<const uint8_t> key) {
+          m_HM[4 * j + 2 * i + 1] = H1;
+ 
+          // GCM's bit ops are reversed so we carry out of the bottom
+-         const uint64_t carry = R * (H1 & 1);
++         const uint64_t carry = CT::Mask<uint64_t>::expand(H1 & 1).if_set_return(R);
+          H1 = (H1 >> 1) | (H0 << 63);
+          H0 = (H0 >> 1) ^ carry;
+       }
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 561e7bf702..38948f0184 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -11,6 +11,9 @@ BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
 BOTAN_CPE_ID_VALID = YES
 
+# 0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
+BOTAN_IGNORE_CVES += CVE-2024-50382 CVE-2024-50383
+
 BOTAN_INSTALL_STAGING = YES
 
 BOTAN_DEPENDENCIES = host-python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
