From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 10 Apr 2021 09:23:56 -0300
Subject: [Buildroot] [PATCH v2 1/2] package/sloci-image: new host package
In-Reply-To: <20210410122357.12641-1-sergio.prado@e-labworks.com>
References: <20210410122357.12641-1-sergio.prado@e-labworks.com>
Message-ID: <20210410122357.12641-2-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sloci-image is a simple CLI tool for packing rootfs into a single-layer
OCI image.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in.host               |  1 +
 package/sloci-image/Config.in.host   |  7 +++++++
 package/sloci-image/sloci-image.hash |  5 +++++
 package/sloci-image/sloci-image.mk   | 19 +++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/sloci-image/Config.in.host
 create mode 100644 package/sloci-image/sloci-image.hash
 create mode 100644 package/sloci-image/sloci-image.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7699c471d3f4..956636aff93c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2406,6 +2406,7 @@ F:	package/curlpp/
 F:	package/daq/
 F:	package/libgdiplus/
 F:	package/pimd/
+F:	package/sloci-image/
 F:	package/snort/
 F:	package/stella/
 F:	package/tio/
diff --git a/package/Config.in.host b/package/Config.in.host
index ba6a68c728c2..1a2c082b9d37 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -78,6 +78,7 @@ menu "Host utilities"
 	source "package/sam-ba/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
 	source "package/sentry-cli/Config.in.host"
+	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
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
index 000000000000..117f0ba6e01f
--- /dev/null
+++ b/package/sloci-image/sloci-image.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  56fbc335c193eccc3992f0a723c6dabe762f6d4854fc52059be074bdf5060d9e  sloci-image-0.1.1.tar.gz
+
+# Hash for license files:
+sha256  8ea53673b084576813fc40cd63817c5a1619438942b5e6c30dac1d10707c27e4  LICENSE
diff --git a/package/sloci-image/sloci-image.mk b/package/sloci-image/sloci-image.mk
new file mode 100644
index 000000000000..f6db7e206088
--- /dev/null
+++ b/package/sloci-image/sloci-image.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# sloci-image
+#
+################################################################################
+
+SLOCI_IMAGE_VERSION = 0.1.1
+SLOCI_IMAGE_SITE = $(call github,jirutka,sloci-image,v$(SLOCI_IMAGE_VERSION))
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
