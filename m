From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 15:26:59 +0100
Subject: [Buildroot] [git commit] oprofile: needs libpfm4 on powerpc64(le)
Message-ID: <20161218143228.3D36381801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cec7adea4f02425943e3544ddd67c685875189c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

oprofile already needed libpfm4 for PowerPC, but in fact it also needs
it for PowerPC64 and PowerPC64le, so this commit adds a
BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4 hidden option and uses it to decide
if libpfm4 is needed or not.

Fixes:

  http://autobuild.buildroot.net/results/d19caeb445b7040cbd2e4ff62b7db9986e84b6ab/ (powerpc64le)
  http://autobuild.buildroot.net/results/66dd4f7ff635915a506f96d1d8115ac48cca0c6c/ (powerpc64)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/oprofile/Config.in | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index c75ccd9..e2adde5 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -8,17 +8,21 @@ config BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sh || \
 		BR2_sparc || BR2_sparc64 || BR2_x86_64
 
+config BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
+	bool
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+
 config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
-	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
+	select BR2_PACKAGE_LIBPFM4 if BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # binutils
 	depends on BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
 	# libpfm4 is needed on PowerPC, and requires thread support
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_powerpc
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
@@ -40,6 +44,6 @@ comment "oprofile needs a toolchain w/ C++, wchar"
 	depends on BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
-comment "oprofile needs a toolchain w/ NPTL on PPC"
-	depends on BR2_USE_MMU && BR2_powerpc
+comment "oprofile needs a toolchain w/ NPTL on PowerPC(64)"
+	depends on BR2_USE_MMU && BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
