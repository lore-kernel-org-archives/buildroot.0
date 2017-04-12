From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:34 +0200
Subject: [Buildroot] [PATCH 00/53] Eliminate $(HOST_DIR)/usr
Message-ID: <20170412093928.1006-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently use $(HOST_DIR)/usr as the prefix for host packages. That
has a few disadvantages:

- There are some things installed in $(HOST_DIR)/etc and
  $(HOST_DIR)/sbin, which is inconsistent.

- To pack a buildroot-built toolchain into a tarball for use as an
  external toolchain, you have to pack output/host/usr instead of the
  more obvious output/host.

- Because of the above, the internal toolchain wrapper breaks which
  forces us to work around it (call the actual toolchain executable
  directly). This is OK for us, but when used in another build system,
  that's a problem.

- Paths are four characters longer.

This series replaces all occurences of 'host/usr' (in its various forms)
with 'host', and updates relative paths accordingly.

To allow for a gradual change, host/usr is replaced with a symlink, so
that everything keeps working. Except that it turns out that not
everything keeps working when we do that: quite a few things need to
be fixed. Therefore that patch is split up into three steps:

- First $(HOST_DIR)/usr/$(GNU_TARGET_NAME) is moved one level up. This
  can be done safely (tested with both internal and external toolchain
  and building a few packages). The usr bit is removed from STAGING_DIR
  in the same patch, though it could have been split off.

- Next, $(HOST_DIR)/usr/lib is moved one level up. This can only be
  done after the first step, otherwise the internal toolchain fails to
  find ar, ld, etc. Also, when we do this, check-host-rpath has to be
  adapted to take into account the new location of the shared libs. The
  check-host-rpath change could have been partly split off in a
  separate patch, but then we'd have to check for either lib or
  usr/lib, and afterwards check only for lib again.

- Then we can move the entire host/usr one level up. At the same time,
  the ../.. in the external toolchain and toolchain wrapper has to be
  changed. Doing /bin and /sbin in a separate step still turns out not
  to be possible, again because of the internal toolchain that doesn't
  find cc1 etc. And it anyway wouldn't help much, because the ../..
  change has to be done in the same patch as moving the bin directory.

I've tested both internal and external toolchains, and a large number
of host packages after these changes. That turned up one problem:
libsepol, which creates a symlink that is no longer valid after the
move. Fortunately that could be fixed in an independent patch.

Next comes a long series of patches that clean things up. They are all
mostly independent from each other, although sometimes there will be
merge conflicts of course.

- The first three are things that were also covered by the automatic
  replacements, but required some additional fixups. So these are
  split up into patches that stand on their own. They are anyway also
  infrastructure changes so nicer to have in separate patches.

- Next we have two patches that fix the use of
  $(HOST_DIR)/usr/$(GNU_TARGET_NAME) in gcc and gdb. These could in
  fact come immediately after the move of that directory, but I thought
  it was nicer to keep all the cleanups together.

- Next come six patches that clean up the various infras.

- Next are seven patches that clean up things globally using various
  regexes. I actually created those patches over a year ago already and
  just refreshed them by re-applying the regex.

- Next come two patches that fix up things not caught by the regex.

- Then come thirteen patches that fix up things in various scripts and
  readmes and that weren't caught by the automatic replacement (mostly
  because those are using $HOST_DIR and not $(HOST_DIR) ).

- Then we get the libffi patch, which fixes a use of $(HOST_DIR)/usr
  that I accidentally stumbled upon while testing.

- Finally we get 14 patches that fix the use of $(HOST_DIR) as prefix
  instead of DESTDIR. In autotools and CMake host packages, we don't
  use DESTDIR but we set --prefix to the host directory. Indeed,
  DESTDIR is meant for situations where we build in a build-root, i.e.
  where the installation directory is not the same absolute path where
  things will be executed. For host packages, however, the installation
  directory *is* where it will be executed.

  So for autotools and CMake host packages this works well, but quite a
  few generic packages turn out to use something like DESTDIR
  incorrectly. I found these by grepping for DESTDIR.*HOST_DIR and
  checking if it was correct (in very few cases it was indeed correct).
  See the individual patches for details.

  In this part, the SELinux packages turn out to be a bit problematic.
  Most of them have a PREFIX that defaults to $(DESTDIR)/usr, but then
  some installation commands don't use PREFIX and instead directlly
  refer to $(DESTDIR)/etc or $(DESTDIR)/usr/share/man. Also, sometimes
  policycoreutils uses $(DESTDIR)/usr/include/glib-2.0 to find glib
  includes.

