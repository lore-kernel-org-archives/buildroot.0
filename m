From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 23:59:57 +0100
Subject: [Buildroot] [git commit] Config.in files: add missing dependencies
	to toolchain option comments
Message-ID: <20131110230227.F04A09BB31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be084204eb418243d287f16b80290e564411c507
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a package A depends on config option B and toolchain option C, then
the comment that is given when C is not fulfilled should also depend on B.
For example:

config BR2_PACKAGE_A
	depends on BR2_B
	depends on BR2_LARGEFILE
	depends on BR2_WCHAR

comment "A needs a toolchain w/ largefile, wchar"
	depends on !BR2_LARGEFILE || !BR2_WCHAR

This comment should actually be:

comment "A needs a toolchain w/ largefile, wchar"
	depends on BR2_B
	depends on !BR2_LARGEFILE || !BR2_WCHAR

or if possible (typically when B is a package config option declared in that
same Config.in file):

if BR2_B

comment "A needs a toolchain w/ largefile, wchar"
	depends on !BR2_LARGEFILE || !BR2_WCHAR

[other config options depending on B]

endif

Otherwise, the comment would be visible even though the other dependencies
are not met.

This patch adds such missing dependencies, and changes existing such
dependencies from
  depends on BR2_BASE_DEP && !BR2_TOOLCHAIN_USES_GLIBC
to
  depends on BR2_BASE_DEP
  depends on !BR2_TOOLCHAIN_USES_GLIBC
so that (positive) base dependencies are separate from the (negative)
toolchain dependencies. This strategy makes it easier to write such comments
(because one can simply copy the base dependency from the actual package
config option), but also avoids complex and long boolean expressions.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (untested)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/iso9660/Config.in                             |    3 ++-
 linux/Config.ext.in                              |    2 ++
 package/a10disp/Config.in                        |    3 ++-
 package/aiccu/Config.in                          |    1 +
 package/aircrack-ng/Config.in                    |    1 +
 package/alsamixergui/Config.in                   |    3 ++-
 package/avahi/Config.in                          |    1 +
 package/bcusdk/Config.in                         |    1 +
 package/bind/Config.in                           |    1 +
 package/blackbox/Config.in                       |    3 ++-
 package/bluez_utils/Config.in                    |    1 +
 package/bmon/Config.in                           |    1 +
 package/bonnie/Config.in                         |    1 +
 package/bustle/Config.in                         |    1 +
 package/ccid/Config.in                           |    1 +
 package/cdrkit/Config.in                         |    1 +
 package/civetweb/Config.in                       |    1 +
 package/classpath/Config.in                      |    1 +
 package/connman/Config.in                        |    2 +-
 package/conntrack-tools/Config.in                |    1 +
 package/coreutils/Config.in                      |    1 +
 package/cryptsetup/Config.in                     |    1 +
 package/curlftpfs/Config.in                      |    1 +
 package/cvs/Config.in                            |    1 +
 package/czmq/Config.in                           |    2 ++
 package/dbus-glib/Config.in                      |    4 ++--
 package/dbus-python/Config.in                    |    4 ++--
 package/dbus/Config.in                           |    1 +
 package/dmraid/Config.in                         |    1 +
 package/docker/Config.in                         |    4 ++--
 package/dropwatch/Config.in                      |    1 +
 package/dstat/Config.in                          |    1 +
 package/ebtables/Config.in                       |    1 +
 package/efl/libedbus/Config.in                   |    2 ++
 package/enlightenment/Config.in                  |    2 +-
 package/exfat/Config.in                          |    1 +
 package/fdk-aac/Config.in                        |    3 +++
 package/filemq/Config.in                         |    2 ++
 package/findutils/Config.in                      |    1 +
 package/flex/Config.in                           |    6 +++++-
 package/fltk/Config.in                           |    3 ++-
 package/foomatic-filters/Config.in               |    1 +
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |    1 +
 package/gawk/Config.in                           |    1 +
 package/gdb/Config.in                            |    2 ++
 package/gesftpserver/Config.in                   |    1 +
 package/gettext/Config.in                        |    3 ++-
 package/git/Config.in                            |    1 +
 package/gmpc/Config.in                           |    4 ++--
 package/gob2/Config.in                           |    1 +
 package/gpsd/Config.in                           |    1 +
 package/gstreamer/gst-ffmpeg/Config.in           |    1 +
 package/gtest/Config.in                          |    1 +
 package/gutenprint/Config.in                     |    1 +
 package/gvfs/Config.in                           |    1 +
 package/hiawatha/Config.in                       |    1 +
 package/hplip/Config.in                          |    1 +
 package/inotify-tools/Config.in                  |    1 +
 package/iperf/Config.in                          |    1 +
 package/jamvm/Config.in                          |    2 ++
 package/kismet/Config.in                         |    1 +
 package/libdrm/Config.in                         |    3 ++-
 package/libedit/Config.in                        |    1 +
 package/libfslvpuwrap/Config.in                  |    3 ++-
 package/libfuse/Config.in                        |    3 ++-
 package/libgail/Config.in                        |    4 ++--
 package/libglade/Config.in                       |    4 ++--
 package/libgtk2/Config.in                        |    1 +
 package/libnspr/Config.in                        |    1 +
 package/libnss/Config.in                         |    1 +
 package/libtirpc/Config.in                       |    2 ++
 package/libunwind/Config.in                      |    2 ++
 package/liburcu/Config.in                        |    1 +
 package/linknx/Config.in                         |    1 +
 package/linphone/Config.in                       |    1 +
 package/lmbench/Config.in                        |    1 +
 package/logrotate/Config.in                      |    1 +
 package/ltp-testsuite/Config.in                  |    5 +++--
 package/lttng-babeltrace/Config.in               |    4 ++--
 package/lttng-libust/Config.in                   |    4 ++--
 package/lttng-tools/Config.in                    |    1 +
 package/lvm2/Config.in                           |    3 ++-
 package/lxc/Config.in                            |    1 +
 package/lzma/Config.in                           |    3 ++-
 package/m4/Config.in                             |    1 +
 package/midori/Config.in                         |    4 +++-
 package/minicom/Config.in                        |    1 +
 package/minidlna/Config.in                       |    1 +
 package/mongoose/Config.in                       |    1 +
 package/mplayer/Config.in                        |    2 ++
 package/mutt/Config.in                           |    1 +
 package/mysql_client/Config.in                   |    1 +
 package/ndisc6/Config.in                         |    1 +
 package/neard/Config.in                          |    1 +
 package/neardal/Config.in                        |    1 +
 package/netatalk/Config.in                       |    1 +
 package/netkitbase/Config.in                     |    3 ++-
 package/netkittelnet/Config.in                   |    1 +
 package/network-manager/Config.in                |    1 +
 package/nfs-utils/Config.in                      |    1 +
 package/nmap/Config.in                           |    1 +
 package/nodejs/Config.in                         |    3 +++
 package/ntfs-3g/Config.in                        |    1 +
 package/numactl/Config.in                        |    2 ++
 package/ofono/Config.in                          |    1 +
 package/olsr/Config.in                           |    1 +
 package/on2-8170-modules/Config.in               |    1 +
 package/openobex/Config.in                       |    1 +
 package/openpowerlink/Config.in                  |    1 +
 package/openvpn/Config.in                        |    1 +
 package/oprofile/Config.in                       |    1 +
 package/p11-kit/Config.in                        |    1 +
 package/parted/Config.in                         |    3 ++-
 package/pcmanfm/Config.in                        |    4 ++--
 package/pcsc-lite/Config.in                      |    1 +
 package/php/Config.ext                           |    1 +
 package/pkg-config/Config.in                     |    3 ++-
 package/python-nfc/Config.in                     |    1 +
 package/python-pyzmq/Config.in                   |    1 +
 package/python/Config.in                         |    1 +
 package/python3/Config.in                        |    1 +
 package/qt/Config.in                             |    2 ++
 package/qt5/Config.in                            |    1 +
 package/quagga/Config.in                         |    2 +-
 package/quota/Config.in                          |    1 +
 package/radvd/Config.in                          |    1 +
 package/redis/Config.in                          |    1 +
 package/rpcbind/Config.in                        |    2 ++
 package/rpi-userland/Config.in                   |    1 +
 package/rt-tests/Config.in                       |    1 +
 package/rtorrent/Config.in                       |    1 +
 package/samba/Config.in                          |    2 ++
 package/ser2net/Config.in                        |    1 +
 package/smartmontools/Config.in                  |    1 +
 package/snowball-init/Config.in                  |    4 ++--
 package/socat/Config.in                          |    1 +
 package/socketcand/Config.in                     |    1 +
 package/sqlcipher/Config.in                      |    7 +++++--
 package/squashfs3/Config.in                      |    3 ++-
 package/squid/Config.in                          |    1 +
 package/sshfs/Config.in                          |    1 +
 package/synergy/Config.in                        |    3 ++-
 package/sysprof/Config.in                        |    3 ++-
 package/systemd/Config.in                        |    1 +
 package/transmission/Config.in                   |    1 +
 package/tvheadend/Config.in                      |    3 ++-
 package/udisks/Config.in                         |    1 +
 package/udpcast/Config.in                        |    1 +
 package/unionfs/Config.in                        |    1 +
 package/ussp-push/Config.in                      |    1 +
 package/vala/Config.in                           |    3 ++-
 package/webkit/Config.in                         |    2 ++
 package/webrtc-audio-processing/Config.in        |    1 +
 package/wget/Config.in                           |    1 +
 package/wireshark/Config.in                      |    1 +
 package/wvdial/Config.in                         |    1 +
 package/wvstreams/Config.in                      |    1 +
 package/xenomai/Config.in                        |    2 ++
 package/xscreensaver/Config.in                   |    1 +
 package/zmqpp/Config.in                          |    8 ++++++--
 package/zyre/Config.in                           |    2 ++
 system/Config.in                                 |    1 +
 162 files changed, 228 insertions(+), 50 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 98ff78b..90c3998 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -13,4 +13,5 @@ config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	default "fs/iso9660/menu.lst"
 
 comment "iso image requires a Linux kernel to be built"
