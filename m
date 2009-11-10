From: Anders Darander <anders.darander@gmail.com>
Date: Tue, 10 Nov 2009 08:03:22 +0100
Subject: [Buildroot] [PATCH] Use gdbserver from external toolchain.
Message-ID: <1257836602-799-1-git-send-email-ad@datarespons.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow the user to copy the pre-compiled gdbserver from the external toolchain
to the rootfs.

It is assumed that the external toolchain has been generated with crosstool-NG,
as there is no generic way to find the location of gdbserver.

Signed-off-by: Anders Darander <ad@datarespons.se>
---
 toolchain/external-toolchain/Config.in   |    9 +++++++
 toolchain/external-toolchain/ext-tool.mk |   35 ++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/toolchain/external-toolchain/Config.in b/toolchain/external-toolchain/Config.in
index efc8378..8837f47 100644
--- a/toolchain/external-toolchain/Config.in
+++ b/toolchain/external-toolchain/Config.in
@@ -19,4 +19,13 @@ config BR2_TOOLCHAIN_EXTERNAL_STRIP
         prompt "Strip shared libraries"
 	help
 	  Strip shared libraries copied from the external toolchain.
+
+config BR2_TOOLCHAIN_EXTERNAL_GDBSERVER
+	bool
+	prompt "Install the gdbserver"
+	help
+	  Install the gdbserver from the external toolchain.
+	  It is assumed that the external toolchain has been generated
+	   by crosstool-NG, as there is no generic mechanism available
+	   to find the location of the gdbserver.
 endif
diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 1f5aa19..0fc7ae8 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -72,6 +72,37 @@ copy_toolchain_lib_root = \
 	echo -n
 
 #
+# Copy selected files from the toolchain debug-root to the target dir.
+#
+# $1: The sysroot-feature (this is used for the base of the debug-root)
+# $2: The file to be installed
+# $3: Destination folder on the rootfs.
+# $4: strip (y|n), default is to strip
+#
+copy_toolchain_debugroot = \
+	DEBUGROOT_DIR="$(strip $1)"/../debug-root; \
+	FILE="$(strip $2)"; \
+	DST="$(strip $3)"; \
+	STRIP="$(strip $4)"; \
+\
+	if $$($(TARGET_CROSS)cc -v 2>&1 | grep crosstool-NG 2>&1 1>/dev/null) ; then \
+		echo "A Crosstool-NG generated toolchain is detected."; \
+		if test -f $${DEBUGROOT_DIR}/usr/bin/$${FILE}; then \
+			$(INSTALL) -m0755 $${DEBUGROOT_DIR}/usr/bin/$${FILE} $(TARGET_DIR)/$${DST}/$${FILE}; \
+			case "$${STRIP}" in \
+			(+ | n | no) \
+;; \
+			(*) \
+			$(TARGET_CROSS)strip $(TARGET_DIR)/$${DST}/$${FILE}; \
+;; \
+			esac \
+		fi \
+	else \
+		echo "Error: Not a known toolchain!"; \
+		exit 1; \
+	fi
+
+#
 # Copy the full external toolchain sysroot directory to the staging
 # dir
 #
@@ -227,6 +258,10 @@ endif
 	$(Q)for libs in $(EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root,$(SYSROOT_DIR),$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
 	done
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDBSERVER),y)
+	@echo "Copy gdbserver from the external toolchain to target..."
+	$(Q) $(call copy_toolchain_debugroot,$(SYSROOT_DIR),gdbserver,/usr/bin,$(BR2_TOOLCHAIN_EXTERNAL_STRIP))
+endif
 	@echo "Copy external toolchain sysroot to staging..."
 	$(Q)$(call copy_toolchain_sysroot,$(SYSROOT_DIR))
 	@touch $@
-- 
1.6.5.2
