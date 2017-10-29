From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 20:55:25 +0100
Subject: [Buildroot] [git commit] lvm2: make basic package available under
	musl
Message-ID: <20171029194837.D3E0F81065@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f71507d41bcb0059efa62a5c6cf787adefea08d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The basic lvm2 package (libdevmapper / dmsetup) does build under musl, only the
standard (full) installation doesn't.

Many setups only need the basic package, so move the !musl dependencies down
to the sub options and adjust the reverse dependencies (cryptsetup/dmraid)
to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Thomas: adjust Config.in comments and dependencies.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptsetup/Config.in |  6 ++----
 package/dmraid/Config.in     |  6 ++----
 package/lvm2/Config.in       | 16 ++++++++++++----
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 5cd4676..d24f7b0 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
-	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_UTIL_LINUX
@@ -14,7 +13,6 @@ config BR2_PACKAGE_CRYPTSETUP
 
 	  https://gitlab.com/cryptsetup/cryptsetup
 
-comment "cryptsetup needs a glibc or uClibc toolchain w/ threads, dynamic library"
+comment "cryptsetup needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index d0acc4f..aa98c85 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_DMRAID
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
-	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays
@@ -13,7 +12,6 @@ config BR2_PACKAGE_DMRAID
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
 
-comment "dmraid needs a glibc or uClibc toolchain w/ threads, dynamic library"
+comment "dmraid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 32c7639..2fa3fc1 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_LVM2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
 	depends on !BR2_STATIC_LIBS # It fails to build statically
-	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and
@@ -27,19 +25,29 @@ if BR2_PACKAGE_LVM2
 
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
+	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
 	help
 	  Install the standard suite of lvm2 programs. When this option
 	  is not set, only dmsetup is installed.
 
+comment "lvm2 standard install needs a glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
+
 config BR2_PACKAGE_LVM2_APP_LIBRARY
 	bool "install application library"
+	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	help
 	  Install application library (liblvm2app).
 
+comment "lvm2 application library needs a glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
+
 endif
 
-comment "lvm2 needs a glibc or uClibc toolchain w/ threads, dynamic library"
+comment "lvm2 needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
