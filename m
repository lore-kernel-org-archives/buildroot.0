From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  8 Jun 2013 11:14:22 +0200
Subject: [Buildroot] [PATCH 9/9] toolchain-external: Install blackfin FDPIC
	and FLAT libraries
In-Reply-To: <1370682862-7285-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1370682862-7285-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1370682862-7285-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

For certain situations, users may want to install shared FLAT
libraries to the target filesystem even if FDPIC is used as the
primary binary format, or symetrically users may want to install FDPIC
libraries to the target filesystem even if shared FLAT is used as the
primary binary format.

This commit allows that by:

 * Offering additional Kconfig options to install shared FLAT or FDPIC
   libraries even when those libraries are not selected as the primary
   binary format.

 * Preserving all Blackfin toolchain folders under the
   TOOLCHAIN_EXTERNAL_DIR, instead of keeping only the one related to
   the selected binary format.

 * Adding some additional install targets that do the installation of
   either the shared FLAT or FDPIC libraries when requested.

[Thomas: refactored code, adjusted commit log]
Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   | 27 +++++++++++++
 toolchain/toolchain-external/ext-tool.mk | 67 ++++++++++++++++++++++++++------
 2 files changed, 82 insertions(+), 12 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 4dc45cd..94b8158 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -939,5 +939,32 @@ config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	  Copy the gdbserver provided by the external toolchain to the
 	  target.
 
+# When the FDPIC shared binary format is used, the corresponding libraries are
+# always installed. When a different binary format is used, we offer the option
+# of installing the FDPIC shared libraries.
+config BR2_BFIN_INSTALL_FDPIC_SHARED
+       bool "Install FDPIC shared libraries"
+       depends on BR2_bfin && !BR2_BINFMT_FDPIC
+       help
+         The Linux kernel supports running both FDPIC and FLAT applications
+         concurrently if the binary format specific libraries are installed
+         properly. This option allows developer to install FDPIC libraries
+         into a buildroot rootfs image built with binary format that is not
+         FDPIC.
+
+# When the FLAT shared binary format is used, we force the installation
+# of the corresponding libraries. When a different binary format is
+# used, we offer the option of installing the FLAT shared libraries.
+config BR2_BFIN_INSTALL_FLAT_SHARED
+       bool "Install FLAT shared libraries" if !BR2_BINFMT_FLAT_SHARED
+       depends on BR2_bfin
+       default y if BR2_BINFMT_FLAT_SHARED
+       help
+         The Linux kernel supports running both FDPIC and FLAT applications
+         concurrently if the binary format specific libraries are installed
+         properly. This option allows developer to install FLAT libraries
+         into a buildroot rootfs image built with binary format that is not
+         shared FLAT.
+
 endif # BR2_TOOLCHAIN_EXTERNAL
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 430b2bc..e5dc8ed 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -115,8 +115,12 @@ ifeq ($(TOOLCHAIN_EXTERNAL_DIR),)
 # if no path set, figure it out from path
 TOOLCHAIN_EXTERNAL_BIN:=$(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 else
+ifeq ($(BR2_bfin),y)
+TOOLCHAIN_EXTERNAL_BIN:=$(TOOLCHAIN_EXTERNAL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
+else
 TOOLCHAIN_EXTERNAL_BIN:=$(TOOLCHAIN_EXTERNAL_DIR)/bin
 endif
+endif
 
 TOOLCHAIN_EXTERNAL_CROSS=$(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 TOOLCHAIN_EXTERNAL_CC=$(TOOLCHAIN_EXTERNAL_CROSS)gcc
@@ -326,17 +330,6 @@ $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $
 		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
 	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_2))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2) | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