I also noticed a small issue in pkg-rebar, so I added an additional
patch in the very beginning of the series that fixes it. It's totally
independent of the rest, however.

After the entire series, I have removed the usr symlink and I've
build-tested all the host packages, as well as grub2, gummiboot and
syslinux. Quite a few of these just failed to build on my machine, but
that didn't seem to be related to the host/usr move.

There are still problematic packages:

- As mentioned before, policycoreutils hardcodes the /usr part to find
  glib-2.0 and dbus-1.0 headers and libraries.

- policycoreutils and the other SELinux packages install stuff in
  $(HOST_DIR)/usr, but it's harmless stuff (man pages, bash completion,
  etc.).

All the rest looks fine!

For policycoreutils, I guess the next step is to make upstreamable
patches to convert to pkg-config. But that was a bit too much for this
series :-). For the installation of man pages and stuff in
$(HOST_DIR)/usr, I don't care much.

----------------------------------------------------------------
The following changes since commit efd6d5fd24706d825abae5f2bb39771fce586f09:

  package/tvheadend: reduce target binary size by using pngquant (2017-04-09 16:05:49 +0200)

are available in the git repository at:

  https://gitlab.com/arnout/buildroot host-usr-3

for you to fetch changes up to e36dbdddc6593685b2557c53b1d1541d3c375ef1:

  policycoreutils: rework host installation (2017-04-12 11:29:54 +0200)

