From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 10:08:20 +0200
Subject: [Buildroot] [pull request] Pull request for branch 2010-05-15-fixes
Message-ID: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new pull request for the set of fixes I have for
2010.05. This new pull request gathers changes from both of the
previous 2010-05-14-fixes and 2010-05-15-fixes pull requests.

Changes since the previous pull requests made following Peter's
comments:

 * BR2_NEEDS_GETTEXT is now only set to 'y' if the C library doesn't
   contain gettext/libintl *and* BR2_ENABLE_LOCALE is set. This fixes
   the comment of Peter who wanted to compile Avahi without gettext is
   a !BR2_ENABLE_LOCALE case. I've tested this change by compiling
   "ltrace flex libcgicc avahi gmpc grep hal libglib2 libidn libsoup
   make libmpd php php_ext_gettext psmisc util-linux" with an ARM
   internal toolchain with locale enabled, an ARM Buildroot uClibc
   external toolchain with locale disabled and ARM Crosstool-NG eglibc
   external toolchain.

 * Add comment on lmbench requiring RPC support

 * Add comment on netsnmp not working with external toolchains +
   adding the same on BR2_PACKAGE_QUAGGA_SNMP.

The following changes since commit f3122259e2cbbc0be0fc02820a146b4e4f48bef6:
  Peter Korsgaard (1):
        mtd-utils: buildsystem is broken with parallel make (regarding libubi)

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot 2010-05-15-fixes

Thomas Petazzoni (19):
      Add a BR2_NEEDS_GETTEXT option
      Make all package using gettext rely on BR2_NEEDS_GETTEXT
      libcap: fix build failure
      libcgicc: fix package after autotools infrastructure conversion
      ltrace: fix build failure
      gettext: make only available if BR2_NEEDS_GETTEXT is set
      external toolchain: check BR2_INSTALL_LIBSTDCPP
      iconv: disallow selection when BR2_ENABLE_LOCALE is enabled
      lmbench: needs BR2_INET_RPC
      startup-notification: add dependency on xlib_libX11
      ntp: fix build failure
      samba: only require libiconv if !BR2_ENABLE_LOCALE
      pango: run pango-querymodules on the target instead of on the host
      cairo: remove host variant
      mutt: fix build and convert to autotools
      lvm2: do not override CC and similar variables
      uemacs: don't forget CFLAGS at link time
      vpnc: pass CFLAGS at link time
      netsnmp: disable build with external toolchain

 package/avahi/Config.in                            |    4 +-
 package/avahi/avahi.mk                             |    2 +-
 package/cairo/cairo.mk                             |    3 -
 package/gettext/Config.in                          |    2 +
 package/gmpc/Config.in                             |    4 +-
 package/gmpc/gmpc.mk                               |    3 +-
 package/grep/Config.in                             |    4 +-
 package/grep/grep.mk                               |    2 +-
 package/hal/Config.in                              |    4 +-
 package/hal/hal.mk                                 |    2 +-
 package/libcap/libcap.mk                           |    4 +-
 ...cgicc-3.2.9-disable-documentation-option.patch} |    0
 package/libcgicc/libcgicc.mk                       |    2 +
 package/libglib2/Config.in                         |    4 +-
 package/libglib2/libglib2.mk                       |    2 +-
 package/libiconv/Config.in                         |    1 +
 package/libidn/libidn.mk                           |    2 +-
 package/libsoup/libsoup.mk                         |    2 +-
 package/lmbench/Config.in                          |    5 ++
 package/ltrace/ltrace.mk                           |    3 +-
 package/lvm2/lvm2.mk                               |    2 +-
 package/make/Config.in                             |    4 +-
 package/make/make.mk                               |    2 +-
 package/multimedia/libmpd/Config.in                |    2 -
 package/mutt/mutt-1.5.16-makedoc-hostcc.patch      |   32 ---------
 package/mutt/mutt-1.5.17+20080114-nodoc.patch      |   21 ++++++
 package/mutt/mutt.mk                               |   73 +++-----------------
 package/netsnmp/Config.in                          |    6 ++
 package/ntp/ntp-4.2.4_p5-nano.patch                |   36 ++++++++++
 package/pango/S25pango                             |   20 ++++++
 package/pango/pango.mk                             |   18 +----
 package/php/Config.ext                             |    2 +-
 package/php/php.mk                                 |    2 +-
 package/psmisc/Config.in                           |    4 +-
 package/psmisc/psmisc.mk                           |    8 +--
 package/quagga/Config.in                           |    4 +
 package/samba/Config.in                            |    2 +-
 package/samba/samba.mk                             |    2 +-
 package/sshfs/Config.in                            |    4 +-
 package/sshfs/sshfs.mk                             |    2 +-
 package/startup-notification/Config.in             |    2 +
 .../startup-notification/startup-notification.mk   |    1 +
 package/uemacs/uemacs.mk                           |    2 +-
 package/util-linux/Config.in                       |    4 +-
 package/util-linux/util-linux.mk                   |    4 +-
 package/vpnc/vpnc.mk                               |    4 +-
 toolchain/Config.in.2                              |    8 ++
 toolchain/external-toolchain/ext-tool.mk           |   12 +++
 48 files changed, 175 insertions(+), 163 deletions(-)
 rename package/libcgicc/{cgicc-3.2.9-disable-documentation-option.patch => libcgicc-3.2.9-disable-documentation-option.patch} (100%)
 delete mode 100644 package/mutt/mutt-1.5.16-makedoc-hostcc.patch
 create mode 100644 package/mutt/mutt-1.5.17+20080114-nodoc.patch
 create mode 100644 package/ntp/ntp-4.2.4_p5-nano.patch
 create mode 100644 package/pango/S25pango

Thanks,
-- 
Thomas Petazzoni
