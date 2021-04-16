From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 16 Apr 2021 10:18:48 +0300
Subject: [Buildroot] [PATCH v4 1/2] package/libosmium: new package
Message-ID: <20210416071849.446989-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A fast and flexible C++ library for working with OpenStreetMap data.
Libosmium works on Linux, macOS and Windows.

https://osmcode.org/libosmium/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
Changes v3 -> v4:
 - Some minor cleanup
 - Add protozero dependency

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libosmium/Config.in      | 18 ++++++++++++++++++
 package/libosmium/libosmium.hash |  3 +++
 package/libosmium/libosmium.mk   | 30 ++++++++++++++++++++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 package/libosmium/Config.in
 create mode 100644 package/libosmium/libosmium.hash
 create mode 100644 package/libosmium/libosmium.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9390daa2fa..ceb7428e95 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1840,6 +1840,7 @@ N:	Max Filippov <jcmvbkbc@gmail.com>
 F:	arch/Config.in.xtensa
 
 N:	Maxim Kochetkov <fido_max@inbox.ru>
+F:	package/libosmium/
 F:	package/protozero/
 F:	package/timescaledb/
 
diff --git a/package/Config.in b/package/Config.in
index 0d7cb0f446..0680a07154 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1923,6 +1923,7 @@ menu "Other"
 	source "package/libloki/Config.in"
 	source "package/libnpth/Config.in"
 	source "package/libnspr/Config.in"
+	source "package/libosmium/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
diff --git a/package/libosmium/Config.in b/package/libosmium/Config.in
new file mode 100644
index 0000000000..2b4f683be2
--- /dev/null
+++ b/package/libosmium/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBOSMIUM
+	bool "libosmium"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_USE_WCHAR # boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_PROTOZERO
+
+	help
+	  A fast and flexible C++ library for working with OpenStreetMap
+	  data. Libosmium works on Linux, macOS and Windows.
+
+	  https://osmcode.org/libosmium/
+
+comment "libosmium needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
new file mode 100644
index 0000000000..b90690e9aa
--- /dev/null
+++ b/package/libosmium/libosmium.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  42bbef97226d7db7ce3eeb474603e5b1f2f0f86cec85498868e9416e7cdf5bd5  libosmium-2.16.0.tar.gz
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
new file mode 100644
index 0000000000..0d7bd2aec3
--- /dev/null
+++ b/package/libosmium/libosmium.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# libosmium
+#
+################################################################################
+
+LIBOSMIUM_VERSION = 2.16.0
+LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
+LIBOSMIUM_LICENSE = BSL-1.0
+LIBOSMIUM_LICENSE_FILES = LICENSE
+LIBOSMIUM_INSTALL_STAGING = YES
+LIBOSMIUM_DEPENDENCIES = boost protozero
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+LIBOSMIUM_DEPENDENCIES += bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGEOS),y)
+LIBOSMIUM_DEPENDENCIES += libgeos
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGDAL),y)
+LIBOSMIUM_DEPENDENCIES += libgdal
+endif
+
+ifeq ($(BR2_PACKAGE_PROJ),y)
+LIBOSMIUM_DEPENDENCIES += proj
+endif
+
+$(eval $(cmake-package))
-- 
2.30.2