----------------------------------------------------------------
Arnout Vandecappelle (53):
      pkg-rebar: remove redundant / in front of $($(PKG)_ERLANG_LIBDIR)
      libsepol: rework host installation
      Move $(HOST_DIR)/usr/$(GNU_TARGET_NAME) one level up.
      Move $(HOST_DIR)/usr/lib to $(HOST_DIR)/lib
      Eliminate $(HOST_DIR)/usr
      check-host-rpath: no longer check $(HOST_DIR)/usr/{bin,sbin}
      Makefile: remove $(HOST_DIR)/usr from BR_PATH
      package/Makefile.in: remove $(HOST_DIR)/usr part from HOST_LDFLAGS
      gdb: Remove /usr part from installation path of gdbserver
      gcc-final: things are no longer installed in $(HOST_DIR)/usr
      pkg-autotools: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
      pkg-cmake: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
      pkg-cmake: move configuration files out of $(HOST_DIR)/usr
      pkg-cmake: programs are now installed in $(HOST_DIR)/bin
      pkg-python: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
      pkg-rebar: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
      generic packages: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
      Globally replace $(HOST_DIR)/usr/bin with $(HOST_DIR)/bin
      Globally replace $(HOST_DIR)/usr/sbin with $(HOST_DIR)/sbin
      Globally replace $(HOST_DIR)/usr/lib with $(HOST_DIR)/lib
      Globally replace $(HOST_DIR)/usr/include with $(HOST_DIR)/include
      Globally replace $(HOST_DIR)/usr/share with $(HOST_DIR)/share
      Globally replace $(HOST_DIR)/usr with $(HOST_DIR)
      luarocks: things are no longer installed in $(HOST_DIR)/usr
      qt: things are no longer installed in $(HOST_DIR)/usr
      boards: replace $HOST_DIR/usr/ with $HOST_DIR/ in scripts
      chromebook snow: remove $(HOST_DIR)/usr reference from README
      warpboard: remove $(HOST_DIR)/usr reference from README
      stm32f429-disco: replace $HOST_DIR/usr with $HOST_DIR in flash script
      stm32f469-disco: replace $HOST_DIR/usr with $HOST_DIR in flash script
      eclipse-register-toolchain: toolchain is no longer installed in $(HOST_DIR)/usr
      manual: remove references to host/usr paths
      grub2: remove host/usr reference from help text
      lttng-tools: remove host/usr reference from help text
      mfgtools: remove host/usr reference from readme.txt
      lesstif: remove host/usr reference from .mk comment
      board/gdb/bfin-bf512: remove host/usr reference from readme.txt
      board/csky: remove host/usr reference from readme.txt
      libffi: avoid $(HOST_DIR)/usr while moving headers
      genromfs: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
      libcap: use $(HOST_DIR) as prefix instead of DESTDIR
      lzip: use $(HOST_DIR) as prefix instead of DESTDIR
      opkg-utils: use $(HOST_DIR) as PREFIX instead of DESTDIR
      raspberrypi-usbboot: remove /usr from DESTDIR-based install commands
      dos2unix: use prefix instead of DESTDIR for host installation
      imx-uxb-loader: use prefix instead of DESTDIR for host installation
      mtd: use PREFIX instead of DESTDIR for host installation
      grub2: install in $(HOST_DIR) instead of $(HOST_DIR)/usr
      sepolgen: strip /usr/ part from HOST_DIR
      libsemanage: rework host installation
      libselinux: rework host installation
      checkpolicy: rework host installation
      policycoreutils: rework host installation

 Makefile                                           | 15 ++++++++----
 board/boundarydevices/common/post-build.sh         |  4 ++--
 board/chromebook/snow/mksd.sh                      |  4 ++--
 board/chromebook/snow/readme.txt                   |  2 +-
 board/chromebook/snow/sign.sh                      |  6 ++---
 board/csky/readme.txt                              |  2 +-
 board/cubietech/cubieboard2/post-build.sh          |  2 +-
 board/firefly/firefly-rk3288/post-image.sh         |  2 +-
 board/freescale/warpboard/README                   |  4 ++--
 board/gdb/bfin-bf512/readme.txt                    |  4 ++--
 board/lemaker/bananapro/post-build.sh              |  2 +-
 board/linksprite/pcduino/post-build.sh             |  2 +-
 board/nanopi-neo/post-build.sh                     |  2 +-
 board/nexbox/a95x/post-build.sh                    |  2 +-
 board/olimex/a20_olinuxino/post-build.sh           |  2 +-
 board/orangepi/post-build.sh                       |  2 +-
 board/pc/post-image.sh                             |  2 +-
 board/solidrun/mx6cubox/post-build.sh              |  2 +-
 board/stmicroelectronics/stm32f429-disco/flash.sh  |  2 +-
 board/stmicroelectronics/stm32f469-disco/flash.sh  |  2 +-
 board/technologic/ts4800/post-image.sh             |  2 +-
 board/technologic/ts4900/post-image.sh             |  2 +-
 board/udoo/neo/post-build.sh                       |  2 +-
 board/wandboard/post-build.sh                      |  2 +-
 boot/grub2/Config.in                               |  4 ++--
 boot/grub2/grub2.mk                                |  8 ++++---
 boot/mxs-bootlets/mxs-bootlets.mk                  |  2 +-
 boot/syslinux/syslinux.mk                          |  6 ++---
 boot/uboot/uboot.mk                                | 10 ++++----
 docs/manual/faq-troubleshooting.txt                |  2 +-
 docs/manual/using-buildroot-debugger.txt           |  2 +-
 docs/manual/using-buildroot-toolchain.txt          |  2 +-
 fs/axfs/axfs.mk                                    |  2 +-
 fs/cloop/cloop.mk                                  |  4 ++--
 fs/common.mk                                       |  4 ++--
 fs/cramfs/cramfs.mk                                |  2 +-
 fs/iso9660/iso9660.mk                              |  6 ++---
 fs/romfs/romfs.mk                                  |  2 +-
 fs/squashfs/squashfs.mk                            |  2 +-
 fs/ubifs/ubi.mk                                    |  2 +-
 fs/ubifs/ubifs.mk                                  |  2 +-
 fs/yaffs2/yaffs.mk                                 |  2 +-
 linux/linux.mk                                     |  6 ++---
 package/4th/4th.mk                                 | 10 ++++----
 package/Makefile.in                                | 20 ++++++++--------
 package/acl/acl.mk                                 |  6 ++---
 package/am335x-pru-package/am335x-pru-package.mk   |  2 +-
 package/android-tools/android-tools.mk             |  2 +-
 package/attr/attr.mk                               |  4 ++--
 package/autoconf-archive/autoconf-archive.mk       |  2 +-
 package/autoconf/autoconf.mk                       |  8 +++----
 package/automake/automake.mk                       |  6 ++---
 package/axfsutils/axfsutils.mk                     |  2 +-
 package/b43-firmware/b43-firmware.mk               |  2 +-
 package/b43-fwcutter/b43-fwcutter.mk               |  2 +-
 package/boost/boost.mk                             |  8 +++----
 package/bzip2/bzip2.mk                             |  4 ++--
 package/ca-certificates/ca-certificates.mk         |  2 +-
 package/canfestival/canfestival.mk                 |  6 ++---
 package/checkpolicy/checkpolicy.mk                 | 18 +++++++-------
 package/cloop/cloop.mk                             |  6 ++---
 package/cmake/cmake.mk                             |  4 ++--
 package/cppcms/cppcms.mk                           |  2 +-
 package/cramfs/cramfs.mk                           |  4 ++--
 package/cryptopp/cryptopp.mk                       |  2 +-
 package/cups/cups.mk                               |  2 +-
 package/dbus-glib/dbus-glib.mk                     |  2 +-
 package/dbus-python/dbus-python.mk                 |  4 ++--
 package/dbus/dbus.mk                               |  2 +-
 package/directfb/directfb.mk                       |  4 ++--
 package/docker-containerd/docker-containerd.mk     |  2 +-
 package/docker-engine/docker-engine.mk             |  2 +-
 package/dos2unix/dos2unix.mk                       |  2 +-
 package/doxygen/doxygen.mk                         |  2 +-
 package/dtc/dtc.mk                                 |  4 ++--
 package/efl/efl.mk                                 | 18 +++++++-------
 package/ejabberd/ejabberd.mk                       |  2 +-
 package/elftosb/elftosb.mk                         |  6 ++---
 package/enlightenment/enlightenment.mk             |  6 ++---
 package/erlang-rebar/erlang-rebar.mk               |  2 +-
 package/erlang/erlang.mk                           |  2 +-
 package/execline/execline.mk                       |  8 +++----
 package/fakedate/fakedate.mk                       |  4 ++--
 package/faketime/faketime.mk                       |  4 ++--
 package/flannel/flannel.mk                         |  2 +-
 package/freescale-imx/imx-uuc/imx-uuc.mk           |  2 +-
 package/gcc/gcc-final/gcc-final.mk                 | 16 ++++++-------
 package/gcc/gcc.mk                                 | 12 +++++-----
 package/gdb/gdb.mk                                 |  6 ++---
 package/gdk-pixbuf/gdk-pixbuf.mk                   |  6 ++---
 package/genromfs/genromfs.mk                       |  4 +++-
 package/gettext/gettext.mk                         |  6 ++---
 package/go-bootstrap/go-bootstrap.mk               |  2 +-
 package/go/go.mk                                   |  6 ++---
 package/gob2/gob2.mk                               |  2 +-
 package/google-breakpad/google-breakpad.mk         |  2 +-
 package/gptfdisk/gptfdisk.mk                       |  2 +-
 package/gtest/gtest.mk                             |  4 ++--
 package/guile/guile.mk                             |  2 +-
 package/gutenprint/gutenprint.mk                   |  6 ++---
 package/gvfs/gvfs.mk                               |  2 +-
 package/heimdal/heimdal.mk                         |  8 +++----
 package/i2c-tools/i2c-tools.mk                     |  4 ++--
 package/imx-usb-loader/imx-usb-loader.mk           |  3 +--
 package/iw/iw.mk                                   |  2 +-
 package/jsmin/jsmin.mk                             |  2 +-
 package/kodi/kodi.mk                               |  4 ++--
 package/leafnode2/leafnode2.mk                     |  4 ++--
 package/lesstif/lesstif.mk                         |  2 +-
 package/libcap/libcap.mk                           |  4 ++--
 package/libffi/libffi.mk                           |  8 +++----
 package/libglib2/libglib2.mk                       |  6 ++---
 package/libgtk2/libgtk2.mk                         |  6 ++---
 package/libgtk3/libgtk3.mk                         | 18 +++++++-------
 package/libiio/libiio.mk                           |  4 ++--
 package/libselinux/libselinux.mk                   | 27 ++++++++++-----------
 package/libsemanage/libsemanage.mk                 | 27 +++++++++++----------
 package/libsepol/libsepol.mk                       | 13 ++++++----
 package/libsigrok/libsigrok.mk                     |  2 +-
 package/libsvgtiny/libsvgtiny.mk                   |  2 +-
 package/libtool/libtool.mk                         |  4 ++--
 package/libv4l/libv4l.mk                           |  6 ++---
 package/libxml-parser-perl/libxml-parser-perl.mk   | 10 ++++----
 package/libxml2/libxml2.mk                         |  2 +-
 package/libxmlrpc/libxmlrpc.mk                     |  2 +-
 .../linux-syscall-support/linux-syscall-support.mk |  2 +-
 package/localedef/localedef.mk                     |  2 +-
 package/lpc3250loader/lpc3250loader.mk             |  2 +-
 package/lttng-tools/Config.in                      |  2 +-
 package/lua/lua.mk                                 |  4 ++--
 package/luainterpreter/luainterpreter.mk           |  2 +-
 package/luajit/luajit.mk                           |  4 ++--
 package/luarocks/luarocks.mk                       | 12 +++++-----
 package/luvi/luvi.mk                               |  2 +-
 package/lz4/lz4.mk                                 |  2 +-
 package/lzip/lzip.mk                               |  4 ++--
 package/lzma/lzma.mk                               |  2 +-
 package/lzop/lzop.mk                               |  2 +-
 package/makedevs/makedevs.mk                       |  2 +-
 package/mfgtools/mfgtools.mk                       |  6 ++---
 package/mfgtools/readme.txt                        |  2 +-
 package/mke2img/mke2img.mk                         |  2 +-
 package/mkpasswd/mkpasswd.mk                       |  4 ++--
 package/mkpimage/mkpimage.mk                       |  2 +-
 package/moarvm/moarvm.mk                           |  2 +-
 package/mono-gtksharp3/mono-gtksharp3.mk           |  2 +-
 package/mono/mono.mk                               |  4 ++--
 package/monolite/monolite.mk                       |  4 ++--
 package/mplayer/mplayer.mk                         |  2 +-
 package/mtd/mtd.mk                                 |  6 ++---
 package/mxsldr/mxsldr.mk                           |  2 +-
 package/ncftp/ncftp.mk                             |  2 +-
 package/netsurf-buildsystem/netsurf-buildsystem.mk |  2 +-
 package/ninja/ninja.mk                             |  2 +-
 package/nodejs/nodejs.mk                           | 28 +++++++++++-----------
 package/ola/ola.mk                                 |  4 ++--
 package/omap-u-boot-utils/omap-u-boot-utils.mk     |  2 +-
 package/omniorb/omniorb.mk                         |  6 ++---
 package/omxplayer/omxplayer.mk                     |  2 +-
 package/opencv3/opencv3.mk                         |  4 ++--
 package/openocd/openocd.mk                         |  4 ++--
 package/openssl/openssl.mk                         |  2 +-
 package/opkg-utils/opkg-utils.mk                   |  2 +-
 package/oracle-mysql/oracle-mysql.mk               |  2 +-
 package/owfs/owfs.mk                               |  2 +-
 package/perl/perl.mk                               |  2 +-
 package/php-amqp/php-amqp.mk                       |  4 ++--
 package/php-geoip/php-geoip.mk                     |  4 ++--
 package/php-gnupg/php-gnupg.mk                     |  4 ++--
 package/php-imagick/php-imagick.mk                 |  4 ++--
 package/php-memcached/php-memcached.mk             |  4 ++--
 package/php-ssh2/php-ssh2.mk                       |  4 ++--
 package/php-yaml/php-yaml.mk                       |  4 ++--
 package/php-zmq/php-zmq.mk                         |  4 ++--
 package/pinentry/pinentry.mk                       |  2 +-
 package/pkg-autotools.mk                           |  2 +-
 package/pkg-cmake.mk                               | 14 +++++------
 package/pkg-perl.mk                                |  2 +-
 package/pkg-python.mk                              | 10 ++++----
 package/pkg-rebar.mk                               | 18 +++++++-------
 package/pkg-waf.mk                                 | 10 ++++----
 package/pkgconf/pkgconf.mk                         | 10 ++++----
 package/pngquant/pngquant.mk                       |  2 +-
 package/policycoreutils/policycoreutils.mk         | 23 +++++++++---------
 package/protobuf/protobuf.mk                       |  2 +-
 package/pseudo/pseudo.mk                           |  6 ++---
 package/pulseaudio/pulseaudio.mk                   |  2 +-
 package/python-cffi/python-cffi.mk                 |  2 +-
 package/python-gobject/python-gobject.mk           |  4 ++--
 package/python-lxml/python-lxml.mk                 |  4 ++--
 package/python-pypcap/python-pypcap.mk             |  4 ++--
 package/python-pyqt/python-pyqt.mk                 |  4 ++--
 package/python-pyqt5/python-pyqt5.mk               |  4 ++--
 package/python-sip/python-sip.mk                   |  6 ++---
 package/python-web2py/python-web2py.mk             |  2 +-
 package/python/python.mk                           |  6 ++---
 package/python3/python3.mk                         | 16 ++++++-------
 package/qemu/qemu.mk                               | 10 ++++----
 package/qpid-proton/qpid-proton.mk                 |  2 +-
 package/qt/qt.mk                                   | 20 ++++++++--------
 package/qt5/qt5.mk                                 |  2 +-
 package/qt5/qt53d/qt53d.mk                         |  2 +-
 package/qt5/qt5base/qt5base.mk                     |  2 +-
 package/qt5/qt5canvas3d/qt5canvas3d.mk             |  2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |  2 +-
 package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
 package/qt5/qt5enginio/qt5enginio.mk               |  2 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |  2 +-
 package/qt5/qt5location/qt5location.mk             |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |  2 +-
 package/qt5/qt5script/qt5script.mk                 |  2 +-
 package/qt5/qt5sensors/qt5sensors.mk               |  2 +-
 package/qt5/qt5serialbus/qt5serialbus.mk           |  2 +-
 package/qt5/qt5serialport/qt5serialport.mk         |  2 +-
 package/qt5/qt5svg/qt5svg.mk                       |  2 +-
 package/qt5/qt5tools/qt5tools.mk                   |  2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |  2 +-
 package/qt5/qt5webkit/qt5webkit.mk                 |  4 ++--
 package/qt5/qt5websockets/qt5websockets.mk         |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  2 +-
 package/qt5cinex/qt5cinex.mk                       |  2 +-
 .../0002-Makefile-add-DESTDIR-support.patch        | 22 +++++++++--------
 package/runc/runc.mk                               |  2 +-
 package/s6-rc/s6-rc.mk                             | 10 ++++----
 package/s6/s6.mk                                   |  8 +++----
 package/sam-ba/sam-ba.mk                           |  4 ++--
 package/scons/scons.mk                             |  4 ++--
 package/sdl_image/sdl_image.mk                     |  4 ++--
 package/sepolgen/sepolgen.mk                       |  4 ++--
 package/setools/setools.mk                         | 12 +++++-----
 package/shared-mime-info/shared-mime-info.mk       |  4 ++--
 package/skalibs/skalibs.mk                         |  2 +-
 package/socat/socat.mk                             |  2 +-
 package/softether/softether.mk                     |  2 +-
 package/sqlcipher/sqlcipher.mk                     |  2 +-
 package/squashfs/squashfs.mk                       |  2 +-
 package/sunxi-tools/sunxi-tools.mk                 |  6 ++---
 package/swig/swig.mk                               |  8 +++----
 package/systemd/systemd.mk                         |  2 +-
 package/tcllib/tcllib.mk                           |  2 +-
 package/terminology/terminology.mk                 |  2 +-
 package/thrift/thrift.mk                           |  6 ++---
 package/ti-cgt-pru/ti-cgt-pru.mk                   |  4 ++--
 package/tvheadend/tvheadend.mk                     |  4 ++--
 package/tz/tz.mk                                   |  6 ++---
 package/tzdata/tzdata.mk                           |  6 ++---
 package/tzdump/tzdump.mk                           |  4 ++--
 package/uboot-tools/uboot-tools.mk                 |  8 +++----
 package/uclibc/uclibc.mk                           |  8 +++----
 package/upx/upx.mk                                 |  4 ++--
 package/vala/vala.mk                               |  8 +++----
 package/vboot-utils/vboot-utils.mk                 |  2 +-
 package/vlc/vlc.mk                                 |  6 ++---
 package/waf/waf.mk                                 |  2 +-
 package/wireshark/wireshark.mk                     |  6 ++---
 package/x11r7/libxcb/libxcb.mk                     |  4 ++--
 .../xfont_font-adobe-100dpi.mk                     |  4 ++--
 .../xfont_font-adobe-75dpi.mk                      |  4 ++--
 .../xfont_font-adobe-utopia-100dpi.mk              |  4 ++--
 .../xfont_font-adobe-utopia-75dpi.mk               |  4 ++--
 .../xfont_font-adobe-utopia-type1.mk               |  4 ++--
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |  4 ++--
 .../xfont_font-arabic-misc.mk                      |  4 ++--
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |  4 ++--
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |  4 ++--
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |  4 ++--
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |  4 ++--
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |  4 ++--
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |  4 ++--
 .../xfont_font-bitstream-100dpi.mk                 |  4 ++--
 .../xfont_font-bitstream-75dpi.mk                  |  4 ++--
 .../xfont_font-bitstream-type1.mk                  |  4 ++--
 .../xfont_font-cronyx-cyrillic.mk                  |  4 ++--
 .../xfont_font-cursor-misc.mk                      |  4 ++--
 .../xfont_font-daewoo-misc.mk                      |  4 ++--
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |  4 ++--
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |  4 ++--
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |  4 ++--
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |  4 ++--
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |  4 ++--
 .../xfont_font-misc-cyrillic.mk                    |  4 ++--
 .../xfont_font-misc-ethiopic.mk                    |  4 ++--
 .../xfont_font-misc-meltho.mk                      |  4 ++--
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |  4 ++--
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |  4 ++--
 .../xfont_font-schumacher-misc.mk                  |  4 ++--
 .../xfont_font-screen-cyrillic.mk                  |  4 ++--
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |  4 ++--
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |  4 ++--
 .../xfont_font-winitzki-cyrillic.mk                |  4 ++--
 .../xfont_font-xfree86-type1.mk                    |  4 ++--
 package/x11r7/xlib_libX11/xlib_libX11.mk           |  2 +-
 package/x264/x264.mk                               |  2 +-
 package/xen/xen.mk                                 |  2 +-
 package/yaffs2utils/yaffs2utils.mk                 |  2 +-
 package/zic/zic.mk                                 |  6 ++---
 package/zip/zip.mk                                 |  2 +-
 package/zlib/zlib.mk                               |  2 +-
 package/zynq-boot-bin/zynq-boot-bin.mk             |  2 +-
 support/dependencies/check-host-cmake.mk           |  2 +-
 support/dependencies/check-host-lzip.mk            |  2 +-
 support/dependencies/check-host-tar.mk             |  2 +-
 support/dependencies/check-host-xzcat.mk           |  2 +-
 support/misc/toolchainfile.cmake.in                |  6 ++---
 support/scripts/check-host-rpath                   |  7 +++---
 support/scripts/eclipse-register-toolchain         |  2 +-
 .../toolchain-external/pkg-toolchain-external.mk   | 14 +++++------
 toolchain/toolchain-wrapper.c                      |  6 ++---
 toolchain/toolchain-wrapper.mk                     |  2 +-
 toolchain/toolchain/toolchain.mk                   |  4 ++--
 314 files changed, 712 insertions(+), 693 deletions(-)
