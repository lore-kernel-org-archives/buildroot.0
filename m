Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469CDD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A234048C;
	Sun, 28 Dec 2025 07:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgRLkdsbuGEc; Sun, 28 Dec 2025 07:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B871405EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908317;
	bh=luhXRLlPRpB7553nJJMNeyiszxDut8ebZFf25gfuJiA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FYEvQ82cDM+OBuWLwBgxLqvP5MC0ymnFAbiwzgrO3gXaSk8AwxDkmTIPaArB8yWNd
	 GWQHwLwm4JEzBNZyWKwZISQnX/dHSVMbxHGDWcr67CRJ1UKMgbxoLY8OgRZs6JzfyU
	 zCEIAhFQWh8bkNgi6exmEy4IRn9+2OsMlYuanHJxWw90obnkomT+UESaD9lD0/0wV8
	 ouAaBIIMEkcFQhNidGRFzSA13lohBzMuGBOp5d4BZrXQIJyT54mO0EmvtHZP3+7LKW
	 jzJQhAvVj1eCnhP7L3Og4lDinvBNKW+XHrIMjcxUn7W04eUfbPKFq/9bEkWJLdnitc
	 mGO0Ds5G0v6zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B871405EE;
	Sun, 28 Dec 2025 07:51:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FEA31E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 922CE400B1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id astz9xvfEXi5 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:51:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C4E340087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C4E340087
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C4E340087
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:51:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EBE17A4C2302;
 Sun, 28 Dec 2025 08:48:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVq-000000004ex-2YwC;
 Sun, 28 Dec 2025 07:48:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sun, 28 Dec 2025 08:48:11 +0100
Message-ID: <20251228074822.3370464-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908117;
 bh=k/IV/rSs+zzB27QAvXUiONMsB6Ct4xPd9dSYvHHvWms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HYPaxs/vDPmNUhYrGu2/pobvV/95Bja1a1PyCCC4t5SKDu/Ebbcn/IKxtlbmlCS3C
 reJBR+yWZXxbVPQ1KCUcXX3b+GeWHK36DRD9wv/BCOOs+7inh0kdWUyK01fepFYGB+
 0XqV7xAqlXI99i4uqjYrZZFjrlV9QMjeMG0e3EvhN6I7kli+TBnnTRSI1PikFop16i
 N9nErNHSSSeabuBlkRIQbikYKhUU7/sccbQYHfm+DUmVEWfEiUuoW69LKkzk+7v96Y
 Af+ujYeWJAL0Lj25ThcXtx+KQdqyFF/DqfGnUioV3Ko08isS9YaW3dsj8lPfOMwQpv
 xAqSFYPBKbDBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HYPaxs/v
Subject: [Buildroot] [PATCH v6 16/26] package/racehound: remove package
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

Analysis of https://github.com/kmrov/racehound:
last commit: Jul 2017
last bug report: 0 open
last pull request: 0 open

Analysis of https://github.com/euspectre/racehound (another fork)
last commit: Jan 2022
last bug report: Jul 2017
last pull request: 0 open

The package is broken with cmake 4 and no other package depends on it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                              |  6 ++++
 package/Config.in                             |  1 -
 ...ll-path-lib-instead-of-usr-lib-prefi.patch | 26 --------------
 package/racehound/Config.in                   | 35 -------------------
 package/racehound/racehound.hash              |  3 --
 package/racehound/racehound.mk                | 27 --------------
 6 files changed, 6 insertions(+), 92 deletions(-)
 delete mode 100644 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch
 delete mode 100644 package/racehound/Config.in
 delete mode 100644 package/racehound/racehound.hash
 delete mode 100644 package/racehound/racehound.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index ccf0dd132e..1d37a6e4d8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_RACEHOUND
+	bool "racehound has been removed"
+	select BR2_LEGACY
+	help
+	  racehound is unmaintained and has been removed
+
 config BR2_PACKAGE_TASKD
 	bool "taskd has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0447b8e70f..1f4460e370 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -141,7 +141,6 @@ menu "Debugging, profiling and benchmark"
 	source "package/poke/Config.in"
 	source "package/ptm2human/Config.in"
 	source "package/pv/Config.in"
-	source "package/racehound/Config.in"
 	source "package/rt-tests/Config.in"
 	source "package/rwmem/Config.in"
 	source "package/sentry-native/Config.in"
