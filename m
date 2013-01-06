From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  6 Jan 2013 21:56:20 +0100
Subject: [Buildroot] [PATCH 1/3] libcofi: new package
In-Reply-To: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
References: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
Message-ID: <ca62bc23d6fea2e485408cce7bfdf1835a4bfb15.1357505417.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

replacement for memcpy and memset functionality
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in          |    1 +
 package/libcofi/Config.in  |    8 ++++++++
 package/libcofi/libcofi.mk |   20 ++++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/libcofi/Config.in
 create mode 100644 package/libcofi/libcofi.mk

diff --git a/package/Config.in b/package/Config.in
index 047af8d..9b50f4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -511,6 +511,7 @@ endmenu
 menu "Other"
 source "package/apr/Config.in"
 source "package/apr-util/Config.in"
+source "package/libcofi/Config.in"
 source "package/classpath/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
diff --git a/package/libcofi/Config.in b/package/libcofi/Config.in
new file mode 100644
index 0000000..b900b69
--- /dev/null
+++ b/package/libcofi/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBCOFI
+	bool "libcofi"
+	depends on BR2_arm
+	help
+	  A replacement for memcpy and memset functionality for the Raspberry Pi
+	  with the intention of gaining greater performance.
+
+	  https://github.com/simonjhall/copies-and-fills
diff --git a/package/libcofi/libcofi.mk b/package/libcofi/libcofi.mk
new file mode 100644
index 0000000..e2ce702
--- /dev/null
+++ b/package/libcofi/libcofi.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# libcofi
+#
+#############################################################
+
+LIBCOFI_VERSION = 7313fbe12b0593034d0a1b606bf33c7cf4ababce
+LIBCOFI_SITE = http://github.com/simonjhall/copies-and-fills/tarball/master
+LIBCOFI_LICENSE = LGPLv2.1
+LIBCOFI_LICENSE_FILES = README.md
+
+define LIBCOFI_BUILD_CMDS
+    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define LIBCOFI_INSTALL_TARGET_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/libcofi_rpi.so $(TARGET_DIR)/usr/lib/libcofi_rpi.so
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
