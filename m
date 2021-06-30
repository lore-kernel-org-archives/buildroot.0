From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 30 Jun 2021 11:02:47 +0200
Subject: [Buildroot] [PATCH v2] boot/uboot: fix uboot building host tools on
 x86 architecture
Message-ID: <20210630090247.1035893-1-kory.maincent@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The make all command run the tools/makefile on the process.
This makefile use "pkg-config" command to support static link.
The issue is the use of pkg-config configured for crosscompiling
to build binaries tools for host architecture.
To fix it, I add pkg-config environment variable to configure it for host.

Add a test to avoid future regress on the build of U-boot.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/uboot/uboot.mk                           |  5 +++++
 .../package/test_uboot_openssl_pkgconfig.py   | 20 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 support/testing/tests/package/test_uboot_openssl_pkgconfig.py

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dbe82e65b1..5186e6071e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -307,6 +307,11 @@ define UBOOT_BUILD_CMDS
 		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
 	)
 	$(TARGET_CONFIGURE_OPTS) \
+	        PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		PKG_CONFIG_SYSROOT_DIR="/" \
+	        PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	        PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	        PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig" \
 		$(UBOOT_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_MAKE_TARGET)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
diff --git a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
new file mode 100644
index 0000000000..557b665b26
--- /dev/null
+++ b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
@@ -0,0 +1,20 @@
+import os
+
+import infra.basetest
+
+
+class TestUbootOpensslPkgConfig(infra.basetest.BRTest):
+    config = infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_x86_64=y
+        BR2_x86_atom=y
+        BR2_PACKAGE_OPENSSL=y
+        BR2_TARGET_UBOOT=y
+        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="efi-x86_payload64"
+        BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+        BR2_PACKAGE_HOST_PKGCONF=y
+        """
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "u-boot.bin")
+        self.assertTrue(os.path.exists(img))
+
-- 
2.25.1
