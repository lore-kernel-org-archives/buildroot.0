Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B615C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 478C542D71;
	Mon, 20 Feb 2023 21:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 478C542D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nle64dyNAv6R; Mon, 20 Feb 2023 21:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E37934EC46;
	Mon, 20 Feb 2023 21:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E37934EC46
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32C831BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 166FA40BFA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 166FA40BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TPTJdYPLDYzZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 138FE415BC
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 138FE415BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1101886494; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 10:53:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9c552f39c98d271002032b0d74f62c9cfe4348dd
X-Git-Newrev: 917a961d9c77d5f1aaa47206add9b9ff80e74a82
X-Patchwork-Hint: ignore
Message-Id: <20230220205200.1101886494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/optee-client: bump to
 version 3.19.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=917a961d9c77d5f1aaa47206add9b9ff80e74a82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
[yann.morin.1998@free.fr:
  - actually backport upstream commit
  - don't default y for BR2_PACKAGE_OPTEE_CLIENT_TEEACL
  - select util-linux instead of depending on it
  - don't select util-linux-libs, there's no circular deps
  - squash both conditions together in .mk
  - fix check-package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...eacl-condition-libteeacl-with-WITH_TEEACL.patch | 105 +++++++++++++++++++++
 package/optee-client/Config.in                     |   8 ++
 package/optee-client/optee-client.hash             |   4 +-
 package/optee-client/optee-client.mk               |   9 +-
 4 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/0001-libteeacl-condition-libteeacl-with-WITH_TEEACL.patch b/package/optee-client/0001-libteeacl-condition-libteeacl-with-WITH_TEEACL.patch
new file mode 100644
index 0000000000..4fdf9afc94
--- /dev/null
+++ b/package/optee-client/0001-libteeacl-condition-libteeacl-with-WITH_TEEACL.patch
@@ -0,0 +1,105 @@
+From bbdf665aba39c29a3ce7bd06e4554c62a416ebaa Mon Sep 17 00:00:00 2001
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
+[etienne.carriere@linaro.org: backport upstream commit]
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+[yann.morin.1998@free.fr: actually do a backport of bbdf665]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
index cc7f176c77..538948b72c 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -37,6 +37,14 @@ config BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS
 	help
 	  Enable TEE supplicant plugin support.
 
+config BR2_PACKAGE_OPTEE_CLIENT_TEEACL
+	bool "Enable TEE Access Control List login"
+	select BR2_PACKAGE_UTIL_LINUX
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
index 3fbbe9484c..3e0c9269b8 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.18.0
+OPTEE_CLIENT_VERSION = 3.19.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
@@ -26,6 +26,13 @@ else
 OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_TEEACL),y)
+OPTEE_CLIENT_EXT_DEPENDENCIES += host-pkgconf util-linux-libs
+OPTEE_CLIENT_CONF_OPTS += -DWITH_TEEACL=ON
+else
+OPTEE_CLIENT_CONF_OPTS += -DWITH_TEEACL=OFF
+endif
+
 define OPTEE_CLIENT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30tee-supplicant \
 		$(TARGET_DIR)/etc/init.d/S30tee-supplicant
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
