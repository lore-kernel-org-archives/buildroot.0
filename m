From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Sun, 18 Feb 2018 14:28:29 +0100
Subject: [Buildroot] [PATCH 1/3] imx-mkimage: new package
In-Reply-To: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <1518960511-4823-2-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
---
 package/Config.in.host                             |  1 +
 .../0001-make-bl33-read-env-variables.patch        | 37 ++++++++++++++++++++++
 package/freescale-imx/imx-mkimage/Config.in.host   |  5 +++
 package/freescale-imx/imx-mkimage/imx-mkimage.hash |  3 ++
 package/freescale-imx/imx-mkimage/imx-mkimage.mk   | 23 ++++++++++++++
 5 files changed, 69 insertions(+)
 create mode 100644 package/freescale-imx/imx-mkimage/0001-make-bl33-read-env-variables.patch
 create mode 100644 package/freescale-imx/imx-mkimage/Config.in.host
 create mode 100644 package/freescale-imx/imx-mkimage/imx-mkimage.hash
 create mode 100644 package/freescale-imx/imx-mkimage/imx-mkimage.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 199a8e9..b1cfa75 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -15,6 +15,7 @@ menu "Host utilities"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
 	source "package/faketime/Config.in.host"
+	source "package/freescale-imx/imx-mkimage/Config.in.host"
 	source "package/fwup/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
diff --git a/package/freescale-imx/imx-mkimage/0001-make-bl33-read-env-variables.patch b/package/freescale-imx/imx-mkimage/0001-make-bl33-read-env-variables.patch
new file mode 100644
index 0000000..490eb05
--- /dev/null
+++ b/package/freescale-imx/imx-mkimage/0001-make-bl33-read-env-variables.patch
@@ -0,0 +1,37 @@
+From 5ca549356ef889286c12b4d736d9026efafb8fff Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik.larsson@combitech.se>
+Date: Mon, 29 Jan 2018 08:00:57 +0100
+Subject: [PATCH] Add support for overriding BL32 and BL33 not only BL31
+
+Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
+Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+---
+ iMX8M/mkimage_fit_atf.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/iMX8M/mkimage_fit_atf.sh b/iMX8M/mkimage_fit_atf.sh
+index 3a3bd10..95a11eb 100755
+--- a/iMX8M/mkimage_fit_atf.sh
++++ b/iMX8M/mkimage_fit_atf.sh
+@@ -15,7 +15,7 @@ else
+	ls -lct bl31.bin | awk '{print $5}' >&2
+ fi
+
+-BL32="tee.bin"
++[ -z "$BL32" ] && BL32="tee.bin"
+
+ if [ ! -f $BL32 ]; then
+	BL32=/dev/null
+@@ -25,7 +25,7 @@ else
+	ls -lct tee.bin | awk '{print $5}' >&2
+ fi
+
+-BL33="u-boot-nodtb.bin"
++[ -z "$BL33" ] && BL33="u-boot-nodtb.bin"
+
+ if [ ! -f $BL33 ]; then
+	echo "ERROR: $BL33 file NOT found" >&2
+--
+2.7.4
+
diff --git a/package/freescale-imx/imx-mkimage/Config.in.host b/package/freescale-imx/imx-mkimage/Config.in.host
new file mode 100644
index 0000000..3cf0966
--- /dev/null
+++ b/package/freescale-imx/imx-mkimage/Config.in.host
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_HOST_IMX_MKIMAGE
+	bool "host imx-mkimage"
+	help
+	  imx-mkimage is used to combine input images and generate
+	  final boot image with appropriate IVT set.
diff --git a/package/freescale-imx/imx-mkimage/imx-mkimage.hash b/package/freescale-imx/imx-mkimage/imx-mkimage.hash
new file mode 100644
index 0000000..08d31ce
--- /dev/null
+++ b/package/freescale-imx/imx-mkimage/imx-mkimage.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 4ddb144520001c33baa24493f68ef2ea9434ac36bf3ae223f78d7ec581aa484c  imx-mkimage-imx_4.9.51_imx8m_beta.tar.gz
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  iMX8dv/COPYING
diff --git a/package/freescale-imx/imx-mkimage/imx-mkimage.mk b/package/freescale-imx/imx-mkimage/imx-mkimage.mk
new file mode 100644
index 0000000..a5b1f93
--- /dev/null
+++ b/package/freescale-imx/imx-mkimage/imx-mkimage.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# imx-mkimage
+#
+################################################################################
+
+IMX_MKIMAGE_VERSION = imx_4.9.51_imx8m_beta
+IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
+IMX_MKIMAGE_SITE_METHOD = git
+IMX_MKIMAGE_LICENSE = GPL-2.0
+IMX_MKIMAGE_LICENSE_FILES = iMX8dv/COPYING
+
+define HOST_IMX_MKIMAGE_BUILD_CMDS
+	$(MAKE) -C $(@D)/iMX8M -f soc.mak mkimage_imx8
+endef
+
+define HOST_IMX_MKIMAGE_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/bin
+	$(INSTALL) -m 755 $(@D)/iMX8M/mkimage_imx8 $(HOST_DIR)/bin
+	$(INSTALL) -m 755 $(@D)/iMX8M/mkimage_fit_atf.sh $(HOST_DIR)/bin
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.4
