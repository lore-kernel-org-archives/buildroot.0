Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFCBC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 17:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC93611F9;
	Mon,  6 Nov 2023 17:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEC93611F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3CM2WcO4reF; Mon,  6 Nov 2023 17:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69978611ED;
	Mon,  6 Nov 2023 17:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69978611ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68F0F1BF215
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 17:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F4F4611ED
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 17:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F4F4611ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDUx9uD7jSym for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 17:43:29 +0000 (UTC)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C874A60B5A
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 17:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C874A60B5A
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-1cc3bb32b5dso43231385ad.3
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 09:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699292609; x=1699897409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8HH2BSQCyzvYe7Pb0QHyfx90Y4Lp3PNfmGzC2FUGQxM=;
 b=vJgSF0/io6SrNfW41QWJkIfdJey2YTwOpgV40Wz/PrzKQZdGoT8yxA0bQfcXLDRyIr
 uqFH9NkVkuzzt3tbuvvsyN1rxmExQ6rbPBUO1Q4qrmsoxtr30lGt1e9T/HSF8M776B1I
 a/FONzEpi5fgb4SpOfAeMHc75qq/oz72H43uPqz2vTKP8htl9wCKB1af8r8/66Pbdn0S
 c+1XaAEJXRlTDk0Akcf0Agvxd5Gvi2hz4i3u1rUnSdAGN/dkRyZvP7v67rPawKSo8qOV
 YxyPWAPc6gWs9sUW2g/2p3+vV3/nYTEHBD68SgpYfSJkVBW2hWFcKL6NFdDn3dophoUL
 tAxA==
X-Gm-Message-State: AOJu0YyLm5vqaOB3bD2/rZrpqntKI82n9WIZTfCvkOJZO6Fr1KnrweLw
 IhQb2s6bsMjluYEMIv6SaufCaUip9XhSyDga+E5DIwvAQ0w=
X-Google-Smtp-Source: AGHT+IGhWl3mofj3DtTLsqnJJEY4lvwOrg3fDysY+Hpb1f+rvX33vjayX23ZL62+ahup6xaourrrFw==
X-Received: by 2002:a17:902:d4c4:b0:1cc:bfb4:2db8 with SMTP id
 o4-20020a170902d4c400b001ccbfb42db8mr8186722plg.55.1699292608639; 
 Mon, 06 Nov 2023 09:43:28 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170902744700b001bba7aab822sm6172190plt.5.2023.11.06.09.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 09:43:28 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 10:43:25 -0700
Message-ID: <20231106174325.733746-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699292609; x=1699897409;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8HH2BSQCyzvYe7Pb0QHyfx90Y4Lp3PNfmGzC2FUGQxM=;
 b=rPBIoo+edQ6SefhlxaTr/bK4ON4GQIn3Ya+i7euag6TwDq/IeAQbUc8I9+gs/xZWCE
 TROW4dzs+6+GPRnEXNb8L8POY0h71FY2SBS+DS9cwGemsdra+CAvORTNFqaBm+Cv1RYW
 pIpYHpgfJY+cbXeW4nqnOFoDmhTKsNY/IVs2g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rPBIoo+e
Subject: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: bump versions to
 17.0.9+9 and 21.0.1+12
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Move openjdk-bin.hash into separate directories, as the
  legal/java.prefs/ASSEMBLY_EXCEPTION file has an upated URL for OpenJDK 21.
  openjdk.java.net -> https://openjdk.org. The license type remains the same.

- Move 0001-Add-ARCv2-ISA-processors-support-to-Zero.patch into separate
  directories as the list of architectures in src/hotspot/os/linux/os_linux.cpp
  is no longer the same. 17 has LOONGARCH and 21 has LOONGARCH64.

