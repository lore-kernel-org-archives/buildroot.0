Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AF5C79FBD
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 19:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BECA16062B;
	Mon,  5 Jan 2026 19:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETDqB5FvJnzW; Mon,  5 Jan 2026 19:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAFB660631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767642548;
	bh=iXR0VOzZ28re8TzVDf5T3pnP/FKS7M5ZsN0Or3SDm7o=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gX5298zWaU73N6ftpWiHN3gX+mP64jT1U5oysfyy5D0yXBHHdS2qIrix7LMR9gcNS
	 w+cYalQIgR6J09FDBVMl5giS2pIJ6i2LgKgHuj96QDDLlAwSfgcAJzjS8kKJRf0l/C
	 B/Oo1zdp2THKvUoJ282Hc0OQhbArYoELqdzpLmba1kak83Zdi80sluzk3bgXChph3+
	 txL9d964JptzyVEUyd/5TI2v2gudMF5Qztb0yRvlhFrCuihvHS5HLqe/vInFQHdueS
	 bViU1yDiVZFGJI3iuy3wAFBL3qqJWl8109gfi2uNP0yOKYSpl4rKEMu1KNEJNBz1rE
	 KU9QkMHifbKRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAFB660631;
	Mon,  5 Jan 2026 19:49:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C666E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21E4A60631
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKiVT6tX-zbE for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 19:49:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 103BF6062B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 103BF6062B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 103BF6062B
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:49:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D3F1A4C3751;
 Mon,  5 Jan 2026 20:48:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40420)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcqYp-000000006SQ-3Lz4;
 Mon, 05 Jan 2026 19:48:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon,  5 Jan 2026 20:48:10 +0100
Message-ID: <20260105194813.2157401-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105194813.2157401-1-bernd@kuhls.net>
References: <20260105194813.2157401-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767642496;
 bh=E4raI6CmuSsHQHF/0CdotnRxBp6N8SSWDjIQKMd+EE4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RGyfxcnA4jrLt95ewj6QTe8qG30+ad1ep54CtWXAVfNajFc7bhwcK9RGxWl3LlSYq
 K8hiMoz+WzPnIxex9bzWE1VPgdrBCQI7mbuNWMWJw2AhRhqFtyl/GXVleaPOoRaEUh
 pIuiusJhaZnait9Wk/MYNhSL+ankG9hFcjCQZEcptHeYA/h5y+FE5jbbelSSo2uOIR
 6Jx+2wTmuKmDH1mp2Fj3UPyffwEa5RMNa7stRTJkOqMC8d2zB0ttassVLCgIzOksJY
 CLzrT6uaudkzCOsT5OaRA3zDPgEz5RkBo3YfxOHskebB6rvos5L6/Us2Dqy+YvyIJx
 kcX6qZKM85l2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RGyfxcnA
Subject: [Buildroot] [PATCH 4/6] package/criu: remove package
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

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

The criu package was added in Nov 2023, and then bumped once in
December 2023. Since then, it has never been bumped again, and all
follow-up fixes were provided by other people than the original
package submitter listed in the DEVELOPERS file.

criu has seen several upstream releases since then, and most notably
is causing a number of build issues in our autobuilders:

  https://autobuild.buildroot.net/?reason=criu-3.19

The package was never updated to those newer upstream releases, and
the autobuilder issues have not been addressed.

Therefore, let's drop this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Config.in.legacy       |  7 ++++
 DEVELOPERS             |  1 -
 package/Config.in      |  1 -
 package/criu/Config.in | 52 ----------------------------
 package/criu/criu.hash |  3 --
 package/criu/criu.mk   | 77 ------------------------------------------
 6 files changed, 7 insertions(+), 134 deletions(-)
 delete mode 100644 package/criu/Config.in
 delete mode 100644 package/criu/criu.hash
 delete mode 100644 package/criu/criu.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index a2d48b2f7c..062a9ebd5a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_CRIU
+	bool "criu has been removed"
+	help
+	  criu was removed from Buildroot as it was insufficiently
+	  maintained. It can be re-added if someone volunteers to
+	  maintain it.
+
 config BR2_PACKAGE_GCONF
 	bool "gconf package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index c5553960f5..c0f9279f8d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2255,7 +2255,6 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
-F:	package/criu/
 F:	package/libcamera/
 F:	package/libcamera-apps/
 F:	package/libostree/
diff --git a/package/Config.in b/package/Config.in
index b72f416a9a..d707097bd6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2783,7 +2783,6 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
-	source "package/criu/Config.in"
 	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
