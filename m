From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu,  4 Feb 2021 18:04:46 +0100
Subject: [Buildroot] [PATCH] boot/uboot: fix uboot build
Message-ID: <20210204170446.15188-1-kory.maincent@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The make all command run the tools/makefile on the process.
This makefile use "pkg-config" command to support static link.
The issue is the use of pkg-config configured for crosscompiling
to build binaries tools for host architecture.
To fix it, I copied the behavior of QtWebengine by using a pkg-config
executable preconfigured for host.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/uboot/host-pkg-config.in |  6 ++++++
 boot/uboot/uboot.mk           | 10 +++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 boot/uboot/host-pkg-config.in

diff --git a/boot/uboot/host-pkg-config.in b/boot/uboot/host-pkg-config.in
new file mode 100644
index 0000000000..86a980648b
--- /dev/null
+++ b/boot/uboot/host-pkg-config.in
@@ -0,0 +1,6 @@
+#!/bin/sh
+PKG_CONFIG_SYSROOT_DIR="/" \
+PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+PKG_CONFIG_LIBDIR="@HOST_DIR@/lib/pkgconfig:@HOST_DIR@/share/pkgconfig" \
+exec @HOST_DIR@/bin/pkgconf "$@"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2478a2a1e9..0bcc1ac9a9 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -302,11 +302,19 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
 
+define UBOOT_CREATE_HOST_PKG_CONFIG
+	mkdir -p $(@D)/host-bin
+	sed s%@HOST_DIR@%$(HOST_DIR)%g $(UBOOT_PKGDIR)/host-pkg-config.in > $(@D)/host-bin/pkg-config
+	chmod +x $(@D)/host-bin/pkg-config
+endef
+UBOOT_PRE_CONFIGURE_HOOKS = UBOOT_CREATE_HOST_PKG_CONFIG
+UBOOT_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
+
 define UBOOT_BUILD_CMDS
 	$(if $(UBOOT_CUSTOM_DTS_PATH),
 		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
 	)
-	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_OPTS) $(UBOOT_ENV) \
 		$(UBOOT_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_MAKE_TARGET)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
-- 
2.17.1
