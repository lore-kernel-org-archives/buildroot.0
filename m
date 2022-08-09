Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B74C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 09:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE5B409EE;
	Tue,  9 Aug 2022 09:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE5B409EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvfwqqSp0cao; Tue,  9 Aug 2022 09:41:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4328E40996;
	Tue,  9 Aug 2022 09:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4328E40996
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDBBA1BF5EA
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 09:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9945A40576
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 09:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9945A40576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id koXdRynWg5Cb for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 09:41:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F4340151
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91F4340151
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 09:41:25 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id p132so13186106oif.9
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 02:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=BnYyvuYeQAp5G5OOeg5yITwouNvR1QBZlXWkLN8yuXA=;
 b=UBc9PThv0jUI8EASgVKV0aPI6b1R8x8i1oq6ACeYs7n2/Q7TJ5L2sRt32vWYnjLIFK
 B1OPJu9KItypretr3ZRtHOXo+KqBiN9ZZuLrIaiEDToC9kP25J5Ts7fa5dfJhKVKVmyX
 K3bIYqk1fFcaG+pqWYi3SHusLI8zGZoQcih5rgpaJsPTRKKi859nAexoXHGZ0WfyI4F4
 sZSg1Mw1EaRjO8695+ZOwaHGRov7pghEbHD04mcGIcI0UctzLwKY5lV3SqA5/IkGlVvK
 nbY4RBhlcCHYyhmhR524qFuf28rN8FkKQaCCTwWQ7n0OiTWEnhiInJwgrWtDYVzVSd68
 +vBA==
X-Gm-Message-State: ACgBeo3tuuHDfTENs+UOc5WhqlwDQUvxyu7lliDq0bY1xYdppkp5UGvl
 hFLAVYkzw1Z01xnZNBsjT8YCKyvicls=
X-Google-Smtp-Source: AA6agR7dDEkUeoZHSMzF4EcRNk3P48klnyGEc+0B2HrCeHnIZ04kWoJM2+6vXpP9bzX3MrQ1zebMLg==
X-Received: by 2002:a05:6808:643:b0:343:1207:b0b7 with SMTP id
 z3-20020a056808064300b003431207b0b7mr869133oih.97.1660038083954; 
 Tue, 09 Aug 2022 02:41:23 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 t2-20020a0568301e2200b00636ff7d2cc7sm826508otr.79.2022.08.09.02.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 02:41:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 03:41:08 -0600
Message-Id: <20220809094109.2279598-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=BnYyvuYeQAp5G5OOeg5yITwouNvR1QBZlXWkLN8yuXA=;
 b=KFOIJGGyvw5JMTRH5TwZ8/o6klAU8kbXWg8LDrZkeVVSVRTfjzvwqd5/LTVgwtVhUG
 5IX5U5+erYuVhg4MmALEzwIolXcfVsItJqjsNacOTnpkstmyzjnmKWpEkMzaSCOIV9hy
 G26DvtATTKjT8Mq3hMx76H1R1J49aQ6eVYJi9Nc3iINtTpXgyk7Q0U9sjKqqAvaI09KR
 1tehUqj6Jyvedh9RwjluoQPIK/X4ZeRvh6R6WjMY0LtLO6eklltyVITKd+WTx47/J2/Z
 xFdZ8/DuW8TQM0OkQyrBPlsdkkjUDr4opuAEowo67fTf1eak5UEkkkLdTSALVGbrUE2k
 eMiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KFOIJGGy
Subject: [Buildroot] [PATCH 1/2] package/gcc/gcc-bpf: add BPF target support
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
Cc: "Jose E . Marchesi" <jose.marchesi@oracle.com>,
 David Faust <david.faust@oracle.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds GCC BPF target support, however unlike traditional targets
the BPF target is effectively used by packages such as systemd as
a separate language rather than an entirely separate architecture.

As such we need to build what is effectively a multi-arch toolchain
for GCC BPF support, as the BPF target is effectively a bare metal
target this isn't the same as a multi-lib toolchain and generally
avoids library conflict issues as the BPF target does not have
userspace libraries.

