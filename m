From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 20 Dec 2017 18:08:42 +0300
Subject: [Buildroot] [PATCH 1/2] libdrm-armada: new package
In-Reply-To: <20171220150843.21154-1-didin@synopsys.com>
References: <20171220150843.21154-1-didin@synopsys.com>
Message-ID: <20171220150843.21154-2-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libdrm-armada is an Etnaviv libdrm buffer object management module.
It is used with xf86-driver-video-armada, which is Xorg driver for Etnaviv.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
---
 package/Config.in                        |  1 +
 package/libdrm-armada/Config.in          |  7 +++++++
 package/libdrm-armada/libdrm-armada.hash |  2 ++
 package/libdrm-armada/libdrm-armada.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/libdrm-armada/Config.in
 create mode 100644 package/libdrm-armada/libdrm-armada.hash
 create mode 100644 package/libdrm-armada/libdrm-armada.mk

diff --git a/package/Config.in b/package/Config.in
index bd39a374f0..54caf7ae41 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1116,6 +1116,7 @@ menu "Graphics"
 	source "package/libdmtx/Config.in"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
+        source "package/libdrm-armada/Config.in"
 	source "package/libepoxy/Config.in"
 	source "package/libexif/Config.in"
 	source "package/libfm/Config.in"
diff --git a/package/libdrm-armada/Config.in b/package/libdrm-armada/Config.in
new file mode 100644
index 0000000000..5deabf35ae
--- /dev/null
+++ b/package/libdrm-armada/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDRM_ARMADA
+	bool "libdrm-armada"
+	select BR2_PACKAGE_LIBDRM
+	help
+	  Etnaviv libdrm buffer object management module
+
+	  http://git.arm.linux.org.uk/cgit/libdrm-armada.git/
diff --git a/package/libdrm-armada/libdrm-armada.hash b/package/libdrm-armada/libdrm-armada.hash
new file mode 100644
index 0000000000..40911ea8e4
--- /dev/null
+++ b/package/libdrm-armada/libdrm-armada.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0454ac8f55c7bfff548b75d7116c56fa125f5dfe118e630a85feb221de82fbb6  libdrm-armada-6b461c.tar.gz
diff --git a/package/libdrm-armada/libdrm-armada.mk b/package/libdrm-armada/libdrm-armada.mk
new file mode 100644
index 0000000000..fb96ad0b6e
--- /dev/null
+++ b/package/libdrm-armada/libdrm-armada.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libdrm-armada
+#
+################################################################################
+
+LIBDRM_ARMADA_VERSION = 6b461c
+LIBDRM_ARMADA_SOURCE = libdrm-armada-$(LIBDRM_ARMADA_VERSION).tar.gz
+LIBDRM_ARMADA_SITE = http://git.arm.linux.org.uk/cgit/libdrm-armada.git
+LIBDRM_ARMADA_SITE_METHOD = git
+LIBDRM_ARMADA_DEPENDENCIES = libdrm
+LIBDRM_ARMADA_INSTALL_STAGING = YES
+
+# We're patching configure.ac
+LIBDRM_ARMADA_AUTORECONF = YES
+
+# Needed for autoreconf to work properly
+define LIBDRM_ARMADA_FIXUP_M4_DIR
+        mkdir $(@D)/m4
+endef
+
+LIBDRM_ARMADA_POST_PATCH_HOOKS += LIBDRM_ARMADA_FIXUP_M4_DIR
+
+$(eval $(autotools-package))
-- 
2.11.0
