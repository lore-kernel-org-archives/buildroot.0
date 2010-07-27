From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 16:46:25 +0200
Subject: [Buildroot] [PATCH 16/16] Create <tuple>/lib -> <sysroot>/lib
	symlink before installing cross gcc
In-Reply-To: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2cdac810e3fa4ee0b5752d2fd9dd4d439732617a.1280241791.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit solves bug #1051. The problem in this bug in that WebKit
compiles a sample C program, which uses WebKit. As WebKit is written
in C++, even though the program it built with CROSS-gcc, it must be
linked with libstdc++. However, CROSS-gcc can't find the libstdc++ has
it's hidden inside <sysroot>/<tuple>/lib.

Therefore, this commit creates a symbolic link <sysroot>/<tuple>/lib
-> <sysroot>/lib before running the CROSS-gcc installation. While this
may look like a hack, this is the solution used by both Crosstool-NG
and OpenWRT.

Moreover, with this symbolic link in place, I think bug #1741 may also
be solved. The problem in this bug is that the linker tries to link
against /lib/libc.so.0. This is due to the fact that the linker finds
a libc.so script file in the original toolchain location and not
inside the copy of the toolchain sysroot in $(STAGING_DIR). As the
script file is found outside of the current toolchain sysroot, ld
considers the script has non-sysrooted, and therefore doesn't prefix
all paths found in the script file (such as /lib/libc.so.0) with the
sysroot path, leading to the failure.

So, in details, this commit :

 * Adds a BR2_ARCH_IS_64 invisible config knob that is used to know if
   the arch is a 64 bits architecture or not.

 * Creates the <sysroot>/<tuple>/lib -> <sysroot>/lib symbolic link,
   and the <sysroot>/<tuple>/lib64 -> <sysroot>/lib64 symbolic link if
   needed.

 * Fixes the external toolchain sysroot detection code so that the
   'sed' replacement is done *after* the readlink -f evaluation.

I have tested this by building ARM, x86 and x86_64 toolchains with
Buildroot, and then use these toolchains as external toolchains to
build a full X.org/Gtk/WebKit/Midori stack. I have also done a
complete ARM Buildroot internal toolchain build with the same full
X.org/Gtk/WebKit/Midori stack.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch                    |    5 +++++
 toolchain/external-toolchain/ext-tool.mk |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk          |    8 ++++++--
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 62721c9..3efebb8 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -1,3 +1,6 @@
+config BR2_ARCH_IS_64
+       bool
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386
@@ -38,8 +41,10 @@ config BR2_sparc
 	bool "sparc"
 config BR2_sparc64
 	bool "sparc64"
+	select BR2_ARCH_IS_64
 config BR2_x86_64
 	bool "x86_64"
+	select BR2_ARCH_IS_64
 config BR2_xtensa
 	bool "xtensa"
 endchoice
diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 40e3a52..8be86f5 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -306,7 +306,7 @@ endif # ! no threads
 TARGET_CC_NO_SYSROOT=$(filter-out --sysroot=%,$(TARGET_CC))
 SYSROOT_DIR=$(shell $(TARGET_CC_NO_SYSROOT) -print-sysroot 2>/dev/null)
 ifeq ($(SYSROOT_DIR),)
-SYSROOT_DIR=$(shell readlink -f $$(LANG=C $(TARGET_CC_NO_SYSROOT) -print-file-name=libc.a |sed -r -e 's:usr/lib/libc\.a::;'))
+SYSROOT_DIR=$(shell readlink -f $$(LANG=C $(TARGET_CC_NO_SYSROOT) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;')
 endif
 
 # Now, find if the toolchain specifies a sub-directory for the
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 081e906..981026f 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -261,8 +261,11 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR2)
 	# Important! Required for limits.h to be fixed.
 	ln -snf ../include/ $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-include
-	#-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
-	#ln -snf ../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
+	-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
+	mkdir -p $(STAGING_DIR)/lib
+	ln -snf ../../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
+	$(if $(BR2_ARCH_IS_64),mkdir -p $(STAGING_DIR)/lib64)
+	$(if $(BR2_ARCH_IS_64),ln -snf ../../lib64 $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib64)
 	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_SRC_DIR)/configure $(QUIET) \
@@ -307,6 +310,7 @@ $(GCC_BUILD_DIR2)/.installed: $(GCC_BUILD_DIR2)/.compiled
 		fi; \
 		mv "$(STAGING_DIR)/lib64/"* "$(STAGING_DIR)/lib/"; \
 		rmdir "$(STAGING_DIR)/lib64"; \
+		rm "$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib64";\
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-- 
1.7.0.4
