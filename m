From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:33 +0200
Subject: [Buildroot] [PATCH 00/17] Adding CPE ID support for CVEs
Message-ID: <20201006134250.22738-1-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a first attempt for series adding CPE ID support for CVEs. For
now it needs to be discussed and it is not ready for merging.

It is based on the series sent by Matt Weber a few months ago:
http://patchwork.ozlabs.org/project/buildroot/list/?series=183798&state=*

I am including the full series but actually for the CVE check I only
needs a few patches: "cpe-info: new make target",
"toolchain/toolchain-ext: glibc cpe-info support" and "packages: fixup
of cpe info".

I only use $(PKG)_CPE_ID which contains vendor, name, version and
version minor information. I think it is enough to make a CVE matching
a package, but that can be discussed.

I added a new flag to know if a package has a verified CPEID. It is
done with patch "package/pkg-generic.mk: Create CPE ID information
only if verified". The generation of the $(PKG)_CPE_ID value depends
of $(PKG)_CPE_ID_VALID begin equal to y. Maybe we could just do an
ifdef on $(PKG)_CPE_ID, I am not sure of the best practice.

Then in the patch "packages: add new flag for CPE ID" I added the
$(PKG)_CPE_ID_VALID flag for the package with CPE ID fix, as for them
we are sure they are OK.

In "package/pkg-utils.mk: add the CPE ID in show-info", I added the
cpeid in the generated json to be used by the cve-checker.

With the patch "package/pkg-utils/cve.py: Add cpeid support" I added a
function managing cpeid that will be used by cve-checker and pkg-stat.

In the last 2 patches I added a new argument --cpeid in order to use
cpeid instead of name and version from the packages. I also made the
cpeid appearing in the output of the html or json file. For the HTML
output of cve-checker I put the background of the package name in red
if the cpeid is not valid.

The documentation has not been updated, so it is something remaining
to do.

While testing the output I realized that I didn't generate cpeid for
virtual package with show-info, but I am not sure that it was
something we want. In the same time, I generate cpeid for host package
and I don't know if we need it.

Another point to discuss, is that actually we can have the same cpeid
for different package. At least it is the case for the packages linux
and linux-headers. If both packages are present then the CVEs are
attached to only one of them. One solution could be to not considering
the host package as seen before.

During my first test, when all the CPE ID generated was considered as
valid, I noticed a few changes when running pkg-stat with cpeid:

 - 'netsnmp' and 'xerces' got new CVEs because the buildroot name
    didn't match the cpeid

 - 'openssh' and 'sqlite' got new CVEs because thanks to a better
   revision handling

 - a wrong CVE for 'tftpd' was removed because of a false macth in
   buildroot due to bad name (tfptd instead of tftpd-hpa),

 - In the opposite rust didn't have anymore associated CVE because it
   was called host-rust by the generated cpeid.

 - uboot-tools got CVE because it has the same cpeid than u-boot, but
   I am not sure it is correct.

Gregory


Gregory CLEMENT (7):
  Support/scripts/cpedb.py: Convert to Python 3
  package/pkg-generic.mk: Create CPE ID information only if verified
  packages: add new flag for CPE ID
  package/pkg-utils.mk: add the CPE ID in show-info
  package/pkg-utils/cve.py: Add cpeid support
  support/script/cve-checker: Allow to use cpeid
  support/script/pkg-stats: Allow to use CPEID for managing CVEs

Matt Weber (9):
  cpe-info: new make target
  cpe-info: id prefix/suffix
  cpe-info: only report target pkgs
  cpe-info: cpe minor version support
  cpe-info: update manual for new pkg vars
  support/scripts/cpedb.py: new CPE XML helper
  support/scripts/cpe-report: new script
  docs/manual: new security management section
  packages: fixup of cpe info

