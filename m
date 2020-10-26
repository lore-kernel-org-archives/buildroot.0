From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Mon, 26 Oct 2020 22:34:33 +0100
Subject: [Buildroot] [PATCH] package/lzma-alone: new package
Message-ID: <20201026213433.4309-1-zajec5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Rafa? Mi?ecki <rafal@milecki.pl>

This new package provides "lzma_alone" host binary based on the original
LZMA SDK. It provides few extra options when compared to the LZMA Utils
project "lzma" binary (already packaged as the "lzma").

This tool is required for preparing firmware images for some home
routers with picky bootloaders. It's main advantage is support for
specifying dictionary size and lc/lp/pb LZMA values.

Broadcom CFE bootloader for MIPS BCM47xx devices is known to fail to
boot images using LZMA compression with dictionary.
Broadcom cferam bootloader for ARM64 BCM4908 devices is known to fail to
boot images without uncompressed size specified.
Broadcom CFE for BCM63xx DSL devices has even different requirements.

Packaging LZMA SDK "lzma" as "lzma_alone" is how it's handled in the
Arch, Debian and Ubuntu.

Signed-off-by: Rafa? Mi?ecki <rafal@milecki.pl>
---
 package/lzma-alone/lzma-alone.hash |  1 +
 package/lzma-alone/lzma-alone.mk   | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 package/lzma-alone/lzma-alone.hash
 create mode 100644 package/lzma-alone/lzma-alone.mk

diff --git a/package/lzma-alone/lzma-alone.hash b/package/lzma-alone/lzma-alone.hash
new file mode 100644
index 0000000000..39759c4e3b
--- /dev/null
+++ b/package/lzma-alone/lzma-alone.hash
@@ -0,0 +1 @@
+sha256	9aade84f229fb25f7aef39d8866b375fe6d35a9e18098d7cd86a99e294902944	lzma922.tar.bz2
diff --git a/package/lzma-alone/lzma-alone.mk b/package/lzma-alone/lzma-alone.mk
new file mode 100644
index 0000000000..6a1d8dd3c0
--- /dev/null
+++ b/package/lzma-alone/lzma-alone.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# lzma-alone
+#
+################################################################################
+
+LZMA_ALONE_VERSION = 9.22
+LZMA_ALONE_SITE = https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/
+LZMA_ALONE_SOURCE = lzma922.tar.bz2
+LZMA_ALONE_STRIP_COMPONENTS = 0
+LZMA_ALONE_LICENSE = LGPL-2.1-or-later, BSD-3-Clause
+
+define HOST_LZMA_ALONE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/C/Util/Lzma -f makefile.gcc
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/CPP/7zip/Bundles/LzmaCon -f makefile.gcc
+endef
+
+define HOST_LZMA_ALONE_INSTALL_CMDS
+	$(INSTALL) -d -m 0755 $(HOST_DIR)/bin
+	$(INSTALL) -D -m 0755 $(@D)/CPP/7zip/Bundles/LzmaCon/lzma $(HOST_DIR)/bin/lzma_alone
+endef
+
+$(eval $(host-generic-package))
-- 
2.27.0
