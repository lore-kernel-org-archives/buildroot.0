From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 31 Mar 2018 22:57:58 +0200
Subject: [Buildroot] [PATCH] hackrf: new package
Message-ID: <20180331205758.9652-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jason Pruitt <jrspruitt@gmail.com>

This patch adds hackrf/host tools for HackRF, a low cost, open source
Software Defined Radio platform.

Sources of host tools are available on GitHub here:
https://github.com/mossmann/hackrf/tree/master/host

Signed-off-by: Jason Pruitt <jrspruitt@gmail.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
[Arnout:
 - Rename package to hackrf to match upstream name;
 - Reorder dependencies and remove empty line (check-package);
 - Use only sha256 hash;
 - Add hash for license file;
 - Bump to 2018.01.1;
 - Use uploaded tarball rather than github-generated one;
 - Fix dependencies of comment (|| instead of &&)
 - Add UDEV_RULES_GROUP=plugdev in case the build host doesn't have
   this group;
 - Add patch fixing build without C++ compiler.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: Changes by Arnout, see above

Alexey and/or Jason, can you re-test with this version?
---
 package/Config.in                                  |  1 +
 .../hackrf/0001-Don-t-require-a-C-compiler.patch   | 37 ++++++++++++++++++++++
 package/hackrf/Config.in                           | 16 ++++++++++
 package/hackrf/hackrf.hash                         |  3 ++
 package/hackrf/hackrf.mk                           | 26 +++++++++++++++
 5 files changed, 83 insertions(+)
 create mode 100644 package/hackrf/0001-Don-t-require-a-C-compiler.patch
 create mode 100644 package/hackrf/Config.in
 create mode 100644 package/hackrf/hackrf.hash
 create mode 100644 package/hackrf/hackrf.mk

diff --git a/package/Config.in b/package/Config.in
index de10dd0613..f0eee40ca0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1201,6 +1201,7 @@ menu "Hardware handling"
 	source "package/ccid/Config.in"
 	source "package/dtc/Config.in"
 	source "package/gnu-efi/Config.in"
+	source "package/hackrf/Config.in"
 	source "package/hidapi/Config.in"
 	source "package/lcdapi/Config.in"
 	source "package/let-me-create/Config.in"
diff --git a/package/hackrf/0001-Don-t-require-a-C-compiler.patch b/package/hackrf/0001-Don-t-require-a-C-compiler.patch
new file mode 100644
index 0000000000..3369dca670
--- /dev/null
+++ b/package/hackrf/0001-Don-t-require-a-C-compiler.patch
@@ -0,0 +1,37 @@
+From 8b0a8b2be8cf2e4a76c03d3bcdf99bff5025ba22 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Sat, 31 Mar 2018 22:50:37 +0200
+Subject: [PATCH] Don't require a C++ compiler
+
+By default, CMake assumes that the project is using both C and C++.  By
+explicitly passing 'C' as argument of the project() macro, we tell CMake
+that only C is used, which prevents CMake from erroring out if a C++
+compiler doesn't exist.
+
+Upstream status: https://github.com/mossmann/hackrf/pull/469
+
+This patch differs from upstream because:
+- project name upstream has been changed into HackRF;
+- in Buildroot, we are only interested in host, not firmware.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ host/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host/CMakeLists.txt b/host/CMakeLists.txt
+index 874163f..d9cbe31 100644
+--- a/host/CMakeLists.txt
++++ b/host/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ #top dir cmake project for libhackrf + tools
+ 
+ cmake_minimum_required(VERSION 2.8)
+-project (hackrf_all)
++project (hackrf_all C)
+ 
+ add_subdirectory(libhackrf)
+ add_subdirectory(hackrf-tools)
+-- 
+2.16.3
+
diff --git a/package/hackrf/Config.in b/package/hackrf/Config.in
new file mode 100644
index 0000000000..4fa27699c4
--- /dev/null
+++ b/package/hackrf/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_HACKRF
+	bool "hackrf"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Library and tools for accessing HackRF SDR boards.
+
+	  https://github.com/mossmann/hackrf/tree/master/host
+
+comment "hackrf needs a toolchain w/ threads, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "hackrf needs fftw's single precision"
+	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
diff --git a/package/hackrf/hackrf.hash b/package/hackrf/hackrf.hash
new file mode 100644
index 0000000000..c0cf732213
--- /dev/null
+++ b/package/hackrf/hackrf.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a89badc09a1d2fa18367b3b2c974580ad5f6ce93aaa4e54557dc3d013c029d14  hackrf-2018.01.1.tar.xz
+sha256  49b60a6288f90f49074228cc1fae0fb16871ba36b756013abdf7c2fc92f01fad  COPYING
diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
new file mode 100644
index 0000000000..acab0be1d3
--- /dev/null
+++ b/package/hackrf/hackrf.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# hackrf
+#
+################################################################################
+
+HACKRF_VERSION = 2018.01.1
+HACKRF_SITE = https://github.com/mossmann/hackrf/releases/download/v$(HACKRF_VERSION)
+HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
+HACKRF_LICENSE = GPL-2.0+ BSD-3c
+HACKRF_LICENSE_FILES = COPYING
+HACKRF_DEPENDENCIES = fftw libusb
+HACKRF_SUBDIR = host
+HACKRF_INSTALL_STAGING = YES
+
+HACKRF_CONF_OPTS += -DBUILD_HACKRF_TOOLS=ON
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+HACKRF_CONF_OPTS += \
+	-DINSTALL_UDEV_RULES=ON \
+	-DUDEV_RULES_GROUP=plugdev
+else
+HACKRF_CONF_OPTS += -DINSTALL_UDEV_RULES=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.16.3
