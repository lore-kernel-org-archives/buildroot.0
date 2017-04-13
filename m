From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 13 Apr 2017 11:33:20 +0200
Subject: [Buildroot] [PATCH v2] phytool: new package
Message-ID: <20170413093320.13250-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - fix licence (Arnout Vandecappelle)
  - use upstream tarball (Arnout Vandecappelle)
  - use TARGET_CONFIGURE_OPTS in both build and install steps (Arnout Vandecappelle)
  - squash DEVELOPERS patch (Thomas Petazzoni)

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/phytool/Config.in    |  6 ++++++
 package/phytool/phytool.hash |  4 ++++
 package/phytool/phytool.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/phytool/Config.in
 create mode 100644 package/phytool/phytool.hash
 create mode 100644 package/phytool/phytool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a298669ab..e4582b615 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1739,6 +1739,7 @@ F:	package/linux-firmware/
 F:	package/modem-manager/
 F:	package/nuttcp/
 F:	package/parted/
+F:	package/phytool/
 F:	package/python*
 F:	package/ser2net/
 F:	package/socketcand/
diff --git a/package/Config.in b/package/Config.in
index c12e5b56f..bdad62267 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1639,6 +1639,7 @@ endif
 	source "package/openvpn/Config.in"
 	source "package/p910nd/Config.in"
 	source "package/phidgetwebservice/Config.in"
+	source "package/phytool/Config.in"
 	source "package/pound/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
diff --git a/package/phytool/Config.in b/package/phytool/Config.in
new file mode 100644
index 000000000..7dca31dda
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
index 000000000..37d8f6675
--- /dev/null
+++ b/package/phytool/phytool.hash
@@ -0,0 +1,4 @@
+# md5 from https://github.com/wkz/phytool/releases/download/v1.0.1/phytool-1.0.1.tar.xz.md5
+# sha256 locally computed:
+md5  08997ad8f01faf84f3da0638f3ad8b16  phytool-1.0.1.tar.xz
+sha256  b08c538dc8024e542d54742b93cc7748c7062477f060d6e9331a67009aeadd88  phytool-1.0.1.tar.xz
diff --git a/package/phytool/phytool.mk b/package/phytool/phytool.mk
new file mode 100644
index 000000000..2a47dfa57
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
-- 
2.11.0
