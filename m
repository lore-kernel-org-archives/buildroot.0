From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  4 Dec 2020 16:45:56 +0100
Subject: [Buildroot] [PATCH v2 0/5] Introduce CPE ID matching for CVEs
Message-ID: <20201204154601.125932-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is another iteration of the work started by Matt Weber on CPE ID
matching, and then improved by Gr?gory Clement. In this series, I have
limited further the scope of the work compared to what Matt and
Gr?gory have posted, with the idea that the remainder will be handled
in follow-up patch series.

A significant part of the series has already been merged, and this
iteration is just the remaining parts.

Patches 1 to 3 have already been posted in the previous iteration, and
a number of changes have been made:

 - A status is now added for CPE information in pkg-stats, as
   suggested by Heiko. It is also used to distinguish cases where CPE
   ID is not available because it was not provided, or because it
   doesn't make sense to have one (for example for virtual packages)

 - The CPE IDs added to a number of packages have been double checked,
   and a few issues have been addressed.

Patches 4 and 5 are additional patches, further improving the
reporting of CVEs by pkg-stats.

Also, the patch series has been adjusted with the fact that
cve-checker has been dropped, and merged into pkg-stats.

Thanks,

Thomas

Gregory CLEMENT (1):
  support/script/pkg-stats: show CPE ID in results

Matt Weber (1):
  package: provide CPE ID details for numerous packages

