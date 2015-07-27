From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 27 Jul 2015 20:51:44 +0100
Subject: [Buildroot] [PATCH 1/1] packages/dmraid: mark as broken on nios2,
	_gp2 issue
Message-ID: <1438026704-13318-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Fixes : http://autobuild.buildroot.net/results/a7e2631d06634d768faf5c1d02712cc9b38562c6/

Investigation of nios2 config.log shows that this is caused by the
"infamous" _gp2 link issue on codesourcery toolchains:

/home/bheading/dev/fix-dmraid/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld: /home/bheading/dev/fix-dmraid/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
/home/bheading/dev/fix-dmraid/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libdevmapper.so.1.02: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status

As with other cases, fixed by disabling this package when
codesourcery toolchains are in use.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 package/dmraid/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 4a8cf61..ec50670 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_DMRAID
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
+	# dmraid triggers the _gp link issue
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -13,4 +16,7 @@ config BR2_PACKAGE_DMRAID
 
 comment "dmraid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	# dmraid triggers the _gp link issue
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.4.3