Tested on Fedora39 and Debian 11 with:
./support/testing/run-tests tests.package.test_openjdk.TestOpenJdk.test_run

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openjdk-bin/17.0.9_9/openjdk-bin.hash |   7 ++
 .../openjdk-bin/21.0.1_12/openjdk-bin.hash    |   7 ++
 package/openjdk-bin/openjdk-bin.hash          |  11 --
 package/openjdk-bin/openjdk-bin.mk            |   7 +-
 ...ARCv2-ISA-processors-support-to-Zero.patch |  18 +--
 ...ARCv2-ISA-processors-support-to-Zero.patch | 109 ++++++++++++++++++
 package/openjdk/openjdk.hash                  |   4 +-
 package/openjdk/openjdk.mk                    |   8 +-
 8 files changed, 140 insertions(+), 31 deletions(-)
 create mode 100644 package/openjdk-bin/17.0.9_9/openjdk-bin.hash
 create mode 100644 package/openjdk-bin/21.0.1_12/openjdk-bin.hash
 delete mode 100644 package/openjdk-bin/openjdk-bin.hash
 rename package/openjdk/{ => 17.0.9+9}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (86%)
 create mode 100644 package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch

diff --git a/package/openjdk-bin/17.0.9_9/openjdk-bin.hash b/package/openjdk-bin/17.0.9_9/openjdk-bin.hash
new file mode 100644
index 0000000000..29f39c5d36
--- /dev/null
+++ b/package/openjdk-bin/17.0.9_9/openjdk-bin.hash
@@ -0,0 +1,7 @@
+# https://github.com/adoptium/temurin17-binaries/releases
+sha256  7b175dbe0d6e3c9c23b6ed96449b018308d8fc94a5ecd9c0df8b8bc376c3c18a  OpenJDK17U-jdk_x64_linux_hotspot_17.0.9_9.tar.gz
+sha256  e2c5e26f8572544b201bc22a9b28f2b1a3147ab69be111cea07c7f52af252e75  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.9_9.tar.gz
+
+# Locally calculated
+sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
+sha256  a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/21.0.1_12/openjdk-bin.hash b/package/openjdk-bin/21.0.1_12/openjdk-bin.hash
new file mode 100644
index 0000000000..35be28bb4f
--- /dev/null
+++ b/package/openjdk-bin/21.0.1_12/openjdk-bin.hash
@@ -0,0 +1,7 @@
+# From https://github.com/adoptium/temurin21-binaries/releases
+sha256  1a6fa8abda4c5caed915cfbeeb176e7fbd12eb6b222f26e290ee45808b529aa1  OpenJDK21U-jdk_x64_linux_hotspot_21.0.1_12.tar.gz
+sha256  e184dc29a6712c1f78754ab36fb48866583665fa345324f1a79e569c064f95e9  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.1_12.tar.gz
+
+# Locally calculated
+sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
+sha256  75292f03bf23d3db7c985aecc191029b93883200721ed23ed34a2e601463df33  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
deleted file mode 100644
index 1bd33d3d7a..0000000000
--- a/package/openjdk-bin/openjdk-bin.hash
+++ /dev/null
@@ -1,11 +0,0 @@
-# From https://github.com/adoptium/temurin21-binaries/releases
-sha256  82f64c53acaa045370d6762ebd7441b74e6fda14b464d54d1ff8ca941ec069e6  OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz
-sha256  33e440c237438aa2e3866d84ead8d4e00dc0992d98d9fd0ee2fe48192f2dbc4b  OpenJDK21U-jdk_aarch64_linux_hotspot_21_35.tar.gz
-
-# https://github.com/adoptium/temurin17-binaries/releases
-sha256  c25dfbc334068a48c19c44ce39ad4b8427e309ae1cfa83f23c102e78b8a6dcc0  OpenJDK17U-jdk_x64_linux_hotspot_17.0.8.1_1.tar.gz
-sha256  eefd3cf3b3dd47ff269fa5b5c10b5e096b163f4e9c1810023abdbc00dc6cc304  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8.1_1.tar.gz
-
-# Locally calculated
-sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
-sha256  a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 05d95dbbc0..0280151fba 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,12 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
-HOST_OPENJDK_BIN_VERSION_MINOR = 35
-HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_12
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.8.1_1
-HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.9_9
 endif
 
 ifeq ($(HOSTARCH),x86_64)
@@ -21,6 +19,7 @@ ifeq ($(HOSTARCH),aarch64)
 HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = aarch64
 endif
 
+HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
diff --git a/package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 86%
rename from package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
index a8ea5aff65..afec2772c0 100644
--- a/package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+++ b/package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -23,8 +23,8 @@ diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
 index 5120918aed2..f7a99955874 100644
 --- a/make/autoconf/libraries.m4
 +++ b/make/autoconf/libraries.m4
-@@ -146,6 +146,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
-     fi
+@@ -152,6 +152,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -latomic"
    fi
  
 +  # Libatomic library
@@ -55,8 +55,8 @@ index c0f2446dbd7..dc416ece885 100644
      arm*)
        VAR_CPU=arm
        VAR_CPU_ARCH=arm
-@@ -563,6 +569,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
-     HOTSPOT_$1_CPU_DEFINE=PPC64
+@@ -565,6 +571,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
+     HOTSPOT_$1_CPU_DEFINE=RISCV64
  
    # The cpu defines below are for zero, we don't support them directly.
 +  elif test "x$OPENJDK_$1_CPU" = xarc; then
@@ -68,7 +68,7 @@ diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.c
 index b08caf4d5d3..2bf084895ba 100644
 --- a/src/hotspot/os/linux/os_linux.cpp
 +++ b/src/hotspot/os/linux/os_linux.cpp
-@@ -1676,6 +1676,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1721,6 +1721,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
  #ifndef EM_AARCH64
    #define EM_AARCH64    183               /* ARM AARCH64 */
  #endif
@@ -78,7 +78,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #ifndef EM_RISCV
    #define EM_RISCV      243               /* RISC-V */
  #endif
