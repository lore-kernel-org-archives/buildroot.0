From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 3 May 2013 18:39:39 +0800
Subject: [Buildroot] [PATCH v7 6/7] arch: toolchain: Install blackfin FDPIC
	and FLAT libraries in external toolchain makefile.
In-Reply-To: <1367577580-3518-1-git-send-email-sonic.adi@gmail.com>
References: <1367577580-3518-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1367577580-3518-6-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Reserve all 3 blackfin toolchain folders under the TOOLCHAIN_EXTERNAL_DIR.
Set current blackfin toolchain bin folder to the toolchain prefix subfolder.
Install FDPIC and FLAT library in target ext-toolchain-installed.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

---
v7-changes:
- Revert merging the options of the same name and add descriptions. Only
2 options work in SHARED flat binary format case.

v6-changes:
- Move options of installing blackfin toolchain libraries into external
toolchain Config.in.
- Fix typo error.
- Merge the options of the same name and add descriptions.

v5-changes:
- Update comments.

v3-changes:
- Remove arch specific makefiles.
- Reserve all 3 blackfin toolchain folders under the TOOLCHAIN_EXTERNAL_DIR.
- Set current blackfin toolchain bin folder to the toolchain prefix subfolder.
- Move FDPIC and FLAT library installation target from blackfin makefile to
the ext-toolchain-installed target in external toolchain makefile.

v2-changes:
- Remove useless Macro __uClinux__

v1-changes:
- Create arch makefile.
- Create blackfin makefile.
- Add FDPIC and FLAT library options and makefile targets to install
libraries for different binary formats into the same rootfs image.
- update the TARGET_EXCEPTIONS variable in support/scripts/graph-depends for
new custom targets
---
 toolchain/toolchain-external/Config.in   |   34 ++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |   46 ++++++++++++++++++++++-------
 2 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 6cf29aa..05df3f4 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -887,5 +887,39 @@ config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
 
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
+# When the FDPIC shared binary format is used, the corresponding libraries are
+# always installed. When a different binary format is used, we offer the option
+# of installing the FDPIC shared libraries.
+config BR2_BFIN_INSTALL_FDPIC_SHARED
+	bool "Install FDPIC shared libraries"
+	depends on BR2_bfin && !BR2_BINFMT_FDPIC
+	help
+	  The Linux kernel supports running both FDPIC and FLAT applications
+	  concurrently if the binary format specific libraries are installed
+	  properly. This option allows developer to install FDPIC libraries
+	  into a buildroot rootfs image built with binary format that is not
+	  FDPIC.
+
+# When the FLAT shared binary format is used, we force the installation
+# of the corresponding libraries. When a different binary format is
+# used, we offer the option of installing the FLAT shared libraries.
+config BR2_BFIN_INSTALL_FLAT_SHARED
+	default y if BR2_BINFMT_FLAT_SHARED
+	help
+	  The Linux kernel supports running both FDPIC and FLAT applications
+	  concurrently if the binary format specific libraries are installed
+	  properly. This option always installs FLAT libraries into a
+	  buildroot rootfs image built with binary format shared FLAT.
+
+config BR2_BFIN_INSTALL_FLAT_SHARED
+	bool "Install FLAT shared libraries"
+	depends on BR2_bfin && !BR2_BINFMT_FLAT_SHARED
+	help
+	  The Linux kernel supports running both FDPIC and FLAT applications
+	  concurrently if the binary format specific libraries are installed
+	  properly. This option allows developer to install FLAT libraries
+	  into a buildroot rootfs image built with binary format that is not
+	  shared FLAT.
+
 endif # BR2_TOOLCHAIN_EXTERNAL
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 57ea266..dbada0e 100644
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
@@ -312,17 +316,6 @@ $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $
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
@@ -417,6 +410,37 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
+	if test x"$(BR2_BFIN_INSTALL_FDPIC_SHARED)" == x"y" ; then \
+		$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
+		FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
+		FDPIC_LIBC_A_LOCATION=`readlink -f $$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
+		FDPIC_SYSROOT_DIR=`echo $${FDPIC_LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
+		FDPIC_LIB_DIR=`echo $${FDPIC_LIBC_A_LOCATION} | sed -r -e 's:.*/usr/(lib(64)?)/(.*/)?libc.a:\1:'` ; \
+		FDPIC_SUPPORT_LIB_DIR="" ; \
+		if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
+			FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
+			if [ -e "$${FDPIC_LIBSTDCPP_A_LOCATION}" ]; then \
+				FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
+			fi ; \
+		fi ; \
+		for libs in $(LIB_EXTERNAL_LIBS); do \
+			$(call copy_toolchain_lib_root,$${FDPIC_SYSROOT_DIR},$${FDPIC_SUPPORT_LIB_DIR},$${FDPIC_LIB_DIR},$$libs,/lib); \
+		done ; \
+		for libs in $(USR_LIB_EXTERNAL_LIBS); do \
+			$(call copy_toolchain_lib_root,$${FDPIC_SYSROOT_DIR},$${FDPIC_SUPPORT_LIB_DIR},$${FDPIC_LIB_DIR},$$libs,/usr/lib); \
+		done ; \
+	fi ; \
+	if test x"$(BR2_BFIN_INSTALL_FLAT_SHARED)" == x"y" ; then \
+		$(call MESSAGE,"Install external toolchain FLAT libraries to target...") ; \
+		FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
+		FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -mid-shared-library -print-file-name=libc`; \
+		if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
+# The flat libraries are found and linked according to the index in \
+# name "libN.so". Index 1 is reserved for the standard C library. \
+# Customer libraries can use 4 and above. \
+			$(INSTALL) -D $${FLAT_LIBC_A_LOCATION} $(TARGET_DIR)/lib/lib1.so; \
+		fi ; \
+	fi ; \
 	ARCH_LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
 	ARCH_SYSROOT_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
 	ARCH_LIB_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:.*/usr/(lib(64)?)/(.*/)?libc.a:\1:'` ; \
-- 
1.7.0.4
