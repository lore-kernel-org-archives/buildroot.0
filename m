From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 18 Dec 2018 12:51:45 -0600
Subject: [Buildroot] [PATCH] package/libeastl: new package
Message-ID: <1545159105-19680-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the Entertainment Arts Standard Template Library.

The initial version uses the latest hash so that the aarch64 support
is included vs Buildroot having to apply the aarch64 support patch.

Signed-off-by: Maury Anderson <maury.anderson@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libeastl/Config.in     | 22 ++++++++++++++++++++++
 package/libeastl/libeastl.hash |  2 ++
 package/libeastl/libeastl.mk   | 18 ++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/libeastl/Config.in
 create mode 100644 package/libeastl/libeastl.hash
 create mode 100644 package/libeastl/libeastl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 59b549e..be73485 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1418,6 +1418,7 @@ F:	package/kvm-unit-tests/
 F:	package/kvmtool/
 F:	package/libcsv/
 F:	package/libcurl/
+F:	package/libeastl/
 F:	package/libfcgi/
 F:	package/libopenssl/
 F:	package/libselinux/
diff --git a/package/Config.in b/package/Config.in
index c3e0691..7bf46b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1658,6 +1658,7 @@ menu "Other"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
+	source "package/libeastl/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
 	source "package/libevdev/Config.in"
diff --git a/package/libeastl/Config.in b/package/libeastl/Config.in
new file mode 100644
index 0000000..07bfe2c
--- /dev/null
+++ b/package/libeastl/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386
+	default y if BR2_x86_64
+	default y if BR2_aarch64
+	default y if BR2_powerpc
+	default y if BR2_powerpc64
+
+config BR2_PACKAGE_LIBEASTL
+	bool "libeastl"
+	depends on BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	help
+	  EASTL stands for Electronic Arts Standard Template Library.
+	  It is an extensive and robust implementation that has an
+	  emphasis on high performance.
+
+	  https://github.com/electronicarts/EASTL
+
+comment "libeastl needs a toolchain w/ gcc >= 4.9"
+	depends on BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libeastl/libeastl.hash b/package/libeastl/libeastl.hash
new file mode 100644
index 0000000..9347276
--- /dev/null
+++ b/package/libeastl/libeastl.hash
@@ -0,0 +1,2 @@
+sha256 b181ae3571648391801d7de87eeaf6cb41e85b3d2ffc9e23b87b23b39989800b  libeastl-45469730d641868ce05433fff2e199510c7d45c3.tar.gz
+sha256 82c0243a1a62b8af01dab3bce6ed2b0852604bd508b85a561ba7d32480e598e3  LICENSE
diff --git a/package/libeastl/libeastl.mk b/package/libeastl/libeastl.mk
new file mode 100644
index 0000000..4fdf552
--- /dev/null
+++ b/package/libeastl/libeastl.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libeastl
+#
+################################################################################
+
+LIBEASTL_VERSION = 45469730d641868ce05433fff2e199510c7d45c3
+LIBEASTL_SITE = https://github.com/electronicarts/EASTL.git
+LIBEASTL_SITE_METHOD = git
+LIBEASTL_LICENSE = BSD-3-Clause
+LIBEASTL_LICENSE_FILES = LICENSE
+LIBEASTL_INSTALL_STAGING = YES
+
+define LIBEASTL_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755  $(@D)/libEASTL.so $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(cmake-package))
-- 
1.9.1
