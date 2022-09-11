Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33C1ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 10:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00F44415A6;
	Sun, 11 Sep 2022 10:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00F44415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NlEJKNOzbfJL; Sun, 11 Sep 2022 10:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92E1141759;
	Sun, 11 Sep 2022 10:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92E1141759
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 217091BF5F5
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 10:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F008A61053
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 10:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F008A61053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHgENG19AERi for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 10:51:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ACE96102C
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ACE96102C
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 10:51:19 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e20so10868643wri.13
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 03:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=eSjTuXR8FwAwqIwNtmB2yOr3Kic3pi3se1HCn3reIws=;
 b=yegvsAgKrv/a+4tmCA+BhLD8510ZjTNxaZ/fRYIxqm2+aU8K2RMqj31lyhTsHUP8xi
 lVB35VhphQhgFzVQW1Pc0O7iFU6wZPYWDZF4bfRefZGczr1OAaoidFrwv9SE+JdGj5kA
 +di+dKxOF6AobMC42od8R0PcYGIKGrMbLccUkZqGUv6C5d2tSV0KeReaIuva2ewIWLPY
 kpObBKP9SvHxz2d8gKip9ud/31o90uDXRsSRc8MgpT+qunwba1GYPOoj4anCoANZZ0GN
 0ecI490kEmdPD0bipgMa2ePDloxbtQCVLyKdSmpAGBQl9+iMi8EnJP+vIB/qejGvBeyT
 adnQ==
X-Gm-Message-State: ACgBeo2kX1RzLRfCKaOowfqoQgXr9pivIbZ7F1hLkA+6TQmCwF3q9qqA
 xa7Y9W5l5x3/nuWg/8qytMh/4fJKbCI=
X-Google-Smtp-Source: AA6agR61H9evcQGbfocHj+8OU1KBpBRTwW8tjbbHcdUdyIF0zitN9sE2VWylLNfyt0LKW4Figpusuw==
X-Received: by 2002:a5d:5d89:0:b0:226:e5ca:4bc2 with SMTP id
 ci9-20020a5d5d89000000b00226e5ca4bc2mr12439336wrb.310.1662893477298; 
 Sun, 11 Sep 2022 03:51:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i81-20020a1c3b54000000b003a8418ee646sm6218503wma.12.2022.09.11.03.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 03:51:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 12:51:08 +0200
Message-Id: <20220911105108.22189-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=eSjTuXR8FwAwqIwNtmB2yOr3Kic3pi3se1HCn3reIws=;
 b=Zg8HHsWUZSuKtnmmC7TBO9VWgQCehOmo5KzmQnhCGDh1d5ghUqXLWcylpcghdblLiC
 rFt2k6P9oabOo/loLjthmJ4LSRD35IniVMDzW3cYw+02XC0QgG9fhq1AM+mMBTzXC/np
 6vP5Y1vKHTGZqCRlMH/KehRRO7ktlXNitdk18W5o9WnPJOUiuL9vh8BFkGv1d8ZrgcXC
 smuFMElaQWsKV7tlwmmJ0GE9Q+N9amTOmV16zhDjORjy/GsO3ZlsTf2h5Nso+tUvfXVh
 NIzBbefaf/VxvW7D7fb7++AUAeZV5DIK3b4tY0YoYZIFT5PCdrGTbciVAMtP2PGK3vUY
 XEjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Zg8HHsWU
Subject: [Buildroot] [PATCH 1/1] package/flac: bump to version 1.4.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release fixes a lot of bugs found by fuzzing, and fuzzing coverage
has improved much. Also, compression should be better but a little
slower. Speedups for 64-bit ARM have been implemented. Encoding and
decoding 32 bps PCM is now possible.