This adds an additional gcc build stage which is similar to gcc-final
and added as a toolchain dependency when BPF target support is
enabled.

Similar to our gcc toolchain we also need a toolchain wrapper, this
is separate from our normal toolchain wrapper.

Cc: Jose E. Marchesi <jose.marchesi@oracle.com>
Cc: David Faust <david.faust@oracle.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Makefile.in                           |   3 +
 package/gcc/Config.in.host                    |  12 ++
 package/gcc/gcc-bpf/gcc-bpf.hash              |   1 +
 package/gcc/gcc-bpf/gcc-bpf.mk                | 116 ++++++++++++++++++
 .../toolchain-buildroot.mk                    |   4 +
 5 files changed, 136 insertions(+)
 create mode 120000 package/gcc/gcc-bpf/gcc-bpf.hash
 create mode 100644 package/gcc/gcc-bpf/gcc-bpf.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index ff60f85092..a6f5292903 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -39,6 +39,9 @@ endif
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
+# Compute BPF_TARGET_NAME
+BPF_TARGET_NAME = bpf-$(TARGET_VENDOR)-none
+
 # FLAT binary format needs uclinux, except RISC-V 64-bits which needs
 # the regular linux name.
 ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ba2a2ee072..c49f6e6b26 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -60,6 +60,10 @@ config BR2_GCC_VERSION_12_X
 
 endchoice
 
+config BR2_GCC_SUPPORTS_BPF
+	bool
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_12
+
 # libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
 config BR2_GCC_SUPPORTS_LIBCILKRTS
 	bool
@@ -94,6 +98,14 @@ config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	  include. Those options are applied for all of the gcc
 	  initial, gcc intermediate and gcc final passes.
 
