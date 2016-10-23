From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Oct 2016 22:48:28 +0200
Subject: [Buildroot] [PATCH 27/30] toolchain/toolchain-external: move musl
	specific logic into a separate file
In-Reply-To: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477255711-28603-28-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-toolchain-external-musl.mk for the definition of various variables:
Set MUSL_ARCH to create a symbolic link to libc.so and add a dependency to
musl-compat-headers package

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../pkg-toolchain-external-musl.mk                 | 34 ++++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk | 31 --------------------
 2 files changed, 34 insertions(+), 31 deletions(-)
 create mode 100644 toolchain/toolchain-external/pkg-toolchain-external-musl.mk

diff --git a/toolchain/toolchain-external/pkg-toolchain-external-musl.mk b/toolchain/toolchain-external/pkg-toolchain-external-musl.mk
new file mode 100644
index 0000000..dbe07a0
--- /dev/null
+++ b/toolchain/toolchain-external/pkg-toolchain-external-musl.mk
@@ -0,0 +1,34 @@
+#
+# This file contains various utility functions used by the external
+# toolchain based on musl.
+#
+
+# musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
+# So, add the musl-compat-headers package that will install those files,
+# into the staging directory:
+#   sys/queue.h:  header from NetBSD
+#   sys/cdefs.h:  minimalist header bundled in Buildroot
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
+endif
+
+# With the musl C library, the libc.so library directly plays the role
+# of the dynamic library loader. We just need to create a symbolic
+# link to libc.so with the appropriate name.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+ifeq ($(BR2_i386),y)
+MUSL_ARCH = i386
+else ifeq ($(BR2_ARM_EABIHF),y)
+MUSL_ARCH = armhf
+else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
+MUSL_ARCH = mipsel-sf
+else ifeq ($(BR2_sh),y)
+MUSL_ARCH = sh
+else
+MUSL_ARCH = $(ARCH)
+endif
+define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
+	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
+endef
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
+endif
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index cb63dd2..8aeb610 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -146,16 +146,6 @@ TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
 	-DBR_CROSS_PATH_REL='"$(TOOLCHAIN_EXTERNAL_BIN:$(HOST_DIR)/%=%)"'
 endif
 
-
-# musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
-# So, add the musl-compat-headers package that will install those files,
-# into the staging directory:
-#   sys/queue.h:  header from NetBSD
-#   sys/cdefs.h:  minimalist header bundled in Buildroot
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
-endif
-
 # The Codescape toolchain uses a sysroot layout that places them
 # side-by-side instead of nested like multilibs. A symlink is needed
 # much like for the nested sysroots which are handled in
@@ -400,27 +390,6 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(Q)$(call check_toolchain_ssp,$(TOOLCHAIN_EXTERNAL_CC))
 endef
 
-# With the musl C library, the libc.so library directly plays the role
-# of the dynamic library loader. We just need to create a symbolic
-# link to libc.so with the appropriate name.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
-ifeq ($(BR2_i386),y)
-MUSL_ARCH = i386
-else ifeq ($(BR2_ARM_EABIHF),y)
-MUSL_ARCH = armhf
-else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
-MUSL_ARCH = mipsel-sf
-else ifeq ($(BR2_sh),y)
-MUSL_ARCH = sh
-else
-MUSL_ARCH = $(ARCH)
-endif
-define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
-endef
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-endif
-
 # Special installation target used on the Blackfin architecture when
 # FDPIC is not the primary binary format being used, but the user has
 # nonetheless requested the installation of the FDPIC libraries to the
-- 
2.5.5
