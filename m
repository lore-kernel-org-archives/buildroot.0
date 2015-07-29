From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Jul 2015 21:42:55 +0200
Subject: [Buildroot] [PATCH 2/3] package/mesa3d: disable broken toolchains
	on nios2
In-Reply-To: <1438198976-25523-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438198976-25523-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1438198976-25523-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d configure triggers the _gp bug:
http://autobuild.buildroot.net/results/8be/8be577dae511f82d45ab3b0a9bba370b81ad2ff9//mesa3d-10.6.1/config.log

/home/test/autobuild/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld: /home/test/autobuild/instance-1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
/home/test/autobuild/instance-1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libgpg-error.so.0: error adding symbols: DSO missing from command line

Fixes
http://autobuild.buildroot.net/results/8be/8be577dae511f82d45ab3b0a9bba370b81ad2ff9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c702d0d..2926c89 100644
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
 
-- 
2.1.4
