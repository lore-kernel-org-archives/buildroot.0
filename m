From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 15:32:43 +0200
Subject: [Buildroot] [git commit branch/next] uhubctl: new package
Message-ID: <20170823133055.0993481F02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fb1bc2731944e99b1e0bad85cca635b1a281ebc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/uhubctl/Config.in    | 11 +++++++++++
 package/uhubctl/uhubctl.hash |  2 ++
 package/uhubctl/uhubctl.mk   | 22 ++++++++++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9df2896..ad52fb7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -178,6 +178,7 @@ F:	package/daemon/
 F:	package/ebtables/
 F:	package/openipmi/
 F:	package/ti-uim/
+F:	package/uhubctl/
 
 N:	Ben Boeckel <mathstuf@gmail.com>
 F:	package/taskd/
diff --git a/package/Config.in b/package/Config.in
index 5f83a4d..d4db8c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -505,6 +505,7 @@ endmenu
 	source "package/uccp420wlan/Config.in"
 	source "package/udev/Config.in"
 	source "package/udisks/Config.in"
+	source "package/uhubctl/Config.in"
 	source "package/upower/Config.in"
 	source "package/usb_modeswitch/Config.in"
 	source "package/usb_modeswitch_data/Config.in"
diff --git a/package/uhubctl/Config.in b/package/uhubctl/Config.in
new file mode 100644
index 0000000..c000b5a
--- /dev/null
+++ b/package/uhubctl/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_UHUBCTL
+	bool "uhubctl"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Control USB power per-port on smart USB hubs.
+
+	  https://github.com/mvp/uhubctl
+
+comment "uhubctl needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/uhubctl/uhubctl.hash b/package/uhubctl/uhubctl.hash
new file mode 100644
index 0000000..6afee90
--- /dev/null
+++ b/package/uhubctl/uhubctl.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 dfc85571ad86a071bf7a0db7cadf97a870e628777e47176520de6866b4f042b6 uhubctl-047bb1e392efd3e0ea5d5caf351e20761e12cd44.tar.gz
diff --git a/package/uhubctl/uhubctl.mk b/package/uhubctl/uhubctl.mk
new file mode 100644
index 0000000..7484500
--- /dev/null
+++ b/package/uhubctl/uhubctl.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# uhubctl
+#
+################################################################################
+
+UHUBCTL_VERSION = 047bb1e392efd3e0ea5d5caf351e20761e12cd44
+UHUBCTL_SITE = $(call github,mvp,uhubctl,$(UHUBCTL_VERSION))
+UHUBCTL_LICENSE = GPL-2.0
+UHUBCTL_LICENSE_FILES = LICENSE
+UHUBCTL_DEPENDENCIES = libusb
+
+define UHUBCTL_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define UHUBCTL_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
+		$(MAKE) -C $(@D) install
+endef
+
+$(eval $(generic-package))
