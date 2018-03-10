From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 10 Mar 2018 16:58:54 +0200
Subject: [Buildroot] [PATCH 1/4] meson-tools: new Package
Message-ID: <20180310145857.22026-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

all amlogic's meson based soc require a signed firmware to boot, this
package provides a binary to do so.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in.host               |  1 +
 package/meson-tools/Config.in.host   |  9 +++++++++
 package/meson-tools/meson-tools.hash |  2 ++
 package/meson-tools/meson-tools.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/meson-tools/Config.in.host
 create mode 100644 package/meson-tools/meson-tools.hash
 create mode 100644 package/meson-tools/meson-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a2bfdabb88..a622e7cc08 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -467,6 +467,7 @@ N:	Dagg Stompler <daggs@gmx.com>
 F:	board/hardkernel/odroidc2
 F:	configs/odroidc2_defconfig
 F:	package/libamcodec/
+F:	package/meson-tools/
 F:	package/odroid-mali/
 F:	package/odroid-scripts/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 199a8e9856..5f17640eb1 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -29,6 +29,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
+	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
diff --git a/package/meson-tools/Config.in.host b/package/meson-tools/Config.in.host
new file mode 100644
index 0000000000..d90be61aeb
--- /dev/null
+++ b/package/meson-tools/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_MESON_TOOLS
+	bool "host meson-tools"
+	help
+	  meson-tools is a collection of tools for use with
+	  the Amlogic Meson family of ARM based SoCs.
+	  it allows management of signatures which are required
+	  for booting amlogic based boards with u-boot.
+
+	  https://github.com/afaerber/meson-tools
diff --git a/package/meson-tools/meson-tools.hash b/package/meson-tools/meson-tools.hash
new file mode 100644
index 0000000000..b5f844ab58
--- /dev/null
+++ b/package/meson-tools/meson-tools.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5a956f5a6ff8c45fc79d649982287c4548a1df4f0ef9e5aa6584493d552a54a3	meson-tools-5e01cbadc6f6f21ad88a63492a83182fc4b19d37.tar.gz
diff --git a/package/meson-tools/meson-tools.mk b/package/meson-tools/meson-tools.mk
new file mode 100644
index 0000000000..6b8cc06582
--- /dev/null
+++ b/package/meson-tools/meson-tools.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# meson-tools
+#
+################################################################################
+
+HOST_MESON_TOOLS_VERSION = 5e01cbadc6f6f21ad88a63492a83182fc4b19d37
+HOST_MESON_TOOLS_SITE = $(call github,afaerber,meson-tools,$(HOST_MESON_TOOLS_VERSION))
+HOST_MESON_TOOLS_LICENSE = GPL-2.0+
+HOST_MESON_TOOLS_LICENSE_FILES = COPYING README.md
+HOST_MESON_TOOLS_DEPENDENCIES = host-openssl
+
+HOST_MESON_TOOLS_PROGS = amlbootsig unamlbootsig amlinfo
+
+define HOST_MESON_TOOLS_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS) -lssl -lcrypto"
+endef
+
+define HOST_MESON_TOOLS_INSTALL_CMDS
+	$(foreach f,$(HOST_MESON_TOOLS_PROGS),
+		$(INSTALL) -D -m 0755 $(@D)/$(f) $(HOST_DIR)/bin/$(f))
+endef
+
+$(eval $(host-generic-package))
-- 
2.16.2
