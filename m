From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 10 Jun 2018 18:33:15 +0200
Subject: [Buildroot] [PATCH RFC] toolchain-buildroot: add sanity checks
Message-ID: <20180610163315.6511-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a Buildroot toolchain is build by the internal toolchain
infrastructure, we curently don't check for toolchain features
like it's done for external toolchains.

As an example:
On microblaze, the SSP support was unconditionally requested from
the Buildroot configuration even if it was not supported by the
toolchain components.

See https://gitlab.com/free-electrons/toolchains-builder/issues/1

Copy all external toolchain checks to the internal toolchain using
TOOLCHAIN_BUILDROOT_CONFIGURE_CMDS.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Until now helpers.mk was only used for external toolchains.
All error messages must be updated in order to remove all BR2_TOOLCHAIN_EXTERNAL_
---
 .../toolchain-buildroot/toolchain-buildroot.mk     | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index b30cc332d2..3fc4f37e39 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -14,4 +14,35 @@ TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
 
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
+define TOOLCHAIN_BUILDROOT_CONFIGURE_CMDS
+	$(Q)$(call check_cross_compiler_exists,$(TARGET_CC))
+	$(Q)$(call check_unusable_toolchain,$(TARGET_CC))
+	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TARGET_CC))" ; \
+	$(call check_kernel_headers_version,\
+		$(call toolchain_find_sysroot,$(TARGET_CC)),\
+		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
+	$(call check_gcc_version,$(TARGET_CC),\
+		$(call qstrip,$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
+	if test "$(BR2_arm)" = "y" ; then \
+		$(call check_arm_abi,\
+			"$(TARGET_CC) $(TARGET_CFLAGS)") ; \
+	fi ; \
+	if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
+		$(call check_cplusplus,$(TARGET_CXX)) ; \
+	fi ; \
+	if test "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
+		$(call check_fortran,$(TARGET_FC)) ; \
+	fi ; \
+	if test "$(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)" = "y" ; then \
+		$(call check_uclibc,$${SYSROOT_DIR}) ; \
+	elif test "$(BR2_TOOLCHAIN_BUILDROOT_MUSL)" = "y" ; then \
+		$(call check_musl,\
+			"$(TARGET_CC) $(TARGET_CFLAGS)",\
+			$(TARGET_READELF)) ; \
+	else \
+		$(call check_glibc,$${SYSROOT_DIR}) ; \
+	fi
+	$(Q)$(call check_toolchain_ssp,$(TARGET_CC))
+endef
+
 $(eval $(virtual-package))
-- 
2.14.4
