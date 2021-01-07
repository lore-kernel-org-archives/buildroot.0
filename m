From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Thu, 07 Jan 2021 07:12:57 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/casync: new package
Message-ID: <-L4OoHbI_s2GypxkG9mFgazGU5zBSrAAbDJZ8-Z4fV4jx0pA4UFDZgnIAi8Jjovzv_ody4LtOlfNmnZ8evA-5BlsbQoa5goxcwgc3zOALIU=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Content-Addressable Data Synchronization Tool

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/casync/Config.in   | 15 +++++++++++
 package/casync/casync.hash |  3 +++
 package/casync/casync.mk   | 54 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 74 insertions(+)
 create mode 100644 package/casync/Config.in
 create mode 100644 package/casync/casync.hash
 create mode 100644 package/casync/casync.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 258a51a14c..1917cd7f48 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2709,6 +2709,7 @@ F:	package/fwup/

 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/gloox/
+F:	package/casync/

 N:	Yann CARDAILLAC <ycardaillac@sepro-group.com>
 F:	package/open62541/
diff --git a/package/Config.in b/package/Config.in
index 7264198001..eff1a7f433 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2067,6 +2067,7 @@ menu "Networking applications"
 	source "package/c-icap-modules/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/cannelloni/Config.in"
+	source "package/casync/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
 	source "package/connman/Config.in"
diff --git a/package/casync/Config.in b/package/casync/Config.in
new file mode 100644
index 0000000000..7cace7eacf
--- /dev/null
+++ b/package/casync/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CASYNC
+	bool "casync"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_USES_GLIBC # scandirat() is not implemented by musl and uclibc-ng
+	select BR2_PACKAGE_ACL
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_XZ
+	help
+	  Content-Addressable Data Synchronization Tool
+
+	  https://github.com/systemd/casync
+
+comment "casync needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/casync/casync.hash b/package/casync/casync.hash
new file mode 100644
index 0000000000..dbb85520de
--- /dev/null
+++ b/package/casync/casync.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  d07f43e70e3c466152033da4c55c065f815d3025234a046c2bce1cfe4ac7d273  casync-4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/casync/casync.mk b/package/casync/casync.mk
new file mode 100644
index 0000000000..9cda386bb0
--- /dev/null
+++ b/package/casync/casync.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# casync
+#
+################################################################################
+
+CASYNC_VERSION = 4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc
+CASYNC_SITE = $(call github,systemd,casync,$(CASYNC_VERSION))
+CASYNC_LICENSE = LGPL-2.1+
+CASYNC_LICENSE_FILES = LICENSE.LGPL2.1
+# xz is mandatory because of ./src/castore.c:5:10: #include <lzma.h>
+CASYNC_DEPENDENCIES = acl libcurl openssl xz
+CASYNC_CONF_OPTS += -Dman=false
+
+# meson booleans
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+CASYNC_DEPENDENCIES += libfuse
+CASYNC_CONF_OPTS += -Dfuse=true
+else
+CASYNC_CONF_OPTS += -Dfuse=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+CASYNC_DEPENDENCIES += libselinux
+CASYNC_CONF_OPTS += -Dselinux=true
+else
+CASYNC_CONF_OPTS += -Dselinux=false
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+CASYNC_DEPENDENCIES += libudev
+CASYNC_CONF_OPTS += -Dudev=true
+else
+CASYNC_CONF_OPTS += -Dudev=false
+# Due to a bug in ./meson.build, 'udevrulesdir' must not be empty
+CASYNC_CONF_OPTS += -Dudevrulesdir=this_is_a_bug
+endif
+
+# meson features
+ifeq ($(BR2_PACKAGE_LIBZSTD),y)
+CASYNC_DEPENDENCIES += libzstd
+CASYNC_CONF_OPTS += -Dlibzstd=enabled
+else
+CASYNC_CONF_OPTS += -Dlibzstd=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+CASYNC_DEPENDENCIES += zlib
+CASYNC_CONF_OPTS += -Dzlib=enabled
+else
+CASYNC_CONF_OPTS += -Dlibz=disabled
+endif
+
+$(eval $(meson-package))
--
2.20.1