-@@ -1700,6 +1703,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1745,6 +1748,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
      {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
  #endif
      {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
@@ -86,7 +86,7 @@ index b08caf4d5d3..2bf084895ba 100644
      // we only support 64 bit z architecture
      {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
      {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
-@@ -1728,6 +1732,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1773,6 +1777,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_PPC;
  #elif  (defined AARCH64)
    static  Elf32_Half running_arch_code=EM_AARCH64;
@@ -95,12 +95,12 @@ index b08caf4d5d3..2bf084895ba 100644
  #elif  (defined ARM)
    static  Elf32_Half running_arch_code=EM_ARM;
  #elif  (defined S390)
-@@ -1750,7 +1756,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1795,7 +1801,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_LOONGARCH;
  #else
      #error Method os::dll_load requires that one of following is defined:\
 -        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
-+        AARCH64, ALPHA, ARC ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
++        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
  #endif
  
    // Identify compatibility class for VM's architecture and library's architecture
diff --git a/package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
new file mode 100644
index 0000000000..6c46ec7b42
--- /dev/null
+++ b/package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -0,0 +1,109 @@
+From 9a3c2a0714420186ae8d5159d5416c6fa2009ad9 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Mon, 18 Oct 2021 05:20:05 -0700
+Subject: [PATCH] Add ARCv2 ISA processors support to Zero
+
+This adds ARCv2 processors support in OpenJDK via
+"Zero Assembly Project" (see https://openjdk.java.net/projects/zero).
+
+That' a purely interpretive mode, so likely not that fast
+as JIT'ed version, but for starters it's much better than nothing.
+
+Once all the logistical problems are solved hopefully this
+change will be accepted upstream.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ make/autoconf/libraries.m4        | 8 ++++++++
+ make/autoconf/platform.m4         | 8 ++++++++
+ src/hotspot/os/linux/os_linux.cpp | 8 +++++++-
+ 3 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
+index 5120918aed2..f7a99955874 100644
+--- a/make/autoconf/libraries.m4
++++ b/make/autoconf/libraries.m4
+@@ -163,6 +163,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lrt"
+   fi
+ 
++  # Libatomic library
++  # 32-bit ARC needs fallback library for 8-byte atomic ops
++  # Inspired by a fix for MIPS, see https://github.com/openjdk/jdk/commit/1b3aa3af
++  if test "x$OPENJDK_TARGET_OS" = xlinux &&
++      (test "x$OPENJDK_TARGET_CPU" = xarc); then
++    BASIC_JVM_LIBS="$BASIC_JVM_LIBS -latomic"
++  fi
++
+   # perfstat lib
+   if test "x$OPENJDK_TARGET_OS" = xaix; then
+     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lperfstat"
+diff --git a/make/autoconf/platform.m4 b/make/autoconf/platform.m4
+index c0f2446dbd7..dc416ece885 100644
+--- a/make/autoconf/platform.m4
++++ b/make/autoconf/platform.m4
+@@ -54,6 +54,12 @@ AC_DEFUN([PLATFORM_EXTRACT_VARS_FROM_CPU],
+       VAR_CPU_BITS=64
+       VAR_CPU_ENDIAN=little
+       ;;
++    arc)
++      VAR_CPU=arc
++      VAR_CPU_ARCH=arc
++      VAR_CPU_BITS=32
++      VAR_CPU_ENDIAN=little
++      ;;
+     arm*)
+       VAR_CPU=arm
+       VAR_CPU_ARCH=arm
+@@ -571,6 +577,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
+     HOTSPOT_$1_CPU_DEFINE=RISCV64
+ 
+   # The cpu defines below are for zero, we don't support them directly.
++  elif test "x$OPENJDK_$1_CPU" = xarc; then
++    HOTSPOT_$1_CPU_DEFINE=ARC
+   elif test "x$OPENJDK_$1_CPU" = xsparc; then
+     HOTSPOT_$1_CPU_DEFINE=SPARC
+   elif test "x$OPENJDK_$1_CPU" = xppc; then
+diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.cpp
+index b08caf4d5d3..2bf084895ba 100644
+--- a/src/hotspot/os/linux/os_linux.cpp
++++ b/src/hotspot/os/linux/os_linux.cpp
+@@ -1653,6 +1653,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+ #ifndef EM_AARCH64
+   #define EM_AARCH64    183               /* ARM AARCH64 */
+ #endif
++#ifndef EM_ARC_COMPACT2
++  #define EM_ARC_COMPACT2 195             /* ARC ARCv2 ISA */
++#endif
+ #ifndef EM_RISCV
+   #define EM_RISCV      243               /* RISC-V */
+ #endif
+@@ -1677,6 +1680,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+     {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
+ #endif
+     {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
++    {EM_ARC_COMPACT2, EM_ARC_COMPACT2, ELFCLASS32, ELFDATA2LSB, (char*)"ARC"},
+     // we only support 64 bit z architecture
+     {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
+     {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
+@@ -1709,6 +1713,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+   static  Elf32_Half running_arch_code=EM_PPC;
+ #elif  (defined AARCH64)
+   static  Elf32_Half running_arch_code=EM_AARCH64;
++#elif  (defined ARC)
++  static  Elf32_Half running_arch_code=EM_ARC_COMPACT2;
+ #elif  (defined ARM)
+   static  Elf32_Half running_arch_code=EM_ARM;
+ #elif  (defined S390)
+@@ -1731,7 +1737,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+   static  Elf32_Half running_arch_code=EM_LOONGARCH;
+ #else
+     #error Method os::dll_load requires that one of following is defined:\
+-        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, LOONGARCH64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
++        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, IA64, LOONGARCH64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
+ #endif
+ 
+   // Identify compatibility class for VM's architecture and library's architecture
+-- 
+2.16.2
+
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 76d419f255..949a62e527 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b798ebc2e899a98edf2be99e786bb0fbad144e2270925dffe624fbe052f07ade  openjdk-21+35.tar.gz
-sha256  e57251d8306911282b6f0a2f721431dab5f87c99cce0930fc062e690f7c77f04  openjdk-17.0.8.1+1.tar.gz
+sha256  9943e3814d3c1a31f1449f09a8b67df54841944f855a1d372be892c5e6b19217  openjdk-21.0.1+12.tar.gz
+sha256  836adb5fec5a58ce2f49a0faeaf9e69a3cb89865f4d855c6098f0264843672ad  openjdk-17.0.9+9.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index e3e63e2382..f4e1920e6c 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,14 +6,12 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
-OPENJDK_VERSION_MINOR = 35
-OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
+OPENJDK_VERSION_MINOR = 0.1+12
 else
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.8.1+1
-OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
+OPENJDK_VERSION_MINOR = 0.9+9
 endif
-
+OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
 
 OPENJDK_LICENSE = GPL-2.0+ with exception
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
