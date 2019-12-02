From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:51 -0000
Subject: [Buildroot] [git commit] package/sdbusplus: new package
Message-ID: <20191202083932.9A9DF7FF06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60590c3d573250585102a0a143d4c437309566c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A C++ library for interacting with sd-bus and a C++ bindings generator.

The host build produces a code generation tool, sdbus++ while the
target build gives libsdbusplus.

The code generator requires host-python-pyyaml, host-python-inflection,
and host-python-mako. Since it isn't built for the target, the target
build does not require them.

The host package includes a code and documentation generation program,
which is useful for including in a buildroot SDK, even if no target
package needs it, so make it a user-selectable host package.

host-autoconf-archive is added as a dependency since configure.ac
uses the AX_PKG_CHECK_MODULES macro.

Signed-off-by: John Faith <jfaith@impinj.com>
Signed-off-by: Trent Piepho <tpiepho@impinj.com>
[Thomas: use host-python3 when BR2_PACKAGE_PYTHON3=y]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/Config.in.host           |  1 +
 package/sdbusplus/Config.in      | 14 ++++++++++++++
 package/sdbusplus/Config.in.host | 10 ++++++++++
 package/sdbusplus/sdbusplus.hash |  5 +++++
 package/sdbusplus/sdbusplus.mk   | 32 ++++++++++++++++++++++++++++++++
 7 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a196b0943..2cb272d2d6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1237,6 +1237,7 @@ F:	package/dhcpcd/
 
 N:	John Faith <jfaith@impinj.com>
 F:	package/python-inflection/
+F:	package/sdbusplus/
 
 N:	Jonathan Ben Avraham <yba@tkos.co.il>
 F:	arch/Config.in.xtensa
diff --git a/package/Config.in b/package/Config.in
index ec68f893aa..20c3eeb9c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2287,6 +2287,7 @@ menu "System tools"
 	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
+	source "package/sdbusplus/Config.in"
 	source "package/smack/Config.in"
 	source "package/start-stop-daemon/Config.in"
 	source "package/supervisor/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index c0ac4fbbcc..758c268e00 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -66,6 +66,7 @@ menu "Host utilities"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
+	source "package/sdbusplus/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
diff --git a/package/sdbusplus/Config.in b/package/sdbusplus/Config.in
new file mode 100644
index 0000000000..e278d17156
--- /dev/null
+++ b/package/sdbusplus/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SDBUSPLUS
+	bool "sdbusplus"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_SYSTEMD
+	help
+	  A C++ library for sd-bus with a bindings and doc generator.
+
+	  This will build the target library.  See the host package for
+	  the bindings and documentation generation program.
+
+	  https://github.com/openbmc/sdbusplus
+
+comment "sdbusplus needs systemd and a toolchain w/ C++"
+	depends on !BR2_PACKAGE_SYSTEMD || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/sdbusplus/Config.in.host b/package/sdbusplus/Config.in.host
new file mode 100644
index 0000000000..cff9f20384
--- /dev/null
+++ b/package/sdbusplus/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_SDBUSPLUS
+	bool "host-sdbusplus"
+	select BR2_PACKAGE_HOST_PKGCONF
+	help
+	  A C++ library for sd-bus with a bindings and doc generator.
+
+	  This will build the Python host side generation tool for bindings
+	  and documentation.
+
+	  https://github.com/openbmc/sdbusplus
diff --git a/package/sdbusplus/sdbusplus.hash b/package/sdbusplus/sdbusplus.hash
new file mode 100644
index 0000000000..b21d2ddd23
--- /dev/null
+++ b/package/sdbusplus/sdbusplus.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  c67b8f3d9b74fd0d70eb6eec3b2ec2d496d0f169deedf6fc07dbff2c2f275d2b  sdbusplus-4212292bcf136d04b38ba5116aa568b0fa312798.tar.gz
+
+# License file, locally calculated
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
new file mode 100644
index 0000000000..976f987fad
--- /dev/null
+++ b/package/sdbusplus/sdbusplus.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# sdbusplus
+#
+################################################################################
+
+SDBUSPLUS_VERSION = 4212292bcf136d04b38ba5116aa568b0fa312798
+SDBUSPLUS_SITE = $(call github,openbmc,sdbusplus,$(SDBUSPLUS_VERSION))
+SDBUSPLUS_DEPENDENCIES = host-autoconf-archive host-pkgconf systemd
+HOST_SDBUSPLUS_DEPENDENCIES = \
+	host-autoconf-archive \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
+	host-python-inflection \
+	host-python-mako \
+	host-python-pyyaml
+SDBUSPLUS_CONF_OPTS = --disable-sdbuspp
+HOST_SDBUSPLUS_CONF_OPTS = --disable-libsdbusplus
+SDBUSPLUS_AUTORECONF = YES
+SDBUSPLUS_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+SDBUSPLUS_INSTALL_STAGING = YES
+SDBUSPLUS_LICENSE = Apache-2.0
+SDBUSPLUS_LICENSE_FILES = LICENSE
+
+define SDBUSPLUS_CREATE_M4
+    mkdir -p $(@D)/m4
+endef
+SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
+HOST_SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