-	depends on (BR2_i386 || BR2_x86_64) && !BR2_LINUX_KERNEL
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_LINUX_KERNEL
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index b93f63e..2b0092a 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -17,6 +17,8 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI
 	  PowerPC, 2.6.35.7, 2.6.36.4, 3.0.8.
 
 comment "xenomai needs a toolchain w/ threads"
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
+		   BR2_bfin || BR2_powerpc || BR2_sh4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
diff --git a/package/a10disp/Config.in b/package/a10disp/Config.in
index b4edf31..fd350b2 100644
--- a/package/a10disp/Config.in
+++ b/package/a10disp/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_A10DISP
 	  http://github.com/hglm/a10disp
 
 comment "a10disp requires the linux kernel"
-	depends on BR2_arm && !BR2_LINUX_KERNEL
+	depends on BR2_arm
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index e044540..f56ad75 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -20,4 +20,5 @@ config BR2_PACKAGE_AICCU
 	  http://www.sixxs.net/tools/aiccu/
 
 comment "aiccu needs a toolchain w/ IPv6, wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index ede1ca5..0c03456 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -11,5 +11,6 @@ config BR2_PACKAGE_AIRCRACK_NG
 	  http://www.aircrack-ng.org/
 
 comment "aircrack-ng needs a toolchain w/ largefile, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index b1b9eb9..5b61f38 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -14,4 +14,5 @@ config BR2_PACKAGE_ALSAMIXERGUI
 	  http://www.iua.upf.es/~mdeboer/projects/alsamixergui/
 
 comment "alsamixergui needs a toolchain w/ C++, threads"
-	depends on (!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS) && BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 4411fe3..fd4d229 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -37,4 +37,5 @@ config BR2_PACKAGE_AVAHI_DAEMON
 endif
 
 comment "avahi needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
index a64a2bf..658c592 100644
--- a/package/bcusdk/Config.in
+++ b/package/bcusdk/Config.in
@@ -20,4 +20,5 @@ config BR2_PACKAGE_BCUSDK
 	  http://www.auto.tuwien.ac.at/~mkoegler/eib/
 
 comment "bcusdk needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bind/Config.in b/package/bind/Config.in
index 08af624..047f682 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -40,4 +40,5 @@ config BR2_PACKAGE_BIND_TOOLS
 endif
 
 comment "bind needs a toolchain w/ largefile, IPv6"
+	depends on BR2_USE_MMU
 	depends on !(BR2_LARGEFILE || BR2_INET_IPV6)
diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
index 54f8218..e908655 100644
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -12,4 +12,5 @@ config BR2_PACKAGE_BLACKBOX
 	  http://blackboxwm.sourceforge.net/
 
 comment "blackbox needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 33fcbd6..b6f65b4 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -39,4 +39,5 @@ config BR2_PACKAGE_BLUEZ_UTILS_USB
 endif
 
 comment "bluez-utils needs a toolchain w/ wchar, threads"
+	depends on !BR2_avr32 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bmon/Config.in b/package/bmon/Config.in
index a4abd92..9f0dfa7 100644
--- a/package/bmon/Config.in
+++ b/package/bmon/Config.in
@@ -6,4 +6,5 @@ config BR2_PACKAGE_BMON
 	  Linux bandwidth monitor
 
 comment "bmon needs a toolchain w/ IPv6"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6
diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
index 3575bc1..6dbd06d 100644
--- a/package/bonnie/Config.in
+++ b/package/bonnie/Config.in
@@ -8,4 +8,5 @@ config BR2_PACKAGE_BONNIE
 	  http://www.coker.com.au/bonnie++/
 
 comment "bonnie++ needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bustle/Config.in b/package/bustle/Config.in
