From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 22:50:31 +0200
Subject: [Buildroot] [git commit branch/next] package/mesa3d: disable broken
	toolchains on nios2
Message-ID: <20150808105650.360557FD56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ae18d5814ded710808c75f4c1ad335f5d786119
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

mesa3d configure triggers the _gp bug:
http://autobuild.buildroot.net/results/8be/8be577dae511f82d45ab3b0a9bba370b81ad2ff9//mesa3d-10.6.1/config.log

/home/test/autobuild/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld: /home/test/autobuild/instance-1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
/home/test/autobuild/instance-1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libgpg-error.so.0: error adding symbols: DSO missing from command line

Fixes
http://autobuild.buildroot.net/results/8be/8be577dae511f82d45ab3b0a9bba370b81ad2ff9/

[Thomas: propagate the dependency to mesa3d comment about toolchain
dependencies.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c702d0d..93ae02a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -11,6 +11,9 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	# Triggers the _gp link issue in nios2
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
 
@@ -142,4 +145,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 endif # BR2_PACKAGE_MESA3D
 
 comment "mesa3d needs a toolchain w/ C++, NPTL"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
