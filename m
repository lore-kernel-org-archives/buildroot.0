From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:21:47 +0200
Subject: [Buildroot] [git commit] dmraid: exclude nios2 sourcery toolchains,
	_gp issue
Message-ID: <20150727202258.5EE8D81DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb0433e35d6d03c472119357209dff13824d5110
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/a7e2631d06634d768faf5c1d02712cc9b38562c6/

Investigation of nios2 config.log shows that this is caused by the
"infamous" _gp link issue on codesourcery toolchains:

configure:9118: /ssd1/thomas/autobuild/instance-0/output/host/usr/bin/nios2-linux-gnu-gcc -o conftest -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64    conftest.c -ldevmapper-event   >&5
/ssd1/thomas/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld: /ssd1/thomas/autobuild/instance-0/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
/ssd1/thomas/autobuild/instance-0/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libdevmapper.so.1.02: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status

As with other cases, fixed by disabling this package when codesourcery
toolchains are in use.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmraid/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