index 6799f1f..7be3222 100644
--- a/package/bustle/Config.in
+++ b/package/bustle/Config.in
@@ -20,4 +20,5 @@ config BR2_PACKAGE_BUSTLE
 	  http://www.willthompson.co.uk/bustle/
 
 comment "bustle needs a toolchain w/ wchar, threads"
+	depends on BR2_PACKAGE_DBUS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index 9f8efca..e960986 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_CCID
 	  http://pcsclite.alioth.debian.org/ccid.html
 
 comment "ccid needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index b2cd785..9ba5dbf 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -13,4 +13,5 @@ config BR2_PACKAGE_CDRKIT
 	  http://www.cdrkit.org/
 
 comment "cdrkit needs a toolchain w/ largefile"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE
diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
index 86e8242..33f4ef1 100644
--- a/package/civetweb/Config.in
+++ b/package/civetweb/Config.in
@@ -24,4 +24,5 @@ comment "Lua support needs a toolchain w/ largefile"
 endif
 
 comment "civetweb needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/classpath/Config.in b/package/classpath/Config.in
index 7aa93a0..0153bca 100644
--- a/package/classpath/Config.in
+++ b/package/classpath/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_CLASSPATH
 	  http://classpath.org
 
 comment "classpath needs a toolchain w/ IPv6"
+	depends on BR2_PACKAGE_JAMVM
 	depends on !BR2_INET_IPV6
diff --git a/package/connman/Config.in b/package/connman/Config.in
index c8b640f..5345c80 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -51,6 +51,6 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 endif # BR2_PACKAGE_CONNMAN
 
 comment "connman needs a toolchain w/ IPv6, wchar, threads, resolver"
-	depends on !BR2_avr32
+	depends on BR2_USE_MMU && !BR2_avr32
 	depends on BR2_UCLIBC_VERSION_0_9_32 || \
 		!BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index 5a9d0ea..ec19d8e 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 	  http://www.netfilter.org/projects/conntrack-tools/
 
 comment "conntrack-tools needs a toolchain w/ IPv6, largefile, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6 || \
 		!BR2_LARGEFILE || \
 		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index 206b85a..152ad14 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -15,4 +15,5 @@ config BR2_PACKAGE_COREUTILS
 	  http://www.gnu.org/software/coreutils/
 
 comment "coreutils needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 3b9ba54..7b0e7ca 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -15,4 +15,5 @@ config BR2_PACKAGE_CRYPTSETUP
 	  https://code.google.com/p/cryptsetup/
 
 comment "cryptsetup needs a toolchain w/ largefile, wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index 4c5ab8a..90763d7 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -18,4 +18,5 @@ config BR2_PACKAGE_CURLFTPFS
 	  http://curlftpfs.sourceforge.net/
 
 comment "curlftpfs needs a toolchain w/ largefile, wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/cvs/Config.in b/package/cvs/Config.in
index 65829d0..6a8b037 100644
--- a/package/cvs/Config.in
+++ b/package/cvs/Config.in
@@ -16,4 +16,5 @@ config BR2_PACKAGE_CVS_SERVER
 	  Enable cvs server code
 
 comment "cvs needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index d442293..2933368 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -16,5 +16,7 @@ config BR2_PACKAGE_CZMQ
 	  http://czmq.zeromq.org/
 
 comment "czmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
index ea8c3f2..4d13f77 100644
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_DBUS_GLIB
 	  http://www.freedesktop.org/software/dbus
 
 comment "dbus-glib needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_DBUS && \
-		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
+	depends on BR2_PACKAGE_DBUS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index 113ca68..f7b6d94 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_DBUS_PYTHON
 	  http://dbus.freedesktop.org/doc/dbus-python/
 
 comment "dbus-python needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON && \
-		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
+	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 3cb47b8..9c9e3f8 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -28,4 +28,5 @@ choice
 endchoice
 
 comment "dbus needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index b7159d9..028b46c 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_DMRAID
 	  respective mappings for the ATARAID sets discovered.
 
 comment "dmraid needs a toolchain w/ largefile"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE
diff --git a/package/docker/Config.in b/package/docker/Config.in
index fa89757..b9feec0 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_DOCKER
 	  http://icculus.org/openbox/2/docker
 
 comment "docker needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_XORG7 && \
-		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index 68dab20..ac0cc3e 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -12,4 +12,5 @@ config BR2_PACKAGE_DROPWATCH
 	  https://fedorahosted.org/dropwatch/
 
 comment "dropwatch needs a toolchain w/ threads"
+	depends on !BR2_aarch64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index b5edfae..62a392a 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -21,4 +21,5 @@ config BR2_PACKAGE_DSTAT
 	  http://dag.wieers.com/home-made/dstat/
 
 comment "dstat needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 24f39ac..3a678ad 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -8,4 +8,5 @@ config BR2_PACKAGE_EBTABLES
 	  http://ebtables.sourceforge.net
 
 comment "ebtables needs a toolchain w/ IPv6"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 500e837..783a54e 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	  Bluetooth support.
 
 comment "bluez support needs a toolchain w/ wchar, threads"
+	depends on !BR2_avr32
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LIBEDBUS_CONNMAN
@@ -40,4 +41,5 @@ config BR2_PACKAGE_LIBEDBUS_NOTIFY
 endif
 
 comment "libedbus needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 5df817b..66c7055 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -37,6 +37,6 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	  http://www.enlightenment.org/
 
 comment "enlightenment needs a toolchain w/ wchar, C++, threads"
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_avr32
diff --git a/package/exfat/Config.in b/package/exfat/Config.in
index 5995f0c..92e6c38 100644
--- a/package/exfat/Config.in
+++ b/package/exfat/Config.in
@@ -13,4 +13,5 @@ config BR2_PACKAGE_EXFAT
 	  http://code.google.com/p/exfat/
 
 comment "exfat needs a toolchain w/ largefile, wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
index 54d53a0..1ec59e1 100644
--- a/package/fdk-aac/Config.in
+++ b/package/fdk-aac/Config.in
@@ -15,3 +15,6 @@ config BR2_PACKAGE_FDK_AAC
 
 comment "fdk-aac needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
+		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		   BR2_powerpc || BR2_sh || BR2_sh64
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index 9965aa3..b7b085d 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -18,5 +18,7 @@ config BR2_PACKAGE_FILEMQ
 	  http://github.com/zeromq/filemq
 
 comment "filemq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/findutils/Config.in b/package/findutils/Config.in
index b95f1cb..b719d4f 100644
--- a/package/findutils/Config.in
+++ b/package/findutils/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_FINDUTILS
 	  http://www.gnu.org/software/findutils/findutils.html
 
 comment "findutils needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/flex/Config.in b/package/flex/Config.in
index be6140b..52f7fe7 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -7,11 +7,12 @@ config BR2_PACKAGE_FLEX
 
 	  http://flex.sourceforge.net/
 
