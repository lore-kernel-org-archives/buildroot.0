From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 22:00:36 +0200
Subject: [Buildroot] [git commit] mxsldr: new package
Message-ID: <20160708200102.9AF2A81972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a249206e103e95e2f8e75e3b89a6ea0a8d4118d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
[Thomas:
 - Rename prompt from "host-mxsldr" to "host mxsldr".
 - Add BR2_armeb in the list of architectures under which this package
   can be enabled.
 - Remove double quotes around the _SITE value.
 - The license is GPLv2+, not GPLv2.
 - Add a value for the _LICENSE_FILES variable
 - Rename MXSLDR_DEPENDENCIES to HOST_MXSLDR_DEPENDENCIES, since the
   dependencies of the host package are no longer derived from the
   dependencies of the target package.
 - Remove the MXSLDR_MAKE_OPTS variable that contained the PKG_CONFIG
   variable definition: it is already passed in HOST_CONFIGURE_OPTS.
 - Remove hash file, as it is not checked on Git packages for now.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host        |  1 +
 package/mxsldr/Config.in.host |  9 +++++++++
 package/mxsldr/mxsldr.mk      | 21 +++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 909fd96..6d61f19 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -25,6 +25,7 @@ menu "Host utilities"
 	source "package/mke2img/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
+	source "package/mxsldr/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/parted/Config.in.host"
diff --git a/package/mxsldr/Config.in.host b/package/mxsldr/Config.in.host
new file mode 100644
index 0000000..a427e71
--- /dev/null
+++ b/package/mxsldr/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_MXSLDR
+	bool "host mxsldr"
+	depends on BR2_arm || BR2_armeb
+	help
+	  This package contains tools to download and execute code on
+	  Freescale i.MX23 and i.MX28 SoC's through the Serial
+	  Download Protocol.
+
+	  git://git.denx.de/mxsldr.git
diff --git a/package/mxsldr/mxsldr.mk b/package/mxsldr/mxsldr.mk
new file mode 100644
index 0000000..fa7ca84
--- /dev/null
+++ b/package/mxsldr/mxsldr.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# mxsldr
+#
+################################################################################
+
+MXSLDR_VERSION = 2793a657ab7a22487d21c1b020957806f8ae8383
+MXSLDR_SITE = git://git.denx.de/mxsldr.git
+MXSLDR_LICENSE = GPLv2+
+MXSLDR_LICENSE_FILES = COPYING
+HOST_MXSLDR_DEPENDENCIES = host-libusb host-pkgconf
+
+define HOST_MXSLDR_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define HOST_MXSLDR_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/mxsldr $(HOST_DIR)/usr/bin/mxsldr
+endef
+
+$(eval $(host-generic-package))