Thomas Petazzoni (3):
  support/scripts/{pkg-stats,cve.py}: support CPE ID based matching
  support/scripts/pkg-stats: ignore packages with no valid infra and no
    version for CVE checking
  support/scripts/pkg-stats: improve rendering of CVE information

 boot/grub2/grub2.mk                           |   1 +
 boot/uboot/uboot.mk                           |   2 +
 linux/linux.mk                                |   2 +
 package/audit/audit.mk                        |   2 +
 package/bash/bash.mk                          |   1 +
 package/bc/bc.mk                              |   1 +
 package/bind/bind.mk                          |   1 +
 package/boost/boost.mk                        |   1 +
 package/bridge-utils/bridge-utils.mk          |   1 +
 package/busybox/busybox.mk                    |   1 +
 package/bzip2/bzip2.mk                        |   1 +
 package/clang/clang.mk                        |   1 +
 package/collectd/collectd.mk                  |   1 +
 package/conntrack-tools/conntrack-tools.mk    |   1 +
 package/coreutils/coreutils.mk                |   1 +
 package/crda/crda.mk                          |   1 +
 package/davici/davici.mk                      |   1 +
 package/dbus-glib/dbus-glib.mk                |   1 +
 package/dbus/dbus.mk                          |   2 +
 package/dhcp/dhcp.mk                          |   1 +
 package/dnsmasq/dnsmasq.mk                    |   1 +
 package/dropbear/dropbear.mk                  |   2 +
 package/ebtables/ebtables.mk                  |   1 +
 package/ethtool/ethtool.mk                    |   1 +
 package/expat/expat.mk                        |   1 +
 package/gdb/gdb.mk                            |   1 +
 package/gesftpserver/gesftpserver.mk          |   2 +
 package/glibc/glibc.mk                        |   1 +
 package/gmp/gmp.mk                            |   1 +
 package/gnupg/gnupg.mk                        |   1 +
 package/gnutls/gnutls.mk                      |   1 +
 package/grep/grep.mk                          |   1 +
 package/gtest/gtest.mk                        |   2 +
 package/gzip/gzip.mk                          |   1 +
 package/hostapd/hostapd.mk                    |   1 +
 package/ifupdown/ifupdown.mk                  |   1 +
 package/iperf/iperf.mk                        |   2 +
 package/iperf3/iperf3.mk                      |   1 +
 package/ipset/ipset.mk                        |   1 +
 package/iptables/iptables.mk                  |   1 +
 package/iw/iw.mk                              |   1 +
 package/kmod/kmod.mk                          |   2 +
 package/libarchive/libarchive.mk              |   1 +
 package/libcurl/libcurl.mk                    |   2 +
 package/libestr/libestr.mk                    |   1 +
 package/libfastjson/libfastjson.mk            |   1 +
 package/libfcgi/libfcgi.mk                    |   2 +
 package/libffi/libffi.mk                      |   2 +
 package/libgcrypt/libgcrypt.mk                |   1 +
 package/libglib2/libglib2.mk                  |   2 +
 package/libgpg-error/libgpg-error.mk          |   1 +
 package/liblogging/liblogging.mk              |   1 +
 package/libmbim/libmbim.mk                    |   1 +
 package/libmnl/libmnl.mk                      |   1 +
 .../libnetfilter_conntrack.mk                 |   1 +
 .../libnetfilter_cthelper.mk                  |   1 +
 .../libnetfilter_cttimeout.mk                 |   1 +
 .../libnetfilter_queue/libnetfilter_queue.mk  |   1 +
 package/libnfnetlink/libnfnetlink.mk          |   1 +
 package/libopenssl/libopenssl.mk              |   2 +
 package/libpcap/libpcap.mk                    |   1 +
 package/libselinux/libselinux.mk              |   1 +
 package/libsemanage/libsemanage.mk            |   1 +
 package/libsepol/libsepol.mk                  |   1 +
 package/libssh2/libssh2.mk                    |   1 +
 package/libsysfs/libsysfs.mk                  |   2 +
 package/libtasn1/libtasn1.mk                  |   1 +
 package/libunistring/libunistring.mk          |   1 +
 package/libxml2/libxml2.mk                    |   1 +
 package/libxslt/libxslt.mk                    |   1 +
 package/libzlib/libzlib.mk                    |   2 +
 package/lighttpd/lighttpd.mk                  |   1 +
 package/linux-firmware/linux-firmware.mk      |   2 +
 package/linux-headers/linux-headers.mk        |   2 +
 package/linux-pam/linux-pam.mk                |   2 +
 package/llvm/llvm.mk                          |   1 +
 package/lxc/lxc.mk                            |   1 +
 package/lz4/lz4.mk                            |   1 +
 package/memtester/memtester.mk                |   1 +
 package/mii-diag/mii-diag.mk                  |   1 +
 package/mpfr/mpfr.mk                          |   1 +
 package/mrouted/mrouted.mk                    |   1 +
 package/mtd/mtd.mk                            |   2 +
 package/ncurses/ncurses.mk                    |   1 +
 package/netsnmp/netsnmp.mk                    |   2 +
 package/nfs-utils/nfs-utils.mk                |   2 +
 package/openssh/openssh.mk                    |   3 +
 package/pax-utils/pax-utils.mk                |   1 +
 package/paxtest/paxtest.mk                    |   1 +
 package/pcre/pcre.mk                          |   1 +
 package/pixman/pixman.mk                      |   1 +
 package/policycoreutils/policycoreutils.mk    |   1 +
 package/pppd/pppd.mk                          |   2 +
 package/proftpd/proftpd.mk                    |   1 +
 package/protobuf/protobuf.mk                  |   1 +
 package/pure-ftpd/pure-ftpd.mk                |   1 +
 package/python-lxml/python-lxml.mk            |   2 +
 .../python-setuptools/python-setuptools.mk    |   2 +
 package/python/python.mk                      |   1 +
 package/qemu/qemu.mk                          |   1 +
 package/rapidjson/rapidjson.mk                |   1 +
 package/readline/readline.mk                  |   1 +
 package/refpolicy/refpolicy.mk                |   1 +
 package/rsyslog/rsyslog.mk                    |   1 +
 package/rt-tests/rt-tests.mk                  |   1 +
 package/sed/sed.mk                            |   1 +
 package/setools/setools.mk                    |   1 +
 package/smcroute/smcroute.mk                  |   1 +
 package/spawn-fcgi/spawn-fcgi.mk              |   1 +
 package/sqlite/sqlite.mk                      |   2 +
 package/strongswan/strongswan.mk              |   1 +
 package/tar/tar.mk                            |   1 +
 package/tcl/tcl.mk                            |   1 +
 package/tcpdump/tcpdump.mk                    |   1 +
 package/tftpd/tftpd.mk                        |   2 +
 package/uboot-tools/uboot-tools.mk            |   2 +
 package/util-linux/util-linux.mk              |   1 +
 package/valgrind/valgrind.mk                  |   1 +
 package/vim/vim.mk                            |   1 +
 package/wget/wget.mk                          |   1 +
 package/wireless-regdb/wireless-regdb.mk      |   1 +
 package/wireless_tools/wireless_tools.mk      |   2 +
 package/wpa_supplicant/wpa_supplicant.mk      |   1 +
 package/xerces/xerces.mk                      |   2 +
 package/xz/xz.mk                              |   1 +
 support/scripts/cve.py                        |  41 ++++--
 support/scripts/pkg-stats                     | 130 ++++++++++++++++--
 127 files changed, 308 insertions(+), 20 deletions(-)

-- 
2.28.0
