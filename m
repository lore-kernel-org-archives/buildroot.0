Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CF9E81E0B
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 15:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DC1883C2F;
	Fri,  6 Oct 2023 15:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DC1883C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z_utELDUPgQb; Fri,  6 Oct 2023 15:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E6B83C2E;
	Fri,  6 Oct 2023 15:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89E6B83C2E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73FE31BF32D
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 15:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A3F082D2F
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 15:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A3F082D2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tup3TpMPWRqT for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD86A83C2F
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD86A83C2F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B11784307; Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Oct 2023 17:31:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c66ee3cda45bebf9044d09f0d2ceec2ea4298cd
X-Git-Newrev: 4cbc2af604e73780c0c6b5c093c55c2f7ee2c4e3
X-Patchwork-Hint: ignore
Message-Id: <20231006153223.9B11784307@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: rename to nodejs-src and
 convert to virtual package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4cbc2af604e73780c0c6b5c093c55c2f7ee2c4e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-nodejs is quite long to build (5 minutes on a very fast build
machine), and will become a download dependency when we implement
vendoring for NodeJS-based packages.

In order to mitigate this build time, an idea is to use a pre-compiled
host NodeJS. One option would be to use a pre-installed NodeJS, but
we're concerned by version compatibility issues of the host NodeJS/NPM
does not have the same version as the target NodeJS/NPM. So another
option is to use a pre-compiled NodeJS provided by the NodeJS project
itself.

To achieve this, this commit turns the host-nodejs package into a
virtual package. For the time being, this has just one provider:
host-nodejs-src, which builds host-nodejs from source. This is the
original host-nodejs package, renamed to host-nodejs-src.

The target nodejs package is also renamed to nodejs-src in order to have
a single package nodejs-src that has a host and target version, as
usual. We do keep the nodejs target package itself, but it's an empty
package - not even a virtual package. This means the following.
- Its VERSION, SOURCE and SITE variables are left empty. The existing
  variables are renamed to NODEJS_COMMON_VERSION etc. to allow them to
  be reused by nodejs-src and the future nodejs-bin.
- It's a generic package with a single dependency, nodejs-src.
- The Config.in remains unchanged, except that it selects
  BR2_PACKAGE_NODEJS_SRC.
- BR2_PACKAGE_NODEJS_SRC is a blind option.

Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/Config.in                           |   3 +
 package/nodejs/Config.in.host                      |   4 +
 .../0001-add-qemu-wrapper-support.patch            |   0
 ...002-check-if-uclibc-has-backtrace-support.patch |   0
 ...3-include-obj-name-in-shared-intermediate.patch |   0
 ...l-modules-cjs-loader.js-adjust-default-pa.patch |   0
 package/nodejs/nodejs-src/Config.in                |   2 +
 .../nodejs.hash => nodejs-src/nodejs-src.hash}     |   0
 .../{nodejs/nodejs.mk => nodejs-src/nodejs-src.mk} | 154 +++++++++++----------
 .../{nodejs => nodejs-src}/v8-qemu-wrapper.in      |   0
 package/nodejs/nodejs.mk                           |  11 +-
 11 files changed, 99 insertions(+), 75 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 1489306be0..c684f8eb86 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_NODEJS
 	# uses dlopen(). On ARMv5, we could technically support static
 	# linking, but that's too much of a corner case to support it.
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_NODEJS_SRC
 	select BR2_PACKAGE_HOST_NODEJS if BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL != ""
 	select BR2_PACKAGE_HOST_PYTHON3
 	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
@@ -85,3 +86,5 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
 	  modules.
 
 endif
+
+source "package/nodejs/nodejs-src/Config.in"
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index 06a1ca22ad..72b498dada 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -28,4 +28,8 @@ config BR2_PACKAGE_HOST_NODEJS_COREPACK
 	  what currently happens with npm, which is shipped by Node.js
 	  by default.
 
+config BR2_PACKAGE_PROVIDES_HOST_NODEJS
+	string
+	default "host-nodejs-src"
+
 endif