+if BR2_PACKAGE_FLEX
+
 config BR2_PACKAGE_FLEX_BINARY
 	bool "Install tool in the target"
 	# needs fork()
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_FLEX
 	# runtime dependency
 	select BR2_PACKAGE_M4
 	depends on BR2_USE_WCHAR # m4
@@ -19,4 +20,7 @@ config BR2_PACKAGE_FLEX_BINARY
 	  Install the flex binary tool in the target filesystem.
 
 comment "flex binary needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
+
+endif
diff --git a/package/fltk/Config.in b/package/fltk/Config.in
index 587fcc1..8e9977a 100644
--- a/package/fltk/Config.in
+++ b/package/fltk/Config.in
@@ -15,4 +15,5 @@ config BR2_PACKAGE_FLTK
 	  http://www.fltk.org/
 
 comment "fltk needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU && BR2_PACKAGE_XORG7
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/foomatic-filters/Config.in b/package/foomatic-filters/Config.in
index 3d34f13..377566e 100644
--- a/package/foomatic-filters/Config.in
+++ b/package/foomatic-filters/Config.in
@@ -1,4 +1,5 @@
 comment "foomatic-filters needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_CUPS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_FOOMATIC_FILTERS
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index 1a6e245..244bebb 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -1,4 +1,5 @@
 comment "gpu-viv-bin-mx6q needs an (e)glibc toolchain"
+	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index a1c632f..31b97fa 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_GAWK
 	  http://www.gnu.org/software/gawk/
 
 comment "gawk needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index de98d3d..5776a97 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -1,4 +1,5 @@
 comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
+	depends on !BR2_aarch64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 
 config BR2_PACKAGE_GDB
@@ -42,6 +43,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin
 
 comment "full gdb on target needs a toolchain w/ wchar"
+	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin
 	depends on !BR2_USE_WCHAR
 
 endif
diff --git a/package/gesftpserver/Config.in b/package/gesftpserver/Config.in
index a15d98a..81cbce9 100644
--- a/package/gesftpserver/Config.in
+++ b/package/gesftpserver/Config.in
@@ -14,4 +14,5 @@ config BR2_PACKAGE_GESFTPSERVER
 	  http://www.greenend.org.uk/rjk/sftpserver/
 
 comment "gesftpserver needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 8e4f594..305c5a5 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -25,4 +25,5 @@ config BR2_PACKAGE_GETTEXT_TOOLS
 	  correct operation of programs.
 
 comment "gettext needs a toolchain w/ wchar"
-	depends on BR2_NEEDS_GETTEXT && !BR2_USE_WCHAR
+	depends on BR2_NEEDS_GETTEXT
+	depends on !BR2_USE_WCHAR
diff --git a/package/git/Config.in b/package/git/Config.in
index 5a3e16a..66c66c7 100644
--- a/package/git/Config.in
+++ b/package/git/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_GIT
 	  http://git-scm.com
 
 comment "git needs a toolchain w/ largefile"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 7e05905..0d5f0dc 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -21,5 +21,5 @@ config BR2_PACKAGE_GMPC
 	  http://gmpcwiki.sarine.nl/index.php?title=GMPC
 
 comment "gmpc needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_XORG7 && BR2_PACKAGE_LIBGTK2
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index ee4d3b5..8e930fa 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -14,4 +14,5 @@ config BR2_PACKAGE_GOB2
 	  http://www.jirka.org/gob.html
 
 comment "gob2 needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index d1a55eb..5b007d7 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -1,4 +1,5 @@
 comment "gpsd needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GPSD
diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index 72b98b8..1d6a707 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -14,4 +14,5 @@ config BR2_PACKAGE_GST_FFMPEG
 	  http://gstreamer.freedesktop.org/
 
 comment "gst-ffmpeg needs a toolchain w/ largefile, IPv6"
+	depends on BR2_PACKAGE_GSTREAMER
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index 883cf97..c07f13b 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -22,4 +22,5 @@ config BR2_PACKAGE_GTEST
 	  http://code.google.com/p/googletest/
 
 comment "gtest needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gutenprint/Config.in b/package/gutenprint/Config.in
index a53bbee..f93717c 100644
--- a/package/gutenprint/Config.in
+++ b/package/gutenprint/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_GUTENPRINT
 	  http://gimp-print.sourceforge.net/
 
 comment "gutenprint needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_CUPS
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 17827bf..71e8497 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -17,4 +17,5 @@ config BR2_PACKAGE_GVFS
 	  http://en.wikipedia.org/wiki/GVFS
 
 comment "gvfs needs a toolchain w/ largefile, wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index b5f73e0..5333697 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -1,4 +1,5 @@
 comment "hiawatha needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_HIAWATHA
diff --git a/package/hplip/Config.in b/package/hplip/Config.in
index 4670400..7565671 100644
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -16,4 +16,5 @@ config BR2_PACKAGE_HPLIP
 	  http://hplipopensource.com/
 
 comment "hplip needs a toolchain w/ C++, threads"
+	depends on BR2_PACKAGE_CUPS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/inotify-tools/Config.in b/package/inotify-tools/Config.in
index 443c922..4d64b73 100644
--- a/package/inotify-tools/Config.in
+++ b/package/inotify-tools/Config.in
@@ -12,4 +12,5 @@ config BR2_PACKAGE_INOTIFY_TOOLS
 	  https://github.com/rvoicilas/inotify-tools
 
 comment "inotify-tools needs a toolchain w/ largefile"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE
diff --git a/package/iperf/Config.in b/package/iperf/Config.in
index ad6332f..86dd3e9 100644
--- a/package/iperf/Config.in
+++ b/package/iperf/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_IPERF
 	  http://dast.nlanr.net/projects/iperf/
 
 comment "iperf needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
index 7a899d6..dbd0fbb 100644
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -12,4 +12,6 @@ config BR2_PACKAGE_JAMVM
 	  http://jamvm.sf.net
 
 comment "jamvm needs a toolchain w/ IPv6"
+	depends on BR2_arm || BR2_armeb || BR2_i386 \
+		|| BR2_mipsel || BR2_powerpc || BR2_x86_64
 	depends on !BR2_INET_IPV6
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 8625a8e..fc9103d 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,4 +1,5 @@
 comment "kismet needs a toolchain w/ threads, C++"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_KISMET
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index d7c74eb..205f47c 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -65,4 +65,5 @@ endmenu
 endif
 
 comment "libdrm needs a toolchain w/ largefile"
-	depends on BR2_PACKAGE_XORG7 && !BR2_LARGEFILE
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_LARGEFILE
diff --git a/package/libedit/Config.in b/package/libedit/Config.in
index 683eb6b..a70f9eb 100644
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -16,4 +16,5 @@ config BR2_PACKAGE_LIBEDIT
 	  http://www.thrysoee.dk/editline/
 
 comment "libedit needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/libfslvpuwrap/Config.in b/package/libfslvpuwrap/Config.in
