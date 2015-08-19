From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Aug 2015 23:06:59 +0200
Subject: [Buildroot] [git commit] libselinux: mark as not available on ARC
Message-ID: <20150819210706.6CC598008E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=881845f5fcc7e30654a95ea8a21e574df60980d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libselinux causes some build problems due to the toolchain on ARC,
which haven't been solved so far. As a temporary solution for Buildroot
2015.08, this commit makes libselinux (and its reverse dependencies)
unavailable on ARC. Of course, once the toolchain problem is
addressed, this commit can be reverted to re-enable libselinux on ARC.

Fixes:

   http://autobuild.buildroot.org/results/220/2207f6aad44a6988bf07b02b583b6418ad930dc8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/Config.in     |    1 +
 package/libselinux/Config.in  |    3 +++
 package/libsemanage/Config.in |    2 ++
 package/setools/Config.in     |    5 +++--
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 25f72de..a3a328d 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	select BR2_PACKAGE_LIBSELINUX
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_arc
 	bool "Enable SELinux support"
 	help
 	  Enable SELinux support in BusyBox. Please note that
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index eb892e4..bc8298d 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_PCRE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	# Toolchain issue: "fixup not contained within frag"
+	depends on !BR2_arc
 	help
 	  libselinux is the runtime SELinux library that provides
 	  interfaces (e.g. library functions for the SELinux kernel
@@ -16,4 +18,5 @@ config BR2_PACKAGE_LIBSELINUX
 	  http://selinuxproject.org/page/Main_Page
 
 comment "libselinux needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 78b6315..d9a83c0 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_BZIP2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_arc
 	help
 	  libsemanage is the policy management library. It uses
 	  libsepol for binary policy manipulation and libselinux for
@@ -17,4 +18,5 @@ config BR2_PACKAGE_LIBSEMANAGE
 	  http://selinuxproject.org/page/Main_Page
 
 comment "libsemanage needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/setools/Config.in b/package/setools/Config.in
index 981d64b..046957f 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -10,7 +10,8 @@ config BR2_PACKAGE_SETOOLS
 	# bfin: infamous _ symbol prefix issue
 	# nios2: triggers some toolchain issue "No symbol version
 	# section for versioned symbol"
-	depends on !BR2_nios2 && !BR2_bfin
+	# arc: libselinux not available
+	depends on !BR2_nios2 && !BR2_bfin && !BR2_arc
 	help
 	  SETools is an open source project designed to facilitate
 	  SELinux policy analysis. The primary tools are:
@@ -27,4 +28,4 @@ config BR2_PACKAGE_SETOOLS
 comment "setools needs a toolchain w/ threads, C++, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_nios2 && !BR2_bfin
+	depends on !BR2_nios2 && !BR2_bfin && !BR2_arc