diff --git a/package/nodejs/nodejs/0001-add-qemu-wrapper-support.patch b/package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch
similarity index 100%
rename from package/nodejs/nodejs/0001-add-qemu-wrapper-support.patch
rename to package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch
diff --git a/package/nodejs/nodejs/0002-check-if-uclibc-has-backtrace-support.patch b/package/nodejs/nodejs-src/0002-check-if-uclibc-has-backtrace-support.patch
similarity index 100%
rename from package/nodejs/nodejs/0002-check-if-uclibc-has-backtrace-support.patch
rename to package/nodejs/nodejs-src/0002-check-if-uclibc-has-backtrace-support.patch
diff --git a/package/nodejs/nodejs/0003-include-obj-name-in-shared-intermediate.patch b/package/nodejs/nodejs-src/0003-include-obj-name-in-shared-intermediate.patch
similarity index 100%
rename from package/nodejs/nodejs/0003-include-obj-name-in-shared-intermediate.patch
rename to package/nodejs/nodejs-src/0003-include-obj-name-in-shared-intermediate.patch
diff --git a/package/nodejs/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch b/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
similarity index 100%
rename from package/nodejs/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
rename to package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
diff --git a/package/nodejs/nodejs-src/Config.in b/package/nodejs/nodejs-src/Config.in
new file mode 100644
index 0000000000..90b061f616
--- /dev/null
+++ b/package/nodejs/nodejs-src/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_NODEJS_SRC
+	bool
diff --git a/package/nodejs/nodejs/nodejs.hash b/package/nodejs/nodejs-src/nodejs-src.hash
similarity index 100%
rename from package/nodejs/nodejs/nodejs.hash
rename to package/nodejs/nodejs-src/nodejs-src.hash
diff --git a/package/nodejs/nodejs/nodejs.mk b/package/nodejs/nodejs-src/nodejs-src.mk
similarity index 60%
rename from package/nodejs/nodejs/nodejs.mk
rename to package/nodejs/nodejs-src/nodejs-src.mk
index 24cd4ded1f..3452c93728 100644
--- a/package/nodejs/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs-src/nodejs-src.mk
@@ -1,12 +1,22 @@
 ################################################################################
 #
-# nodejs
+# nodejs-src
 #
 ################################################################################
 
-# version etc. already defined in package/nodejs/nodejs.mk
+NODEJS_SRC_VERSION = $(NODEJS_COMMON_VERSION)
+NODEJS_SRC_SOURCE = $(NODEJS_COMMON_SOURCE)
+NODEJS_SRC_SITE = $(NODEJS_COMMON_SITE)
+NODEJS_SRC_DL_SUBDIR = nodejs
 
-NODEJS_DEPENDENCIES = \
+NODEJS_SRC_LICENSE = $(NODEJS_LICENSE)
+NODEJS_SRC_LICENSE_FILES = $(NODEJS_LICENSE_FILES)
+NODEJS_SRC_CPE_ID_VENDOR = $(NODEJS_CPE_ID_VENDOR)
+NODEJS_SRC_CPE_ID_PRODUCT = $(NODEJS_CPE_ID_PRODUCT)
+
+HOST_NODEJS_SRC_PROVIDES = host-nodejs
+
+NODEJS_SRC_DEPENDENCIES = \
 	host-ninja \
 	host-pkgconf \
 	host-python3 \
@@ -16,16 +26,16 @@ NODEJS_DEPENDENCIES = \
 	nghttp2 \
 	zlib \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = \
+HOST_NODEJS_SRC_DEPENDENCIES = \
 	host-icu \
 	host-libopenssl \
 	host-ninja \
 	host-pkgconf \
 	host-python3 \
 	host-zlib
-NODEJS_INSTALL_STAGING = YES
+NODEJS_SRC_INSTALL_STAGING = YES
 
-NODEJS_CONF_OPTS = \
+NODEJS_SRC_CONF_OPTS = \
 	--shared-zlib \
 	--shared-cares \
 	--shared-libuv \
@@ -36,51 +46,51 @@ NODEJS_CONF_OPTS = \
 	--dest-os=linux \
 	--ninja
 
-HOST_NODEJS_MAKE_OPTS = \
+HOST_NODEJS_SRC_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
-	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
+	CXXFLAGS="$(HOST_NODEJS_SRC_CXXFLAGS)" \
 	LDFLAGS.host="$(HOST_LDFLAGS)" \
 	NO_LOAD=cctest.target.mk \
 	PATH=$(@D)/bin:$(BR_PATH) \
 	JOBS=$(PARALLEL_JOBS)
 
-NODEJS_MAKE_OPTS = \
+NODEJS_SRC_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
 	NO_LOAD=cctest.target.mk \
 	PATH=$(@D)/bin:$(BR_PATH) \