- Drop sha1 (not provided anymore)
- Drop patch (already in version) and so autoreconf
- Update hash of COPYING.Xiph (year updated with:
  https://github.com/xiph/flac/commit/10d7ce268b758b7cf62c3663338f180370a9a415)

https://github.com/xiph/flac/releases/tag/1.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flac/0001-Fix-uclibc-build.patch | 81 ------------------------
 package/flac/flac.hash                   |  6 +-
 package/flac/flac.mk                     |  5 +-
 3 files changed, 3 insertions(+), 89 deletions(-)
 delete mode 100644 package/flac/0001-Fix-uclibc-build.patch

diff --git a/package/flac/0001-Fix-uclibc-build.patch b/package/flac/0001-Fix-uclibc-build.patch
deleted file mode 100644
index fcba670fae..0000000000
--- a/package/flac/0001-Fix-uclibc-build.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 4c62082f64132bfcbcb6569aa914c5ec283303f9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 21 Feb 2022 18:21:11 +0100
-Subject: [PATCH] Fix uclibc build
-
-Commit 4fbb6d4f2ecf2a96c17ea9880108409f852c08a9 reverted commit
-44036c9a9b45d03373fe90e9c112852bfc054c51 and so broke again the build on
-uclibc
-
-So put back the sys/auxv.h check as well as a getauxval check in a way
-that doesn't break iOS
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/xiph/flac/pull/292]
----
- configure.ac      | 5 ++++-
- src/libFLAC/cpu.c | 9 ++++-----
- 2 files changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4d7dc2e4..6f32fa45 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -69,7 +69,7 @@ AC_C_INLINE
- AC_C_VARARRAYS
- AC_C_TYPEOF
- 
--AC_CHECK_HEADERS([stdint.h inttypes.h byteswap.h sys/param.h sys/ioctl.h termios.h x86intrin.h cpuid.h])
-+AC_CHECK_HEADERS([stdint.h inttypes.h byteswap.h sys/auxv.h sys/param.h sys/ioctl.h termios.h x86intrin.h cpuid.h])
- 
- XIPH_C_BSWAP32
- XIPH_C_BSWAP16
-@@ -101,6 +101,9 @@ fi
- # For the XMMS plugin.
- AC_CHECK_TYPES(socklen_t, [], [])
- 
-+dnl check for getauxval in standard library
-+AC_CHECK_FUNCS(getauxval)
-+
- dnl check for getopt in standard library
- dnl AC_CHECK_FUNCS(getopt_long , , [LIBOBJS="$LIBOBJS getopt.o getopt1.o"] )
- AC_CHECK_FUNCS(getopt_long, [], [])
-diff --git a/src/libFLAC/cpu.c b/src/libFLAC/cpu.c
-index 8b92f4c7..64c6acad 100644
---- a/src/libFLAC/cpu.c
-+++ b/src/libFLAC/cpu.c
-@@ -53,11 +53,9 @@
- #define dfprintf(file, format, ...)
- #endif
- 
--#if defined FLAC__CPU_PPC
--#if defined(__linux__) || (defined(__FreeBSD__) && (__FreeBSD__ >= 12))
-+#if defined(HAVE_SYS_AUXV_H)
- #include <sys/auxv.h>
- #endif
--#endif
- 
- #if (defined FLAC__CPU_IA32 || defined FLAC__CPU_X86_64) && (defined FLAC__HAS_NASM || FLAC__HAS_X86INTRIN) && !defined FLAC__NO_ASM
- 
-@@ -247,7 +245,7 @@ ppc_cpu_info (FLAC__CPUInfo *info)
- #define PPC_FEATURE2_ARCH_2_07		0x80000000
- #endif
- 
--#ifdef __linux__
-+#if defined (__linux__) && defined(HAVE_GETAUXVAL)
- 	if (getauxval(AT_HWCAP2) & PPC_FEATURE2_ARCH_3_00) {
- 		info->ppc.arch_3_00 = true;
- 	} else if (getauxval(AT_HWCAP2) & PPC_FEATURE2_ARCH_2_07) {
-@@ -267,7 +265,8 @@ ppc_cpu_info (FLAC__CPUInfo *info)
- 	info->ppc.arch_2_07 = false;
- 	info->ppc.arch_3_00 = false;
- #else
--#error Unsupported platform! Please add support for reading ppc hwcaps.
-+	info->ppc.arch_2_07 = false;
-+	info->ppc.arch_3_00 = false;
- #endif
- 
- #else
--- 
-2.34.1
-
diff --git a/package/flac/flac.hash b/package/flac/flac.hash
index 2444535e0f..1f7763fd6e 100644
--- a/package/flac/flac.hash
+++ b/package/flac/flac.hash
@@ -1,8 +1,6 @@
-# From https://ftp.osuosl.org/pub/xiph/releases/flac/SHA1SUMS
-sha1  99c28482a8b2d81deaf740639e4cb55658427420  flac-1.3.4.tar.xz
 # From http://downloads.xiph.org/releases/flac/SHA256SUMS.txt
-sha256  8ff0607e75a322dd7cd6ec48f4f225471404ae2730d0ea945127b1355155e737  flac-1.3.4.tar.xz
+sha256  af41c0733c93c237c3e52f64dd87e3b0d9af38259f1c7d11e8cbf583c48c2506  flac-1.4.0.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
-sha256  fa27cb11f13f97b0c5f3ff363b1e2610c6efe87ed175779cb2a78e44eb19d34c  COPYING.Xiph
+sha256  6e58d3036f05e2a0d58af854c12a505ddbe75011d71a598a2170987f3b15408d  COPYING.Xiph
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 27fc63e2c2..91d5840d72 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.3.4
+FLAC_VERSION = 1.4.0
 FLAC_SITE = http://downloads.xiph.org/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
@@ -13,9 +13,6 @@ FLAC_LICENSE = Xiph BSD-like (libFLAC), GPL-2.0+ (tools), LGPL-2.1+ (other libra
 FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
 FLAC_CPE_ID_VENDOR = flac_project
 
-# patch touching configure.ac
-FLAC_AUTORECONF = YES
-
 FLAC_CONF_OPTS = \
 	$(if $(BR2_POWERPC_CPU_HAS_ALTIVEC),--enable-altivec,--disable-altivec) \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
