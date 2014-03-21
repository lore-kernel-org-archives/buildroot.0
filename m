From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Mar 2014 05:34:04 +0100
Subject: [Buildroot] [PATCH 2/4] boot-wrapper-aarch64: bump version and
	switch to autotools-package
In-Reply-To: <1395376446-29367-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1395376446-29367-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1395376446-29367-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit updates boot-wrapper-aarch64 to the latest version. As it
now uses the autotools, we switch the package to the autotools-package
infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 38 +++++++++++++++++------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index d9ddf48..f4e1e1f 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -4,26 +4,44 @@
 #
 ################################################################################
 
-BOOT_WRAPPER_AARCH64_VERSION        = 26b62f586020fd998c6efd43db657eaafeec14da
+BOOT_WRAPPER_AARCH64_VERSION        = 4266507a84f8c06452109d38e0350d4759740694
 BOOT_WRAPPER_AARCH64_SITE           = git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/boot-wrapper-aarch64.git
 BOOT_WRAPPER_AARCH64_LICENSE        = BSD3c
 BOOT_WRAPPER_AARCH64_LICENSE_FILES  = LICENSE.txt
 BOOT_WRAPPER_AARCH64_DEPENDENCIES   = linux
 BOOT_WRAPPER_AARCH64_INSTALL_IMAGES = YES
 
-BOOT_WRAPPER_AARCH64_DTS = $(call qstrip,$(BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS))
+# The Git repository does not have the generated configure script and
+# Makefile.
+BOOT_WRAPPER_AARCH64_AUTORECONF = YES
 
-define BOOT_WRAPPER_AARCH64_BUILD_CMDS
-	$(MAKE) \
-		KERNEL=$(BINARIES_DIR)/Image \
-		DTC=$(LINUX_DIR)/scripts/dtc/dtc \
-		FDT_SRC=$(LINUX_DIR)/arch/arm64/boot/dts/$(BOOT_WRAPPER_AARCH64_DTS).dts \
-		CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
-		BOOTARGS='$(BR2_TARGET_BOOT_WRAPPER_AARCH64_BOOTARGS)' -C $(@D)
+BOOT_WRAPPER_AARCH64_DTB = /arch/arm64/boot/dts/$(basename $(call qstrip,$(BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS))).dtb
+
+# Fixup the path to the DTB in configure.ac. In the future, this
+# should hopefully be made more configurable by the
+# boot-wrapper-aarch64 developers.
+define BOOT_WRAPPER_AARCH64_FIX_DTB_NAME
+	$(SED) 's%^KERN_DTB=.*%KERN_DTB=$(BOOT_WRAPPER_AARCH64_DTB)%' $(@D)/configure.ac
 endef
 
+BOOT_WRAPPER_AARCH64_PRE_PATCH_HOOKS += BOOT_WRAPPER_AARCH64_FIX_DTB_NAME
+
+BOOT_WRAPPER_AARCH64_CONF_OPT = \
+	--with-kernel-dir=$(LINUX_DIR) \
+	--with-cmdline=$(BR2_TARGET_BOOT_WRAPPER_AARCH64_BOOTARGS)
+
+# We need to convince the configure script that the Linux kernel tree
+# exists, as well as the DTB and the kernel Image. Even though those
+# are available on the build machine, the configure script uses
+# AC_CHECK_FILE tests, which are always disabled in cross-compilation
+# situations.
+BOOT_WRAPPER_AARCH64_CONF_ENV = \
+	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(LINUX_DIR))=yes \
+	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(LINUX_DIR)$(BOOT_WRAPPER_AARCH64_DTB))=yes \
+	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(LINUX_DIR)/arch/arm64/boot/Image)=yes
+
 define BOOT_WRAPPER_AARCH64_INSTALL_IMAGES_CMDS
 	cp $(@D)/linux-system.axf $(BINARIES_DIR)
 endef
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
1.8.3.2
