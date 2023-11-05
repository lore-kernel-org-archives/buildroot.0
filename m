Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09711C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CEC2820C7;
	Sun,  5 Nov 2023 18:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CEC2820C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5D3YdfFeEtBF; Sun,  5 Nov 2023 18:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A759820C8;
	Sun,  5 Nov 2023 18:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A759820C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 945671BF4D6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C6F3820C8
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C6F3820C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYuzsM5A3T9p for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:14:09 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9155820C7
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9155820C7
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so50568701fa.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 10:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699208045; x=1699812845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zXxzbBzcbsrXFUqDJFZeThRIgtHFSd3/UMbMXENIrTQ=;
 b=kTNTZA5Bc2ugx/NaFPJmP39c4AcKz1BSeUFLUf7g7he5o+fQo5/oXiQXH5BfJYKof8
 641MxuuTh8YzEi303FW+vYlALU2hSGz3jCIXtTtx53bjDc19L9OItCG/+/uYA/SFVnn5
 f+H/ICTkyVKT+nCHeuvB3KwLdvJ3NvkQ+5E6zYctKzvymwQjpws8oDBV8rELvX+5hrnA
 e4KTRa9vgBII/eH2MxJA17pR8+Ni8LqkJ5beiFKvG2bOKt+dseK92G91cTi/KTmIWoAT
 a2HWsVZWn5L1n7tRdiQ8aQfrMGLXkcqDA9dlY0RUhPp2mSvEC9nyW/rUkgUR2G18c1O1
 /twg==
X-Gm-Message-State: AOJu0Yzy49+vHGM6YFSAqvf8bepgXquSOAo5Hvz4hrqmHqDd13qIx5PZ
 ljnbFaXd1HhmeUq6zWIvXn291u9xjt8=
X-Google-Smtp-Source: AGHT+IHYiARtVAdE6H9gKS2NVM4Sctuhp6JKpBZG+6H0AtXScQO/zg7HjND5+3VscK3lVabs4n/qpA==
X-Received: by 2002:ac2:5103:0:b0:507:b0f7:ec92 with SMTP id
 q3-20020ac25103000000b00507b0f7ec92mr17676035lfb.59.1699208045178; 
 Sun, 05 Nov 2023 10:14:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a18-20020a5d5092000000b0032d8354fb43sm7368169wrt.76.2023.11.05.10.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 10:14:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 19:14:00 +0100
Message-ID: <20231105181400.472991-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699208045; x=1699812845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zXxzbBzcbsrXFUqDJFZeThRIgtHFSd3/UMbMXENIrTQ=;
 b=HpiTVrJifaQ+ykbFpkSEX9r4r+a+aJDgLu+BsxAikIVGEIhJJ2qy1cdhTUou6mYR2e
 m9QG9gMEF3Nu24wYplrnU79yq2Qz4zCkBOYU4i/DlN+4s4VsIig6N85WMOgEmAaFxGW8
 hfeZv829CHbgbat/U1+tHWOhz8hX9QOzxKJdLBKoarWBA/lV4BGdf9kUTjgZe3L/YJA5
 8XRn6gopT3hHUK+eBuaTqLrb+jK/URN4Qc8PzCw9lxS21EQ3ubj3RoS5iAn9vZqs8D8W
 EiixG0c1BNEP0mwKGk33jeZTXtyenckNWqeEAkSwMz25xHI8iRMmRbt/KAjmM/Sdky7a
 qPkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HpiTVrJi
