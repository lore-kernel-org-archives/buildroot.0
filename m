From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 22:40:32 +0200
Subject: [Buildroot] [PATCH 1/7] libidn2: new package
Message-ID: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libidn2 is an implementation of the IDNA2008 + TR46
specifications (RFC 5890, RFC 5891, RFC 5892, RFC 5893,
TR 46).

http://www.gnu.org/software/libidn/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libidn2/Config.in    | 17 +++++++++++++++++
 package/libidn2/libidn2.hash |  8 ++++++++
 package/libidn2/libidn2.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/libidn2/Config.in
 create mode 100644 package/libidn2/libidn2.hash
 create mode 100644 package/libidn2/libidn2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d27c03c96a..ea93da0508 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -687,6 +687,7 @@ F:	package/libgee/
 F:	package/libglib2/
 F:	package/libgtk2/
 F:	package/libgtk3/
+F:	package/libidn2/
 F:	package/libmatroska/
 F:	package/libmpdclient/
 F:	package/libupnp/
diff --git a/package/Config.in b/package/Config.in
index dd61789181..552cbf3ea2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1410,6 +1410,7 @@ menu "Networking"
 	source "package/libgsasl/Config.in"
 	source "package/libhttpparser/Config.in"
 	source "package/libidn/Config.in"
+	source "package/libidn2/Config.in"
 	source "package/libiscsi/Config.in"
 	source "package/libkrb5/Config.in"
 	source "package/libldns/Config.in"
diff --git a/package/libidn2/Config.in b/package/libidn2/Config.in
new file mode 100644
index 0000000000..38b1378990
--- /dev/null
+++ b/package/libidn2/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBIDN2
+	bool "libidn2"
+	help
+	  Libidn2 is an implementation of the IDNA2008 + TR46
+	  specifications (RFC 5890, RFC 5891, RFC 5892, RFC 5893,
+	  TR 46).
+
+	  http://www.gnu.org/software/libidn/
+
+if BR2_PACKAGE_LIBIDN2
+
+config BR2_PACKAGE_LIBIDN2_BINARY
+	bool "idn2 binary"
+	help
+	  Install idn2 command line tool
+
+endif
diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
new file mode 100644
index 0000000000..980f78f50d
--- /dev/null
+++ b/package/libidn2/libidn2.hash
@@ -0,0 +1,8 @@
+# From Calculated locally after checking signature
+sha256	644b6b03b285fb0ace02d241d59483d98bc462729d8bb3608d5cad5532f3d2f0	libidn2-2.0.4.tar.gz
+
+# Hash for license files:
+sha256	4fa501e804195b4136c9cec4bc510365b8cbaf4bc075d6401a77ae0213370457	COPYING
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
+sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LESSERv3
+sha256	01d621eef165cf4d3d3dbb737aa0699178d94c6f18cf87e9dde6db3ca7790f46	COPYING.unicode
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
new file mode 100644
index 0000000000..e6331d730c
--- /dev/null
+++ b/package/libidn2/libidn2.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# libidn2
+#
+################################################################################
+
+LIBIDN2_VERSION = 2.0.4
+LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
+LIBIDN2_LICENSE = GPL-2.0+, LGPL-3.0+
+LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
+LIBIDN2_DEPENDENCIES = \
+	host-pkgconf \
+	$(TARGET_NLS_DEPENDENCIES) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN2_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
+LIBIDN2_DEPENDENCIES += libunistring
+endif
+
+define LIBIDN2_REMOVE_BINARY
+	rm -f $(TARGET_DIR)/usr/bin/idn2
+endef
+
+ifneq ($(BR2_PACKAGE_LIBIDN2_BINARY),y)
+LIBIDN2_POST_INSTALL_TARGET_HOOKS += LIBIDN2_REMOVE_BINARY
+endif
+
+$(eval $(autotools-package))
-- 
2.14.1
