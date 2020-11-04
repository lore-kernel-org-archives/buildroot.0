From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Nov 2020 15:51:34 +0100
Subject: [Buildroot] [PATCH 00/10] Introduce CPE ID matching for CVEs
Message-ID: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
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

This series limits itself to:

 - Allowing packages to provide their CPE ID information.
 - Improving the logic used to match CVEs against packages to make use
   of this CPE ID information.

Details of the series:

 - PATCH 1 and PATCH 2 are relatively minor preparation patches.

 - PATCH 3 adds the bits of generic-package infrastructure that allows
   packages to provide their CPE ID information. Read the commit log
   carefully to understand the choices that were made. PATCH 4 adds
   the documentation for those new variables.

 - PATCH 5 exposes the CPE ID information of each package in the "make
   show-info" output.

 - PATCH 6 adds test cases to verify that the CPE ID variables and the
   make show-info JSON output for CPE ID information are correctly
   handled.

 - PATCH 7 and 8 respectively adapt the cve-checker and pkg-stats
   scripts so that they display the CPE ID of each package, when
   available. At this point, the CPE ID is only displayed in a new
   column.

 - PATCH 9 is where the CVE matching logic gets improved to use the
   CPE ID information when available for a package.

 - PATCH 10 adds CPE ID information to over a hundred packages.

Overall, the scope of this series is therefore much more focused, and
hopefully more manageable to review.

Best regards,

Thomas

Gregory CLEMENT (2):
  support/scripts/cve-checker: show CPE ID in results
  support/script/pkg-stats: show CPE ID in results

Matt Weber (2):
  package/pkg-generic.mk: add CPE ID related package variables
  package: provide CPE ID details for numerous packages

Thomas Petazzoni (6):
  support/scripts/cve.py: properly match CPEs with version '*'
  support/scripts/cve-checker: parse arguments earlier
  docs/manual: document <pkg>_CPE_ID variables
  package/pkg-utils.mk: expose CPE ID in show-info when available
  support/testing/tests/core/test_cpeid: new test
  support/scripts/{pkg-stats,cve.py,cve-checker}: support CPE ID based
    matching

 boot/grub2/grub2.mk                           |   1 +
 boot/uboot/uboot.mk                           |   2 +
 docs/manual/adding-packages-generic.txt       |  39 +++++++
 linux/linux.mk                                |   2 +
 package/audit/audit.mk                        |   2 +
 package/aufs/aufs.mk                          |   1 +
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
 package/libopenssl/Config.in                  |  11 ++
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
 package/pkg-generic.mk                        |  70 +++++++++++
 package/pkg-utils.mk                          |   3 +
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
 package/setserial/setserial.mk                |   1 +
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
 support/scripts/cve-checker                   |  48 ++++++--
 support/scripts/cve.py                        |  50 +++++---
 support/scripts/pkg-stats                     |  69 +++++++++--
 .../tests/core/cpeid-br2-external/Config.in   |   0
 .../core/cpeid-br2-external/external.desc     |   1 +
 .../tests/core/cpeid-br2-external/external.mk |   1 +
 .../package/cpe-id-pkg1/cpe-id-pkg1.mk        |   4 +
 .../package/cpe-id-pkg2/cpe-id-pkg2.mk        |   3 +
 .../package/cpe-id-pkg3/cpe-id-pkg3.mk        |   5 +
 .../package/cpe-id-pkg4/cpe-id-pkg4.mk        |   9 ++
 .../package/cpe-id-pkg5/cpe-id-pkg5.mk        |  16 +++
 support/testing/tests/core/test_cpeid.py      | 109 ++++++++++++++++++
 143 files changed, 564 insertions(+), 33 deletions(-)
 create mode 100644 support/testing/tests/core/cpeid-br2-external/Config.in
 create mode 100644 support/testing/tests/core/cpeid-br2-external/external.desc
 create mode 100644 support/testing/tests/core/cpeid-br2-external/external.mk
 create mode 100644 support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg1/cpe-id-pkg1.mk
 create mode 100644 support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg2/cpe-id-pkg2.mk
 create mode 100644 support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk
 create mode 100644 support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk
 create mode 100644 support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk
 create mode 100644 support/testing/tests/core/test_cpeid.py

-- 
2.26.2