Shruthi Singh (1):
  toolchain/toolchain-ext: glibc cpe-info support

 Makefile                                      |  17 +-
 boot/grub2/grub2.mk                           |   2 +
 boot/uboot/uboot.mk                           |   3 +
 docs/manual/adding-packages-generic.txt       | 111 +++++++----
 docs/manual/cpe-reporting.txt                 | 107 ++++++++++
 docs/manual/manual.txt                        |   2 +
 linux/linux.mk                                |   3 +
 package/Makefile.in                           |   4 +
 package/audit/audit.mk                        |   3 +
 package/aufs/aufs.mk                          |   2 +
 package/bash/bash.mk                          |   2 +
 package/bc/bc.mk                              |   2 +
 package/bind/bind.mk                          |   2 +
 package/boost/boost.mk                        |   2 +
 package/bridge-utils/bridge-utils.mk          |   2 +
 package/busybox/busybox.mk                    |   2 +
 package/bzip2/bzip2.mk                        |   2 +
 package/clang/clang.mk                        |   1 +
 package/collectd/collectd.mk                  |   2 +
 package/conntrack-tools/conntrack-tools.mk    |   2 +
 package/coreutils/coreutils.mk                |   2 +
 package/crda/crda.mk                          |   2 +
 package/davici/davici.mk                      |   2 +
 package/dbus-glib/dbus-glib.mk                |   2 +
 package/dbus/dbus.mk                          |   3 +
 package/dhcp/dhcp.mk                          |   2 +
 package/dnsmasq/dnsmasq.mk                    |   2 +
 package/dropbear/dropbear.mk                  |   3 +
 package/ebtables/ebtables.mk                  |   1 +
 package/ethtool/ethtool.mk                    |   2 +
 package/expat/expat.mk                        |   2 +
 package/gdb/gdb.mk                            |   2 +
 package/gesftpserver/gesftpserver.mk          |   3 +
 package/glibc/glibc.mk                        |   2 +
 package/gmp/gmp.mk                            |   2 +
 package/gnupg/gnupg.mk                        |   2 +
 package/gnutls/gnutls.mk                      |   2 +
 package/grep/grep.mk                          |   2 +
 package/gtest/gtest.mk                        |   3 +
 package/gzip/gzip.mk                          |   2 +
 package/hostapd/hostapd.mk                    |   2 +
 package/ifupdown/ifupdown.mk                  |   2 +
 package/iperf/iperf.mk                        |   3 +
 package/iperf3/iperf3.mk                      |   2 +
 package/ipset/ipset.mk                        |   2 +
 package/iptables/iptables.mk                  |   2 +
 package/iw/iw.mk                              |   2 +
 package/kmod/kmod.mk                          |   3 +
 package/libarchive/libarchive.mk              |   2 +
 package/libcurl/libcurl.mk                    |   3 +
 package/libestr/libestr.mk                    |   2 +
 package/libfastjson/libfastjson.mk            |   2 +
 package/libfcgi/libfcgi.mk                    |   3 +
 package/libffi/libffi.mk                      |   3 +
 package/libgcrypt/libgcrypt.mk                |   2 +
 package/libglib2/libglib2.mk                  |   3 +
 package/libgpg-error/libgpg-error.mk          |   2 +
 package/liblogging/liblogging.mk              |   2 +
 package/libmbim/libmbim.mk                    |   2 +
 package/libmnl/libmnl.mk                      |   2 +
 .../libnetfilter_conntrack.mk                 |   2 +
 .../libnetfilter_cthelper.mk                  |   2 +
 .../libnetfilter_cttimeout.mk                 |   2 +
 .../libnetfilter_queue/libnetfilter_queue.mk  |   2 +
 package/libnfnetlink/libnfnetlink.mk          |   2 +
 package/libopenssl/Config.in                  |  11 ++
 package/libopenssl/libopenssl.mk              |   3 +
 package/libpcap/libpcap.mk                    |   2 +
 package/libselinux/libselinux.mk              |   2 +
 package/libsemanage/libsemanage.mk            |   2 +
 package/libsepol/libsepol.mk                  |   2 +
 package/libssh2/libssh2.mk                    |   2 +
 package/libsysfs/libsysfs.mk                  |   3 +
 package/libtasn1/libtasn1.mk                  |   2 +
 package/libunistring/libunistring.mk          |   2 +
 package/libxml2/libxml2.mk                    |   2 +
 package/libxslt/libxslt.mk                    |   2 +
 package/libzlib/libzlib.mk                    |   3 +
 package/lighttpd/lighttpd.mk                  |   2 +
 package/linux-firmware/linux-firmware.mk      |   3 +
 package/linux-headers/linux-headers.mk        |   3 +
 package/linux-pam/linux-pam.mk                |   3 +
 package/llvm/llvm.mk                          |   2 +
 package/lxc/lxc.mk                            |   2 +
 package/lz4/lz4.mk                            |   2 +
 package/memtester/memtester.mk                |   2 +
 package/mii-diag/mii-diag.mk                  |   2 +
 package/mpfr/mpfr.mk                          |   2 +
 package/mrouted/mrouted.mk                    |   2 +
 package/mtd/mtd.mk                            |   3 +
 package/ncurses/ncurses.mk                    |   2 +
 package/netsnmp/netsnmp.mk                    |   3 +
 package/nfs-utils/nfs-utils.mk                |   3 +
 package/openssh/openssh.mk                    |   4 +
 package/pax-utils/pax-utils.mk                |   2 +
 package/paxtest/paxtest.mk                    |   2 +
 package/pcre/pcre.mk                          |   2 +
 package/pixman/pixman.mk                      |   2 +
 package/pkg-generic.mk                        |  38 ++++
 package/pkg-utils.mk                          |   9 +
 package/policycoreutils/policycoreutils.mk    |   2 +
 package/pppd/pppd.mk                          |   3 +
 package/proftpd/proftpd.mk                    |   3 +
 package/protobuf/protobuf.mk                  |   2 +
 package/pure-ftpd/pure-ftpd.mk                |   2 +
 package/python-lxml/python-lxml.mk            |   3 +
 .../python-setuptools/python-setuptools.mk    |   3 +
 package/python/python.mk                      |   2 +
 package/qemu/qemu.mk                          |   2 +
 package/rapidjson/rapidjson.mk                |   2 +
 package/readline/readline.mk                  |   2 +
 package/refpolicy/refpolicy.mk                |   2 +
 package/rsyslog/rsyslog.mk                    |   2 +
 package/rt-tests/rt-tests.mk                  |   2 +
 package/sed/sed.mk                            |   2 +
 package/setools/setools.mk                    |   2 +
 package/setserial/setserial.mk                |   1 +
 package/smcroute/smcroute.mk                  |   2 +
 package/spawn-fcgi/spawn-fcgi.mk              |   2 +
 package/sqlite/sqlite.mk                      |   3 +
 package/strongswan/strongswan.mk              |   2 +
 package/tar/tar.mk                            |   2 +
 package/tcl/tcl.mk                            |   2 +
 package/tcpdump/tcpdump.mk                    |   2 +
 package/tftpd/tftpd.mk                        |   3 +
 package/uboot-tools/uboot-tools.mk            |   3 +
 package/util-linux/util-linux.mk              |   2 +
 package/valgrind/valgrind.mk                  |   2 +
 package/vim/vim.mk                            |   2 +
 package/wget/wget.mk                          |   2 +
 package/wireless-regdb/wireless-regdb.mk      |   2 +
 package/wireless_tools/wireless_tools.mk      |   3 +
 package/wpa_supplicant/wpa_supplicant.mk      |   2 +
 package/xerces/xerces.mk                      |   3 +
 package/xz/xz.mk                              |   2 +
 support/scripts/cpe-report                    |  70 +++++++
 support/scripts/cpedb.py                      | 185 ++++++++++++++++++
 support/scripts/cve-checker                   |  48 ++++-
 support/scripts/cve.py                        |  13 +-
 support/scripts/pkg-stats                     |  46 ++++-
 .../pkg-toolchain-external.mk                 |   7 +
 141 files changed, 896 insertions(+), 56 deletions(-)
 create mode 100644 docs/manual/cpe-reporting.txt
 create mode 100755 support/scripts/cpe-report
 create mode 100644 support/scripts/cpedb.py

-- 
2.28.0
