Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23AFCEB2D8
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 13:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B1984013;
	Sat, 15 Nov 2025 13:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFYTOIo2bMBU; Sat, 15 Nov 2025 13:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0029B84014
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0029B84014;
	Sat, 15 Nov 2025 13:57:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23997158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 13:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14C9384014
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 13:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIRF-dtGNOX5 for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 13:57:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.41;
 helo=mail-wr1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B834C84013
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B834C84013
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B834C84013
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 13:57:40 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-42bb288c17bso404745f8f.2
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 05:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763215059; x=1763819859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kfp2qbiEpu6JFm7OrhCN0MqbYRUDkr92VLaN1drQO+0=;
 b=r0SpywgURd/GyTWVJnciE3ubI/YfqVutk5PW0p64E/06c5eqlU+CSc9RF/fO0grc5Y
 5wSJziUV8pM/91l60qjkq1WkNKI60YPSeaVnCYWIwnPDxbroYambjBdultZ5w6SL+NXk
 5Cu09DFlnHK3HWlTo2lZViIQqNuB5uz6ANNQ/gQix3hMzc1ywehpgeYH3+s4do58+omx
 zhmnCNq06gG4mNxNXobdIxGMmI/hAa6j6kN0pBcC3zI8ly/De6vQIxmeQ7Euuld3KfFx
 GSiQVAsMeWMOjEsrWGYh57SyLpTSh18iSLEL00INeJg0DfhTKKNdXDpCf/XaIOY7QVz6
 DTRg==
X-Gm-Message-State: AOJu0Yy/EZMFv9aTToGID6iaCnMZCNWD43zzi01+QIa/PeNZs/xy2ZUl
 oTm593FQN89KYtaHWXwOD6SEl3wZV2KrGmY1GQFrkMFlg8B2LK1xaKFN
X-Gm-Gg: ASbGncs3/aX21u5l2Y8KEOtjYOA+3T0bmk1QfDrWBQT4zj/hnHyZBW99s2FCCvKQkzh
 V9RHBt5TGtyGNMg8GXgMkcvOdWRaK+aTd3SfzONYxP/FM4EA1repUuQBDe2rYgi6kgFy/8DU/yf
 NK5KZ/acIcqpNAtqkCKSjRGtAx0W54s/z4IhrH1sFSqKsi2B2glRFOgn48PjOjRMQtbSjFCDXoT
 3ha0NjoLZn6Url4u0JzaNDw+yMolTOClBQ83rSQMBQrMEie0YmPjQcdSY1o/1p+X05qz/bGS3Bq
 4aOcMrLR99t9ozkLT1eDrGtlVhyHty5FPE/pRrr7BrOPTKtGre45bmItQi9t2vSv+j/ntqe8HSA
 ZnX0CYy5jv+R+zpW+4FhKv9w4y1KaHWvFXhEt6mu5KYMQeXcswAOfAQpPLwgXNDf0oZynYue7Aa
 s3HLAG0w903SFQvxEa/0wZGUoyhG/fIR2qi4nrMA==
X-Google-Smtp-Source: AGHT+IFHqYTUsC8/qQoAnmOXtSFwY1afSLtw1TyAnMW9Ei5MvWVCrsjykXmcgy0INg43YpqBIHD91A==
X-Received: by 2002:a5d:5850:0:b0:42b:2a09:2e59 with SMTP id
 ffacd0b85a97d-42b592c6797mr6064846f8f.0.1763215058451; 
 Sat, 15 Nov 2025 05:57:38 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb6f:7900:c7f8:99c7:69e0:edb4])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42b53e84b12sm16918384f8f.15.2025.11.15.05.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 05:57:38 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, buildroot@tudorholton.com,
 thomas.devoogdt@barco.com
Date: Sat, 15 Nov 2025 14:57:34 +0100
Message-ID: <20251115135734.1532379-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113194539.439372-1-thomas@devoogdt.com>
References: <20251113194539.439372-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/openjdk: allow compiling without X11
 support
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Added patches (17.0.12+7 and 21.0.4+7) to allow compilation
without X11 support.