Subject: [Buildroot] [PATCH 1/1] package/vde2: bump to version 2.3.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to github to get latest release
- Drop first and second patches (already in version)
- Drop third patch (not needed anymore)
- Drop BSD-3-Clause and COPYING.slirpvde (slirpvde removed with
  https://github.com/virtualsquare/vde-2/commit/eda0a1bc1d14061588459676fe6f0a048b7dbd1c
  https://github.com/virtualsquare/vde-2/commit/14e1c9e06f4dbdddc6fe4e85fc72a1d583b049ad)
- python removed with
  https://github.com/virtualsquare/vde-2/commit/2c57c25075fa2d351b8f181d2764af61c4e47de0
- kernel switch removed with
  https://github.com/virtualsquare/vde-2/commit/b196ecd5b774f1c85041ce6d2334702911cbd8f3
- parallel build has been fixed with
  https://github.com/virtualsquare/vde-2/commit/7dd9ed46d5dca125ca45d679ac9f3acbfb0f9300

https://github.com/virtualsquare/vde-2/releases/tag/v2.3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  3 --
 package/vde2/0001-no-cxx.patch                | 22 ----------
 ...-fstp-Add-static-to-inline-functions.patch | 44 -------------------
 ...de_l3-Add-static-to-inline-functions.patch | 37 ----------------
 package/vde2/Config.in                        |  2 +-
 package/vde2/vde2.hash                        |  3 +-
 package/vde2/vde2.mk                          | 22 +++-------
 7 files changed, 7 insertions(+), 126 deletions(-)
 delete mode 100644 package/vde2/0001-no-cxx.patch
 delete mode 100644 package/vde2/0002-fstp-Add-static-to-inline-functions.patch
 delete mode 100644 package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 2d921d6f0b..b1adb4e674 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1414,9 +1414,6 @@ package/vboot-utils/0004-Disable-static-futility.patch Upstream
 package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch Upstream
 package/vboot-utils/0006-Update-for-openssl-1.1.patch Upstream
 package/vboot-utils/0007-Make-vboot_version-extern-in-header.patch Upstream
-package/vde2/0001-no-cxx.patch Upstream
-package/vde2/0002-fstp-Add-static-to-inline-functions.patch Upstream
-package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch Upstream
 package/vdr/0001-getloadavg.patch Upstream
 package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch Upstream
 package/vlc/0002-automake-add-subdir-objects-option.patch Upstream
diff --git a/package/vde2/0001-no-cxx.patch b/package/vde2/0001-no-cxx.patch
deleted file mode 100644
index 67cefa2bb8..0000000000
--- a/package/vde2/0001-no-cxx.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-configure: do not test for CXX, it's not needed
-
-There is no C++ source file, so no reason to require a C++ compiler.
-
-Reported-by: Peter Korsgaard <jacmet@uclibc.org>
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Patch sent upstream
-( not yet in archives, awaits moderator approval... :-/ )
-
-diff -durN vde2-2.3.2.orig/configure.ac vde2-2.3.2/configure.ac
---- vde2-2.3.2.orig/configure.ac	2011-11-23 17:41:19.000000000 +0100
-+++ vde2-2.3.2/configure.ac	2012-12-14 21:56:47.146319686 +0100
-@@ -11,7 +11,6 @@
- AC_CONFIG_LIBOBJ_DIR(src/common)
- 
- # Checks for programs.
--AC_PROG_CXX
- AC_PROG_CC
- AC_PROG_INSTALL
- AC_PROG_LN_S
diff --git a/package/vde2/0002-fstp-Add-static-to-inline-functions.patch b/package/vde2/0002-fstp-Add-static-to-inline-functions.patch
deleted file mode 100644
index 0dbe083d06..0000000000
--- a/package/vde2/0002-fstp-Add-static-to-inline-functions.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 67bc8443ac7e8144a78d84dee30a5cac3b5c99a4 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 27 Aug 2017 23:56:05 +0200
-Subject: [PATCH] fstp: Add static to inline functions
-
-From [1]
-"This is needed to avoid a link error where the inline functions appear
-missing at link time.
-From c99 standard inline function should either be declared static or
-have an extern instance in a c file for linking.
-This fix is necessary to build with gcc 7; for some reason it was not
-trigerred before."
-
-[1] https://git.buildroot.net/buildroot/commit/?id=21133ada326c87627f7bdee4493d8086587c3cca
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/vde_switch/fstp.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/vde_switch/fstp.c b/src/vde_switch/fstp.c
-index aab7324..b1e7ee8 100644
---- a/src/vde_switch/fstp.c
-+++ b/src/vde_switch/fstp.c
-@@ -30,14 +30,14 @@ static int numports;
- #ifdef FSTP
- #include <fstp.h>
- /*********************** sending macro used by FSTP & Core ******************/
--void inline ltonstring(unsigned long l,unsigned char *s) {
-+static void inline ltonstring(unsigned long l,unsigned char *s) {
- 	s[3]=l; l>>=8;
- 	s[2]=l; l>>=8;
- 	s[1]=l; l>>=8;
- 	s[0]=l;
- }
- 
--unsigned long inline nstringtol(unsigned char *s) {
-+static unsigned long inline nstringtol(unsigned char *s) {
- 	return (s[0]<<24)+(s[1]<<16)+(s[2]<<8)+s[3];
- }
- 
--- 
-2.9.5
-
diff --git a/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch b/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch
deleted file mode 100644
index 7f771dfc7e..0000000000
--- a/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-vde_l3: Add static to inline functions
-
-Add static to inline functions to avoid the following build failure
-with BR2_OPTIMIZE_0:
-
-/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips64-buildroot-linux-uclibc/10.3.0/../../../../mips64-buildroot-linux-uclibc/bin/ld: vde_l3.o: in function `ip_output_ready':
-vde_l3.c:(.text+0xb30): undefined reference to `iphead'
-
-Fixes:
- - http://autobuild.buildroot.org/results/5eeefcdac0b8974a424a885fdc2e82f7cb4b617d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -Nura vde2-2.3.2.orig/src/vde_l3/vde_l3.c vde2-2.3.2/src/vde_l3/vde_l3.c
---- vde2-2.3.2.orig/src/vde_l3/vde_l3.c	2022-04-21 11:05:17.393452698 +0200
-+++ vde2-2.3.2/src/vde_l3/vde_l3.c	2022-04-21 11:10:36.509804404 +0200
-@@ -100,17 +100,17 @@
- };
- 
- 
--inline struct vde_ethernet_header *ethhead(struct vde_buff *vdb)
-+static inline struct vde_ethernet_header *ethhead(struct vde_buff *vdb)
- {
- 	return (struct vde_ethernet_header*)(vdb->data);
- }
- 
--inline struct iphdr *iphead(struct vde_buff *vdb)
-+static inline struct iphdr *iphead(struct vde_buff *vdb)
- {
- 	return (struct iphdr*)(vdb->data + 14);
- }
- 
--inline void *payload(struct vde_buff *vdb)
-+static inline void *payload(struct vde_buff *vdb)
- {
- 	return (uint8_t*)(vdb->data + 14 + sizeof(struct iphdr));
- }
diff --git a/package/vde2/Config.in b/package/vde2/Config.in
index f640a4ae2a..44bdf50de0 100644
--- a/package/vde2/Config.in
+++ b/package/vde2/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_VDE2
 	  spawned over a set of physical computers over the Internet.
 	  VDE is part of the virtualsquare project.
 
-	  http://vde.sourceforge.net/
+	  https://github.com/virtualsquare/vde-2/
 
 comment "vde2 needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/vde2/vde2.hash b/package/vde2/vde2.hash
index a9e1ea2263..11d6a28279 100644
--- a/package/vde2/vde2.hash
+++ b/package/vde2/vde2.hash
@@ -1,5 +1,4 @@
 # Locally computed:
-sha256  cbea9b7e03097f87a6b5e98b07890d2275848f1fe4b9fcda77b8994148bc9542  vde2-2.3.2.tar.bz2
+sha256  a7d2cc4c3d0c0ffe6aff7eb0029212f2b098313029126dcd12dc542723972379  vde2-2.3.3.tar.gz
 sha256  fb295d0c24b8ef4b39017ac68e772e8e6e839612ce10da12b9f48d1e8e512e2e  COPYING
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.libvdeplug
-sha256  d5ac74315b2d2f9c53f5839e311484f4646a9401b68d02d36f3dab386352e74d  COPYING.slirpvde
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index 76d6f352b7..61c19c1ee2 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -4,24 +4,21 @@
 #
 ################################################################################
 
-VDE2_VERSION = 2.3.2
-VDE2_SOURCE = vde2-$(VDE2_VERSION).tar.bz2
-VDE2_SITE = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
-VDE2_LICENSE = GPL-2.0+, LGPL-2.1+, BSD-3-Clause
-VDE2_LICENSE_FILES = COPYING COPYING.libvdeplug COPYING.slirpvde
+VDE2_VERSION = 2.3.3
+VDE2_SITE = $(call github,virtualsquare,vde-2,v$(VDE2_VERSION))
+VDE2_LICENSE = GPL-2.0+, LGPL-2.1+
+VDE2_LICENSE_FILES = COPYING COPYING.libvdeplug
 VDE2_CPE_ID_VENDOR = vde_project
 VDE2_CPE_ID_PRODUCT = vde
 VDE2_INSTALL_STAGING = YES
 
-# We touch configure.ac, so we need to autoreconf
+# From git
 VDE2_AUTORECONF = YES
 
 # Reasons for enabling/disabling stuff:
 # - tuntap is enabled in the hope we're using a recent-enough toolchain
 #   that does have if_tun.h (virtually everything these days)
-# - kvde_switch is disabled because it requires a patched kernel
 # - cryptcab is disabled to not depend on openSSL
-# - python is disabled to not depend on Python
 # - pcap is disabled to not depend on libpcap
 # - profiling is disabled because we do not want to debug/profile
 #
@@ -30,25 +27,16 @@ VDE2_AUTORECONF = YES
 VDE2_CONF_OPTS = \
 	--disable-cryptcab \
 	--disable-experimental \
-	--disable-kernel-switch \
 	--disable-pcap \
 	--disable-profile \
-	--disable-python \
 	--enable-tuntap
 
-# Package does not build in parallel due to improper make rules
-VDE2_MAKE = $(MAKE1)
-
 HOST_VDE2_CONF_OPTS = \
 	--disable-cryptcab \
 	--disable-experimental \
-	--disable-kernel-switch \
 	--disable-pcap \
 	--disable-profile \
-	--disable-python \
 	--enable-tuntap
 
-HOST_VDE2_MAKE = $(MAKE1)
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
