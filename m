From: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
Date: Mon, 20 Jul 2015 19:25:39 +0800
Subject: [Buildroot] [PATCH 2/5] aarch64: ilp32: handle special file name
In-Reply-To: <1437391542-13590-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1437391542-13590-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <1437391542-13590-3-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In aarch64 ilp32, the directory of library is libilp32. And the linker
is ld-linux-aarch64_ilp32.so.1 or ld-linux-aarch64_be_ilp32.so.1 which is
linked to libilp32/ld-VERSION.so(ld-2.20.so in my system).

Signed-off-by: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
---
 Makefile                                           |  6 +++
 toolchain/helpers.mk                               |  4 +-
 toolchain/toolchain-external/toolchain-external.mk | 45 +++++++++++++++++++++-
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 35818f0..19a28d9 100644
--- a/Makefile
+++ b/Makefile
@@ -438,6 +438,12 @@ LIB_SYMLINK = lib64
 else
 LIB_SYMLINK = lib32
 endif
+ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
+# On X86_64, ilp32 library will be located in libx32 directory.
+ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+LIB_SYMLINK = libilp32
+endif
+endif
 
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)/bin
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 0dc1864..621df63 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -38,7 +38,7 @@
 #
 # $1: arch specific sysroot directory
 # $2: support libraries directory (can be empty)
-# $3: library directory ('lib' or 'lib64') from which libraries must be copied
+# $3: library directory ('lib', 'lib64' or 'libilp32') from which libraries must be copied
 # $4: library name
 # $5: destination directory of the libary, relative to $(TARGET_DIR)
 #
@@ -140,7 +140,7 @@ copy_toolchain_sysroot = \
 	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' \
-				--exclude lib --exclude lib32 --exclude lib64 \
+				--exclude lib --exclude lib32 --exclude lib64 --exclude libilp32 \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
 	done ; \
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 22f8118..537130f 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -86,6 +86,10 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
 LIB_EXTERNAL_LIBS += libc.so libgcc_s.so.*
 endif
 
+ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
+LIB_EXTERNAL_LIBS += ld*.so
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 USR_LIB_EXTERNAL_LIBS += libstdc++.so.*
 endif
@@ -253,6 +257,19 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
 endef
 
+ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
+ifeq ($(BR2_ENDIAN), "LITTLE")
+define TOOLCHAIN_EXTERNAL_ILP32_SYMLINK
+	ln -sf ld*.so $(TARGET_DIR)/lib/ld-linux-aarch64_ilp32.so.1
+endef
+endif
+ifeq ($(BR2_ENDIAN), "BIG")
+define TOOLCHAIN_EXTERNAL_ILP32_SYMLINK
+	ln -sf ld*.so $(TARGET_DIR)/lib/ld-linux-aarch64_be_ilp32.so.1
+endef
+endif
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
@@ -394,6 +411,7 @@ TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 # We can't check hashes for custom downloaded toolchains
 BR_NO_CHECK_HASH_FOR += $(TOOLCHAIN_EXTERNAL_SOURCE)
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_ILP32_SYMLINK
 endif
 
 # In fact, we don't need to download the toolchain, since it is already
@@ -438,13 +456,13 @@ endef
 
 # Returns the sysroot location for the given compiler + flags
 define toolchain_find_sysroot
-$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::')
+$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64|ilp32)?/([^/]*/)?libc\.a::')
 endef
 
 # Returns the lib subdirectory for the given compiler + flags (i.e
 # typically lib32 or lib64 for some toolchains)
 define toolchain_find_libdir
-$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:')
+$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64|ilp32)?)/([^/]*/)?libc.a:\2:')
 endef
 
 # Checks for an already installed toolchain: check the toolchain
@@ -566,6 +584,8 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 		for libs in $(USR_LIB_EXTERNAL_LIBS); do \
 			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
 		done ; \
+		$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},ld-linux-aarch64_ilp32.so.1,/lib); \
+		$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},ld-2.20.so,/libilp32); \
 	fi ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
 		$(call MESSAGE,"Copying gdbserver") ; \
@@ -710,10 +730,30 @@ define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
 	fi
 endef
 
+ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
+ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+ifeq ($(BR2_ENDIAN), "LITTLE")
+ILP32_SYM = ld-linux-aarch64_ilp32.so.1
+else
+ILP32_SYM = ld-linux-aarch64_be_ilp32.so.1
+endif
+define TOOLCHAIN_EXTERNAL_INSTALL_ILP32_LINK
+	LD_ILP32=`basename $(STAGING_DIR)/lib/ld*.so`; \
+	ln -sf $${LD_ILP32} $(STAGING_DIR)/lib/${ILP32_SYM}
+endef
+
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_ILP32_LINK
+	LD_ILP32=`basename $(TARGET_DIR)/lib/ld*.so`; \
+	ln -sf $${LD_ILP32} $(TARGET_DIR)/lib/${ILP32_SYM}
+endef
+endif
+endif
+
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_ILP32_LINK)
 endef
 
 # Even though we're installing things in both the staging, the host
@@ -723,6 +763,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_ILP32_LINK)
 endef
 
 $(eval $(generic-package))
-- 
1.8.4.5
