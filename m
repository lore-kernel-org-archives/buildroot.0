From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 11:51:03 +0200
Subject: [Buildroot] [PATCH] dpkg: new package and host package
Message-ID: <2e7a58f00720bcfba517.1374659463@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dpkg is the debian package manager. On target, it is useful to install
.deb files containing certain software. On host, it is useful to create
such .deb files. The creation of such .deb files could happen from a
post-build script, or from project-specific packages.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/Config.in           |   1 +
 package/Config.in.host      |   1 +
 package/dpkg/Config.in      |   7 +++++++
 package/dpkg/Config.in.host |   9 +++++++++
 package/dpkg/dpkg.mk        |  30 ++++++++++++++++++++++++++++++
 5 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -840,6 +840,7 @@ source "package/xl2tp/Config.in"
 endmenu
 
 menu "Package managers"
+source "package/dpkg/Config.in"
 source "package/ipkg/Config.in"
 source "package/opkg/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/Config.in.host b/package/Config.in.host
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 source "package/dfu-util/Config.in.host"
 source "package/dosfstools/Config.in.host"
+source "package/dpkg/Config.in.host"
 source "package/e2fsprogs/Config.in.host"
 source "package/genext2fs/Config.in.host"
 source "package/genimage/Config.in.host"
diff --git a/package/dpkg/Config.in b/package/dpkg/Config.in
new file mode 100644
--- /dev/null
+++ b/package/dpkg/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DPKG
+	bool "dpkg"
+	help
+	  This package provides the low-level infrastructure for handling
+	  the installation and removal of Debian software packages.
+
+	  http://wiki.debian.org/Teams/Dpkg
diff --git a/package/dpkg/Config.in.host b/package/dpkg/Config.in.host
new file mode 100644
--- /dev/null
+++ b/package/dpkg/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_DPKG
+	bool "host dpkg"
+	help
+	  This package provides the low-level infrastructure for handling
+	  the installation and removal of Debian software packages.
+	  You could use it from a post-build script, or from project-specific
+	  packages, to create .deb files for use on target.
+
+	  http://wiki.debian.org/Teams/Dpkg
diff --git a/package/dpkg/dpkg.mk b/package/dpkg/dpkg.mk
new file mode 100644
--- /dev/null
+++ b/package/dpkg/dpkg.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# dpkg
+#
+################################################################################
+
+DPKG_VERSION = 1.16.10
+DPKG_SOURCE = dpkg_$(DPKG_VERSION).tar.xz
+DPKG_SITE = http://ftp.de.debian.org/debian/pool/main/d/dpkg
+DPKG_LICENSE = GPLv2+
+DPKG_LICENSE_FILES = COPYING
+
+DPKG_DEPENDENCIES = host-pkgconf
+DPKG_CONF_OPT = \
+	--localstatedir=/var \
+	--disable-dselect \
+	--disable-start-stop-daemon \
+	--disable-update-alternatives
+
+HOST_DPKG_DEPENDENCIES = host-pkgconf
+HOST_DPKG_CONF_OPT = \
+	--disable-dselect \
+	--disable-start-stop-daemon \
+	--disable-update-alternatives
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
+
+# variables used by other packages
+DPKG:=$(HOST_DIR)/usr/bin/dpkg
