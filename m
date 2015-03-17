From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 13:48:24 -0300
Subject: [Buildroot] [PATCH v2 00/15] Drop non-largefile support
Message-ID: <1426610919-11901-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Second attempt at dropping non-largefile support.
Changes for v2:

More verbose comments [Yann]
Fix check_uclibc_feature logic [Gustavo]
Force and then remove BR2_TOOLCHAIN_BUILDROOT_LARGEFILE [Yann]
Unify {BR2,DISABLE}_LARGEFILE disabling patches [Yann]
Update BR2_LARGEFILE toolchain removal for new ARC toolchain [Gustavo]
Update largefile deps/tweaks removal patch for new packages [Gustavo]

Gustavo Zacarias (15):
  toolchain/helpers: add check for mandatory uClibc options
  toolchain/helpers: make LFS mandatory for uclibc toolchains
  package/uclibc: default to Y for LARGEFILE
  toolchain-common: default to Y for LARGEFILE
  toolchain: remove LARGEFILE selects
  package infra: drop non-lfs support
  configs: drop largefile option
  busybox: force lfs build
  system: drop largefile depends
  boot/gummiboot: drop largefile depends
  packages: remove (non-)lfs dependencies and tweaks
  docs/manual: remove references to largefile
  packages: remove non-lfs enabler patches
  package/uclibc: drop BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
  toolchain-common: drop BR2_LARGEFILE

 boot/gummiboot/Config.in                           |  5 +-
 configs/armadeus_apf9328_defconfig                 |  1 -
 configs/raspberrypi2_defconfig                     |  1 -
 configs/raspberrypi_defconfig                      |  1 -
 docs/manual/adding-packages-directory.txt          | 37 ++++++-----
 docs/manual/configure.txt                          | 31 +++++-----
 package/Makefile.in                                |  7 ---
 package/acl/Config.in                              |  4 --
 package/aircrack-ng/Config.in                      |  5 +-
 package/alsa-utils/Config.in                       |  5 +-
 package/apr/apr.mk                                 |  2 -
 package/armadillo/Config.in                        |  5 +-
 package/attr/Config.in                             |  4 --
 package/avrdude/Config.in                          |  5 +-
 package/bcache-tools/Config.in                     |  5 +-
 package/bind/Config.in                             |  5 +-
 package/bluez_utils/Config.in                      |  4 --
 package/boost/Config.in                            |  5 +-
 package/bootutils/Config.in                        |  4 --
 package/btrfs-progs/Config.in                      |  6 +-
 package/busybox/busybox.mk                         |  7 ---
 package/cdrkit/Config.in                           |  5 +-
 package/civetweb/Config.in                         |  4 --
 package/civetweb/civetweb.mk                       |  4 --
 package/clapack/Config.in                          |  7 ---
 package/cmake/cmake.mk                             |  2 +-
 package/collectd/Config.in                         |  4 --
 package/conntrack-tools/Config.in                  |  4 +-
 package/cppzmq/Config.in                           |  7 +--
 package/cryptsetup/Config.in                       |  6 +-
 package/curlftpfs/Config.in                        |  5 +-
 package/czmq/Config.in                             |  7 +--
 package/dmraid/Config.in                           |  6 +-
 package/dnsmasq/Config.in                          |  4 --
 package/dnsmasq/dnsmasq.mk                         |  4 --
 package/dosfstools/Config.in                       |  5 +-
 package/dvb-apps/Config.in                         |  5 +-
 package/dvbsnoop/Config.in                         |  4 --
 package/dvdauthor/Config.in                        |  5 +-
 package/e2fsprogs/Config.in                        |  5 +-
 package/e2tools/Config.in                          |  6 +-
 package/ecryptfs-utils/Config.in                   |  5 +-
 package/elfutils/Config.in                         |  5 +-
 package/elfutils/elfutils.mk                       |  2 -
 package/espeak/Config.in                           |  5 --
 package/eudev/Config.in                            |  5 +-
 package/exfat-utils/Config.in                      |  5 +-
 package/exfat/Config.in                            |  5 +-
 package/exiv2/Config.in                            |  5 +-
 package/f2fs-tools/Config.in                       |  5 +-
 package/ffmpeg/Config.in                           |  5 +-
 package/filemq/Config.in                           |  7 +--
 package/fio/Config.in                              |  9 ++-
 package/flashbench/Config.in                       |  4 --
 package/ftop/Config.in                             |  4 --
 package/gamin/gamin.mk                             |  4 --
 package/gcc/gcc-final/gcc-final.mk                 |  1 -
 package/genext2fs/Config.in                        |  4 --
 package/git/Config.in                              |  5 --
 package/glmark2/Config.in                          |  6 +-
 package/gnuradio/Config.in                         |  6 +-
 package/gptfdisk/Config.in                         |  5 +-
 package/gstreamer/gst-ffmpeg/Config.in             |  5 +-
 package/gstreamer/gst-plugins-bad/Config.in        |  4 --
 package/gstreamer/gst-plugins-good/Config.in       |  5 +-
 package/gstreamer1/gst1-plugins-bad/Config.in      |  4 --
 package/gstreamer1/gst1-plugins-good/Config.in     |  5 +-
 package/gstreamer1/gst1-plugins-ugly/Config.in     |  5 +-
 package/gvfs/Config.in                             |  5 +-
 package/hdparm/Config.in                           |  4 --
 package/imagemagick/imagemagick.mk                 |  4 --
 package/inotify-tools/Config.in                    |  5 --
 package/ipset/Config.in                            |  4 --
 package/jack2/Config.in                            |  6 +-
 package/kexec-lite/Config.in                       |  5 +-
 package/kexec/0001-largefile.patch                 | 22 -------
 package/kmod/Config.in                             |  5 +-
 package/kodi/Config.in                             |  5 +-
 package/libdri2/Config.in                          |  5 +-
 package/libdrm/Config.in                           |  5 +-
 package/libdvdnav/Config.in                        |  5 +-
 package/libdvdread/Config.in                       |  5 +-
 package/libftdi1/Config.in                         |  5 +-
 package/libfuse/Config.in                          |  5 +-
 package/libmnl/Config.in                           |  4 --
 package/libnetfilter_acct/Config.in                |  4 --
 package/libnetfilter_conntrack/Config.in           |  4 --
 package/libnetfilter_cthelper/Config.in            |  4 --
 package/libnetfilter_cttimeout/Config.in           |  4 --
 package/libnetfilter_queue/Config.in               |  5 +-
 package/libnfs/Config.in                           |  5 +-
 package/libnftnl/Config.in                         |  5 +-
 package/libnspr/Config.in                          |  5 +-
 package/libnss/Config.in                           |  6 +-
 package/libpciaccess/Config.in                     |  4 --
 package/libplayer/Config.in                        |  7 +--
 package/libselinux/Config.in                       |  5 +-
 package/libsemanage/Config.in                      |  5 +-
 package/libsndfile/Config.in                       |  7 ---
 package/libupnp/Config.in                          |  5 +-
 package/libupnpp/Config.in                         |  6 +-
 package/libv4l/Config.in                           |  5 +-
 package/libva-intel-driver/Config.in               |  6 +-
 package/libva/Config.in                            |  6 +-
 package/libxml2/libxml2.mk                         |  4 --
 package/lighttpd/lighttpd.mk                       |  3 +-
 package/links/0001-no-largefile.patch              | 26 --------
 package/lshw/Config.in                             |  5 +-
 package/lsof/lsof.mk                               |  3 -
 package/ltp-testsuite/Config.in                    |  5 +-
 package/ltrace/Config.in                           |  5 +-
 package/lttng-babeltrace/Config.in                 |  5 +-
 package/lttng-libust/Config.in                     |  8 +--
 package/lttng-tools/Config.in                      |  6 +-
 package/lua/lua.mk                                 |  4 --
 package/luafilesystem/luafilesystem.mk             |  3 -
 package/luajit/luajit.mk                           |  5 --
 package/lvm2/Config.in                             |  6 +-
 package/lxc/Config.in                              |  5 +-
 package/lz4/Config.in                              |  4 --
 package/lzip/Config.in                             |  5 +-
 .../mdadm/0020-uclibc-dont-force-largefile.patch   | 27 --------
 ...redefine-off64_t-as-off_t-if-no-largefile.patch | 27 --------
 package/memtester/Config.in                        |  4 --
 package/mesa3d/Config.in                           |  5 +-
 package/minidlna/Config.in                         |  5 +-
 package/mmc-utils/Config.in                        |  5 +-
 package/modem-manager/Config.in                    |  5 +-
 package/mongoose/Config.in                         |  5 +-
 package/mongrel2/Config.in                         |  5 +-
 package/monit/monit.mk                             |  9 +--
 package/mp4v2/mp4v2.mk                             |  8 +--
 package/mpd/Config.in                              | 26 +-------
 package/mplayer/Config.in                          |  7 ---
 package/mtd/Config.in                              |  5 +-
 package/nbd/nbd.mk                                 |  2 +-
 package/network-manager/Config.in                  |  5 +-
 package/nfacct/Config.in                           |  4 --
 package/nfs-utils/Config.in                        |  8 +--
 package/nftables/Config.in                         |  5 +-
 package/nginx/Config.in                            |  5 --
 package/nginx/nginx.mk                             |  2 +-
 package/nodejs/Config.in                           |  5 +-
 package/ntfs-3g/Config.in                          |  5 +-
 package/numactl/Config.in                          |  6 --
 package/ola/Config.in                              |  5 +-
 package/opencv/Config.in                           |  5 +-
 package/openvmtools/Config.in                      |  5 +-
 package/opus-tools/0001-largefile.patch            | 37 -----------
 package/opusfile/Config.in                         |  4 --
 package/parted/Config.in                           |  5 +-
 package/pax-utils/Config.in                        |  4 --
 package/perf/Config.in                             |  5 +-
 package/perl/perl.mk                               |  4 --
 package/php-zmq/Config.in                          |  5 +-
 package/php/php.mk                                 |  3 -
 package/pifmrds/Config.in                          |  5 --
 package/pkg-autotools.mk                           |  1 -
 package/proftpd/proftpd.mk                         |  2 -
 package/pulseaudio/Config.in                       |  5 +-
 package/python-libconfig/Config.in                 |  5 +-
 package/python-pyzmq/Config.in                     |  7 +--
 package/qt/0006-uClibc-lfs-fix.patch               | 41 -------------
 package/qt/qt.mk                                   | 14 -----
 package/qt5/qt5base/0003-uclibc-no-lfs.patch       | 36 -----------
 package/qt5/qt5base/qt5base.mk                     |  4 --
 package/quota/Config.in                            |  6 +-
 package/redis/Config.in                            |  6 +-
 package/rpi-userland/Config.in                     |  5 +-
 package/rpm/0001-uclibc-no-lfs-fix.patch           | 22 -------
 package/sg3_utils/Config.in                        |  5 +-
 package/softether/Config.in                        |  5 +-
 package/sqlcipher/sqlcipher.mk                     |  7 ---
 package/sqlite/sqlite.mk                           |  7 ---
 package/squashfs/Config.in                         |  5 +-
 package/sshfs/Config.in                            |  5 +-
 package/strace/Config.in                           |  4 --
 package/stress/0001-Remove-largefile.patch         | 22 -------
 package/sysklogd/Config.in                         |  5 --
 package/systemd/Config.in                          |  1 -
 package/thrift/Config.in                           |  5 +-
 package/trace-cmd/Config.in                        |  6 +-
 package/tstools/Config.in                          |  5 --
 package/tvheadend/Config.in                        |  6 +-
 package/twolame/Config.in                          |  4 --
 package/uclibc/Config.in                           |  7 ---
 package/uclibc/uclibc.mk                           |  7 ---
 package/udpcast/Config.in                          |  5 +-
 package/ulogd/Config.in                            |  5 +-
 package/unionfs/Config.in                          |  5 +-
 package/upmpdcli/Config.in                         |  6 +-
 package/ushare/Config.in                           |  6 +-
 package/ustr/Config.in                             |  4 --
 package/util-linux/Config.in                       |  5 +-
 ...e-largefile-support-unconditionally-on-uC.patch | 71 ----------------------
 package/vlc/Config.in                              |  5 +-
 package/vsftpd/0002-dont-force-largefile.patch     | 27 --------
 package/wipe/0001-dont-force-lfs.patch             | 16 -----
 package/wvdial/Config.in                           |  5 +-
 package/wvstreams/Config.in                        |  5 +-
 package/x11r7/xserver_xorg-server/Config.in        |  6 +-
 package/x264/Config.in                             |  4 --
 package/xfsprogs/Config.in                         |  5 +-
 package/xorriso/Config.in                          |  5 +-
 package/xtables-addons/Config.in                   |  6 +-
 package/yaml-cpp/Config.in                         |  5 +-
 package/ympd/Config.in                             |  5 +-
 package/zeromq/Config.in                           |  7 +--
 package/zlog/Config.in                             |  5 +-
 package/zmqpp/Config.in                            |  7 +--
 package/zyre/Config.in                             |  7 +--
 system/Config.in                                   |  6 +-
 toolchain/Config.in                                |  2 -
 toolchain/helpers.mk                               | 24 +++++---
 toolchain/toolchain-common.in                      |  3 -
 toolchain/toolchain-external/Config.in             | 14 -----
 216 files changed, 313 insertions(+), 1177 deletions(-)
 delete mode 100644 package/kexec/0001-largefile.patch
 delete mode 100644 package/links/0001-no-largefile.patch
 delete mode 100644 package/mdadm/0020-uclibc-dont-force-largefile.patch
 delete mode 100644 package/mdadm/0030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch
 delete mode 100644 package/opus-tools/0001-largefile.patch
 delete mode 100644 package/qt/0006-uClibc-lfs-fix.patch
 delete mode 100644 package/qt5/qt5base/0003-uclibc-no-lfs.patch
 delete mode 100644 package/rpm/0001-uclibc-no-lfs-fix.patch
 delete mode 100644 package/stress/0001-Remove-largefile.patch
 delete mode 100644 package/valgrind/0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
 delete mode 100644 package/vsftpd/0002-dont-force-largefile.patch
 delete mode 100644 package/wipe/0001-dont-force-lfs.patch

-- 
2.0.5
