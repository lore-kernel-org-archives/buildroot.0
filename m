From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 21:30:33 +0200
Subject: [Buildroot] [git commit] phytool: new package
Message-ID: <20170413193121.4582D82213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=139d47e1f915fbb9826ff3db75c84c5e19d830c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/phytool/Config.in    |  6 ++++++
 package/phytool/phytool.hash |  4 ++++
 package/phytool/phytool.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a7e1849..9550094 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1740,6 +1740,7 @@ F:	package/linux-firmware/
 F:	package/modem-manager/
 F:	package/nuttcp/
 F:	package/parted/
+F:	package/phytool/
 F:	package/python*
 F:	package/ser2net/
 F:	package/socketcand/
diff --git a/package/Config.in b/package/Config.in
index 3683578..d0e7af1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1640,6 +1640,7 @@ endif
 	source "package/openvpn/Config.in"
 	source "package/p910nd/Config.in"
 	source "package/phidgetwebservice/Config.in"
+	source "package/phytool/Config.in"
 	source "package/pound/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
diff --git a/package/phytool/Config.in b/package/phytool/Config.in
new file mode 100644
index 0000000..7dca31d
--- /dev/null
+++ b/package/phytool/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PHYTOOL
+	bool "phytool"
+	help
+	  Linux MDIO register access utility.
+
+	  https://github.com/wkz/phytool
diff --git a/package/phytool/phytool.hash b/package/phytool/phytool.hash
new file mode 100644
index 0000000..37d8f66
--- /dev/null
+++ b/package/phytool/phytool.hash
@@ -0,0 +1,4 @@
+# md5 from https://github.com/wkz/phytool/releases/download/v1.0.1/phytool-1.0.1.tar.xz.md5
+# sha256 locally computed:
+md5  08997ad8f01faf84f3da0638f3ad8b16  phytool-1.0.1.tar.xz
+sha256  b08c538dc8024e542d54742b93cc7748c7062477f060d6e9331a67009aeadd88  phytool-1.0.1.tar.xz
diff --git a/package/phytool/phytool.mk b/package/phytool/phytool.mk
new file mode 100644
index 0000000..2a47dfa
--- /dev/null
+++ b/package/phytool/phytool.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# phytool
+#
+################################################################################
+
+PHYTOOL_VERSION = 1.0.1
+PHYTOOL_SOURCE = phytool-$(PHYTOOL_VERSION).tar.xz
+PHYTOOL_SITE = https://github.com/wkz/phytool/releases/download/v$(PHYTOOL_VERSION)
+PHYTOOL_LICENSE = GPL-2.0+
+PHYTOOL_LICENSE_FILES = LICENSE
+
+define PHYTOOL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		LDLIBS="$(TARGET_LDFLAGS)"
+endef
+
+define PHYTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR="$(TARGET_DIR)" \
+		PREFIX="usr" install
+endef
+
+$(eval $(generic-package))
