Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC6DC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 19:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2CC760C1C;
	Tue, 27 Dec 2022 19:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2CC760C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uK3Jit0RuOnL; Tue, 27 Dec 2022 19:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62B460A69;
	Tue, 27 Dec 2022 19:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D62B460A69
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E3FAF1BF5A4
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 19:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE07F408C3
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 19:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE07F408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTKbz13ZeP2w for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 19:57:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73D63408C0
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 19:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73D63408C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BEC986E4A; Tue, 27 Dec 2022 19:57:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 20:56:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83b2e53dcde56d478928d917604bf3af1f903d9f
X-Git-Newrev: c181878a84e9531f25d8dd1f5cb10b86f8bf9e51
X-Patchwork-Hint: ignore
Message-Id: <20221227195719.5BEC986E4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdeflate: fix build with arm
 soft float
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c181878a84e9531f25d8dd1f5cb10b86f8bf9e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with arm soft float raised since bump to
version 1.15 in commit c31087182fa545784d9a0a01f0b32715d78c3955 and
https://github.com/ebiggers/libdeflate/commit/84c76f6f2cf5e5ac4deca0b1c25faebb42469f58:

In file included from /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:256,
                 from /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/crc32.c:227:
/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/11.3.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
      |  ^~~~~
In file included from /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/crc32.c:227:
/home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h: In function 'clmul_u32':
/home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:262:9: error: unknown type name 'uint64x2_t'; did you mean 'uint16x2_t'?
  262 |         uint64x2_t res = vreinterpretq_u64_p128(
      |         ^~~~~~~~~~
      |         uint16x2_t

Fixes:
 - http://autobuild.buildroot.org/results/1445dcbf676893133f311a92ac21b29237fb75df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d-error-due-to-PMULL-enabled-without-NEON.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch b/package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch
new file mode 100644
index 0000000000..b13cbc48af
--- /dev/null
+++ b/package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch
@@ -0,0 +1,35 @@
+From 079a6dd171583c1953017b703ec63c5367a284b4 Mon Sep 17 00:00:00 2001
+From: Eric Biggers <ebiggers3@gmail.com>
+Date: Mon, 26 Dec 2022 11:32:47 -0800
+Subject: [PATCH] lib/arm/cpu_features: fix build error due to PMULL enabled
+ without NEON
+
+When building for soft float arm32, HAVE_PMULL_INTRIN is being set when
+it shouldn't be, causing a build error:
+
+    #error "NEON intrinsics not available with the soft-float ABI..."
+
+Fix this by making HAVE_PMULL_INTRIN depend on HAVE_NEON_INTRIN, as used
+to be the case, in order to get the 'defined(__ARM_FP)' dependency,
+
+Fixes https://github.com/ebiggers/libdeflate/issues/282
+Fixes: 84c76f6f2cf5 ("lib/arm: make crc32 code work with MSVC")
+[Retrieved from:
+https://github.com/ebiggers/libdeflate/commit/079a6dd171583c1953017b703ec63c5367a284b4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/arm/cpu_features.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/arm/cpu_features.h b/lib/arm/cpu_features.h
+index 4092eba8..edcf7359 100644
+--- a/lib/arm/cpu_features.h
++++ b/lib/arm/cpu_features.h
+@@ -97,6 +97,7 @@ static inline u32 get_arm_cpu_features(void) { return 0; }
+ #endif
+ #if HAVE_PMULL_NATIVE || \
+ 	(HAVE_DYNAMIC_ARM_CPU_FEATURES && \
++	 HAVE_NEON_INTRIN /* needed to exclude soft float arm32 case */ && \
+ 	 (GCC_PREREQ(6, 1) || __has_builtin(__builtin_neon_vmull_p64) || \
+ 	  defined(_MSC_VER)) && \
+ 	  /*
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
