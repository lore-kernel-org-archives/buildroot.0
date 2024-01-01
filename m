Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140F3C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 22:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0B6140A50;
	Mon,  1 Jan 2024 22:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0B6140A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azbgv6ObT91d; Mon,  1 Jan 2024 22:22:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B250411A8;
	Mon,  1 Jan 2024 22:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B250411A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80D0D1BF3BE
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67057610BC
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67057610BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8m1zTpzwOGX for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 22:22:02 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9758D610B5
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 22:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9758D610B5
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33679c49fe5so7774070f8f.3
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 14:22:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704147719; x=1704752519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LTKdcsVT0znepbNHG9LcuV4N1URIRBlXEuUblRs9YXc=;
 b=ZiTp8pZEiBELPVvNlXuCdfMzKNWJHJQ2F4A3dq+nw+XlvEBPj+49XhtwPPq8JSVtbo
 FzNQ25sUBiHlaKUaH/OHN3MHwFfwxsRHBair9buhdyKNWqW1KRUwdpte+CELrwTC/1p0
 dsn/SylH8VItbjOZLZkgdtxlusl7SketPy81gigI42M5KZJHI0dY1p0mSHyrmYUU93d/
 e8zW39bTEGLGW5eKWksF+Nfd8d2F7ayAmHklP9ZMGr5Zt2mXbThhkLw5SDC4hE2yXzIf
 NeJR6PMgMflkdkF6TJlmTh+4oJGw2piXd0bg3R2v/K9zfzPjZrLZq1vqDHcnGrUq2MSz
 2oAA==
X-Gm-Message-State: AOJu0YxW3wQKNq/s0jQqCIa0xZWyE3/CciBk6B/XOLzHHitbBUcOC8BC
 NngHKyfKRyyhQg2rQMgc60dfW/0DOsE=
X-Google-Smtp-Source: AGHT+IHmJ/jZJs3J4tTeLpcVErDm27UmX2vOvvgSGNcbTxQrd2540eRM5tGzUM5Vux31OjelpP120A==
X-Received: by 2002:a5d:5967:0:b0:336:c3c7:75e8 with SMTP id
 e39-20020a5d5967000000b00336c3c775e8mr6917249wri.45.1704147718454; 
 Mon, 01 Jan 2024 14:21:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z4-20020a5d4d04000000b00336a1f6ce7csm22245312wrt.19.2024.01.01.14.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 14:21:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 23:21:56 +0100
Message-ID: <20240101222156.46284-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704147719; x=1704752519; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LTKdcsVT0znepbNHG9LcuV4N1URIRBlXEuUblRs9YXc=;
 b=YrWdRMB6C9VPVIIcCWuy9uBcg1mdWfFGKIxhhSDAB+5VutgwXHxxONPkd1MMn1BGIl
 IbWV8desuWmXffL8nZ4QYnBYBUKNAqdLB2YPU9Jri3GkR2IEahOLzAp3toj3TzPJaeiP
 vMreHryH7W458z5VcNIej+HYMLq9dCdhIz4sEpePHttbsSTzqSluPmYgA2CBU+MDbCJ8
 uv+553i0/vQTfZYxnsKQkoXq4+y/vxvo7BAxjA8XjcRhO2M2BCys4uIuv/k7ltELV1SB
 oMCmy7Xyw2cG3DWJseq2yYVScZxKJNwmkqGgolD9lEqvgRWqXbCS5fVFVXeTO+nWvpr7
 pFBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YrWdRMB6
Subject: [Buildroot] [PATCH 1/1] package/highway: bump to version 1.0.7
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version)

