From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jan 2013 00:41:36 +0100
Subject: [Buildroot] [PATCH 2/6] toolchain/external: sprinkle with some
	calls to MESSAGE
In-Reply-To: <cover.1358379198.git.yann.morin.1998@free.fr>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
Message-ID: <c714fe0f25817a1aa184fc049210ec38a36ecc65.1358379198.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thus, the failing step can be easily extracted by autobuilders,
to ease with post-mortem analysis.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/ext-tool.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 649e3a3..04f9882 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -325,7 +325,7 @@ endif
 # matches the configuration provided in Buildroot: ABI, C++ support,
 # type of C library and all C library features.
 $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
-	@echo "Checking external toolchain settings"
+	@$(call MESSAGE,"Checking external toolchain settings")
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
 	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
@@ -414,7 +414,7 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	mkdir -p $(TARGET_DIR)/lib ; \
 	if test -z "$(BR2_PREFER_STATIC_LIB)" ; then \
-		echo "Copy external toolchain libraries to target..." ; \
+		$(call MESSAGE,"Copy external toolchain libraries to target...") ; \
 		for libs in $(LIB_EXTERNAL_LIBS); do \
 			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/lib); \
 		done ; \
@@ -422,12 +422,13 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
 		done ; \
 	fi ; \
-	echo "Copy external toolchain sysroot to staging..." ; \
+	$(call MESSAGE,"Copy external toolchain sysroot to staging...") ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR}) ; \
 	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
 	fi ; \
 	if test x"$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" == x"y"; then \
+		$(call MESSAGE,"Copying gdbserver") ; \
 		gdbserver_found=0 ; \
 		for d in $${ARCH_SYSROOT_DIR} $${ARCH_SYSROOT_DIR}/../debug-root/ ; do \
 			if test -f $${d}/usr/bin/gdbserver ; then \
@@ -446,6 +447,7 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 # Build toolchain wrapper for preprocessor, C and C++ compiler, and setup
 # symlinks for everything else
 $(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(STAMP_DIR)/ext-toolchain-installed
+	$(Q)$(call MESSAGE,"Building ext-toolchain wrapper")
 	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
-- 
1.7.2.5
