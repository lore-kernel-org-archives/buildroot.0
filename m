From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed,  6 Dec 2017 14:29:15 +0100
Subject: [Buildroot] [PATCH] linux-tools: add usbip (USB/IP userspace tools)
Message-ID: <1512566955-4712-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

I did this work before knowing the existence of previous attempts:
* 12/2012: http://lists.busybox.net/pipermail/buildroot/2012-December/064070.html
* 12/2016: http://buildroot-busybox.2317881.n4.nabble.com/PATCH-usbip-add-a-new-package-td152317.html

I choosed to duplicate some autostuff infra commands in linux-tools as it was
more logical to me to include usbip inside linux-tools instead of trying to make
it a "normal" BR package. Indeed, previous 2016 attempt finally never reached
BR mainline.
Since 2012 usbip have moved from an external tool to an inside kernel sources
one.

2 linux patches are added to fix issues encountered while build testing with
utils/test-pkg. These patches have been sent upstream (linux-usb).

Config used for test-pkg is:

BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="mxs"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17=y
BR2_PACKAGE_LINUX_TOOLS_USBIP=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_USE_INTREE_DTS=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28evk"

(some toolchains needs to select a device tree explicitly)

Results are the following:

./utils/test-pkg -c usbip.config -p linux-tool
                armv5-ctng-linux-gnueabi [ 1/47]: SKIPPED
              armv7-ctng-linux-gnueabihf [ 2/47]: SKIPPED
                        br-aarch64-glibc [ 3/47]: OK
                           br-arcle-hs38 [ 4/47]: OK
                            br-arm-basic [ 5/47]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                   br-arm-cortex-a9-musl [ 7/47]: OK
                   br-arm-cortex-m4-full [ 8/47]: SKIPPED
                             br-arm-full [ 9/47]: SKIPPED
                    br-arm-full-nothread [10/47]: OK
                      br-arm-full-static [11/47]: SKIPPED
                            br-bfin-full [12/47]: SKIPPED
                   br-i386-pentium4-full [13/47]: SKIPPED
                br-i386-pentium-mmx-musl [14/47]: SKIPPED
                       br-m68k-5208-full [15/47]: SKIPPED
                      br-m68k-68040-full [16/47]: OK
                    br-microblazeel-full [17/47]: OK
                 br-mips32r6-el-hf-glibc [18/47]: OK
                      br-mips64-n64-full [19/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: OK
                      br-mipsel-o32-full [21/47]: OK
                          br-nios2-glibc [22/47]: OK
                      br-openrisc-uclibc [23/47]: OK
               br-powerpc-603e-basic-cpp [24/47]: SKIPPED
             br-powerpc64le-power8-glibc [25/47]: OK
               br-powerpc64-power7-glibc [26/47]: OK
                  br-powerpc-e500mc-full [27/47]: OK
                             br-sh4-full [28/47]: OK
                        br-sparc64-glibc [29/47]: OK
                         br-sparc-uclibc [30/47]: OK
                    br-x86-64-core2-full [31/47]: OK
                          br-x86-64-musl [32/47]: OK
                          br-xtensa-full [33/47]: OK
                     i686-ctng-linux-gnu [34/47]: SKIPPED
                          linaro-aarch64 [35/47]: OK
                              linaro-arm [36/47]: OK
             mips64el-ctng_n32-linux-gnu [37/47]: SKIPPED
             mips64el-ctng_n64-linux-gnu [38/47]: SKIPPED
        powerpc-ctng_e500v2-linux-gnuspe [39/47]: SKIPPED
                     sourcery-arm-armv4t [40/47]: SKIPPED
                            sourcery-arm [41/47]: SKIPPED
                     sourcery-arm-thumb2 [42/47]: SKIPPED
                         sourcery-mips64 [43/47]: OK
                           sourcery-mips [44/47]: OK
                          sourcery-nios2 [45/47]: OK
                         sourcery-x86-64 [46/47]: OK
           x86_64-ctng_locales-linux-gnu [47/47]: SKIPPED
47 builds, 19 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 ...tial-minor-buffer-overflow-de.patch.conditional | 39 ++++++++++++++++
 ...uild-with-musl-libc-toolchain.patch.conditional | 44 ++++++++++++++++++
 linux/linux.mk                                     | 18 ++++++++
 package/linux-tools/Config.in                      | 21 +++++++++
 package/linux-tools/linux-tool-usbip.mk.in         | 54 ++++++++++++++++++++++
 5 files changed, 176 insertions(+)
 create mode 100644 linux/0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional
 create mode 100644 linux/0003-tools-usbip-fixes-build-with-musl-libc-toolchain.patch.conditional
 create mode 100644 package/linux-tools/linux-tool-usbip.mk.in

diff --git a/linux/0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional b/linux/0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional
new file mode 100644
index 0000000..921e83c
--- /dev/null
+++ b/linux/0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional
@@ -0,0 +1,39 @@
+From 51d880bf162e88db19eb26829021078c92ad3260 Mon Sep 17 00:00:00 2001
+From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
+Date: Tue, 5 Dec 2017 14:49:36 +0100
+Subject: [PATCH] tools/usbip: fixes potential (minor) "buffer overflow"
+ (detected on recent gcc with -Werror)
+
+Fixes following build error:
+vhci_driver.c: In function 'refresh_imported_device_list':
+vhci_driver.c:118:37: error: 'snprintf' output may be truncated before
+	the last format character [-Werror=format-truncation=]
+    snprintf(status, sizeof(status), "status.%d", i);
+                                     ^~~~~~~~~~~
+vhci_driver.c:118:4: note: 'snprintf' output between 9 and 18 bytes into
+	a destination of size 17
+    snprintf(status, sizeof(status), "status.%d", i);
+    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+cc1: all warnings being treated as errors
+
+Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
+---
+ tools/usb/usbip/libsrc/vhci_driver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/usb/usbip/libsrc/vhci_driver.c b/tools/usb/usbip/libsrc/vhci_driver.c
+index 5727dfb..a9ce431 100644
+--- a/tools/usb/usbip/libsrc/vhci_driver.c
++++ b/tools/usb/usbip/libsrc/vhci_driver.c
+@@ -106,7 +106,7 @@ static int parse_status(const char *value)
+ 	return 0;
+ }
+ 
+-#define MAX_STATUS_NAME 16
++#define MAX_STATUS_NAME 18
+ 
+ static int refresh_imported_device_list(void)
+ {
+-- 
+2.1.4
+
diff --git a/linux/0003-tools-usbip-fixes-build-with-musl-libc-toolchain.patch.conditional b/linux/0003-tools-usbip-fixes-build-with-musl-libc-toolchain.patch.conditional
new file mode 100644
index 0000000..b2f5683
--- /dev/null
+++ b/linux/0003-tools-usbip-fixes-build-with-musl-libc-toolchain.patch.conditional
@@ -0,0 +1,44 @@
+From f30ff30e80b977311d15ed1134f7e13c379601a5 Mon Sep 17 00:00:00 2001
+From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
+Date: Tue, 5 Dec 2017 18:10:07 +0100
+Subject: [PATCH] tools/usbip: fixes build with musl libc toolchain
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Indeed musl doesn't define old SIGCLD signal name but only new one SIGCHLD.
+SIGCHLD is the new POSIX name for that signal so it doesn't change
+anything on other libcs.
+
+This fixes this kind of build error:
+
+usbipd.c: In function ?set_signal?:
+usbipd.c:459:12: error: 'SIGCLD' undeclared (first use in this function)
+  sigaction(SIGCLD, &act, NULL);
+            ^~~~~~
+usbipd.c:459:12: note: each undeclared identifier is reported only once
+	for each function it appears in
+Makefile:407: recipe for target 'usbipd.o' failed
+make[3]: *** [usbipd.o] Error 1
+
+Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
+---
+ tools/usb/usbip/src/usbipd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
+index 009afb4..c6dad2a 100644
+--- a/tools/usb/usbip/src/usbipd.c
++++ b/tools/usb/usbip/src/usbipd.c
+@@ -456,7 +456,7 @@ static void set_signal(void)
+ 	sigaction(SIGTERM, &act, NULL);
+ 	sigaction(SIGINT, &act, NULL);
+ 	act.sa_handler = SIG_IGN;
+-	sigaction(SIGCLD, &act, NULL);
++	sigaction(SIGCHLD, &act, NULL);
+ }
+ 
+ static const char *pid_file;
+-- 
+2.1.4
+
diff --git a/linux/linux.mk b/linux/linux.mk
index bd5589b..8877a7b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -221,6 +221,24 @@ define LINUX_TRY_PATCH_TIMECONST
 endef
 LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
