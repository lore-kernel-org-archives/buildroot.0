From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:47:40 +0200
Subject: [Buildroot] [PATCH 000/100] Rework of the gettext handling
Message-ID: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This (huge) patch series implements a long overdue rework of our
gettext handling.

The starting motivation for this rework is that we have been having
lots of build failures in static linking situations due to missing
-lintl, which happens because uClibc did not provide a gettext
implementation, even minimal.

Since then, uClibc-ng has grown a minimal gettext implementation,
which allows us to make sure that all 3 libraries provide a gettext
implementation by default, avoiding such libintl linking issues.

We have also realized that we were tying the enabling/disabling of NLS
support to the BR2_ENABLE_LOCALE, while these are completely
independent things. And therefore the distinction between
BR2_NEEDS_GETTEXT/BR2_NEEDS_GETTEXT_IF_LOCALE no longer made sense.

So, the main points of our rework are the following ones:

 - The minimal gettext implementation in uClibc is enabled (PATCH 5)

 - We introduce a hidden boolean BR2_TOOLCHAIN_HAS_FULL_GETTEXT that
   says if the C library provides a built-in full gettext
   implementation (glibc) or not (uclibc, musl). This is PATCH 6.

 - We add logic in the gettext package to force building libintl, even
   if the C library provides a gettext implementation. This is useful
   if a user wants full NLS support with uClibc or musl: the libintl
   from gettext would then override the minimal gettext implementation
   from the C library. PATCH 7 simply adds a hidden
   BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL boolean, which is not selected
   anywhere for now.

 - We introduce a BR2_SYSTEM_ENABLE_NLS option, which allows to enable
   or disable NLS support, independently from BR2_ENABLE_LOCALE. This
   option selects BR2_PACKAGE_GETTEXT when needed, and
   BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL is automatically enabled if
   the C library doesn't provide a full gettext implementation. This
   is PATCH 9.

   It is worth mentioning that BR2_SYSTEM_ENABLE_NLS cannot be enabled
   in dynamic linking situations. Indeed, we don't want to continue
   handling this crazy mess of missing -lintl flags in static linking
   situations. So, NLS support on statically linked systems is no
   longer possible.

 - PATCH 10 introduces the TARGET_NLS_DEPENDENCIES and TARGET_NLS_LIBS
   variables that packages should use to add the correct dependencies
   and link flags related to gettext.

 - PATCH 12 to 84 switch a large number of packages to the new gettext
   handling.

 - PATCH 85 to 97 remove lots of hacks and patches that were only
   needed to solve static linking issues related to libintl

 - PATCH 98 finally drops the
   BR2_NEEDS_GETTEXT/BR2_NEEDS_GETTEXT_IF_LOCALE options.

 - PATCH 99 and 100 update the documentation

 - Other patches (PATCH 1 to 4 and PATCH 11) are minor
   preparation/fixup patches.

Best regards,

Thomas