+config BR2_TOOLCHAIN_BUILDROOT_BPF
+	bool "Enable bpf support"
+	depends on BR2_GCC_SUPPORTS_BPF
+	depends on BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_BPF
+	help
+	  Enable this option if you want your toolchain to support BPF
+	  targets.
+
 config BR2_TOOLCHAIN_BUILDROOT_CXX
 	bool "Enable C++ support"
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/package/gcc/gcc-bpf/gcc-bpf.hash b/package/gcc/gcc-bpf/gcc-bpf.hash
new file mode 120000
index 0000000000..7ac9361ab2
--- /dev/null
+++ b/package/gcc/gcc-bpf/gcc-bpf.hash
@@ -0,0 +1 @@
+../gcc.hash
\ No newline at end of file
diff --git a/package/gcc/gcc-bpf/gcc-bpf.mk b/package/gcc/gcc-bpf/gcc-bpf.mk
new file mode 100644
index 0000000000..b12d27ad00
--- /dev/null
+++ b/package/gcc/gcc-bpf/gcc-bpf.mk
@@ -0,0 +1,116 @@
+################################################################################
+#
+# gcc-bpf
+#
+################################################################################
+
+GCC_BPF_VERSION = $(GCC_VERSION)
+GCC_BPF_SITE = $(GCC_SITE)
+GCC_BPF_SOURCE = $(GCC_SOURCE)
+
+HOST_GCC_BPF_DL_SUBDIR = gcc
+
+HOST_GCC_BPF_DEPENDENCIES = \
+	$(HOST_GCC_COMMON_DEPENDENCIES) \
+	$(BR_LIBC)
+
+HOST_GCC_BPF_EXCLUDES = $(HOST_GCC_EXCLUDES)
+
+HOST_GCC_BPF_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
+
+# gcc doesn't support in-tree build, so we create a 'build'
+# subdirectory in the gcc sources, and build from there.
+HOST_GCC_BPF_SUBDIR = build
+
+HOST_GCC_BPF_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
+
+HOST_GCC_BPF_CONF_OPTS = \
+	--target=$(BPF_TARGET_NAME) \
+	--prefix="$(HOST_DIR)" \
+	--sysconfdir="$(HOST_DIR)/etc" \
+	--enable-languages=c \
+	--with-gnu-ld \
+	--enable-static \
+	--disable-decimal-float \
+	--disable-gcov \
+	--disable-libssp \
+	--disable-multilib \
+	--disable-shared \
+	--with-gmp=$(HOST_DIR) \
+	--with-mpc=$(HOST_DIR) \
+	--with-mpfr=$(HOST_DIR) \
+	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
+	--with-bugurl="http://bugs.buildroot.net/" \
+	--without-zstd \
+	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
+
+ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
+HOST_GCC_BPF_DEPENDENCIES += host-isl
+HOST_GCC_BPF_CONF_OPTS += --with-isl=$(HOST_DIR)
+else
+HOST_GCC_BPF_CONF_OPTS += --without-isl --without-cloog
+endif
+
+# Don't build documentation. It takes up extra space / build time,
+# and sometimes needs specific makeinfo versions to work
+HOST_GCC_BPF_CONF_ENV = \
+	MAKEINFO=missing
+
+# Make sure we have 'cc'
+define HOST_GCC_BPF_CREATE_CC_SYMLINKS
+	if [ ! -e $(HOST_DIR)/bin/$(BPF_TARGET_NAME)-cc ]; then \
+		ln -f $(HOST_DIR)/bin/$(BPF_TARGET_NAME)-gcc \
+			$(HOST_DIR)/bin/$(BPF_TARGET_NAME)-cc; \
+	fi
+endef
+
+HOST_GCC_BPF_POST_INSTALL_HOOKS += HOST_GCC_BPF_CREATE_CC_SYMLINKS
+
+HOST_GCC_BPF_MAKE_OPTS = $(HOST_GCC_COMMON_MAKE_OPTS) all-gcc all-target-libgcc
+HOST_GCC_BPF_INSTALL_OPTS = install-gcc install-target-libgcc
+
+HOST_GCC_BPF_TOOLCHAIN_WRAPPER_ARGS = -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
+HOST_GCC_BPF_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
+
+define HOST_GCC_BPF_TOOLCHAIN_WRAPPER_BUILD
+	$(HOSTCC) $(HOST_CFLAGS) $(HOST_GCC_BPF_TOOLCHAIN_WRAPPER_ARGS) \
+		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
+		toolchain/toolchain-wrapper.c \
+		-o $(@D)/toolchain-wrapper-bpf
+endef
+
+define HOST_GCC_BPF_TOOLCHAIN_WRAPPER_INSTALL
+	$(INSTALL) -D -m 0755 $(@D)/toolchain-wrapper-bpf \
+		$(HOST_DIR)/bin/toolchain-wrapper-bpf
+endef
+
+HOST_GCC_BPF_POST_BUILD_HOOKS += HOST_GCC_BPF_TOOLCHAIN_WRAPPER_BUILD
+HOST_GCC_BPF_POST_INSTALL_HOOKS += HOST_GCC_BPF_TOOLCHAIN_WRAPPER_INSTALL
+
+define HOST_GCC_BPF_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+	$(Q)cd $(HOST_DIR)/bin; \
+	for i in $(BPF_TARGET_NAME)-*; do \
+		case "$$i" in \
+		*.br_real) \
+			;; \
+		*-ar|*-ranlib|*-nm) \
+			ln -snf $$i bpf$${i##$(BPF_TARGET_NAME)}; \
+			;; \
+		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran|*-gdc) \
+			rm -f $$i.br_real; \
+			mv $$i $$i.br_real; \
+			ln -sf toolchain-wrapper-bpf $$i; \
+			ln -sf toolchain-wrapper-bpf bpf$${i##$(BPF_TARGET_NAME)}; \
+			ln -snf $$i.br_real bpf$${i##$(BPF_TARGET_NAME)}.br_real; \
+			;; \
+		*) \
+			ln -snf $$i bpf$${i##$(BPF_TARGET_NAME)}; \
+			;; \
+		esac; \
+	done
+
+endef
+
+HOST_GCC_BPF_POST_INSTALL_HOOKS += HOST_GCC_BPF_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+
+$(eval $(host-autotools-package))
diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index b30cc332d2..34e7e49a5f 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -12,6 +12,10 @@ BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
 TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_BPF),y)
+TOOLCHAIN_BUILDROOT_DEPENDENCIES += host-gcc-bpf
+endif
+
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 $(eval $(virtual-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
