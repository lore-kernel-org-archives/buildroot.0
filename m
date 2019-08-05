From: John Faith <jfaith@impinj.com>
Date: Mon, 5 Aug 2019 22:52:42 +0000
Subject: [Buildroot] [PATCH v3] package/sdbusplus: new package
In-Reply-To: <710b4b46-81d6-e5e6-4820-f8e1fb435750@mind.be>
References: <710b4b46-81d6-e5e6-4820-f8e1fb435750@mind.be>
Message-ID: <20190805225228.16904-1-jfaith@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v2 -> v3:
  - Bump version and drop patch that has been incorporated upstream.
  Suggested by Arnout Vandecappelle:
  - Reword commit message; remove bit about now-removed patch.
  - Depend on systemd.
  - Add config comment in case dependencies are not met.
  - Mention that the host tool is a Python tool.
  - One dependency per line.

Changes v1 -> v2:
  - Added "package/" to commit summary.
  Suggested by Arnout Vandecappelle:
  - Reworded commit message for content and grammar.
  - Moved Config.in to "System tools" section.
  - Minor description changes in example build patch.
  - Removed BR2_PACKAGE_SYSTEMD,BR2_PACKAGE_HOST_PKGCONF from Config.in.
  - Removed "usr" from path in AUTORECONF_OPTS.
  - Added license hash.
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/Config.in.host           |  1 +
 package/sdbusplus/Config.in      | 13 +++++++++++++
 package/sdbusplus/Config.in.host | 10 ++++++++++
 package/sdbusplus/sdbusplus.hash |  5 +++++
 package/sdbusplus/sdbusplus.mk   | 26 ++++++++++++++++++++++++++
 7 files changed, 57 insertions(+)
 create mode 100644 package/sdbusplus/Config.in
 create mode 100644 package/sdbusplus/Config.in.host
 create mode 100644 package/sdbusplus/sdbusplus.hash
 create mode 100644 package/sdbusplus/sdbusplus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4ab4e36593..582256d349 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1177,6 +1177,7 @@ F:	package/dhcpcd/
 
 N:	John Faith <jfaith@impinj.com>
 F:	package/python-inflection/
+F:	package/sdbusplus/
 
 N:	Jonathan Ben Avraham <yba@tkos.co.il>
 F:	arch/Config.in.xtensa
diff --git a/package/Config.in b/package/Config.in
index 90dddfd346..8f06af9538 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2232,6 +2232,7 @@ menu "System tools"
 	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
+	source "package/sdbusplus/Config.in"
 	source "package/smack/Config.in"
 	source "package/start-stop-daemon/Config.in"
 	source "package/supervisor/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 1501889b72..835dd04237 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -61,6 +61,7 @@ menu "Host utilities"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
+	source "package/sdbusplus/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
diff --git a/package/sdbusplus/Config.in b/package/sdbusplus/Config.in
new file mode 100644
index 0000000000..639e08ba69
--- /dev/null
+++ b/package/sdbusplus/Config.in
@@ -0,0 +1,13 @@
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
index 0000000000..e4f96b8bc6
--- /dev/null
+++ b/package/sdbusplus/sdbusplus.mk
@@ -0,0 +1,26 @@
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
+	$(PKG_PYTHON_HOST_PYTHON) \
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
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.19.1
