From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:31 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	package-infrastructure
Message-ID: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patchset :

 * implements a new infrastructure to support all type of packages,
   not only packages relying on the autotools build system. Through
   the new GENTARGETS macro, implemented in
   package/Makefile.package.in, we will be able to write simpler .mk
   files and be able to factorize the common parts of the different
   .mk files. This infrastructure support building both host and
   target packages.

 * rebases the existing autotools infrastructure on top of the new
   generic infrastructure. This rebasing has no impact on the existing
   .mk files for autotools packages. With this rebasing, the autotools
   infrastructure gains the ability to build host packages.

 * simplifies most (if not all) .mk files of autotools-based packages
   that required an host version to be compiled (xutil_makedepend,
   xproto_xproto, pixman, m4, mtd-utils, lzo, libusb, libgtk2, gob2,
   expat, dbus-glib, shared-mime-info, libxml2, freetype, fontconfig,
   directfb, dbus, atk, pango, libtool, libglib2, cairo, automake,
   pkg-config)

 * bumps the version of autoconf to 2.65 and finally fixes the
   host-autoconf build problem when sh is symlinked to dash.

 * converts a few packages to the generic infrastructure (zlib, olsr,
   udev)

 * updates and extends the documentation to cover the new
   infrastructures with examples and reference information

I have tested this patchset in various conditions, but the changes are
sufficiently complicated that I cannot guarantee a bug-free transition
to these infrastructures. That's why I think such changes should be
merge early in the Buildroot development period, so that we have
enough time before 2010.02 to stabilize these changes (and make a
larger use of the new infrastructures).




The following changes since commit f3f1a94313361c251c4dfa164921d475835c763d:
  Peter Korsgaard (1):
        Merge branch 'avr32-fixes' of git://git.busybox.net/~tpetazzoni/git/buildroot

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot package-infrastructure

