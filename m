Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E120DCCD1BF
	for <buildroot@archiver.kernel.org>; Fri, 24 Oct 2025 19:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A2576085D;
	Fri, 24 Oct 2025 19:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpCprZySDqez; Fri, 24 Oct 2025 19:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBAA2608C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBAA2608C6;
	Fri, 24 Oct 2025 19:02:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB5AE19D
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 19:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD3DF845DC
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 19:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 795CzWtqWgmw for <buildroot@buildroot.org>;
 Fri, 24 Oct 2025 19:02:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 865CF845D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 865CF845D9
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 865CF845D9
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 19:02:32 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-63d6ee383bdso5235666a12.2
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 12:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761332550; x=1761937350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J2KaUDFzaQH6LKa3D29oyGiFJlrMh+pez5c7I1CA2x8=;
 b=RxnccKuEmkKlDGGPj1sooYfym58Tc3MdmG9/o5GPfygThWpjtizXl0qqi9vN48SwJm
 OmRe1JP2qFcw9G7RRL304yEpE7plQA2Q3BRnEIeccsBRxbmRpqhktP2eduFMiL10tlFa
 LN1rKoeac8WUgF4OmDcKZJzzOs1tkMBTPV8X3wX3PxgLkZ9xc1qHrrBWUKaMdOEO3Zpo
 qVBR8lFTtpnoTy2ifVLOtj6EZzYhGmcOe2gg84eh+TmPz4KAbPm4DWdWOiiYCQhd2ye1
 B2EFN8A/tnMvk9eMypLjIhm0gijmSWm6VuVCqskJNIUtsOY6zqp3sGGo7358h5ibkuue
 SPEg==
X-Gm-Message-State: AOJu0YzsTCfGjAhi/9ijDKk0ktogjeWe1GY7Bo5cKpvByqwZXZ7FaerS
 5Xwc4lZpYJvSlJ3ZbEnradMWp1jonkm3DcLMKcgAPbAVeAnWNGozHFxiSjPT7mEPkFiRnKEYsxt
 j0YGR
X-Gm-Gg: ASbGncuY63AXO1GzR1pF3vo4czeqc3azpPkgOxm/eDaM9oNKl0Doh0OmmWKVTC98Ujq
 pHhMzZWWCui/HgrwesIclJOZkhRXF54JBuwAVbqP1KtVW+LUqMPM9jZQM5qEXu9M3WQqQuBcWhm
 WhSbTlivSjgajiMZ/E6rZje/JmcOXTmjlsIzUOkobh+bFyfodPTmspp6wCjj4Dg+SK4bbOQjONg
 dTfLTOh3iFVZtSt2rezy7Z7JjapEO3DSYexSh9esO1jksf3ogdeg8f7QyGUbXFqF8pLMqj8w31C
 vcpUFzD4XBEGdZhX01NRSiH9jOV9DrJlBPVCd/jFbQV+fkBzfuOMFveWgvPJ1wTDIESvyXD8inS
 bRbsNSLoF/qYfyjXpwLdGckWgbPlByEdPgVtdmMEUL7HLsR6agTuMjdPC4gchbial0y0X1mx45I
 EDxSka07eMMGKc5hoScF9DUsY5NB25um75AkFgIoqXS0JdEkMorw==
X-Google-Smtp-Source: AGHT+IHoI1aH8XsexbOeDpkLnmPbnciZ91nDFTLr7wnx9oGlAR5Ra5en+gX7ZnGx6qlNkalLaDs49g==
X-Received: by 2002:a17:907:1b15:b0:b6d:505e:3da1 with SMTP id
 a640c23a62f3a-b6d505e7df8mr760097666b.7.1761332549964; 
 Fri, 24 Oct 2025 12:02:29 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.239])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d72ece282sm228573866b.48.2025.10.24.12.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 12:02:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 24 Oct 2025 21:02:26 +0200
