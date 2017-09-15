From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 15 Sep 2017 15:39:40 +0300
Subject: [Buildroot] [PATCH] hackrf-host: new package
Message-ID: <20170915123940.8692-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jason Pruitt <jrspruitt@gmail.com>

This patch adds hackrf/host tools for HackRF,
a low cost, open source Software Defined Radio platform.

Sources of host tools are available on GitHub here:
https://github.com/mossmann/hackrf/tree/master/host

Signed-off-by: Jason Pruitt <jrspruitt@gmail.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 package/Config.in                    |  1 +
 package/hackrf-host/Config.in        | 18 ++++++++++++++++++
 package/hackrf-host/hackrf-host.hash |  2 ++
 package/hackrf-host/hackrf-host.mk   | 23 +++++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/hackrf-host/Config.in
 create mode 100644 package/hackrf-host/hackrf-host.hash
 create mode 100644 package/hackrf-host/hackrf-host.mk

diff --git a/package/Config.in b/package/Config.in
index 48d1381921..413be508bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1137,6 +1137,7 @@ menu "Hardware handling"
 	source "package/ccid/Config.in"
 	source "package/dtc/Config.in"
 	source "package/gnu-efi/Config.in"
+	source "package/hackrf-host/Config.in"
 	source "package/hidapi/Config.in"
 	source "package/lcdapi/Config.in"
 	source "package/let-me-create/Config.in"
diff --git a/package/hackrf-host/Config.in b/package/hackrf-host/Config.in
new file mode 100644
index 0000000000..0b103fcfdb
--- /dev/null
+++ b/package/hackrf-host/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_HACKRF_HOST
+	bool "hackrf-host"
+	select BR2_PACKAGE_LIBUSB
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	help
+	  Library and tools for accessing HackRF SDR boards.
+
+	  https://github.com/mossmann/hackrf/tree/master/host
+
+comment "hackrf-host needs a toolchain w/ C++, threads, dynamic library and fftw3f"
+	depends on BR2_STATIC_LIBS
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
+
diff --git a/package/hackrf-host/hackrf-host.hash b/package/hackrf-host/hackrf-host.hash
new file mode 100644
index 0000000000..7bbaff2a5d
--- /dev/null
+++ b/package/hackrf-host/hackrf-host.hash
@@ -0,0 +1,2 @@
+# Locally calculated (fetched from Github)
+sha512  d027a005fd2c179d9ebdf7a30ef6c50930c6db826c6ac9277da3373db2450990daf102501addc5d437cc304f67dc6a353d23da13ed1647d674e8aae13399ebcc  hackrf-host-v2017.02.1.tar.gz
diff --git a/package/hackrf-host/hackrf-host.mk b/package/hackrf-host/hackrf-host.mk
new file mode 100644
index 0000000000..88f04f6a4b
--- /dev/null
+++ b/package/hackrf-host/hackrf-host.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# HACKRF_HOST
+#
+################################################################################
+
+HACKRF_HOST_VERSION = v2017.02.1
+HACKRF_HOST_SITE = $(call github,mossmann,hackrf,$(HACKRF_HOST_VERSION))
+HACKRF_HOST_LICENSE = GPLv2 GPLv2+ BSD-3c
+HACKRF_HOST_LICENSE_FILES = COPYING
+HACKRF_HOST_DEPENDENCIES = fftw libusb
+HACKRF_HOST_SUBDIR = host
+HACKRF_HOST_INSTALL_STAGING = YES
+
+HACKRF_HOST_CONF_OPTS += -DBUILD_HACKRF_TOOLS=ON
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+HACKRF_HOST_CONF_OPTS += -DINSTALL_UDEV_RULES=ON
+else
+HACKRF_HOST_CONF_OPTS += -DINSTALL_UDEV_RULES=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.11.0
