From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 22:42:37 +0100
Subject: [Buildroot] Fixes for RPC support
Message-ID: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of fixes that should hopefully fix most RPC related
build failures. At least, I have now tested all packages that use RPC
support, and built all of them on:

 * uClibc with RPC support + libtirpc

 * uClibc without RPC support + libtirpc

 * glibc with RPC support + libtirpc

 * glibc without RPC support + libtirpc

 * uClibc without RPC without IPv6 + libtirpc

Some of the patches against libtirpc are really big, and I currently
am working with upstream to get a solution for these.

Thomas

The following changes since commit 234fe4433489bca81b79311239569525cc008d9d:

  perl: build with perlcross instead of qemu (2012-11-09 10:04:31 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git fixes

for you to fetch changes up to e5c6caff3ca4c3d97249a23a5a3b062ffb48af61:

  rpcbind: fix build on toolchains without IPv6 support (2012-11-10 22:34:53 +0100)

----------------------------------------------------------------
Thomas Petazzoni (11):
      conntrack-tools: do not depend on BR2_INET_RPC and use libtirpc when available
      libtirpc: remove patch numbers from patch titles
      libtirpc: add patches to fix a number of issues
      libtirpc: handle the case where uClibc may have RPC support
      nfs-utils: reformat patch set as git patches
      nfs-utils: add patches to allow compilation against libtirpc
      quota: allow usage of getrpcbynumber() instead of getrpcbynumber_r()
      rpcbind: convert to git patch
      rpcbind: allow build without NSS support
      libnetfilter_queue: does not build without IPv6 support
      rpcbind: fix build on toolchains without IPv6 support

 package/conntrack-tools/Config.in                  |    6 +-
 package/conntrack-tools/conntrack-tools.mk         |    6 +
 package/libnetfilter_queue/Config.in               |    5 +-
 ...able-parts-of-TIRPC-requiring-NIS-support.patch |    4 +-
 ...out-RPC-support-does-not-install-rpcent.h.patch |   19 +-
 ...btirpc-0003-Add-missing-INET6-conditional.patch |    4 +-
 .../libtirpc-0004-Make-IPv6-support-optional.patch |    4 +-
 ...-getrpcbyname-name-argument-as-const-char.patch |   43 +
 ...t-remove-prototypes-of-reentrant-variants.patch |   33 +
 ...-Makefile.am-fix-out-of-tree-installation.patch |   24 +
 ...Add-rpcgen-program-from-nfs-utils-sources.patch | 6504 ++++++++++++++++++++
 ...ly-generate-XDR-header-files-from-.x-sour.patch |  999 +++
 ...R-files-needed-to-build-rpcbind-on-top-of.patch | 1649 +++++
 ...-AM_CONDITIONAL-in-conditional-execution.patch} |    9 +-
 ...> nfs-utils-0002-Patch-taken-from-Gentoo.patch} |   22 +-
 ...-Switch-legacy-index-in-favour-of-strchr.patch} |   44 +-
 ... => nfs-utils-0004-fix-build-with-uClibc.patch} |   16 +-
 ...-of-getrpcbynumber-when-getrpcbynumber_r-.patch |   70 +
 ...figure-script-find-getrpcbynumber-in-libt.patch |   38 +
 package/nfs-utils/nfs-utils-dont-mix-flags.patch   |  288 -
 package/quota/quota-tools-getrpcbynumber.patch     |   42 +
 package/quota/quota.mk                             |    4 +
 ...rpcbind-0001-Remove-yellow-pages-support.patch} |   18 +-
 ...to-use-NSS-support-when-not-available-in-.patch |   60 +
 .../rpcbind-0003-Make-IPv6-configurable.patch      |   42 +
 package/rpcbind/rpcbind.mk                         |    1 +
 26 files changed, 9615 insertions(+), 339 deletions(-)
 create mode 100644 package/libtirpc/libtirpc-0005-rpcent-mark-getrpcbyname-name-argument-as-const-char.patch
 create mode 100644 package/libtirpc/libtirpc-0006-rpcent-remove-prototypes-of-reentrant-variants.patch
 create mode 100644 package/libtirpc/libtirpc-0007-doc-Makefile.am-fix-out-of-tree-installation.patch
 create mode 100644 package/libtirpc/libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch
 create mode 100644 package/libtirpc/libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch
 create mode 100644 package/libtirpc/libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
 rename package/nfs-utils/{nfs-utils-conditionals.patch => nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch} (89%)
 rename package/nfs-utils/{nfs-utils-cross-build.patch => nfs-utils-0002-Patch-taken-from-Gentoo.patch} (69%)
 rename package/nfs-utils/{nfs-utils-susv3-legacy.patch => nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch} (50%)
 rename package/nfs-utils/{nfs-utils-uclibc-libio.h.patch => nfs-utils-0004-fix-build-with-uClibc.patch} (56%)
 create mode 100644 package/nfs-utils/nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
 create mode 100644 package/nfs-utils/nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
 delete mode 100644 package/nfs-utils/nfs-utils-dont-mix-flags.patch
 create mode 100644 package/quota/quota-tools-getrpcbynumber.patch
 rename package/rpcbind/{rpcbind-01-no-yp-support.patch => rpcbind-0001-Remove-yellow-pages-support.patch} (65%)
 create mode 100644 package/rpcbind/rpcbind-0002-Do-not-try-to-use-NSS-support-when-not-available-in-.patch
 create mode 100644 package/rpcbind/rpcbind-0003-Make-IPv6-configurable.patch

Thanks,
-- 
Thomas Petazzoni
