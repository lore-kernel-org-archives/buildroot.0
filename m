From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:53:00 +0200
Subject: [Buildroot] [RFC v4 00/16] Add per-package staging feature
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC9uNDL=CDSHmx-O+WK48bkfU4N98Cpfv_D=UJCD=wLyAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 28, 2015 at 9:42 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> Hi all,
> this patch set aims to improve build reproducibility by using a
> per-package staging directory.
> Also this feature aims to enable the top-level parallel make.
>
> This patch set is available at:
> https://github.com/fabio-porcedda/buildroot/tree/pps-v4
>
>
> Every package instead of installing the files in the shared staging
> directory (STAGING_DIR) install all files in a subdirectory of the
> STAGINGPKG_DIR.
>
> At the beginning of the configure stage, all the dependencies staging
> directory are copied in the package staging directory, e.g.:
>
> zlib-install-staging: install files in /output/stagingpkg/zlib/
>
> cramsfs-configure: copy all files from /output/stagingpkg/zlib/* to
>   /output/stagingpkg/cramfs/
>
> The STAGING_DIR variable is redefined for every package in order to
> point to the per-package directory, so a package cannot access
> automatically to staging files of packages that aren't in the
> (PKG)_DENDENDENCIES variable.
>
> To improve performance and reduce space utilization hard links are used.
>
> To evaluate performance and space utilization I've done some tests.
>
> HW-MED:
> CPU: Intel i7-4790K (4x2 @4GHz) = 8 threads
> RAM: 16GB
> SSD: 512GB
>
> HW-HIGH:
> CPU: 2 x Xeon 2620v3 (6x2 @2.40Ghz) = 24 threads
> RAM: 32GB
> SATA: RAID0 2x2TB 3.5" 7200rpm
>
>
> defconfig-small, long chain dependency, unfavorable  scenario for parallelization:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XSERVER_XORG_SERVER=y
> BR2_PACKAGE_LIBGTK3=y
>
> defconfig-full:
>   BR2_arm=y
>   BR2_TOOLCHAIN_EXTERNAL=y
> make allyespackageconfig
> Also i removed few packages that do not built on my system.
> make show-targets | wc -w
> 1366
>
> Test about output using hard links or note using the "defconfig-full"
> on HW-MED:
>
> |  35GB |  99m | master branch
> |  37GB | 100m | patch set
> | 153GB | 105m | patch set using hard links only for the toolchain sysroot
> | 225GB | 106m | patch set not using hardlinks at all
>
> Test about performances of this patch set vs master branch:
> | 199m | HW-MED | defconfig-full | master branch | no top-level make |
> |  99m | HW-MED | defconfig-full | master branch | top-level make    |
> | 100m | HW-MED | defconfig-full | patch set     | top-level make    |
>
> | 350m | HW-HIGH | defconfig-full | master branch | no top-level make |
> |  73m | HW-HIGH | defconfig-full | master branch | top-level make    |
> |  77m | HW-HIGH | defconfig-full | patch set     | top-level make    |
>
> | 10m | HW-MED | defconfig-small | master branch | no top-level make |
> |  5m | HW-MED | defconfig-small | master branch | top-level make    |
> |  5m | HW-MED | defconfig-samll | patch set     | top-level make    |
>
> | 21m18s | HW-HIGH | defconfig-small | master branch | no top-level make |
> |  7m53s | HW-HIGH | defconfig-small | master branch | top-level make    |
> |  7m54s | HW-HIGH | defconfig-samll | patch set     | top-level make    |
>
>
> TODO:
>  - use the toolchaing wrapper even for the internal toolchain
>  - rebase over master (this patch set is based on 2015.05-161-gca5f11e).
>  - more testing (tested only for arm target).


v4:
 - Rewritten the path set to use the gcc --sysroot option trough the
toolchain wrapper.

> Best regads
>
> Fabio Porcedda (16):
>   packages: use TARGET_MAKE_ENV to add pps support
>   packages: for staging stuff use backtick instead of the shell function
>   packages/scons: make avaiable the GCC_SYSROOT environment variable
>   packages/qt: read spec files from the per-package staging directory
>   pkg-perl: use TARGET_MAKE_ENV to add pps support
>   tooclahin-external: add support for GCC_SYSROOT
>   toolchain-external: move some code in a new function
>   toolchain-external: use the wrapper even for the linker "ld"
>   infra: add GCC_SYSROOT environment variable to support pps feature
>   pkg-cmake: add GCC_SYSROOT environment variable to support pps feature
>   pkg-python: add GCC_SYSROOT variable to add pps support
>   pacakge/luarocks: add GCC_SYSROOT environment variable to support pps
>   package/pkgconf: use GCC_SYSROOT to support pps feature
>   Makefile: add STAGINGNOPKG_DIR variable
>   pkg-generic: ADD_TOOLCHAIN_DEPENDENCY is true only for target packages
>   infra: add per-package staging feature
>
>  Makefile                                           | 16 ++--
>  package/Makefile.in                                |  5 +-
>  package/aiccu/aiccu.mk                             |  2 +-
>  package/blktrace/blktrace.mk                       |  2 +-
>  package/boost/boost.mk                             |  2 +-
>  package/botan/botan.mk                             |  2 +-
>  package/bsdiff/bsdiff.mk                           |  4 +-
>  package/dbus-python/dbus-python.mk                 |  8 +-
>  package/dhcpdump/dhcpdump.mk                       |  3 +-
>  package/dtc/dtc.mk                                 |  3 +-
>  package/exim/exim.mk                               |  5 +-
>  package/fbv/fbv.mk                                 |  2 +-
>  package/feh/feh.mk                                 |  4 +-
>  package/gadgetfs-test/gadgetfs-test.mk             |  2 +-
>  package/gdk-pixbuf/gdk-pixbuf.mk                   |  2 +-
>  package/iodine/iodine.mk                           |  2 +-
>  package/iw/iw.mk                                   |  2 +-
>  package/jack2/jack2.mk                             |  3 +-
>  package/libmicrohttpd/libmicrohttpd.mk             |  2 +-
>  package/libnss/libnss.mk                           |  4 +-
>  package/libupnpp/libupnpp.mk                       |  2 +-
>  package/lmbench/lmbench.mk                         |  8 +-
>  package/logrotate/logrotate.mk                     |  2 +-
>  package/lua-msgpack-native/lua-msgpack-native.mk   |  3 +-
>  ...ctions-to-the-global-environment-of-the-c.patch | 54 ++++++++++++
>  package/luarocks/0002-fixed-typo.patch             | 27 ++++++
>  ...e-environment-table-for-the-system-config.patch | 76 +++++++++++++++++
>  ...is-not-being-integrated-bug-introduced-in.patch | 62 ++++++++++++++
>  package/luarocks/luarocks.mk                       | 11 ++-
>  package/madplay/madplay.mk                         |  2 +-
>  package/moarvm/moarvm.mk                           |  2 +-
>  package/mongoose/mongoose.mk                       |  8 +-
>  package/mpg123/mpg123.mk                           |  2 +-
>  package/mplayer/mplayer.mk                         |  2 +-
>  package/ncurses/ncurses.mk                         |  4 +-
>  package/neardal/neardal.mk                         |  2 +-
>  package/nginx/nginx.mk                             |  1 +
>  package/nmap/nmap.mk                               |  2 +-
>  package/open2300/open2300.mk                       |  2 +-
>  package/openldap/openldap.mk                       |  2 +-
>  package/openssl/openssl.mk                         |  2 +-
>  package/opentyrian/opentyrian.mk                   |  2 +-
>  package/pax-utils/pax-utils.mk                     |  3 +-
>  package/php/php.mk                                 |  4 +-
>  package/pifmrds/pifmrds.mk                         |  3 +-
>  package/pkg-cmake.mk                               |  1 +
>  package/pkg-generic.mk                             | 43 +++++++++-
>  package/pkg-perl.mk                                |  2 +-
>  package/pkg-python.mk                              |  2 +
>  package/pkgconf/pkg-config.in                      |  4 +-
>  package/pkgconf/pkgconf.mk                         |  5 +-
>  package/poco/poco.mk                               |  3 +-
>  package/poppler/poppler.mk                         |  2 +-
>  package/pppd/pppd.mk                               |  2 +-
>  package/python-gobject/python-gobject.mk           |  4 +-
>  package/python-pygame/python-pygame.mk             |  6 +-
>  package/python-pyqt/python-pyqt.mk                 |  1 +
>  package/python-sip/python-sip.mk                   |  2 +-
>  package/qt/qt.mk                                   | 18 ++--
>  package/qtuio/qtuio.mk                             |  3 +-
>  package/rtmpdump/rtmpdump.mk                       |  2 +-
>  package/scons/scons.mk                             |  3 +-
>  package/scons/site_init.py                         | 19 +++++
>  package/speex/speex.mk                             |  3 +-
>  package/statserial/statserial.mk                   |  3 +-
>  package/tcpreplay/tcpreplay.mk                     |  6 +-
>  package/ti-utils/ti-utils.mk                       |  6 +-
>  package/tvheadend/tvheadend.mk                     |  4 +-
>  package/upmpdcli/upmpdcli.mk                       |  2 +-
>  package/ushare/ushare.mk                           |  3 +-
>  package/vsftpd/vsftpd.mk                           |  4 +-
>  support/misc/toolchainfile.cmake.in                |  9 +-
>  .../toolchain-external/ext-toolchain-wrapper.c     | 96 ++++++++++++++--------
>  toolchain/toolchain-external/toolchain-external.mk |  2 +-
>  74 files changed, 476 insertions(+), 147 deletions(-)
>  create mode 100644 package/luarocks/0001-added-2-functions-to-the-global-environment-of-the-c.patch
>  create mode 100644 package/luarocks/0002-fixed-typo.patch
>  create mode 100644 package/luarocks/0003-fix-use-same-environment-table-for-the-system-config.patch
>  create mode 100644 package/luarocks/0004-config.lua-is-not-being-integrated-bug-introduced-in.patch
>  create mode 100644 package/scons/site_init.py
>
> --
> 2.4.3
>

Best regards
-- 
Fabio Porcedda
