Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE84C77B7A
	for <buildroot@archiver.kernel.org>; Thu, 18 May 2023 21:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3D3184543;
	Thu, 18 May 2023 21:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3D3184543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tSVagzGCYHwH; Thu, 18 May 2023 21:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA7BB84527;
	Thu, 18 May 2023 21:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA7BB84527
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21BDC1BF319
 for <buildroot@lists.busybox.net>; Thu, 18 May 2023 21:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED55D42949
 for <buildroot@lists.busybox.net>; Thu, 18 May 2023 21:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED55D42949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y8TrRLwGsXmE for <buildroot@lists.busybox.net>;
 Thu, 18 May 2023 21:07:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D0EB42923
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D0EB42923
 for <buildroot@buildroot.org>; Thu, 18 May 2023 21:07:50 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1ae615d5018so12729085ad.1
 for <buildroot@buildroot.org>; Thu, 18 May 2023 14:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684444069; x=1687036069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mArka8YbanvMtmFF3zvA79N4WTBzf22D8JpqLBV4Cpk=;
 b=fQTfOYhOUUEO+hqwuhk60OzC5sDWwxdZrMYqLpiw6Mo/Gc1OkGbreI0O7E8ZGyfgKY
 oS8vZv+6n5eNnKOLkOcOuCnW8XDlLbgrP0xeWoyJuJk+xFiy5Cld/d1dZtXRoqjGr3VZ
 UnO8CVxHbnNLo/u3hnBa2Qtj1OXa/8RjZVhet2Tx0SOk+/GOy+FQBGXUQ0EjWknm+GRX
 9OibWz0gT6J/FtytHsSocPB8/rbVxh8xdIttXYOt2HgAucLsAlfM4g3CsRDB0VRWobx+
 qH8XabBpYkI5rY10gfYEaDNC4Esr8tcrdxvwy2SQeljmTS7Eq07DxD8iKQkCUfq/fXZr
 O5aA==
X-Gm-Message-State: AC+VfDyXdVmg//7UyP89hRrUaYBdBf1wIcAKOCxKlMGq5CfqYaJBmi+L
 eLvRI8jB411tTA5ztOPK5vV2UFugigpvhg==
X-Google-Smtp-Source: ACHHUZ6f80u4bwmgKTsjoNcV+3edDT6pgZ0rOSF2LIl+aqWeU8nB7AFu78hbC3qECupOUOOyV/KZDQ==
X-Received: by 2002:a17:902:7289:b0:1ac:6084:1f4 with SMTP id
 d9-20020a170902728900b001ac608401f4mr457070pll.27.1684444069299; 
 Thu, 18 May 2023 14:07:49 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::75c4])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902744400b001a0448731c2sm1915246plt.47.2023.05.18.14.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 14:07:48 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 May 2023 14:07:47 -0700
Message-Id: <20230518210747.728594-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684444069; x=1687036069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mArka8YbanvMtmFF3zvA79N4WTBzf22D8JpqLBV4Cpk=;
 b=qHBoNWhCqSoOyhKfXWWuSZ9B1yfU82m8MELloD6q5m6upOGZfD9NDDQv9Y9AAeZGSy
 RbI5f8oXXIeEfOei6n6UaBLnjJgM9yn8Jzv7SRK3oAHQ0D/GZ2Ru9ErHHSI6hh5J7iv6
 xvj86DbBj2KT+30cNozcOstMSrF9qeoB2Nd7b+PydT/sCf3j0P1dR3u998WNA+JXorlr
 9QZ18k5BgSU18pmfbOVmd5jErsifLJuS8PvAabteUSfq9gg4IQvfO1dawDuo7UahaXC7
 e8WCa7nHGFB8eUSFEpM7jK93YoADaoXsVieqxiyXgvs0XD6wVxmbYH5D9feStNz1d6WP
 f3Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qHBoNWhC
