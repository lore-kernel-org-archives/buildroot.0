Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F440C4167B
	for <buildroot@archiver.kernel.org>; Thu,  7 Dec 2023 19:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E75F981343;
	Thu,  7 Dec 2023 19:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E75F981343
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1DH4wTDjjTq; Thu,  7 Dec 2023 19:05:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C6838134D;
	Thu,  7 Dec 2023 19:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C6838134D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89ABC1BF340
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 19:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6249D42142
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 19:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6249D42142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n2Z9Ebwz9kEq for <buildroot@lists.busybox.net>;
 Thu,  7 Dec 2023 19:05:30 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F31CC4213E
 for <buildroot@buildroot.org>; Thu,  7 Dec 2023 19:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F31CC4213E
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c032962c5so15083885e9.3
 for <buildroot@buildroot.org>; Thu, 07 Dec 2023 11:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701975927; x=1702580727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iLKeZbwboWUse/sJSBKss/FolGwEkMTgVIPbRbN2Uy4=;
 b=NpasIW4VG4u96yvOMRNh8qopvnXmG7GG3XnxvW+Tb/NpE4Zm+CIuQDUhevB9H6Jt6a
 kH/7Sx5E16/3b5btqZAajimOGzADItnm/r9YHCKIj0/NsjEXVvgKdwTcdkVz0GGGRMFC
 U7vRVA2tpFpZxLjuFpWNOSYrUYCTEuYi1tgPY/4oB+uauIJPHLhuPgpQHBp1eezHUcHL
 2/Ly19AwNvhg7WG4gLC+XldxYn2mcpQutN+xjtaLRKKlV4fPRhnh+i4LvnjoopSbiScE
 zwbuXhCuRTzfRkhOT8f8C7KgMdld/nj2KPndzkCg72RUYGiZeuXNNbYN7zfhouLORY83
 pGyg==
X-Gm-Message-State: AOJu0Yzpc3gZDRpycOK1hPPy6eCVbPumd/oAdYLO89lfLrJzpoAKUIIY
 teq0MLy628NJKG8xipmQe014ebv6Hb8=
X-Google-Smtp-Source: AGHT+IEikc4w6FEy01XhxTpTm1Uspbz4f7hE2p0L5iNax+383nWV1T4muzurrCwmyHgnpzEqBZ4bdg==
X-Received: by 2002:a05:600c:198b:b0:40c:5ee:2dda with SMTP id
 t11-20020a05600c198b00b0040c05ee2ddamr1245506wmq.177.1701975926818; 
 Thu, 07 Dec 2023 11:05:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m11-20020a056000008b00b0033332524235sm307259wrx.82.2023.12.07.11.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 11:05:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Dec 2023 20:05:14 +0100
Message-ID: <20231207190515.509423-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701975927; x=1702580727; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iLKeZbwboWUse/sJSBKss/FolGwEkMTgVIPbRbN2Uy4=;
 b=jP618yoEVwllXxORXFIDIB1cz+62AWm0Ir44GgWCy9Yd+u+vOrecEE88y24ov0X9NJ
 fRz2S9kMuHoh0QJ++6Tlo5MwEztQVgaTYu0iC1C/DuwEGgnTVfYBtlRr5LeyWyS5Ma5j
 ogBXGb67UFHTt3fIz2bbXJsqD73xYdKK7XvxEmZ5GaqqjaHUavgY5XPJmHDHpP1cWafv
 xLlUmdfw9AMpVz1LepSvHjwDClldakPQQaJgDi/Dd4yw8D4m/cizuCgRtl4UoE/jhIgi
 YA1NN/EOzFHW7Ilr2nQo8e5fWlxR7Ff/Z1XkZ58cp/oMUDlz2R3Z94iKmYPmPX8q+jCm
 FgMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jP618yoE
Subject: [Buildroot] [PATCH 1/1] package/tesseract-ocr: bump to version 5.3.3
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version)

This bump will fix the following build failure raised since bump of
leptonica to version 1.83.1 in commit
a4e713558dfd9a6fd6c0677b4b094adc216b720e thanks to
https://github.com/tesseract-ocr/tesseract/commit/27b1827ccde6014df1231e1cec6263ee108066e9:

src/textord/devanagari_processing.cpp: In member function 'bool tesseract::ShiroRekhaSplitter::Split(bool, tesseract::DebugPixa*)':
src/textord/devanagari_processing.cpp:130:19: error: invalid use of incomplete type 'struct Pixa'
  130 |     Box *box = ccs->boxa->box[i];
      |                   ^~
In file included from /home/autobuild/autobuild/instance-5/output-1/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/leptonica/alltypes.h:52,
                 from /home/autobuild/autobuild/instance-5/output-1/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/leptonica/allheaders.h:35,
                 from src/textord/devanagari_processing.h:16,
                 from src/textord/devanagari_processing.cpp:25:
/home/autobuild/autobuild/instance-5/output-1/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/leptonica/bmf.h:48:12: note: forward declaration of 'struct Pixa'
   48 |     struct Pixa  *pixa;        /*!< pixa of bitmaps for 93 characters        */
      |            ^~~~