-ifeq ($(TOOLCHAIN_EXTERNAL_PREFIX),bfin-uclinux)
-	rm -rf $(TOOLCHAIN_EXTERNAL_DIR)/bfin-linux-uclibc
-	mv $(TOOLCHAIN_EXTERNAL_DIR)/bfin-uclinux $(TOOLCHAIN_EXTERNAL_DIR)/tmp
-	mv $(TOOLCHAIN_EXTERNAL_DIR)/tmp/* $(TOOLCHAIN_EXTERNAL_DIR)/
-	rmdir $(TOOLCHAIN_EXTERNAL_DIR)/tmp
-else
-	rm -rf $(TOOLCHAIN_EXTERNAL_DIR)/bfin-uclinux
-	mv $(TOOLCHAIN_EXTERNAL_DIR)/bfin-linux-uclibc $(TOOLCHAIN_EXTERNAL_DIR)/tmp
-	mv $(TOOLCHAIN_EXTERNAL_DIR)/tmp/* $(TOOLCHAIN_EXTERNAL_DIR)/
-	rmdir $(TOOLCHAIN_EXTERNAL_DIR)/tmp
-endif
 	$(Q)touch $@
 else
 # Download and extraction of a toolchain
@@ -475,9 +468,59 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	fi ; \
 	touch $@
 
+# Special installation target used on the Blackfin architecture when
+# FDPIC is not the primary binary format being used, but the user has
+# nonetheless requested the installation of the FDPIC libraries to the
+# target filesystem.
+$(STAMP_DIR)/ext-toolchain-bfin-fdpic-shared-installed: $(STAMP_DIR)/ext-toolchain-checked
+	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
+	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
+	FDPIC_LIBC_A_LOCATION=`readlink -f $$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
+	FDPIC_SYSROOT_DIR=`echo $${FDPIC_LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
+	FDPIC_LIB_DIR=`echo $${FDPIC_LIBC_A_LOCATION} | sed -r -e 's:.*/usr/(lib(64)?)/(.*/)?libc.a:\1:'` ; \
+	FDPIC_SUPPORT_LIB_DIR="" ; \
+	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
+	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
+	        if [ -e "$${FDPIC_LIBSTDCPP_A_LOCATION}" ]; then \
+	                FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
+	        fi ; \
+	fi ; \
+	for libs in $(LIB_EXTERNAL_LIBS); do \
+	        $(call copy_toolchain_lib_root,$${FDPIC_SYSROOT_DIR},$${FDPIC_SUPPORT_LIB_DIR},$${FDPIC_LIB_DIR},$$libs,/lib); \
+	done ; \
+	for libs in $(USR_LIB_EXTERNAL_LIBS); do \
+	        $(call copy_toolchain_lib_root,$${FDPIC_SYSROOT_DIR},$${FDPIC_SUPPORT_LIB_DIR},$${FDPIC_LIB_DIR},$$libs,/usr/lib); \
+	done ; \
+	touch $@
+
+# Special installation target used on the Blackfin architecture when
+# shared FLAT is not the primary format being used, but the user has
+# nonetheless requested the installation of the shared FLAT libraries
+# to the target filesystem. The flat libraries are found and linked
+# according to the index in name "libN.so". Index 1 is reserved for
+# the standard C library. Customer libraries can use 4 and above.
+$(STAMP_DIR)/ext-toolchain-bfin-shared-flat-installed: $(STAMP_DIR)/ext-toolchain-checked
+	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...") ; \
+	FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
+	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -mid-shared-library -print-file-name=libc`; \
+	if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
+	        $(INSTALL) -D $${FLAT_LIBC_A_LOCATION} $(TARGET_DIR)/lib/lib1.so; \
+	fi ; \
+	touch $@
+
+TOOLCHAIN_EXTERNAL_INSTALL = $(STAMP_DIR)/ext-toolchain-installed
+
+ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
+TOOLCHAIN_EXTERNAL_INSTALL += $(STAMP_DIR)/ext-toolchain-bfin-fdpic-shared-installed
+endif
+
+ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
+TOOLCHAIN_EXTERNAL_INSTALL += $(STAMP_DIR)/ext-toolchain-bfin-shared-flat-installed
+endif
+
 # Build toolchain wrapper for preprocessor, C and C++ compiler, and setup
 # symlinks for everything else
-$(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(STAMP_DIR)/ext-toolchain-installed
+$(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(TOOLCHAIN_EXTERNAL_INSTALL)
 	$(Q)$(call MESSAGE,"Building ext-toolchain wrapper")
 	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
-- 
1.8.1.2