Subject: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: bump versions to
 11.0.19+7 and 17.0.7+7
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
 package/openjdk-bin/openjdk-bin.hash                      | 8 ++++----
 package/openjdk-bin/openjdk-bin.mk                        | 4 ++--
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch   | 8 ++++----
 package/openjdk/openjdk.hash                              | 4 ++--
 package/openjdk/openjdk.mk                                | 4 ++--
 5 files changed, 14 insertions(+), 14 deletions(-)
 rename package/openjdk/{17.0.6+10 => 17.0.7+7}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (94%)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 241ca34a04..eb9d7396e3 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,10 +1,10 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  a0b1b9dd809d51a438f5fa08918f9aca7b2135721097f0858cf29f77a35d4289  OpenJDK17U-jdk_x64_linux_hotspot_17.0.6_10.tar.gz
-sha256  9e0e88bbd9fa662567d0c1e22d469268c68ac078e9e5fe5a7244f56fec71f55f  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.6_10.tar.gz
+sha256  e9458b38e97358850902c2936a1bb5f35f6cffc59da9fcd28c63eab8dbbfbc3b  OpenJDK17U-jdk_x64_linux_hotspot_17.0.7_7.tar.gz
+sha256  0084272404b89442871e0a1f112779844090532978ad4d4191b8d03fc6adfade  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.7_7.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
-sha256  4a29efda1d702b8ff38e554cf932051f40ec70006caed5c4857a8cbc7a0b7db7  OpenJDK11U-jdk_x64_linux_hotspot_11.0.18_10.tar.gz
-sha256  04d5eeff6a6449bcdca0f52cd97bafd43ce09d40ef1e73fa0e1add63bea4a9c8  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.18_10.tar.gz
+sha256  5f19fb28aea3e28fcc402b73ce72f62b602992d48769502effe81c52ca39a581  OpenJDK11U-jdk_x64_linux_hotspot_11.0.19_7.tar.gz
+sha256  0c7763a19b4af4ef5fbae831781b5184e988d6f131d264482399eeaf51b6e254  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.19_7.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index c3eb0b05e6..dad846534b 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.6_10
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.7_7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.18_10
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.19_7
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 94%
rename from package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
index dfd3b07bea..a8ea5aff65 100644
--- a/package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+++ b/package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -68,7 +68,7 @@ diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.c
 index b08caf4d5d3..2bf084895ba 100644
 --- a/src/hotspot/os/linux/os_linux.cpp
 +++ b/src/hotspot/os/linux/os_linux.cpp
-@@ -1674,6 +1674,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1676,6 +1676,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
  #ifndef EM_AARCH64
    #define EM_AARCH64    183               /* ARM AARCH64 */
  #endif
@@ -78,7 +78,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #ifndef EM_RISCV
    #define EM_RISCV      243               /* RISC-V */
  #endif
-@@ -1698,6 +1701,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1700,6 +1703,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
      {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
  #endif
      {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
@@ -86,7 +86,7 @@ index b08caf4d5d3..2bf084895ba 100644
      // we only support 64 bit z architecture
      {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
      {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
-@@ -1726,6 +1730,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1728,6 +1732,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_PPC;
  #elif  (defined AARCH64)
    static  Elf32_Half running_arch_code=EM_AARCH64;
@@ -95,7 +95,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #elif  (defined ARM)
    static  Elf32_Half running_arch_code=EM_ARM;
  #elif  (defined S390)
-@@ -1748,7 +1754,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1750,7 +1756,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_LOONGARCH;
  #else
      #error Method os::dll_load requires that one of following is defined:\
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 0a67e7a3ec..3b36289628 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  331bad1f80e98761eb9692863146fec647db573db5a5efa5b9bd6326d53a3472  openjdk-17.0.6+10.tar.gz
-sha256  04af71fc7adda41a49861870f9ec0ac0f059c2cf9393ce32995ea8ef4279a1b1  openjdk-11.0.18+10.tar.gz
+sha256  43b80a5aec5fce908e80858e9b34efdf1b49255a12ce303650325af65141d3e8  openjdk-17.0.7+7.tar.gz
+sha256  25fd9ab3042a284aa4e6348969403016404bc2706a4a02c149a0054fbe477337  openjdk-11.0.19+7.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 0fe506bbfd..39d461a87c 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.6+10
+OPENJDK_VERSION_MINOR = 0.7+7
 else
 OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.18+10
+OPENJDK_VERSION_MINOR = 0.19+7
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
