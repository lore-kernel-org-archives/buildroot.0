From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 15 Feb 2018 16:56:09 -0800
Subject: [Buildroot] [RFC 3/6] core: system and toolchain: 32-bit run-time
 support on 64-bit platform
In-Reply-To: <20180216005612.69593-1-mmayer@broadcom.com>
References: <20180216005612.69593-1-mmayer@broadcom.com>
Message-ID: <20180216005612.69593-4-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set up library symlinks only if we don't want to support 32-bit
libraries on 64-bit platforms.

We cannot set up sym-links such as "lib64" -> "lib" if we want to
support 32-bit binaries on a 64-bit platform. Instead, we need to keep
32-bit and 64-bit libraries in separate directories, so we must skip
generating sym-links that would prevent this.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 system/system.mk                                       | 11 ++++++++++-
 toolchain/toolchain-external/pkg-toolchain-external.mk |  6 ++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/system/system.mk b/system/system.mk
index ca6bf1388f39..e0d45356fe66 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -55,6 +55,14 @@ define SYSTEM_RSYNC
 		$(1)/ $(2)/
 endef
 
+ifeq ($(BR2_ROOTFS_RUNTIME32),y)
+
+define SYSTEM_LIB_SYMLINK
+	@echo "SYSTEM_LIB_SYMLINK: nothing to do"
+endef
+
+else
+
 # Make a symlink lib32->lib or lib64->lib as appropriate.
 # MIPS64/n32 requires lib32 even though it's a 64-bit arch.
 # $(1): base dir (either staging or target)
@@ -68,7 +76,8 @@ define SYSTEM_LIB_SYMLINK
 	ln -snf lib $(1)/lib32
 	ln -snf lib $(1)/usr/lib32
 endef
-endif
+endif # BR2_ARCH_IS_64
+endif # BR2_ROOTFS_RUNTIME32
 
 SYSTEM_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 SYSTEM_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 3bf9fac4121c..d7cf97d170ca 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -448,6 +448,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
 endef
 
+ifeq ($(BR2_ROOTFS_RUNTIME32),)
 # Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
 # Note: the skeleton package additionally creates lib32->lib or lib64->lib
 # (as appropriate)
@@ -462,6 +463,11 @@ create_lib_symlinks = \
 		ln -snf $${relpath}lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
 	fi
 
+else
+create_lib_symlinks = \
+	@echo "BR2_ROOTFS_RUNTIME32 is set, skipping lib symlinks creation"
+endif
+
 define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
 	$(call create_lib_symlinks,$(STAGING_DIR))
 endef
-- 
2.7.4
