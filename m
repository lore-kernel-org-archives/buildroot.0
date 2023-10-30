Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDC5C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E07F1814BA;
	Mon, 30 Oct 2023 10:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E07F1814BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voM59jU2Mfac; Mon, 30 Oct 2023 10:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0212A85372;
	Mon, 30 Oct 2023 10:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0212A85372
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E91A01BF38B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C236570379
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C236570379
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCYIvHlLekMP for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:35:40 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5148E60608
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5148E60608
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-507a3b8b113so6166504e87.0
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 03:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698662138; x=1699266938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=17vURqcLj92VLEZ24W2mqUdoPxFu+dukb+gnyxKwiH4=;
 b=RBPXtKaH6vii6OAjYGrW+mcd7Mpr4zvWm146Ip8TwR9AgyF8LuecOCngHvSg3nVkqa
 YokokGIo4VA3vh0WVsq9uUsioHyRSch1WL+vBOFaOPLlzUxs0WXW44CSrFLZsmLWI+f1
 e3HWkKwZfpYPcxbDlF52qSQB8k20G/NVzVfq1fpBySX5V1NAEtpcGKwFG5a1DGxm3kFn
 PS6QT8KjZI3Pk8+83S+v9I/RbipFmdbqQtGc3I9TLhmp3h1LHujE3DwIYW7gFDetyTGk
 1AL4D6R4gGjM0SeXcxUAZCqSlBvZUAgTHpX8w1pbZJmiOHNfxXQGbBCMTPwd40Ntcw/W
 VBCA==
X-Gm-Message-State: AOJu0YwWW0nSLK+jJ3ftLnydFg6URSEfO1hmtqfDBrG5KnluwE+iPI9g
 GT8IZ8xaPBCIijHsV6ThzOA7hKbYA5U=
X-Google-Smtp-Source: AGHT+IELm8kg7hgWX1sj/9OB9qPPiClWF5kMWFbLOZp+yJHSLegsDiIs38uiNOUkwZhHZzxUhjOfCQ==
X-Received: by 2002:ac2:561a:0:b0:508:268b:b087 with SMTP id
 v26-20020ac2561a000000b00508268bb087mr6246782lfd.26.1698662137365; 
 Mon, 30 Oct 2023 03:35:37 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 w18-20020ac254b2000000b005079d34f330sm1398674lfk.282.2023.10.30.03.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 03:35:36 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon, 30 Oct 2023 11:39:31 +0100
Message-ID: <20231030103931.2684786-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698662138; x=1699266938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=17vURqcLj92VLEZ24W2mqUdoPxFu+dukb+gnyxKwiH4=;
 b=SGHjHxFEZ1NDf0VCmL+WTF42voh8ViECQZvFiiCldS3Ap/5K/i7a5yI8CpjxJGAwxY
 d8edDSPPKfyTmjGyF0+IFCO2EFBSMtebB+KpUq06mo7gdEyYn9eCr+P7LOZJBM4toTxS
 VBE0P//jk19cpkGIytuFEy2dX9KDhKRoS9RHK69xXosatBV8l7yU3syTwh19/MD14eK1
 9zObk1/SZ7Ud7BuuVV4UcDKOITF6q/hfnWN9/+ccAAx+qSn+6Id9ifw78h/zuLwaWsS6
 q7Cb20x9EJgKbniDHuR90YdS7Ek8OMSvjhM55nwE0gf8g8ae2+K1ryKxFHPb2OCtAo2p
 KjQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SGHjHxFE
Subject: [Buildroot] [PATCH v5] package/criu: new package
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Checkpoint/Restore In Userspace (CRIU), is a software tool for the
Linux operating system to make it possible to freeze a running
application and checkpoint it to persistent storage as a collection of files.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Notes:
    v2:
     - Addressed comments from Thomas.
     - Tested on ARM target and on x86_64 with qemu.
    
    v3:
     - set CONFIG_CHECKPOINT_RESTORE in kernel config
     - Only be available for ARMv6, ARMv7 and ARMv8
    
    v4:
    - set SUBARCH for armv6, armv7 and armv8
    - Use github download helper
    
    Result from test-pkg:
                        bootlin-armv5-uclibc [1/6]: SKIPPED
                         bootlin-armv7-glibc [2/6]: OK
                       bootlin-armv7m-uclibc [3/6]: SKIPPED
                         bootlin-x86-64-musl [4/6]: OK
                          br-arm-full-static [5/6]: SKIPPED
                                sourcery-arm [6/6]: SKIPPED
    6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
    
    v5:
    - Remove support for s390 arch
    - Depend on BR2_HOST_GCC_AT_LEAST_8
    - Depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
    - Depend on !BR2_TOOLCHAIN_USES_UCLIBC
    - Use BR2_NORMALIZED_ARCH instead of BR2_ARCH

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/criu/Config.in | 55 ++++++++++++++++++++++++++++++++
 package/criu/criu.hash |  3 ++
 package/criu/criu.mk   | 71 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 131 insertions(+)
 create mode 100644 package/criu/Config.in
 create mode 100644 package/criu/criu.hash
 create mode 100644 package/criu/criu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 57015e245e..2047827bd9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2007,6 +2007,7 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/criu/
 F:	package/libcamera/
 F:	package/libcamera-apps/
 F:	package/libostree/
