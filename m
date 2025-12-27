Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7EDE92716
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 21:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5F3607A5;
	Sat, 27 Dec 2025 21:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5F947HdM989Z; Sat, 27 Dec 2025 21:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCCA560706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766870087;
	bh=ngp58lNWORqewHLTl+AxkEa4gN6dBMvk/4uXzZ9ho1A=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BtpLtO9CBTXK+nv3cfw25l/gcMnCR9XMviyOrSZVM6URM2uYRvhUlnD0xDHee9bfm
	 2ZJcYRAjhWgsh85uVLUlR1QFX41yhdb0EhMHrb/NSyv3U6gwAEE+FjkWTi1KRNNJSf
	 xrVaH7NFOErod0pxh9MuEe0DMSd7XjBcnnopTHd+MIei/YPDsyv7f5SCTGMFJvddo7
	 It7YvNjCG+V+S2Hts+RGt0qtfI0+iHWgH2FPS9yuqd/hk0XfV/MXbAHf90If4LyzeI
	 7uAb5+RjYOqjVvYVRK3BYLnUPlLpj5WWP0zFDHM1SmZ2bBr2zhjv8SD9qVOfZJGCYq
	 Oi2IOm/RwJIxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCCA560706;
	Sat, 27 Dec 2025 21:14:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B1A9119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DAF0403C0
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TE1r26oINc_G for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 21:14:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=rustamabd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B80DA402F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B80DA402F7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B80DA402F7
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:14:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so78252135e9.1
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 13:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766870082; x=1767474882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0byYtSkDlD6frImxW44kCo5QMerY+OtzQWOaARaCBII=;
 b=CHLnHTXq8AlcUs/HmfjYBRtjFzAZxivvzTtg4p28stFvV9V0yTR7QfTyTTQOqQlXbF
 ye6qSazdu4uv2tO9h4MrOLTb1jsf9rMKyYVQjBPE3n+e8cXEYCEvIiQmt/HnNKvECuYJ
 4F1gOWlOFGIviZCDEf38BAKF8K4SQc2kfRE7yUkILfL5Qof8iYe1r9iRmfVFrTar9lyH
 obevy0JoArHIZh7lAm2p18Wx1Wkjru6+vI6sThsS/JIyGa7Wx/xQ/kiTu8chywi+/nY7
 o6iJHP9obaSUCJVUbIcAYVFeUGdKxZqbiWHXlvmzF1EGO3taP084uhadlKdGkussJti1
 /aSg==
X-Gm-Message-State: AOJu0YyCFIjpjJZCNb5xd8zAGcg46DAGISK8yBV+UM727C+vUbme7Lj8
 QISw4mHfflj1BVKpuv4rB87EjUzyZCyWXDdG5sI8nggHAUBFBbW52vuiXVJsX10d
X-Gm-Gg: AY/fxX5grklMKqhN715YOm1HgMUczTy+SKVdVDqur9txifm7MmeXIvrp72kG3UiMNwa
 bhvh8hLwGyA5SeLoI0y5krmrwFS/nLYhzXK/G7Ey7hzeSdi+UYjwD7ZyuunfbGE88kPGbe3Wx9f
 riMj/RP9Ykf1IlkbLKHhwoWpKHTong4a97Vs5cysjycNAgZ5J7in5esR4Lw7WIW+p/q3yUw9a9T
 IJaMcNjkqGqSMWBrpwACQAjBB9IOUIzlZaQArJEMa2hLu6Vsude8xW+oFnlAOtaD4sBww0rtOOi
 hcUssyyt7/uQ+vSlNjPVE2MC/GK87UwsNz4yiA/e/Mjkp+TvEvX4+zp7h7ZkVEp0UMbXcU7yQLZ
 32x9f+tTgF/u7WwRopOTGWjWRwtytAfghjb7QY8QGSywPuTKC02nDTX8MDjJXB6qqccFIHJNeA+
 jldgNRucod4F2zh4/X/aBYiwFIo5ChVPzjrVKHOmO4KmV5HhXhhhaqkCQalIzYFIUQAe9/3tLCl
 NlvGYE=
