From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Mar 2012 23:04:39 +0100
Subject: [Buildroot] [git commit] debug: provide an option to copy the
	gdbserver to the target
Message-ID: <20120315221627.8117290DC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c56b58b4b71a5fd87d6d3d61e08a627c968acda1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When an external toolchain is used, it is very likely that it contains
a pre-built version of a gdbserver that has the same version as the
cross-gdb included in the external toolchain. So, we now provide an
option that allows to copy this pre-built gdbserver to the target.

As the location of the gdbserver in the external toolchain is not
standardized, we only support the CodeSourcery and Crosstool-NG
layouts for the moment. Other locations can be added later.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
index dbd39b0..31ba50f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -375,6 +375,20 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
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