index 57b8a02..a60f8ef 100644
--- a/package/libfslvpuwrap/Config.in
+++ b/package/libfslvpuwrap/Config.in
@@ -1,5 +1,6 @@
 comment "libfslvpuwrap needs an imx-specific kernel to be built"
-	depends on BR2_arm && !BR2_LINUX_KERNEL
+	depends on BR2_arm
+	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_LIBFSLVPUWRAP
 	bool "libfslvpuwrap"
diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
index 345b63d..5561d9d 100644
--- a/package/libfuse/Config.in
+++ b/package/libfuse/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_LIBFUSE
 	  http://fuse.sourceforge.net/
 
 comment "libfuse needs a toolchain w/ largefile, threads, dynamic library"
-        depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index 7142d28..4335bef 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -20,5 +20,5 @@ config BR2_PACKAGE_LIBGAIL
 	  http://developer.gnome.org/projects/gap
 
 comment "libgail needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_LIBGTK2 && \
-		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
+	depends on BR2_PACKAGE_LIBGTK2
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index 47a44ca..774c765 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -14,5 +14,5 @@ config BR2_PACKAGE_LIBGLADE
 	  http://ftp.gnome.org/pub/GNOME/sources/libglade/
 
 comment "libglade needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_LIBGTK2 && \
-		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
+	depends on BR2_PACKAGE_LIBGTK2
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 47f55b7..1dc8f2e 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -32,5 +32,6 @@ config BR2_PACKAGE_LIBGTK2_DEMO
 endif
 
 comment "libgtk2 needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index eb8625f..4ef3a51 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -12,4 +12,5 @@ config BR2_PACKAGE_LIBNSPR
 	  http://www.mozilla.org/projects/nspr/
 
 comment "libnspr needs a toolchain w/ largefile, threads"
+	depends on !BR2_arc
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index b12d4e7..88b1fde 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -16,5 +16,6 @@ config BR2_PACKAGE_LIBNSS
 	  http://www.mozilla.org/projects/security/pki/nss/
 
 comment "libnss needs a toolchain w/ largefile, threads"
+	depends on !BR2_arc
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index dc8f095..a6759e7 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -15,4 +15,6 @@ config BR2_PACKAGE_LIBTIRPC
 	  http://sourceforge.net/projects/libtirpc/
 
 comment "libtirpc needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 3849c13..9b55826 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -9,4 +9,6 @@ config BR2_PACKAGE_LIBUNWIND
 	  http://www.nongnu.org/libunwind/index.html
 
 comment "libunwind needs a toolchain w/ threads"
+	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
+		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 67347dc..de53495 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -11,5 +11,6 @@ config BR2_PACKAGE_LIBURCU
 	  http://lttng.org/urcu
 
 comment "liburcu needs a toolchain w/ threads"
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index c1a6d3b..6a26c20 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_LINKNX
 	  http://linknx.sourceforge.net/
 
 comment "linknx needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index 36a0405..72eca7d 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -27,5 +27,6 @@ config BR2_PACKAGE_LINPHONE
 	  http://www.linphone.org/
 
 comment "linphone needs a toolchain w/ threads, C++, IPv6"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INET_IPV6
diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index 2c14dc8..c4ea522 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_LMBENCH
 	  http://sourceforge.net/projects/lmbench/
 
 comment "lmbench needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 376ce5e..07a2da5 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -9,5 +9,6 @@ config BR2_PACKAGE_LOGROTATE
 	  https://fedorahosted.org/logrotate/
 
 comment "logrotate needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 5ebcdee..0883c8f 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -24,5 +24,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	  http://ltp.sourceforge.net/
 
 comment "ltp-testsuite needs a toolchain w/ IPv6, RPC, largefile, threads"
-	depends on (!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
-		!BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_NATIVE_RPC) && !BR2_aarch64
+	depends on !BR2_aarch64
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
+		!BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 40079b4..f1e341d 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -28,5 +28,5 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	  http://lttng.org
 
 comment "lttng-babeltrace needs a toolchain w/ wchar, threads, largefile"
-	depends on BR2_PACKAGE_LTTNG_TOOLS && \
-		(!BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS)
+	depends on BR2_PACKAGE_LTTNG_TOOLS
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 49e09d5..5e1a6d4 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	  http://lttng.org
 
 comment "lttng-libust needs a toolchain w/ wchar, largefile, threads"
-	depends on !(BR2_USE_WCHAR || BR2_LARGEFILE)
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 85598b8..1e9e0c3 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -28,5 +28,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	  http://lttng.org
 
 comment "lttng-tools needs a toolchain w/ largefile, threads, wchar"
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index a8da42d..b3988ea 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -30,4 +30,5 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 	  Install application library (liblvm2app).
 
 comment "lvm2 needs a toolchain w/ largefile"
-        depends on !BR2_LARGEFILE
+	depends on BR2_USE_MMU
+	depends on !BR2_LARGEFILE
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index f8c1fb9..3afb5b6 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -12,4 +12,5 @@ config BR2_PACKAGE_LXC
 	  http://lxc.sourceforge.net/
 
 comment "lxc needs a toolchain w/ IPv6, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
index 61fdbfe..5a55103 100644
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_LZMA
 	  http://tukaani.org/lzma/
 
 comment "lzma needs a toolchain w/ C++"
-        depends on !BR2_INSTALL_LIBSTDCPP && BR2_DEPRECATED
+	depends on BR2_DEPRECATED
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/m4/Config.in b/package/m4/Config.in
index 2adeaf3..4d651a2 100644
--- a/package/m4/Config.in
+++ b/package/m4/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_M4
 	  http://www.gnu.org/software/m4/m4.html
 
 comment "m4 needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/midori/Config.in b/package/midori/Config.in
index d0c8aab..a684376 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -16,5 +16,7 @@ config BR2_PACKAGE_MIDORI
 	  http://software.twotoasts.de/?page=midori
 
 comment "midori needs libgtk2 and a toolchain w/ C++, wchar, threads"
-        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
+		    BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64)
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_LIBGTK2
diff --git a/package/minicom/Config.in b/package/minicom/Config.in
index f40fe79..07dbeba 100644
--- a/package/minicom/Config.in
+++ b/package/minicom/Config.in
@@ -12,4 +12,5 @@ config BR2_PACKAGE_MINICOM
 	  http://alioth.debian.org/projects/minicom
 
 comment "minicom needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 3f2bcb5..1fcecde 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -19,4 +19,5 @@ config BR2_PACKAGE_MINIDLNA
 	  http://minidlna.sourceforge.net/
 
 comment "minidlna needs a toolchain w/ largefile, IPv6, threads"
+	depends on BR2_USE_MMU
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
index 7c99f7e..35723de 100644
--- a/package/mongoose/Config.in
+++ b/package/mongoose/Config.in
@@ -8,4 +8,5 @@ config BR2_PACKAGE_MONGOOSE
 	  https://github.com/valenok/mongoose
 
 comment "mongoose needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index b930cb5..3a1b428 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -29,4 +29,6 @@ config BR2_PACKAGE_MPLAYER_MENCODER
 endif
 
 comment "mplayer needs a toolchain w/ largefile"