https://github.com/tesseract-ocr/tesseract/blob/5.3.3/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/46d3ffc8885245ee9a56a528be055b0b27a18245

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  2 -
 ...-if-platform-supports-feenableexcept.patch | 42 -------------------
 ...configure.ac-fix-build-on-aarch64_be.patch | 32 --------------
 package/tesseract-ocr/tesseract-ocr.hash      |  2 +-
 package/tesseract-ocr/tesseract-ocr.mk        |  4 +-
 5 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch
 delete mode 100644 package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index d18c951e42..ba1c07ea5f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1326,8 +1326,6 @@ package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch Upstream
 package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch Upstream
 package/tcf-agent/S55tcf-agent Shellcheck Variables
 package/tcl/0001-Disable-tcl-compatibility-layers.patch Upstream
-package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch Upstream
-package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch Upstream
 package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch Upstream
 package/tftpd/S80tftpd-hpa Indent Shellcheck Variables
 package/ti-gfx/0001-newclkapi.patch Upstream
diff --git a/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch b/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch
deleted file mode 100644
index 5280f01aba..0000000000
--- a/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 52484af83a58664c3cc91b8af07aeeea271f67ef Mon Sep 17 00:00:00 2001
-From: Gilles Talis <gilles.talis@gmail.com>
-Date: Sun, 9 Jan 2022 10:58:36 +0100
-Subject: [PATCH] Check if platform supports feenableexcept
-
-Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
----
- configure.ac      | 4 ++++
- src/tesseract.cpp | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9177d64..80cd735 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -188,6 +188,10 @@ case "${host_cpu}" in
- 
- esac
-
-+# check whether feenableexcept is supported. some C libraries (e.g. uclibc) don't.
-+AC_CHECK_FUNC(feenableexcept, [feenableexcept=true], [feenableexcept=false])
-+AM_CONDITIONAL([HAVE_FEENABLEEXCEPT], $feenableexcept)
-+
- AX_CHECK_COMPILE_FLAG([-fopenmp-simd], [openmp_simd=true], [openmp_simd=false], [$WERROR])
- AM_CONDITIONAL([OPENMP_SIMD], $openmp_simd)
- 
-diff --git a/src/tesseract.cpp b/src/tesseract.cpp
-index 933116e..9154db8 100644
---- a/src/tesseract.cpp
-+++ b/src/tesseract.cpp
-@@ -629,7 +629,7 @@ static void PreloadRenderers(tesseract::TessBaseAPI &api,
-  **********************************************************************/
- 
- int main(int argc, char **argv) {
--#if defined(__USE_GNU)
-+#if defined(__USE_GNU) && defined(HAVE_FEENABLEEXCEPT)
-   // Raise SIGFPE.
- #  if defined(__clang__)
-   // clang creates code which causes some FP exceptions, so don't enable those.
--- 
-2.32.0
-
diff --git a/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch b/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch
deleted file mode 100644
index 20b8d5ce76..0000000000
--- a/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From cffb8a36a987cd0d013d73501dd20c553ff69c77 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Aug 2022 10:21:43 +0200
-Subject: [PATCH] configure.ac: fix build on aarch64_be
-
-Fix the following build failure on aarch64_be:
-
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/10.3.1/../../../../aarch64_be-none-linux-gnu/bin/ld: ./.libs/libtesseract.so: undefined reference to `tesseract::IntSimdMatrix::intSimdMatrixNEON'
-
-Fixes:
- - http://autobuild.buildroot.org/results/b9246a37fcf6be4fabfc491daddadfb09e0a320a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and backported) from:
-https://github.com/tesseract-ocr/tesseract/commit/cffb8a36a987cd0d013d73501dd20c553ff69c77]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 63579c954f..2b05052395 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -170,7 +170,7 @@ case "${host_cpu}" in
- 
-     ;;
- 
--  aarch64)
-+  aarch64*)
- 
-     # ARMv8 always has NEON and does not need special compiler flags.
-     AM_CONDITIONAL([HAVE_NEON], true)
diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index 9e526423d3..45b9def27f 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  b5b0e561650ed67feb1e9de38d4746121d302ae4c876c95b99b8b6f9f89d5c58  tesseract-ocr-5.0.1.tar.gz
+sha256  dc4329f85f41191b2d813b71b528ba6047745813474e583ccce8795ff2ff5681  tesseract-ocr-5.3.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index abe3d39ab6..d65111d468 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 5.0.1
+TESSERACT_OCR_VERSION = 5.3.3
 TESSERACT_OCR_DATA_VERSION = 4.1.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
 TESSERACT_OCR_LICENSE_FILES = LICENSE
 
 # Source from github, no configure script provided
-# 0001-Check-if-platform-supports-feenableexcept.patch
-# 0002-configure.ac-fix-build-on-aarch64_be.patch
 TESSERACT_OCR_AUTORECONF = YES
 
 # cairo, pango and icu are optional dependencies, but only needed for
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