https://github.com/google/highway/releases/tag/1.0.7
https://github.com/google/highway/releases/tag/1.0.6
https://github.com/google/highway/releases/tag/1.0.5
https://github.com/google/highway/releases/tag/1.0.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |   2 -
 ...Fix-compilation-for-armv7-with-gcc-8.patch |  46 -------
 ...for-armv7-targets-with-vfp-v4-and-gc.patch | 118 ------------------
 package/highway/highway.hash                  |   2 +-
 package/highway/highway.mk                    |   2 +-
 5 files changed, 2 insertions(+), 168 deletions(-)
 delete mode 100644 package/highway/0001-Fix-compilation-for-armv7-with-gcc-8.patch
 delete mode 100644 package/highway/0002-Fix-compilation-for-armv7-targets-with-vfp-v4-and-gc.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 0862477966..46d0b827d8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -525,8 +525,6 @@ package/harfbuzz/0001-meson.build-check-for-pthread.h.patch Upstream
 package/haserl/0001-add-haserl_lualib.inc.patch Upstream
 package/haveged/S21haveged Shellcheck Variables
 package/heirloom-mailx/0001-fix-libressl-support.patch Upstream
-package/highway/0001-Fix-compilation-for-armv7-with-gcc-8.patch Upstream
-package/highway/0002-Fix-compilation-for-armv7-targets-with-vfp-v4-and-gc.patch Upstream
 package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch Upstream
 package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch Upstream
 package/htpdate/S43htpdate Shellcheck
