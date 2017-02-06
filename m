From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 16:07:33 +0100
Subject: [Buildroot] [git commit] opkg-utils: new package
Message-ID: <20170206151955.735FC820EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dfed722187ac0503560765b5a6fbce60fd14758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Originally, the opkg sources also contained the tools needed to _create_ an
opkg package. In later releases, this code has been split to a separate
package opkg-utils.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host             |  1 +
 package/opkg-utils/Config.in.host  |  6 ++++++
 package/opkg-utils/opkg-utils.hash |  2 ++
 package/opkg-utils/opkg-utils.mk   | 21 +++++++++++++++++++++
 4 files changed, 30 insertions(+)

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
diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
new file mode 100644
index 0000000..332823f
--- /dev/null
+++ b/package/opkg-utils/opkg-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c14284d999cdd18fee4c6b22720f38beee962b2c8e099166d8d55d76a2111beb  opkg-utils-0.3.4.tar.gz
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
