From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Oct 2009 16:51:06 +0100
Subject: [Buildroot] [git commit master] lzma: host targets should not be
	user selectable
Message-ID: <20091026155124.83BC577665@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b2dcab30ce5599902d3fc2e48d685fb75dba2127
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead they should get automatically built if needed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    8 ++++----
 package/lzma/Config.in |    7 -------
 package/lzma/lzma.mk   |    5 -----
 scripts/buildall.sh    |    1 -
 4 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/CHANGES b/CHANGES
index f939cfb..b35a121 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,10 +7,10 @@
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
 	libelf, libevent, libglib2, liblockfile, libmad, libnl, libupnp,
-	libuuid, ltrace, lua, mdadm, ncftp, ncurses, netkittelnet, netsnmp,
-	ntfs-3g, openssl, php, python, quagga, radvd, rsync, samba, sawman,
-	shared-mime-info, speech-tools, sqlite, squashfs, syslinux, u-boot,
-	util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
+	libuuid, ltrace, lua, lzma, mdadm, ncftp, ncurses, netkittelnet,
+	netsnmp, ntfs-3g, openssl, php, python, quagga, radvd, rsync, samba,
+	sawman, shared-mime-info, speech-tools, sqlite, squashfs, syslinux,
+	u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
 	xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
index 8d7036c..76c95af 100644
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -8,10 +8,3 @@ config BR2_PACKAGE_LZMA_TARGET
 
 comment "lzma requires a toolchain with C++ support"
         depends on !BR2_GCC_CROSS_CXX
-
-config BR2_PACKAGE_LZMA_HOST
-	bool "Install lzma for the host/build system"
-	help
-	  lzma utils on the host
-
-	  http://tukaani.org/lzma/
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 2de4dcb..ff516fe 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -129,11 +129,6 @@ lzma-dirclean:
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(BR2_PACKAGE_LZMA_HOST),y)
-TARGETS+=lzma-host
-HOST_SOURCE+=lzma-source
-endif
-
 ifeq ($(BR2_PACKAGE_LZMA_TARGET),y)
 TARGETS+=lzma-target
 endif
diff --git a/scripts/buildall.sh b/scripts/buildall.sh
index 3dcd0de..47322c7 100755
--- a/scripts/buildall.sh
+++ b/scripts/buildall.sh
@@ -325,7 +325,6 @@ EXE	mk	xvkbd
 RESTART
 comment	Compressors / decompressors
 EXE	mk	lzo				OK	
-EXE	mk	lzma-host			OK	
 EXE	mk	lzma-target			OK	
 EXE	mk	zlib				OK	
 comment	Package managers
-- 
1.6.3.3
