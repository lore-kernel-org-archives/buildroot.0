From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Sun, 06 Dec 2020 14:50:01 +0000
Subject: [Buildroot] [PATCH 1/1] package/casync: new package
Message-ID: <onIw25oyihuYWcFwG2rTgzAbEF414WTH7efI53xEOXW2moxamXDh7mG1rqvPJT_5HOZ4Z52JarqzkoUbzYBk6z_8Z7UWehjNqnmXtRo45oI=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Content-Addressable Data Synchronization Tool

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 package/Config.in          |  1 +
 package/casync/Config.in   | 16 ++++++++++++++++
 package/casync/casync.hash |  3 +++
 package/casync/casync.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/casync/Config.in
 create mode 100644 package/casync/casync.hash
 create mode 100644 package/casync/casync.mk

diff --git a/package/Config.in b/package/Config.in
index 39c91645ad..157e654732 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2050,6 +2050,7 @@ menu "Networking applications"
 	source "package/c-icap-modules/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/cannelloni/Config.in"
+	source "package/casync/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
 	source "package/connman/Config.in"
diff --git a/package/casync/Config.in b/package/casync/Config.in
new file mode 100644
index 0000000000..2b00c849a3
--- /dev/null
+++ b/package/casync/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_CASYNC
+	bool "casync"
+	depends on BR2_PACKAGE_EUDEV
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_ACL
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_XZ
+	select BR2_PACKAGE_ZSTD
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
index 0000000000..c1f450423c
--- /dev/null
+++ b/package/casync/casync.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# casync
+#
+################################################################################
+
+CASYNC_VERSION = 4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc
+CASYNC_SITE = $(call github,systemd,casync,$(CASYNC_VERSION))
+CASYNC_LICENSE = LGPL-2.1
+CASYNC_LICENSE_FILES = LICENSE.LGPL2.1
+CASYNC_DEPENDENCIES += xz libcurl acl openssl zstd
+CASYNC_CONF_OPTS += -Dman=False
+
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+CASYNC_DEPENDENCIES += libfuse
+CASYNC_CONF_OPTS += -Dfuse=True
+else
+CASYNC_CONF_OPTS += -Dfuse=False
+endif
+
+ifeq ($(BR2_PACKAGE_BR2_PACKAGE_LIBSELINUX),y)
+CASYNC_DEPENDENCIES += libselinux
+CASYNC_CONF_OPTS += -Dselinux=True
+else
+CASYNC_CONF_OPTS += -Dselinux=False
+endif
+
+$(eval $(meson-package))
--
2.20.1