Message-ID: <20251024190226.1011446-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761332550; x=1761937350;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J2KaUDFzaQH6LKa3D29oyGiFJlrMh+pez5c7I1CA2x8=;
 b=oFrFMtalzAGaehVanae6gonkgKr2p9wcORNoZKMOYsEILFT3DG1JzyRmnNrrgd5O7W
 uE2GgCZvT3beBH1boHSiRfjbNcA3KuSdjVSjlzslIP+b4fZ6ys+Wa1cg9obW9b3xrjww
 9hEoYXMLUX1wzzAyIcuqgYbMe/x8gshZbpC08=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=oFrFMtal
Subject: [Buildroot] [PATCH 1/1] package/openocd: bump to version
 88b9bd396d5a1f83c49fa1b28745fd7feaca2b2e
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

The error reported by autobuild could have been fixed by backporting
commit [1], but this would not have fully fixed the issue. Other build
errors related to libgiod appeared, which would have required a large
backporting effort. This made it more reasonable to bump the package to
the most recent commit, since no new version had been released despite
many commits since January 2023.

Update LICENSES/license-rules.txt hash due to:
- Add dual/CC-BY-4.0
- Drop SPDX tag 'GPL-2.0' and use 'GPL-2.0-only'

Update LICENSES/preferred/GFDL-1.2.txt hash due to:
- Replace the obsolete address of the FSF in the GFDL-1.2

Fixes:
https://autobuild.buildroot.org/results/4f79a456d6e88e33be2a279e5288debd1f27c183

[1] https://sourceforge.net/p/openocd/code/ci/95603fae18f81eebdafc5b318e70f9e2cdefab9e
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...01-configure-enable-build-on-uclinux.patch | 19 ++++++++++---------
 package/openocd/openocd.hash                  |  8 ++++----
 package/openocd/openocd.mk                    | 12 ++++++++----
 3 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/package/openocd/0001-configure-enable-build-on-uclinux.patch b/package/openocd/0001-configure-enable-build-on-uclinux.patch
