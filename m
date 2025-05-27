Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0891C54ED1
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 17:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86FC740635;
	Tue, 27 May 2025 17:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIp38RgAaDod; Tue, 27 May 2025 17:14:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DCC040674
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DCC040674;
	Tue, 27 May 2025 17:14:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73D9719F
 for <buildroot@buildroot.org>; Tue, 27 May 2025 17:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A7F760B67
 for <buildroot@buildroot.org>; Tue, 27 May 2025 17:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7-0mtMWmaMJ for <buildroot@buildroot.org>;
 Tue, 27 May 2025 17:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28EFD60B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28EFD60B26
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28EFD60B26
 for <buildroot@buildroot.org>; Tue, 27 May 2025 17:14:05 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad55d6aeb07so693476166b.0
 for <buildroot@buildroot.org>; Tue, 27 May 2025 10:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748366043; x=1748970843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6zEVlw8bx8P8yZdEjZ0kYVfPrwB+z7DzcOS6qNvcts=;
 b=ILn26SAwC9BeKTFo+FFwTNXDrIRxPss0MuEIerfyqwlO7gT86Nnk2TeL1VPaqs5jAN
 3dE/IqOIXh262AsU4hlP7ai1Y6YIZx/dmurmIZzaLvrMqcqQdl/vXeroAVRtOgFgHOn5
 iK+TYIYtQnIKeuLT9ho/EmG/IrhXdxfQLVV05OtiFrV18F9gvnU9CcuSB5WVpbi8uNwp
 Q3wkStrdEOKDRwGoEFYIDuFOAOgns3EQwpk73HKXuvGIBahR0JXKlcm8s8rqcCrAUoOs
 ME0AE62N5tYdJ+X7Ot3qrm3UkCvvg0jYPWq/3hiE5nvFD5jN68Tre6nAcOBV6acKPMN3
 rPiw==
X-Gm-Message-State: AOJu0Yxst4cqXWrORNIB1HmopgfqIyMUntcBSyfdujmQ/TF8Q0nOah1Q
 x7G5zsPtkUey40XZDOUKxA8qQWEbaAbHoTrKOL0GS/yMAo4ZGMkX4saGs44i
X-Gm-Gg: ASbGncvdpr2a0rMV9kS4UbahEL1STE8e7uyGPFDPfHqPxC7/DiJ0gg7Hpl3uMEgYMe3
 VFr8mZTV5rbnAptnB7rL4P0Wx1srQBIYpgfpIZI+h62PS8ZJk5VfmWs1uWDeYQf1HUWXUEZLnWj
 ZyXi/goRtGM3uxiM4cAoqCJZBKXyj9J9Gnb3hhjV6O1SWuYz8XRum2uzlQr7JxTty3mYRdhcedA
 8gNi1meBRCxNSHeWueaw/iPOEEUQg0w870ADn9BkoQ5SjCEyHU9ApSctuE8BY/dDXQEvKrtWftF
 hv5MpyOS8TdONpADpD2ENird8fuKdD5dsKFYGT8MVN023tMAcM68LWco7cxRv+BA+BBBsjpKGA1
 8
X-Google-Smtp-Source: AGHT+IGBMZteb/aJb//2M0Sg0b4DtQ+OIy2Lx2OBVuypSpYOooROACkmCK/AuibKsJjxRHokhRKgsw==
X-Received: by 2002:a17:907:6e93:b0:ad8:9c97:c2dd with SMTP id
 a640c23a62f3a-ad89c97c5b7mr30277266b.17.1748366042561; 
 Tue, 27 May 2025 10:14:02 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad89bb4ab07sm17151366b.168.2025.05.27.10.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:14:02 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: eric.le.bihan.dev@free.fr,
	Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 27 May 2025 19:13:56 +0200