+	depends on !(BR2_sh2 || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+			|| BR2_microblaze || BR2_aarch64)
 	depends on !BR2_LARGEFILE
diff --git a/package/mutt/Config.in b/package/mutt/Config.in
index 76223bd..430eeb8 100644
--- a/package/mutt/Config.in
+++ b/package/mutt/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_MUTT
 	  http://www.mutt.org/
 
 comment "mutt needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/mysql_client/Config.in b/package/mysql_client/Config.in
index 2f1a2b9..543bed1 100644
--- a/package/mysql_client/Config.in
+++ b/package/mysql_client/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_MYSQL_CLIENT
 	  MySQL client
 
 comment "MySQL client needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
index 2e6d62c..0fad92a 100644
--- a/package/ndisc6/Config.in
+++ b/package/ndisc6/Config.in
@@ -1,4 +1,5 @@
 comment "ndisc6 needs a toolchain w/ IPv6"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6
 
 config BR2_PACKAGE_NDISC6
diff --git a/package/neard/Config.in b/package/neard/Config.in
index dcb5c15..81bb61e 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -24,4 +24,5 @@ config BR2_PACKAGE_NEARD_TOOLS
 endif
 
 comment "neard needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/neardal/Config.in b/package/neardal/Config.in
index e1237e6..0e87171 100644
--- a/package/neardal/Config.in
+++ b/package/neardal/Config.in
@@ -21,4 +21,5 @@ config BR2_PACKAGE_NEARDAL_NCL
 endif
 
 comment "neardal needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index 371832f..cdb2039 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -14,4 +14,5 @@ config BR2_PACKAGE_NETATALK
 	  http://netatalk.sourceforge.net/
 
 comment "netatalk needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
index 793fdaa..49d3b2e 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_NETKITBASE
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
 comment "netkitbase needs a toolchain w/ RPC"
-        depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_USE_MMU && BR2_DEPRECATED
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
index b0229b3..da1b245 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_NETKITTELNET
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
 comment "netkittelnet needs a toolchain w/ RPC"
+	depends on BR2_DEPRECATED
 	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index f39293c..1e2a876 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -28,5 +28,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	  http://projects.gnome.org/NetworkManager/
 
 comment "NetworkManager needs a toolchain w/ IPv6, largefile, wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index fcb0247..3602a74 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_NFS_UTILS
 	  http://sourceforge.net/projects/nfs
 
 comment "nfs-utils needs a toolchain w/ largefile, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || \
 		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index 9707d36..2364dac 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -13,4 +13,5 @@ config BR2_PACKAGE_NMAP
 	  http://nmap.org
 
 comment "nmap needs a toolchain w/ C++, IPv6, threads"
+	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5368105..0258460 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -15,6 +15,9 @@ config BR2_PACKAGE_NODEJS
 	  http://nodejs.org/
 
 comment "nodejs needs a toolchain w/ C++, IPv6, largefile, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_arm || BR2_i386 || BR2_x86_64
+	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
 
diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index 5214295..0510c12 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -31,4 +31,5 @@ config BR2_PACKAGE_NTFS_3G_NTFSPROGS
 endif
 
 comment "ntfs-3g needs a toolchain w/ largefile, wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/numactl/Config.in b/package/numactl/Config.in
index b1c40e0..0976de2 100644
--- a/package/numactl/Config.in
+++ b/package/numactl/Config.in
@@ -13,4 +13,6 @@ config BR2_PACKAGE_NUMACTL
 	  http://oss.sgi.com/projects/libnuma/
 
 comment "numactl needs a toolchain w/ largefile"
+	depends on BR2_i386 || BR2_mips || BR2_mipsel || \
+		   BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
 	depends on !BR2_LARGEFILE
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 3096289..c431e08 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -15,4 +15,5 @@ config BR2_PACKAGE_OFONO
 	  http://ofono.org/
 
 comment "ofono needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index 4c98bd7..0090643 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -14,4 +14,5 @@ config BR2_PACKAGE_OLSR
 	  http://www.olsr.org/
 
 comment "olsr needs a toolchain w/ IPv6, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/on2-8170-modules/Config.in b/package/on2-8170-modules/Config.in
index 18c066e..58ee88f 100644
--- a/package/on2-8170-modules/Config.in
+++ b/package/on2-8170-modules/Config.in
@@ -8,4 +8,5 @@ config BR2_PACKAGE_ON2_8170_MODULES
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
 
 comment "on2-8170 modules requires a linux kernel to be built"
+	depends on BR2_arm926t
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index 4bd4dbb..9b9d2f9 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_OPENOBEX_BLUEZ
 	select BR2_PACKAGE_BLUEZ_UTILS
 
 comment "bluez support needs a toolchain w/ wchar, threads"
+	depends on !BR2_avr32 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_OPENOBEX_LIBUSB
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index 8229032..cdb09a2 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -1,4 +1,5 @@
 comment "openpowerlink needs a toolchain w/ C++, threads"
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_OPENPOWERLINK
diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index e6bf880..4a5e0ea 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,4 +1,5 @@
 comment "openvpn needs a toolchain w/ IPv6"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6
 
 config BR2_PACKAGE_OPENVPN
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index d1adca3..2847a91 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -23,4 +23,5 @@ config BR2_PACKAGE_OPROFILE
 	  libraries, and applications.
 
 comment "oprofile needs a toolchain w/ C++"
+	depends on BR2_USE_MMU && !BR2_aarch64
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/p11-kit/Config.in b/package/p11-kit/Config.in
index 7f4f865..8d0cf38 100644
--- a/package/p11-kit/Config.in
+++ b/package/p11-kit/Config.in
@@ -12,4 +12,5 @@ config BR2_PACKAGE_P11_KIT
 	  http://p11-glue.freedesktop.org/p11-kit.html
 
 comment "p11-kit needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/parted/Config.in b/package/parted/Config.in
index 38b41e3..8af2693 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -13,4 +13,5 @@ config BR2_PACKAGE_PARTED
 	  http://www.gnu.org/software/parted/
 
 comment "parted needs a toolchain w/ largefile, wchar"
-        depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+	depends on BR2_USE_MMU
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 635aa61..f6a3984 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -14,5 +14,5 @@ config BR2_PACKAGE_PCMANFM
 	  http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 
 comment "pcmanfm needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_XORG7 && \
-	(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
+	depends on BR2_PACKAGE_XORG7 && BR2_PACKAGE_LIBGTK2
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index 87139d9..4cd89e9 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -29,4 +29,5 @@ config BR2_PACKAGE_PCSC_LITE_EMBEDDED
 endif
 
 comment "pcsc-lite needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 4e0d0e6..c0c85f1 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -138,6 +138,7 @@ config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	  PDO driver for MySQL
 
 comment "MySQL drivers need a toolchain w/ C++"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