diff --git a/package/criu/Config.in b/package/criu/Config.in
deleted file mode 100644
index 04a2080041..0000000000
--- a/package/criu/Config.in
+++ /dev/null
@@ -1,52 +0,0 @@
-# criu only builds on certain architectures
-config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
-	bool
-	default y if BR2_ARM_CPU_ARMV6
-	default y if BR2_ARM_CPU_ARMV7A
-	default y if BR2_ARM_CPU_ARMV7M
-	default y if BR2_ARM_CPU_ARMV8A && !BR2_aarch64_be
-	default y if BR2_aarch64
-	default y if BR2_x86_64
-	default y if BR2_powerpc64le # Only support powerpc64 with LE
-	# CRIU has "some" support for s390 but it is not included due to
-	# BE/LE endian issues.
-	depends on BR2_USE_MMU # libcap
-	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-
-config BR2_PACKAGE_CRIU
-	bool "criu"
-	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # -march=armv7-a+fp, protobuf
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no aio.h
-	depends on !BR2_STATIC_LIBS # protobuf, libbsd
-	depends on BR2_INSTALL_LIBSTDCPP # protobuf
-	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
-	depends on BR2_USE_WCHAR # libbsd
-	select BR2_PACKAGE_HOST_PYTHON3_SSL
-	select BR2_PACKAGE_PROTOBUF
-	select BR2_PACKAGE_PROTOBUF_C
-	select BR2_PACKAGE_LIBAIO
-	select BR2_PACKAGE_LIBBSD
-	select BR2_PACKAGE_LIBCAP
-	select BR2_PACKAGE_LIBNET
-	select BR2_PACKAGE_LIBNL
-	select BR2_PACKAGE_PYTHON3
-	help
-	  Checkpoint/Restore In Userspace (CRIU), is a software
-	  tool for the Linux operating system to make it possible
-	  to freeze a running application and checkpoint it to
-	  persistent storage as a collection of files.
-
-	  https://criu.org/Main_Page
-
-comment "criu needs a glibc or musl toolchain w/ threads, host gcc >= 7, gcc >= 8, headers >= 4.18, C++, dynamic library, wchar"
-	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
-		|| BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/criu/criu.hash b/package/criu/criu.hash
deleted file mode 100644
index c3fcdbc03f..0000000000
--- a/package/criu/criu.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  990cdd147cb670a5d5d14216c2b5c2fc2b9a53ef19396569a6413807ba2a6aa2  criu-3.19.tar.gz
-sha256  568a1fa9d90e18a1a1a61ea58ec2eece16b56a5042cc72c1b4f8d4455ae6fcb7  COPYING
diff --git a/package/criu/criu.mk b/package/criu/criu.mk
deleted file mode 100644
index 3b72a1131e..0000000000
--- a/package/criu/criu.mk
+++ /dev/null
@@ -1,77 +0,0 @@
-################################################################################
-#
-# CRIU
-#
-################################################################################
-
-CRIU_VERSION = 3.19
-CRIU_SITE = $(call github,checkpoint-restore,criu,v$(CRIU_VERSION))
-
-CRIU_LICENSE = GPL-2.0, LGPL-2.1 (for lib/), MIT (for images/)
-CRIU_LICENSE_FILES = COPYING images/LICENSE
-
-CRIU_DEPENDENCIES =\
-	host-pkgconf \
-	host-protobuf-c \
-	host-python3 \
-	host-python-pip \
-	libaio \
-	libbsd \
-	libcap \
-	libnet \
-	libnl \
-	protobuf \
-	protobuf-c \
-	python3
-
-CRIU_MAKE_ENV =\
-	$(TARGET_MAKE_ENV) \
-	$(TARGET_CONFIGURE_OPTS) \
-	CROSS_COMPILE=$(TARGET_CROSS) \
-	WERROR=0
-
-# Remap to match the used in criu.
-ifeq ($(BR2_NORMALIZED_ARCH),"x86_64")
-CRIU_MAKE_ENV += ARCH=x86
-else ifeq ($(BR2_NORMALIZED_ARCH),"powerpc")
-CRIU_MAKE_ENV += ARCH=ppc64
-else ifeq ($(BR2_NORMALIZED_ARCH),"arm64")
-CRIU_MAKE_ENV += ARCH=aarch64
-else
-CRIU_MAKE_ENV += ARCH=$(BR2_NORMALIZED_ARCH)
-endif
-
-ifeq ($(BR2_ARM_CPU_ARMV6),y)
-CRIU_MAKE_ENV += SUBARCH=armv6
-else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
-CRIU_MAKE_ENV += SUBARCH=armv7
-else ifeq ($(BR2_ARM_CPU_ARMV7M),y)
-CRIU_MAKE_ENV += SUBARCH=armv7
-else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
-CRIU_MAKE_ENV += SUBARCH=armv8
-endif
-
-# Criu needs Kernel Checkpoint/restore support which is not enabled
-# by default.
-define CRIU_LINUX_CONFIG_FIXUPS
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CHECKPOINT_RESTORE)
-endef
-
-define CRIU_BUILD_CMDS
-	rm -rf $(@D)/images/google/protobuf/descriptor.proto
-	cp -a  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto \
-		$(@D)/images/google/protobuf/descriptor.proto
-	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D) \
-		PREFIX=/usr
-endef
-
-define CRIU_INSTALL_TARGET_CMDS
-	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D) \
-		PREFIX=/usr \
-		DESTDIR=$(TARGET_DIR) \
-		install-criu \
-		install-lib \
-		install-compel
-endef
-
-$(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
