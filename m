Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2043CD342F
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 17:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EAFF83155;
	Wed, 12 Nov 2025 17:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTHLZPEaKCGn; Wed, 12 Nov 2025 17:43:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A036E830A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A036E830A8;
	Wed, 12 Nov 2025 17:43:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74CFF230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 17:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62638406B0
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 17:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nN6v1l10QynT for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 17:43:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=rustamabd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FC4D40663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FC4D40663
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FC4D40663
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 17:43:51 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-59457f79859so1236081e87.2
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 09:43:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762969429; x=1763574229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=osNzubo4QsTVBil7DojsB+P7LZJ6MwFMKnjiaUI3dww=;
 b=tjdt798Lp4ulmmTfk9ddYPoiioW3QeJuIXoVF84SpT62+6zTE+TUXYDjjBgOaIpLzm
 Mhr3kIXeeTTIr6WaM+I8CKIql652QD79qcjO1Ogfpg/DaWOJrh1FedxCFOy5lPbJxpNB
 wipwdS9MYFvMTDiwI1ajBx3SYMCgBc7y57r5aguBV3cJv59XRAUDT3mCBhxN/A7wJBF3
 3xvI4RfjsKSno+iY1WRMwzq0DL4bcGWP7AWSDglwm7qygft8rn0gceEV/4/0XYh1yUNf
 4Z1ZAQWToTLgWvZjWSVcjx1gFD+lRi6mbewlZl9JdGP+XvE2l2h0fKboDUMlAb29puTs
 Iiow==
X-Gm-Message-State: AOJu0YwrXkJoLRB2QSzZjPL0VsdTnZYCIyjUxm3aYHBKGHyLh1nI3dWx
 VfNY6TZr2mMZc0Zq5NgPGQbhqqSSXZYZeooKCkvku6JpR2meWhmFpGz85SZCkxpMOJA=
X-Gm-Gg: ASbGncsTwSWhxWMM0Q2P+BvxpzLLsVt8dkCbIvAyaKDKDSK8qWvzlA8rmHxzBbt9m8O
 p8PnCAnmjITQfGOmyTPzpr9NKrbqp49gWoi8aoylePGEj4JbV4J6YDn1utfKoxSmNW+p+RU07oQ
 OC+BE3basmzZQWKX71i6RdKqGAz8+ThHIEw6iT4QlhRlvxkPRhnk/3RNmOGw/TJLkVm8jqlvFKr
 SNRRImTOyTD52X3RMNfDN091CZfEKAjDWkc/6UTwSuKyqAjAPTK9RBu2FBdByWqOR1NeEo9LmrE
 WYr38c2d7sTImUnQElLt2rO6t9/YE0xcB8xW9RWtToAO99TaGPI7UDJA7eyAiFNszYDHug2MItE
 dXPrRR3aLih8wOddcq3cOiVygfH19hYV4oQM5o0GJAKyVw4hzZhDZecMyHgckZ3xXouQ2g0ZIJP
 Gqb5fT9aOnEaFUOy6z29HVDuKdkTiFbeDwgInt3436kHXYRdG31FEpzU79fkRhCpPSUp1l
X-Google-Smtp-Source: AGHT+IGafFUeqNdeTNWkbH6kSr/bwWbOkW2IDZisrx9N4p9Q/wpKVLjJI8rxwx9Zs/KWFJKg5OObWg==
X-Received: by 2002:a05:6512:acd:b0:594:314d:ac53 with SMTP id
 2adb3069b0e04-59576df8ecemr1344680e87.23.1762969428550; 
 Wed, 12 Nov 2025 09:43:48 -0800 (PST)
Received: from rustyx.org ([2a01:4f9:3080:1414::a54])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5957abdba80sm758314e87.58.2025.11.12.09.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 09:43:46 -0800 (PST)
From: Rustam Abdullaev <rustamabd@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 17:43:33 +0000
Message-Id: <20251112174333.3755973-1-rustamabd@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762969429; x=1763574229; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=osNzubo4QsTVBil7DojsB+P7LZJ6MwFMKnjiaUI3dww=;
 b=lQ8j56TcNls6cDYTlCwul+LkWmj/HlQTNz7apkhodekEfpegVWwjeHJWfXeUgGMTn0
 Ga7UPK5nczPk3iKzHhW4WULlMAlYcU4oBKTMDv+alD/ZHqiz/u5ntRdpIDzSyjZykof1
 QE6TSzChh+uYXpEgvu5SpncKFCtVk93TtTL3DC0PJG3ETObR6UJztGyNLIxVyUrHxBmP
 fRmS98kxaQH9HTG5s07xITJ6k4P+7DpKkVuZSRdTRxYdY1tjjE1VwTZySlYzSvbTJno3
 20faB7sDvTy/hIrsSwc/1ODW9l5SKiko636WXCQFrY78bA/7ovLAN/UifEwNqrj87YRj
 7xIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lQ8j56Tc
