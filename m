From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Aug 2020 00:10:38 +0200
Subject: [Buildroot] [git commit] package/meson-tools: new package
Message-ID: <20200902161639.B832B85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3370a48d517ba53be6e58e7f1a5b45257782b09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add meson-tools for handling of amlogic boards boot firmware
signature.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in.host               |  1 +
 package/meson-tools/Config.in.host   |  9 +++++++++
 package/meson-tools/meson-tools.hash |  3 +++
 package/meson-tools/meson-tools.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e717ccc937..b86e5f8169 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -634,6 +634,9 @@ N:	Cyril Bur <cyrilbur@gmail.com>
 F:	arch/Config.in.powerpc
 F:	package/kvm-unit-tests
 
+N:	Dagg Stompler <daggs@gmx.com>
+F:	package/meson-tools/
+
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index fb29622ccb..ec64d2feb3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -42,6 +42,7 @@ menu "Host utilities"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mender-artifact/Config.in.host"
+	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
diff --git a/package/meson-tools/Config.in.host b/package/meson-tools/Config.in.host
new file mode 100644
index 0000000000..677b206b66
--- /dev/null
+++ b/package/meson-tools/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_MESON_TOOLS
+	bool "host meson-tools"
+	help
+	  meson-tools is a collection of tools for use with the
+	  Amlogic Meson family of ARM based SoCs. It allows management
+	  of signatures which are required for booting amlogic based
+	  boards with u-boot.
+
+	  https://github.com/afaerber/meson-tools
diff --git a/package/meson-tools/meson-tools.hash b/package/meson-tools/meson-tools.hash
new file mode 100644
index 0000000000..7b2c0d2f7e
--- /dev/null
+++ b/package/meson-tools/meson-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  10d707b2f741df03ff5000f2a82c6f577036ce1cd34d9278b22b92cb616b6fce  meson-tools-0a02e2d34413f4bf9b15946352bc8c8ee13a5843.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/meson-tools/meson-tools.mk b/package/meson-tools/meson-tools.mk
new file mode 100644
index 0000000000..037faf3e6b
--- /dev/null
+++ b/package/meson-tools/meson-tools.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# meson-tools
+#
+################################################################################
+
+HOST_MESON_TOOLS_VERSION = 0a02e2d34413f4bf9b15946352bc8c8ee13a5843
+HOST_MESON_TOOLS_SITE = $(call github,afaerber,meson-tools,$(HOST_MESON_TOOLS_VERSION))
+HOST_MESON_TOOLS_LICENSE = GPL-2.0+
+HOST_MESON_TOOLS_LICENSE_FILES = COPYING
+HOST_MESON_TOOLS_DEPENDENCIES = host-openssl
+
+HOST_MESON_TOOLS_PROGS = amlbootsig unamlbootsig amlinfo
+
+define HOST_MESON_TOOLS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) \
+		LDFLAGS="$(HOST_LDFLAGS) -lssl -lcrypto"
+endef
+
+define HOST_MESON_TOOLS_INSTALL_CMDS
+	$(foreach f,$(HOST_MESON_TOOLS_PROGS), \
+		$(INSTALL) -D -m 0755 $(@D)/$(f) $(HOST_DIR)/bin/$(f)
+	)
+endef
+
+$(eval $(host-generic-package))
