Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1CFC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 07:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2142B60593;
	Fri,  9 Dec 2022 07:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2142B60593
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpIDO73vh4bu; Fri,  9 Dec 2022 07:51:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F02C60B16;
	Fri,  9 Dec 2022 07:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F02C60B16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84EF21BF5DE
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 600914021C
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 600914021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KmYwzY8AkLH0 for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 07:51:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B7A740127
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B7A740127
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 07:51:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so2793221wmi.3
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 23:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R8O+NxTG4MZRt/fOWpHzzOd9CkvzCCmraAfMR1/zTek=;
 b=f1LNfIBj5ecQgK6Ol82olGZiSVaM/r5Y9QYtU2mkioe+AEnc/ZGOxr7xxx6m5ckZ9e
 OLjAoMGnuBj/ptOSmnMnGDFRyK5tohrQA4iV+yhfoVo5XvTShKF10bi0QoR80mmPZNdp
 TeADdOw6J2+6fJNqgpElyPbpJJf7kLXJxWay4Ay0Dco4PcbQexcAbZ/xh594HKgTLb2E
 UrTob0x+ZX2sOLiWHYnxFNhMh02vottHMOslS0TUFD8le5rWJfazMrmCPDbT4+Sx8flr
 aj3Sg1OIaXkhZOjPm02H1Bwyk/nw96sItY52IpmUoGaIG1gbCIrO8TwL31eDxlUaoqrH
 1DFA==
X-Gm-Message-State: ANoB5pm8etFyL2cIwUDTntl6TEO9ouZ13+4lmC7Q4UnNprMUcoGjU2yU
 z1Uwskqa24XHexjqNzXGTI2DKfp8Xc67aC/8
X-Google-Smtp-Source: AA0mqf59sGrKG8wNKSz5Pfhv3Mw+LB7en2LF29TC8u17qR3aIX9xSTA9c5DwI6IZovC2uzlmXGy8LA==
X-Received: by 2002:a05:600c:1da3:b0:3d1:ebdf:d58b with SMTP id
 p35-20020a05600c1da300b003d1ebdfd58bmr4070910wms.5.1670572274995; 
 Thu, 08 Dec 2022 23:51:14 -0800 (PST)
Received: from lmecxl1178.home (lfbn-nan-1-127-214.w90-49.abo.wanadoo.fr.
 [90.49.211.214]) by smtp.gmail.com with ESMTPSA id
 bp3-20020a5d5a83000000b002415dd45320sm664507wrb.112.2022.12.08.23.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 23:51:14 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Fri,  9 Dec 2022 08:51:02 +0100
Message-Id: <20221209075104.1168297-3-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209075104.1168297-1-etienne.carriere@linaro.org>
References: <20221209075104.1168297-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8O+NxTG4MZRt/fOWpHzzOd9CkvzCCmraAfMR1/zTek=;
 b=E7qRL/dCN7tTy1U7ebPGljjphsu0fuYaaecl2bcVy6zS5JUKqE8PlHvoe0myqx0PCS
 yQruNgDyo/4DPePSUhimlPYZ16yO1MujNziJlhwGnC1AmHIlmIfaIJP8NJZRj++AMAT7
 F6DQ/W0/ln3WpvOEFn2zatLW1QXOvlFp0Lko6s5p6p7bnRIkOO0DYSRnKskANpSEH0Y6
 FXfQ/cpog0YVuqaStLxh/3RTPE3XGUyrv2CaIG2YQoPGzCaD8UfTU9OMgx8LkWNp8UXy
 G5kemctGmuE2inLv++jlQVX56eio70IlWW/UiBxofOeG6p1KUnbGYiQEMLmzJTcca2Ar
 3sRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=E7qRL/dC
Subject: [Buildroot] [PATCH v2 3/5] package/optee-client: bump to version
 3.19.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE client package version to OP-TEE release 3.19.0.

