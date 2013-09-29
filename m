From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Sun, 29 Sep 2013 15:54:55 -0700
Subject: [Buildroot] [PATCH 1/4] i.MX: move Freescale i.MX packages into
	freescale-imx/
In-Reply-To: <1380495298-22823-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1380495298-22823-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1380495298-22823-2-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages libfslcodec, libfslparser, and libfslvpuwrap each
share URLs and versioning information with other packages
in the freescale-imx/ directory. By moving these packages
there, it's easier to keep them up to date and easier for
users to locate related components.

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 package/Config.in                                  |  3 --
 package/freescale-imx/Config.in                    |  3 ++
 package/freescale-imx/libfslcodec/Config.in        |  8 +++++
 package/freescale-imx/libfslcodec/libfslcodec.mk   | 40 ++++++++++++++++++++++
 package/freescale-imx/libfslparser/Config.in       |  8 +++++
 package/freescale-imx/libfslparser/libfslparser.mk | 40 ++++++++++++++++++++++
 package/freescale-imx/libfslvpuwrap/Config.in      | 13 +++++++
 .../freescale-imx/libfslvpuwrap/libfslvpuwrap.mk   | 18 ++++++++++
 package/libfslcodec/Config.in                      |  8 -----
 package/libfslcodec/libfslcodec.mk                 | 40 ----------------------
 package/libfslparser/Config.in                     |  8 -----
 package/libfslparser/libfslparser.mk               | 40 ----------------------
 package/libfslvpuwrap/Config.in                    | 13 -------
 package/libfslvpuwrap/libfslvpuwrap.mk             | 18 ----------
 14 files changed, 130 insertions(+), 130 deletions(-)
 create mode 100644 package/freescale-imx/libfslcodec/Config.in
 create mode 100644 package/freescale-imx/libfslcodec/libfslcodec.mk
 create mode 100644 package/freescale-imx/libfslparser/Config.in
 create mode 100644 package/freescale-imx/libfslparser/libfslparser.mk
 create mode 100644 package/freescale-imx/libfslvpuwrap/Config.in
 create mode 100644 package/freescale-imx/libfslvpuwrap/libfslvpuwrap.mk
 delete mode 100644 package/libfslcodec/Config.in
 delete mode 100644 package/libfslcodec/libfslcodec.mk
 delete mode 100644 package/libfslparser/Config.in
 delete mode 100644 package/libfslparser/libfslparser.mk
 delete mode 100644 package/libfslvpuwrap/Config.in
 delete mode 100644 package/libfslvpuwrap/libfslvpuwrap.mk

diff --git a/package/Config.in b/package/Config.in
index c6ea66b..a310073 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -576,9 +576,6 @@ source "package/libdvbsi/Config.in"
 source "package/libdvdread/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libebml/Config.in"
-source "package/libfslcodec/Config.in"
-source "package/libfslparser/Config.in"
-source "package/libfslvpuwrap/Config.in"
 source "package/libmatroska/Config.in"
 source "package/libmms/Config.in"
 source "package/libmpeg2/Config.in"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 7c22f79..9369ee2 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -4,5 +4,8 @@ menu "Freescale i.MX libraries"
 source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 source "package/freescale-imx/gpu-viv-bin-mx6q/Config.in"
+source "package/freescale-imx/libfslcodec/Config.in"
+source "package/freescale-imx/libfslparser/Config.in"
+source "package/freescale-imx/libfslvpuwrap/Config.in"
 
 endmenu
