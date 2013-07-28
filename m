From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 15:37:23 +0200
Subject: [Buildroot] [git commit] libiqrf: Bump to v0.1.2 + update build
	system.
Message-ID: <20130728135223.4C6B49ACCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aef9be3eb38ece0169ab1e70c45ea07ff0588288
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

v0.1.2 update build system from autotools to cmake.

[Thomas: add patch to ensure the CMake build system only checks for a
C compiler and not a C++ compiler]

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiqrf/libiqrf-use-only-c-language.patch |   29 +++++++++++++++++++++
 package/libiqrf/libiqrf.mk                        |    4 +-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/package/libiqrf/libiqrf-use-only-c-language.patch b/package/libiqrf/libiqrf-use-only-c-language.patch
new file mode 100644
index 0000000..2f1c23c
--- /dev/null
+++ b/package/libiqrf/libiqrf-use-only-c-language.patch
@@ -0,0 +1,29 @@
+Use only the C language
+
+libirqf is written completely in C, but by default, CMake assumes that
+both C and C++ are used, and therefore verifies that a C++ compiler is
+installed. This may not necessarily be the case for a C-only package
+in Buildroot.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/CMakeLists.txt
+===================================================================
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -1,5 +1,3 @@
+-project(iqrf)
+-
+ set (iqrf_version_major 0)
+ set (iqrf_version_minor 1)
+ set (iqrf_version_patch 2)
+Index: b/CMakeLists.txt
+===================================================================
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,3 +1,5 @@
++project(iqrf C)
++
+ cmake_minimum_required(VERSION 2.8.1)
+ enable_testing()
+ 
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index f2d5b4c..df4bb42 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBIQRF_VERSION = v0.1.0
+LIBIQRF_VERSION = v0.1.2
 LIBIQRF_SITE = http://github.com/nandra/libiqrf/tarball/$(LIBIQRF_VERSION)
 LIBIQRF_INSTALL_STAGING = YES
 
 LIBIQRF_DEPENDENCIES = libusb
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
 
