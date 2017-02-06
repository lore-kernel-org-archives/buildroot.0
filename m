From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  6 Feb 2017 15:57:43 +0100
Subject: [Buildroot] [PATCH 1/1] opkg-utils: new package
Message-ID: <20170206145743.12972-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Originally, the opkg sources also contained the tools needed to _create_ an
opkg package. In later releases, this code has been split to a separate
package opkg-utils.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/Config.in.host            |  1 +
 package/opkg-utils/Config.in.host |  6 ++++++
 package/opkg-utils/opkg-utils.mk  | 21 +++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/opkg-utils/Config.in.host
 create mode 100644 package/opkg-utils/opkg-utils.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 2482641..8da79c3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -31,6 +31,7 @@ menu "Host utilities"
 	source "package/mxsldr/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
+	source "package/opkg-utils/Config.in.host"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
diff --git a/package/opkg-utils/Config.in.host b/package/opkg-utils/Config.in.host
new file mode 100644
index 0000000..1c9c474
--- /dev/null
+++ b/package/opkg-utils/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_OPKG_UTILS
+	bool "host opkg-utils"
+	help
+	  Helper scripts for use with the opkg package manager.
+
+	  https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
new file mode 100644
index 0000000..aa3c44d
--- /dev/null
+++ b/package/opkg-utils/opkg-utils.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# opkg-utils
+#
+################################################################################
+
+OPKG_UTILS_VERSION = 0.3.4
+OPKG_UTILS_SITE = http://git.yoctoproject.org/git/opkg-utils
+OPKG_UTILS_SITE_METHOD = git
+OPKG_UTILS_LICENSE = GPLv2+
+OPKG_UTILS_LICENSE_FILES = COPYING
+
+define HOST_OPKG_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS)
+endef
+
+define HOST_OPKG_UTILS_INSTALL_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) PREFIX=/usr install
+endef
+
+$(eval $(host-generic-package))
-- 
2.10.2