diff --git a/package/freescale-imx/libfslcodec/Config.in b/package/freescale-imx/libfslcodec/Config.in
new file mode 100644
index 0000000..7b31b7a
--- /dev/null
+++ b/package/freescale-imx/libfslcodec/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBFSLCODEC
+	bool "libfslcodec"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  Binary codec libraries for the Freescale i.MX SoCs.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/freescale-imx/libfslcodec/libfslcodec.mk b/package/freescale-imx/libfslcodec/libfslcodec.mk
new file mode 100644
index 0000000..c18332a
--- /dev/null
+++ b/package/freescale-imx/libfslcodec/libfslcodec.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# libfslcodec
+#
+################################################################################
+
+LIBFSLCODEC_VERSION = 3.0.1
+# No official download site from freescale, just this mirror
+LIBFSLCODEC_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
+LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
+LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
+# This is a legal minefield: the EULA in the bin file specifies that
+# the Board Support Package includes software and hardware (sic!)
+# for which a separate license is needed...
+LIBFSLCODEC_REDISTRIBUTE = NO
+
+LIBFSLCODEC_INSTALL_STAGING = YES
+
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (libfslcodec-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info.
+# Since the EULA in the bin file differs from the one in the tar file,
+# extract the one from the bin file as well.
+define LIBFSLCODEC_EXTRACT_CMDS
+	awk 'BEGIN      { start=0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start=1; }'\
+	    $(DL_DIR)/$(LIBFSLCODEC_SOURCE) > $(@D)/EULA
+	cd $(BUILD_DIR); \
+	sh $(DL_DIR)/$(LIBFSLCODEC_SOURCE) --force --auto-accept
+endef
+
+# FIXME The Makefile installs both the arm9 and arm11 versions of the
+# libraries, but we only need one of them.
+
+$(eval $(autotools-package))
diff --git a/package/freescale-imx/libfslparser/Config.in b/package/freescale-imx/libfslparser/Config.in
new file mode 100644
index 0000000..e3ab980
--- /dev/null
+++ b/package/freescale-imx/libfslparser/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBFSLPARSER
+	bool "libfslparser"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  Binary parser libraries for the Freescale i.MX SoCs.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/freescale-imx/libfslparser/libfslparser.mk b/package/freescale-imx/libfslparser/libfslparser.mk
new file mode 100644
index 0000000..3e27a6a
--- /dev/null
+++ b/package/freescale-imx/libfslparser/libfslparser.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# libfslparser
+#
+################################################################################
+
+LIBFSLPARSER_VERSION = 3.0.1
+# No official download site from freescale, just this mirror
+LIBFSLPARSER_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
+LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
+LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
+# This is a legal minefield: the EULA in the bin file specifies that
+# the Board Support Package includes software and hardware (sic!)
+# for which a separate license is needed...
+LIBFSLPARSER_REDISTRIBUTE = NO
+
+LIBFSLPARSER_INSTALL_STAGING = YES
+
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (libfslparser-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info
+# Since the EULA in the bin file differs from the one in the tar file,
+# extract the one from the bin file as well.
+define LIBFSLPARSER_EXTRACT_CMDS
+	awk 'BEGIN      { start=0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start=1; }'\
+	    $(DL_DIR)/$(LIBFSLPARSER_SOURCE) > $(@D)/EULA
+	cd $(BUILD_DIR); \
+	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept
+endef
+
+# The Makefile installs several versions of the libraries, but we only
+# need one of them, depending on the platform.
+
+$(eval $(autotools-package))
diff --git a/package/freescale-imx/libfslvpuwrap/Config.in b/package/freescale-imx/libfslvpuwrap/Config.in
new file mode 100644
index 0000000..57b8a02
--- /dev/null
+++ b/package/freescale-imx/libfslvpuwrap/Config.in
@@ -0,0 +1,13 @@
+comment "libfslvpuwrap needs an imx-specific kernel to be built"
+	depends on BR2_arm && !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_LIBFSLVPUWRAP
+	bool "libfslvpuwrap"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm # Only relevant for i.MX
+	select BR2_PACKAGE_IMX_LIB
+	help
+	  Wrapper library for the vpu library, giving it a different API.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/freescale-imx/libfslvpuwrap/libfslvpuwrap.mk b/package/freescale-imx/libfslvpuwrap/libfslvpuwrap.mk
new file mode 100644
index 0000000..1bc7129
--- /dev/null
+++ b/package/freescale-imx/libfslvpuwrap/libfslvpuwrap.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libfslvpuwrap
+#
+################################################################################
+
+LIBFSLVPUWRAP_VERSION = 1.0.17
+# No official download site from freescale, just this mirror
+LIBFSLVPUWRAP_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
+LIBFSLVPUWRAP_LICENSE_FILES = EULA.txt
+LIBFSLVPUWRAP_REDISTRIBUTE = NO
+
+LIBFSLVPUWRAP_INSTALL_STAGING = YES
+
+LIBFSLVPUWRAP_DEPENDENCIES += imx-lib
+
+$(eval $(autotools-package))
diff --git a/package/libfslcodec/Config.in b/package/libfslcodec/Config.in
deleted file mode 100644
index 7b31b7a..0000000
--- a/package/libfslcodec/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_LIBFSLCODEC
-	bool "libfslcodec"
-	depends on BR2_arm # Only relevant for i.MX
-	help
-	  Binary codec libraries for the Freescale i.MX SoCs.
-
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream.
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
deleted file mode 100644
index c18332a..0000000
--- a/package/libfslcodec/libfslcodec.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-################################################################################
-#
-# libfslcodec
-#
-################################################################################
-
-LIBFSLCODEC_VERSION = 3.0.1
-# No official download site from freescale, just this mirror
-LIBFSLCODEC_SITE = http://download.ossystems.com.br/bsp/freescale/source
-LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
-LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
-LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
-# This is a legal minefield: the EULA in the bin file specifies that
-# the Board Support Package includes software and hardware (sic!)
-# for which a separate license is needed...
-LIBFSLCODEC_REDISTRIBUTE = NO
-
-LIBFSLCODEC_INSTALL_STAGING = YES
-
-# The archive is a shell-self-extractor of a bzipped tar. It happens
-# to extract in the correct directory (libfslcodec-x.y.z)
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info.
-# Since the EULA in the bin file differs from the one in the tar file,
-# extract the one from the bin file as well.
-define LIBFSLCODEC_EXTRACT_CMDS
-	awk 'BEGIN      { start=0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start=1; }'\
-	    $(DL_DIR)/$(LIBFSLCODEC_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(LIBFSLCODEC_SOURCE) --force --auto-accept
-endef
-
-# FIXME The Makefile installs both the arm9 and arm11 versions of the
-# libraries, but we only need one of them.
-
-$(eval $(autotools-package))
diff --git a/package/libfslparser/Config.in b/package/libfslparser/Config.in
deleted file mode 100644
index e3ab980..0000000
--- a/package/libfslparser/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_LIBFSLPARSER
-	bool "libfslparser"
-	depends on BR2_arm # Only relevant for i.MX
-	help
-	  Binary parser libraries for the Freescale i.MX SoCs.
-
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream.
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
deleted file mode 100644
index 3e27a6a..0000000
--- a/package/libfslparser/libfslparser.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-################################################################################
-#
-# libfslparser
-#
-################################################################################
-
-LIBFSLPARSER_VERSION = 3.0.1
-# No official download site from freescale, just this mirror
-LIBFSLPARSER_SITE = http://download.ossystems.com.br/bsp/freescale/source
-LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
-LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
-LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
-# This is a legal minefield: the EULA in the bin file specifies that
-# the Board Support Package includes software and hardware (sic!)
-# for which a separate license is needed...
-LIBFSLPARSER_REDISTRIBUTE = NO
-
-LIBFSLPARSER_INSTALL_STAGING = YES
-
-# The archive is a shell-self-extractor of a bzipped tar. It happens
-# to extract in the correct directory (libfslparser-x.y.z)
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info
-# Since the EULA in the bin file differs from the one in the tar file,
-# extract the one from the bin file as well.
-define LIBFSLPARSER_EXTRACT_CMDS
-	awk 'BEGIN      { start=0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start=1; }'\
-	    $(DL_DIR)/$(LIBFSLPARSER_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept
-endef
-
-# The Makefile installs several versions of the libraries, but we only
-# need one of them, depending on the platform.
-
-$(eval $(autotools-package))
diff --git a/package/libfslvpuwrap/Config.in b/package/libfslvpuwrap/Config.in
deleted file mode 100644
index 57b8a02..0000000
--- a/package/libfslvpuwrap/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-comment "libfslvpuwrap needs an imx-specific kernel to be built"
-	depends on BR2_arm && !BR2_LINUX_KERNEL
-
-config BR2_PACKAGE_LIBFSLVPUWRAP
-	bool "libfslvpuwrap"
-	depends on BR2_LINUX_KERNEL
-	depends on BR2_arm # Only relevant for i.MX
-	select BR2_PACKAGE_IMX_LIB
-	help
-	  Wrapper library for the vpu library, giving it a different API.
-
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream.
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
deleted file mode 100644
index 1bc7129..0000000
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# libfslvpuwrap
-#
-################################################################################
-
-LIBFSLVPUWRAP_VERSION = 1.0.17
-# No official download site from freescale, just this mirror
-LIBFSLVPUWRAP_SITE = http://download.ossystems.com.br/bsp/freescale/source
-LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
-LIBFSLVPUWRAP_LICENSE_FILES = EULA.txt
-LIBFSLVPUWRAP_REDISTRIBUTE = NO
-
-LIBFSLVPUWRAP_INSTALL_STAGING = YES
-
-LIBFSLVPUWRAP_DEPENDENCIES += imx-lib
-
-$(eval $(autotools-package))
-- 
1.8.1.2
