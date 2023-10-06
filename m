Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E38E81E09
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 15:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CD8983C52;
	Fri,  6 Oct 2023 15:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CD8983C52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oFPey4MmtFWq; Fri,  6 Oct 2023 15:33:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5B7F83C50;
	Fri,  6 Oct 2023 15:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5B7F83C50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 792381BF997
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 15:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B1A342CCF
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 15:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B1A342CCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id So1C-LgmOGuK for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95A7C42CB8
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95A7C42CB8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8081484300; Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Oct 2023 17:31:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65dfac5d11596583e4e31ce83a05045a5c9a2ce6
X-Git-Newrev: 4c66ee3cda45bebf9044d09f0d2ceec2ea4298cd
X-Patchwork-Hint: ignore
Message-Id: <20231006153223.8081484300@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: move to
 package/nodejs/nodejs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c66ee3cda45bebf9044d09f0d2ceec2ea4298cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Later we will change host-nodejs into a virtual package with the option
to download the binary, or to build from source. Those two
implementations will share version etc., so we want them in a
subdirectory in order to guarantee order of inclusion.

As a preparatory step, move the existing, single nodejs implementation
down into a subdirectory.

The definitions in nodejs.mk that will later be shared between the
source and binary variants of the package stay in
package/nodejs/nodejs.mk; the rest moves down to
package/nodejs/nodejs/nodejs.mk.

The hash file will be shared between the implementations and therefore
stays in package/nodejs/nodejs.hash. package/nodejs/nodejs/nodejs.hash
is a symlink to it.

The Config.in and Config.in.host don't move. The two implementations
will only have blind options.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/nodejs/nodejs.mk                           | 253 +--------------------
 .../0001-add-qemu-wrapper-support.patch            |   0
 ...002-check-if-uclibc-has-backtrace-support.patch |   0
 ...3-include-obj-name-in-shared-intermediate.patch |   0
 ...l-modules-cjs-loader.js-adjust-default-pa.patch |   0
 package/nodejs/nodejs/nodejs.hash                  |   1 +
 package/nodejs/{ => nodejs}/nodejs.mk              |  27 +--
 package/nodejs/{ => nodejs}/v8-qemu-wrapper.in     |   0
 8 files changed, 5 insertions(+), 276 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index b8e57e567d..16e85b7ab9 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -7,231 +7,12 @@
 NODEJS_VERSION = 16.20.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
-NODEJS_DEPENDENCIES = \
-	host-ninja \
-	host-pkgconf \
-	host-python3 \
-	host-qemu \
-	c-ares \
-	libuv \
-	nghttp2 \
-	zlib \
-	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = \
-	host-icu \
-	host-libopenssl \
-	host-ninja \
-	host-pkgconf \
-	host-python3 \
-	host-zlib
-NODEJS_INSTALL_STAGING = YES
+
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
 NODEJS_CPE_ID_VENDOR = nodejs
 NODEJS_CPE_ID_PRODUCT = node.js
 