0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
is only needed for 21.0.4+7, 17.0.12+7 has this commit:
https://github.com/openjdk/jdk17u/commit/f97ec359ec688346956c29002edb28703d3ba032

Next to that, add a new option BR2_PACKAGE_OPENJDK_HEADLESS,
to allow compilation with both head and headless support.

This commit also fixes the wrong patch folders which
should have been fixed in commit 475c79d
"package/openjdk{-bin}: bump versions to 17.0.12+7 and 21.0.4+7"

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 ...ARCv2-ISA-processors-support-to-Zero.patch | 18 ++--
 ...fix-HEADLESS-compilation-without-X11.patch | 83 +++++++++++++++++++
 ...ARCv2-ISA-processors-support-to-Zero.patch | 20 ++---
 ...fix-HEADLESS-compilation-without-X11.patch | 83 +++++++++++++++++++
 ...es-drop-the-need-for-X11-in-headless.patch | 35 ++++++++
 package/openjdk/Config.in                     | 21 +++--
 package/openjdk/openjdk.mk                    | 14 ++--
 7 files changed, 238 insertions(+), 36 deletions(-)
 rename package/openjdk/{17.0.9+9 => 17.0.12+7}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (87%)
 create mode 100644 package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
 rename package/openjdk/{21.0.1+12 => 21.0.4+7}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (88%)
 create mode 100644 package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
 create mode 100644 package/openjdk/21.0.4+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch

diff --git a/package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 87%
rename from package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
index afec2772c0..c4dda78fde 100644
--- a/package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+++ b/package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -1,4 +1,4 @@
-From 9a3c2a0714420186ae8d5159d5416c6fa2009ad9 Mon Sep 17 00:00:00 2001
+From edf96f51d2c6d6e7a7762a879b916a5e58d8c23c Mon Sep 17 00:00:00 2001
 From: Alexey Brodkin <abrodkin@synopsys.com>
 Date: Mon, 18 Oct 2021 05:20:05 -0700
 Subject: [PATCH] Add ARCv2 ISA processors support to Zero
@@ -20,11 +20,11 @@ Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
  3 files changed, 23 insertions(+), 1 deletion(-)
 
 diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
-index 5120918aed2..f7a99955874 100644
+index 865feea36d9..30c224e4a99 100644
 --- a/make/autoconf/libraries.m4
 +++ b/make/autoconf/libraries.m4
-@@ -152,6 +152,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
-     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -latomic"
+@@ -146,6 +146,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+     fi
    fi
  
 +  # Libatomic library
@@ -39,7 +39,7 @@ index 5120918aed2..f7a99955874 100644
    if test "x$OPENJDK_TARGET_OS" = xaix; then
      BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lperfstat"
 diff --git a/make/autoconf/platform.m4 b/make/autoconf/platform.m4