index 6b560e1..4a03e75 100644
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -13,4 +13,5 @@ config BR2_PACKAGE_PKG_CONFIG
 	  http://www.freedesktop.org/software/pkgconfig/
 
 comment "pkg-config needs a toolchain w/ wchar, threads"
-	depends on BR2_DEPRECATED && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
+	depends on BR2_DEPRECATED
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-nfc/Config.in b/package/python-nfc/Config.in
index c63e791..9a8102c 100644
--- a/package/python-nfc/Config.in
+++ b/package/python-nfc/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_PYTHON_NFC
 	  https://launchpad.net/nfcpy
 
 comment "python-nfc needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
index 6191ac1..b83c09c 100644
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -13,5 +13,6 @@ config BR2_PACKAGE_PYTHON_PYZMQ
 	  http://zeromq.org/bindings:python
 
 comment "python-pyzmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
+	depends on BR2_PACKAGE_PYTHON
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/python/Config.in b/package/python/Config.in
index a550023..b1c0935 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_PYTHON
 	  http://www.python.org/
 
 comment "python needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 
 if BR2_PACKAGE_PYTHON
diff --git a/package/python3/Config.in b/package/python3/Config.in
index b355276..6580cfd 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_PYTHON3
 	  http://www.python.org/
 
 comment "python3 needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 
 if BR2_PACKAGE_PYTHON3
diff --git a/package/qt/Config.in b/package/qt/Config.in
index b1a2207..2651d55 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -1,4 +1,5 @@
 comment "qt needs a toolchain w/ C++, threads"
+	depends on !BR2_avr32
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_QT
@@ -301,6 +302,7 @@ config BR2_PACKAGE_QT_DBUS
 	  Build the Qt DBus module.
 
 comment "DBus Module needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_QT_XML
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 30f4ac8..42724dc 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -1,4 +1,5 @@
 comment "Qt5 needs a toolchain w/ wchar, IPv6, threads, C++"
+	depends on !BR2_PACKAGE_QT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_QT5
diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 1459207..e79ab02 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_QUAGGA_ZEBRA
 	  Build zebra daemon.
 
 comment "zebra daemon needs a toolchain w/ IPv6"
-	depends on BR2_PACKAGE_QUAGGA && !BR2_INET_IPV6
+	depends on !BR2_INET_IPV6
 
 config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
 	bool "Use TCP sockets between zebra and protocol daemons"
diff --git a/package/quota/Config.in b/package/quota/Config.in
index 3bb4556..69f03af 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_QUOTA
 	  http://sourceforge.net/projects/linuxquota/
 
 comment "quota needs a toolchain w/ largefile, wchar, threads"
+	depends on BR2_USE_MMU && !(BR2_microblazeel || BR2_microblazebe)
 	depends on !BR2_LARGEFILE || \
 		!BR2_USE_WCHAR || \
 		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index 5bfb535..6edfd7c 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_RADVD
 	  http://www.litech.org/radvd/
 
 comment "radvd needs a toolchain w/ IPv6"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6
diff --git a/package/redis/Config.in b/package/redis/Config.in
index e28ccec..b370e7d 100644
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_REDIS
 	  http://www.redis.io
 
 comment "redis needs a toolchain w/ largefile, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 1fb5346..578c6d6 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -13,4 +13,6 @@ config BR2_PACKAGE_RPCBIND
 	  into universal addresses.
 
 comment "rpcbind needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 81dc49a..8910211 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -18,4 +18,5 @@ config BR2_PACKAGE_RPI_USERLAND
 	  https://github.com/raspberrypi/userland/
 
 comment "rpi-userland needs a toolchain w/ C++, largefile, threads"
+	depends on BR2_arm
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index e913dcd..36c111b 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -23,4 +23,5 @@ config BR2_PACKAGE_RT_TESTS
 	  http://rt.wiki.kernel.org
 
 comment "rt-tests needs a toolchain w/ threads"
+	depends on !BR2_avr32
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 3abb6fa..0f39a92 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -15,4 +15,5 @@ config BR2_PACKAGE_RTORRENT
 	  http://libtorrent.rakshasa.no/
 
 comment "rtorrent needs a toolchain w/ C++, threads, wchar"
+	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/samba/Config.in b/package/samba/Config.in
index ce67396..1469075 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_SAMBA
 		so choose only the components you need.
 
 comment "samba needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_SAMBA
@@ -251,6 +252,7 @@ config BR2_PACKAGE_SAMBA_AVAHI
 	  Include support for avahi
 
 comment "support avahi - disabled (requires avahi-daemon)"
+	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_AVAHI_DAEMON
 
 config BR2_PACKAGE_SAMBA_GAMIN
diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 476a284..552ab0f 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_SER2NET
 	  http://ser2net.sourceforge.net
 
 comment "ser2net needs a toolchain w/ IPv6"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6
diff --git a/package/smartmontools/Config.in b/package/smartmontools/Config.in
index 1c6b1bc..92e0037 100644
--- a/package/smartmontools/Config.in
+++ b/package/smartmontools/Config.in
@@ -8,4 +8,5 @@ config BR2_PACKAGE_SMARTMONTOOLS
 	  http://smartmontools.sourceforge.net/
 
 comment "smartmontools needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
index cd1b413..e6e3272 100644
--- a/package/snowball-init/Config.in
+++ b/package/snowball-init/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_SNOWBALL_INIT
 	  http://www.igloocommunity.org
 
 comment "snowball-init needs a toolchain w/ wchar, threads"
-	depends on !BR2_avr32 && \
-		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !BR2_avr32 && BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/socat/Config.in b/package/socat/Config.in
index f771719..09eb2b6 100644
--- a/package/socat/Config.in
+++ b/package/socat/Config.in
@@ -8,4 +8,5 @@ config BR2_PACKAGE_SOCAT
 	  http://www.dest-unreach.org/socat/
 
 comment "socat needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/socketcand/Config.in b/package/socketcand/Config.in
index d4f210e..7d66325 100644
--- a/package/socketcand/Config.in
+++ b/package/socketcand/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_SOCKETCAND
 	  https://github.com/dschanoeh/socketcand
 
 comment "socketcand needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
index 8c4966f..484340f 100644
--- a/package/sqlcipher/Config.in
+++ b/package/sqlcipher/Config.in
@@ -10,9 +10,10 @@ config BR2_PACKAGE_SQLCIPHER
 
 	  http://sqlcipher.net
 
+if BR2_PACKAGE_SQLCIPHER
+
 config BR2_PACKAGE_SQLCIPHER_READLINE
 	bool "Command-line editing"
-	depends on BR2_PACKAGE_SQLCIPHER
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
@@ -20,14 +21,16 @@ config BR2_PACKAGE_SQLCIPHER_READLINE
 
 config BR2_PACKAGE_SQLCIPHER_STAT3
 	bool "Additional query optimizations (stat3)"
