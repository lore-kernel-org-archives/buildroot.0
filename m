Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FB4C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 22:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0715C8122E;
	Wed, 15 Feb 2023 22:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0715C8122E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQaMQisfc6Dr; Wed, 15 Feb 2023 22:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E3E181231;
	Wed, 15 Feb 2023 22:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E3E181231
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04B611BF476
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D27A260767
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D27A260767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1Xz7HPcoMYa for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 22:47:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F37B8600B4
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F37B8600B4
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 22:47:15 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id b5so218066plz.5
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 14:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LrxoDi8lQy8/WK4JFqD/y+xh4I73z1HLgicuA5/HBgk=;
 b=fnvhzkIIAiKTMblcB8NsT7dva/xdL8fjGHoXrQoQW0tzWJ2NFc/T8/UdMdNtib/+2/
 +jwUwXIbJ7Gl9+FSpLQ8VgSpDZq82WHIZvSqFTN5rhauEMaYI+Zw4ekd2l+8pM+MFJ+4
 3t/t8oTBuJmI7pJ4MOA10gtI6gWYUihoJQ1Q4B/7pNJXdGwZW+gCAHRqZKrUpLd8Eb8v
 foDSuE92TZ6SBfrr2t2Jhui///itkXLrn1DYqUse7i4SQFxIzMrMesjgTiLvKL6IQMyA
 C+93nOIBww7DZtYclDuKkD11MIdElC4rqNWGqp0WKCOds4a9HE8bPwVCxfISuY7BWLkU
 KPhQ==
X-Gm-Message-State: AO0yUKVQKo+JcCExvH8DHOi+70F2Pblw7NIn+ddmxUAkR2s9QcKj7jdf
 i3+APURcR7DkmG9pW+xpfcf/rGGcwjZzQg==
X-Google-Smtp-Source: AK7set9oSvgVxb8rBulGXlvW7npXdqi6s+pE3hKZuRHFbQLBZJap2ciFTYItMQEIUpAbqpNbQbgBgA==
X-Received: by 2002:a17:90b:4f88:b0:233:f909:366f with SMTP id
 qe8-20020a17090b4f8800b00233f909366fmr4729662pjb.33.1676501234379; 
 Wed, 15 Feb 2023 14:47:14 -0800 (PST)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:2f70::1599])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a17090a65c400b002347475e71fsm380499pjs.14.2023.02.15.14.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 14:47:13 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 14:47:12 -0800
Message-Id: <20230215224712.487272-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LrxoDi8lQy8/WK4JFqD/y+xh4I73z1HLgicuA5/HBgk=;
 b=fFhTL3qEk1A1z10w02XycreJUNjw0e5WSfhgN7EuVjXZs9jdrNeCySrGumVsUQOtgV
 QseGLQYL++0lUZe4LliGEnLXDfvDpdaQmoKQo2XrQRjKm1Ne4e/Q8sytn7QryHwePnlB
 F0NyunM2E7BlqId4X55IqsWcfIibWuwPS4tIc7Tt54uS3SlxmkJdVNhOMWDusd/js/Bj
 LfUEZrBagihbxcBzdAai2mdM2uk2tZefUuXwoQTnYxaCSp5rOF92dsj26GFXTkK3ec/v
 J5+PE8UURfpST8zEec/ZDt9KQb22X9hych7wXFLNR1/PJrSQtXBdVDjlcSKKP2iRX1QZ
 jKOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fFhTL3qE
Subject: [Buildroot] [PATCH v2 1/1] package/openjdk{-bin}: bump versions to
 11.0.18+10 and 17.0.6+10
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
Cc: Tudor Holton <buildroot@tudorholton.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
v1 -> v2: Add missing openjdk-bin updates

 package/openjdk-bin/openjdk-bin.hash          |  8 ++++----
 package/openjdk-bin/openjdk-bin.mk            |  4 ++--
 ...ARCv2-ISA-processors-support-to-Zero.patch | 20 +++++++++----------
 package/openjdk/openjdk.hash                  |  4 ++--
 package/openjdk/openjdk.mk                    |  4 ++--
 5 files changed, 20 insertions(+), 20 deletions(-)
 rename package/openjdk/{17.0.1+12 => 17.0.6+10}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (83%)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 4d3942125f..241ca34a04 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,10 +1,10 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  288f34e3ba8a4838605636485d0365ce23e57d5f2f68997ac4c2e4c01967cd48  OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz
-sha256  302caf29f73481b2b914ba2b89705036010c65eb9bc8d7712b27d6e9bedf6200  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8.tar.gz
+sha256  a0b1b9dd809d51a438f5fa08918f9aca7b2135721097f0858cf29f77a35d4289  OpenJDK17U-jdk_x64_linux_hotspot_17.0.6_10.tar.gz
+sha256  9e0e88bbd9fa662567d0c1e22d469268c68ac078e9e5fe5a7244f56fec71f55f  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.6_10.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
-sha256  43fb84f8063ad9bf6b6d694a67b8f64c8827552b920ec5ce794dfe5602edffe7  OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz
-sha256  79572f5172c6a040591d34632f98a20ed148702bbce2f57649e8ac01c0d2e3db  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1.tar.gz
+sha256  4a29efda1d702b8ff38e554cf932051f40ec70006caed5c4857a8cbc7a0b7db7  OpenJDK11U-jdk_x64_linux_hotspot_11.0.18_10.tar.gz
+sha256  04d5eeff6a6449bcdca0f52cd97bafd43ce09d40ef1e73fa0e1add63bea4a9c8  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.18_10.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 608a0bc3ac..c3eb0b05e6 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.2_8
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.6_10
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.14.1_1
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.18_10
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/17.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 83%
rename from package/openjdk/17.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
index 1ef523a419..dfd3b07bea 100644
--- a/package/openjdk/17.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+++ b/package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -23,8 +23,8 @@ diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
 index 5120918aed2..f7a99955874 100644
 --- a/make/autoconf/libraries.m4
 +++ b/make/autoconf/libraries.m4
-@@ -122,6 +122,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
-     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lpthread"
+@@ -146,6 +146,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+     fi
    fi
  
 +  # Libatomic library
@@ -55,7 +55,7 @@ index c0f2446dbd7..dc416ece885 100644
      arm*)
        VAR_CPU=arm
        VAR_CPU_ARCH=arm
-@@ -478,6 +484,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
+@@ -563,6 +569,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
      HOTSPOT_$1_CPU_DEFINE=PPC64
  
    # The cpu defines below are for zero, we don't support them directly.
@@ -68,7 +68,7 @@ diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.c
 index b08caf4d5d3..2bf084895ba 100644
 --- a/src/hotspot/os/linux/os_linux.cpp
 +++ b/src/hotspot/os/linux/os_linux.cpp
-@@ -1858,6 +1858,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1674,6 +1674,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
  #ifndef EM_AARCH64
    #define EM_AARCH64    183               /* ARM AARCH64 */
  #endif
@@ -78,7 +78,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #ifndef EM_RISCV
    #define EM_RISCV      243               /* RISC-V */
  #endif
-@@ -1879,6 +1882,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1698,6 +1701,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
      {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
  #endif
      {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
@@ -86,7 +86,7 @@ index b08caf4d5d3..2bf084895ba 100644
      // we only support 64 bit z architecture
      {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
      {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
-@@ -1906,6 +1910,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1726,6 +1730,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_PPC;
  #elif  (defined AARCH64)
    static  Elf32_Half running_arch_code=EM_AARCH64;
@@ -95,12 +95,12 @@ index b08caf4d5d3..2bf084895ba 100644
  #elif  (defined ARM)
    static  Elf32_Half running_arch_code=EM_ARM;
  #elif  (defined S390)
-@@ -1926,7 +1932,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
-   static  Elf32_Half running_arch_code=EM_RISCV;
+@@ -1748,7 +1754,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+   static  Elf32_Half running_arch_code=EM_LOONGARCH;
  #else
      #error Method os::dll_load requires that one of following is defined:\
--        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
-+        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, IA64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
+-        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
++        AARCH64, ALPHA, ARC ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
  #endif
  
    // Identify compatibility class for VM's architecture and library's architecture
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 293787792d..0a67e7a3ec 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2fdd23261526362d4aaf58323441d4c31d29de2e374ba94bbf2727a00adc0ea7  openjdk-17.0.2+8.tar.gz
-sha256  0e859cc03378439023e17ee82aecee5a52265fb38906a8bebf16027aa2b2bcf5  openjdk-11.0.14.1+1.tar.gz
+sha256  331bad1f80e98761eb9692863146fec647db573db5a5efa5b9bd6326d53a3472  openjdk-17.0.6+10.tar.gz
+sha256  04af71fc7adda41a49861870f9ec0ac0f059c2cf9393ce32995ea8ef4279a1b1  openjdk-11.0.18+10.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 42d52d57c4..0fe506bbfd 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.2+8
+OPENJDK_VERSION_MINOR = 0.6+10
 else
 OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.14.1+1
+OPENJDK_VERSION_MINOR = 0.18+10
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
