From: Sergey Bobrenok <bobrofon@gmail.com>
Date: Mon,  2 Nov 2020 23:23:24 +0700
Subject: [Buildroot] [PATCH v2 1/1] package/sdbus-cpp: new package
In-Reply-To: <20201031235531.338830a6@windsurf>
References: <20201031235531.338830a6@windsurf>
Message-ID: <20201102162324.438503-1-bobrofon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sdbus-c++ is a high-level C++ D-Bus library for Linux.

The target build produces sdbus-c++ library itself. The host build
produces helper tool sdbus-c++-xml2cpp. sdbus-c++-xml2cpp can be used
to generate sdbus-c++ stub .h files from xml files.

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/sdbus-cpp/Config.in      | 16 ++++++++++++++++
 package/sdbus-cpp/sdbus-cpp.hash |  3 +++
 package/sdbus-cpp/sdbus-cpp.mk   | 18 ++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/sdbus-cpp/Config.in
 create mode 100644 package/sdbus-cpp/sdbus-cpp.hash
 create mode 100644 package/sdbus-cpp/sdbus-cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7643722f3c..d96605983f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2329,6 +2329,9 @@ F:	package/libbson/
 F:	package/lua-resty-http/
 F:	package/mpir/
 
+N:	Sergey Bobrenok <bobrofon@gmail.com>
+F:	package/sdbus-cpp/
+
 N:	Sergey Matyukevich <geomatsi@gmail.com>
 F:	boot/arm-trusted-firmware/
 F:	boot/binaries-marvell/
diff --git a/package/Config.in b/package/Config.in
index 016a99ed1a..be054cbf0d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2441,6 +2441,7 @@ menu "System tools"
 	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
+	source "package/sdbus-cpp/Config.in"
 	source "package/sdbusplus/Config.in"
 	source "package/smack/Config.in"
 	source "package/start-stop-daemon/Config.in"
diff --git a/package/sdbus-cpp/Config.in b/package/sdbus-cpp/Config.in
new file mode 100644
index 0000000000..85f149eaa1
--- /dev/null
+++ b/package/sdbus-cpp/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_SDBUS_CPP
+	bool "sdbus-c++"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_SYSTEMD
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	help
+	  sdbus-c++ is a high-level C++ D-Bus library for Linux
+	  designed to provide expressive, easy-to-use API in modern C++.
+
+	  This will build the target library.
+
+	  https://github.com/Kistler-Group/sdbus-cpp
+
+comment "sdbus-c++ needs systemd and a toolchain w/ C++, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_SYSTEMD || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
new file mode 100644
index 0000000000..8b87653dfd
--- /dev/null
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  0fd575ae0f463773dd9141242d1133731e2b780fd6526650ce992ba711d88628  v0.8.3.tar.gz
+sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
new file mode 100644
index 0000000000..1b892ae943
--- /dev/null
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# sdbus-c++
+#
+################################################################################
+
+SDBUS_CPP_VERSION = 0.8.3
+SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
+SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
+SDBUS_CPP_INSTALL_STAGING = YES
+SDBUS_CPP_DEPENDENCIES = systemd
+SDBUS_CPP_LICENSE = LGPL-2.1+
+SDBUS_CPP_LICENSE_FILES = COPYING
+HOST_SDBUS_CPP_SUBDIR = tools
+HOST_SDBUS_CPP_DEPENDENCIES = host-expat
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.28.0