-	LDFLAGS="$(NODEJS_LDFLAGS)" \
+	LDFLAGS="$(NODEJS_SRC_LDFLAGS)" \
 	LD="$(TARGET_CXX)" \
 	JOBS=$(PARALLEL_JOBS)
 
 # nodejs's build system uses python which can be a symlink to an unsupported
 # python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by
 # forcing host-python3 early in the PATH, via a python->python3 symlink.
-define NODEJS_PYTHON3_SYMLINK
+define NODEJS_SRC_PYTHON3_SYMLINK
 	mkdir -p $(@D)/bin
 	ln -sf $(HOST_DIR)/bin/python3 $(@D)/bin/python
 endef
-HOST_NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_PYTHON3_SYMLINK
-NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_PYTHON3_SYMLINK
+HOST_NODEJS_SRC_PRE_CONFIGURE_HOOKS += NODEJS_SRC_PYTHON3_SYMLINK
+NODEJS_SRC_PRE_CONFIGURE_HOOKS += NODEJS_SRC_PYTHON3_SYMLINK
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NODEJS_DEPENDENCIES += openssl
-NODEJS_CONF_OPTS += --shared-openssl
+NODEJS_SRC_DEPENDENCIES += openssl
+NODEJS_SRC_CONF_OPTS += --shared-openssl
 else
-NODEJS_CONF_OPTS += --without-ssl
+NODEJS_SRC_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
-NODEJS_DEPENDENCIES += icu
-NODEJS_CONF_OPTS += --with-intl=system-icu
+NODEJS_SRC_DEPENDENCIES += icu
+NODEJS_SRC_CONF_OPTS += --with-intl=system-icu
 else
-NODEJS_CONF_OPTS += --with-intl=none
+NODEJS_SRC_CONF_OPTS += --with-intl=none
 endif
 
 ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
-NODEJS_CONF_OPTS += --without-npm
+NODEJS_SRC_CONF_OPTS += --without-npm
 endif
 
-define HOST_NODEJS_CONFIGURE_CMDS
+define HOST_NODEJS_SRC_CONFIGURE_CMDS
 	cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
@@ -98,72 +108,72 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--ninja
 endef
 
-HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS)
+HOST_NODEJS_SRC_CXXFLAGS = $(HOST_CXXFLAGS)
 
-define HOST_NODEJS_BUILD_CMDS
+define HOST_NODEJS_SRC_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) \
-		$(HOST_NODEJS_MAKE_OPTS)
+		$(HOST_NODEJS_SRC_MAKE_OPTS)
 endef
 
 ifeq ($(BR2_PACKAGE_HOST_NODEJS_COREPACK),y)
-define HOST_NODEJS_ENABLE_COREPACK
+define HOST_NODEJS_SRC_ENABLE_COREPACK
 	$(COREPACK) enable
 endef
 endif
 
-define HOST_NODEJS_INSTALL_CMDS
+define HOST_NODEJS_SRC_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
-		$(HOST_NODEJS_MAKE_OPTS)
-	$(HOST_NODEJS_ENABLE_COREPACK)
+		$(HOST_NODEJS_SRC_MAKE_OPTS)
+	$(HOST_NODEJS_SRC_ENABLE_COREPACK)
 endef
 
 ifeq ($(BR2_i386),y)
-NODEJS_CPU = ia32
+NODEJS_SRC_CPU = ia32
 else ifeq ($(BR2_x86_64),y)
-NODEJS_CPU = x64
+NODEJS_SRC_CPU = x64
 else ifeq ($(BR2_mips),y)
-NODEJS_CPU = mips
+NODEJS_SRC_CPU = mips
 else ifeq ($(BR2_mipsel),y)
-NODEJS_CPU = mipsel
+NODEJS_SRC_CPU = mipsel
 else ifeq ($(BR2_arm),y)
-NODEJS_CPU = arm
+NODEJS_SRC_CPU = arm
 # V8 needs to know what floating point ABI the target is using.
-NODEJS_ARM_FP = $(GCC_TARGET_FLOAT_ABI)
+NODEJS_SRC_ARM_FP = $(GCC_TARGET_FLOAT_ABI)
 # it also wants to know which FPU to use, but only has support for
 # vfp, vfpv3, vfpv3-d16 and neon.
 ifeq ($(BR2_ARM_FPU_VFPV2),y)
-NODEJS_ARM_FPU = vfp
+NODEJS_SRC_ARM_FPU = vfp
 # vfpv4 is a superset of vfpv3
 else ifeq ($(BR2_ARM_FPU_VFPV3)$(BR2_ARM_FPU_VFPV4),y)
