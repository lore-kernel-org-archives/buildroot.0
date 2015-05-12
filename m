From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 May 2015 23:02:13 +0200
Subject: [Buildroot] [PATCH] uboot-tools: fix static linking with OpenSSL
Message-ID: <1431464533-15795-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Had a patch to U-Boot to use pkg-config to get the OpenSSL link flags
when pkg-config is available. This allows to make sure that static
linking works properly. The patch requires adding $(TARGET_MAKE_ENV)
so that the Buildroot provided pkg-config is used instead of the host
one.

The U-Boot patch has been submitted upstream.

Fixes:

  http://autobuild.buildroot.org/results/a9f/a9f316cd076a74b8730ce4cdcdb8176da4ed9eb3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...kg-config-when-available-to-get-SSL-flags.patch | 39 ++++++++++++++++++++++
 package/uboot-tools/uboot-tools.mk                 |  6 ++--
 2 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch

diff --git a/package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch b/package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch
new file mode 100644
index 0000000..db038ff
--- /dev/null
+++ b/package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch
@@ -0,0 +1,39 @@
+From 7f47f7f8c1a0d634e9febad61504f095476fccc0 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 12 May 2015 22:54:29 +0200
+Subject: [PATCH] tools: use pkg-config when available to get SSL flags
+
+Instead of hardcoding -lssl -lcrypto as the flags needed to build
+mkimage with FIT signature enabled, use pkg-config when
+available. This allows to properly support cases where static linking
+is used, which requires linking with -lz, since OpenSSL uses zlib
+internally.
+
+We gracefully fallback on the previous behavior of hardcoding -lssl
+-lcrypto if pkg-config is not available or fails with an error.
+
+Patch submitted upstream at
+http://lists.denx.de/pipermail/u-boot/2015-May/214068.html.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ tools/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 4bbb153..e1bcd59 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -122,7 +122,8 @@ endif
+ 
+ # MXSImage needs LibSSL
+ ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_FIT_SIGNATURE),)
+-HOSTLOADLIBES_mkimage += -lssl -lcrypto
++HOSTLOADLIBES_mkimage += \
++	$(shell pkg-config --libs libssl 2> /dev/null || echo "-lssl -lcrypto")
+ endif
+ 
+ HOSTLOADLIBES_dumpimage := $(HOSTLOADLIBES_mkimage)
+-- 
+2.1.0
+
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index b66fd71..3ae346e 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -16,14 +16,14 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 endef
 
 define UBOOT_TOOLS_BUILD_CMDS
-	$(MAKE) -C $(@D) 			\
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) 	\
 		CROSS_COMPILE="$(TARGET_CROSS)"	\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
 		CROSS_BUILD_TOOLS=y		\
 		CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) \
 		tools-only
-	$(MAKE) -C $(@D) 			\
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) 	\
 		CROSS_COMPILE="$(TARGET_CROSS)"	\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
@@ -35,7 +35,7 @@ define UBOOT_TOOLS_INSTALL_MKIMAGE
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(TARGET_DIR)/usr/bin/mkimage
 endef
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT),y)
-UBOOT_TOOLS_DEPENDENCIES += openssl
+UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
 endif # BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
 endif # BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 
-- 
2.1.0
