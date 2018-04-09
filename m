From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 22:05:31 +0200
Subject: [Buildroot] [git commit] imx-mkimage: new package
Message-ID: <20180409200546.473528827F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2436a24f8ee1a87ed1967dcf2c41b323a6e9502
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package add support for imx-mkimage for iMX8M.
Currently the only hardware it's tested for.

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in.host                             |  1 +
 ...-for-overriding-bl32-and-bl33-not-only-bl.patch | 58 ++++++++++++++++++++++
 .../0002-add-ldflags-to-link-step.patch            | 26 ++++++++++
 package/imx-mkimage/Config.in.host                 |  7 +++
 package/imx-mkimage/imx-mkimage.hash               |  3 ++
 package/imx-mkimage/imx-mkimage.mk                 | 24 +++++++++
 7 files changed, 122 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 14d872996b..a942b77939 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -601,6 +601,9 @@ F:	package/spi-tools/
 F:	package/xdotool/
 F:	configs/pc_x86_64_*
 
+N:	Erik Larsson <karl.erik.larsson@gmail.com>
+F:	package/imx-mkimage/
+
 N:	Erik Stromdahl <erik.stromdahl@gmail.com>
 F:	package/mxsldr/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 563a277795..a8a4c1f802 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -24,6 +24,7 @@ menu "Host utilities"
 	source "package/go-bootstrap/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
+	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
diff --git a/package/imx-mkimage/0001-add-support-for-overriding-bl32-and-bl33-not-only-bl.patch b/package/imx-mkimage/0001-add-support-for-overriding-bl32-and-bl33-not-only-bl.patch
new file mode 100644
index 0000000000..430122f7ed
--- /dev/null
+++ b/package/imx-mkimage/0001-add-support-for-overriding-bl32-and-bl33-not-only-bl.patch
@@ -0,0 +1,58 @@
+From 0677e6cff00506de56d11bfa230b6c366e74f6ed Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik.larsson@combitech.se>
+Date: Thu, 8 Mar 2018 19:04:37 +0100
+Subject: [PATCH] Add support for overriding BL32 and BL33 not only BL31
+
+Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
+Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+---
+ iMX8M/mkimage_fit_atf.sh | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/iMX8M/mkimage_fit_atf.sh b/iMX8M/mkimage_fit_atf.sh
+index 3a3bd10..727f746 100755
+--- a/iMX8M/mkimage_fit_atf.sh
++++ b/iMX8M/mkimage_fit_atf.sh
+@@ -11,29 +11,29 @@ if [ ! -f $BL31 ]; then
+ 	echo "ERROR: BL31 file $BL31 NOT found" >&2
+ 	exit 0
+ else
+-	echo "bl31.bin size: " >&2
+-	ls -lct bl31.bin | awk '{print $5}' >&2
++	echo "$BL31 size: " >&2
++	ls -lct $BL31 | awk '{print $5}' >&2
+ fi
+ 
+-BL32="tee.bin"
++[ -z "$BL32" ] && BL32="tee.bin"
+ 
+ if [ ! -f $BL32 ]; then
+ 	BL32=/dev/null
+ else
+-	echo "Building with TEE support, make sure your bl31 is compiled with spd. If you do not want tee, please delete tee.bin" >&2
+-	echo "tee.bin size: " >&2
+-	ls -lct tee.bin | awk '{print $5}' >&2
++	echo "Building with TEE support, make sure your bl31 is compiled with spd. If you do not want tee, please delete $BL32" >&2
++	echo "$BL32 size: " >&2
++	ls -lct $BL32 | awk '{print $5}' >&2
+ fi
+ 
+-BL33="u-boot-nodtb.bin"
++[ -z "$BL33" ] && BL33="u-boot-nodtb.bin"
+ 
+ if [ ! -f $BL33 ]; then
+ 	echo "ERROR: $BL33 file NOT found" >&2
+ 	exit 0
+ else
+ 	
+-	echo "u-boot-nodtb.bin size: " >&2
+-	ls -lct u-boot-nodtb.bin | awk '{print $5}' >&2
++	echo "$BL33: " >&2
++	ls -lct $BL33 | awk '{print $5}' >&2
+ fi
+ 
+ for dtname in $*
+-- 
+2.7.4
+
diff --git a/package/imx-mkimage/0002-add-ldflags-to-link-step.patch b/package/imx-mkimage/0002-add-ldflags-to-link-step.patch
new file mode 100644
index 0000000000..1d5fe77596
--- /dev/null
+++ b/package/imx-mkimage/0002-add-ldflags-to-link-step.patch
@@ -0,0 +1,26 @@
+From a73f20fbe921c7ecff3efda23bc506fdd935ee4d Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik.larsson@combitech.se>
+Date: Tue, 6 Mar 2018 12:28:39 +0100
+Subject: [PATCH] Add LDFLAGS to link step
+
+Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
+---
+ iMX8M/soc.mak | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iMX8M/soc.mak b/iMX8M/soc.mak
+index 8346769..38a14bb 100644
+--- a/iMX8M/soc.mak
++++ b/iMX8M/soc.mak
+@@ -15,7 +15,7 @@ FW_DIR = imx-boot/imx-boot-tools/imx8mq
+ 
+ $(MKIMG): mkimage_imx8.c
+ 	@echo "Compiling mkimage_imx8"
+-	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) -lz
++	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) $(LDFLAGS) -lz
+ 
+ $(DCD_CFG): $(DCD_CFG_SRC)
+ 	@echo "Converting iMX8M DCD file" 
+-- 
+2.7.4
+
diff --git a/package/imx-mkimage/Config.in.host b/package/imx-mkimage/Config.in.host
new file mode 100644
index 0000000000..8d273557a1
--- /dev/null
+++ b/package/imx-mkimage/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_IMX_MKIMAGE
+	bool "host imx-mkimage"
+	help
+	  imx-mkimage is used to combine input images and generate
+	  final boot image with appropriate IVT set.
+
+	  https://source.codeaurora.org/external/imx/imx-mkimage
diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
new file mode 100644
index 0000000000..08d31ce461
--- /dev/null
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 4ddb144520001c33baa24493f68ef2ea9434ac36bf3ae223f78d7ec581aa484c  imx-mkimage-imx_4.9.51_imx8m_beta.tar.gz
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  iMX8dv/COPYING
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
new file mode 100644
index 0000000000..fd1d90b597
--- /dev/null
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# imx-mkimage
+#
+################################################################################
+
+IMX_MKIMAGE_VERSION = imx_4.9.51_imx8m_beta
+IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
+IMX_MKIMAGE_SITE_METHOD = git
+IMX_MKIMAGE_LICENSE = GPL-2.0+
+IMX_MKIMAGE_LICENSE_FILES = iMX8dv/COPYING
+
+define HOST_IMX_MKIMAGE_BUILD_CMDS
+	# Currently this only supports iMX8M. When more hardware is available
+	# this needs to be selectable based on iMX8-version (iMX8M,iMXQ etc).
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/iMX8M -f soc.mak mkimage_imx8
+endef
+
+define HOST_IMX_MKIMAGE_INSTALL_CMDS
+	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_imx8 $(HOST_DIR)/bin/mkimage_imx8
+	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_fit_atf.sh $(HOST_DIR)/bin/mkimage_fit_atf.sh
+endef
+
+$(eval $(host-generic-package))
