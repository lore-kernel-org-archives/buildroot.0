From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 30 Jul 2013 18:32:30 +0200
Subject: [Buildroot] [PATCH] toolchain-external: don't create gdb symlink
 when building host-gdb
Message-ID: <f0fae6a2b5b0500a20ab.1375201950@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The external-toolchain infrastructure creates symbolic links for all
tools in the host directory. However, when buildroot builds its own
version of a cross debugger (BR2_PACKAGE_HOST_GDB), and the toolchain
also provides a cross debugger, there would be two symbolic links for
gdb in the host directory, which is confusing.
An example use case is where the external toolchain only provides a
64-bit gdbserver (e.g. Cavium Networks SDK) but the target is completely
32-bit (e.g. n32 ABI). In this case, using gdbserver on target requires
copying a bunch of 64-bit libraries to the target as well, just for gdb.
In this case, one can let buildroot build both gdbserver as cross-gdb
(both in 32-bit).

This patch modifies the symlink creation so that no gdb (or gdbtui)
symlink is created if buildroot is going to build a cross-gdb.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 toolchain/toolchain-external/ext-tool.mk |  10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -531,8 +531,9 @@ ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
 TOOLCHAIN_EXTERNAL_INSTALL += $(STAMP_DIR)/ext-toolchain-bfin-shared-flat-installed
 endif
 
-# Build toolchain wrapper for preprocessor, C and C++ compiler, and setup
-# symlinks for everything else
+# Build toolchain wrapper for preprocessor, C and C++ compiler and setup
+# symlinks for everything else. Skip gdb symlink when we are building our
+# own gdb to prevent two gdb's in output/host/usr/bin.
 $(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(TOOLCHAIN_EXTERNAL_INSTALL)
 	$(Q)$(call MESSAGE,"Building ext-toolchain wrapper")
 	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
@@ -542,6 +543,11 @@ endif
 		*cc|*cc-*|*++|*++-*|*cpp) \
 			ln -sf $(@F) $$base; \
 			;; \
+		*gdb|*gdbtui) \
+			if test "$(BR2_PACKAGE_HOST_GDB)" != "y"; then \
+				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			fi \
+			;; \
 		*) \
 			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
 			;; \
