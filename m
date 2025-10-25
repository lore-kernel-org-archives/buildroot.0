Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3AFCCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 12:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1B64606C0;
	Sat, 25 Oct 2025 12:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbBzl2hvlXO4; Sat, 25 Oct 2025 12:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A728B60703
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A728B60703;
	Sat, 25 Oct 2025 12:30:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F32F43F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CF0C8119C
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xxd6oxwVNSh7 for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 12:30:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24D938118D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24D938118D
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24D938118D
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:30:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so570985266b.0
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 05:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761395440; x=1762000240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okJu4RnZ6Hqv+j++SvaiESpKpbGQgBoB9Sh7Z+gTOBk=;
 b=b5CujjwHm2KvcTEesWLpX/anK5f1o/UjmQBGfZrDzVidE0JWzoYIKfQws66X/xlx52
 ORPuNDyVRtZluOUfc4GYK/FUyl7pewrirk3VBvxG1Qe4IiLldbZCTDvqiraVR6zUnLwJ
 NRrfmyr1nhTTPGkvDAieGyn9dfmrxpKk7UW1SODXblqDWYksOsHU/9nY2FgyLaK+m82t
 u4sLLrxCzrhOPSRqFl7t0IX2o3ta7Ft4aPn3BzprZXSARzJrmVxTRuPSsF57WNzm6AyT
 u5JR6ce2IEZ3+dne4bdr3xMIuHBuW9/iRpMm1FLyTidTfV7LfsoGqxhp3bztEGHkWStj
 XH+Q==
X-Gm-Message-State: AOJu0YzdNRr7DFQdm8ESkrNtMKWt7aMp4/cnfPLHmdT+cXWUdduaCICf
 1Kv61XrbN8oiPw7UxlgoKQo/Y2evVeM5UqGzTM/5geY2pBcqkSffoSat/pQnZ6+2Qtldr4pYIO/
 TwPCm
X-Gm-Gg: ASbGncsHeuS2IJisAX3052AxSaHZ7a79CXkyUOxFLrcfESE8X/uvaoHLo0E9Qu3TPHL
 s1hjmL4/qwPAUo1WD/JuLMjNissgZVVn7XSeLzHqRB558ffBYwasfojJz7/uC51ERJj+1q4YtYg
 ZMKjNp8xn1HGq3sxk7oqn6QFF/LznkidMDLACHh9WaDssDs/wdZA0ytMBtTAySQMHlRl/aocMMn
 j/fAD7F7E57IQb85LkZYHK8zP40aDVEO+e/W08wMuX9FmInDyzqBaLUj2ENOeeQBVKEtdPBT7mL
 7XIR2aPPX/Gb3FWAbFVEr7dFjzV8ci2+JAyS2uusHAYnCW3XjhMBIy0MbToHR8OmQ92gFrfnp3Q
 AFQB7X7m3pm03Civc3Ff9YGCV8Dz+CMWedXu1Idvhdhm0GiL3oyFRyVXU3ZGFKFphIZ63rVpRRK
 CRWMbRFeKekHNGfqjn2RGAhc3lCaEiVIBoqJEXydzFww0TOn24wRs71G4DfRW2uCXT6vxmu4Th4
 gToNve78nwBTydQPXctz7bgx4Z2U7GZhRJW92Hb6IP0Wb0iqsH3DkI=
X-Google-Smtp-Source: AGHT+IHn4/YtRDtlWXp4XVa4mnq9WePJ2NAeuyl8NixHP51rTXVEjFlt164yLOVSuagj491QpXLO5g==
X-Received: by 2002:a17:907:1c0f:b0:b6d:6ab3:5d02 with SMTP id
 a640c23a62f3a-b6d6ab3656bmr670367966b.64.1761395439934; 
 Sat, 25 Oct 2025 05:30:39 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853386casm190416566b.15.2025.10.25.05.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Oct 2025 05:30:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 25 Oct 2025 14:30:35 +0200
Message-ID: <20251025123035.1136084-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025123035.1136084-1-dario.binacchi@amarulasolutions.com>
References: <20251025123035.1136084-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761395440; x=1762000240;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okJu4RnZ6Hqv+j++SvaiESpKpbGQgBoB9Sh7Z+gTOBk=;
 b=QBObN/Sg2LB3kZOJCov/n84OFzxEAISvezqCa3Xfvn43ZG6BqygrcmgQZR6XQVy+s6
 xlhXBZlJ0hK7aC7X+jMtJRTnSwPmAn5eTa9sOiwzcsmb3f3SIzJnOl+u3lKuv9aGSSky
 MCqF+MCCN2y1GT6+isIg4KLxc1k9hNvuIsxZA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QBObN/Sg
Subject: [Buildroot] [PATCH v2 2/2] package/openocd: bump to version
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

Changes v1 -> v2:
 - Drop --enable-internal-libjaylink  in the configuration options
 - Add libjaylink dependency in case of JLINK SEGGER support.
 
 ...01-configure-enable-build-on-uclinux.patch | 19 ++++++++++---------
 package/openocd/Config.in                     |  2 +-
 package/openocd/openocd.hash                  |  8 ++++----
 package/openocd/openocd.mk                    | 11 +++++++----
 4 files changed, 22 insertions(+), 18 deletions(-)

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
 
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index a7e068f10db6..ea67f6757562 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -71,7 +71,7 @@ config BR2_PACKAGE_OPENOCD_JLINK
 	bool "Segger J-Link JTAG Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBJAYLINK
 	help
 	  Segger J-Link JTAG Programmer and clone such as Atmel
 	  SAM-ICE
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
index a563cc6a9e31..3e4393275cda 100644
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
@@ -56,6 +58,7 @@ OPENOCD_DEPENDENCIES = \
 	host-pkgconf \
 	jimtcl \
 	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
+	$(if $(BR2_PACKAGE_LIBJAYLINK), libjaylink) \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
 	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
 	$(if $(BR2_PACKAGE_HIDAPI),hidapi)
@@ -135,7 +138,7 @@ HOST_OPENOCD_CONF_OPTS = \
 	--enable-dummy \
 	--disable-werror
 
-HOST_OPENOCD_DEPENDENCIES = host-jimtcl host-libftdi host-libusb host-libusb-compat
+HOST_OPENOCD_DEPENDENCIES = host-jimtcl host-libftdi host-libjaylink host-libusb host-libusb-compat
 
 # Avoid documentation rebuild. On PowerPC64(le), we patch the
 # configure script. Due to this, the version.texi files gets
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