index d5f1e3295823..a80a910abc0f 100644
--- a/package/openocd/0001-configure-enable-build-on-uclinux.patch
+++ b/package/openocd/0001-configure-enable-build-on-uclinux.patch
@@ -4,25 +4,26 @@ Date: Thu, 17 Aug 2017 06:30:31 +0200
 Subject: [PATCH] configure: enable build on uclinux
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Dario: make the patch to be applied with fuzz factor 0]
+[Dario: make the patch to be applied to
+ openocd-88b9bd396d5a1f83c49fa1b28745fd7feaca2b2e]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index eee42d4240f8..b0445f92e0b5 100644
+index 6efcf24f257b..7cc2d9a136ee 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -342,7 +342,7 @@ AC_ARG_ENABLE([xlnx_pcie_xvc],
-   [build_xlnx_pcie_xvc=$enableval], [build_xlnx_pcie_xvc=no])
+@@ -367,7 +367,7 @@ AC_ARG_ENABLE([gw16012],
+ can_build_rshim=no
  
  AS_CASE([$host_os],
--  [linux*], [],
-+  [linux*|uclinux*], [],
-   [
-     AS_IF([test "x$build_sysfsgpio" = "xyes"], [
-       AC_MSG_ERROR([sysfsgpio is only available on linux])
+-  [linux*], [
++  [linux*|uclinux*], [
+     is_linux=yes
+     can_build_rshim=yes
+   ],
 -- 
 2.43.0
 
diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
index 938711d86c0f..52e9acfb882d 100644
--- a/package/openocd/openocd.hash
+++ b/package/openocd/openocd.hash
@@ -1,15 +1,15 @@
 # From http://sourceforge.net/projects/openocd/files/openocd/0.12.0/
-sha256  af254788be98861f2bd9103fe6e60a774ec96a8c374744eef9197f6043075afa  openocd-0.12.0.tar.bz2
+sha256  a3aab64cc28ae7ac38b2794173f59f96ad4dc261e00aba362ad6ebbd741dd139  openocd-88b9bd396d5a1f83c49fa1b28745fd7feaca2b2e-git4.tar.gz
 sha256  1b8f7e37ee5afbbf95c2a4d62b12b25232e29538692663b434318503a9a88419  COPYING
 sha256  034da732b4f3079b8783fff756613c1cff89dec5ac80c5cdd90532b7539922a1  LICENSES/exceptions/eCos-exception-2.0
-sha256  0a37155eb8bc0cb94477a0cae4f030e39da9317374e8a9f597e9229fd09aff78  LICENSES/license-rules.txt
+sha256  405b1becc5e999efe12116634c308287774a5401efdaca06a8370926e3686cc1  LICENSES/license-rules.txt
 sha256  f3ba76203a7b6993db31f987559cc4c621ae1ff78119ced2a669756c2c5fd3b1  LICENSES/preferred/BSD-1-Clause
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSES/preferred/BSD-2-Clause
 sha256  1483f15e9fddc73b5df0acab1c42d21ecd0bf6ade8a79179fb90c09f13d03dcd  LICENSES/preferred/BSD-2-Clause-Views
 sha256  7a83b1aeb460458db9a4bd521d7f237c45b1650f6e60ea5ffc71e49472454de3  LICENSES/preferred/BSD-3-Clause
 sha256  5cf024f6e3611d5c6fb98748d1a0ad99b8cf9ffe46f2d60fa10c299cd29e0a75  LICENSES/preferred/BSD-Source-Code
-sha256  f35396f4095619f986736ca5e2976b313d381463a35c921c9ae677cc7eb83e28  LICENSES/preferred/GFDL-1.2
+sha256  b984d86747c3ea68cca62477716de626a5d6e96f00f64fe13649e28fde81b47e  LICENSES/preferred/GFDL-1.2
 sha256  76515be2d7334a1a038f775238c9a4c2b37e19514248e5eea0434cdfee526f9d  LICENSES/preferred/gfdl-1.2.texi.readme
-sha256  7d35bc44da7bb763022e3c2c32cfc0125dd222060bc50992420599d8e65f6c0a  LICENSES/preferred/GPL-2.0
+sha256  8b57184d532ff63b57776f33b6f3b50020295da3c7ba3a63fb2f26e4968cde3a  LICENSES/preferred/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
 sha256  9a41b56594cd89743ca72f188318c9871661847074dd16497ae0c695fe3ab9c9  LICENSES/stand-alone/GPL-3.0
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index a563cc6a9e31..b9b7719fc840 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-OPENOCD_VERSION = 0.12.0
-OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
-OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
+OPENOCD_VERSION = 88b9bd396d5a1f83c49fa1b28745fd7feaca2b2e
+OPENOCD_SITE = https://git.code.sf.net/p/openocd/code
+OPENOCD_SITE_METHOD = git
+OPENOCD_GIT_SUBMODULES = YES
+
 OPENOCD_LICENSE = \
 	BSD-1-clause, \
 	BSD-2-clause, \
@@ -45,6 +47,7 @@ OPENOCD_CONF_OPTS = \
 	--includedir=$(STAGING_DIR)/usr/include \
 	--disable-doxygen-html \
 	--disable-internal-jimtcl \
+	--enable-internal-libjaylink \
 	--disable-shared \
 	--enable-dummy \
 	--disable-werror
@@ -133,7 +136,8 @@ HOST_OPENOCD_CONF_OPTS = \
 	--disable-internal-jimtcl \
 	--disable-shared \
 	--enable-dummy \
-	--disable-werror
+	--disable-werror \
+	--enable-internal-libjaylink
 
 HOST_OPENOCD_DEPENDENCIES = host-jimtcl host-libftdi host-libusb host-libusb-compat
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
