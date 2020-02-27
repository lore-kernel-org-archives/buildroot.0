From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Feb 2020 21:12:32 +0100
Subject: [Buildroot] [git commit] package/udev-gentoo-scripts: new package
Message-ID: <20200309140906.E89F18158C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19c5075e0c4716d0138d020dd36985201e6234ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gentoo scripts to initialize udev via openrc, to be used by eudev.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
[yann.morin.1998 at free.fr: fix commit title]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/udev-gentoo-scripts/Config.in              |  6 ++++++
 .../udev-gentoo-scripts/udev-gentoo-scripts.hash   |  3 +++
 package/udev-gentoo-scripts/udev-gentoo-scripts.mk | 22 ++++++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8f6a52b4fb..dbc14f114a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -505,6 +505,7 @@ F:	package/skeleton-init-systemd/
 F:	package/skeleton-init-sysv/
 F:	package/skeleton/
 F:	package/sysvinit/
+F:	package/udev-gentoo-scripts/
 F:	package/util-linux/
 F:	package/tpm2-abrmd/
 F:	package/tpm2-tools/
diff --git a/package/Config.in b/package/Config.in
index 9d83d3948d..5be5f3726b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -556,6 +556,7 @@ endmenu
 	source "package/ubus/Config.in"
 	source "package/uccp420wlan/Config.in"
 	source "package/udev/Config.in"
+	source "package/udev-gentoo-scripts/Config.in"
 	source "package/udisks/Config.in"
 	source "package/uhubctl/Config.in"
 	source "package/umtprd/Config.in"
diff --git a/package/udev-gentoo-scripts/Config.in b/package/udev-gentoo-scripts/Config.in
new file mode 100644
index 0000000000..9d6944354d
--- /dev/null
+++ b/package/udev-gentoo-scripts/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_UDEV_GENTOO_SCRIPTS
+	bool
+	depends on BR2_PACKAGE_EUDEV
+	depends on BR2_INIT_OPENRC
+	help
+	  Init scripts for eudev.
diff --git a/package/udev-gentoo-scripts/udev-gentoo-scripts.hash b/package/udev-gentoo-scripts/udev-gentoo-scripts.hash
new file mode 100644
index 0000000000..60563baae0
--- /dev/null
+++ b/package/udev-gentoo-scripts/udev-gentoo-scripts.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 b206f72c93cd2e51ed59061931918a9c23c3c1f7e6caffacc9d4f8915a42c30a  udev-gentoo-scripts-33.tar.bz2
+sha256 329f95829088b95650b9012ae688f09baa1637985425a7964d33683363f48702  init.d/udev-settle
diff --git a/package/udev-gentoo-scripts/udev-gentoo-scripts.mk b/package/udev-gentoo-scripts/udev-gentoo-scripts.mk
new file mode 100644
index 0000000000..a0598bcad8
--- /dev/null
+++ b/package/udev-gentoo-scripts/udev-gentoo-scripts.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# udev-gentoo-scripts
+#
+################################################################################
+
+UDEV_GENTOO_SCRIPTS_VERSION = 33
+UDEV_GENTOO_SCRIPTS_SOURCE = udev-gentoo-scripts-$(UDEV_GENTOO_SCRIPTS_VERSION).tar.bz2
+UDEV_GENTOO_SCRIPTS_SITE = https://gitweb.gentoo.org/proj/udev-gentoo-scripts.git/snapshot
+UDEV_GENTOO_SCRIPTS_LICENSE = GPL-2.0
+UDEV_GENTOO_SCRIPTS_LICENSE_FILES = init.d/udev-settle
+
+# We don't need to symlink /etc/init.d/udev to /etc/runlevels/sysinit, since
+# it's in the udev-settle and udev-trigger "need" lists.
+define UDEV_GENTOO_SCRIPTS_INSTALL_INIT_OPENRC
+	$(MAKE1) -C $(@D) install DESTDIR=$(TARGET_DIR)
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/runlevels/sysinit
+	ln -s -f /etc/init.d/udev-settle /etc/init.d/udev-trigger \
+		$(TARGET_DIR)/etc/runlevels/sysinit
+endef
+
+$(eval $(generic-package))