-	depends on BR2_PACKAGE_SQLCIPHER
 	help
 	  Adds additional logic to the ANALYZE command and to the query
 	  planner that can help SQLite to choose a better query plan under
 	  certain situations.
 
+endif
+
 comment "sqlcipher conflicts with sqlite"
 	depends on BR2_PACKAGE_SQLITE
 
 comment "sqlcipher needs a toolchain w/ threads"
+	depends on !BR2_PACKAGE_SQLITE
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/squashfs3/Config.in b/package/squashfs3/Config.in
index 8ce1e49..365eb6a 100644
--- a/package/squashfs3/Config.in
+++ b/package/squashfs3/Config.in
@@ -8,4 +8,5 @@ config BR2_PACKAGE_SQUASHFS3
 	  http://squashfs.sourceforge.net/
 
 comment "squashfs3 needs a toolchain w/ largefile"
-	depends on BR2_DEPRECATED && !BR2_LARGEFILE
+	depends on BR2_DEPRECATED
+	depends on !BR2_LARGEFILE
diff --git a/package/squid/Config.in b/package/squid/Config.in
index 8d0df6e..33776ca 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,4 +1,5 @@
 comment "squid needs a toolchain w/ C++, IPv6"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6
 
 config BR2_PACKAGE_SQUID
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 34f6af3..2ce627f 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -16,4 +16,5 @@ config BR2_PACKAGE_SSHFS
 	  http://fuse.sourceforge.net/sshfs.html
 
 comment "sshfs needs a toolchain w/ largefile, wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 753958b..20a3a9a 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -13,4 +13,5 @@ config BR2_PACKAGE_SYNERGY
 	  http://synergy2.sourceforge.net/
 
 comment "synergy needs a toolchain w/ C++, wchar"
-	depends on BR2_PACKAGE_XORG7 && !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+	depends on BR2_PACKAGE_XORG7
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 70e8903..0bb0791 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -25,4 +25,5 @@ config BR2_PACKAGE_SYSPROF_GUI
 endif
 
 comment "sysprof needs a toolchain w/ wchar, threads"
-        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 49536be..f6a15e3 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -19,5 +19,6 @@ config BR2_PACKAGE_SYSTEMD
 	  http://freedesktop.org/wiki/Software/systemd
 
 comment "systemd needs udev /dev management and a toolchain w/ IPv6, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \\
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 9ed60f0..8d413c6 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -47,4 +47,5 @@ comment "transmission-gtk needs a toolchain w/ locale"
 endif
 
 comment "transmission needs a toolchain w/ IPv6, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 52a5f04..04bcde1 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,5 +1,6 @@
 comment "tvheadend needs a toolchain w/ largefile, IPv6, threads"
-    depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_avr32
+	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index eae76b2..09070b4 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -36,5 +36,6 @@ config BR2_PACKAGE_UDISKS_LVM2
 endif
 
 comment "udisks needs udev /dev management and a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index 506eaba..0543b4b 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_UDPCAST
 	  http://www.udpcast.linux.lu/
 
 comment "udpcast needs a toolchain w/ largefile, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 menu "udpcast tools selection"
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index aa4f66c..de3d341 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_UNIONFS
 	  http://podgorny.cz/moin/UnionFsFuse
 
 comment "unionfs needs a toolchain w/ largefile, threads, dynamic library"
+	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index 0de1a51..4a79779 100644
--- a/package/ussp-push/Config.in
+++ b/package/ussp-push/Config.in
@@ -15,4 +15,5 @@ config BR2_PACKAGE_USSP_PUSH
 	  http://www.xmailserver.org/ussp-push.html
 
 comment "ussp-push needs a toolchain w/ wchar, IPv6, threads"
+	depends on !BR2_avr32 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
diff --git a/package/vala/Config.in b/package/vala/Config.in
index e15b441..d947c4a 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -13,4 +13,5 @@ config BR2_PACKAGE_VALA
 	  http://live.gnome.org/Vala
 
 comment "vala needs a toolchain w/ wchar, threads"
-	depends on BR2_DEPRECATED && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
+	depends on BR2_DEPRECATED
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 762ed90..0207a6d 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -29,5 +29,7 @@ config BR2_PACKAGE_WEBKIT
 	  http://webkit.org/
 
 comment "webkit needs libgtk2 and a toolchain w/ C++, wchar, threads"
+	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
+		    BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64)
 	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index d795b07..f228bc7 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
 
 comment "webrtc-audio-processing needs a toolchain w/ C++, threads"
+	depends on BR2_arm || BR2_i386 || BR2_x86_64
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/wget/Config.in b/package/wget/Config.in
index 254acfd..26a2019 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_WGET
 	  http://www.gnu.org/software/wget/
 
 comment "wget needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 0a34c3b..6b756a6 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -13,4 +13,5 @@ config BR2_PACKAGE_WIRESHARK
 	  http://www.wireshark.org
 
 comment "wireshark needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
index 012d368..ef4cd75 100644
--- a/package/wvdial/Config.in
+++ b/package/wvdial/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_WVDIAL
 	  http://wvdial.googlecode.com/
 
 comment "wvdial needs a toolchain w/ C++, largefile"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
index c717b60..c29937e 100644
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_WVSTREAMS
 	  http://wvstreams.googlecode.com/
 
 comment "wvstreams needs a toolchain w/ C++, largefile"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 5a0464b..0d5f494 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,5 +1,7 @@
 comment "xenomai needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
+		   BR2_bfin || BR2_powerpc || BR2_sh4
 
 config BR2_PACKAGE_XENOMAI
 	bool "Xenomai Userspace"
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 3e107d7..21a19d0 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -19,4 +19,5 @@ config BR2_PACKAGE_XSCREENSAVER
 	  http://www.jwz.org/xscreensaver/
 
 comment "xscreensaver needs a toolchain w/ C++, threads"
+	depends on BR2_PACKAGE_XORG7
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index bbc4f95..68dbf4e 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -16,12 +16,14 @@ config BR2_PACKAGE_ZMQPP
 	  http://github.com/benjamg/zmqpp
 
 comment "zmqpp needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
+	depends on !BR2_avr32
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 
+if BR2_PACKAGE_ZMQPP
+
 config BR2_PACKAGE_ZMQPP_CLIENT
 	bool "zmqpp client"
-	depends on BR2_PACKAGE_ZMQPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
@@ -30,4 +32,6 @@ config BR2_PACKAGE_ZMQPP_CLIENT
 	  used to listen or send to zeromq sockets.
 
 comment "zmqpp client needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_ZMQPP && !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index 52f1ca2..5833ccc 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -17,5 +17,7 @@ config BR2_PACKAGE_ZYRE
 	  http://zyre.org
 
 comment "zyre needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/system/Config.in b/system/Config.in
index 4c80087..6418d52 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -119,6 +119,7 @@ config BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_SYSTEMD
 
 comment 'systemd needs udev /dev management and a toolchain w/ largefile, wchar, IPv6, threads'
+	depends on BR2_USE_MMU
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
 		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
 		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
