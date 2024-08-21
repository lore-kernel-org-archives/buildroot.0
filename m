Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F2FC5320E
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 13:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A7404053B;
	Wed, 21 Aug 2024 13:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwIgOSDGHDEU; Wed, 21 Aug 2024 13:05:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A8EA405B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A8EA405B6;
	Wed, 21 Aug 2024 13:05:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 223321BF3C0
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 13:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 108DB40286
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 13:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESS-VBRwxc1A for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 13:05:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42B8B40201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42B8B40201
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42B8B40201
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 13:05:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8AF9A4000B;
 Wed, 21 Aug 2024 13:05:49 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2024 15:05:46 +0200
Message-ID: <20240821130547.2036270-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130547.2036270-1-thomas.petazzoni@bootlin.com>
References: <20240821130547.2036270-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724245549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NrgUI4fo9J/N9VsULQF2X6asgAZzDNQzUzso7c+KCas=;
 b=HAPtXOEhIcgVeUilrr6jgmdNZaLefvcfq5X3P1egLeWyq5vDQtEA/1CeJ7BMPU7KnA+o1q
 /N+E2MLx3hCpSgPf8PJOKBalz252Knx0o8cYBCQHRaqenHPule+01hss10/VzhOEUGqmwr
 SsfsLHt4NRqqdmchX8gODcAY+RFof4niot06D4jNoyJo6fW6kwX+XIDroN8+jW6UuEjjyz
 eWrAvpVwZr7oFEs/BU6e1uBAR1O07C8JPyOXw1d5EmmPaifdZpi7lXbS9THR2XvxrSyDtH
 mWgZ1cQu7iKaNocd3nu+uJmKqlPrB1+g0CzCqgL/e7ozvQXzTQHwGdBkzjM3dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HAPtXOEh
Subject: [Buildroot] [PATCH 2024.02.x 2/2] package/gcc: add 64-bit time_t
 fixes to GCC 11.4.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit brings the same patches as commit
81a4b6e7b8b5bb368bce940798bf8432fb420851 ("package/gcc: fix build with
BR2_TIME_BITS_64=y"), but for GCC 11.4.0, which is still used in
2024.02.x.

Fixes:

  http://autobuild.buildroot.org/results/641428197d37bc07649feb50eb7e2c65b3a0da0f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-along-with-_FILE_OFFSET_BITS-on-Lin.patch | 44 +++++++++++++++
 ...o-undef-_TIME_BITS-in-sanitizer_proc.patch | 53 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 package/gcc/11.4.0/0009-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
 create mode 100644 package/gcc/11.4.0/0010-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch

diff --git a/package/gcc/11.4.0/0009-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch b/package/gcc/11.4.0/0009-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
new file mode 100644
index 0000000000..7f113a5c0a
--- /dev/null
+++ b/package/gcc/11.4.0/0009-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
@@ -0,0 +1,44 @@
+From 37b5a741ef2d40fc31569d71fbd953c3a8120b6b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Feb 2023 11:48:35 -0800
+Subject: [PATCH] Undef _TIME_BITS along with _FILE_OFFSET_BITS on Linux
+
+On 32-bit glibc>=2.34 systems using 64bit time_t build fails because
+_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
+
+Fixes
+
+```
+/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed
+ only with _FILE_OFFSET_BITS=64"
+| #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+|     ^
+| 1 error generated.
+```
+
+Reviewed By: thesamesam, MaskRay
+
+Differential Revision: https://reviews.llvm.org/D140812
+
+Upstream: https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d53b3d94aaf211ffb2159614f5aaaf03ceb861cc
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp         | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index 5743516c046..81cf2923ebe 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -21,6 +21,7 @@
+ // To get this "true" dirent definition, we undefine _FILE_OFFSET_BITS below.
+ #ifdef _FILE_OFFSET_BITS
+ #undef _FILE_OFFSET_BITS
++#undef _TIME_BITS
+ #endif
+ 
+ // Must go after undef _FILE_OFFSET_BITS.
+-- 
+2.46.0
+
diff --git a/package/gcc/11.4.0/0010-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/11.4.0/0010-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
new file mode 100644
index 0000000000..816f915152
--- /dev/null
+++ b/package/gcc/11.4.0/0010-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
@@ -0,0 +1,53 @@
+From 51012d2f0d39293121a5c6e4e26314ebfd6cf958 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 18 Jul 2024 23:13:41 +0200
+Subject: [PATCH] libsanitizer: also undef _TIME_BITS in
+ sanitizer_procmaps_solaris.cpp
+
+Upstream commit
+https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
+of LLVM added a #undef _TIME_BITS in
+libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp to
+fix the build on 32-bit Linux platforms that have enabled 64-bit
+time_t using _TIME_BITS=64.
+
+Indeed, _TIME_BITS=64 can only be used when _FILE_OFFSET_BITS=64, but
+sanitizer_platform_limits_posix.cpp undefines _FILE_OFFSET_BITS before
+including any header file. To fix this, the upstream fix was to also
+undef _TIME_BITS.
+
+This commit simply does the same in sanitizer_procmaps_solaris.cpp,
+which also gets compiled under Linux (despite what the file name
+says). In practice on Linux hosts (where _TIME_BITS=64 matters),
+sanitizer_procmaps_solaris.cpp will expand to nothing, as pretty much
+the rest of the file is inside a #ifdef SANITIZER_SOLARIS...#endif. So
+the #undef _FILE_OFFSET_BITS and #undef _TIME_BITS are only here
+before including sanitizer_platform.h, which will set the
+SANITIZER_LINUX/SANITIZER_SOLARIS define depending on the platform.
+
+Fixes:
+
+armeb-buildroot-linux-gnueabi/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+
+Upstream: https://gcc.gnu.org/pipermail/gcc-patches/2024-July/657811.html
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+index 4063ec8deaa..503dedd1129 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+@@ -16,6 +16,7 @@
+ 
+ // Before Solaris 11.4, <procfs.h> doesn't work in a largefile environment.
+ #undef _FILE_OFFSET_BITS
++#undef _TIME_BITS
+ #include <procfs.h>
+ #include <limits.h>
+ 
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
