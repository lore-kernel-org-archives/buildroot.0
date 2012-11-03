From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Nov 2012 18:47:45 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.11/rpc-support
Message-ID: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches reworks the RPC support to take into account newer
glibc versions that do not provide RPC support.

Compared to the previous posting (August, 11th), the changes are
mainly:

 * libtirpc is now automatically selected (like any other library) by
   packages needing RPC support and no RPC support is available from
   the toolchain

 * if there is RPC support in the toolchain but libtirpc is available,
   then libtirpc will be used (i.e we're passing the compiler and
   linker flags needed for the packages to find libtirpc)

 * removal of the patch adding the ARM CodeSourcery toolchain, since
   this toolchain in fact had RPC support, and it was merged
   separately.

 * removal of the patches converting netkitbase and netkittelnet to
   the package infrastructure, since those were merged separately
   thanks to the work of Samuel Martin.

 * some other minor fixes done after comments of the first review
   (typos in help text, issue with some toolchains was fixed, etc.)

Note that patches 1, 2, 3, 4, 17, 18 can be comitted separately from
the other patches.

In order to help in the review, here is a step by step description of
what is being done:

 * Patch 1 changes uclibc.mk to use the BR2_TOOLCHAIN_BUILDROOT_*
   options instead of directly BR2_LARGEFILE/BR2_INET_IPV6, etc. This
   is not strictly needed, but since BR2_INET_RPC is going to be
   renamed in later patches, it helps to use BR2_TOOLCHAIN_BUILDROOT_*
   everywhere. It is also more logical since the
   BR2_TOOLCHAIN_BUILDROOT_* options are defined by the internal
   Buildroot toolchain backend, so it makes sense to use those options
   in uclibc.mk which is part of this toolchain backend.

 * Patch 2 simplifies the Busybox recipe to do mess up with
   FEATURE_NFS_MOUNT automatically. Instead, we leave the default of
   our configuration files (FEATURE_NFS_MOUNT is disabled), and if the
   user wants it, (s)he'll enable it. This will simplify how to handle
   Busybox with regard to libtirpc.

 * Patch 3 does the same thing as patch 1, but for the Crosstool-NG
   backend.

 * Patch 4 makes a naive rename BR2_INET_RPC to
   BR2_TOOLCHAIN_HAS_NATIVE_RPC. This name better describes what it
   means: whether the toolchain has or does not have RPC support (the
   RPC support will later have the capability of being provided by
   libtirpc, outside of the toolchain).

 * Patch 5 enhance the external toolchain logic around the RPC
   support. Basically, the BR2_TOOLCHAIN_EXTERNAL_GLIBC option no
   longer unconditionally selects BR2_TOOLCHAIN_HAS_NATIVE_RPC since
   there are glibc toolchains that don't have RPC support. All the
   predefined toolchain profiles are updated to take into account this
   change: for the moment, all glibc toolchains that have pre-defined
   toolchains have RPC support, but further patches in the series add
   pre-defined glibc toolchains that don't have RPC support. In the
   case of custom glibc toolchains, a question is asked to the user so
   that he can say whether the external glibc toolchain has RPC
   support or not. The validity of this configuration option is
   checked by the new check_glibc_rpc_feature function in helpers.mk.

 * Patch 6 adds a package for libtirpc, with a bunch of patches to
   make its compilation work properly on top of uClibc.

   What is worth noting is that the libtirpc package is only available
   if the toolchain does not have RPC support. We for now assume that
   the user will want to use the internal RPC support of the toolchain
   if available rather than libtirpc. Note that this choice may be
   changed in the future, as the RPC support in libtirpc may have more
   features than the one provided by the toolchain.

   The other thing that this package Config.in file provides is the
   BR2_RPC_SUPPORT_AVAILABLE option, which tells whether the toolchain
   has RPC support *OR* libtirpc is enabled. Packages needing RPC
   support can therefore "depends on" this.

 * Patch 7 adjust the Busybox build process to use libtirpc if
   available. We do not 'select' libtirpc if the RPC support is not
   available in the toolchain, as we don't want a simple program such
   as Busybox to carry dependencies without the user noticing. Since
   we're not enabling FEATURE_NFS_MOUNT automatically (as per patch
   2), this libtirpc will only be used is (1) libtirpc is selected and
   (2) the user has manually enabled FEATURE_NFS_MOUNT.

 * Patch 8 makes it possible to link lmbench against libtirpc. Nothing
   special to mention here.

 * Patch 9 makes it possible to link nfs-utils against libtirpc. The
   only thing worth mentionning is that I removed the select on
   BR2_PACKAGE_PORTMAP. This select was not a build-time dependency,
   but a run-time dependency, and nowadays, nfs-utils can work
   together with rpcbind rather than portmap (which is deprecated).

 * Patch 10 adds a package for rpcbind, the modern replacement for
   portmap. This package directly selects libtirpc. Question: how
   should it behave with toolchains having internal RPC support?

 * Patch 11 adds a small comment in portmap saying that rpcbind is the
   newer replacement. Portmap doesn't link properly against libtirpc,
   and it probably isn't worth fixing it. Question: should I mark
   portmap as deprecated?

 * Patch 12 makes it possible to link quota against libtirpc. Nothing
   special to mention here.

 * Patch 13 changes how the --with-sys-quotas option is handled by
   Samba. This option does not depend on RPC support in the toolchain
   apparently.

 * Patch 14 makes it possible to link xinetd against libtirpc. Nothing
   special to mention here.

 * Patches 15-16 add the latest Sourcery CodeBench toolchain for x86
   and SH4. Those glibc toolchains use glibc 2.15 and therefore do not
   have RPC support.

 * Patches 17-18 makes netkitbase and netkittelnet packages
   deprecated.

