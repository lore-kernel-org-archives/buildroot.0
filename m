From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Oct 2016 22:48:29 +0200
Subject: [Buildroot] [PATCH 28/30] toolchain/toolchain-external: move bfin
	specific logic into a separate file
In-Reply-To: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477255711-28603-29-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-toolchain-external-bfin.mk for the definition of various variables like
TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC and TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT
which install some specific bfin toolchain componant to TARGET_DIR.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../pkg-toolchain-external-bfin.mk                 | 56 ++++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk | 49 -------------------
 2 files changed, 56 insertions(+), 49 deletions(-)
 create mode 100644 toolchain/toolchain-external/pkg-toolchain-external-bfin.mk

diff --git a/toolchain/toolchain-external/pkg-toolchain-external-bfin.mk b/toolchain/toolchain-external/pkg-toolchain-external-bfin.mk
new file mode 100644
index 0000000..cfba5ae
--- /dev/null
+++ b/toolchain/toolchain-external/pkg-toolchain-external-bfin.mk
@@ -0,0 +1,56 @@
+#
+# This file contains functions used by the external toolchain package
+# infrastructure to handle the Blackfin specific
+# BR2_BFIN_INSTALL_FDPIC_SHARED and BR2_BFIN_INSTALL_FLAT_SHARED
+# options.
+#
+
+# Special installation target used on the Blackfin architecture when
+# FDPIC is not the primary binary format being used, but the user has
+# nonetheless requested the installation of the FDPIC libraries to the
+# target filesystem.
+# $1: toolchain CC
+# $2: toolchain CFLAGS
+ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
+define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
+	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to staging...")
+	$(Q)FDPIC_EXTERNAL_CC=$(dir $(1))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
+	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(2))" ; \
+	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(2))" ; \
+	FDPIC_SUPPORT_LIB_DIR="" ; \
+	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
+	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(2) -print-file-name=libstdc++.a) ; \
+	        if [ -e "$${FDPIC_LIBSTDCPP_A_LOCATION}" ]; then \
+	                FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
+	        fi ; \
+	fi ; \
+	$(call copy_toolchain_sysroot,$${FDPIC_SYSROOT_DIR},$${FDPIC_SYSROOT_DIR},,$${FDPIC_LIB_DIR},$${FDPIC_SUPPORT_LIB_DIR})
+endef
+
+# $1: toolchain LIBS
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC
+	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...")
+	$(Q)for libs in $(1); do \
+		$(call copy_toolchain_lib_root,$$libs); \
+	done
+endef
+endif
+
+# Special installation target used on the Blackfin architecture when
+# shared FLAT is not the primary format being used, but the user has
+# nonetheless requested the installation of the shared FLAT libraries
+# to the target filesystem. The flat libraries are found and linked
+# according to the index in name "libN.so". Index 1 is reserved for
+# the standard C library. Customer libraries can use 4 and above.
+# $1: toolchain CC
+# $2: toolchain CFLAGS
+ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
+	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...")
+	$(Q)FLAT_EXTERNAL_CC=$(dir $(1))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
+	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(2) -mid-shared-library -print-file-name=libc`; \
+	if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
+	        $(INSTALL) -D $${FLAT_LIBC_A_LOCATION} $(TARGET_DIR)/lib/lib1.so; \
+	fi
+endef
+endif
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 8aeb610..4911688 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -390,55 +390,6 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(Q)$(call check_toolchain_ssp,$(TOOLCHAIN_EXTERNAL_CC))
 endef
 
-# Special installation target used on the Blackfin architecture when
-# FDPIC is not the primary binary format being used, but the user has
-# nonetheless requested the installation of the FDPIC libraries to the
-# target filesystem.
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
-define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
-	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to staging...")
-	$(Q)FDPIC_EXTERNAL_CC=$(dir $(1))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
-	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(2))" ; \
-	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(2))" ; \
-	FDPIC_SUPPORT_LIB_DIR="" ; \
-	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(2) -print-file-name=libstdc++.a) ; \
-	        if [ -e "$${FDPIC_LIBSTDCPP_A_LOCATION}" ]; then \
-	                FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
-	        fi ; \
-	fi ; \
-	$(call copy_toolchain_sysroot,$${FDPIC_SYSROOT_DIR},$${FDPIC_SYSROOT_DIR},,$${FDPIC_LIB_DIR},$${FDPIC_SUPPORT_LIB_DIR})
-endef
-# $1: toolchain LIBS
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC
-	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...")
-	$(Q)for libs in $(1); do \
-		$(call copy_toolchain_lib_root,$$libs); \
-	done
-endef
-endif
-
-# Special installation target used on the Blackfin architecture when
-# shared FLAT is not the primary format being used, but the user has
-# nonetheless requested the installation of the shared FLAT libraries
-# to the target filesystem. The flat libraries are found and linked
-# according to the index in name "libN.so". Index 1 is reserved for
-# the standard C library. Customer libraries can use 4 and above.
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
-	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...")
-	$(Q)FLAT_EXTERNAL_CC=$(dir $(1))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
-	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(2) -mid-shared-library -print-file-name=libc`; \
-	if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
-	        $(INSTALL) -D $${FLAT_LIBC_A_LOCATION} $(TARGET_DIR)/lib/lib1.so; \
-	fi
-endef
-endif
-
 TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
 
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
-- 
2.5.5