-NODEJS_ARM_FPU = vfpv3
+NODEJS_SRC_ARM_FPU = vfpv3
 # vfpv4-d16 is a superset of vfpv3-d16
 else ifeq ($(BR2_ARM_FPU_VFPV3D16)$(BR2_ARM_FPU_VFPV4D16),y)
-NODEJS_ARM_FPU = vfpv3-d16
+NODEJS_SRC_ARM_FPU = vfpv3-d16
 else ifeq ($(BR2_ARM_FPU_NEON),y)
-NODEJS_ARM_FPU = neon
+NODEJS_SRC_ARM_FPU = neon
 endif
 else ifeq ($(BR2_aarch64),y)
-NODEJS_CPU = arm64
+NODEJS_SRC_CPU = arm64
 endif
 
 # MIPS architecture specific options
 ifeq ($(BR2_mips)$(BR2_mipsel),y)
 ifeq ($(BR2_MIPS_CPU_MIPS32R6),y)
-NODEJS_MIPS_ARCH_VARIANT = r6
-NODEJS_MIPS_FPU_MODE = fp64
+NODEJS_SRC_MIPS_ARCH_VARIANT = r6
+NODEJS_SRC_MIPS_FPU_MODE = fp64
 else ifeq ($(BR2_MIPS_CPU_MIPS32R2),y)
-NODEJS_MIPS_ARCH_VARIANT = r2
+NODEJS_SRC_MIPS_ARCH_VARIANT = r2
 else ifeq ($(BR2_MIPS_CPU_MIPS32),y)
-NODEJS_MIPS_ARCH_VARIANT = r1
+NODEJS_SRC_MIPS_ARCH_VARIANT = r1
 endif
 endif
 
-NODEJS_LDFLAGS = $(TARGET_LDFLAGS)
+NODEJS_SRC_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-NODEJS_LDFLAGS += -latomic
+NODEJS_SRC_LDFLAGS += -latomic
 endif
 
 # V8's JIT infrastructure requires binaries such as mksnapshot and
@@ -172,8 +182,8 @@ endif
 # host targeting ARMv6 needs to produce a 32-bit binary). To work around this
 # issue, cross-compile the binaries for the target and run them on the
 # host with QEMU, much like gobject-introspection.
