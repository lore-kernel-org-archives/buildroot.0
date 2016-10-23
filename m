From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Oct 2016 22:48:25 +0200
Subject: [Buildroot] [PATCH 24/30] toolchain/toolchain-external: move
	wrapper logic into a separate file
In-Reply-To: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477255711-28603-25-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-toolchain-external-wrapper.mk for the definition of the
TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER function, which installs the
symbolic links to use the wrapper.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../pkg-toolchain-external-wrapper.mk              | 40 ++++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk | 33 ------------------
 2 files changed, 40 insertions(+), 33 deletions(-)
 create mode 100644 toolchain/toolchain-external/pkg-toolchain-external-wrapper.mk

diff --git a/toolchain/toolchain-external/pkg-toolchain-external-wrapper.mk b/toolchain/toolchain-external/pkg-toolchain-external-wrapper.mk
new file mode 100644
index 0000000..ea4bb46
--- /dev/null
+++ b/toolchain/toolchain-external/pkg-toolchain-external-wrapper.mk
@@ -0,0 +1,40 @@
+#
+# The following functions creates the symbolic links needed to get the
+# cross-compilation tools visible in $(HOST_DIR)/usr/bin. Some of
+# links are done directly to the corresponding tool in the external
+# toolchain installation directory, while some other links are done to
+# the toolchain wrapper (preprocessor, C, C++ and Fortran compiler)
+#
+# We skip gdb symlink when we are building our own gdb to prevent two
+# gdb's in $(HOST_DIR)/usr/bin.
+#
+# The LTO support in gcc creates wrappers for ar, ranlib and nm which load
+# the lto plugin. These wrappers are called *-gcc-ar, *-gcc-ranlib, and
+# *-gcc-nm and should be used instead of the real programs when -flto is
+# used. However, we should not add the toolchain wrapper for them, and they
+# match the *cc-* pattern. Therefore, an additional case is added for *-ar,
+# *-ranlib and *-nm.
+#
+# $1 toolchain CROSS
+define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
+	$(Q)cd $(HOST_DIR)/usr/bin; \
+	for i in $(1)*; do \
+		base=$${i##*/}; \
+		case "$$base" in \
+		*-ar|*-ranlib|*-nm) \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			;; \
+		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran) \
+			ln -sf toolchain-wrapper $$base; \
+			;; \
+		*gdb|*gdbtui) \
+			if test "$(BR2_PACKAGE_HOST_GDB)" != "y"; then \
+				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			fi \
+			;; \
+		*) \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			;; \
+		esac; \
+	done
+endef
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index c997a0a..ea8bc36 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -571,39 +571,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
 endef
 endif
 
-# Build toolchain wrapper for preprocessor, C, C++ and Fortran compilers
-# and setup symlinks for everything else. Skip gdb symlink when we are
-# building our own gdb to prevent two gdb's in output/host/usr/bin.
-# The LTO support in gcc creates wrappers for ar, ranlib and nm which load
-# the lto plugin. These wrappers are called *-gcc-ar, *-gcc-ranlib, and
-# *-gcc-nm and should be used instead of the real programs when -flto is
-# used. However, we should not add the toolchain wrapper for them, and they
-# match the *cc-* pattern. Therefore, an additional case is added for *-ar,
-# *-ranlib and *-nm.
-# $1 toolchain CROSS
-define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
-	$(Q)cd $(HOST_DIR)/usr/bin; \
-	for i in $(1)*; do \
-		base=$${i##*/}; \
-		case "$$base" in \
-		*-ar|*-ranlib|*-nm) \
-			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
-			;; \
-		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran) \
-			ln -sf toolchain-wrapper $$base; \
-			;; \
-		*gdb|*gdbtui) \
-			if test "$(BR2_PACKAGE_HOST_GDB)" != "y"; then \
-				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
-			fi \
-			;; \
-		*) \
-			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
-			;; \
-		esac; \
-	done
-endef
-
 # uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
 # patched specifically for uClibc-ng, so it continues to generate
 # binaries that expect the dynamic loader to be named ld-uClibc.so.0,
-- 
2.5.5
