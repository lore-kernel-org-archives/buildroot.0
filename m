From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jun 2009 21:19:47 +0200
Subject: [Buildroot] [PATCH 1/2] Simple glibc-based external toolchain
	support
In-Reply-To: <1245093588-17565-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1245093588-17565-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1245093588-17565-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current Buildroot works just well with sysrootable glibc
toolchains, using the external toolchain feature. The only thing that
needs to be customized is the set of libraries that must be compiled
to the target.

The following patch takes a simple approach to making it easier for
users to use glibc toolchains. It just adds a uClibc/glibc choice in
the external toolchain menu. Then, depending on that selection, the
configuration system will choose a sane default value for the library
files list.

The other advantage of having a uClibc/glibc choice is that in the
future, we'll be able to add checks verifying that the external
toolchain configuration matches the features selected in Buildroot (in
terms of IPv6, RPC, locales or large file support).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/Config.in   |   25 ++++++++++---------------
 toolchain/external-toolchain/ext-tool.mk |   24 ++++++++++++++++--------
 2 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/toolchain/external-toolchain/Config.in b/toolchain/external-toolchain/Config.in
index 71dad0d..efc8378 100644
--- a/toolchain/external-toolchain/Config.in
+++ b/toolchain/external-toolchain/Config.in
@@ -1,22 +1,17 @@
 #
 
 if BR2_TOOLCHAIN_EXTERNAL
-config BR2_TOOLCHAIN_EXTERNAL_LIB_C
-	string "The core C library from the external toolchain"
-	default "libc.so.0"
-	help
-	  Specify the core C shared library found in the external
-	  toolchain. This is required in addition to any other
-	  libraries to be copied.
+choice
+	prompt "External toolchain C library"
+	default BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 
-config BR2_TOOLCHAIN_EXTERNAL_LIBS
-	string "Libraries to copy from the external toolchain"
-	default "ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
-	help
-	  A space separated list of the shared libraries to be copied
-	  from the external toolchain into the root filesystem. Only
-	  the top-level name is needed, i.e. libc.so, libpthread.so as
-	  the actual shared library symlinked to will be copied also.
+config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	bool "uClibc"
+
+config BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	bool "glibc"
+
+endchoice
 
 config BR2_TOOLCHAIN_EXTERNAL_STRIP
         bool
diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 1c9197b..ca71137 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -21,7 +21,6 @@ copy_toolchain_lib_root = \
 	for FILE in `find $${LIB_DIR} -maxdepth 1 -type l -name "$${LIB}*"`; do \
 		LIB=`basename $${FILE}`; \
 		while test \! -z "$${LIB}"; do \
-			echo "copy_toolchain_lib_root lib=$${LIB} dst=$${DST}"; \
 			rm -fr $(TARGET_DIR)$${DST}/$${LIB}; \
 			mkdir -p $(TARGET_DIR)$${DST}; \
 			if test -h $${LIB_DIR}/$${LIB}; then \
@@ -49,14 +48,23 @@ copy_toolchain_sysroot = \
 	if [ -n "$${SYSROOT_DIR}" ]; then cp -a $${SYSROOT_DIR}/* $(STAGING_DIR)/ ; \
 	find $(STAGING_DIR) -type d | xargs chmod 755; fi
 
-uclibc: dependencies $(TARGET_DIR)/lib/$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C)))
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+EXTERNAL_LIBC=libc.so.0
+EXTERNAL_LIBS=ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0
+else
+EXTERNAL_LIBC=libc.so.6
+EXTERNAL_LIBS=ld-linux.so.3 libcrypt.so.1 libdl.so.2 libgcc_s.so.1 libm.so.6 libnsl.so.1 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1 libnss_files.so.2
+endif
 
-$(TARGET_DIR)/lib/$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C))):
-#"))
+
+uclibc: dependencies $(TARGET_DIR)/lib/$(EXTERNAL_LIBC)
+
+$(TARGET_DIR)/lib/$(EXTERNAL_LIBC):
 	mkdir -p $(TARGET_DIR)/lib
-	@$(call copy_toolchain_lib_root, $(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C))), /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP))
-#")))
-	for libs in $(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIBS))); do \
+	@echo "Copy external toolchain libraries to target..."
+	@$(call copy_toolchain_lib_root, $(EXTERNAL_LIBC), /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP))
+	@for libs in $(EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root, $$libs, /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
 	done
-	$(call copy_toolchain_sysroot)
+	@echo "Copy external toolchain sysroot to staging..."
+	@$(call copy_toolchain_sysroot)
-- 
1.5.6.3
