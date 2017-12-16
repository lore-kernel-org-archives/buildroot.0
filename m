From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Dec 2017 16:30:46 +0100
Subject: [Buildroot] [git commit] pimd: new package
Message-ID: <20171216153130.1F17683232@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3c6ce5983e0428bf12bb9fa018774d37bef525a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pimd is a lightweight stand-alone PIM-SM v2 multicast routing daemon.

Tested on Beaglebone Black.

Build-tested with test-pkg script.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/pimd/Config.in |  8 ++++++++
 package/pimd/pimd.hash |  6 ++++++
 package/pimd/pimd.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index af221bd..63674d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1546,6 +1546,7 @@ F:	package/xr819-xradio/
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
 F:	package/mongodb/
+F:	package/pimd/
 F:	package/stella/
 F:	package/traceroute/
 F:	package/tunctl/
diff --git a/package/Config.in b/package/Config.in
index 4fa5762..1983d8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1755,6 +1755,7 @@ endif
 	source "package/p910nd/Config.in"
 	source "package/phidgetwebservice/Config.in"
 	source "package/phytool/Config.in"
+	source "package/pimd/Config.in"
 	source "package/pound/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
diff --git a/package/pimd/Config.in b/package/pimd/Config.in
new file mode 100644
index 0000000..d6a579b
--- /dev/null
+++ b/package/pimd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PIMD
+	bool "pimd"
+	depends on BR2_USE_MMU # fork()
+	help
+	  pimd is a lightweight stand-alone PIM-SM v2 multicast routing
+	  daemon.
+
+	  http://troglobit.com/project/pimd/
diff --git a/package/pimd/pimd.hash b/package/pimd/pimd.hash
new file mode 100644
index 0000000..98c717d
--- /dev/null
+++ b/package/pimd/pimd.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256 c77a9812751f114490a28a6839b16aac8b020c8d9fd6aa22bf3880c054e19f1d  pimd-2.3.2.tar.gz
+
+# Hash for license files:
+sha256 3379436c16caccdef9b40a49fbdfdbb45aad8ecb05870834490b8fb080126009  LICENSE
+sha256 4328a21f0822caa9976356623118bcdcc9970c7a0f9a3deeba23c779b7cfb5d1  LICENSE.mrouted
diff --git a/package/pimd/pimd.mk b/package/pimd/pimd.mk
new file mode 100644
index 0000000..21b5e10
--- /dev/null
+++ b/package/pimd/pimd.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# pimd
+#
+################################################################################
+
+PIMD_VERSION = 2.3.2
+PIMD_SOURCE = pimd-$(PIMD_VERSION).tar.gz
+PIMD_SITE = https://github.com/troglobit/pimd/releases/download/$(PIMD_VERSION)
+
+PIMD_LICENSE = BSD-3-Clause
+PIMD_LICENSE_FILES = LICENSE LICENSE.mrouted
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),y)
+PIMD_CONF_OPTS += --embedded-libc
+endif
+
+# The configure script is not autoconf based, so we use the
+# generic-package infrastructure
+define PIMD_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure $(PIMD_CONF_OPTS) \
+	)
+endef
+
+define PIMD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CROSS=$(TARGET_CROSS) \
+		CC=$(TARGET_CC) -C $(@D)
+endef
+
+define PIMD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
+		prefix=/usr -C $(@D) install
+endef
+
+$(eval $(generic-package))
