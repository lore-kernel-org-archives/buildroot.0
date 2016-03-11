From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:19:59 +0100
Subject: [Buildroot] [PATCH 6/6] linux/perf: build the host perf tool
In-Reply-To: <cover.1457720152.git.yann.morin.1998@free.fr>
References: <cover.1457720152.git.yann.morin.1998@free.fr>
Message-ID: <b5f50fa3c517ddd37dbf339c011f6bf0621f55ac.1457720152.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we only build the target variant of the perf tool. However,
perf on the target may generate a bunch of data files that may have to
be analysed on the host.

There is no host-variant of the linux-tools infrastructure, so we just
build the host perf at the same time we build the target one.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 linux/Config.tools.in    |  4 ++++
 linux/linux-tool-perf.mk | 51 ++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/linux/Config.tools.in b/linux/Config.tools.in
index 24ef8cd..a01b53e 100644
--- a/linux/Config.tools.in
+++ b/linux/Config.tools.in
@@ -26,4 +26,8 @@ config BR2_LINUX_KERNEL_TOOL_PERF
 
 	  https://perf.wiki.kernel.org/
 
+config BR2_LINUX_KERNEL_TOOL_HOST_PERF
+    bool "host-perf"
+    depends on BR2_LINUX_KERNEL_TOOL_PERF
+
 endmenu
diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
index f584955..c352677 100644
--- a/linux/linux-tool-perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -41,6 +41,26 @@ else ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
 PERF_MAKE_FLAGS += LD="$(TARGET_LD) -EL"
 endif
 
+# For the host, we inherit the same flags as for the target,
+# overriding just those that are needed.
+HOST_PERF_MAKE_FLAGS = \
+	$(PERF_MAKE_FLAGS) \
+	CFLAGS="$(HOST_CFLAGS) -I$(HOST_DIR)/usr/include/elfutils" \
+	LDFLAGS="$(HOST_LDFLAGS)" \
+	LD="$(HOSTLD)" \
+	ARCH=$(PERF_ARCH) \
+	CROSS_COMPILE= \
+	DESTDIR=$(HOST_DIR)
+
+# No host-packages in Buildroot, but we don't let it depend on the
+# libraries provided by the host system (they may be there or not,
+# depending on the user's system, but we won't play that game).
+HOST_PERF_MAKE_FLAGS += \
+	NO_SLANG=1 \
+	NO_LIBUNWIND=1 \
+	NO_LIBNUMA=1 \
+	NO_LIBELF=1 NO_DWARF=1
+
 # The call to backtrace() function fails for ARC, because for some
 # reason the unwinder from libgcc returns early. Thus the usage of
 # backtrace() should be disabled in perf explicitly: at build time
@@ -49,6 +69,7 @@ endif
 # instead of the complete backtrace.
 ifeq ($(BR2_arc),y)
 PERF_MAKE_FLAGS += NO_BACKTRACE=1
+HOST_PERF_MAKE_FLAGS += NO_BACKTRACE=1
 endif
 
 ifeq ($(BR2_PACKAGE_SLANG),y)
@@ -76,14 +97,14 @@ PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-PERF_DEPENDENCIES += zlib
+PERF_DEPENDENCIES += zlib host-zlib
 else
 PERF_MAKE_FLAGS += NO_ZLIB=1
 endif
 
 # lzma is provided by xz
 ifeq ($(BR2_PACKAGE_XZ),y)
-PERF_DEPENDENCIES += xz
+PERF_DEPENDENCIES += xz host-xz
 else
 PERF_MAKE_FLAGS += NO_LZMA=1
 endif
@@ -101,10 +122,26 @@ define PERF_DISABLE_DOCUMENTATION
 endef
 LINUX_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
 
-# O must be redefined here to overwrite the one used by Buildroot for
-# out of tree build. We build perf in $(@D)/tools/perf/ and not just
-# $(@D) so that it isn't built in the root directory of the kernel
-# sources.
+# O must be redefined in the commands to overwrite the one used by
+# Buildroot for out of tree build. This is valid for both the host
+# and the target builds.
+#
+# We specify the directory where to build perf so that:
+#  - we don't mix the host and the target variants,
+#  - it isn't built in the root directory of the kernel sources.
+
+ifeq ($(BR2_LINUX_KERNEL_TOOL_HOST_PERF),y)
+define HOST_PERF_BUILD_CMDS
+	$(Q)mkdir -p $(@D)/tools/perf/br-host
+	$(HOST_MAKE_ENV) $(MAKE1) $(HOST_PERF_MAKE_FLAGS) \
+		-C $(@D)/tools/perf O=$(@D)/tools/perf/br-host
+endef
+define HOST_PERF_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE1) $(HOST_PERF_MAKE_FLAGS) \
+		-C $(@D)/tools/perf O=$(@D)/tools/perf/br-host install
+endef
+endif
+
 define PERF_BUILD_CMDS
 	$(Q)if test ! -f $(@D)/tools/perf/Makefile ; then \
 		echo "Your kernel version is too old and does not have the perf tool." ; \
@@ -123,6 +160,7 @@ define PERF_BUILD_CMDS
 	$(Q)mkdir -p $(@D)/tools/perf/br-target
 	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
 		-C $(@D)/tools/perf O=$(@D)/tools/perf/br-target
+	$(HOST_PERF_BUILD_CMDS)
 endef
 
 # After installation, we remove the Perl and Python scripts from the
@@ -132,4 +170,5 @@ define PERF_INSTALL_TARGET_CMDS
 		-C $(@D)/tools/perf O=$(@D)/tools/perf/br-target install
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
+	$(HOST_PERF_INSTALL_CMDS)
 endef
-- 
1.9.1