+# Fixes tools/usbip build with recent gcc when -Werror is used
+# Try a dry-run patch to see if this applies, if it does go ahead
+define LINUX_TRY_PATCH_USBIP_GCC
+	@if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional >/dev/null ; then \
+		$(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional ; \
+	fi
+endef
+LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_USBIP_GCC
+
+# Fixes tools/usbip build with musl toolchains
+# Try a dry-run patch to see if this applies, if it does go ahead
+define LINUX_TRY_PATCH_USBIP_MUSL
+	@if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0003-tools-usbip-fixes-build-with-musl-libc-toolchain.patch.conditional >/dev/null ; then \
+		$(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0003-tools-usbip-fixes-build-with-musl-libc-toolchain.patch.conditional ; \
+	fi
+endef
+LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_USBIP_MUSL
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index e3ccd85..223045a 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -85,4 +85,25 @@ config BR2_PACKAGE_LINUX_TOOLS_TMON
 	  tmon is a terminal-based tool (using curses) that allows the
 	  user to access thermal information about the system.
 
+config BR2_PACKAGE_LINUX_TOOLS_USBIP
+	bool "usbip"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17	# moved out of staging/ dir in kernel 3.17
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  USB/IP protocol allows to pass USB device from server to client over
+	  the network.
+	  You need to activate support for it in your kernel configuration.
+
+	  This (usbip) is the set of userspace tools used to handle connection
+	  and management.
+
+	  You can optionally add hwdata package to your BR config to have
+	  better runtime experience.
+
+	  https://github.com/torvalds/linux/blob/master/tools/usb/usbip/README
+
+comment "usbip needs udev /dev management and a toolchain w/ headers >= 3.17"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+
 endmenu
diff --git a/package/linux-tools/linux-tool-usbip.mk.in b/package/linux-tools/linux-tool-usbip.mk.in
new file mode 100644
index 0000000..9a599ee
--- /dev/null
+++ b/package/linux-tools/linux-tool-usbip.mk.in
@@ -0,0 +1,54 @@
+################################################################################
+#
+# usbip
+#
+################################################################################
+
+LINUX_TOOLS += usbip
+
+USBIP_DEPENDENCIES = udev
+USBIP_CONF_OPTS = --with-tcp-wrappers=no
+
+define USBIP_BUILD_CMDS
+	$(Q)if test ! -f $(LINUX_DIR)/tools/usb/usbip/Makefile.am ; then \
+		echo "Your kernel version is too old and does not have the usbip tool." ; \
+		echo "At least kernel 3.17 must be used." ; \
+		exit 1 ; \
+	fi
+
+	cd $(LINUX_DIR)/tools/usb/usbip && PATH=$(BR_PATH) ./autogen.sh
+
+	cd $(LINUX_DIR)/tools/usb/usbip && rm -rf config.cache && \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(USBIP_CONF_ENV) \
+		CONFIG_SITE=/dev/null \
+		./configure \
+			--target=$(GNU_TARGET_NAME) \
+			--host=$(GNU_TARGET_NAME) \
+			--build=$(GNU_HOST_NAME) \
+			--prefix=/usr \
+			--exec-prefix=/usr \
+			--sysconfdir=/etc \
+			--localstatedir=/var \
+			--program-prefix="" \
+			$(QUIET) $(USBIP_CONF_OPTS)
+
+	$(TARGET_MAKE_ENV) $(MAKE) $(USBIP_MAKE_OPTS) \
+		 -C $(LINUX_DIR)/tools/usb/usbip/
+endef
+
+# for libusbip
+define USBIP_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb/usbip \
+		$(USBIP_MAKE_OPTS) \
+		DESTDIR=$(STAGING_DIR) \
+		install
+endef
+
+define USBIP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb/usbip \
+		$(USBIP_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		install
+endef
-- 
2.1.4
