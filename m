From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 09:39:51 -0300
Subject: [Buildroot] [PATCH v2 00/11] IPv6 optional removal
Message-ID: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For v2:
As pointed by Yann and after some debate on IRC i've reshuffled
and fixes the patches a bit.

Workflow;
Remove old toolchains that don't have IPv6 support (patch 1)
Force buildroot uClibc builds to IPv6 (patch 2, merged previous patches)
Force external toolchains to IPv6 (patch 3)
Drop systemd IPv6 depend (patch 4)
Drop busybox non-IPv6 support (patch 5)
Drop defconfig IPv6 non-option (patch 6)
Drop IPv6 from documentation (patch 7)
Drop IPv6-related package patches (patch 8)
Drop package tweaks and dependencies for IPv6 (patch 9)
Drop package infra for IPv6 options (patch 10)
Drop BR2_INET_IPV6 (patch 11)

Gustavo Zacarias (11):
  toolchain-external: remove CS sh2 toolchains
  package/uclibc: default to Y for IPv6
  toolchain: make IPv6 mandatory for external toolchains
  system: drop IPv6 depend for systemd
  busybox: force ipv6 build
  configs: drop redundant IPv6 option
  docs/manual: remove references to IPv6
  packages: remove non-IPv6 enabler patches
  packages: remove non-IPv6 dependencies and tweaks
  package infra: drop non-IPv6 support
  toolchain: drop BR2_INET_IPV6

 configs/armadeus_apf9328_defconfig                 |   1 -
 docs/manual/adding-packages-directory.txt          |  11 +-
 docs/manual/configure.txt                          |  10 +-
 package/Makefile.in                                |   6 -
 package/aiccu/Config.in                            |   5 +-
 package/argus/Config.in                            |   5 +-
 package/atftp/Config.in                            |   5 +-
 package/avahi/0003-ipv6only.patch                  |  19 --
 package/avahi/0005-optional-ipv6.patch             | 147 --------------
 package/batctl/Config.in                           |   5 +-
 package/bind/Config.in                             |   5 +-
 package/bluez5_utils/Config.in                     |   6 +-
 package/busybox/busybox.mk                         |   8 -
 package/chrony/chrony.mk                           |   4 -
 package/civetweb/civetweb.mk                       |   6 +-
 package/classpath/Config.in                        |   5 -
 package/collectd/Config.in                         |   7 +-
 package/connman/Config.in                          |   5 +-
 package/conntrack-tools/Config.in                  |   6 +-
 package/cppzmq/Config.in                           |   7 +-
 package/czmq/Config.in                             |   7 +-
 package/dhcp/dhcp.mk                               |   4 -
 package/dhcpcd/dhcpcd.mk                           |   4 -
 package/dnsmasq/dnsmasq.mk                         |   4 -
 package/dovecot/Config.in                          |   5 -
 package/ebtables/Config.in                         |   5 -
 package/ffmpeg/Config.in                           |   6 -
 package/filemq/Config.in                           |   7 +-
 package/gnuradio/Config.in                         |   6 +-
 package/gnutls/gnutls.mk                           |   2 +-
 package/gpsd/gpsd.mk                               |   5 -
 package/gstreamer/gst-ffmpeg/Config.in             |   4 -
 package/gstreamer/gst-plugins-good/Config.in       |   4 -
 package/hiawatha/hiawatha.mk                       |   1 -
 package/hostapd/hostapd.mk                         |   4 -
 package/iftop/Config.in                            |   5 +-
 package/iproute2/0001-optional-ipv6.patch          |  89 ---------
 package/iproute2/0002-vxlan-optional-ipv6.patch    |  83 --------
 package/iptables/iptables.mk                       |   8 -
 package/iptraf-ng/Config.in                        |   5 -
 package/iputils/Config.in                          |   2 +-
 package/iputils/iputils.mk                         |  21 +-
 package/jamvm/Config.in                            |   4 +-
 package/kodi/Config.in                             |   5 +-
 package/libeXosip2/0001-fix-non-ipv6-build.patch   |  22 ---
 package/libglib2/0001-optional-ipv6.patch          | 195 ------------------
 package/libiio/libiio.mk                           |   2 +-
 package/libndp/Config.in                           |   4 -
 package/libnetfilter_queue/Config.in               |   4 -
 package/libnftnl/Config.in                         |   4 -
 package/libnice/0001-build-IPV6_RECVERR.patch      |  20 --
 package/libnspr/libnspr.mk                         |   1 -
 package/liboping/Config.in                         |   4 -
 package/libshairplay/Config.in                     |   5 +-
 package/libsoup/libsoup.mk                         |   7 -
 .../libtirpc/0003-Make-IPv6-support-optional.patch |  26 ---
 package/libuv/Config.in                            |   5 +-
 package/libvncserver/libvncserver.mk               |   4 -
 package/libwebsockets/libwebsockets.mk             |   9 +-
 package/linphone/Config.in                         |   6 +-
 package/lsof/lsof.mk                               |   9 +-
 package/ltp-testsuite/Config.in                    |   6 +-
 package/luasocket/0001-uClibc-IPv6.patch           | 217 ---------------------
 package/lxc/Config.in                              |   5 +-
 package/mediastreamer/Config.in                    |   6 +-
 package/minidlna/Config.in                         |   5 +-
 package/modem-manager/Config.in                    |   7 +-
 package/mongrel2/Config.in                         |   5 +-
 package/mono/Config.in                             |   5 +-
 package/mpd/Config.in                              |   4 -
 package/mplayer/mplayer.mk                         |  14 +-
 package/mtd/Config.in                              |   4 -
 package/ndisc6/Config.in                           |   5 -
 package/net-tools/net-tools.mk                     |   4 +-
 package/netsnmp/netsnmp.mk                         |  11 +-
 package/network-manager/Config.in                  |   6 +-
 package/nftables/Config.in                         |   6 +-
 package/nginx/nginx.mk                             |   6 +-
 package/nmap/Config.in                             |   5 +-
 package/nodejs/Config.in                           |   6 +-
 package/ntp/ntp.mk                                 |   4 -
 package/odhcp6c/Config.in                          |   5 -
 package/olsr/Config.in                             |   5 +-
 package/opencv/Config.in                           |   4 -
 package/openntpd/Config.in                         |   5 +-
 package/openobex/Config.in                         |   4 -
 package/openpgm/Config.in                          |   5 +-
 package/openvmtools/Config.in                      |   5 +-
 package/openvpn/Config.in                          |   5 -
 package/perl/0001-uClibc-IPv6.patch                |  61 ------
 package/php-zmq/Config.in                          |   7 +-
 package/php/Config.ext                             |   4 -
 package/php/php.mk                                 |   7 -
 package/pkg-autotools.mk                           |   2 +-
 package/postgresql/postgresql.mk                   |   8 +-
 package/pppd/pppd.mk                               |   5 +-
 package/proftpd/proftpd.mk                         |   3 +-
 package/python-pyzmq/Config.in                     |   7 +-
 package/qemu/Config.in                             |   5 +-
 package/qt/qt.mk                                   |   7 -
 package/qt5/Config.in                              |   5 +-
 package/quagga/Config.in                           |   5 -
 package/radvd/Config.in                            |   5 -
 package/redis/Config.in                            |   5 +-
 package/rpcbind/0003-Make-IPv6-configurable.patch  |  42 ----
 package/rpcbind/rpcbind.mk                         |   1 -
 package/samba/samba.mk                             |   2 +-
 package/sconeserver/sconeserver.mk                 |   8 +-
 package/ser2net/Config.in                          |   5 -
 package/smcroute/Config.in                         |   5 -
 package/sofia-sip/sofia-sip.mk                     |   5 -
 package/spawn-fcgi/spawn-fcgi.mk                   |   4 -
 package/squid/Config.in                            |   6 +-
 package/strongswan/Config.in                       |   3 -
 package/strongswan/strongswan.mk                   |   4 +-
 package/systemd/Config.in                          |   1 -
 package/tcl/Config.in                              |   6 +-
 package/tftpd/tftpd.mk                             |   4 -
 package/tovid/Config.in                            |   5 +-
 package/transmission/Config.in                     |   5 +-
 package/trinity/trinity.mk                         |   4 -
 package/tvheadend/Config.in                        |   5 +-
 package/uclibc/Config.in                           |   7 -
 package/uclibc/uclibc.mk                           |   4 -
 package/ulogd/Config.in                            |   5 +-
 package/ussp-push/Config.in                        |   5 +-
 package/x11vnc/0001-ipv6.patch                     |  25 ---
 package/x11vnc/x11vnc.mk                           |   6 -
 package/zeromq/Config.in                           |   7 +-
 package/zmqpp/Config.in                            |   7 +-
 package/zyre/Config.in                             |   7 +-
 system/Config.in                                   |   1 -
 toolchain/Config.in                                |   2 -
 toolchain/helpers.mk                               |   2 +-
 toolchain/toolchain-common.in                      |   3 -
 toolchain/toolchain-external/Config.in             |  49 -----
 136 files changed, 142 insertions(+), 1498 deletions(-)
 delete mode 100644 package/avahi/0003-ipv6only.patch
 delete mode 100644 package/avahi/0005-optional-ipv6.patch
 delete mode 100644 package/iproute2/0001-optional-ipv6.patch
 delete mode 100644 package/iproute2/0002-vxlan-optional-ipv6.patch
 delete mode 100644 package/libeXosip2/0001-fix-non-ipv6-build.patch
 delete mode 100644 package/libglib2/0001-optional-ipv6.patch
 delete mode 100644 package/libnice/0001-build-IPV6_RECVERR.patch
 delete mode 100644 package/libtirpc/0003-Make-IPv6-support-optional.patch
 delete mode 100644 package/luasocket/0001-uClibc-IPv6.patch
 delete mode 100644 package/perl/0001-uClibc-IPv6.patch
 delete mode 100644 package/rpcbind/0003-Make-IPv6-configurable.patch
 delete mode 100644 package/x11vnc/0001-ipv6.patch

-- 
2.0.5
