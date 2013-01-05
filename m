From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  5 Jan 2013 15:10:52 +0100
Subject: [Buildroot] [PATCH 1/3] libcofi: new package
In-Reply-To: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
Message-ID: <e821f6ff7419626a59b1b62ff09cf1602edc45ac.1357394983.git.maxime.hadjinlian@gmail.com>
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
 package/libcofi/libcofi.mk |   17 +++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/libcofi/Config.in
 create mode 100644 package/libcofi/libcofi.mk

diff --git a/package/Config.in b/package/Config.in
index 11ff82d..a3530d7 100644
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
index 0000000..4872d1c
--- /dev/null
+++ b/package/libcofi/libcofi.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libcofi
+#
+#############################################################
+LIBCOFI_VERSION = 7313fbe12b0593034d0a1b606bf33c7cf4ababce
+LIBCOFI_SITE = http://github.com/simonjhall/copies-and-fills/tarball/master
+
+define LIBCOFI_BUILD_CMDS
+    $(MAKE1) AS="$(TARGET_AS)" CC="$(TARGET_CC)" -C $(@D) libcofi_rpi.so
+endef
+
+define LIBCOFI_INSTALL_TARGET_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/libcofi_rpi.so* $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