Thanks!

Thomas

The following changes since commit 5a61fbd82394f9bc9317535b717a2e1dd51dea7d:

  fs/skeleton: remove /etc/TZ (2012-10-24 09:16:50 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.11/rpc-support

for you to fetch changes up to 0003a7e4a071871640d8d842c6838611bf210ae5:

  netkittelnet: mark as deprecated (2012-11-03 18:45:57 +0100)

----------------------------------------------------------------
Thomas Petazzoni (18):
      uClibc: use the Buildroot toolchain options instead of the hidden common options
      busybox: don't force FEATURE_NFS_MOUNT
      toolchain-crosstool-ng: use the Crosstool-ng config options instead of the common hidden ones
      Rename BR2_INET_RPC to BR2_TOOLCHAIN_HAS_NATIVE_RPC
      toolchain-external: improve glibc support to test availability of RPC
      libtirpc: new package
      busybox: add support to link against libtirpc when available
      lmbench: add support to use libtirpc when available
      nfs-utils: add support to use RPC support from libtirpc
      rpcbind: new package
      portmap: mention that rpcbind is the project that superseds portmap
      quota: add support to use RPC support from libtirpc
      samba: unconditionally enable --with-sys-quotas
      xinetd: add support to use RPC support from libtirpc
      toolchain-external: add Sourcery CodeBench SuperH 2012.03
      toolchain-external: add Sourcery CodeBench x86 2012.03
      netkitbase: mark as deprecated
      netkittelnet: mark as deprecated

 package/Config.in                                  |    2 +
 package/busybox/busybox.mk                         |   30 ++++---
 package/libtirpc/Config.in                         |    7 ++
 ...able-parts-of-TIRPC-requiring-NIS-support.patch |   70 +++++++++++++++
 ...out-RPC-support-does-not-install-rpcent.h.patch |   26 ++++++
 ...btirpc-0003-Add-missing-INET6-conditional.patch |   60 +++++++++++++
 .../libtirpc-0004-Make-IPv6-support-optional.patch |   43 +++++++++
 package/libtirpc/libtirpc.mk                       |   17 ++++
 package/lmbench/Config.in                          |    6 +-
 package/lmbench/lmbench.mk                         |   11 ++-
 package/netkitbase/Config.in                       |    5 +-
 package/netkittelnet/Config.in                     |    5 +-
 package/nfs-utils/Config.in                        |    7 +-
 package/nfs-utils/nfs-utils.mk                     |    8 +-
 package/portmap/Config.in                          |    6 +-
 package/quota/Config.in                            |    6 +-
 package/quota/quota.mk                             |   13 ++-
 package/rpcbind/Config.in                          |    8 ++
 package/rpcbind/rpcbind-01-no-yp-support.patch     |   46 ++++++++++
 package/rpcbind/rpcbind.mk                         |   17 ++++
 package/samba/samba.mk                             |    2 +-
 package/xinetd/xinetd.mk                           |   19 +++-
 toolchain/helpers.mk                               |   29 ++++--
 toolchain/toolchain-buildroot/Config.in.2          |    2 +-
 toolchain/toolchain-common.in                      |    2 +-
 toolchain/toolchain-crosstool-ng/Config.in         |   10 ++-
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |   10 +--
 toolchain/toolchain-external/Config.in             |   93 +++++++++++++++++---
 toolchain/toolchain-external/ext-tool.mk           |   14 ++-
 toolchain/uClibc/uclibc.mk                         |   10 +--
 30 files changed, 507 insertions(+), 77 deletions(-)
 create mode 100644 package/libtirpc/Config.in
 create mode 100644 package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
 create mode 100644 package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
 create mode 100644 package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
 create mode 100644 package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
 create mode 100644 package/libtirpc/libtirpc.mk
 create mode 100644 package/rpcbind/Config.in
 create mode 100644 package/rpcbind/rpcbind-01-no-yp-support.patch
 create mode 100644 package/rpcbind/rpcbind.mk

Thanks,
-- 
Thomas Petazzoni