-NODEJS_CONF_OPTS = \
-	--shared-zlib \
-	--shared-cares \
-	--shared-libuv \
-	--shared-nghttp2 \
-	--without-dtrace \
-	--without-etw \
-	--cross-compiling \
-	--dest-os=linux \
-	--ninja
-
-HOST_NODEJS_MAKE_OPTS = \
-	$(HOST_CONFIGURE_OPTS) \
-	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
-	LDFLAGS.host="$(HOST_LDFLAGS)" \
-	NO_LOAD=cctest.target.mk \
-	PATH=$(@D)/bin:$(BR_PATH) \
-	JOBS=$(PARALLEL_JOBS)
-
-NODEJS_MAKE_OPTS = \
-	$(TARGET_CONFIGURE_OPTS) \
-	NO_LOAD=cctest.target.mk \
-	PATH=$(@D)/bin:$(BR_PATH) \
-	LDFLAGS="$(NODEJS_LDFLAGS)" \
-	LD="$(TARGET_CXX)" \
-	JOBS=$(PARALLEL_JOBS)
-
-# nodejs's build system uses python which can be a symlink to an unsupported
-# python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by
-# forcing host-python3 early in the PATH, via a python->python3 symlink.
-define NODEJS_PYTHON3_SYMLINK
-	mkdir -p $(@D)/bin
-	ln -sf $(HOST_DIR)/bin/python3 $(@D)/bin/python
-endef
-HOST_NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_PYTHON3_SYMLINK
-NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_PYTHON3_SYMLINK
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NODEJS_DEPENDENCIES += openssl
-NODEJS_CONF_OPTS += --shared-openssl
-else
-NODEJS_CONF_OPTS += --without-ssl
-endif
-
-ifeq ($(BR2_PACKAGE_ICU),y)
-NODEJS_DEPENDENCIES += icu
-NODEJS_CONF_OPTS += --with-intl=system-icu
-else
-NODEJS_CONF_OPTS += --with-intl=none
-endif
-
-ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
-NODEJS_CONF_OPTS += --without-npm
-endif
-
-define HOST_NODEJS_CONFIGURE_CMDS
-	cd $(@D); \
-		$(HOST_CONFIGURE_OPTS) \
-		PATH=$(@D)/bin:$(BR_PATH) \
-		PYTHON=$(HOST_DIR)/bin/python3 \
-		$(HOST_DIR)/bin/python3 configure.py \
-		--prefix=$(HOST_DIR) \
-		--without-dtrace \
-		--without-etw \
-		--shared-openssl \
-		--shared-openssl-includes=$(HOST_DIR)/include \
-		--shared-openssl-libpath=$(HOST_DIR)/lib \
-		--shared-zlib \
-		--no-cross-compiling \
-		--with-intl=system-icu \
-		--ninja
-endef
-
-HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS)
-
-define HOST_NODEJS_BUILD_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
-		$(MAKE) -C $(@D) \
-		$(HOST_NODEJS_MAKE_OPTS)
-endef
-
-ifeq ($(BR2_PACKAGE_HOST_NODEJS_COREPACK),y)
-define HOST_NODEJS_ENABLE_COREPACK
-	$(COREPACK) enable
-endef
-endif
-
-define HOST_NODEJS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
-		$(MAKE) -C $(@D) install \
-		$(HOST_NODEJS_MAKE_OPTS)
-	$(HOST_NODEJS_ENABLE_COREPACK)
-endef
-
-ifeq ($(BR2_i386),y)
-NODEJS_CPU = ia32
-else ifeq ($(BR2_x86_64),y)
-NODEJS_CPU = x64
-else ifeq ($(BR2_mips),y)
-NODEJS_CPU = mips
-else ifeq ($(BR2_mipsel),y)
-NODEJS_CPU = mipsel
-else ifeq ($(BR2_arm),y)
-NODEJS_CPU = arm
-# V8 needs to know what floating point ABI the target is using.
-NODEJS_ARM_FP = $(GCC_TARGET_FLOAT_ABI)
-# it also wants to know which FPU to use, but only has support for
-# vfp, vfpv3, vfpv3-d16 and neon.
-ifeq ($(BR2_ARM_FPU_VFPV2),y)
-NODEJS_ARM_FPU = vfp
-# vfpv4 is a superset of vfpv3
-else ifeq ($(BR2_ARM_FPU_VFPV3)$(BR2_ARM_FPU_VFPV4),y)
-NODEJS_ARM_FPU = vfpv3
-# vfpv4-d16 is a superset of vfpv3-d16
-else ifeq ($(BR2_ARM_FPU_VFPV3D16)$(BR2_ARM_FPU_VFPV4D16),y)
-NODEJS_ARM_FPU = vfpv3-d16
-else ifeq ($(BR2_ARM_FPU_NEON),y)
-NODEJS_ARM_FPU = neon
-endif
-else ifeq ($(BR2_aarch64),y)
-NODEJS_CPU = arm64
-endif
-
-# MIPS architecture specific options
-ifeq ($(BR2_mips)$(BR2_mipsel),y)
-ifeq ($(BR2_MIPS_CPU_MIPS32R6),y)
-NODEJS_MIPS_ARCH_VARIANT = r6
-NODEJS_MIPS_FPU_MODE = fp64
-else ifeq ($(BR2_MIPS_CPU_MIPS32R2),y)
-NODEJS_MIPS_ARCH_VARIANT = r2
-else ifeq ($(BR2_MIPS_CPU_MIPS32),y)
-NODEJS_MIPS_ARCH_VARIANT = r1
-endif
-endif
-
-NODEJS_LDFLAGS = $(TARGET_LDFLAGS)
-
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-NODEJS_LDFLAGS += -latomic
-endif
-
-# V8's JIT infrastructure requires binaries such as mksnapshot and
-# mkpeephole to be run in the host during the build. However, these
-# binaries must have the same bit-width as the target (e.g. a x86_64
-# host targeting ARMv6 needs to produce a 32-bit binary). To work around this
-# issue, cross-compile the binaries for the target and run them on the
-# host with QEMU, much like gobject-introspection.
-define NODEJS_INSTALL_V8_QEMU_WRAPPER
-	$(INSTALL) -D -m 755 $(NODEJS_PKGDIR)/v8-qemu-wrapper.in \
-		$(@D)/out/Release/v8-qemu-wrapper
-	$(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
-		$(@D)/out/Release/v8-qemu-wrapper
-	$(SED) "s%@TOOLCHAIN_HEADERS_VERSION@%$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)%g" \
-		$(@D)/out/Release/v8-qemu-wrapper
-	$(SED) "s%@QEMU_USERMODE_ARGS@%$(call qstrip,$(BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS))%g" \
-		$(@D)/out/Release/v8-qemu-wrapper
-endef
-NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_INSTALL_V8_QEMU_WRAPPER
-
-define NODEJS_WRAPPER_FIXUP
-	$(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/node.gyp
-	$(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/tools/v8_gypfiles/v8.gyp
-endef
-NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_WRAPPER_FIXUP
-
-# Do not run the qemu-wrapper for the host build.
-define HOST_NODEJS_WRAPPER_FIXUP
-	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/node.gyp
-	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/tools/v8_gypfiles/v8.gyp
-endef
-HOST_NODEJS_PRE_CONFIGURE_HOOKS += HOST_NODEJS_WRAPPER_FIXUP
-
-define NODEJS_CONFIGURE_CMDS
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) \
-		PATH=$(@D)/bin:$(BR_PATH) \
-		LDFLAGS="$(NODEJS_LDFLAGS)" \
-		LD="$(TARGET_CXX)" \
-		PYTHON=$(HOST_DIR)/bin/python3 \
-		$(HOST_DIR)/bin/python3 configure.py \
-		--prefix=/usr \
-		--dest-cpu=$(NODEJS_CPU) \
-		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
-		$(if $(NODEJS_ARM_FPU),--with-arm-fpu=$(NODEJS_ARM_FPU)) \
-		$(if $(NODEJS_MIPS_ARCH_VARIANT),--with-mips-arch-variant=$(NODEJS_MIPS_ARCH_VARIANT)) \
-		$(if $(NODEJS_MIPS_FPU_MODE),--with-mips-fpu-mode=$(NODEJS_MIPS_FPU_MODE)) \
-		$(NODEJS_CONF_OPTS) \
-	)
-endef
-
-define NODEJS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
-		$(MAKE) -C $(@D) \
-		$(NODEJS_MAKE_OPTS)
-endef
-
-#
-# Build the list of modules to install.
-#
-NODEJS_MODULES_LIST= $(call qstrip,\
-	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
-
 NODEJS_BIN_ENV = $(TARGET_CONFIGURE_OPTS) \
 	LDFLAGS="$(NODEJS_LDFLAGS)" \
 	LD="$(TARGET_CXX)" \
@@ -250,34 +31,4 @@ PNPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/pnpm
 YARN = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/yarn
 endif
 
-#
-# We can only call NPM if there's something to install.
-#
-ifneq ($(NODEJS_MODULES_LIST),)
-NODEJS_DEPENDENCIES += host-nodejs
-define NODEJS_INSTALL_MODULES
-	# If you're having trouble with module installation, adding -d to the
-	# npm install call below and setting npm_config_rollback=false can both
-	# help in diagnosing the problem.
-	$(NPM) install -g $(NODEJS_MODULES_LIST)
-endef
-endif
-
-define NODEJS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
-		$(MAKE) -C $(@D) install \
-		DESTDIR=$(STAGING_DIR) \
-		$(NODEJS_MAKE_OPTS)
-endef
-
-define NODEJS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
-		$(MAKE) -C $(@D) install \
-		DESTDIR=$(TARGET_DIR) \
-		$(NODEJS_MAKE_OPTS)
-	$(NODEJS_INSTALL_MODULES)
-endef
-
-# node.js configure is a Python script and does not use autotools
-$(eval $(generic-package))
-$(eval $(host-generic-package))
+include $(sort $(wildcard package/nodejs/*/*.mk))
diff --git a/package/nodejs/0001-add-qemu-wrapper-support.patch b/package/nodejs/nodejs/0001-add-qemu-wrapper-support.patch
similarity index 100%
rename from package/nodejs/0001-add-qemu-wrapper-support.patch
rename to package/nodejs/nodejs/0001-add-qemu-wrapper-support.patch
diff --git a/package/nodejs/0002-check-if-uclibc-has-backtrace-support.patch b/package/nodejs/nodejs/0002-check-if-uclibc-has-backtrace-support.patch
similarity index 100%
rename from package/nodejs/0002-check-if-uclibc-has-backtrace-support.patch
rename to package/nodejs/nodejs/0002-check-if-uclibc-has-backtrace-support.patch
diff --git a/package/nodejs/0003-include-obj-name-in-shared-intermediate.patch b/package/nodejs/nodejs/0003-include-obj-name-in-shared-intermediate.patch
similarity index 100%
rename from package/nodejs/0003-include-obj-name-in-shared-intermediate.patch
rename to package/nodejs/nodejs/0003-include-obj-name-in-shared-intermediate.patch
diff --git a/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch b/package/nodejs/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
similarity index 100%
rename from package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
rename to package/nodejs/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
diff --git a/package/nodejs/nodejs/nodejs.hash b/package/nodejs/nodejs/nodejs.hash
new file mode 120000
index 0000000000..0c3ac2ce77
--- /dev/null
+++ b/package/nodejs/nodejs/nodejs.hash
@@ -0,0 +1 @@
+../nodejs.hash
\ No newline at end of file
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs/nodejs.mk
similarity index 88%
copy from package/nodejs/nodejs.mk
copy to package/nodejs/nodejs/nodejs.mk
index b8e57e567d..24cd4ded1f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs/nodejs.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 16.20.0
-NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
-NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
+# version etc. already defined in package/nodejs/nodejs.mk
+
 NODEJS_DEPENDENCIES = \
 	host-ninja \
 	host-pkgconf \
@@ -25,10 +24,6 @@ HOST_NODEJS_DEPENDENCIES = \
 	host-python3 \
 	host-zlib
 NODEJS_INSTALL_STAGING = YES
-NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
-NODEJS_LICENSE_FILES = LICENSE
-NODEJS_CPE_ID_VENDOR = nodejs
-NODEJS_CPE_ID_PRODUCT = node.js
 
 NODEJS_CONF_OPTS = \
 	--shared-zlib \
@@ -232,24 +227,6 @@ endef
 NODEJS_MODULES_LIST= $(call qstrip,\
 	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
 
-NODEJS_BIN_ENV = $(TARGET_CONFIGURE_OPTS) \
-	LDFLAGS="$(NODEJS_LDFLAGS)" \
-	LD="$(TARGET_CXX)" \
-	npm_config_arch=$(NODEJS_CPU) \
-	npm_config_target_arch=$(NODEJS_CPU) \
-	npm_config_build_from_source=true \
-	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
-	npm_config_prefix=$(TARGET_DIR)/usr \
-	npm_config_cache=$(BUILD_DIR)/.npm-cache
-
-# Define various packaging tools for other packages to use
-NPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/npm
-ifeq ($(BR2_PACKAGE_HOST_NODEJS_COREPACK),y)
-COREPACK = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/corepack
-PNPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/pnpm
-YARN = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/yarn
-endif
-
 #
 # We can only call NPM if there's something to install.
 #
diff --git a/package/nodejs/v8-qemu-wrapper.in b/package/nodejs/nodejs/v8-qemu-wrapper.in
similarity index 100%
rename from package/nodejs/v8-qemu-wrapper.in
rename to package/nodejs/nodejs/v8-qemu-wrapper.in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