Thomas Petazzoni (100):
  libglib2: disable compiler warnings
  flex: remove bogus comment
  lvm2: force disable NLS support
  ushare: do not use the DISABLE_NLS variable
  uclibc: enable libintl stubs
  toolchain: introduce BR2_TOOLCHAIN_HAS_FULL_GETTEXT
  gettext: force build libintl if needed
  package: rename DISABLE_NLS to NLS_OPTS
  system: introduce BR2_SYSTEM_ENABLE_NLS
  package/Makefile.in: introduce TARGET_NLS_{DEPENDENCIES,LIBS}
  package/Makefile.in: fix musl handling
  alsa-utils: use new gettext logic
  avahi: use new gettext logic
  axel: use the new gettext logic
  binutils: use the new gettext logic
  clamav: use new gettext logic
  coreutils: use the new gettext logic
  cryptsetup: use new gettext logic
  curlftpfs: use new gettext logic
  diffutils: use new gettext logic
  ding-libs: use the new gettext logic
  dnsmasq: use new gettext logic
  dos2unix: use new gettext logic
  dropwatch: use new gettext logic
  efibootmgr: use the new gettext logic
  elfutils: use the new gettext logic
  exiv2: use the new gettext logic
  fetchmail: use the new gettext logic
  flex: use the new gettext logic
  gdbm: use the new gettext logic
  git: use the new gettext logic
  glib-networking: use the new gettext logic
  gmpc: use the new gettext logic
  gnuchess: use the new gettext logic
  grep: use the new gettext logic
  httping: use the new gettext logic
  json-glib: use the new gettext logic
  kbd: use the new gettext logic
  lbreakout2: use the new gettext logic
  libconfuse: use the new gettext logic
  libftdi1: use the new gettext logic
  libglib2: use the new gettext logic
  libgpg-error: use the new gettext logic
  libidn: use the new gettext logic
  libuio: use the new gettext logic
  libv4l: use the new gettext logic
  libvips: use the new gettext logic
  lightning: remove -lintl linking
  linux-pam: use the new gettext logic
  linux-tools: use the new gettext logic
  lshw: use the new gettext logic
  ltris: use the new gettext logic
  madplay: use the new gettext logic
  make: use the new gettext logic
  mcrypt: use the new gettext logic
  midori: use the new gettext logic
  minidlna: use the new gettext logic
  ndisc6: use the new gettext logic
  net-tools: use the new gettext logic
  newt: use the new gettext logic
  nftables: use the new gettext logic
  pango: use the new gettext logic
  php: use the new gettext logic
  popt: use the new gettext logic
  powertop: use the new gettext logic
  procps-ng: use the new gettext logic
  psmisc: use the new gettext logic
  pv: use the new gettext logic
  python: use the new gettext logic
  quota: use the new gettext logic
  rhash: use the new gettext logic
  rpm: use the new gettext logic
  rrdtool: use the new gettext logic
  samba4: use the new gettext logic
  sshfs: use the new gettext logic
  sysstat: use the new gettext logic
  tpm-tools: use the new gettext logic
  ushare: use the new gettext logic
  util-linux: use the new gettext logic
  vdr: use the new gettext logic
  vim: use the new gettext logic
  whois: use the new gettext logic
  xlib_libXpm: use the new gettext logic
  xscreensaver: use the new gettext logic
  e2fsprogs: remove libintl static linking handling
  gnuchess: remove libintl static linking handling
  gptfdisk: remove libintl static linking handling
  iputils: remove libintl static linking handling
  net-tools: remove libintl static linking handling
  oprofile: remove libintl static linking handling
  parted: remove libintl static linking handling
  perl: remove libintl static linking handling
  popt: remove libintl static linking handling
  qt: remove libintl static linking handling
  util-linux: remove libintl static linking handling
  xfsprogs: remove libintl static linking handling
  xmlstarlet: remove libintl static linking handling
  toolchain: drop BR2_NEEDS_GETTEXT{,_IF_LOCALE}
  docs/manual: update gettext details
  CHANGES: add details on the gettext revamp

 CHANGES                                            |  19 ++++
 docs/manual/adding-packages-gettext.txt            |  83 ++++++++--------
 package/Makefile.in                                |  18 +++-
 package/alsa-utils/Config.in                       |   1 -
 package/alsa-utils/alsa-utils.mk                   |  13 +--
 package/avahi/Config.in                            |   1 -
 package/avahi/avahi.mk                             |   6 +-
 package/axel/Config.in                             |   1 -
 package/axel/axel.mk                               |  12 +--
 package/binutils/Config.in                         |   1 -
 package/binutils/binutils.mk                       |   3 +-
 package/clamav/Config.in                           |   1 -
 package/clamav/clamav.mk                           |   2 +-
 package/coreutils/coreutils.mk                     |   5 +-
 package/cryptsetup/Config.in                       |   1 -
 package/cryptsetup/cryptsetup.mk                   |   7 +-
 package/curlftpfs/Config.in                        |   1 -
 package/curlftpfs/curlftpfs.mk                     |   2 +-
 package/diffutils/Config.in                        |   1 -
 package/diffutils/diffutils.mk                     |   2 +-
 package/ding-libs/Config.in                        |   6 --
 package/ding-libs/ding-libs.mk                     |   2 +-
 package/dnsmasq/Config.in                          |   1 -
 package/dnsmasq/dnsmasq.mk                         |   4 +-
 package/dos2unix/Config.in                         |   1 -
 package/dos2unix/dos2unix.mk                       |  15 ++-
 package/dropwatch/dropwatch.mk                     |  10 +-
 package/e2fsprogs/e2fsprogs.mk                     |   6 --
 package/efibootmgr/Config.in                       |   7 +-
 package/efibootmgr/efibootmgr.mk                   |   4 +-
 package/elfutils/Config.in                         |   1 -
 package/elfutils/elfutils.mk                       |  11 +--
 package/exiv2/exiv2.mk                             |   7 +-
 package/fetchmail/fetchmail.mk                     |   8 +-
 package/flex/Config.in                             |   1 -
 package/flex/flex.mk                               |   4 +-
 package/gdbm/gdbm.mk                               |   5 +-
 package/gettext/Config.in                          |  10 +-
 package/gettext/gettext.mk                         |   8 ++
 package/git/git.mk                                 |   6 +-
 package/glib-networking/Config.in                  |   1 -
 package/glib-networking/glib-networking.mk         |   2 +-
 package/gmpc/Config.in                             |   1 -
 package/gmpc/gmpc.mk                               |   2 +-
 .../0001-fix-static-build-with-uClibc.patch        |  47 ---------
 package/gnuchess/Config.in                         |   1 -
 package/gnuchess/gnuchess.mk                       |   2 +-
 package/gptfdisk/gptfdisk.mk                       |   9 +-
 package/grep/grep.mk                               |   6 +-
 package/httping/Config.in                          |   1 -
 package/httping/httping.mk                         |   6 +-
 package/iputils/iputils.mk                         |   7 --
 package/json-glib/Config.in                        |   1 -
 package/json-glib/json-glib.mk                     |   2 +-
 package/kbd/Config.in                              |   1 -
 package/kbd/kbd.mk                                 |   2 +-
 package/lbreakout2/Config.in                       |   1 -
 package/lbreakout2/lbreakout2.mk                   |  10 +-
 package/libconfuse/libconfuse.mk                   |   5 +-
 package/libftdi1/libftdi1.mk                       |   5 +-
 package/libglib2/Config.in                         |   1 -
 package/libglib2/libglib2.mk                       |   7 +-
 package/libgpg-error/libgpg-error.mk               |   5 +-
 package/libidn/Config.in                           |   1 -
 package/libidn/libidn.mk                           |   2 +-
 package/libuio/Config.in                           |   1 -
 package/libuio/libuio.mk                           |   9 +-
 package/libv4l/Config.in                           |   1 -
 package/libv4l/libv4l.mk                           |   4 +-
 package/libvips/Config.in                          |   3 +-
 package/libvips/libvips.mk                         |   2 +-
 package/lightning/lightning.mk                     |   2 -
 package/linux-pam/Config.in                        |   1 -
 package/linux-pam/linux-pam.mk                     |   9 +-
 package/linux-tools/Config.in                      |   6 --
 package/linux-tools/linux-tool-cpupower.mk         |   4 +-
 package/lshw/Config.in                             |   1 -
 package/lshw/lshw.mk                               |   6 +-
 package/ltris/Config.in                            |   1 -
 package/ltris/ltris.mk                             |   8 +-
 package/lvm2/lvm2.mk                               |   6 +-
 package/madplay/Config.in                          |   1 -
 package/madplay/madplay.mk                         |   2 +-
 package/make/Config.in                             |   1 -
 package/make/make.mk                               |   2 +-
 package/mcrypt/Config.in                           |   1 -
 package/mcrypt/mcrypt.mk                           |   2 +-
 package/midori/Config.in                           |   1 -
 package/midori/midori.mk                           |   2 +-
 package/minidlna/Config.in                         |   1 -
 package/minidlna/minidlna.mk                       |   2 +-
 package/ndisc6/Config.in                           |   1 -
 package/ndisc6/ndisc6.mk                           |   8 +-
 ...efile-fix-static-linking-issue-with-lintl.patch |  79 ----------------
 ...1-iptunnel.c-do-not-include-netinet-ip.h.patch} |   0
 package/net-tools/Config.in                        |   1 -
 package/net-tools/net-tools.mk                     |   6 +-
 package/newt/Config.in                             |   1 -
 package/newt/newt.mk                               |   6 +-
 package/nftables/Config.in                         |   1 -
 package/nftables/nftables.mk                       |   2 +-
 package/oprofile/oprofile.mk                       |   6 --
 package/pango/Config.in                            |   1 -
 package/pango/pango.mk                             |   2 +-
 ...musl.patch => 0003-fix-includes-for-musl.patch} |   0
 package/parted/0003-fix-static-link-uuid.patch     |  48 ----------
 .../0001-fix-static-build-with-gdbm-gettext.patch  |  20 ----
 package/php/Config.ext                             |   5 -
 package/php/php.mk                                 |   2 +-
 package/pkg-autotools.mk                           |   2 +-
 ...-the-libintl-library-to-the-Libs.private-.patch |  47 ---------
 package/popt/popt.mk                               |   5 +-
 package/powertop/Config.in                         |   1 -
 package/powertop/powertop.mk                       |   9 +-
 package/procps-ng/Config.in                        |   1 -
 package/procps-ng/procps-ng.mk                     |   8 +-
 package/psmisc/Config.in                           |   1 -
 package/psmisc/psmisc.mk                           |   2 +-
 package/pv/Config.in                               |   1 -
 package/pv/pv.mk                                   |   8 +-
 package/python/python.mk                           |   6 +-
 ...form-socklen_t-on-other-C-libraries-than.patch} |   0
 ...-inclusion-order-when-building-statically.patch | 105 ---------------------
 ...ith-ldl-option-only-when-it-is-supported.patch} |   0
 ...12-OpenGL-EGL-Avoid-X11-header-collision.patch} |   0
 package/quota/Config.in                            |   1 -
 package/quota/quota.mk                             |   8 +-
 package/rhash/Config.in                            |   1 -
 package/rhash/rhash.mk                             |   9 +-
 package/rpm/Config.in                              |   1 -
 package/rpm/rpm.mk                                 |   4 +-
 package/rrdtool/Config.in                          |   1 -
 package/rrdtool/rrdtool.mk                         |   6 +-
 package/samba4/samba4.mk                           |   9 +-
 package/sshfs/Config.in                            |   1 -
 package/sshfs/sshfs.mk                             |   2 +-
 package/sysstat/Config.in                          |   1 -
 package/sysstat/sysstat.mk                         |   8 +-
 package/tpm-tools/Config.in                        |   1 -
 package/tpm-tools/tpm-tools.mk                     |   3 +-
 package/uclibc/uClibc-ng.config                    |   1 +
 package/ushare/Config.in                           |   1 -
 package/ushare/ushare.mk                           |  20 ++--
 package/util-linux/Config.in                       |   1 -
 package/util-linux/util-linux.mk                   |  16 +---
 package/vdr/Config.in                              |   1 -
 package/vdr/vdr.mk                                 |   9 +-
 package/vim/Config.in                              |   1 -
 package/vim/vim.mk                                 |   2 +-
 package/whois/Config.in                            |   1 -
 package/whois/whois.mk                             |   8 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |   3 +-
 .../0004-build-add-EXTRALIBS-to-link-with.patch    |  53 -----------
 package/xfsprogs/xfsprogs.mk                       |  17 ----
 package/xmlstarlet/xmlstarlet.mk                   |   2 +-
 package/xscreensaver/Config.in                     |   1 -
 package/xscreensaver/xscreensaver.mk               |   2 +-
 system/Config.in                                   |  19 ++++
 toolchain/Config.in                                |   1 +
 toolchain/toolchain-common.in                      |  16 +---
 160 files changed, 274 insertions(+), 846 deletions(-)
 delete mode 100644 package/gnuchess/0001-fix-static-build-with-uClibc.patch
 delete mode 100644 package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch
 rename package/net-tools/{0002-iptunnel.c-do-not-include-netinet-ip.h.patch => 0001-iptunnel.c-do-not-include-netinet-ip.h.patch} (100%)
 rename package/parted/{0004-fix-includes-for-musl.patch => 0003-fix-includes-for-musl.patch} (100%)
 delete mode 100644 package/parted/0003-fix-static-link-uuid.patch
 delete mode 100644 package/perl/0001-fix-static-build-with-gdbm-gettext.patch
 delete mode 100644 package/popt/0004-popt.pc-add-the-libintl-library-to-the-Libs.private-.patch
 rename package/qt/{0011-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch => 0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch} (100%)
 delete mode 100644 package/qt/0010-Fix-library-inclusion-order-when-building-statically.patch
 rename package/qt/{0012-Link-with-ldl-option-only-when-it-is-supported.patch => 0011-Link-with-ldl-option-only-when-it-is-supported.patch} (100%)
 rename package/qt/{0013-OpenGL-EGL-Avoid-X11-header-collision.patch => 0012-OpenGL-EGL-Avoid-X11-header-collision.patch} (100%)
 delete mode 100644 package/xfsprogs/0004-build-add-EXTRALIBS-to-link-with.patch

-- 
2.9.4