diff --git a/package/Config.in b/package/Config.in
index 4e489c4706..9e2099f6a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2678,6 +2678,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
+	source "package/criu/Config.in"
 	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
diff --git a/package/criu/Config.in b/package/criu/Config.in
new file mode 100644
index 0000000000..7963e6e8df
--- /dev/null
+++ b/package/criu/Config.in
@@ -0,0 +1,55 @@
+# criu only builds on certain architectures
+config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
+	bool
+	default y if BR2_ARM_CPU_ARMV6
+	default y if BR2_ARM_CPU_ARMV7A
+	default y if BR2_ARM_CPU_ARMV7M
+	default y if BR2_ARM_CPU_ARMV8A
+	default y if BR2_ARM_CPU_ARMV8M
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_mips
+	default y if BR2_x86_64
+	default y if BR2_BR2_powerpc64le #Only support powerpc64 with LE
+	#default y if BR2_s390x
+	#CRIU has "some" support for s390 but it is not included due to
+	#BE/LE endian issues.
+
+menuconfig BR2_PACKAGE_CRIU
+	bool "criu"
+	depends on BR2_HOST_GCC_AT_LEAST_8 # -march=armv7-a+fp
+	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_PYTHON3 # host-python3-ssl
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no aio.h
+	depends on !BR2_STATIC_LIBS # protobuf, libbsd
+	depends on BR2_USE_WCHAR # libbsd
+	depends on BR2_USE_MMU # libcap
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_PROTOBUF_C
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBNET
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_PYTHON3
+	help
+	  Checkpoint/Restore In Userspace (CRIU), is a software
+	  tool for the Linux operating system to make it possible
+	  to freeze a running application and checkpoint it to
+	  persistent storage as a collection of files.
+
+	  https://criu.org/Main_Page
+
+comment "criu needs a toolchain w/ threads, dynamic library, wchar"
+	depends on !BR2_HOST_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
+		|| BR2_TOOLCHAIN_USES_UCLIBC \
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/criu/criu.hash b/package/criu/criu.hash
new file mode 100644
index 0000000000..2c4a07252b
--- /dev/null
+++ b/package/criu/criu.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  6a9997981c9fe4730c848ce59346b3a22fad69b803607cb67a3f6ec0557fa474  criu-3.18.tar.gz
+sha256  568a1fa9d90e18a1a1a61ea58ec2eece16b56a5042cc72c1b4f8d4455ae6fcb7  COPYING
diff --git a/package/criu/criu.mk b/package/criu/criu.mk
new file mode 100644
index 0000000000..9814e4a0de
--- /dev/null
+++ b/package/criu/criu.mk
@@ -0,0 +1,71 @@
+################################################################################
+#
+# CRIU
+#
+################################################################################
+
+CRIU_VERSION = 3.18
+CRIU_SITE = $(call github,checkpoint-restore,criu,v$(CRIU_VERSION))
+
+CRIU_LICENSE = GPL-2.0
+CRIU_LICENSE_FILES = COPYING
+CRIU_DEPENDENCIES =\
+	host-pkgconf \
+	host-protobuf-c \
+	host-python3 \
+	host-python-pip \
+	libaio \
+	libbsd \
+	libcap \
+	libnet \
+	libnl \
+	protobuf \
+	protobuf-c \
+	python3
+
+CRIU_MAKE_ENV =\
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_CONFIGURE_OPTS) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	WERROR=0
+
+#Remap to match the used in criu.
+ifeq ($(BR2_NORMALIZED_ARCH),"x86_64")
+CRIU_MAKE_ENV += ARCH=x86
+else ifeq ($(BR2_NORMALIZED_ARCH),"powerpc")
+CRIU_MAKE_ENV += ARCH=ppc64
+else ifeq ($(BR2_NORMALIZED_ARCH),"arm64")
+CRIU_MAKE_ENV += ARCH=aarch64
+else
+CRIU_MAKE_ENV += ARCH=$(BR2_NORMALIZED_ARCH)
+endif
+
+ifeq ($(BR2_ARM_CPU_ARMV6), y)
+CRIU_MAKE_ENV += SUBARCH=armv6
+else ifeq ($(BR2_ARM_CPU_ARMV7A), y)
+CRIU_MAKE_ENV += SUBARCH=armv7
+else ifeq ($(BR2_ARM_CPU_ARMV7M), y)
+CRIU_MAKE_ENV += SUBARCH=armv7
+else ifeq ($(BR2_ARM_CPU_ARMV8A), y)
+CRIU_MAKE_ENV += SUBARCH=armv8
+else ifeq ($(BR2_ARM_CPU_ARMV8M), y)
+CRIU_MAKE_ENV += SUBARCH=armv8
+endif
+
+# Criu needs Kernel Checkpoint/restore support which is not enabled
+# by default.
+define CRIU_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CHECKPOINT_RESTORE)
+endef
+
+define CRIU_BUILD_CMDS
+	rm -rf $(@D)/images/google/protobuf/descriptor.proto
+	ln -s  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto $(@D)/images/google/protobuf/descriptor.proto
+	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define CRIU_INSTALL_TARGET_CMDS
+	$(CRIU_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install-criu install-lib install-compel
+endef
+
+$(eval $(generic-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