Message-ID: <20250527171400.78560-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748366043; x=1748970843; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T6zEVlw8bx8P8yZdEjZ0kYVfPrwB+z7DzcOS6qNvcts=;
 b=Yxr8gI6mYvfTlXU/wpMzare5C6B5yeNG0RkiPdboK4mIKGWa98fe6xIK9IB8hHPz7m
 i0I8iTjlwJuHXRCpSUlYK1vSS1AD9+KJsEm+up1lbbiqgB3BQ2gtbgCwmZTtY6t2PU13
 Ce9L8gLI5AovzbksrsGTkAJId8R9oW4ZTEQZjh+vgBsJYksj2YZeADTgHDN3i3tKex+9
 Iuca5jQVbVVlao79ScoftLhFiHeaHOiopR7aj8QfWLtoYRO9KjAZL/HqSftiJ1pZJmYJ
 2N4CTtIm7GSo46W0JQoZDL4zLBEpZdm5eh6Umvabg2358zmCi+rrN1QN4Gk8s7R5WOVS
 wR/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Yxr8gI6m
Subject: [Buildroot] [next, v5 1/3] package/uutils-coreutils: new package
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

This package is an implementation of coreutils written entirely in Rust.
Currently defined functions:

    [, b2sum, b3sum, base32, base64, basename, basenc, cat, cksum, comm,
    cp, csplit, cut, date, dd, df, dir, dircolors, dirname, du, echo,
    env, expand, expr, factor, false, fmt, fold, hashsum, head, join,
    link, ln, ls, md5sum, mkdir, mktemp, more, mv, nl, numfmt, od,
    paste, pr, printenv, printf, ptx, pwd, readlink, realpath, rm,
    rmdir, seq, sha1sum, sha224sum, sha256sum, sha3-224sum, sha3-256sum,
    sha3-384sum, sha3-512sum, sha384sum, sha3sum, sha512sum,
    shake128sum, shake256sum, shred, shuf, sleep, sort, split, sum, tac,
    tail, tee, test, touch, tr, true, truncate, tsort, unexpand, uniq,
    unlink, vdir, wc, yes

This is a continuation of the work started in [1] and [2]. This version
introduces several major changes:

    - updated to the latest uutils-coreutils version (0.1.0)
    - added a flag to enable or disable the multicall binary
    - build fixes and improvements

Links:

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20230317151802.1242858-1-sebastian.weyer@smile.fr/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20241208134004.143901-1-shirokovalexs@gmail.com/

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/Config.in                             |   1 +
 package/busybox/busybox.mk                    |   1 +
 package/coreutils/Config.in                   |   1 +
 package/uutils-coreutils/Config.in            |  28 +++++
 .../uutils-coreutils/uutils-coreutils.hash    |   3 +
 package/uutils-coreutils/uutils-coreutils.mk  | 112 ++++++++++++++++++
 6 files changed, 146 insertions(+)
 create mode 100644 package/uutils-coreutils/Config.in
 create mode 100644 package/uutils-coreutils/uutils-coreutils.hash
 create mode 100644 package/uutils-coreutils/uutils-coreutils.mk

diff --git a/package/Config.in b/package/Config.in
index ac8951abc2..225691cd37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2947,6 +2947,7 @@ menu "System tools"
 	source "package/tpm2-totp/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
+	source "package/uutils-coreutils/Config.in"
 	source "package/watchdog/Config.in"
 	source "package/watchdogd/Config.in"
 	source "package/xdg-dbus-proxy/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 532932ec8f..800b48af26 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -68,6 +68,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
+	$(if $(BR2_PACKAGE_UUTILS_COREUTILS),uutils-coreutils) \
 	$(if $(BR2_PACKAGE_TINYINIT),tinyinit) \
 	$(if $(BR2_PACKAGE_VIM),vim) \
 	$(if $(BR2_PACKAGE_WATCHDOG),watchdog) \
diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index 705013bae0..9c1af1dc25 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_COREUTILS
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_PACKAGE_UUTILS_COREUTILS
 	help
 	  All of the basic file/text/shell utilities. These are the
 	  core utilities which are expected to exist on every system.
diff --git a/package/uutils-coreutils/Config.in b/package/uutils-coreutils/Config.in
new file mode 100644
index 0000000000..4251d1f4ab
--- /dev/null
+++ b/package/uutils-coreutils/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_UUTILS_COREUTILS
+	bool "uutils-coreutils"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	help
+	  uutils is an attempt at writing universal (as in
+	  cross-platform) CLI utilities in Rust. While all programs have
+	  been implemented, some options might be missing or different
+	  behavior might be experienced.
+
+	  https://github.com/uutils/coreutils
+
+if BR2_PACKAGE_UUTILS_COREUTILS
+
+config BR2_PACKAGE_UUTILS_COREUTILS_MULTICALL
+	bool "multicall"
+	default y
+	help
+	  Build coreutils as a multi-call binary.
+
+	  Selecting 'y' will build and install a single
+	  'coreutils' binary that supports all commands.
+
+	  Selecting 'n' will build and install the utilities
+	  as separate files.
+
+endif
diff --git a/package/uutils-coreutils/uutils-coreutils.hash b/package/uutils-coreutils/uutils-coreutils.hash
new file mode 100644
index 0000000000..da1a87261b
--- /dev/null
+++ b/package/uutils-coreutils/uutils-coreutils.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  40a56def7387edbc242e57eacc058449c6567bce0f681fb5c1dac7e7dac32e6a  uutils-coreutils-0.1.0-cargo4.tar.gz
+sha256  29953405eaa3dcc41c37d1621d55b6a47eee93e05613e439e73295029740b10c  LICENSE
diff --git a/package/uutils-coreutils/uutils-coreutils.mk b/package/uutils-coreutils/uutils-coreutils.mk
new file mode 100644
index 0000000000..57f03ec937
--- /dev/null
+++ b/package/uutils-coreutils/uutils-coreutils.mk
@@ -0,0 +1,112 @@
+################################################################################
+#
+# uutils-coreutils
+#
+################################################################################
+
+UUTILS_COREUTILS_VERSION = 0.1.0
+UUTILS_COREUTILS_SITE = $(call github,uutils,coreutils,$(UUTILS_COREUTILS_VERSION))
+UUTILS_COREUTILS_LICENSE = MIT
+UUTILS_COREUTILS_LICENSE_FILES = LICENSE
+UUTILS_COREUTILS_CARGO_ENV=PROJECT_NAME_FOR_VERSION_STRING="uutils coreutils"
+
+# The list of supported utilities is used to instruct Cargo on which package(s)
+# to build when coreutils is built as a set of separate files. It is also
+# required to install the files into a target directory.
+#
+# There is some duplication with the native 'GNUMakefile' from the project.
+# Unfortunately, it seems that the 'GNUMakefile' is not designed to support
+# cross-compilation and cannot be used to build and install utilities in this
+# case. Some manual handling is required here.
+PROGS = \
+	base32 \
+	base64 \
+	basenc \
+	basename \
+	cat \
+	cksum \
+	comm \
+	cp \
+	csplit \
+	cut \
+	date \
+	dd \
+	df \
+	dir \
+	dircolors \
+	dirname \
+	echo \
+	env \
+	expand \
+	expr \
+	factor \
+	false \
+	fmt \
+	fold \
+	hashsum \
+	head \
+	join \
+	link \
+	ln \
+	ls \
+	mkdir \
+	mktemp \
+	more \
+	mv \
+	nl \
+	numfmt \
+	nproc \
+	od \
+	paste \
+	pr \
+	printenv \
+	printf \
+	ptx \
+	pwd \
+	readlink \
+	realpath \
+	rm \
+	rmdir \
+	seq \
+	shred \
+	shuf \
+	sleep \
+	sort \
+	split \
+	sum \
+	sync \
+	tac \
+	tail \
+	tee \
+	test \
+	tr \
+	true \
+	truncate \
+	tsort \
+	unexpand \
+	uniq \
+	vdir \
+	wc \
+	whoami \
+	yes
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+UUTILS_COREUTILS_PROFILE=debug
+else
+UUTILS_COREUTILS_PROFILE=release
+endif
+
+ifeq ($(BR2_PACKAGE_UUTILS_COREUTILS_MULTICALL),y)
+define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/$(UUTILS_COREUTILS_PROFILE)/coreutils $(TARGET_DIR)/bin/
+endef
+else
+UUTILS_COREUTILS_CARGO_BUILD_OPTS += $(foreach prog,$(PROGS),-p uu_$(prog))
+define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
+	$(foreach prog,$(PROGS), \
+		$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/$(UUTILS_COREUTILS_PROFILE)/$(prog) $(TARGET_DIR)/bin/
+	)
+endef
+endif
+
+$(eval $(cargo-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