Thomas Petazzoni (39):
      Add generic package infrastructure
      Define TARGET_MAKE_ENV similarly to HOST_MAKE_ENV
      Rework autotools infrastructure on top of the generic infrastructure
      olsr: rework on top of the generic infrastructure
      zlib: rework on top of the generic infrastructure
      Add $(HOST_DIR)/usr/sbin to the PATH
      pkg-config: convert to autotools infrastructure for host package
      host-pkgconfig is now host-pkg-config
      Add package statistics script
      autoconf: convert to autotools infrastructure for host package
      autoconf: bump version to 2.65
      autoconf: add patch to make it work under dash
      automake: convert to autotools infrastructure for host package
      cairo: convert to autotools infrastructure for host package
      libglib2: convert to autotools infrastructure for host package
      libtool: convert to autotools infrastructure for host package
      pango: convert to autotools infrastructure for host package
      atk: convert to autotools infrastructure for host package
      dbus: convert to autotools infrastructure for host package
      directfb: convert to autotools infrastructure for host package
      fontconfig: convert to autotools infrastructure for host package
      freetype: convert to autotools infrastructure for host package
      libxml2: convert to autotools infrastructure for host package
      shared-mime-info: convert to autotools infrastructure for host package
      dbus-glib: convert to autotools infrastructure for host package
      expat: convert to autotools infrastructure for host package
      gob2: convert to autotools infrastructure for host package
      libgtk2: convert to autotools infrastructure for host package
      libusb: convert to autotools infrastructure for host package
      lzo: convert to autotools infrastructure for host package
      mtd-utils: fix dependency on host package
      m4: convert to autotools infrastructure for host package
      pixman: convert to autotools infrastructure for host package
      xproto_xproto: convert to autotools infrastructure for host package
      xutil_makedepend: convert to autotools infrastructure for host package
      i2c-tools: convert to the generic package infrastructure
      udev: convert to generic package infrastructure
      documentation: update about new package infrastructures
      documentation: slightly improve CSS

 docs/buildroot.html                                |  692 +++++++++++++++++---
 docs/stylesheet.css                                |   10 +
 package/Makefile.autotools.in                      |  624 ++++++------------
 package/Makefile.in                                |    7 +-
 package/Makefile.package.in                        |  397 +++++++++++
 package/atk/atk.mk                                 |   50 +--
 ...toconf-2.65-fix-m4-detection-test-on-dash.patch |   36 +
 package/autoconf/autoconf.mk                       |   53 +--
 package/automake/automake.mk                       |   47 +--
 package/cairo/cairo.mk                             |   50 +--
 package/dbus-glib/dbus-glib.mk                     |   52 +--
 package/dbus/dbus.mk                               |   74 +--
 package/directfb/directfb.mk                       |   55 +--
 package/dnsmasq/dnsmasq.mk                         |    2 +-
 package/docker/docker.mk                           |    2 +-
 package/editors/vim/vim.mk                         |    2 +-
 package/enchant/enchant.mk                         |    2 +-
 package/expat/expat.mk                             |   46 +--
 package/fontconfig/fontconfig.mk                   |   49 +--
 package/freetype/freetype.mk                       |   48 +--
 package/gettext/gettext.mk                         |    2 +-
 package/gob2/gob2.mk                               |   46 +--
 package/gqview/gqview.mk                           |    2 +-
 package/gvfs/gvfs.mk                               |    2 +-
 package/hal/hal.mk                                 |    2 +-
 package/i2c-tools/i2c-tools.mk                     |   44 +-
 package/java/classpath/classpath.mk                |    2 +-
 package/java/jamvm/jamvm.mk                        |    2 +-
 package/libdaemon/libdaemon.mk                     |    2 +-
 package/libdrm/libdrm.mk                           |    2 +-
 package/libglade/libglade.mk                       |    2 +-
 package/libglib2/libglib2.mk                       |   57 +--
 package/libgtk2/libgtk2.mk                         |   57 +--
 package/libidn/libidn.mk                           |    2 +-
 package/libpng/libpng.mk                           |    2 +-
 package/libsoup/libsoup.mk                         |    2 +-
 package/libtool/libtool.mk                         |   51 +--
 package/libusb/libusb.mk                           |    4 +-
 package/libxml2/libxml2.mk                         |   52 +--
 package/lzo/lzo.mk                                 |   43 +--
 package/m4/m4.mk                                   |   46 +--
 package/matchbox/matchbox.mk                       |    2 +-
 package/midori/midori.mk                           |    2 +-
 package/mtd/mtd-utils/mtd.mk                       |    2 +-
 package/multimedia/gstreamer/gstreamer.mk          |    2 +-
 package/multimedia/libmms/libmms.mk                |    2 +-
 package/multimedia/libogg/libogg.mk                |    2 +-
 package/multimedia/libtheora/libtheora.mk          |    2 +-
 package/multimedia/libvorbis/libvorbis.mk          |    3 +-
 package/multimedia/swfdec/swfdec.mk                |    2 +-
 package/neon/neon.mk                               |    2 +-
 package/olsr/olsr.mk                               |   60 +--
 package/pango/pango.mk                             |   58 +--
 package/pcmanfm/pcmanfm.mk                         |    2 +-
 package/pixman/pixman.mk                           |   44 +--
 package/pkg-config/pkg-config.mk                   |   51 +--
 package/shared-mime-info/shared-mime-info.mk       |   54 +--
 package/sylpheed/sylpheed.mk                       |    2 +-
 package/tiff/tiff.mk                               |    2 +-
 package/udev/udev.mk                               |  273 +++------
 package/usbutils/usbutils.mk                       |    2 +-
 package/wpa_supplicant/wpa_supplicant.mk           |    2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk   |    2 +-
 package/x11r7/xproto_xproto/xproto_xproto.mk       |   44 +--
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |   46 +--
 package/zlib/zlib.mk                               |   93 +--
 scripts/pkg-stats                                  |  200 ++++++
 67 files changed, 1793 insertions(+), 1885 deletions(-)
 create mode 100644 package/Makefile.package.in
 create mode 100644 package/autoconf/autoconf-2.65-fix-m4-detection-test-on-dash.patch
 create mode 100755 scripts/pkg-stats

Thanks,
-- 
Thomas Petazzoni
