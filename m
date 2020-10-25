From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 25 Oct 2020 05:15:17 -0300
Subject: [Buildroot] [PATCH v1 1/2] package/sloci-image: new host package
In-Reply-To: <20201025081518.22309-1-sergio.prado@toradex.com>
References: <20201025081518.22309-1-sergio.prado@toradex.com>
Message-ID: <20201025081518.22309-2-sergio.prado@toradex.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sergio Prado <sergio.prado@e-labworks.com>

sloci-image is a simple CLI tool for packing rootfs into a single-layer
OCI image.

The patch fixes a escaping issue and a PR was sent upstream:

https://github.com/jirutka/sloci-image/pull/2

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in.host                        |  1 +
 ...ues-when-generating-the-OCI-image-co.patch | 55 +++++++++++++++++++
 package/sloci-image/Config.in.host            |  7 +++
 package/sloci-image/sloci-image.hash          |  5 ++
 package/sloci-image/sloci-image.mk            | 19 +++++++
 6 files changed, 88 insertions(+)
 create mode 100644 package/sloci-image/0001-Fix-escaping-issues-when-generating-the-OCI-image-co.patch
 create mode 100644 package/sloci-image/Config.in.host
 create mode 100644 package/sloci-image/sloci-image.hash
 create mode 100644 package/sloci-image/sloci-image.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b245c1cd7eee..a0bfde2391a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2383,6 +2383,7 @@ F:	package/curlpp/
 F:	package/daq/
 F:	package/libgdiplus/
 F:	package/pimd/
+F:	package/sloci-image/
 F:	package/snort/
 F:	package/stella/
 F:	package/tio/
diff --git a/package/Config.in.host b/package/Config.in.host
index 546f1c226dec..26ed8480cc21 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -76,6 +76,7 @@ menu "Host utilities"
 	source "package/sam-ba/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
 	source "package/sentry-cli/Config.in.host"
+	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
diff --git a/package/sloci-image/0001-Fix-escaping-issues-when-generating-the-OCI-image-co.patch b/package/sloci-image/0001-Fix-escaping-issues-when-generating-the-OCI-image-co.patch
new file mode 100644
index 000000000000..de95cda38717
--- /dev/null
+++ b/package/sloci-image/0001-Fix-escaping-issues-when-generating-the-OCI-image-co.patch
@@ -0,0 +1,55 @@
+From f2ebd0aaff7c519fd3d1c64bdfbedb49b6c60c11 Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Sat, 24 Oct 2020 12:43:46 -0300
+Subject: [PATCH] Fix escaping issues when generating the OCI image config
+ files
+
+Some parameters are not escaping correctly the double quotes
+when generating the OCI image config files.
+
+This is easily reproducible:
+
+$ mkdir rootfs
+$ ./sloci-image --arch arm --user 0 rootfs oci-image:latest
+$ grep -R "User" oci-image/
+oci-image/blobs/sha256/e574ac66b91453b00beb37717ed0e604249fa695ec772e17a56ff208357ec72a:    \"User\": "0",
+
+Fix that by escaping the double quotes with an echo command.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ sloci-image | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sloci-image b/sloci-image
+index be8e79a824e0..2c7ab5047271 100755
+--- a/sloci-image
++++ b/sloci-image
+@@ -269,13 +269,13 @@ oci_image_config() {
+ 	  "architecture": "$(oci_arch $CFG_ARCH)",
+ 	  "os": "$CFG_OS",
+ 	  "config": {
+-	    ${CFG_USER:+"\"User\": $(json_string "$CFG_USER"),"}
++	    ${CFG_USER:+"$(echo \"User\"): $(json_string "$CFG_USER"),"}
+ 	    "ExposedPorts": $(json_pseudoarray "$CFG_PORTS"),
+ 	    "Env": $(json_string_array "$CFG_ENV"),
+ 	    "Entrypoint": $(json_string_array "$CFG_ENTRYPOINT"),
+ 	    "Cmd": $(json_string_array "$CFG_CMD"),
+ 	    "Volumes": $(json_pseudoarray "$CFG_VOLUMES"),
+-	    ${CFG_WORKING_DIR:+"\"WorkingDir\": $(json_string "$CFG_WORKING_DIR"),"}
++	    ${CFG_WORKING_DIR:+"$(echo \"WorkingDir\"): $(json_string "$CFG_WORKING_DIR"),"}
+ 	    "Labels": $(json_string_map "$CFG_LABELS")
+ 	  },
+ 	  "rootfs": {
+@@ -309,7 +309,7 @@ oci_image_index() {
+ 	      "digest": "$manifest_digest",
+ 	      "platform": {
+ 	        "architecture": "$(oci_arch $CFG_ARCH)",
+-	        ${CFG_ARCH_VARIANT:+"\"variant\": $(json_string "$CFG_ARCH_VARIANT"),"}
++	        ${CFG_ARCH_VARIANT:+"$(echo \"variant\"): $(json_string "$CFG_ARCH_VARIANT"),"}
+ 	        "os": "$CFG_OS"
+ 	      },
+ 	      "annotations": {
+-- 
+2.17.1
+
diff --git a/package/sloci-image/Config.in.host b/package/sloci-image/Config.in.host
new file mode 100644
index 000000000000..d809f1f3c786
--- /dev/null
+++ b/package/sloci-image/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_SLOCI_IMAGE
+	bool "host sloci-image"
+	help
+	  A simple CLI tool for packing rootfs into a single-layer OCI
+	  image.
+
+	  https://github.com/jirutka/sloci-image
diff --git a/package/sloci-image/sloci-image.hash b/package/sloci-image/sloci-image.hash
new file mode 100644
index 000000000000..2476b2340823
--- /dev/null
+++ b/package/sloci-image/sloci-image.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  2c154e355aea65089921058c8ba96cc90e6c22753b4e7956221403b6183ac775  sloci-image-4015e49763e5a738026a5bbfcf32b38b5a4fa650.tar.gz
+
+# Hash for license files:
+sha256  8ea53673b084576813fc40cd63817c5a1619438942b5e6c30dac1d10707c27e4  LICENSE
diff --git a/package/sloci-image/sloci-image.mk b/package/sloci-image/sloci-image.mk
new file mode 100644
index 000000000000..ab716a074342
--- /dev/null
+++ b/package/sloci-image/sloci-image.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# sloci-image
+#
+################################################################################
+
+SLOCI_IMAGE_VERSION = 4015e49763e5a738026a5bbfcf32b38b5a4fa650
+SLOCI_IMAGE_SITE = $(call github,jirutka,sloci-image,$(SLOCI_IMAGE_VERSION))
+
+SLOCI_IMAGE_LICENSE = MIT
+SLOCI_IMAGE_LICENSE_FILES = LICENSE
+
+HOST_SLOCI_IMAGE_DEPENDENCIES = host-gawk
+
+define HOST_SLOCI_IMAGE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D) install
+endef
+
+$(eval $(host-generic-package))
-- 
2.17.1
