From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Dec 2014 00:42:03 +0100
Subject: [Buildroot] [git commit] libupnp: mark as broken on Nios II,
	infamous _gp issue
Message-ID: <20141230235848.D19AF807DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcebc5bdc0b10b2f373808351fbf30c02164cb67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/bc3/bc32c15ba569e700e401ddf97faba584fc16c4cc/

The real error is in the config.log:

configure:15081: checking for UpnpInit in -lupnp
configure:15106: /home/thomas/projets/buildroot/output/host/usr/bin/nios2-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  c
onftest.c -lupnp  -lpthread -lrt  >&5
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld: /home/thomas/projets/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
/home/thomas/projets/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libthreadutil.so.6: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status
configure:15106: $? = 1
[...]
configure:15125: error: libupnp not found

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnpp/Config.in |    5 +++++
 package/upmpdcli/Config.in |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index 5a48f97..90b6067 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -9,6 +9,9 @@ config BR2_PACKAGE_LIBUPNPP
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
+	# Triggers the _gp link issue
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	help
 	  The libupnpp C++ library wraps libupnp for easier use by upmpdcli and
 	  upplay.
@@ -19,5 +22,7 @@ comment "libupnpp needs a toolchain w/ C++, largefile, threads"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 84649d2..b2925ec 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -8,6 +8,9 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
+	# libupnpp triggers the _gp link issue
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	help
 	  upmpdcli is a UPnP Media Renderer front-end for MPD, the Music
 	  Player Daemon. It supports UPnP gapless track transitions and
@@ -16,5 +19,7 @@ config BR2_PACKAGE_UPMPDCLI
 	  http://www.lesbonscomptes.com/upmpdcli/
 
 comment "upmpdcli needs a toolchain w/ C++, largefile, threads"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
 		!BR2_TOOLCHAIN_HAS_THREADS
