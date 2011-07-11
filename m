From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 23:53:24 +0200
Subject: [Buildroot] [PATCH 3/4] debug: provide an option to copy the
	gdbserver to the target
In-Reply-To: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4c6c36aa1c3b6cabcd011ad1ea712f55acbbdd30.1310421076.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When an external toolchain is used, it is very likely that it contains
a pre-built version of a gdbserver that has the same version as the
cross-gdb included in the external toolchain. So, we now provide an
option that allows to copy this pre-built gdbserver to the target.

As the location of the gdbserver in the external toolchain is not
standardized, we only support the CodeSourcery and Crosstool-NG
layouts for the moment. Other locations can be added later.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/Config.in                  |    8 ++++++++
 toolchain/toolchain-external/ext-tool.mk |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 8295f79..c5c9829 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -12,10 +12,18 @@ comment "Gdb debugger for the target needs WCHAR support in toolchain"
 
 config BR2_PACKAGE_GDB_SERVER
 	bool "Build gdb server for the Target"
+	depends on !BR2_TOOLCHAIN_EXTERNAL
 	help
 	    Build the gdbserver stub to run on the target.
 	    A full gdb is needed to debug the progam.
 
+config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
+	bool "Copy gdb server to the Target"
+	depends on BR2_TOOLCHAIN_EXTERNAL
+	help
+	  Copy the gdbserver provided by the external toolchain to the
+	  target.
+
 config BR2_PACKAGE_GDB_HOST
 	bool "Build gdb for the Host"
 	# cross-gdb is supposed to be part of the external
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index ef71ce0..64c389e 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -298,6 +298,16 @@ $(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
 	fi ; \
+	if [ x"$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" == x"y" ] ; then \
+		if test -f "$${ARCH_SYSROOT_DIR}/usr/bin/gdbserver" ; then \
+			install -m 0755 -D $${ARCH_SYSROOT_DIR}/usr/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
+		elif test -f "$${ARCH_SYSROOT_DIR}/../debug-root/gdbserver" ; then \
+			install -m 0755 -D $${ARCH_SYSROOT_DIR}/../debug-root/gdbserver ; \
+		else \
+			echo "Could not find gdbserver in external toolchain" ; \
+			exit 1 ; \
+		fi ; \
+	fi ; \
 	touch $@
 
 # Build toolchain wrapper for preprocessor, C and C++ compiler, and setup
-- 
1.7.4.1