This package introduces a mandatory dependency on util-linux and
pk-config packages that were made optional in commit [1], following
3.19.0 release tag. The dependency is related to new library teeacl
for access control list based login identification. This change picks
that commit and defines the dependency only when TEEACL library is
to be embedded. The patch will be removed once we dump to the next
OP-TEE release tag, as state by new BR2 boolean config switch
BR2_PACKAGE_OPTEE_CLIENT_TEEACL.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes since v1:
- Squashes 2 commits from v1 series.
- Adds OP-TEE Client fixup commit and new package config switch
  BR2_PACKAGE_OPTEE_CLIENT_TEEACL to not mandate dependency on
  pkg-config and usr-linux (libuuid).

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 ...condition-libteeacl-with-WITH_TEEACL.patch | 102 ++++++++++++++++++
 package/optee-client/Config.in                |  10 ++
 package/optee-client/optee-client.hash        |   4 +-
 package/optee-client/optee-client.mk          |  12 ++-
 4 files changed, 125 insertions(+), 3 deletions(-)
 create mode 100644 package/optee-client/0001-libteeacl-condition-libteeacl-with-WITH_TEEACL.patch

diff --git a/package/optee-client/0001-libteeacl-condition-libteeacl-with-WITH_TEEACL.patch b/package/optee-client/0001-libteeacl-condition-libteeacl-with-WITH_TEEACL.patch
new file mode 100644
index 0000000000..53e7c4bf91
--- /dev/null
+++ b/package/optee-client/0001-libteeacl-condition-libteeacl-with-WITH_TEEACL.patch
@@ -0,0 +1,102 @@
+From 8e060441a50201b10aa61bc83c57d758bfe19cf1 Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@linaro.org>
+Date: Thu, 10 Nov 2022 12:05:24 +0100
+Subject: [PATCH] libteeacl: condition libteeacl with WITH_TEEACL
+
+Build and embed libteeacl upon WITH_TEEACL=1 (default configuration).
+This configuration switch allows one to build OP-TEE client without
+dependencies on pkg-config and libuuid  when OP-TEE ACL for
+PKCS11 is not needed:
+ cmake -DWITH_TEEACL=0 ...
+or
+ make WITH_TEEACL=0 ...
+
+With the comments below addressed, LGTM.
+
+Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+---
+ CMakeLists.txt |  9 ++++++---
+ Makefile       | 15 ++++++++++++---
+ 2 files changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0786752..9fb5c6a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -5,6 +5,7 @@ project (optee_client C)
+ set (CMAKE_TOOLCHAIN_FILE CMakeToolchain.txt)
+ 
+ set (CFG_WERROR 1 CACHE BOOL "Build with -Werror")
++option (WITH_TEEACL "Build libteeacl" TRUE)
+ 
+ include(GNUInstallDirs)
+ 
+@@ -37,7 +38,9 @@ add_subdirectory (libteec)
+ add_subdirectory (tee-supplicant)
+ add_subdirectory (public)
+ add_subdirectory (libckteec)
+-find_package (PkgConfig REQUIRED)
+-pkg_check_modules(uuid REQUIRED IMPORTED_TARGET uuid)
+-add_subdirectory (libteeacl)
++if(WITH_TEEACL)
++    find_package (PkgConfig REQUIRED)
++    pkg_check_modules(uuid REQUIRED IMPORTED_TARGET uuid)
++    add_subdirectory (libteeacl)
++endif(WITH_TEEACL)
+ add_subdirectory (libseteec)
+diff --git a/Makefile b/Makefile
+index 90b487e..2ee5621 100644
+--- a/Makefile
++++ b/Makefile
+@@ -16,6 +16,8 @@ SBINDIR ?= /usr/sbin
+ LIBDIR ?= /usr/lib
+ INCLUDEDIR ?= /usr/include
+ 
++WITH_TEEACL ?= 1
++
+ .PHONY: all build build-libteec build-libckteec build-libseteec \
+ 	build-libteeacl check-libuuid install copy_export clean cscope \
+ 	clean-cscope \
+@@ -35,8 +37,10 @@ build-tee-supplicant: build-libteec
+ 	@echo "Building tee-supplicant"
+ 	$(MAKE) --directory=tee-supplicant  --no-print-directory --no-builtin-variables CFG_TEE_SUPP_LOG_LEVEL=$(CFG_TEE_SUPP_LOG_LEVEL)
+ 
+-build: build-libteec build-tee-supplicant build-libckteec build-libseteec \
+-	build-libteeacl
++build: build-libteec build-tee-supplicant build-libckteec build-libseteec
++ifeq ($(WITH_TEEACL),1)
++build: build-libteeacl
++endif
+ 
+ build-libckteec: build-libteec
+ 	@echo "Building libckteec.so"
+@@ -57,7 +61,10 @@ check-libuuid:
+ install: copy_export
+ 
+ clean: clean-libteec clean-tee-supplicant clean-cscope clean-libckteec \
+-	clean-libseteec clean-libteeacl
++	clean-libseteec
++ifeq ($(WITH_TEEACL),1)
++clean: clean-libteeacl
++endif
+ 
+ clean-libteec:
+ 	@$(MAKE) --directory=libteec --no-print-directory clean
+@@ -158,9 +165,11 @@ copy_export: build
+ 	cp libckteec/include/*.h $(DESTDIR)$(INCLUDEDIR)
+ 	cp -d ${O}/libckteec/libckteec.so* $(DESTDIR)$(LIBDIR)
+ 	cp -d ${O}/libckteec/libckteec.a $(DESTDIR)$(LIBDIR)
++ifeq ($(WITH_TEEACL),1)
+ 	cp libteeacl/include/*.h $(DESTDIR)$(INCLUDEDIR)
+ 	cp -d ${O}/libteeacl/libteeacl.so* $(DESTDIR)$(LIBDIR)
+ 	cp -d ${O}/libteeacl/libteeacl.a $(DESTDIR)$(LIBDIR)
++endif
+ 	cp libseteec/include/*.h $(DESTDIR)$(INCLUDEDIR)
+ 	cp -d ${O}/libseteec/libseteec.so* $(DESTDIR)$(LIBDIR)
+ 	cp -d ${O}/libseteec/libseteec.a $(DESTDIR)$(LIBDIR)
+-- 
+2.25.1
+
diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index cc7f176c77..3307a0ea83 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -37,6 +37,16 @@ config BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS
 	help
 	  Enable TEE supplicant plugin support.
 
+config BR2_PACKAGE_OPTEE_CLIENT_TEEACL
+	bool "Enable TEE Access Control List login"
+	default y
+	depends on BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Enable TEE ACL login identification for OP-TEE service that
+	  supports them as OP-TEE PKCS#11 services.
+
 endif
 
 comment "optee-client needs a toolchain w/ threads, headers >= 4.3"
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 8e55bf5725..c067e26f4e 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.18.0/optee-client-3.18.0.tar.gz
-sha256  ecc0f04fdd5398aa52fea50427fbd624f7f90274aec7bbf2cc8a5bd16758202b  optee-client-3.18.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.19.0/optee-client-3.19.0.tar.gz
+sha256  5f0d02efa0e496964e86ca9dd2461ada923d1f9e11a4b9cafb5393bd08337644  optee-client-3.19.0.tar.gz
 # Locally computed
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 3fbbe9484c..d03791d3ad 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,12 +4,16 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.18.0
+OPTEE_CLIENT_VERSION = 3.19.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
 OPTEE_CLIENT_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_TEEACL),y)
+OPTEE_CLIENT_EXT_DEPENDENCIES = host-pkgconf util-linux-libs
+endif
+
 OPTEE_CLIENT_CONF_OPTS = \
 	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
 	-DCFG_WERROR=OFF
@@ -26,6 +30,12 @@ else
 OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_TEEACL),y)
+OPTEE_CLIENT_CONF_OPTS = -DWITH_TEEACL=ON
+else
+OPTEE_CLIENT_CONF_OPTS = -DWITH_TEEACL=OFF
+endif
+
 define OPTEE_CLIENT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30tee-supplicant \
 		$(TARGET_DIR)/etc/init.d/S30tee-supplicant
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
