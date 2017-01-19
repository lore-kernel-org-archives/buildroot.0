From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 19 Jan 2017 13:01:49 +0100
Subject: [Buildroot] [PATCH v2 1/2] libgpiod: new package
In-Reply-To: <1484827310-13779-1-git-send-email-bgolaszewski@baylibre.com>
References: <1484827310-13779-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1484827310-13779-2-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a package containing a C library and a set of command-line tools
for controlling GPIOs from user space using the new character device
interface on linux.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/Config.in              |  1 +
 package/libgpiod/Config.in     | 20 ++++++++++++++++++++
 package/libgpiod/libgpiod.hash |  2 ++
 package/libgpiod/libgpiod.mk   | 14 ++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/libgpiod/Config.in
 create mode 100644 package/libgpiod/libgpiod.hash
 create mode 100644 package/libgpiod/libgpiod.mk

diff --git a/package/Config.in b/package/Config.in
index 8c8c33e..2100bc7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1045,6 +1045,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libftdi1/Config.in"
+	source "package/libgpiod/Config.in"
 	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
 	source "package/libiio/Config.in"
diff --git a/package/libgpiod/Config.in b/package/libgpiod/Config.in
new file mode 100644
index 0000000..63a7cb6
--- /dev/null
+++ b/package/libgpiod/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBGPIOD
+	bool "libgpiod"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+	help
+	  This is a C library that abstracts the GPIO character
+	  device operations on linux.
+
+	  https://github.com/brgl/libgpiod
+
+if BR2_PACKAGE_LIBGPIOD
+
+config BR2_PACKAGE_LIBGPIOD_TOOLS
+	bool "install tools"
+	help
+	  Include a set of command-line tools for managing GPIOs.
+
+endif
+
+comment "libgpiod needs kernel headers >= 4.8"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
new file mode 100644
index 0000000..7de17bb
--- /dev/null
+++ b/package/libgpiod/libgpiod.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 0f9f5215d0100a8066f4e6b064892747720e556cbb83f6c05d6151d68ec2025b libgpiod-v0.1.tar.gz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
new file mode 100644
index 0000000..aca3d5d
--- /dev/null
+++ b/package/libgpiod/libgpiod.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libgpiod
+#
+################################################################################
+
+LIBGPIOD_VERSION = v0.1
+LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
+LIBGPIOD_LICENSE = GPLv3+
+LIBGPIOD_LICENSE_FILES = COPYING
+LIBGPIOD_AUTORECONF = YES
+LIBGPIOD_CONF_OPTS += --$(if $(BR2_PACKAGE_LIBGPIOD_TOOLS),enable,disable)-tools
+
+$(eval $(autotools-package))
-- 
2.9.3
