Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0612C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:38:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B329061439
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B329061439
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9032042513;
	Wed, 29 Sep 2021 19:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJpiInFft3pP; Wed, 29 Sep 2021 19:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FC7C42517;
	Wed, 29 Sep 2021 19:38:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 411DD1BF388
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3176383F31
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iWl8aK3QpPZ for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 19:37:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4673B83F2B
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 19:37:52 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id t4so2297708plo.0
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 12:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NHqWU8zir2Ma+GNCb2jqOoaL0Hn/aXxqfFybGlo6hCU=;
 b=YPucbFshYswpBO8A14A0xr9DEFYngYRDEIVLnHl+J/Kwz+U0S58HfB/y1ooOyzHyw2
 +mLuikBoI2jomFXg93kSEDyMNrLUsEzppuUvrGV7O6yP/mAcHYqRSejckidhISRFusAO
 RiOO7O+fbvlM5r9l1JhqgaKOZjRU4X3t7uyEl+bLwj0squ3WUw/vQLU81Us/z1+3o3JK
 1jvN8yI+6iaocPvExnfX6NhNxercdPkZh1Cfr77jgqd1m8/KHdaZ0+OhMFq799nuGruv
 d8lGPU1JPqDc5F+4vq2bLN6i8b65MbSR9LZr4auNS0mVuDtIYkZnKdjj89ff3LrxH3XA
 yM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHqWU8zir2Ma+GNCb2jqOoaL0Hn/aXxqfFybGlo6hCU=;
 b=18GVEPiJCSrliu3x3qWReN0xrDdNMNKHofP3L0rQJdE8MhzKloznxnW5kPXtrmEo+3
 FmN7+bpXdG5xN9WibrVlgpxf6qx9SES1GgBsL7ioxE1GUcHiNjlxbO2PbuEPkLmLhRWF
 FquuyyQ3I/TzHTUJDLAOWq+f0FjkJ+1yHVCw6eKzboL99YpDNG0tE3FF6jJDRBaDdLmY
 4FZjhnqRmTL+kPBl71ICeQ1ipDsJAYlHiCBpg09C5hKlgR97ol+VGjAPXnRKysqX5lpA
 dVz6DVhLyh0VQRLSV0fJBktFHXXU7gsI3sqTyTSD+RaQajvZ1pS+eqVsRLFiJQYVjAXQ
 vSwQ==
X-Gm-Message-State: AOAM530QS7yy8e0BlwsJ/+88UtpuAL/k8Po7mFCIKA5VhM4EwpdKOoFe
 vLb+3rna+fAJfAuAWCm+Yu36ixvUtUc=
X-Google-Smtp-Source: ABdhPJwa/jurF/JZCmguY+oCXc1uzY8v+4NB8vkJIUPF/66QoaJ4irmwdB8v1ZMXhQwMR3EHZcKdRQ==
X-Received: by 2002:a17:902:9882:b0:13e:1749:daae with SMTP id
 s2-20020a170902988200b0013e1749daaemr248732plp.60.1632944271360; 
 Wed, 29 Sep 2021 12:37:51 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id q12sm440211pgv.26.2021.09.29.12.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:37:50 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 12:37:42 -0700
Message-Id: <20210929193742.1410522-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929193742.1410522-1-aduskett@gmail.com>
References: <20210929193742.1410522-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/RFC 2/2] package/nodejs: bump version to 14.17.6
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
Cc: Daniel Price <daniel.price@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes include:
  - Remove the dependency on Python2, as nodejs 14 supports Python 3.
  - Remove --without-snapshot as it's no longer a supported config option.
  - Remove /openssl to the shared-openssl-includes config option, as the build
    system automatically appends /openssl to the includes path.

  - Add a qemu wrapper. V8's JIT infrastructure requires binaries such as
    mksnapshot and mkpeephole to be run in the host during the build.
    However, these binaries must have the same bit-width as the target
    (e.g. a x86_64 host targeting ARMv6 needs to produce a 32-bit binary).
    To work around this issue, cross-compile the binaries for the target and
    run them on the host with QEMU, much like gobject-introspection.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../0001-add-qemu-wrapper-support.patch       | 76 ++++++++++++++++++
 package/nodejs/Config.in                      | 15 +++-
 package/nodejs/nodejs.hash                    |  6 +-
 package/nodejs/nodejs.mk                      | 78 +++++++++++--------
 package/nodejs/v8-qemu-wrapper.in             | 12 +++
 5 files changed, 146 insertions(+), 41 deletions(-)
 create mode 100644 package/nodejs/0001-add-qemu-wrapper-support.patch
 create mode 100644 package/nodejs/v8-qemu-wrapper.in