Subject: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: introduce
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Signed-off-by: Rustam Abdullaev <rustamabd@gmail.com>
---
 package/linux-headers/linux-headers.mk               |  3 ++-
 toolchain/Config.in                                  |  6 ++++++
 toolchain/helpers.mk                                 |  4 +---
 toolchain/toolchain-buildroot/Config.in              |  2 --
 toolchain/toolchain-external/Config.in               |  9 +++++++++
 .../toolchain-external/pkg-toolchain-external.mk     | 12 +++++++++++-
 6 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index e2a0b7a7c9..d738bd3e9b 100644
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
index b3cbec8377..c02d77c08e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -69,6 +69,12 @@ source "toolchain/toolchain-external/Config.in"
 # so put it here instead
 source "package/gdb/Config.in.host"
 
+# Linux headers can be used by both internal and external toolchains
+if BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
+source "package/linux-headers/Config.in.host"
+source "package/linux-headers/Config.in"
+endif
+
 comment "Toolchain Generic Options"
 
 # https://sourceware.org/bugzilla/show_bug.cgi?id=27597
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 08ee6060b0..b5cf2b7971 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -165,11 +165,9 @@ copy_toolchain_sysroot = \
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
index 64f7892f98..ebebe263db 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -104,8 +104,6 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
 
-source "package/linux-headers/Config.in.host"
-source "package/linux-headers/Config.in"
 source "package/musl/Config.in"
 source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c1c159cb8e..d364f92a95 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -157,4 +157,13 @@ config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	  Copy the gdbserver provided by the external toolchain to the
 	  target.
 
+config BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
+	bool "Update kernel headers"
+	select BR2_PACKAGE_LINUX_HEADERS
+	help
+	  Select this option to update the kernel headers in the
+	  external toolchain with headers from the kernel being built.
+	  This is useful when the external toolchain has older kernel
+	  headers than the kernel being built.
+
 endif # BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c37f3500d9..6527601773 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -557,19 +557,29 @@ $(2)_POST_EXTRACT_HOOKS += \
 	TOOLCHAIN_EXTERNAL_MOVE
 endif
 
+ifeq ($$(BR2_PACKAGE_LINUX_HEADERS),y)
+$(2)_DEPENDENCIES += linux-headers
+endif
+
 # Checks for an already installed toolchain: check the toolchain
 # location, check that it is usable, and then verify that it
 # matches the configuration provided in Buildroot: ABI, C++ support,
 # kernel headers version, type of C library and all C library features.
+# Also updates the kernel headers in the toolchain, if requested.
 define $(2)_CONFIGURE_CMDS
 	$$(Q)$$(call check_cross_compiler_exists,$$(TOOLCHAIN_EXTERNAL_CC))
 	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC),"$$(TOOLCHAIN_EXTERNAL_CFLAGS)")
 	$$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
+	if test "$$(BR2_PACKAGE_LINUX_HEADERS)" = "y" ; then \
+		echo "Updating kernel headers in the external toolchain..." ; \
+		rsync -a $$(STAGING_DIR)/usr/include/ \
+			$$$${SYSROOT_DIR}/usr/include/ ; \
+	fi ; \
 	$$(call check_kernel_headers_version,\
 		$$(BUILD_DIR),\
 		$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC)),\
 		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)),\
-		$$(if $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),loose,strict)); \
+		$$(if $$(or $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),$$(BR2_PACKAGE_LINUX_HEADERS)),loose,strict)); \
 	$$(call check_gcc_version,$$(TOOLCHAIN_EXTERNAL_CC),\
 		$$(call qstrip,$$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
 	if test "$$(BR2_arm)" = "y" ; then \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