X-Google-Smtp-Source: AGHT+IGtdH+xhXQHpZ/86RLWgXzvisGfjxHkmAJKSyInxL+LaNln/tUGzv9hFLP3fwzhybuBJ72EDg==
X-Received: by 2002:a05:600c:620c:b0:475:dde5:d91b with SMTP id
 5b1f17b1804b1-47d3639489cmr201518875e9.17.1766870082340; 
 Sat, 27 Dec 2025 13:14:42 -0800 (PST)
Received: from rustyx.org ([2a01:4f9:3080:1414::a54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1aee5sm54187951f8f.4.2025.12.27.13.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 13:14:41 -0800 (PST)
From: Rustam Abdullaev <rustamabd@gmail.com>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Rustam Abdullaev <rustamabd@gmail.com>
Date: Sat, 27 Dec 2025 21:14:15 +0000
Message-Id: <20251227211415.2269024-1-rustamabd@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766870082; x=1767474882; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0byYtSkDlD6frImxW44kCo5QMerY+OtzQWOaARaCBII=;
 b=SjctAOK96IWHj7at96ddh4CvKEPEpV+saDEunVJrPaV5HjsthVmF8dGFvcaRDTjFI3
 6ESEEpCF6qQuhv2GQPOC5jF15HWFBAbiF7L/O105w5rhRFPf81tKA+qPWTZGbDL+Jf3c
 Ipn7KLkmDDh9F/+gVKSFjLnHfAfzYXcQ/VJE9wmcQ5eQNhXpnD7gJflOo37YS1fedA36
 jYVMceTEVFrhdfSdx4+gFMXTFPd2OKsTnsUcQ8qBFkD3mIkIGsDFOqRRX4ANaHtibP2A
 v+9Ro1G1SbrclrzvvuaxBWs08EvURPbmBIDfkKuD3fK7qgx4EEnlHlYfA2DfmkSX6Yyi
 i7bQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SjctAOK9
Subject: [Buildroot] [PATCH v2 1/1] toolchain/toolchain-external: introduce
 BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
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

This change makes it possible to update kernel headers in the external
toolchain with the headers from the current kernel.

It is important to have matching kernel headers when building packages
that make use of kernel features such as seccomp, as they depend on
system call definitions in linux/unistd.h. A typical example of this is
openssh - building it with the official ARM GNU toolchain and kernel 6.x
results in a non-working sshd.

Currently restricted to glibc-based toolchains as glibc is backward- and
forward-compatible with different kernel versions while uClibc and musl
are not.

Signed-off-by: Rustam Abdullaev <rustamabd@gmail.com>
---
Changes v1 -> v2:
	- Restrict the option to glibc-based toolchains.
	- Improve commit message.
	- Restore the check-kernel-headers call in linux-headers.mk.
	- Install the headers into the toolchain explicitly instead of copying
	  over all staging headers.
	- Remove the loose version check option as it doesn't seem necessary.
---
 package/linux-headers/Config.in               |  2 ++
 package/linux-headers/linux-headers.mk        |  3 ++-
 toolchain/Config.in                           |  4 ++++
 toolchain/helpers.mk                          |  4 +---
 toolchain/toolchain-buildroot/Config.in       |  2 --
 toolchain/toolchain-external/Config.in        | 12 ++++++++++++
 .../pkg-toolchain-external.mk                 | 19 ++++++++++++++++++-
 7 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/package/linux-headers/Config.in b/package/linux-headers/Config.in
index 0ea95164d6..ff04529325 100644
--- a/package/linux-headers/Config.in
+++ b/package/linux-headers/Config.in
@@ -1,2 +1,4 @@
 config BR2_PACKAGE_LINUX_HEADERS
 	bool
+	# Can be selected by internal toolchains or external toolchains needing updated headers
+	default y if BR2_TOOLCHAIN_BUILDROOT
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index b4b5a5b47d..10ad7c4630 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 # This package is used to provide Linux kernel headers for the
-# internal toolchain backend.
+# internal toolchain backend and for external toolchains that need
+# updated kernel headers.
 
 # Set variables depending on whether we are using headers from a kernel
 # build or a standalone header package.
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 99337a1873..35d1245061 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -68,6 +68,10 @@ source "toolchain/toolchain-external/Config.in"
 # so put it here instead
 source "package/gdb/Config.in.host"
 
+# Linux headers can be used by both internal and external toolchains
+source "package/linux-headers/Config.in.host"
+source "package/linux-headers/Config.in"
+
 comment "Toolchain Generic Options"
 
 # https://sourceware.org/bugzilla/show_bug.cgi?id=30730
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 21c710d0fb..1802d57421 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -169,11 +169,9 @@ copy_toolchain_sysroot = \
 # $2: sysroot directory
 # $3: kernel version string, in the form: X.Y
 # $4: test to do for the latest kernel version, 'strict' or 'loose'
-#     always 'strict' if this is not the latest version.
 #
 check_kernel_headers_version = \
-	if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3) \
-		$(if $(BR2_TOOLCHAIN_HEADERS_LATEST),$(4),strict); \
+	if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3) $(4) ; \
 	then \
 		exit 1; \
 	fi
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 0bccdc817c..592d88c68e 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -108,8 +108,6 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
 