-define NODEJS_INSTALL_V8_QEMU_WRAPPER
-	$(INSTALL) -D -m 755 $(NODEJS_PKGDIR)/v8-qemu-wrapper.in \
+define NODEJS_SRC_INSTALL_V8_QEMU_WRAPPER
+	$(INSTALL) -D -m 755 $(NODEJS_SRC_PKGDIR)/v8-qemu-wrapper.in \
 		$(@D)/out/Release/v8-qemu-wrapper
 	$(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
 		$(@D)/out/Release/v8-qemu-wrapper
@@ -182,77 +192,77 @@ define NODEJS_INSTALL_V8_QEMU_WRAPPER
 	$(SED) "s%@QEMU_USERMODE_ARGS@%$(call qstrip,$(BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS))%g" \
 		$(@D)/out/Release/v8-qemu-wrapper
 endef
-NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_INSTALL_V8_QEMU_WRAPPER
+NODEJS_SRC_PRE_CONFIGURE_HOOKS += NODEJS_SRC_INSTALL_V8_QEMU_WRAPPER
 
-define NODEJS_WRAPPER_FIXUP
+define NODEJS_SRC_WRAPPER_FIXUP
 	$(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/node.gyp
 	$(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/tools/v8_gypfiles/v8.gyp
 endef
-NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_WRAPPER_FIXUP
+NODEJS_SRC_PRE_CONFIGURE_HOOKS += NODEJS_SRC_WRAPPER_FIXUP
 
 # Do not run the qemu-wrapper for the host build.
-define HOST_NODEJS_WRAPPER_FIXUP
+define HOST_NODEJS_SRC_WRAPPER_FIXUP
 	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/node.gyp
 	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/tools/v8_gypfiles/v8.gyp
 endef
-HOST_NODEJS_PRE_CONFIGURE_HOOKS += HOST_NODEJS_WRAPPER_FIXUP
+HOST_NODEJS_SRC_PRE_CONFIGURE_HOOKS += HOST_NODEJS_SRC_WRAPPER_FIXUP
 
-define NODEJS_CONFIGURE_CMDS
+define NODEJS_SRC_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
-		LDFLAGS="$(NODEJS_LDFLAGS)" \
+		LDFLAGS="$(NODEJS_SRC_LDFLAGS)" \
 		LD="$(TARGET_CXX)" \
 		PYTHON=$(HOST_DIR)/bin/python3 \
 		$(HOST_DIR)/bin/python3 configure.py \
 		--prefix=/usr \
-		--dest-cpu=$(NODEJS_CPU) \
-		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
-		$(if $(NODEJS_ARM_FPU),--with-arm-fpu=$(NODEJS_ARM_FPU)) \
-		$(if $(NODEJS_MIPS_ARCH_VARIANT),--with-mips-arch-variant=$(NODEJS_MIPS_ARCH_VARIANT)) \
-		$(if $(NODEJS_MIPS_FPU_MODE),--with-mips-fpu-mode=$(NODEJS_MIPS_FPU_MODE)) \
-		$(NODEJS_CONF_OPTS) \
+		--dest-cpu=$(NODEJS_SRC_CPU) \
+		$(if $(NODEJS_SRC_ARM_FP),--with-arm-float-abi=$(NODEJS_SRC_ARM_FP)) \
+		$(if $(NODEJS_SRC_ARM_FPU),--with-arm-fpu=$(NODEJS_SRC_ARM_FPU)) \
+		$(if $(NODEJS_SRC_MIPS_ARCH_VARIANT),--with-mips-arch-variant=$(NODEJS_SRC_MIPS_ARCH_VARIANT)) \
+		$(if $(NODEJS_SRC_MIPS_FPU_MODE),--with-mips-fpu-mode=$(NODEJS_SRC_MIPS_FPU_MODE)) \
+		$(NODEJS_SRC_CONF_OPTS) \
 	)
 endef
 
-define NODEJS_BUILD_CMDS
+define NODEJS_SRC_BUILD_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) \
-		$(NODEJS_MAKE_OPTS)
+		$(NODEJS_SRC_MAKE_OPTS)
 endef
 
 #
 # Build the list of modules to install.
 #
-NODEJS_MODULES_LIST= $(call qstrip,\
+NODEJS_SRC_MODULES_LIST= $(call qstrip,\
 	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
 
 #
 # We can only call NPM if there's something to install.
 #
-ifneq ($(NODEJS_MODULES_LIST),)
-NODEJS_DEPENDENCIES += host-nodejs
-define NODEJS_INSTALL_MODULES
+ifneq ($(NODEJS_SRC_MODULES_LIST),)
+NODEJS_SRC_DEPENDENCIES += host-nodejs
+define NODEJS_SRC_INSTALL_MODULES
 	# If you're having trouble with module installation, adding -d to the
 	# npm install call below and setting npm_config_rollback=false can both
 	# help in diagnosing the problem.
-	$(NPM) install -g $(NODEJS_MODULES_LIST)
+	$(NPM) install -g $(NODEJS_SRC_MODULES_LIST)
 endef
 endif
 
-define NODEJS_INSTALL_STAGING_CMDS
+define NODEJS_SRC_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(STAGING_DIR) \
-		$(NODEJS_MAKE_OPTS)
+		$(NODEJS_SRC_MAKE_OPTS)
 endef
 
-define NODEJS_INSTALL_TARGET_CMDS
+define NODEJS_SRC_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(TARGET_DIR) \
-		$(NODEJS_MAKE_OPTS)
-	$(NODEJS_INSTALL_MODULES)
+		$(NODEJS_SRC_MAKE_OPTS)
+	$(NODEJS_SRC_INSTALL_MODULES)
 endef
 
 # node.js configure is a Python script and does not use autotools
diff --git a/package/nodejs/nodejs/v8-qemu-wrapper.in b/package/nodejs/nodejs-src/v8-qemu-wrapper.in
similarity index 100%
rename from package/nodejs/nodejs/v8-qemu-wrapper.in
rename to package/nodejs/nodejs-src/v8-qemu-wrapper.in
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 16e85b7ab9..2a8c570932 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 16.20.0
-NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
-NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
+# _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
+NODEJS_COMMON_VERSION = 16.20.0
+NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
+NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
@@ -31,4 +32,8 @@ PNPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/pnpm
 YARN = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/yarn
 endif
 
+NODEJS_DEPENDENCIES = nodejs-src
+$(eval $(generic-package))
+$(eval $(host-virtual-package))
+
 include $(sort $(wildcard package/nodejs/*/*.mk))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
