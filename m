From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 15 Oct 2016 16:50:54 +0200
Subject: [Buildroot] Deprecate BR2_DEPRECATED
Message-ID: <20161015145107.18264-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 The BR2_DEPRECATED logic is a lot less useful than the legacy handling,
because the symbols just disappears without warning to the user. For
example, we had a few defconfigs that were using deprecated symbols
(which were not actually used because BR2_DEPRECATED wasn't set) so
these didn't build the expected code anymore.

 Also, the idea behind BR2_DEPRECATED is that you can easily revive it
again if there is interest. However, it is relatively easy to revert
the removal of a package as well.

 The deprecation is also more effort because it has to be removed twice:
once when deprecating, and once when really removing.

 Patches 1 and 2 remove the U-Boot build from two defconfigs that were
using the deprecated binutils 2.24. Similarly, lego_ev3_defconfig is
using the deprecated gcc 4.7 symbol; I didn't update that one because
either Vincent Stehl? will update that defconfig, or we will remove it.

 Patches 3-12 remove the packages or package options that are currently
deprecated.

 Patch 13 removed BR2_DEPRECATED itself.

 Regards,
 Arnout

---
The following changes since commit 81bf01cbffeb73f9db1cc67738030a00749324b7:

  core/legal-info: don't generate big file with all license texts (2016-10-15 12:52:42 +0200)

are available in the git repository at:

  https://github.com/arnout/buildroot.git 

for you to fetch changes up to ce8bfe45893dcf53776c3e9a5eeace1943bd91ba:

  Remove BR2_DEPRECATED (2016-10-15 16:32:48 +0200)

----------------------------------------------------------------
Arnout Vandecappelle (13):
      configs/freescale_p1010rdb_pa: remove U-Boot build
      configs/freescale_mpc8315erdb: remove U-Boot build
      binutils: remove deprecated 2.24.X
      gcc: remove deprecated 4.7.x
      ipkg: remove deprecated package
      kodi-addon-xvdr: remove deprecated package
      linux-headers: remove deprecated version 4.2 and 4.3
      sstrip: remove deprecated package
      torsmo: remove deprecated package
      webkitgtk24: remove deprecated package
      wvdial: remove deprecated package
      wvstreams: remove deprecated package
      Remove BR2_DEPRECATED

 Config.in                                          |  30 ---
 Config.in.legacy                                   |  97 +++++++-
 DEVELOPERS                                         |   3 -
 Makefile                                           |   2 -
 Makefile.legacy                                    |   3 -
 board/freescale/mpc8315erdb/readme.txt             |  30 +--
 board/freescale/p1010rdb/readme.txt                |  45 +---
 configs/freescale_mpc8315erdb_defconfig            |   9 -
 configs/freescale_p1010rdb_pa_defconfig            |   8 -
 package/Config.in                                  |   6 -
 package/binutils/Config.in.host                    |  11 -
 package/gcc/Config.in.host                         |  23 --
 package/gcc/gcc-final/gcc-final.mk                 |  12 -
 package/ipkg/0001-fix-musl-build.patch             |  50 ----
 package/ipkg/0002-fix-nommu.patch                  |  24 --
 package/ipkg/Config.in                             |   7 -
 package/ipkg/ipkg-build                            | 127 ----------
 package/ipkg/ipkg.hash                             |   2 -
 package/ipkg/ipkg.mk                               |  13 -
 package/kodi-addon-xvdr/0001-xbmc-rebrand.patch    |  19 --
 package/kodi-addon-xvdr/Config.in                  |  16 --
 package/kodi-addon-xvdr/kodi-addon-xvdr.hash       |   2 -
 package/kodi-addon-xvdr/kodi-addon-xvdr.mk         |  26 --
 package/kodi/Config.in                             |   1 -
 package/linux-headers/Config.in.host               |  12 -
 package/sstrip/Config.in                           |   8 -
 package/sstrip/sstrip.mk                           |  20 --
 package/torsmo/Config.in                           |  11 -
 package/torsmo/torsmo.hash                         |   2 -
 package/torsmo/torsmo.mk                           |  18 --
 package/uclibc/uclibc.mk                           |   7 +-
 package/webkitgtk24/0001-fix-ppc32.patch           |  34 ---
 ...etty-quotes-in-licence-break-Python-stdin.patch |  36 ---
 package/webkitgtk24/Config.in                      |  83 -------
 package/webkitgtk24/webkitgtk24.hash               |   4 -
 package/webkitgtk24/webkitgtk24.mk                 | 124 ----------
 package/wvdial/0001-uClibc-scandir.patch           |  23 --
 package/wvdial/Config.in                           |  17 --
 package/wvdial/wvdial.hash                         |   2 -
 package/wvdial/wvdial.mk                           |  32 ---
 .../0001-fix-uClibc-compile-getcontext.patch       | 273 ---------------------
 ...002-fix-uClibc-compile-execinfo-backtrace.patch |  31 ---
 .../wvstreams/0003-fix-uClibc-compile-misc.patch   |  16 --
 package/wvstreams/0004-build-fixes.patch           |  40 ---
 package/wvstreams/0005-getuid.patch                |  25 --
 package/wvstreams/Config.in                        |  19 --
 package/wvstreams/wvstreams.hash                   |   2 -
 package/wvstreams/wvstreams.mk                     |  62 -----
 48 files changed, 105 insertions(+), 1362 deletions(-)
 delete mode 100644 package/ipkg/0001-fix-musl-build.patch
 delete mode 100644 package/ipkg/0002-fix-nommu.patch
 delete mode 100644 package/ipkg/Config.in
 delete mode 100755 package/ipkg/ipkg-build
 delete mode 100644 package/ipkg/ipkg.hash
 delete mode 100644 package/ipkg/ipkg.mk
 delete mode 100644 package/kodi-addon-xvdr/0001-xbmc-rebrand.patch
 delete mode 100644 package/kodi-addon-xvdr/Config.in
 delete mode 100644 package/kodi-addon-xvdr/kodi-addon-xvdr.hash
 delete mode 100644 package/kodi-addon-xvdr/kodi-addon-xvdr.mk
 delete mode 100644 package/sstrip/Config.in
 delete mode 100644 package/sstrip/sstrip.mk
 delete mode 100644 package/torsmo/Config.in
 delete mode 100644 package/torsmo/torsmo.hash
 delete mode 100644 package/torsmo/torsmo.mk
 delete mode 100644 package/webkitgtk24/0001-fix-ppc32.patch
 delete mode 100644 package/webkitgtk24/0003-Pretty-quotes-in-licence-break-Python-stdin.patch
 delete mode 100644 package/webkitgtk24/Config.in
 delete mode 100644 package/webkitgtk24/webkitgtk24.hash
 delete mode 100644 package/webkitgtk24/webkitgtk24.mk
 delete mode 100644 package/wvdial/0001-uClibc-scandir.patch
 delete mode 100644 package/wvdial/Config.in
 delete mode 100644 package/wvdial/wvdial.hash
 delete mode 100644 package/wvdial/wvdial.mk
 delete mode 100644 package/wvstreams/0001-fix-uClibc-compile-getcontext.patch
 delete mode 100644 package/wvstreams/0002-fix-uClibc-compile-execinfo-backtrace.patch
 delete mode 100644 package/wvstreams/0003-fix-uClibc-compile-misc.patch
 delete mode 100644 package/wvstreams/0004-build-fixes.patch
 delete mode 100644 package/wvstreams/0005-getuid.patch
 delete mode 100644 package/wvstreams/Config.in
 delete mode 100644 package/wvstreams/wvstreams.hash
 delete mode 100644 package/wvstreams/wvstreams.mk
