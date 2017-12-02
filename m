From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat,  2 Dec 2017 13:24:02 -0200
Subject: [Buildroot] [PATCH] pimd: new package
Message-ID: <1512228242-23822-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pimd is a lightweight stand-alone PIM-SM v2 multicast routing daemon.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/pimd/Config.in |  8 ++++++++
 package/pimd/pimd.hash |  3 +++
 package/pimd/pimd.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/pimd/Config.in
 create mode 100644 package/pimd/pimd.hash
 create mode 100644 package/pimd/pimd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 27b22f4f0fed..1a998f3dfc12 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1518,6 +1518,7 @@ F:	configs/linksprite_pcduino_defconfig
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
 F:	package/mongodb/
+F:	package/pimd/
 F:	package/stella/
 F:	package/tunctl/
 F:	package/ubus/
diff --git a/package/Config.in b/package/Config.in
index aa111e48e6fb..104859fcd1c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1410,6 +1410,7 @@ menu "Networking"
 	source "package/openzwave/Config.in"
 	source "package/ortp/Config.in"
 	source "package/paho-mqtt-c/Config.in"
+	source "package/pimd/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
 	source "package/rabbitmq-c/Config.in"
diff --git a/package/pimd/Config.in b/package/pimd/Config.in
new file mode 100644
index 000000000000..d6a579bda258
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
index 000000000000..20252a6d4ed7
--- /dev/null
+++ b/package/pimd/pimd.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 c77a9812751f114490a28a6839b16aac8b020c8d9fd6aa22bf3880c054e19f1d  pimd-2.3.2.tar.gz
+sha256 3379436c16caccdef9b40a49fbdfdbb45aad8ecb05870834490b8fb080126009  LICENSE
diff --git a/package/pimd/pimd.mk b/package/pimd/pimd.mk
new file mode 100644
index 000000000000..cd9427094a61
--- /dev/null
+++ b/package/pimd/pimd.mk
@@ -0,0 +1,20 @@
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
+PIMD_LICENSE_FILES = LICENSE
+
+PIMD_MAKE_OPTS = CROSS=$(TARGET_CROSS) CC=$(TARGET_CC)
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),y)
+PIMD_CONF_OPTS = --embedded-libc
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