diff --git a/package/highway/0001-Fix-compilation-for-armv7-with-gcc-8.patch b/package/highway/0001-Fix-compilation-for-armv7-with-gcc-8.patch
deleted file mode 100644
index 0634460453..0000000000
--- a/package/highway/0001-Fix-compilation-for-armv7-with-gcc-8.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 94cda9cc8cd12345a6dbe70e40f3119d5bf7ee78 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Fri, 10 Feb 2023 21:25:36 +0100
-Subject: [PATCH] Fix compilation for armv7 with gcc < 8
-
-Highway uses the construct __attribute__((target(+neon-vfpv4)) for
-Armv7. The target "+neon-vfpv4" was introduced in gcc 8, in commit [1].
-When using a gcc < 8 (for example, like [2]), compilation fails with
-message:
-
-    In file included from /build/highway-1.0.3/hwy/foreach_target.h:81:0,
-                     from /build/highway-1.0.3/hwy/per_target.cc:20:
-    /build/highway-1.0.3/hwy/per_target.cc: At global scope:
-    /build/highway-1.0.3/hwy/per_target.cc:23:22: error: attribute(target("+neon-vfpv4")) is unknown
-
-This commit protects the definition of HWY_TARGET_STR only when gcc
-version 8 or greater is used for armv7.
-
-[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=e87afe54b86c478ae63569e51e7abb67d3fe3fce
-[2] https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- hwy/ops/set_macros-inl.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/hwy/ops/set_macros-inl.h b/hwy/ops/set_macros-inl.h
-index 051dbb3..00b4b1b 100644
---- a/hwy/ops/set_macros-inl.h
-+++ b/hwy/ops/set_macros-inl.h
-@@ -230,7 +230,12 @@
- // Can use pragmas instead of -march compiler flag
- #if HWY_HAVE_RUNTIME_DISPATCH
- #if HWY_ARCH_ARM_V7
-+#if HWY_COMPILER_GCC_ACTUAL >= 800
-+// The __attribute__((target(+neon-vfpv4)) was introduced in gcc >= 8.
-+// In case we have a gcc < 8, we can still compile by keeping
-+// HWY_TARGET_STR undefined.
- #define HWY_TARGET_STR "+neon-vfpv4"
-+#endif
- #else
- #define HWY_TARGET_STR "+crypto"
- #endif  // HWY_ARCH_ARM_V7
--- 
-2.39.2
-
diff --git a/package/highway/0002-Fix-compilation-for-armv7-targets-with-vfp-v4-and-gc.patch b/package/highway/0002-Fix-compilation-for-armv7-targets-with-vfp-v4-and-gc.patch
deleted file mode 100644
index f29b385501..0000000000
--- a/package/highway/0002-Fix-compilation-for-armv7-targets-with-vfp-v4-and-gc.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 93d4579f90dd6ad26fd0dcda6420b3bb2fdcbc02 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Mon, 20 Feb 2023 23:22:28 +0100
-Subject: [PATCH] Fix compilation for armv7 targets with vfp < v4 and gcc >= 8
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When using a armv7 gcc >= 8 toolchain (like [1]) with Highway
-configured with -DHWY_CMAKE_ARM7=OFF and HWY_ENABLE_CONTRIB=ON,
-compilation fails with error:
-
-    In file included from /build/highway-1.0.3/hwy/ops/arm_neon-inl.h:33,
-                     from /build/highway-1.0.3/hwy/highway.h:358,
-                     from /build/highway-1.0.3/hwy/contrib/sort/shared-inl.h:104,
-                     from /build/highway-1.0.3/hwy/contrib/sort/traits128-inl.h:27,
-                     from /build/highway-1.0.3/hwy/contrib/sort/vqsort_128d.cc:23,
-                     from /build/highway-1.0.3/hwy/foreach_target.h:81,
-                     from /build/highway-1.0.3/hwy/contrib/sort/vqsort_128d.cc:20:
-    /toolchain/lib/gcc/arm-buildroot-linux-gnueabihf/12.2.0/include/arm_neon.h: In function 'void hwy::N_NEON::StoreU(Vec128<long long unsigned int, 2>, Full128<long long unsigned int>, uint64_t*)':
-    /toolchain/lib/gcc/arm-buildroot-linux-gnueabihf/12.2.0/include/arm_neon.h:11052:1: error: inlining failed in call to 'always_inline' 'void vst1q_u64(uint64_t*, uint64x2_t)': target specific option mismatch
-    11052 | vst1q_u64 (uint64_t * __a, uint64x2_t __b)
-          | ^~~~~~~~~
-    /build/highway-1.0.3/hwy/ops/arm_neon-inl.h:2786:12: note: called from here
-     2786 |   vst1q_u64(unaligned, v.raw);
-          |   ~~~~~~~~~^~~~~~~~~~~~~~~~~~
-
-The same errors happen when configured with HWY_ENABLE_EXAMPLES=ON,
-or from client libraries like libjxl (at other places).
-
-The issue is that Highway Arm NEON ops have a dependency on the
-Advanced SIMD (Neon) v2 and the VFPv4 floating-point instructions.
-The SIMD (Neon) v1 and VFPv3 instructions are not supported.
-
-There was several attempts to fix variants of this issues.
-See #834 and #1032.
-
-HWY_NEON target is selected only if __ARM_NEON is defined. See:
-https://github.com/google/highway/blob/1.0.3/hwy/detect_targets.h#L251
-
-This test is not sufficient since __ARM_NEON will be predefined in
-any cases when Neon is enabled (neon-vfpv3, neon-vfpv4).
-
-The issue is that HWY_CMAKE_ARM7=ON implies VFPv4 / NEON SIMD v2.
-When setting HWY_CMAKE_ARM7=OFF, "neon-vfpv4" will not be forced,
-but the code is still using intrinsics assuming VFPv4. Gcc will fail
-with error because code cannot be generated for the selected
-architecture.
-
-This issue can be avoided by adding "-DHWY_DISABLED_TARGETS=HWY_NEON" in
-CXXFLAGS. The problem with this solution is that every client program will
-also need to do the same. This goes against the very purpose of
-"hwy/detect_targets.h".
-
-Technically, Armv7-a processors with VFPv4 can be detected using some
-ACLE (Arm C Language Extensions [2]) predefined macros:
-
-Basically, we want Highway to define HWY_NEON only when the target
-supports SIMDv2/VFPv4 or higher. An older target with vfpv3 only
-(e.g. Cortex-A8, A9, ...) would NOT define HWY_NEON, and therefore
-would fallback on HWY_SCALAR implementation.
-
-However, not all compiler completely support ACLE. There is also
-several versions too. So we cannot easily rely on macros like
-"__ARM_VFPV4__" (which clang predefine, but not gcc).
-
-The alternative solution proposed in this patch, is to declare the
-HWY_NEON target architecture as broken, when we detect the target is
-Armv7-A, but mandatory features for vfpv4 (namely half-float, FMA)
-are missing. Half-floats are tested using the macro __ARM_NEON_FP,
-and the FMA with the macro __ARM_FEATURE_FMA. See ACLE [2]. The
-intent of declaring the target as broken, rather than selecting
-HWY_NEON only if vfpv4 features are detected is to remain a bit
-conservative, since the detection is slithly inaccurate.
-
-For a given compiler/cflags, predefined macros for Arm/ACLE can be
-reviewed with commands like:
-
-    arm-linux-gnueabihf-gcc -mcpu=cortex-a9 -mfpu=neon-vfpv3 -Wp,-dM -E -c - < /dev/null | grep -Fi arm | sort
-    arm-linux-gnueabihf-gcc -mcpu=cortex-a7 -mfpu=neon-vfpv4 -Wp,-dM -E -c - < /dev/null | grep -Fi arm | sort
-    clang -target armv7a -mcpu=cortex-a9 -mfpu=neon-vfpv3 -mfloat-abi=hard -Wp,-dM -E -c - < /dev/null | grep -Fi arm | sort
-    clang -target armv7a -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -Wp,-dM -E -c - < /dev/null | grep -Fi arm | sort
-
-The different values of __ARM_NEON_FP can be seen, depending which
-"-mfpu" is passed. Same for __ARM_FEATURE_FMA.
-
-[1] https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2022.08-1.tar.bz2
-[2] https://github.com/ARM-software/acle/
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- hwy/detect_targets.h | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/hwy/detect_targets.h b/hwy/detect_targets.h
-index 2beca95..40ae7fe 100644
---- a/hwy/detect_targets.h
-+++ b/hwy/detect_targets.h
-@@ -154,6 +154,16 @@
-      (defined(__BYTE_ORDER) && __BYTE_ORDER == __BIG_ENDIAN))
- #define HWY_BROKEN_TARGETS (HWY_NEON)
- 
-+// armv7-a without a detected vfpv4 is not supported
-+// (for example Cortex-A8, Cortex-A9)
-+// vfpv4 always have neon half-float _and_ FMA.
-+#elif HWY_ARCH_ARM_V7 && \
-+    (__ARM_ARCH_PROFILE == 'A') && \
-+    !defined(__ARM_VFPV4__) && \
-+        !((__ARM_NEON_FP & 0x2 /* half-float */) && \
-+          (__ARM_FEATURE_FMA == 1))
-+#define HWY_BROKEN_TARGETS (HWY_NEON)
-+
- // SVE[2] require recent clang or gcc versions.
- #elif (HWY_COMPILER_CLANG && HWY_COMPILER_CLANG < 1100) || \
-     (HWY_COMPILER_GCC_ACTUAL && HWY_COMPILER_GCC_ACTUAL < 1000)
--- 
-2.39.2
-
diff --git a/package/highway/highway.hash b/package/highway/highway.hash
index 16a9282176..55b1bca774 100644
--- a/package/highway/highway.hash
+++ b/package/highway/highway.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  566fc77315878473d9a6bd815f7de78c73734acdcb745c3dde8579560ac5440e  highway-1.0.3.tar.gz
+sha256  5434488108186c170a5e2fca5e3c9b6ef59a1caa4d520b008a9b8be6b8abe6c5  highway-1.0.7.tar.gz
 sha256  43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1  LICENSE
diff --git a/package/highway/highway.mk b/package/highway/highway.mk
index 56d63a83f9..692794959a 100644
--- a/package/highway/highway.mk
+++ b/package/highway/highway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIGHWAY_VERSION = 1.0.3
+HIGHWAY_VERSION = 1.0.7
 HIGHWAY_SITE = $(call github,google,highway,$(HIGHWAY_VERSION))
 HIGHWAY_LICENSE = Apache-2.0
 HIGHWAY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