diff --git a/package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch b/package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch
deleted file mode 100644
index 6cac55d3eb..0000000000
--- a/package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4f8ed39ddaf17c7dd4ddbdb88e67097f00c98173 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 16 Jul 2015 23:11:25 +0200
-Subject: [PATCH] Fix module install path (/lib instead of /usr/lib prefix)
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- cmake/modules/path_prefixes.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/modules/path_prefixes.cmake b/cmake/modules/path_prefixes.cmake
-index 3cb1fe2..9dc50a4 100644
---- a/cmake/modules/path_prefixes.cmake
-+++ b/cmake/modules/path_prefixes.cmake
-@@ -113,7 +113,7 @@ set(RH_INSTALL_PREFIX_DOC
- # Set derivative prefixes
- 
- # additional, 1
--set(RH_INSTALL_PREFIX_KMODULE "${RH_INSTALL_PREFIX_LIB}/modules/${KBUILD_VERSION_STRING}/misc")
-+set(RH_INSTALL_PREFIX_KMODULE "/lib/modules/${KBUILD_VERSION_STRING}/misc")
- # Another variant
- #"${RH_INSTALL_PREFIX_LIB}/modules/${KBUILD_VERSION_STRING}/extra")
- # additional, 2
--- 
-2.1.4
-
diff --git a/package/racehound/Config.in b/package/racehound/Config.in
deleted file mode 100644
index 757743f79b..0000000000
--- a/package/racehound/Config.in
+++ /dev/null
@@ -1,35 +0,0 @@
-config BR2_PACKAGE_RACEHOUND
-	bool "racehound"
-	depends on BR2_LINUX_KERNEL
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # elfutils
-	depends on !BR2_STATIC_LIBS # elfutils
-	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
-	# only x86/x86_64 supported
-	depends on BR2_i386 || BR2_x86_64
-	select BR2_PACKAGE_ELFUTILS
-	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
-	help
-	  RaceHound can be used to detect data races in the Linux
-	  kernel on x86.
-
-	  RaceHound needs the following kernel configurations enabled:
-	  - CONFIG_X86_32 or CONFIG_X86_64
-	  - CONFIG_MODULES
-	  - CONFIG_MODULE_UNLOAD
-	  - CONFIG_SYSFS
-	  - CONFIG_DEBUG_FS
-	  - CONFIG_KALLSYMS
-	  - CONFIG_KALLSYMS_ALL
-	  - CONFIG_KPROBES
-
-	  https://github.com/kmrov/racehound
-
-comment "racehound needs an Linux kernel >= 3.14 to be built"
-	depends on !BR2_LINUX_KERNEL
-	depends on BR2_i386 || BR2_x86_64
-
-comment "racehound needs a toolchain w/ C++, wchar, dynamic library, threads"
-	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/racehound/racehound.hash b/package/racehound/racehound.hash
deleted file mode 100644
index fc64243047..0000000000
--- a/package/racehound/racehound.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  935bc4a7c7b645dee5b905f6e97d0db3f0ac4f48e71d15f4e3982811017ac43c  racehound-f09f06fcc3c77c8c5541be3ba5be80aa8148ce0c.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
deleted file mode 100644
index 93ce5c8e57..0000000000
--- a/package/racehound/racehound.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# racehound
-#
-################################################################################
-
-RACEHOUND_VERSION = f09f06fcc3c77c8c5541be3ba5be80aa8148ce0c
-RACEHOUND_SITE = $(call github,kmrov,racehound,$(RACEHOUND_VERSION))
-RACEHOUND_LICENSE = GPL-2.0
-RACEHOUND_LICENSE_FILES = LICENSE
-RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
-
-RACEHOUND_DEPENDENCIES = elfutils linux
-
-# override auto detection (uses host parameters, not cross compile
-# ready)
-RACEHOUND_CONF_OPTS += \
-	-DKERNEL_VERSION_OK=YES \
-	-DMODULE_BUILD_SUPPORTED=YES \
-	-DKERNEL_CONFIG_OK=YES \
-	-DKBUILD_BUILD_DIR=$(LINUX_DIR) \
-	-DKBUILD_VERSION_STRING=$(LINUX_VERSION_PROBED)
-
-# cross compile environment for linux kernel module
-RACEHOUND_MAKE_ENV = $(LINUX_MAKE_FLAGS)
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
