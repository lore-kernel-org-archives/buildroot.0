From: Erik Stromdahl <erik.stromdahl@gmail.com>
Date: Thu,  7 Jul 2016 19:49:23 +0200
Subject: [Buildroot] [PATCH 1/1] mxsldr: new package
Message-ID: <1467913764-10467-1-git-send-email-erik.stromdahl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 package/Config.in.host        |    1 +
 package/mxsldr/Config.in.host |    9 +++++++++
 package/mxsldr/mxsldr.hash    |    2 ++
 package/mxsldr/mxsldr.mk      |   21 +++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/mxsldr/Config.in.host
 create mode 100644 package/mxsldr/mxsldr.hash
 create mode 100644 package/mxsldr/mxsldr.mk

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
index 0000000..df28da0
--- /dev/null
+++ b/package/mxsldr/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_MXSLDR
+	bool "host-mxsldr"
+	depends on BR2_arm
+	help
+	  This package contains tools to download and execute code
+	  on Freescale i.MX23 and i.MX28 SoC's through the
+	  Serial Download Protocol.
+
+	  git://git.denx.de/mxsldr.git
diff --git a/package/mxsldr/mxsldr.hash b/package/mxsldr/mxsldr.hash
new file mode 100644
index 0000000..007afb9
--- /dev/null
+++ b/package/mxsldr/mxsldr.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256  caef93db6e5fe3850450e3168031ff552a917d15aa39f8d6afde574a0999a268  mxsldr-2793a657ab7a22487d21c1b020957806f8ae8383.tar.gz
diff --git a/package/mxsldr/mxsldr.mk b/package/mxsldr/mxsldr.mk
new file mode 100644
index 0000000..89b74b8
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
+MXSLDR_SITE = "git://git.denx.de/mxsldr.git"
+MXSLDR_LICENSE = GPLv2
+MXSLDR_DEPENDENCIES = host-libusb host-pkgconf
+MXSLDR_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config"
+
+define HOST_MXSLDR_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MXSLDR_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_MXSLDR_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/mxsldr $(HOST_DIR)/usr/bin/mxsldr
+endef
+
+$(eval $(host-generic-package))
-- 
1.7.9.5
