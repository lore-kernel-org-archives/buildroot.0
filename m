Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD114D68BC2
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 22:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8359840CDB;
	Wed, 17 Dec 2025 22:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-AWZAIv2JLO; Wed, 17 Dec 2025 22:39:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FF6640D4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766011147;
	bh=dNtQb2uANdX9ilcqPD+OD7OoOlP8cUYsUjhmzjaZ7vQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JSxC9GZV+PaSCN5Zl3z6rWja5PzfWz/iD/uV7WvGno3NGM2jDzB95IvGXdfxODerx
	 Hyo424IFwtiK4FI/0XTzbaUyCGo/fK/5L+fnIAvm7sxcCBSUDGx0OHSIpXMt4g381E
	 mo6Oqx3hq2HeKvofbw4d2f+g1P8nc0adnWrPa4sd5JiXhYsqzH/YzOjP2//rHsWTxZ
	 1i0f05YgPFL9L4lQ0/DaIsHp/9WQ5QZ+rmFMIUANQanACIfVsqRoxigG+8UGjIxjIi
	 FgQFuQCivHBMTOriENThPQAJPpZrLyYMCSFpuWHynlFygjYtoSkyaFJaDBlDMtdO+w
	 S5wmlnjL5VItg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FF6640D4A;
	Wed, 17 Dec 2025 22:39:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E63FF35B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D81B983CB1
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXRnvaop2M5E for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 22:39:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 895E983CB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895E983CB0
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 895E983CB0
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:39:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B5883C1A5A2
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:38:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3F9736072F;
 Wed, 17 Dec 2025 22:39:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CAB44102F0ADF; Wed, 17 Dec 2025 23:39:00 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Dec 2025 23:38:58 +0100
Message-ID: <20251217223859.1996123-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766011141; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=FinsWNK0bnt6O1Kr+vIUgk/58DmkxWMb34Lt3TZPB68=;
 b=BQ5WjGc49Tg7jhnzyG2inqmIEpqMiKjhtkNGYUkcDdYQCMmHrDxiNyY43M8NM00JwSes/j
 AqSoNCby9tk9HJKDppASqemU63quJBOYokWVDvXxeta0xRnVJMeU3cVsHCLQTmYXkNPXgE
 c8UF8b5p0jkR44eGJJWr5i4Lc5Fp5RmwoDmwHEv+et4l37VR1SgdwmoEbBAXRgoo3+jlqr
 t2sASd+yYWH2o4VoK3OJNcW3OzmP+oWA6F1nDRiWyPZ3/4wtw+HOGJJxFfQe9VCLeIet5K
 +POvR3hRtwRcT0DJ322MKR8yih7/E2A59mMyq29YbWPJS6dvqivbmuwx2vK+Rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BQ5WjGc4
Subject: [Buildroot] [PATCH RESEND] package/criu: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
index da91b68087..4b399f7daa 100644
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
 config BR2_PACKAGE_MESA3D_VDPAU
 	bool "mesa3d Gallium VDPAU state tracker support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 1b27df9beb..54ce0dc509 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2244,7 +2244,6 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
-F:	package/criu/
 F:	package/libcamera/
 F:	package/libcamera-apps/
 F:	package/libostree/
diff --git a/package/Config.in b/package/Config.in
index 22970b4d45..5a2e7e1d0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2827,7 +2827,6 @@ menu "System tools"
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
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