diff --git a/package/nodejs/0001-add-qemu-wrapper-support.patch b/package/nodejs/0001-add-qemu-wrapper-support.patch
new file mode 100644
index 0000000000..9b81e3adab
--- /dev/null
+++ b/package/nodejs/0001-add-qemu-wrapper-support.patch
@@ -0,0 +1,76 @@
+From fa09fa3ad6a21ae0b35fb860f76d1762e5f29972 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 27 Sep 2021 12:55:09 -0700
+Subject: [PATCH] 1
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ node.gyp                 | 4 ++--
+ tools/v8_gypfiles/v8.gyp | 8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/node.gyp b/node.gyp
+index 8ba0dfeb..c77f6f7d 100644
+--- a/node.gyp
++++ b/node.gyp
+@@ -491,7 +491,7 @@
+               'action_name': 'run_mkcodecache',
+               'process_outputs_as_sources': 1,
+               'inputs': [
+-                '<(mkcodecache_exec)',
++                @MAYBE_WRAPPER@ '<(mkcodecache_exec)',
+               ],
+               'outputs': [
+                 '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
+@@ -516,7 +516,7 @@
+               'action_name': 'node_mksnapshot',
+               'process_outputs_as_sources': 1,
+               'inputs': [
+-                '<(node_mksnapshot_exec)',
++                @MAYBE_WRAPPER@ '<(node_mksnapshot_exec)',
+               ],
+               'outputs': [
+                 '<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
+diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
+index 48ec392b..f9bb0fbe 100644
+--- a/tools/v8_gypfiles/v8.gyp
++++ b/tools/v8_gypfiles/v8.gyp
+@@ -220,7 +220,7 @@
+         {
+           'action_name': 'run_torque_action',
+           'inputs': [  # Order matters.
+-            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
++            @MAYBE_WRAPPER@ '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
+             '<@(torque_files)',
+           ],
+           'outputs': [
+@@ -351,7 +351,7 @@
+         {
+           'action_name': 'generate_bytecode_builtins_list_action',
+           'inputs': [
+-            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
++            @MAYBE_WRAPPER@ '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
+           ],
+           'outputs': [
+             '<(generate_bytecode_builtins_list_output)',
+@@ -533,7 +533,7 @@
+             ],
+           },
+           'inputs': [
+-            '<(mksnapshot_exec)',
++            @MAYBE_WRAPPER@ '<(mksnapshot_exec)',
+           ],
+           'outputs': [
+             '<(INTERMEDIATE_DIR)/snapshot.cc',
+@@ -1448,7 +1448,7 @@
+         {
+           'action_name': 'run_gen-regexp-special-case_action',
+           'inputs': [
+-            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)',
++            @MAYBE_WRAPPER@ '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)',
+           ],
+           'outputs': [
+             '<(SHARED_INTERMEDIATE_DIR)/src/regexp/special-case.cc',
+--
+2.31.1
+
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index ba3fde887d..7c48f4b6fe 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -4,28 +4,35 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
 	default y if BR2_mipsel && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_aarch64 || BR2_i386 || BR2_x86_64
+	default y if BR2_s390x
 	# libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.9, wchar"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR
+		!BR2_HOST_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_4_9
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
 	# uses dlopen(). On ARMv5, we could technically support static
 	# linking, but that's too much of a corner case to support it.
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_HOST_QEMU
+	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_ZLIB
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 8d39ef489d..22a752de42 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.22.6/SHASUMS256.txt
-sha256  c2022f16b8f689620c3472c2b5261fdabbd0ab976bf9ac3b7db6747a2e9b0f7a  node-v12.22.6.tar.xz
+# From https://nodejs.org/dist/v14.17.6/SHASUMS256.txt
+sha256  f458cd0b1cb1540611cb08709d833c0c59c74da79310ae1984cc8bad1404ad5e  node-v14.17.6.tar.xz
 
 # Hash for license file
-sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
+sha256  b85d503ce644bad3849a4d53a99c332845cde94394c8ebba5f0345dc1f696086  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 38e8936986..32f4947c0d 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.22.6
+NODEJS_VERSION = 14.17.6
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
-NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
+NODEJS_DEPENDENCIES = host-qemu host-python3 host-nodejs c-ares \
 	libuv zlib nghttp2 \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-python host-zlib
+HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-python3 host-zlib
 NODEJS_INSTALL_STAGING = YES
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
@@ -18,7 +18,6 @@ NODEJS_CPE_ID_VENDOR = nodejs
 NODEJS_CPE_ID_PRODUCT = node.js
 
 NODEJS_CONF_OPTS = \
-	--without-snapshot \
 	--shared-zlib \
 	--shared-cares \
 	--shared-libuv \
@@ -46,25 +45,17 @@ ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
 NODEJS_CONF_OPTS += --without-npm
 endif
 
-# nodejs build system is based on python, but only support python-2.6 or
-# python-2.7. So, we have to enforce PYTHON interpreter to be python2.
 define HOST_NODEJS_CONFIGURE_CMDS
-	# The build system directly calls python. Work around this by forcing python2
-	# into PATH. See https://github.com/nodejs/node/issues/2735
-	mkdir -p $(@D)/bin
-	ln -sf $(HOST_DIR)/bin/python2 $(@D)/bin/python
-
 	(cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
-		PYTHON=$(HOST_DIR)/bin/python2 \
-		$(HOST_DIR)/bin/python2 ./configure \
+		PYTHON=$(HOST_DIR)/bin/python3 \
+		$(HOST_DIR)/bin/python3 ./configure \
 		--prefix=$(HOST_DIR) \
-		--without-snapshot \
 		--without-dtrace \
 		--without-etw \
 		--shared-openssl \
-		--shared-openssl-includes=$(HOST_DIR)/include/openssl \
+		--shared-openssl-includes=$(HOST_DIR)/include \
 		--shared-openssl-libpath=$(HOST_DIR)/lib \
 		--shared-zlib \
 		--no-cross-compiling \
@@ -82,7 +73,7 @@ NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
 HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1
 
 define HOST_NODEJS_BUILD_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
 		CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
@@ -92,7 +83,7 @@ define HOST_NODEJS_BUILD_CMDS
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_CONFIGURE_OPTS) \
 		CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
@@ -152,17 +143,45 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 NODEJS_LDFLAGS += -latomic
 endif
 
-define NODEJS_CONFIGURE_CMDS
-	mkdir -p $(@D)/bin
-	ln -sf $(HOST_DIR)/bin/python2 $(@D)/bin/python
+# V8's JIT infrastructure requires binaries such as mksnapshot and
+# mkpeephole to be run in the host during the build. However, these
+# binaries must have the same bit-width as the target (e.g. a x86_64
+# host targeting ARMv6 needs to produce a 32-bit binary). To work around this
+# issue, cross-compile the binaries for the target and run them on the
+# host with QEMU, much like gobject-introspection.
+define NODEJS_INSTALL_V8_QEMU_WRAPPER
+	$(INSTALL) -D -m 755 $(NODEJS_PKGDIR)/v8-qemu-wrapper.in \
+		$(@D)/out/Release/v8-qemu-wrapper
+	$(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
+		$(@D)/out/Release/v8-qemu-wrapper
+	$(SED) "s%@TOOLCHAIN_HEADERS_VERSION@%$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)%g" \
+		$(@D)/out/Release/v8-qemu-wrapper
+	$(SED) "s%@QEMU_USERMODE_ARGS@%$(call qstrip,$(BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS))%g" \
+		$(@D)/out/Release/v8-qemu-wrapper
+endef
+NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_INSTALL_V8_QEMU_WRAPPER
 
+define NODEJS_WRAPPER_FIXUP
+	$(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/node.gyp
+	$(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/tools/v8_gypfiles/v8.gyp
+endef
+NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_WRAPPER_FIXUP
+
+# Do not run the qemu-wrapper for the host build.
+define HOST_NODEJS_WRAPPER_FIXUP
+	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/node.gyp
+	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/tools/v8_gypfiles/v8.gyp
+endef
+HOST_NODEJS_PRE_CONFIGURE_HOOKS += HOST_NODEJS_WRAPPER_FIXUP
+
+define NODEJS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
 		LDFLAGS="$(NODEJS_LDFLAGS)" \
 		LD="$(TARGET_CXX)" \
-		PYTHON=$(HOST_DIR)/bin/python2 \
-		$(HOST_DIR)/bin/python2 ./configure \
+		PYTHON=$(HOST_DIR)/bin/python3 \
+		$(HOST_DIR)/bin/python3 ./configure \
 		--prefix=/usr \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
@@ -171,19 +190,10 @@ define NODEJS_CONFIGURE_CMDS
 		$(if $(NODEJS_MIPS_FPU_MODE),--with-mips-fpu-mode=$(NODEJS_MIPS_FPU_MODE)) \
 		$(NODEJS_CONF_OPTS) \
 	)
-
-	$(foreach f,$(NODEJS_HOST_TOOLS_V8), \
-		$(SED) "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)$(f)<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/$(f)#" \
-			$(@D)/tools/v8_gypfiles/v8.gyp
-	)
-	$(foreach f,$(NODEJS_HOST_TOOLS_NODE), \
-		$(SED) "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)$(f)<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/bin/$(f)#" \
-			-i $(@D)/node.gyp
-	)
 endef
 
 define NODEJS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) \
 		$(TARGET_CONFIGURE_OPTS) \
 		NO_LOAD=cctest.target.mk \
@@ -223,7 +233,7 @@ endef
 endif
 
 define NODEJS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(STAGING_DIR) \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -234,7 +244,7 @@ define NODEJS_INSTALL_STAGING_CMDS
 endef
 
 define NODEJS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(TARGET_DIR) \
 		$(TARGET_CONFIGURE_OPTS) \
diff --git a/package/nodejs/v8-qemu-wrapper.in b/package/nodejs/v8-qemu-wrapper.in
new file mode 100644
index 0000000000..6ba6639d78
--- /dev/null
+++ b/package/nodejs/v8-qemu-wrapper.in
@@ -0,0 +1,12 @@
+#!/usr/bin/env sh
+
+# Pass -r to qemu-user as to trick glibc into not errorings out if the host kernel
+# is older than the target kernel.
+@QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
+    @QEMU_USERMODE_ARGS@ \
+   -L "${STAGING_DIR}/" \
+    "$@"
+
+if [ $? -ne 0 ]; then
+    exit 1
+fi
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
