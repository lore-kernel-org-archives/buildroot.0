Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A061CD98D2
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F3B9826EF;
	Thu, 13 Nov 2025 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRPXqV-zEhfo; Thu, 13 Nov 2025 19:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D713E826F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D713E826F5;
	Thu, 13 Nov 2025 19:45:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C05DC158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 19:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A33D2826F5
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 19:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6CFas9Rs2nG for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 19:45:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.41;
 helo=mail-wr1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 57E81826EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57E81826EF
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57E81826EF
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 19:45:44 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-42b427cda88so881768f8f.0
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 11:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763063142; x=1763667942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cq8T6Kk13p0ETjoSZlZD3cH55nqQrOa4aLOl+Jit/+I=;
 b=JHcWwMG2HOwVc6V5Nd0hWolGdvng4GGD50vo4c0T3Iw9mdMBQiX6Gi2aaCKkzsLw4g
 ViHEqDF0mo6mepez1HniL1eovfhQJSJ96aoKJVv9h04LxB8xBWhgPdv9P1d+Y96nfanM
 VWTdsw7uWSkhNFEIjPLEuh0tnu0ZVKqWF+555vy+lewYoIXb1tumYSJ32bU/5IaxAdzC
 gLld+P6rO6+lGIvqEcM7eo60PHjgdgRvpLCIKbvfxdecaNjIJi2CEgzG5BaAPnnLpyhT
 fviKbAAH1GqwPpDk+WeR67WAzlbQhb0d1BOF7oqjR1AJLGV9jLdKvCisO+nHzEetSy/1
 hJiw==
X-Gm-Message-State: AOJu0YyEfVVQnVi+xd8wCsOJEa6equapTnC2FIaEWLwRUBP4KW8LSTom
 vF/jZLLN9JOP7wYUdJ/fhSOrQQAy4Ysl+pdK48CTpJt9i9ml5AK7xMUy2UNdNg==
X-Gm-Gg: ASbGncuouIcg38NhsRzqnzmT4nzBu8niD2q2LlOuDHMkrJIkaG+JJb/Tvv89E2xzp7H
 tdAHj9nRhYcfENM/qDMts2bzq0cQ3rOr3XQLDuj0Ky+fhzJonpqrNdAdq4Z9Llsxk7RPLj4HFbG
 9oZvmH0+ZpUgqw8bp7biovFBJ+PuPIWm91rVagAvUjqxyHOMgXy0b5YxoOmIc8uh2wKEOL8KLLy
 y7a90L/0cScsj+3KaSLPAYljpAtXPKWVLr782g0ywXY84jIONLhQ/+UjgIeWRbQ4LVuhTiS9aCI
 uH+VUCeHOfCZDGgB5otxsaawSZmqs1Pop8mZ5Ho9y9d9/TNKn5pG++ql49Bja2j1jghUKOg8i4z
 2LwyHSBEBuSbpAl2mVJSXw4Qz96Ew28vDx65AkZ1lp5ph5bx1RoE4WfbyG6tWX3errDdx/58MGT
 pYA/EYwgKVytkuPMAzbsqro9ZVzw==
X-Google-Smtp-Source: AGHT+IF7MfIIRESK3+F/uDR6lftyzVY05MVtnMqCR8eU9OwABI3aG2bLdrzS+vVa4bmXhIcilfT7aw==
X-Received: by 2002:a05:6000:430e:b0:42b:3c3e:5d2f with SMTP id
 ffacd0b85a97d-42b593678aamr506461f8f.39.1763063141796; 
 Thu, 13 Nov 2025 11:45:41 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:eb6f:7900:662:2f09:9a6c:22b9])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42b53dea1c9sm5809143f8f.0.2025.11.13.11.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 11:45:41 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Tudor Holton <buildroot@tudorholton.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Thu, 13 Nov 2025 20:45:38 +0100
Message-ID: <20251113194539.439372-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/openjdk: allow compiling without X11
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

Added two patches (17.0.12+7 and 21.0.4+7) to allow compilation
without X11 support. We can anyway do this since we are
compiling with --enable-headless-only.

This commit also fixes the wrong patch folders which
should have been fixed in commit 475c79d
"package/openjdk{-bin}: bump versions to 17.0.12+7 and 21.0.4+7"

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 ...ARCv2-ISA-processors-support-to-Zero.patch | 18 ++--
 ...fix-HEADLESS-compilation-without-X11.patch | 82 +++++++++++++++++++
 ...ARCv2-ISA-processors-support-to-Zero.patch | 20 ++---
 ...fix-HEADLESS-compilation-without-X11.patch | 82 +++++++++++++++++++
 package/openjdk/Config.in                     | 11 ---
 package/openjdk/openjdk.mk                    |  6 +-
 6 files changed, 184 insertions(+), 35 deletions(-)
 rename package/openjdk/{17.0.9+9 => 17.0.12+7}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (87%)
 create mode 100644 package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
 rename package/openjdk/{21.0.1+12 => 21.0.4+7}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (88%)
 create mode 100644 package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch

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
index 0000000000..a7eb551a65
--- /dev/null
+++ b/package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
@@ -0,0 +1,82 @@
+From 8050a10ca44a20cc1a770be235701e315809bcbd Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Thu, 13 Nov 2025 17:23:44 +0100
+Subject: [PATCH] awt: fix HEADLESS compilation without X11
+
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
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
index 0000000000..9da914484e
--- /dev/null
+++ b/package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
@@ -0,0 +1,82 @@
+From 38b0585952c18b884e844ffc6fd33cd934502553 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Thu, 13 Nov 2025 17:23:44 +0100
+Subject: [PATCH] awt: fix HEADLESS compilation without X11
+
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
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
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 78775370ca..5fb36c78e0 100644
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
@@ -42,10 +41,6 @@ config BR2_PACKAGE_OPENJDK
 	select BR2_PACKAGE_LCMS2
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_XLIB_LIBXRANDR
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_ZLIB
 	help
 	  OpenJDK is a free and open-source implementation of the
@@ -155,12 +150,6 @@ config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
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
index 446e4aa3c2..f59eb69782 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -18,7 +18,7 @@ OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 OPENJDK_INSTALL_STAGING = YES
 
-# OpenJDK requires Alsa, cups, and X11 even for a headless build.
+# OpenJDK requires Alsa and cups,
 # host-zip is needed for the zip executable.
 OPENJDK_DEPENDENCIES = \
 	host-gawk \
@@ -34,10 +34,6 @@ OPENJDK_DEPENDENCIES = \
 	lcms2 \
 	libpng \
 	libusb \
-	xlib_libXrandr \
-	xlib_libXrender \
-	xlib_libXt \
-	xlib_libXtst \
 	zlib
 
 # JVM variants
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
