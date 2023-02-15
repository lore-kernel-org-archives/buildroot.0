Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66311C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 22:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBDFD81EDA;
	Wed, 15 Feb 2023 22:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBDFD81EDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2dtm1ix5dPJ; Wed, 15 Feb 2023 22:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC42A81355;
	Wed, 15 Feb 2023 22:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC42A81355
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A31AE1BF476
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CACC81099
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CACC81099
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1yViigdJzmA for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 22:43:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF54381004
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF54381004
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 22:43:04 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 78so98524pgb.8
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 14:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XfJBKbZHLDvLnDTFPz2dNR8D/AzwhSd+8l1zrz8/9ZU=;
 b=UUWDRhpZeKeWXTmDtwsk1Ml5VNRdsJcJHqwHCt0jsT43PqaueAiAJsvfr7OlNHEDxK
 8UYEOzDo6zQo6iVhw082J4WHjT02W9sCqhQbdMg1bfzYBZJcTPNDMmntCAhJUIUD416Z
 1ACO2jxigxhzycumpErFbpf5NW4FpxDd64Qh+Gia6ZdL7PK4nhyQm/YjSST9Ntb4ySgc
 Lg4Gxs6vUjfULV2Fn8QhbQZ5Pm0qloQgirn7nXWUHujGxJ/TDsbxbvEHyLjRHO6+i8Oc
 mw0pQZSQmFyGEc/YHqHHawLF2HBEiIGsWy58RpLfH/FRjhCUgLsv629agdeSerkkbRjJ
 f/kg==
X-Gm-Message-State: AO0yUKXQdxKL1Rx8exBa4OZFE5Wb2t88P4cbraM8TS/lGNwDRmhJE+zG
 M298HRY/pMlFFe+tA9z/Xit5pAThw/zDaw==
X-Google-Smtp-Source: AK7set/mzM6yfB+DNVIKrEwdU4ewsP12AdYfK+G223Z/T8urOyxtSXOecjLWpmWynjqgyfWIoM7EfQ==
X-Received: by 2002:a05:6a00:330a:b0:5a8:d38a:c6c4 with SMTP id
 cq10-20020a056a00330a00b005a8d38ac6c4mr86726pfb.14.1676500983489; 
 Wed, 15 Feb 2023 14:43:03 -0800 (PST)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:2f70::1599])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a62ae16000000b005a8aab9ae7esm7163575pff.216.2023.02.15.14.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 14:43:02 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 14:43:00 -0800
Message-Id: <20230215224300.486258-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XfJBKbZHLDvLnDTFPz2dNR8D/AzwhSd+8l1zrz8/9ZU=;
 b=lzlDMGMAWyzVdBP1lL1y+nnbZ2meh0Pn9A8xSxYZwMud6JKeM53H4POCZo1IYW5OY1
 LkVRGyPY54kTSi56JEk6kZ1Iwh4Mh7y6+BsrH+J6CrZI8cqM2jXUTC/pT/edHNvp7l0z
 ismFd3Wq6zt5iWouWDz/upex8qXEiF6RLPjuaKSU2217PjP69gabyJ1Dnxod+APM2Qxq
 j7rAUcc3efG2T0jb9jwP1YN2XP5EGMW1fX9RyAd4Pibp1gm+qY9q61yVRtqiuaq4slES
 alJF1ZCXnovi11w/WAFRr6hjBd9n0AcyJutc3Q4u3UW5Xi8Z/71952tHkVb/3OK3nod3
 h9MA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lzlDMGMA
Subject: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: bump versions to
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
 ...ARCv2-ISA-processors-support-to-Zero.patch | 20 +++++++++----------
 package/openjdk/openjdk.hash                  |  4 ++--
 package/openjdk/openjdk.mk                    |  4 ++--
 3 files changed, 14 insertions(+), 14 deletions(-)
 rename package/openjdk/{17.0.1+12 => 17.0.6+10}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (83%)

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
