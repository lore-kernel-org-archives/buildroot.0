From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 23:49:57 +0100
Subject: [Buildroot] [PATCH 2/3] debug: provide an option to copy the
	gdbserver to the target
In-Reply-To: <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a3beb0b2963c6c7ba6ebf90643537380b117a2f4.1331765391.git.thomas.petazzoni@free-electrons.com>
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
 toolchain/toolchain-external/ext-tool.mk |   14 ++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 8501983..980666b 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -14,10 +14,18 @@ comment "Gdb debugger for the target needs WCHAR support in toolchain"
 
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
index 01ab91f..6e9686c 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -371,6 +371,20 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
 	fi ; \
+	if test x"$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" == x"y"; then \
+		gdbserver_found=0 ; \
+		for d in $${ARCH_SYSROOT_DIR} $${ARCH_SYSROOT_DIR}/../debug-root/ ; do \
+			if test -f $${d}/usr/bin/gdbserver ; then \
+				install -m 0755 -D $${d}/usr/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
+				gdbserver_found=1 ; \
+				break ; \
+			fi ; \
+		done ; \
+		if [ $${gdbserver_found} -eq 0 ] ; then \
+			echo "Could not find gdbserver in external toolchain" ; \
+			exit 1 ; \
+		fi ; \
+	fi ; \
 	touch $@
 
 # Build toolchain wrapper for preprocessor, C and C++ compiler, and setup
-- 
1.7.4.1