-source "package/linux-headers/Config.in.host"
-source "package/linux-headers/Config.in"
 source "package/musl/Config.in"
 source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 831387bc4e..7ea71b5625 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -125,4 +125,16 @@ config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	  Copy the gdbserver provided by the external toolchain to the
 	  target.
 
+config BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
+	bool "Update kernel headers"
+	# Restrict this option to glibc, as uClibc and musl should probably
+	# be rebuilt when updating kernel headers.
+	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_PACKAGE_LINUX_HEADERS
+	help
+	  Select this option to update the kernel headers in the
+	  external toolchain with headers from the kernel being built.
+	  This is useful when the external toolchain has older kernel
+	  headers than the kernel being built.
+
 endif # BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 270cf814ed..80d8b0f017 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -542,6 +542,18 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LDD
 	fi
 endef
 
+define TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
+	echo "Updating kernel headers in the external toolchain..." ; \
+	SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
+	(cd $(LINUX_HEADERS_DIR); $(TARGET_MAKE_ENV) $(BR2_MAKE) \
+		ARCH=$(KERNEL_ARCH) \
+		HOSTCC="$(HOSTCC)" \
+		HOSTCFLAGS="$(HOSTCFLAGS)" \
+		HOSTCXX="$(HOSTCXX)" \
+		INSTALL_HDR_PATH=$${SYSROOT_DIR}/usr \
+		headers_install)
+endef
+
 ################################################################################
 # inner-toolchain-external-package -- defines the generic installation rules
 # for external toolchain packages
@@ -573,6 +585,11 @@ $(2)_POST_EXTRACT_HOOKS += \
 	TOOLCHAIN_EXTERNAL_MOVE
 endif
 
+ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS),y)
+$(2)_DEPENDENCIES += linux-headers
+$(2)_PRE_CONFIGURE_HOOKS += TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
+endif
+
 # Checks for an already installed toolchain: check the toolchain
 # location, check that it is usable, and then verify that it
 # matches the configuration provided in Buildroot: ABI, C++ support,
@@ -585,7 +602,7 @@ define $(2)_CONFIGURE_CMDS
 		$$(BUILD_DIR),\
 		$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC)),\
 		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)),\
-		$$(if $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),loose,strict)); \
+		$$(if $$(or $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),$$(BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS)),loose,strict)); \
 	$$(call check_gcc_version,$$(TOOLCHAIN_EXTERNAL_CC),\
 		$$(call qstrip,$$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
 	if test "$$(BR2_arm)" = "y" ; then \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
