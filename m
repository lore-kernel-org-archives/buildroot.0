From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:14:22 +0100
Subject: [Buildroot] [git commit] package/libeastl: new package
Message-ID: <20181231131023.176DB80F82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed9ddaafb2c4d3ac44e46390248f5c9af08076b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the Entertainment Arts Standard Template Library.

The initial version uses the latest hash so that the aarch64 support
is included vs Buildroot having to apply the aarch64 support patch.

Signed-off-by: Maury Anderson <maury.anderson@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Thomas:
 - add missing BR2_INSTALL_LIBSTDCPP dependency
 - use the github helper instead of the git site method, and adjust
   hash consequently
 - drop INSTALL_TARGET_CMDS, the default cmake-package implementation
   works fine]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libeastl/Config.in     | 27 +++++++++++++++++++++++++++
 package/libeastl/libeastl.hash |  2 ++
 package/libeastl/libeastl.mk   | 13 +++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4aed6fc4a7..9654fcf2bf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1423,6 +1423,7 @@ F:	package/kvm-unit-tests/
 F:	package/kvmtool/
 F:	package/libcsv/
 F:	package/libcurl/
+F:	package/libeastl/
 F:	package/libfcgi/
 F:	package/libopenssl/
 F:	package/libselinux/
diff --git a/package/Config.in b/package/Config.in
index 733c7e6764..0df9b73088 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1661,6 +1661,7 @@ menu "Other"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
+	source "package/libeastl/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
 	source "package/libevdev/Config.in"
diff --git a/package/libeastl/Config.in b/package/libeastl/Config.in
new file mode 100644
index 0000000000..7609434519
--- /dev/null
+++ b/package/libeastl/Config.in
@@ -0,0 +1,27 @@
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
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	help
+	  EASTL stands for Electronic Arts Standard Template
+	  Library. EASTL stands for Electronic Arts Standard Template
+	  Library. It is a C++ template library of containers,
+	  algorithms, and iterators useful for runtime and tool
+	  development across multiple platforms.  It is an extensive
+	  and robust implementation that has an emphasis on high
+	  performance.
+
+	  https://github.com/electronicarts/EASTL
+
+comment "libeastl needs a toolchain w/ C++, gcc >= 4.9"
+	depends on BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libeastl/libeastl.hash b/package/libeastl/libeastl.hash
new file mode 100644
index 0000000000..2d8367c026
--- /dev/null
+++ b/package/libeastl/libeastl.hash
@@ -0,0 +1,2 @@
+sha256 9b3484553812b3ec3bad0857f7f675499c81f7cf4ac87e5f3b2acbe72e3a878a  libeastl-45469730d641868ce05433fff2e199510c7d45c3.tar.gz
+sha256 82c0243a1a62b8af01dab3bce6ed2b0852604bd508b85a561ba7d32480e598e3  LICENSE
diff --git a/package/libeastl/libeastl.mk b/package/libeastl/libeastl.mk
new file mode 100644
index 0000000000..0559dd856d
--- /dev/null
+++ b/package/libeastl/libeastl.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libeastl
+#
+################################################################################
+
+LIBEASTL_VERSION = 45469730d641868ce05433fff2e199510c7d45c3
+LIBEASTL_SITE = $(call github,electronicarts,EASTL,$(LIBEASTL_VERSION))
+LIBEASTL_LICENSE = BSD-3-Clause
+LIBEASTL_LICENSE_FILES = LICENSE
+LIBEASTL_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