-index c0f2446dbd7..dc416ece885 100644
+index eb66266262b..3ca94b351b2 100644
 --- a/make/autoconf/platform.m4
 +++ b/make/autoconf/platform.m4
 @@ -54,6 +54,12 @@ AC_DEFUN([PLATFORM_EXTRACT_VARS_FROM_CPU],
@@ -65,7 +65,7 @@ index c0f2446dbd7..dc416ece885 100644
      HOTSPOT_$1_CPU_DEFINE=SPARC
    elif test "x$OPENJDK_$1_CPU" = xppc; then
 diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.cpp
-index b08caf4d5d3..2bf084895ba 100644
+index 63b7562f118..58b43241df4 100644
 --- a/src/hotspot/os/linux/os_linux.cpp
 +++ b/src/hotspot/os/linux/os_linux.cpp
 @@ -1721,6 +1721,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
@@ -99,11 +99,11 @@ index b08caf4d5d3..2bf084895ba 100644
    static  Elf32_Half running_arch_code=EM_LOONGARCH;
  #else
      #error Method os::dll_load requires that one of following is defined:\
--        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
-+        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
+-        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, LOONGARCH64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
++        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, IA64, LOONGARCH64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
  #endif
  
    // Identify compatibility class for VM's architecture and library's architecture
 -- 
-2.16.2
+2.43.0
 
diff --git a/package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
new file mode 100644
index 0000000000..183f667dea
--- /dev/null
+++ b/package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
@@ -0,0 +1,83 @@
+From 8df09bb41f8aec8904a2231facc76660d2a83236 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Thu, 13 Nov 2025 17:23:44 +0100
+Subject: [PATCH] awt: fix HEADLESS compilation without X11
+
+Upstream: https://github.com/openjdk/jdk/pull/28310
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ make/modules/java.desktop/lib/Awt2dLibraries.gmk | 16 ++++++++++++++--
+ .../unix/native/common/awt/utility/rect.h        |  4 ++--
+ 2 files changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/make/modules/java.desktop/lib/Awt2dLibraries.gmk b/make/modules/java.desktop/lib/Awt2dLibraries.gmk
+index 46e3b1677f7..0e92ce6aeca 100644
+--- a/make/modules/java.desktop/lib/Awt2dLibraries.gmk
++++ b/make/modules/java.desktop/lib/Awt2dLibraries.gmk
+@@ -77,6 +77,10 @@ ifeq ($(call isTargetOs, windows), true)
+       #
+ endif
+ 
++ifeq ($(ENABLE_HEADLESS_ONLY), true)
++  LIBAWT_CFLAGS += -DHEADLESS
++endif
++
+ ifeq ($(call isTargetOs, linux macosx aix), true)
+   LIBAWT_EXFILES += awt_Font.c CUPSfuncs.c fontpath.c X11Color.c
+ endif
+@@ -362,13 +366,20 @@ ifeq ($(call isTargetOs, windows macosx), false)
+       $(TOPDIR)/src/$(MODULE)/$(OPENJDK_TARGET_OS_TYPE)/native/common/awt \
+       #
+ 
+-  LIBAWT_HEADLESS_EXCLUDES := medialib
++  LIBAWT_HEADLESS_EXCLUDES := medialib opengl
++
++  LIBAWT_HEADLESS_EXCLUDE_FILES := \
++      GLXGraphicsConfig.c \
++      GLXSurfaceData.c \
++      X11PMBlitLoops.c \
++      X11Renderer.c \
++      X11SurfaceData.c \
++      #
+ 
+   LIBAWT_HEADLESS_EXTRA_HEADER_DIRS := \
+       $(LIBAWT_DEFAULT_HEADER_DIRS) \
+       common/awt/debug \
+       common/font \
+-      common/java2d/opengl \
+       #
+ 
+   LIBAWT_HEADLESS_CFLAGS := $(CUPS_CFLAGS) $(FONTCONFIG_CFLAGS) $(X_CFLAGS) \
+@@ -378,6 +389,7 @@ ifeq ($(call isTargetOs, windows macosx), false)
+       NAME := awt_headless, \
+       EXTRA_SRC := $(LIBAWT_HEADLESS_EXTRA_SRC), \
+       EXCLUDES := $(LIBAWT_HEADLESS_EXCLUDES), \
++      EXCLUDE_FILES := $(LIBAWT_HEADLESS_EXCLUDE_FILES), \
+       OPTIMIZATION := LOW, \
+       CFLAGS := $(CFLAGS_JDKLIB) \
+           $(LIBAWT_HEADLESS_CFLAGS), \
+diff --git a/src/java.desktop/unix/native/common/awt/utility/rect.h b/src/java.desktop/unix/native/common/awt/utility/rect.h
+index ceea38f4349..91b5a17ec58 100644
+--- a/src/java.desktop/unix/native/common/awt/utility/rect.h
++++ b/src/java.desktop/unix/native/common/awt/utility/rect.h
+@@ -28,7 +28,7 @@
+ #ifndef _AWT_RECT_H
+ #define _AWT_RECT_H
+ 
+-#ifndef MACOSX
++#if !defined(HEADLESS) && !defined(MACOSX)
+ #include <X11/Xlib.h>
+ typedef XRectangle RECT_T;
+ #else
+@@ -39,7 +39,7 @@ typedef struct {
+     int width;
+     int height;
+ } RECT_T;
+-#endif /* !MACOSX */
++#endif /* !HEADLESS && !MACOSX */
+ 
+ #define RECT_EQ_X(r1,r2)        ((r1).x==(r2).x && (r1).width==(r2).width)
+ 
+-- 
+2.43.0
+
diff --git a/package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 88%
rename from package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
index 6c46ec7b42..89ec2996d3 100644
--- a/package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+++ b/package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -1,4 +1,4 @@
-From 9a3c2a0714420186ae8d5159d5416c6fa2009ad9 Mon Sep 17 00:00:00 2001
+From c990ac56c441682b65a3dc699a753e1d924b40d1 Mon Sep 17 00:00:00 2001
 From: Alexey Brodkin <abrodkin@synopsys.com>
 Date: Mon, 18 Oct 2021 05:20:05 -0700
 Subject: [PATCH] Add ARCv2 ISA processors support to Zero
@@ -20,10 +20,10 @@ Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
  3 files changed, 23 insertions(+), 1 deletion(-)
 
 diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
-index 5120918aed2..f7a99955874 100644
+index 51d4f724c33..41844933a14 100644
 --- a/make/autoconf/libraries.m4
 +++ b/make/autoconf/libraries.m4
-@@ -163,6 +163,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+@@ -157,6 +157,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
      BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lrt"
    fi
  
@@ -39,7 +39,7 @@ index 5120918aed2..f7a99955874 100644
    if test "x$OPENJDK_TARGET_OS" = xaix; then
      BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lperfstat"
 diff --git a/make/autoconf/platform.m4 b/make/autoconf/platform.m4
-index c0f2446dbd7..dc416ece885 100644
+index df610cc489b..2e21572ba4d 100644
 --- a/make/autoconf/platform.m4
 +++ b/make/autoconf/platform.m4
 @@ -54,6 +54,12 @@ AC_DEFUN([PLATFORM_EXTRACT_VARS_FROM_CPU],
@@ -65,10 +65,10 @@ index c0f2446dbd7..dc416ece885 100644
      HOTSPOT_$1_CPU_DEFINE=SPARC
    elif test "x$OPENJDK_$1_CPU" = xppc; then
 diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.cpp
-index b08caf4d5d3..2bf084895ba 100644
+index 492300a37d4..3a10790f4a0 100644
 --- a/src/hotspot/os/linux/os_linux.cpp
 +++ b/src/hotspot/os/linux/os_linux.cpp
-@@ -1653,6 +1653,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1663,6 +1663,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
  #ifndef EM_AARCH64
    #define EM_AARCH64    183               /* ARM AARCH64 */
  #endif
@@ -78,7 +78,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #ifndef EM_RISCV
    #define EM_RISCV      243               /* RISC-V */
  #endif
-@@ -1677,6 +1680,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1687,6 +1690,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
      {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
  #endif
      {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
@@ -86,7 +86,7 @@ index b08caf4d5d3..2bf084895ba 100644
      // we only support 64 bit z architecture
      {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
      {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
-@@ -1709,6 +1713,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1719,6 +1723,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_PPC;
  #elif  (defined AARCH64)
    static  Elf32_Half running_arch_code=EM_AARCH64;
@@ -95,7 +95,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #elif  (defined ARM)
    static  Elf32_Half running_arch_code=EM_ARM;
  #elif  (defined S390)
-@@ -1731,7 +1737,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1741,7 +1747,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_LOONGARCH;
  #else
      #error Method os::dll_load requires that one of following is defined:\
@@ -105,5 +105,5 @@ index b08caf4d5d3..2bf084895ba 100644
  
    // Identify compatibility class for VM's architecture and library's architecture
 -- 
-2.16.2
+2.43.0
 
diff --git a/package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
new file mode 100644
index 0000000000..5bb59a0bdd
--- /dev/null
+++ b/package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
@@ -0,0 +1,83 @@
+From 13a908b3d192e477b7572b522837efd771f5e2f9 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Thu, 13 Nov 2025 17:23:44 +0100
+Subject: [PATCH] awt: fix HEADLESS compilation without X11
+
+Upstream: https://github.com/openjdk/jdk/pull/28310
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ make/modules/java.desktop/lib/Awt2dLibraries.gmk | 16 ++++++++++++++--
+ .../unix/native/common/awt/utility/rect.h        |  4 ++--
+ 2 files changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/make/modules/java.desktop/lib/Awt2dLibraries.gmk b/make/modules/java.desktop/lib/Awt2dLibraries.gmk
+index a33f219e83e..de57e88a4ce 100644
+--- a/make/modules/java.desktop/lib/Awt2dLibraries.gmk
++++ b/make/modules/java.desktop/lib/Awt2dLibraries.gmk
+@@ -77,6 +77,10 @@ ifeq ($(call isTargetOs, windows), true)
+       #
+ endif
+ 
++ifeq ($(ENABLE_HEADLESS_ONLY), true)
++  LIBAWT_CFLAGS += -DHEADLESS
++endif
++
+ ifeq ($(call isTargetOs, linux macosx aix), true)
+   LIBAWT_EXFILES += awt_Font.c CUPSfuncs.c fontpath.c X11Color.c
+ endif
+@@ -368,13 +372,20 @@ ifeq ($(call isTargetOs, windows macosx), false)
+       $(TOPDIR)/src/$(MODULE)/$(OPENJDK_TARGET_OS_TYPE)/native/common/awt \
+       #
+ 
+-  LIBAWT_HEADLESS_EXCLUDES := medialib
++  LIBAWT_HEADLESS_EXCLUDES := medialib opengl
++
++  LIBAWT_HEADLESS_EXCLUDE_FILES := \
++      GLXGraphicsConfig.c \
++      GLXSurfaceData.c \
++      X11PMBlitLoops.c \
++      X11Renderer.c \
++      X11SurfaceData.c \
++      #
+ 
+   LIBAWT_HEADLESS_EXTRA_HEADER_DIRS := \
+       $(LIBAWT_DEFAULT_HEADER_DIRS) \
+       common/awt/debug \
+       common/font \
+-      common/java2d/opengl \
+       #
+ 
+   LIBAWT_HEADLESS_CFLAGS := $(CUPS_CFLAGS) $(FONTCONFIG_CFLAGS) $(X_CFLAGS) \
+@@ -384,6 +395,7 @@ ifeq ($(call isTargetOs, windows macosx), false)
+       NAME := awt_headless, \
+       EXTRA_SRC := $(LIBAWT_HEADLESS_EXTRA_SRC), \
+       EXCLUDES := $(LIBAWT_HEADLESS_EXCLUDES), \
++      EXCLUDE_FILES := $(LIBAWT_HEADLESS_EXCLUDE_FILES), \
+       OPTIMIZATION := LOW, \
+       CFLAGS := $(CFLAGS_JDKLIB) \
+           $(LIBAWT_HEADLESS_CFLAGS), \
+diff --git a/src/java.desktop/unix/native/common/awt/utility/rect.h b/src/java.desktop/unix/native/common/awt/utility/rect.h
+index ceea38f4349..91b5a17ec58 100644
+--- a/src/java.desktop/unix/native/common/awt/utility/rect.h
++++ b/src/java.desktop/unix/native/common/awt/utility/rect.h
+@@ -28,7 +28,7 @@
+ #ifndef _AWT_RECT_H
+ #define _AWT_RECT_H
+ 
+-#ifndef MACOSX
++#if !defined(HEADLESS) && !defined(MACOSX)
+ #include <X11/Xlib.h>
+ typedef XRectangle RECT_T;
+ #else
+@@ -39,7 +39,7 @@ typedef struct {
+     int width;
+     int height;
+ } RECT_T;
+-#endif /* !MACOSX */
++#endif /* !HEADLESS && !MACOSX */
+ 
+ #define RECT_EQ_X(r1,r2)        ((r1).x==(r2).x && (r1).width==(r2).width)
+ 
+-- 
+2.43.0
+
diff --git a/package/openjdk/21.0.4+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch b/package/openjdk/21.0.4+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
new file mode 100644
index 0000000000..bb182fa2b9
--- /dev/null
+++ b/package/openjdk/21.0.4+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
@@ -0,0 +1,35 @@
+From 46b9a0ad24f7f299ff23e13bc8ef01c188d246b6 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Thu, 13 Nov 2025 23:10:20 +0100
+Subject: [PATCH] autoconf: libraries: drop the need for X11 in headless mode
+
+Upstream: https://github.com/openjdk/jdk/pull/28310
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ make/autoconf/libraries.m4 | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
+index 51d4f724c33..6a8b925c3f2 100644
+--- a/make/autoconf/libraries.m4
++++ b/make/autoconf/libraries.m4
+@@ -42,12 +42,12 @@ m4_include([lib-tests.m4])
+ AC_DEFUN_ONCE([LIB_DETERMINE_DEPENDENCIES],
+ [
+   # Check if X11 is needed
+-  if test "x$OPENJDK_TARGET_OS" = xwindows || test "x$OPENJDK_TARGET_OS" = xmacosx; then
+-    # No X11 support on windows or macosx
++  if test "x$OPENJDK_TARGET_OS" = xwindows ||
++     test "x$OPENJDK_TARGET_OS" = xmacosx ||
++     test "x$ENABLE_HEADLESS_ONLY" = xtrue; then
+     NEEDS_LIB_X11=false
+   else
+-    # All other instances need X11, even if building headless only, libawt still
+-    # needs X11 headers.
++    # All other instances need X11 for libawt.
+     NEEDS_LIB_X11=true
+   fi
+ 
+-- 
+2.43.0
+
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 78775370ca..539cdf273f 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -29,7 +29,6 @@ config BR2_PACKAGE_OPENJDK
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_USE_MMU # cups
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_ALSA_LIB_PCM
@@ -42,10 +41,10 @@ config BR2_PACKAGE_OPENJDK
 	select BR2_PACKAGE_LCMS2
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_XLIB_LIBXRANDR
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_ZLIB
 	help
 	  OpenJDK is a free and open-source implementation of the
@@ -71,6 +70,12 @@ config BR2_PACKAGE_OPENJDK_VERSION_21
 
 endchoice
 
+config BR2_PACKAGE_OPENJDK_HEADLESS
+	bool "Headless mode"
+	default y if !BR2_PACKAGE_XORG7
+	help
+	  Compile JDK without AWT support.
+
 config BR2_PACKAGE_OPENJDK_FULL_JDK
 	bool "Build the full JDK"
 	help
@@ -155,12 +160,6 @@ config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
 endchoice
 endif
 
-comment "openjdk needs X.Org"
-	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
-	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_XORG7
-
 comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 6868ca191d..c4436ae4d4 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -21,7 +21,7 @@ OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 OPENJDK_INSTALL_STAGING = YES
 
-# OpenJDK requires Alsa, cups, and X11 even for a headless build.
+# OpenJDK requires Alsa and cups,
 # host-zip is needed for the zip executable.
 OPENJDK_DEPENDENCIES = \
 	host-gawk \
@@ -37,10 +37,6 @@ OPENJDK_DEPENDENCIES = \
 	lcms2 \
 	libpng \
 	libusb \
-	xlib_libXrandr \
-	xlib_libXrender \
-	xlib_libXt \
-	xlib_libXtst \
 	zlib
 
 # JVM variants
@@ -88,7 +84,6 @@ OPENJDK_CONF_OPTS = \
 	--disable-full-docs \
 	--disable-manpages \
 	--disable-warnings-as-errors \
-	--enable-headless-only \
 	--enable-openjdk-only \
 	--enable-unlimited-crypto \
 	--openjdk-target=$(GNU_TARGET_NAME) \
@@ -112,6 +107,13 @@ OPENJDK_CONF_OPTS = \
 	--with-version-build="$(OPENJDK_VERSION_BUILD)" \
 	--with-version-string="$(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)"
 
+ifeq ($(BR2_PACKAGE_OPENJDK_HEADLESS),y)
+OPENJDK_CONF_OPTS += --enable-headless-only
+else
+OPENJDK_CONF_OPTS += --disable-headless-only
+OPENJDK_DEPENDENCIES += xlib_libXrandr xlib_libXrender xlib_libXt xlib_libXtst
+endif
+
 # If building for AArch64, use the provided CPU port.
 ifeq ($(BR2_aarch64),y)
 OPENJDK_CONF_OPTS += --with-abi-profile=aarch64
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
