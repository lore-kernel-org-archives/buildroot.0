From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Oct 2015 15:15:10 +0200
Subject: [Buildroot] [PATCH] [RFC] DO NOT APPLY Remove usr/ component from
	HOST_DIR
Message-ID: <1444914910-5370-1-git-send-email-arnout@mind.be>
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

This patch replaces all occurences of 'host/usr' (in its various forms)
with 'host', and updates relative paths accordingly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I did not review the change or test it beyond just building busybox
with an internal and external toolchain. Hence the RFC status.
I still added my Sob in case anyone wants to take over (you know how
long it takes me to actually finish anything :-)

As an example of why more verification is needed: the genromfs package
was using PREFIX together with the default /usr prefix, so the
automatic replacement missed that occurence.

It would be possible to submit this as separate patches (though
obviously that's more work, since you have to make sure that the
dependencies are done right, e.g. when moving python then everything
that calls python should also move). Would this be useful?
---
 Makefile                                           |  6 ++---
 board/boundarydevices/nitrogen6x/post-build.sh     |  4 ++--
 board/cubietech/cubieboard/post-build.sh           |  2 +-
 board/freescale/warpboard/README                   |  4 ++--
 board/olimex/a20_olinuxino/post-build.sh           |  2 +-
 board/raspberrypi/readme.txt                       |  2 +-
 boot/grub2/Config.in                               |  4 ++--
 boot/grub2/grub2.mk                                |  6 ++---
 boot/mxs-bootlets/mxs-bootlets.mk                  |  2 +-
 boot/syslinux/syslinux.mk                          |  6 ++---
 boot/uboot/uboot.mk                                |  6 ++---
 docs/manual/faq-troubleshooting.txt                |  2 +-
 docs/manual/using-buildroot-debugger.txt           |  2 +-
 docs/manual/using-buildroot-toolchain.txt          |  2 +-
 fs/cloop/cloop.mk                                  |  2 +-
 fs/common.mk                                       |  4 ++--
 fs/cramfs/cramfs.mk                                |  2 +-
 fs/iso9660/iso9660.mk                              |  6 ++---
 fs/romfs/romfs.mk                                  |  2 +-
 fs/squashfs/squashfs.mk                            |  2 +-
 fs/ubifs/ubi.mk                                    |  2 +-
 fs/ubifs/ubifs.mk                                  |  2 +-
 fs/yaffs2/yaffs.mk                                 |  2 +-
 linux/linux.mk                                     |  2 +-
 package/Makefile.in                                | 26 +++++++++++-----------
 package/am335x-pru-package/am335x-pru-package.mk   |  2 +-
 package/autoconf-archive/autoconf-archive.mk       |  2 +-
 package/autoconf/autoconf.mk                       |  8 +++----
 package/automake/automake.mk                       |  6 ++---
 package/b43-firmware/b43-firmware.mk               |  2 +-
 package/b43-fwcutter/b43-fwcutter.mk               |  2 +-
 package/boost/boost.mk                             |  8 +++----
 package/bzip2/bzip2.mk                             |  4 ++--
 package/ca-certificates/ca-certificates.mk         |  2 +-
 package/canfestival/canfestival.mk                 |  6 ++---
 package/checkpolicy/checkpolicy.mk                 |  4 ++--
 package/cloop/cloop.mk                             |  6 ++---
 package/cmake/cmake.mk                             |  4 ++--
 package/cppcms/cppcms.mk                           |  2 +-
 package/cramfs/cramfs.mk                           |  4 ++--
 package/crda/crda.mk                               |  2 +-
 package/dbus-glib/dbus-glib.mk                     |  2 +-
 package/dbus-python/dbus-python.mk                 |  4 ++--
 package/dbus/dbus.mk                               |  2 +-
 package/directfb/directfb.mk                       |  4 ++--
 package/dosfstools/dosfstools.mk                   |  2 +-
 package/doxygen/doxygen.mk                         |  2 +-
 package/dtc/dtc.mk                                 |  4 ++--
 package/efl/libelementary/libelementary.mk         |  4 ++--
 package/efl/libethumb/libethumb.mk                 |  2 +-
 package/ejabberd/ejabberd.mk                       |  2 +-
 package/elftosb/elftosb.mk                         |  6 ++---
 package/enlightenment/enlightenment.mk             |  4 ++--
 package/erlang-rebar/erlang-rebar.mk               |  2 +-
 package/erlang/erlang.mk                           |  2 +-
 package/faketime/faketime.mk                       |  4 ++--
 package/gcc/gcc-final/gcc-final.mk                 | 14 ++++++------
 package/gcc/gcc.mk                                 | 10 ++++-----
 package/gdb/gdb.mk                                 |  6 ++---
 package/genromfs/genromfs.mk                       |  2 +-
 package/gettext/gettext.mk                         |  6 ++---
 package/glmark2/glmark2.mk                         |  6 ++---
 package/gmock/gmock.mk                             |  6 ++---
 package/gob2/gob2.mk                               |  2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk            |  6 ++---
 package/guile/guile.mk                             |  2 +-
 package/gutenprint/gutenprint.mk                   |  6 ++---
 package/gvfs/gvfs.mk                               |  2 +-
 package/heimdal/heimdal.mk                         |  8 +++----
 package/i2c-tools/i2c-tools.mk                     |  4 ++--
 package/infozip/infozip.mk                         |  2 +-
 package/iw/iw.mk                                   |  2 +-
 package/jack2/jack2.mk                             |  8 +++----
 package/jsmin/jsmin.mk                             |  2 +-
 package/kodi/kodi.mk                               |  4 ++--
 package/leafnode2/leafnode2.mk                     |  4 ++--
 package/lesstif/lesstif.mk                         |  2 +-
 package/libglib2/libglib2.mk                       |  4 ++--
 package/libgtk2/libgtk2.mk                         |  6 ++---
 package/libgtk3/libgtk3.mk                         | 14 ++++++------
 package/libiio/libiio.mk                           |  4 ++--
 package/libselinux/libselinux.mk                   | 16 ++++++-------
 package/libsemanage/libsemanage.mk                 | 10 ++++-----
 package/libsepol/libsepol.mk                       |  4 ++--
 package/libsigrok/libsigrok.mk                     |  2 +-
 package/libsvgtiny/libsvgtiny.mk                   |  2 +-
 package/libtool/libtool.mk                         |  4 ++--
 package/libxml-parser-perl/libxml-parser-perl.mk   | 10 ++++-----
 package/libxml2/libxml2.mk                         |  2 +-
 package/libxmlrpc/libxmlrpc.mk                     |  2 +-
 package/localedef/localedef.mk                     |  2 +-
 package/lpc3250loader/lpc3250loader.mk             |  2 +-
 package/lttng-babeltrace/Config.in                 |  2 +-
 package/lttng-tools/Config.in                      |  2 +-
 package/lua/lua.mk                                 |  4 ++--
 package/luainterpreter/luainterpreter.mk           |  2 +-
 package/luarocks/luarocks.mk                       | 12 +++++-----
 package/lzma/lzma.mk                               |  2 +-
 package/lzop/lzop.mk                               |  2 +-
 package/makedevs/makedevs.mk                       |  2 +-
 package/mke2img/mke2img.mk                         |  2 +-
 package/mkpasswd/mkpasswd.mk                       |  4 ++--
 package/moarvm/moarvm.mk                           |  2 +-
 package/mono-gtksharp3/mono-gtksharp3.mk           |  2 +-
 package/mono/mono.mk                               |  4 ++--
 package/monolite/monolite.mk                       |  4 ++--
 package/mtd/mtd.mk                                 |  4 ++--
 package/mysql/mysql.mk                             |  2 +-
 package/ncftp/ncftp.mk                             |  2 +-
 package/netsurf-buildsystem/netsurf-buildsystem.mk |  2 +-
 package/nodejs/nodejs.mk                           | 20 ++++++++---------
 package/ola/ola.mk                                 |  4 ++--
 package/omap-u-boot-utils/omap-u-boot-utils.mk     |  2 +-
 package/omniorb/omniorb.mk                         |  6 ++---
 package/opencv3/opencv3.mk                         |  4 ++--
 package/openocd/openocd.mk                         |  4 ++--
 package/openssl/openssl.mk                         |  2 +-
 package/perl/perl.mk                               |  2 +-
 package/php-geoip/php-geoip.mk                     |  4 ++--
 package/php-gnupg/php-gnupg.mk                     |  4 ++--
 package/php-imagick/php-imagick.mk                 |  4 ++--
 package/php-memcached/php-memcached.mk             |  4 ++--
 package/php-ssh2/php-ssh2.mk                       |  4 ++--
 package/php-yaml/php-yaml.mk                       |  4 ++--
 package/php-zmq/php-zmq.mk                         |  4 ++--
 package/pinentry/pinentry.mk                       |  2 +-
 package/pkg-autotools.mk                           |  2 +-
 package/pkg-cmake.mk                               | 16 ++++++-------
 package/pkg-perl.mk                                |  2 +-
 package/pkg-python.mk                              | 10 ++++-----
 package/pkg-rebar.mk                               |  4 ++--
 package/pkgconf/pkgconf.mk                         | 10 ++++-----
 package/protobuf/protobuf.mk                       |  2 +-
 package/pulseaudio/pulseaudio.mk                   |  2 +-
 package/python-gobject/python-gobject.mk           |  4 ++--
 package/python-m2crypto/python-m2crypto.mk         |  4 ++--
 package/python-pypcap/python-pypcap.mk             |  4 ++--
 package/python-pyqt/python-pyqt.mk                 |  6 ++---
 package/python-sip/python-sip.mk                   |  6 ++---
 package/python-web2py/python-web2py.mk             |  2 +-
 package/python/python.mk                           |  4 ++--
 package/python3/python3.mk                         |  4 ++--
 package/qemu/qemu.mk                               | 10 ++++-----
 package/qpid-proton/qpid-proton.mk                 |  2 +-
 package/qt/qt.mk                                   | 20 ++++++++---------
 package/qt5/qt5.mk                                 |  2 +-
 package/qt5/qt5base/qt5base.mk                     |  2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |  2 +-
 package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
 package/qt5/qt5enginio/qt5enginio.mk               |  2 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +-
 package/qt5/qt5quick1/qt5quick1.mk                 |  2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  2 +-
 package/qt5/qt5script/qt5script.mk                 |  2 +-
 package/qt5/qt5sensors/qt5sensors.mk               |  2 +-
 package/qt5/qt5serialport/qt5serialport.mk         |  2 +-
 package/qt5/qt5svg/qt5svg.mk                       |  2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |  2 +-
 .../qt5/qt5webkit-examples/qt5webkit-examples.mk   |  2 +-
 package/qt5/qt5webkit/qt5webkit.mk                 |  2 +-
 package/qt5/qt5websockets/qt5websockets.mk         |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  2 +-
 package/qt5cinex/qt5cinex.mk                       |  2 +-
 package/rpi-firmware/rpi-firmware.mk               |  2 +-
 package/sam-ba/sam-ba.mk                           |  4 ++--
 package/samba4/samba4.mk                           |  2 +-
 package/scons/scons.mk                             |  4 ++--
 package/sdl_image/sdl_image.mk                     |  4 ++--
 package/setools/setools.mk                         | 12 +++++-----
 package/shared-mime-info/shared-mime-info.mk       |  4 ++--
 package/socat/socat.mk                             |  2 +-
 package/softether/softether.mk                     |  2 +-
 package/sqlcipher/sqlcipher.mk                     |  2 +-
 package/squashfs/squashfs.mk                       |  2 +-
 package/sstrip/sstrip.mk                           |  2 +-
 package/sunxi-tools/sunxi-tools.mk                 |  4 ++--
 package/swig/swig.mk                               |  8 +++----
 package/tcllib/tcllib.mk                           |  2 +-
 package/thrift/thrift.mk                           |  6 ++---
 package/tvheadend/tvheadend.mk                     |  2 +-
 package/tz/tz.mk                                   |  6 ++---
 package/tzdata/tzdata.mk                           |  6 ++---
 package/tzdump/tzdump.mk                           |  4 ++--
 package/uboot-tools/uboot-tools.mk                 |  6 ++---
 package/uclibc/uclibc.mk                           |  8 +++----
 package/upx/upx.mk                                 |  4 ++--
 package/vlc/vlc.mk                                 |  6 ++---
 package/wayland/wayland.mk                         |  4 ++--
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
 package/yaffs2utils/yaffs2utils.mk                 |  2 +-
 package/zic/zic.mk                                 |  6 ++---
 package/zlib/zlib.mk                               |  2 +-
 package/zynq-boot-bin/zynq-boot-bin.mk             |  2 +-
 support/dependencies/check-host-tar.mk             |  2 +-
 support/dependencies/check-host-xzcat.mk           |  2 +-
 support/misc/toolchainfile.cmake.in                |  2 +-
 support/scripts/eclipse-register-toolchain         |  2 +-
 toolchain/toolchain-external/toolchain-external.mk | 16 ++++++-------
 toolchain/toolchain-wrapper.c                      |  6 ++---
 toolchain/toolchain-wrapper.mk                     |  4 ++--
 toolchain/toolchain/toolchain.mk                   |  2 +-
 240 files changed, 493 insertions(+), 493 deletions(-)

diff --git a/Makefile b/Makefile
index 181d446..cc3b796 100644
--- a/Makefile
+++ b/Makefile
@@ -363,14 +363,14 @@ TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 
 # Quotes are needed for spaces and all in the original PATH content.
-BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
+BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
 TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
 ifeq ($(BR2_CCACHE),y)
-CCACHE := $(HOST_DIR)/usr/bin/ccache
+CCACHE := $(HOST_DIR)/bin/ccache
 BR_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
 export BR_CACHE_DIR
 HOSTCC := $(CCACHE) $(HOSTCC)
@@ -511,7 +511,7 @@ define GENERATE_GLIBC_LOCALES
 		fi ; \
 		echo "Generating locale $${inputfile}.$${charmap}" ; \
 		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
-		$(HOST_DIR)/usr/bin/localedef \
+		$(HOST_DIR)/bin/localedef \
 			--prefix=$(TARGET_DIR) \
 			--$(call LOWERCASE,$(BR2_ENDIAN))-endian \
 			-i $${inputfile} -f $${charmap} \
diff --git a/board/boundarydevices/nitrogen6x/post-build.sh b/board/boundarydevices/nitrogen6x/post-build.sh
index f68fa0e..8f1d444 100755
--- a/board/boundarydevices/nitrogen6x/post-build.sh
+++ b/board/boundarydevices/nitrogen6x/post-build.sh
@@ -8,13 +8,13 @@
 BOARD_DIR="$(dirname $0)"
 
 # bd u-boot looks for bootscript here
-$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
+$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
 -n "boot script" -d $BOARD_DIR/6x_bootscript.txt $TARGET_DIR/6x_bootscript
 
 # u-boot / update script for bd upgradeu command
 if [ -e $BINARIES_DIR/u-boot.imx ];
 then
     install -D -m 0644 $BINARIES_DIR/u-boot.imx $TARGET_DIR/u-boot.imx
-    $HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
+    $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
     -n "upgrade script" -d $BOARD_DIR/6x_upgrade.txt $TARGET_DIR/6x_upgrade
 fi
diff --git a/board/cubietech/cubieboard/post-build.sh b/board/cubietech/cubieboard/post-build.sh
index 1b0258c..81be4ab 100755
--- a/board/cubietech/cubieboard/post-build.sh
+++ b/board/cubietech/cubieboard/post-build.sh
@@ -3,7 +3,7 @@
 # 2013, Carlo Caione <carlo.caione@gmail.com>
 
 BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 BOOT_CMD=$BOARD_DIR/boot.cmd
 BOOT_CMD_H=$BINARIES_DIR/boot.scr
 
diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
index d826b2d..da5f52a 100644
--- a/board/freescale/warpboard/README
+++ b/board/freescale/warpboard/README
@@ -21,7 +21,7 @@ Update uboot
 
 - Load u-boot.imx in the WarpBoard by using the imx-usb-loader host utility:
 
-  $ ./output/host/usr/bin/imx_usb -c output/host/etc/imx-loader.d/ output/images/u-boot.imx
+  $ ./output/host/bin/imx_usb -c output/host/etc/imx-loader.d/ output/images/u-boot.imx
 
 - U-Boot will appear in minicom
 
@@ -34,7 +34,7 @@ Update uboot
 
 - Transfer U-Boot into flash by running this command in host side:
 
- $ sudo ./output/host/usr/bin/dfu-util -D output/images/u-boot.imx -a boot
+ $ sudo ./output/host/bin/dfu-util -D output/images/u-boot.imx -a boot
 
 - remove power and put the WarpBoard back into normal boot mode by
   opening the j2 jumper.
diff --git a/board/olimex/a20_olinuxino/post-build.sh b/board/olimex/a20_olinuxino/post-build.sh
index ac8d4df..e2d863a 100755
--- a/board/olimex/a20_olinuxino/post-build.sh
+++ b/board/olimex/a20_olinuxino/post-build.sh
@@ -3,7 +3,7 @@
 # $2    path of boot.cmd
 # $3    output directory for boot.scr
 
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 
 $MKIMAGE -A arm -O linux -T script -C none -d $2 $3/boot.scr
 
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index cf95879..24db87d 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -126,7 +126,7 @@ For example:
 The kernel image must be marked with a special header so that the
 bootloader of the RaspberryPi knows it supports Device Tree:
 
-  $ ./output/host/usr/bin/mkknlimg output/images/zImage /mnt/mountpointboot/zImage
+  $ ./output/host/bin/mkknlimg output/images/zImage /mnt/mountpointboot/zImage
 
 Note: The kernel image file name is defined in config.txt like this:
 kernel=zImage
diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index c465a4d..cd53cf7 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -31,8 +31,8 @@ config BR2_TARGET_GRUB2
 	     sudo tar -C /mnt -xf output/images/rootfs.tar
 	     sudo umount /mnt
 	  5. Install Grub2
-	     sudo ./output/host/usr/sbin/grub-bios-setup \
-			-b ./output/host/usr/lib/grub/i386-pc/boot.img \
+	     sudo ./output/host/sbin/grub-bios-setup \
+			-b ./output/host/lib/grub/i386-pc/boot.img \
 			-c ./output/images/grub.img -d . /dev/loop0
 	  6. Cleanup loop device
 	     sudo partx -d /dev/loop0
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 88a46f4..42cda2e 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -76,15 +76,15 @@ GRUB2_INSTALL_TARGET_OPTS = DESTDIR=$(HOST_DIR) install
 
 ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
 define GRUB2_IMAGE_INSTALL_ELTORITO
-	cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
+	cat $(HOST_DIR)/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
 		$(BINARIES_DIR)/grub-eltorito.img
 endef
 endif
 
 define GRUB2_IMAGE_INSTALLATION
 	mkdir -p $(dir $(GRUB2_IMAGE))
-	$(HOST_DIR)/usr/bin/grub-mkimage \
-		-d $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE) \
+	$(HOST_DIR)/bin/grub-mkimage \
+		-d $(HOST_DIR)/lib/grub/$(GRUB2_TUPLE) \
 		-O $(GRUB2_TUPLE) \
 		-o $(GRUB2_IMAGE) \
 		-p "$(GRUB2_PREFIX)" \
diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 17af6dc..8a8b767 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -93,7 +93,7 @@ define MXS_BOOTLETS_BUILD_CMDS
 	$(MXS_BOOTLETS_SED_BAREBOX)
 	$(MXS_BOOTLETS_SED_LINUX)
 	$(MXS_BOOTLETS_SED_UBOOT)
-	$(HOST_DIR)/usr/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
+	$(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
 		-z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
 		-o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM)
 endef
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 0868896..486a1c2 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -51,7 +51,7 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # and the internal zlib should take precedence so -I shouldn't
 # be used.
 define SYSLINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/include $(HOST_LDFLAGS)" \
 		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
 endef
 
@@ -61,7 +61,7 @@ endef
 # Repeat CC and AR, since syslinux really wants to check them at
 # install time
 define SYSLINUX_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/include $(HOST_LDFLAGS)" \
 		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
 		-C $(@D) $(SYSLINUX_TARGET) install
 endef
@@ -81,7 +81,7 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 		$(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/syslinux/$${i##*/}; \
 	done
 	for i in $(SYSLINUX_C32); do \
-		$(INSTALL) -D -m 0755 $(HOST_DIR)/usr/share/syslinux/$${i} \
+		$(INSTALL) -D -m 0755 $(HOST_DIR)/share/syslinux/$${i} \
 			$(BINARIES_DIR)/syslinux/$${i}; \
 	done
 endef
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 66e728f..a317a98 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -171,7 +171,7 @@ define UBOOT_BUILD_CMDS
 endef
 
 define UBOOT_BUILD_OMAP_IFT
-	$(HOST_DIR)/usr/bin/gpsign -f $(@D)/u-boot.bin \
+	$(HOST_DIR)/bin/gpsign -f $(@D)/u-boot.bin \
 		-c $(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG))
 endef
 
@@ -182,7 +182,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
 	$(if $(BR2_TARGET_UBOOT_SPL),
 		cp -dpf $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) $(BINARIES_DIR)/)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
-		$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
+		$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
 		-o $(BINARIES_DIR)/uboot-env.bin $(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
 endef
@@ -207,7 +207,7 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
 define UBOOT_GENERATE_ZYNQ_IMAGE
-	$(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/zynq-boot-bin.py \
+	$(HOST_DIR)/bin/python2 $(HOST_DIR)/bin/zynq-boot-bin.py \
 		-u $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))     \
 		-o $(BINARIES_DIR)/BOOT.BIN
 endef
diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 825899b..b144c9e 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -127,7 +127,7 @@ installed what and remove it when the package is unselected. However, it
 is much more complicated than that:
 
  * It is not only about the +target/+ directory, but also the sysroot in
-   +host/usr/<tuple>/sysroot+ and the +host/+ directory itself. All files
+   +host/<tuple>/sysroot+ and the +host/+ directory itself. All files
    installed in those directories by various packages must be tracked.
 
  * When a package is unselected from the configuration, it is not
diff --git a/docs/manual/using-buildroot-debugger.txt b/docs/manual/using-buildroot-debugger.txt
index b5063ca..d5293be 100644
--- a/docs/manual/using-buildroot-debugger.txt
+++ b/docs/manual/using-buildroot-debugger.txt
@@ -35,7 +35,7 @@ Then, on the host, you should start the cross gdb using the following
 command line:
 
 ----------------------------
-<buildroot>/output/host/usr/bin/<tuple>-gdb -x <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
+<buildroot>/output/host/bin/<tuple>-gdb -x <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
 ----------------------------
 
 Of course, +foo+ must be available in the current directory, built
diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 9a98628..6a90645 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -9,7 +9,7 @@ can use the toolchain that was generated by Buildroot.
 
 The toolchain generated by Buildroot is located by default in
 +output/host/+. The simplest way to use it is to add
-+output/host/usr/bin/+ to your PATH environment variable and then to
++output/host/bin/+ to your PATH environment variable and then to
 use +ARCH-linux-gcc+, +ARCH-linux-objdump+, +ARCH-linux-ld+, etc.
 
 It is possible to relocate the toolchain - but then +--sysroot+ must
diff --git a/fs/cloop/cloop.mk b/fs/cloop/cloop.mk
index f783ade..e5c76d6 100644
--- a/fs/cloop/cloop.mk
+++ b/fs/cloop/cloop.mk
@@ -7,7 +7,7 @@
 ROOTFS_CLOOP_DEPENDENCIES = host-cloop host-cdrkit
 
 define ROOTFS_CLOOP_CMD
-	$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) | $(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $@
+	$(HOST_DIR)/bin/genisoimage -r $(TARGET_DIR) | $(HOST_DIR)/bin/create_compressed_fs - 65536 > $@
 endef
 
 $(eval $(call ROOTFS_TARGET,cloop))
\ No newline at end of file
diff --git a/fs/common.mk b/fs/common.mk
index 528e194..b65f2c7 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -84,7 +84,7 @@ ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 	printf '$$(subst $$(sep),\n,$$(PACKAGES_DEVICES_TABLE))' >> $$(FULL_DEVICE_TABLE)
 endif
 	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
-	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+	echo "$$(HOST_DIR)/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
 ifneq ($$(ROOTFS_USERS_TABLES),)
 	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
@@ -93,7 +93,7 @@ endif
 	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 7472372..85b98b8 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -11,7 +11,7 @@ CRAMFS_OPTS = -l
 endif
 
 define ROOTFS_CRAMFS_CMD
-	$(HOST_DIR)/usr/bin/mkcramfs $(CRAMFS_OPTS) $(TARGET_DIR) $@
+	$(HOST_DIR)/bin/mkcramfs $(CRAMFS_OPTS) $(TARGET_DIR) $@
 endef
 
 ROOTFS_CRAMFS_DEPENDENCIES = host-cramfs
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 32d79d7..093b699 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -70,7 +70,7 @@ ROOTFS_ISO9660_BOOT_IMAGE = isolinux/isolinux.bin
 define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/syslinux/* \
 		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/
-	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/syslinux/ldlinux.c32 \
+	$(INSTALL) -D -m 0644 $(HOST_DIR)/share/syslinux/ldlinux.c32 \
 		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/ldlinux.c32
 endef
 endif
@@ -144,14 +144,14 @@ endif # ROOTFS_ISO9660_USE_INITRD
 
 
 define ROOTFS_ISO9660_CMD
-	$(HOST_DIR)/usr/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
+	$(HOST_DIR)/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
 		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
 endef
 
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
 define ROOTFS_ISO9660_GEN_HYBRID
-	$(HOST_DIR)/usr/bin/isohybrid -t 0x96 $@
+	$(HOST_DIR)/bin/isohybrid -t 0x96 $@
 endef
 
 ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID
diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
index 2738b6b..eded91d 100644
--- a/fs/romfs/romfs.mk
+++ b/fs/romfs/romfs.mk
@@ -7,7 +7,7 @@
 ROOTFS_ROMFS_DEPENDENCIES = host-genromfs
 
 define ROOTFS_ROMFS_CMD
-	$(HOST_DIR)/usr/bin/genromfs -d $(TARGET_DIR) -f $@
+	$(HOST_DIR)/bin/genromfs -d $(TARGET_DIR) -f $@
 endef
 
 $(eval $(call ROOTFS_TARGET,romfs))
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index a71d9cc..886c90f 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -25,7 +25,7 @@ endif
 endif
 
 define ROOTFS_SQUASHFS_CMD
-	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
+	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
 		$(ROOTFS_SQUASHFS_ARGS) && \
 	chmod 0644 $@
 endef
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
index aba3bea..4d4d5e6 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubifs/ubi.mk
@@ -23,7 +23,7 @@ endif
 define ROOTFS_UBI_CMD
 	$(INSTALL) -m 0644 $(UBINIZE_CONFIG_FILE_PATH) $(BUILD_DIR)/ubinize.cfg ;\
 	$(SED) 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' $(BUILD_DIR)/ubinize.cfg ;\
-	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg ;\
+	$(HOST_DIR)/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg ;\
 	rm $(BUILD_DIR)/ubinize.cfg
 endef
 
diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index f1e4126..7b2b0fb 100644
--- a/fs/ubifs/ubifs.mk
+++ b/fs/ubifs/ubifs.mk
@@ -21,7 +21,7 @@ UBIFS_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_OPTS))
 ROOTFS_UBIFS_DEPENDENCIES = host-mtd
 
 define ROOTFS_UBIFS_CMD
-	$(HOST_DIR)/usr/sbin/mkfs.ubifs -d $(TARGET_DIR) $(UBIFS_OPTS) -o $@
+	$(HOST_DIR)/sbin/mkfs.ubifs -d $(TARGET_DIR) $(UBIFS_OPTS) -o $@
 endef
 
 $(eval $(call ROOTFS_TARGET,ubifs))
diff --git a/fs/yaffs2/yaffs.mk b/fs/yaffs2/yaffs.mk
index 19bdbe8..3057073 100644
--- a/fs/yaffs2/yaffs.mk
+++ b/fs/yaffs2/yaffs.mk
@@ -7,7 +7,7 @@
 ROOTFS_YAFFS2_DEPENDENCIES = host-yaffs2utils
 
 define ROOTFS_YAFFS2_CMD
-	$(HOST_DIR)/usr/bin/mkyaffs2 --all-root $(TARGET_DIR) $@
+	$(HOST_DIR)/bin/mkyaffs2 --all-root $(TARGET_DIR) $@
 endef
 
 $(eval $(call ROOTFS_TARGET,yaffs2))
diff --git a/linux/linux.mk b/linux/linux.mk
index 6c7ecfc..9c80e96 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -296,7 +296,7 @@ endif
 define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
 	if grep -q "CONFIG_DTC=y" $(@D)/.config; then 	\
-		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/linux-dtc ;	\
+		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/bin/linux-dtc ;	\
 	fi
 endef
 
diff --git a/package/Makefile.in b/package/Makefile.in
index ca34660..2b581b0 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -107,7 +107,7 @@ ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),yy)
 TARGET_ABI += -matomic
 endif
 
-STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
+STAGING_SUBDIR = $(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 
 ifeq ($(BR2_OPTIMIZE_0),y)
@@ -165,9 +165,9 @@ TARGET_CXXFLAGS += -fstack-protector-all
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGET_CROSS = $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
+TARGET_CROSS = $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-
 else
-TARGET_CROSS = $(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
+TARGET_CROSS = $(HOST_DIR)/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
 endif
 
 # Define TARGET_xx variables for all common binutils/gcc
@@ -196,7 +196,7 @@ ifeq ($(BR2_STRIP_sstrip),y)
 STRIP_STRIP_DEBUG :=
 STRIP_STRIP_UNNEEDED :=
 STRIP_STRIP_ALL :=
-TARGET_STRIP = $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-sstrip
+TARGET_STRIP = $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-sstrip
 STRIPCMD = $(TARGET_STRIP)
 KSTRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note --strip-unneeded
 endif
@@ -213,11 +213,11 @@ UNZIP := $(shell which unzip || type -p unzip) -q
 
 APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
-HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
+HOST_CPPFLAGS  = -I$(HOST_DIR)/include
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
-HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
+HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
 HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
@@ -225,14 +225,14 @@ HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
 
 # host-intltool should be executed with the system perl, so we save
 # the path to the system perl, before a host-perl built by Buildroot
-# might get installed into $(HOST_DIR)/usr/bin and therefore appears
+# might get installed into $(HOST_DIR)/bin and therefore appears
 # in our PATH. This system perl will be used as INTLTOOL_PERL.
 export PERL=$(shell which perl)
 
 # host-intltool needs libxml-parser-perl, which Buildroot installs in
-# $(HOST_DIR)/usr/lib/perl, so we must make sure that the system perl
+# $(HOST_DIR)/lib/perl, so we must make sure that the system perl
 # finds this perl module by exporting the proper value for PERL5LIB.
-export PERL5LIB=$(HOST_DIR)/usr/lib/perl
+export PERL5LIB=$(HOST_DIR)/lib/perl
 
 TARGET_CONFIGURE_OPTS = \
 	PATH=$(BR_PATH) \
@@ -295,16 +295,16 @@ HOST_CONFIGURE_OPTS = \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
-	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
-	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig" \
+	LD_LIBRARY_PATH="$(HOST_DIR)/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
 	INTLTOOL_PERL=$(PERL)
 
 HOST_MAKE_ENV = \
 	PATH=$(BR_PATH) \
-	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
+	LD_LIBRARY_PATH="$(HOST_DIR)/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
-	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig"
 
 # This is extra environment we can not export ourselves (eg. because some
 # packages use that variable internally, eg. uboot), so we have to
diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
index a4ff201..0300e36 100644
--- a/package/am335x-pru-package/am335x-pru-package.mk
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -67,7 +67,7 @@ define HOST_AM335X_PRU_PACKAGE_BUILD_CMDS
 endef
 
 define HOST_AM335X_PRU_PACKAGE_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/pru_sw/utils/pasm $(HOST_DIR)/usr/bin/pasm
+	$(INSTALL) -m 0755 -D $(@D)/pru_sw/utils/pasm $(HOST_DIR)/bin/pasm
 endef
 
 $(eval $(generic-package))
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 673a57f..2c55760 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -9,6 +9,6 @@ AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPLv3+ with exception
 AUTOCONF_ARCHIVE_LICENSE_FILES = COPYING COPYING.EXCEPTION
-HOST_AUTOCONF_ARCHIVE_INSTALL_OPTS = aclocaldir=$(HOST_DIR)/usr/share/autoconf-archive install
+HOST_AUTOCONF_ARCHIVE_INSTALL_OPTS = aclocaldir=$(HOST_DIR)/share/autoconf-archive install
 
 $(eval $(host-autotools-package))
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index fd91961..4d984ea 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -13,7 +13,7 @@ AUTOCONF_LICENSE_FILES = COPYINGv3 COPYING.EXCEPTION
 
 HOST_AUTOCONF_CONF_ENV = \
 	EMACS="no" \
-	ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
+	ac_cv_path_M4=$(HOST_DIR)/bin/m4 \
 	ac_cv_prog_gnu_m4_gnu=no
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
@@ -21,6 +21,6 @@ HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 $(eval $(host-autotools-package))
 
 # variables used by other packages
-AUTOCONF = $(HOST_DIR)/usr/bin/autoconf
-AUTOHEADER = $(HOST_DIR)/usr/bin/autoheader
-AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
+AUTOCONF = $(HOST_DIR)/bin/autoconf
+AUTOHEADER = $(HOST_DIR)/bin/autoheader
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 84f05dc..ea4e8d3 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -12,7 +12,7 @@ AUTOMAKE_LICENSE_FILES = COPYING
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
-ACLOCAL_HOST_DIR = $(HOST_DIR)/usr/share/aclocal
+ACLOCAL_HOST_DIR = $(HOST_DIR)/share/aclocal
 
 define GTK_DOC_M4_INSTALL
 	$(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 \
@@ -30,6 +30,6 @@ HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL
 $(eval $(host-autotools-package))
 
 # variables used by other packages
-AUTOMAKE = $(HOST_DIR)/usr/bin/automake
+AUTOMAKE = $(HOST_DIR)/bin/automake
 ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
-ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
+ACLOCAL = $(HOST_DIR)/bin/aclocal -I $(ACLOCAL_DIR)
diff --git a/package/b43-firmware/b43-firmware.mk b/package/b43-firmware/b43-firmware.mk
index 601ab66..8e9e877 100644
--- a/package/b43-firmware/b43-firmware.mk
+++ b/package/b43-firmware/b43-firmware.mk
@@ -23,7 +23,7 @@ B43_FIRMWARE_DEPENDENCIES = host-b43-fwcutter
 
 define B43_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/
-	$(HOST_DIR)/usr/bin/b43-fwcutter -w $(TARGET_DIR)/lib/firmware/ $(@D)/$(B43_FIRMWARE_DRIVER_FILE)
+	$(HOST_DIR)/bin/b43-fwcutter -w $(TARGET_DIR)/lib/firmware/ $(@D)/$(B43_FIRMWARE_DRIVER_FILE)
 endef
 
 $(eval $(generic-package))
diff --git a/package/b43-fwcutter/b43-fwcutter.mk b/package/b43-fwcutter/b43-fwcutter.mk
index d264b64..c56aede 100644
--- a/package/b43-fwcutter/b43-fwcutter.mk
+++ b/package/b43-fwcutter/b43-fwcutter.mk
@@ -15,7 +15,7 @@ define HOST_B43_FWCUTTER_BUILD_CMDS
 endef
 
 define HOST_B43_FWCUTTER_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/b43-fwcutter $(HOST_DIR)/usr/bin/b43-fwcutter
+	$(INSTALL) -D -m 0755 $(@D)/b43-fwcutter $(HOST_DIR)/bin/b43-fwcutter
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index cc3ba9e..03dda7b 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -65,11 +65,11 @@ endif
 ifeq ($(BR2_PACKAGE_BOOST_PYTHON),y)
 BOOST_FLAGS += --with-python-root=$(HOST_DIR)
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-BOOST_FLAGS += --with-python=$(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)
+BOOST_FLAGS += --with-python=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
 BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m
 BOOST_DEPENDENCIES += python3
 else
-BOOST_FLAGS += --with-python=$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)
+BOOST_FLAGS += --with-python=$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR)
 BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 BOOST_DEPENDENCIES += python
 endif
@@ -132,14 +132,14 @@ define HOST_BOOST_BUILD_CMDS
 	--user-config=$(@D)/user-config.jam \
 	$(HOST_BOOST_OPTS) \
 	--ignore-site-config \
-	--prefix=$(HOST_DIR)/usr )
+	--prefix=$(HOST_DIR) )
 endef
 
 define HOST_BOOST_INSTALL_CMDS
 	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
 	$(HOST_BOOST_OPTS) \
-	--prefix=$(HOST_DIR)/usr \
+	--prefix=$(HOST_DIR) \
 	--ignore-site-config \
 	--layout=$(BOOST_LAYOUT) install )
 endef
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 0597ab9..62571ed 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -60,9 +60,9 @@ endef
 
 define HOST_BZIP2_INSTALL_CMDS
 	$(HOST_MAKE_ENV) \
-		$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
+		$(MAKE) PREFIX=$(HOST_DIR) -C $(@D) install
 	$(HOST_MAKE_ENV) \
-		$(MAKE) -f Makefile-libbz2_so PREFIX=$(HOST_DIR)/usr -C $(@D) install
+		$(MAKE) -f Makefile-libbz2_so PREFIX=$(HOST_DIR) -C $(@D) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index b64120e..5309582 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -33,7 +33,7 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	done
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/usr/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
 endef
 
 $(eval $(generic-package))
diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
index 61578d3..87544e0 100644
--- a/package/canfestival/canfestival.mk
+++ b/package/canfestival/canfestival.mk
@@ -37,13 +37,13 @@ endef
 
 define CANFESTIVAL_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) all \
-		PYTHON=$(HOST_DIR)/usr/bin/python2
+		PYTHON=$(HOST_DIR)/bin/python2
 endef
 
 define CANFESTIVAL_INSTALL_TARGET_CMDS
 	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
 		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
-			PYTHON=$(HOST_DIR)/usr/bin/python2 \
+			PYTHON=$(HOST_DIR)/bin/python2 \
 			DESTDIR=$(TARGET_DIR) || exit 1 ; \
 	done
 endef
@@ -51,7 +51,7 @@ endef
 define CANFESTIVAL_INSTALL_STAGING_CMDS
 	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
 		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
-			PYTHON=$(HOST_DIR)/usr/bin/python2 \
+			PYTHON=$(HOST_DIR)/bin/python2 \
 			DESTDIR=$(STAGING_DIR) || exit 1 ; \
 	done
 endef
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 4b7b2f3..b5e46ca 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -12,8 +12,8 @@ CHECKPOLICY_LICENSE_FILES = COPYING
 HOST_CHECKPOLICY_DEPENDENCIES = host-libselinux host-flex host-bison
 
 HOST_CHECKPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
-	LEX="$(HOST_DIR)/usr/bin/flex" \
-	YACC="$(HOST_DIR)/usr/bin/bison -y"
+	LEX="$(HOST_DIR)/bin/flex" \
+	YACC="$(HOST_DIR)/bin/bison -y"
 
 # DESTDIR is used at build time to find host-libselinux
 define HOST_CHECKPOLICY_BUILD_CMDS
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index caed3f4..90907f3 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -17,9 +17,9 @@ define HOST_CLOOP_BUILD_CMDS
 endef
 
 define HOST_CLOOP_INSTALL_CMDS
-	$(INSTALL) -m 0755 -d $(HOST_DIR)/usr/bin
-	$(INSTALL) -m 755 $(@D)/create_compressed_fs $(HOST_DIR)/usr/bin
-	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/usr/bin
+	$(INSTALL) -m 0755 -d $(HOST_DIR)/bin
+	$(INSTALL) -m 755 $(@D)/create_compressed_fs $(HOST_DIR)/bin
+	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/bin
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 0f888fd..e7cf8bc 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -21,7 +21,7 @@ CMAKE_CONF_OPTS = \
 	-DBUILD_CursesDialog=OFF
 
 # Get rid of -I* options from $(HOST_CPPFLAGS) to prevent that a
-# header available in $(HOST_DIR)/usr/include is used instead of a
+# header available in $(HOST_DIR)/include is used instead of a
 # CMake internal header, e.g. lzma* headers of the xz package
 HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
 HOST_CMAKE_CXXFLAGS = $(shell echo $(HOST_CXXFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
@@ -30,7 +30,7 @@ define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
 		LDFLAGS="$(HOST_LDFLAGS)" \
 		CFLAGS="$(HOST_CMAKE_CFLAGS)" \
-		./bootstrap --prefix=$(HOST_DIR)/usr \
+		./bootstrap --prefix=$(HOST_DIR) \
 			--parallel=$(PARALLEL_JOBS) -- \
 			-DCMAKE_C_FLAGS="$(HOST_CMAKE_CFLAGS)" \
 			-DCMAKE_CXX_FLAGS="$(HOST_CMAKE_CXXFLAGS)" \
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 611020c..8966601 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -27,7 +27,7 @@ endif
 # needed for compiling packages using cppcms. And it is not worth
 # creating a host package just for a python script.
 define CPPCMS_INSTALL_HOST_TOOLS
-	cp $(STAGING_DIR)/usr/bin/cppcms_tmpl_cc $(HOST_DIR)/usr/bin/cppcms_tmpl_cc
+	cp $(STAGING_DIR)/usr/bin/cppcms_tmpl_cc $(HOST_DIR)/bin/cppcms_tmpl_cc
 endef
 CPPCMS_POST_INSTALL_STAGING_HOOKS += CPPCMS_INSTALL_HOST_TOOLS
 
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 72860b6..8c4386e 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -25,8 +25,8 @@ define HOST_CRAMFS_BUILD_CMDS
 endef
 
 define HOST_CRAMFS_INSTALL_CMDS
-	$(INSTALL) -D -m 755 $(@D)/mkcramfs $(HOST_DIR)/usr/bin/mkcramfs
-	$(INSTALL) -D -m 755 $(@D)/cramfsck $(HOST_DIR)/usr/bin/cramfsck
+	$(INSTALL) -D -m 755 $(@D)/mkcramfs $(HOST_DIR)/bin/mkcramfs
+	$(INSTALL) -D -m 755 $(@D)/cramfsck $(HOST_DIR)/bin/cramfsck
 endef
 
 $(eval $(generic-package))
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index 24bfd5f..66a9e1d 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -19,7 +19,7 @@ CRDA_LICENSE_FILES = LICENSE
 #   interpreter, hence the host-python dependency and the PYTHON variable.
 define CRDA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) all_noverify -C $(@D)
 endef
 
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index bbd6813..9c0c6fe 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -39,4 +39,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # dbus-glib for the host
-DBUS_GLIB_HOST_BINARY = $(HOST_DIR)/usr/bin/dbus-binding-tool
+DBUS_GLIB_HOST_BINARY = $(HOST_DIR)/bin/dbus-binding-tool
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 4079967..5ae9f08 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -16,14 +16,14 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 DBUS_PYTHON_DEPENDENCIES += python host-python
 
 DBUS_PYTHON_CONF_ENV += \
-	PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	PYTHON=$(HOST_DIR)/bin/python2 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python2-config --ldflags`"
 else
 DBUS_PYTHON_DEPENDENCIES += python3 host-python3
 
 DBUS_PYTHON_CONF_ENV += \
-	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
 endif
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 139a5d7..96fcb81 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -120,7 +120,7 @@ HOST_DBUS_CONF_OPTS = \
 DBUS_HOST_INTROSPECT = $(HOST_DBUS_DIR)/introspect.xml
 
 HOST_DBUS_GEN_INTROSPECT = \
-	$(HOST_DIR)/usr/bin/dbus-daemon --introspect > $(DBUS_HOST_INTROSPECT)
+	$(HOST_DIR)/bin/dbus-daemon --introspect > $(DBUS_HOST_INTROSPECT)
 
 HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
 
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 5e68b7b..5ab36be 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -166,10 +166,10 @@ HOST_DIRECTFB_BUILD_CMDS = \
 	$(MAKE) -C $(@D)/tools directfb-csource
 
 HOST_DIRECTFB_INSTALL_CMDS = \
-	$(INSTALL) -m 0755 $(@D)/tools/directfb-csource $(HOST_DIR)/usr/bin
+	$(INSTALL) -m 0755 $(@D)/tools/directfb-csource $(HOST_DIR)/bin
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # directfb-csource for the host
-DIRECTFB_HOST_BINARY = $(HOST_DIR)/usr/bin/directfb-csource
+DIRECTFB_HOST_BINARY = $(HOST_DIR)/bin/directfb-csource
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index b7f7d96..3c1d1fa 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -61,7 +61,7 @@ define HOST_DOSFSTOOLS_BUILD_CMDS
 endef
 
 define HOST_DOSFSTOOLS_INSTALL_CMDS
-	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr install
+	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index 14dd090..2b9600b 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -12,7 +12,7 @@ DOXYGEN_LICENSE_FILES = LICENSE
 DOXYGEN_DEPENDENCIES = host-flex host-bison
 
 define HOST_DOXYGEN_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_MAKE_ENV) ./configure --shared --prefix=$(HOST_DIR)/usr)
+	(cd $(@D); $(HOST_MAKE_ENV) ./configure --shared --prefix=$(HOST_DIR))
 endef
 
 define HOST_DOXYGEN_BUILD_CMDS
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index f3b6f3b..1ea8041 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -46,11 +46,11 @@ endef
 
 # host build
 define HOST_DTC_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)
 endef
 
 define HOST_DTC_INSTALL_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
+	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-bin
 endef
 
 $(eval $(generic-package))
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 8bd69fe..fe0fa8c 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -17,8 +17,8 @@ LIBELEMENTARY_DEPENDENCIES = \
 	host-libeet
 
 LIBELEMENTARY_CONF_OPTS = \
-	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
-	--with-eet-eet=$(HOST_DIR)/usr/bin/eet
+	--with-edje-cc=$(HOST_DIR)/bin/edje_cc \
+	--with-eet-eet=$(HOST_DIR)/bin/eet
 
 # libethumb_client is only built when ethumbd is built.
 # ethumbd is only built if edbus is built.
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index 314ddf9..bb91e46 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -14,7 +14,7 @@ LIBETHUMB_INSTALL_STAGING = YES
 
 LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
 
-LIBETHUMB_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
+LIBETHUMB_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/bin/edje_cc
 
 ifeq ($(BR2_PACKAGE_LIBEXIF),y)
 LIBETHUMB_DEPENDENCIES += libexif
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index fe7e1ce..cf0a966 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -25,7 +25,7 @@ EJABBERD_ERLANG_LIBS = sasl crypto public_key ssl mnesia inets compiler
 # Guess answers for these tests, configure will bail out otherwise
 # saying error: cannot run test program while cross compiling.
 EJABBERD_CONF_ENV = \
-	ac_cv_erlang_root_dir="$(HOST_DIR)/usr/lib/erlang" \
+	ac_cv_erlang_root_dir="$(HOST_DIR)/lib/erlang" \
 	$(foreach lib,$(EJABBERD_ERLANG_LIBS), \
 		ac_cv_erlang_lib_dir_$(lib)="`package/ejabberd/check-erlang-lib $(lib)`")
 
diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
index ac9aa32..4a0a3db 100644
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -14,9 +14,9 @@ define HOST_ELFTOSB_BUILD_CMDS
 endef
 
 define HOST_ELFTOSB_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bld/linux/elftosb $(HOST_DIR)/usr/bin/elftosb
-	$(INSTALL) -D -m 0755 $(@D)/bld/linux/keygen $(HOST_DIR)/usr/bin/keygen
-	$(INSTALL) -D -m 0755 $(@D)/bld/linux/sbtool $(HOST_DIR)/usr/bin/sbtool
+	$(INSTALL) -D -m 0755 $(@D)/bld/linux/elftosb $(HOST_DIR)/bin/elftosb
+	$(INSTALL) -D -m 0755 $(@D)/bld/linux/keygen $(HOST_DIR)/bin/keygen
+	$(INSTALL) -D -m 0755 $(@D)/bld/linux/sbtool $(HOST_DIR)/bin/sbtool
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index ddebe06..3c58cf4 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -25,8 +25,8 @@ ENLIGHTENMENT_DEPENDENCIES = 	\
 	xcb-util-keysyms
 
 ENLIGHTENMENT_CONF_OPTS = \
-	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
-	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
+	--with-edje-cc=$(HOST_DIR)/bin/edje_cc \
+	--with-eet-eet=$(HOST_DIR)/bin/eet \
 	--disable-rpath
 
 # uClibc has an old incomplete sys/ptrace.h for powerpc & sparc
diff --git a/package/erlang-rebar/erlang-rebar.mk b/package/erlang-rebar/erlang-rebar.mk
index f29eb75..ad679d4 100644
--- a/package/erlang-rebar/erlang-rebar.mk
+++ b/package/erlang-rebar/erlang-rebar.mk
@@ -25,7 +25,7 @@ define HOST_ERLANG_REBAR_BUILD_CMDS
 endef
 
 define HOST_ERLANG_REBAR_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/rebar $(HOST_DIR)/usr/bin/rebar
+	$(INSTALL) -m 0755 -D $(@D)/rebar $(HOST_DIR)/bin/rebar
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 499f62c..cd6eb0a 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -36,7 +36,7 @@ ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS=-latomic_ops
 # erlang uses openssl for all things crypto. Since the host tools (such as
 # rebar) uses crypto, we need to build host-erlang with support for openssl.
 HOST_ERLANG_DEPENDENCIES = host-openssl
-HOST_ERLANG_CONF_OPTS = --without-javac --with-ssl=$(HOST_DIR)/usr
+HOST_ERLANG_CONF_OPTS = --without-javac --with-ssl=$(HOST_DIR)
 
 HOST_ERLANG_CONF_OPTS += --without-termcap
 
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
index 292fe17..be101f3 100644
--- a/package/faketime/faketime.mk
+++ b/package/faketime/faketime.mk
@@ -10,11 +10,11 @@ FAKETIME_LICENSE = GPLv2
 FAKETIME_LICENSE_FILES = COPYING
 
 define HOST_FAKETIME_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)
 endef
 
 define HOST_FAKETIME_INSTALL_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index a5be3c7..5100aef 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -33,7 +33,7 @@ define  HOST_GCC_FINAL_CONFIGURE_CMDS
 		LDFLAGS="$(HOST_LDFLAGS)" \
 		$(HOST_GCC_FINAL_CONF_ENV) \
 		./configure \
-		--prefix="$(HOST_DIR)/usr" \
+		--prefix="$(HOST_DIR)" \
 		--sysconfdir="$(HOST_DIR)/etc" \
 		--enable-static \
 		$(QUIET) $(HOST_GCC_FINAL_CONF_OPTS) \
@@ -50,18 +50,18 @@ GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGE
 HOST_GCC_FINAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
 	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
-	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
+	--with-build-time-tools=$(HOST_DIR)/$(GNU_TARGET_NAME)/bin
 
-HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*
+HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
 ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
 HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
-HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
+HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
 endif
 ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
 HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
-HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
+HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
 endif
 
 # Disable shared libs like libstdc++ if we do static since it confuses linking
@@ -87,9 +87,9 @@ HOST_GCC_FINAL_CONF_ENV = \
 
 # Make sure we have 'cc'
 define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
-	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
+	if [ ! -e $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-cc ]; then \
 		ln -snf $(GNU_TARGET_NAME)-gcc \
-			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
+			$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-cc; \
 	fi
 endef
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ef606c4..a3c11a8 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -91,8 +91,8 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-gnu-ld \
 	--disable-libssp \
 	--disable-multilib \
-	--with-gmp=$(HOST_DIR)/usr \
-	--with-mpfr=$(HOST_DIR)/usr \
+	--with-gmp=$(HOST_DIR) \
+	--with-mpfr=$(HOST_DIR) \
 	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
 	--with-bugurl="http://bugs.buildroot.net/"
 
@@ -173,12 +173,12 @@ endif
 
 ifeq ($(BR2_GCC_NEEDS_MPC),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-mpc
-HOST_GCC_COMMON_CONF_OPTS += --with-mpc=$(HOST_DIR)/usr
+HOST_GCC_COMMON_CONF_OPTS += --with-mpc=$(HOST_DIR)
 endif
 
 ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-isl host-cloog
-HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)/usr --with-cloog=$(HOST_DIR)/usr
+HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR) --with-cloog=$(HOST_DIR)
 else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
@@ -275,7 +275,7 @@ endif # BR2_CCACHE
 # Avoid that a .br_real is symlinked a second time.
 # Also create <arch>-linux-<tool> symlinks.
 define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
-	$(Q)cd $(HOST_DIR)/usr/bin; \
+	$(Q)cd $(HOST_DIR)/bin; \
 	for i in $(GNU_TARGET_NAME)-*; do \
 		case "$$i" in \
 		*.br_real) \
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 15f394c..51bf63c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -140,7 +140,7 @@ GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
 # does.
 define GDB_SDK_INSTALL_GDBSERVER
 	$(INSTALL) -D -m 0755 $(TARGET_DIR)/usr/bin/gdbserver \
-		$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/debug-root/usr/bin/gdbserver
+		$(HOST_DIR)/$(GNU_TARGET_NAME)/debug-root/usr/bin/gdbserver
 endef
 
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
@@ -170,7 +170,7 @@ HOST_GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
-HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/usr/bin/python2
+HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python2
 HOST_GDB_DEPENDENCIES += host-python
 else
 HOST_GDB_CONF_OPTS += --without-python
@@ -178,7 +178,7 @@ endif
 
 # legacy $arch-linux-gdb symlink
 define HOST_GDB_ADD_SYMLINK
-	cd $(HOST_DIR)/usr/bin && \
+	cd $(HOST_DIR)/bin && \
 		ln -snf $(GNU_TARGET_NAME)-gdb $(ARCH)-linux-gdb
 endef
 
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index 8db0899..62a34b2 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -25,7 +25,7 @@ define HOST_GENROMFS_BUILD_CMDS
 endef
 
 define HOST_GENROMFS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 724b393..b60a5c8 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -59,7 +59,7 @@ endef
 GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_UNNEEDED
 
 define GETTEXT_GETTEXTIZE_EYE_CANDY
-	$(SED) '/Press Return\|read dummy/d' $(HOST_DIR)/usr/bin/gettextize
+	$(SED) '/Press Return\|read dummy/d' $(HOST_DIR)/bin/gettextize
 endef
 
 HOST_GETTEXT_POST_INSTALL_HOOKS += GETTEXT_GETTEXTIZE_EYE_CANDY
@@ -75,11 +75,11 @@ endif
 
 # Disable interactive confirmation in host gettextize for package fixups
 define HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
-	$(SED) '/read dummy/d' $(HOST_DIR)/usr/bin/gettextize
+	$(SED) '/read dummy/d' $(HOST_DIR)/bin/gettextize
 endef
 HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
 
-GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/usr/bin/autom4te $(HOST_DIR)/usr/bin/gettextize -f
+GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/bin/autom4te $(HOST_DIR)/bin/gettextize -f
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index a2e8852..9ca1761 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -49,16 +49,16 @@ define GLMARK2_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(GLMARK2_CONF_ENV) \
-		$(HOST_DIR)/usr/bin/python2 ./waf configure $(GLMARK2_CONF_OPTS) \
+		$(HOST_DIR)/bin/python2 ./waf configure $(GLMARK2_CONF_OPTS) \
 	)
 endef
 
 define GLMARK2_BUILD_CMDS
-	cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf
+	cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/python2 ./waf
 endef
 
 define GLMARK2_INSTALL_TARGET_CMDS
-	cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf install --destdir=$(TARGET_DIR)
+	cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/python2 ./waf install --destdir=$(TARGET_DIR)
 endef
 
 $(eval $(generic-package))
diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
index a0351d0..b63f77f 100644
--- a/package/gmock/gmock.mk
+++ b/package/gmock/gmock.mk
@@ -16,7 +16,7 @@ GMOCK_DEPENDENCIES = gtest host-gmock
 
 # GMock 1.7.0 relies on Python 2.7 syntax which is NOT compatible with Python3.
 HOST_GMOCK_DEPENDENCIES = host-python
-HOST_GMOCK_PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+HOST_GMOCK_PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
 # Static linking is required in order to keep the GMock package completely
 # separated from GTest. According to GMock's README file:
@@ -51,8 +51,8 @@ define HOST_GMOCK_EXTRACT_CMDS
 endef
 
 define HOST_GMOCK_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/scripts/generator/gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen.py
-	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
+	$(INSTALL) -D -m 0755 $(@D)/scripts/generator/gmock_gen.py $(HOST_DIR)/bin/gmock_gen.py
+	ln -sf gmock_gen.py $(HOST_DIR)/bin/gmock_gen
 	cp -rp $(@D)/scripts/generator/cpp $(HOST_GMOCK_PYTHONPATH)
 endef
 
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 04d02e1..fe60673 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -12,4 +12,4 @@ HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
 $(eval $(host-autotools-package))
 
 # gob2 for the host
-GOB2_HOST_BINARY = $(HOST_DIR)/usr/bin/gob2
+GOB2_HOST_BINARY = $(HOST_DIR)/bin/gob2
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 8ede8ad..be9f6a5 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -35,17 +35,17 @@ endif
 define GST1_IMX_CONFIGURE_CMDS
 	cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
-		$(HOST_DIR)/usr/bin/python2 ./waf configure $(GST1_IMX_CONF_OPTS)
+		$(HOST_DIR)/bin/python2 ./waf configure $(GST1_IMX_CONF_OPTS)
 endef
 
 define GST1_IMX_BUILD_CMDS
 	cd $(@D); \
-		$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS)
+		$(HOST_DIR)/bin/python2 ./waf build -j $(PARALLEL_JOBS)
 endef
 
 define GST1_IMX_INSTALL_TARGET_CMDS
 	cd $(@D); \
-		$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
+		$(HOST_DIR)/bin/python2 ./waf --destdir=$(TARGET_DIR) \
 		install
 endef
 
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 2bd7198..ffe1697 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -32,7 +32,7 @@ ifeq ($(BR2_STATIC_LIBS),y)
 GUILE_CFLAGS += -DGC_NO_DLOPEN
 endif
 
-GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
+GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/bin/guile \
 	CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
 
 GUILE_CONF_OPTS += \
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 3ff05b6..c77b013 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -42,7 +42,7 @@ GUTENPRINT_CONF_OPTS = \
 	--disable-cups-ppds
 
 # USE_PREGEN_XMLI18N_TMP_H is added by our patch
-GUTENPRINT_MAKE_ENV = BR2_USE_PREGEN_XMLI18N_TMP_H=$(HOST_DIR)/usr/include/xmli18n-tmp.h
+GUTENPRINT_MAKE_ENV = BR2_USE_PREGEN_XMLI18N_TMP_H=$(HOST_DIR)/include/xmli18n-tmp.h
 
 # We have no host dependencies
 HOST_GUTENPRINT_DEPENDENCIES =
@@ -78,13 +78,13 @@ GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
 HOST_GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
 
 define HOST_GUTENPRINT_POST_BUILD_INSTAL_TMP_HEADER
-	cp $(@D)/src/xml/xmli18n-tmp.h $(HOST_DIR)/usr/include
+	cp $(@D)/src/xml/xmli18n-tmp.h $(HOST_DIR)/include
 endef
 HOST_GUTENPRINT_POST_BUILD_HOOKS += HOST_GUTENPRINT_POST_BUILD_INSTAL_TMP_HEADER
 
 define GUTENPRINT_POST_INSTALL_TARGET_FIXUP
 	mkdir -p $(TARGET_DIR)/usr/share/gutenprint/5.2
-	cp -rf $(HOST_DIR)/usr/share/gutenprint/5.2/xml $(TARGET_DIR)/usr/share/gutenprint/5.2
+	cp -rf $(HOST_DIR)/share/gutenprint/5.2/xml $(TARGET_DIR)/usr/share/gutenprint/5.2
 endef
 GUTENPRINT_POST_INSTALL_TARGET_HOOKS += GUTENPRINT_POST_INSTALL_TARGET_FIXUP
 
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 4242e80..7a9c61d 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -78,7 +78,7 @@ define GVFS_REMOVE_TARGET_SCHEMAS
 endef
 
 define GVFS_COMPILE_SCHEMAS
-	$(HOST_DIR)/usr/bin/glib-compile-schemas --targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas $(STAGING_DIR)/usr/share/glib-2.0/schemas
+	$(HOST_DIR)/bin/glib-compile-schemas --targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas $(STAGING_DIR)/usr/share/glib-2.0/schemas
 endef
 
 GVFS_POST_INSTALL_TARGET_HOOKS += \
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 626e68e..bdffb0c 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -32,10 +32,10 @@ HEIMDAL_AUTORECONF = YES
 
 # We need asn1_compile in the PATH for samba4
 define HOST_HEIMDAL_MAKE_SYMLINK
-	ln -sf $(HOST_DIR)/usr/libexec/heimdal/asn1_compile \
-		$(HOST_DIR)/usr/bin/asn1_compile
-	ln -sf $(HOST_DIR)/usr/bin/compile_et \
-		$(HOST_DIR)/usr/libexec/heimdal/compile_et
+	ln -sf $(HOST_DIR)/libexec/heimdal/asn1_compile \
+		$(HOST_DIR)/bin/asn1_compile
+	ln -sf $(HOST_DIR)/bin/compile_et \
+		$(HOST_DIR)/libexec/heimdal/compile_et
 endef
 
 HOST_HEIMDAL_POST_INSTALL_HOOKS += HOST_HEIMDAL_MAKE_SYMLINK
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 187bd09..142d5f1 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -29,14 +29,14 @@ I2C_TOOLS_PYTHON_BASE_ENV = \
 define I2C_TOOLS_BUILD_PYSMBUS
 	(cd $(@D)/py-smbus;  \
 	$(I2C_TOOLS_PYTHON_BASE_ENV) \
-		$(HOST_DIR)/usr/bin/python setup.py build \
+		$(HOST_DIR)/bin/python setup.py build \
 		$(PKG_PYTHON_DISTUTILS_BUILD_OPTS))
 endef
 
 define I2C_TOOLS_INSTALL_PYSMBUS
 	(cd $(@D)/py-smbus; \
 	$(I2C_TOOLS_PYTHON_BASE_ENV) \
-		$(HOST_DIR)/usr/bin/python setup.py install \
+		$(HOST_DIR)/bin/python setup.py install \
 		$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS))
 endef
 
diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index e57f7e1..17a4e8d 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -47,7 +47,7 @@ endef
 
 define HOST_INFOZIP_INSTALL_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
-		prefix=$(HOST_DIR)/usr
+		prefix=$(HOST_DIR)
 endef
 
 $(eval $(generic-package))
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 3c1767a..052ed7e 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -11,7 +11,7 @@ IW_LICENSE = iw license
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
 IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
-IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
+IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
 define IW_BUILD_CMDS
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 73328d3..27a3737 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -13,23 +13,23 @@ JACK2_INSTALL_STAGING = YES
 define JACK2_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS)	\
-		$(HOST_DIR)/usr/bin/python2 ./waf configure \
+		$(HOST_DIR)/bin/python2 ./waf configure \
 		--prefix=/usr			\
 		--alsa				\
 	)
 endef
 
 define JACK2_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
+	(cd $(@D); $(HOST_DIR)/bin/python2 ./waf build -j $(PARALLEL_JOBS))
 endef
 
 define JACK2_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
+	(cd $(@D); $(HOST_DIR)/bin/python2 ./waf --destdir=$(TARGET_DIR) \
 		install)
 endef
 
 define JACK2_INSTALL_STAGING_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) \
+	(cd $(@D); $(HOST_DIR)/bin/python2 ./waf --destdir=$(STAGING_DIR) \
 		install)
 endef
 
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index a66ba71..84c39a7 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -22,7 +22,7 @@ define HOST_JSMIN_BUILD_CMDS
 endef
 
 define HOST_JSMIN_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/jsmin $(HOST_DIR)/usr/bin/jsmin
+	$(INSTALL) -m 0755 -D $(@D)/jsmin $(HOST_DIR)/bin/jsmin
 endef
 
 $(eval $(generic-package))
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index d91073f..341779c 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -25,8 +25,8 @@ KODI_CONF_ENV = \
 	PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
 	PYTHON_NOVERSIONCHECK="no-check" \
 	use_texturepacker_native=yes \
-	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
-	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
+	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)" \
+	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)"
 
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 5b9b854..d666e3a 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -30,8 +30,8 @@ define LEAFNODE2_BUILD_SORTNL_TOOL
 	cd $(@D); \
 	$(HOSTCC) $(HOST_CFLAGS) -o b_sortnl_host \
 		arc4random.c mergesort.c b_sortnl.c critmem_malloc.c \
-		critmem_realloc.c -DHAVE_CONFIG_H -I$(HOST_DIR)/usr/include \
-		-L $(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib -lpcre
+		critmem_realloc.c -DHAVE_CONFIG_H -I$(HOST_DIR)/include \
+		-L $(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib -lpcre
 endef
 
 LEAFNODE2_PRE_BUILD_HOOKS += LEAFNODE2_BUILD_SORTNL_TOOL
diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
index 6ce2339..d2ee0d5 100644
--- a/package/lesstif/lesstif.mk
+++ b/package/lesstif/lesstif.mk
@@ -30,7 +30,7 @@ define LESSTIF_NOMAN2HTML
 endef
 
 # Prevents to copy ac_find_motif.m4 on target, it would else
-# be created at $(TARGET_DIR)/$(TOPDIR)/output/host/usr/share/aclocal/ac_find_motif.m4
+# be created at $(TARGET_DIR)/$(TOPDIR)/output/host/share/aclocal/ac_find_motif.m4
 define LESSTIF_FIXACLOCAL
 	sed -i -e "/install-data-am: install-aclocalDATA/d" $(@D)/scripts/autoconf/Makefile
 endef
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index b62e8b0..6d2ade3 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -65,7 +65,7 @@ LIBGLIB2_CONF_ENV = \
 	jm_cv_func_working_re_compile_pattern=yes \
 	ac_use_included_regex=no \
 	gl_cv_c_restrict=no \
-	ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal \
+	ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/bin/glib-genmarshal \
 	ac_cv_prog_F77=no \
 	ac_cv_func_posix_getgrgid_r=no \
 	glib_cv_long_long_format=ll \
@@ -137,4 +137,4 @@ endif
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-LIBGLIB2_HOST_BINARY = $(HOST_DIR)/usr/bin/glib-genmarshal
+LIBGLIB2_HOST_BINARY = $(HOST_DIR)/bin/glib-genmarshal
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 0617b9e..70501b8 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -65,8 +65,8 @@ LIBGTK2_CONF_ENV = \
 	jm_cv_func_working_re_compile_pattern=yes \
 	ac_use_included_regex=no \
 	gl_cv_c_restrict=no \
-	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
-	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
+	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/bin/gtk-update-icon-cache \
+	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/bin/gdk-pixbuf-csource \
 	ac_cv_prog_F77=no \
 	ac_cv_path_CUPS_CONFIG=no \
 	DB2HTML=false
@@ -171,7 +171,7 @@ define HOST_LIBGTK2_BUILD_CMDS
 endef
 
 define HOST_LIBGTK2_INSTALL_CMDS
-	cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
+	cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/bin
 endef
 
 $(eval $(autotools-package))
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index d268b56..acc2c9a 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -14,9 +14,9 @@ LIBGTK3_INSTALL_STAGING = YES
 LIBGTK3_AUTORECONF = YES
 
 LIBGTK3_CONF_ENV = \
-	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
-	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
-	PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/usr/bin/pkgconf
+	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/bin/gtk-update-icon-cache \
+	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/bin/gdk-pixbuf-csource \
+	PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/bin/pkgconf
 
 LIBGTK3_CONF_OPTS = \
 	--disable-glibtest \
@@ -121,7 +121,7 @@ LIBGTK3_CONF_OPTS += --disable-installed-tests
 endif
 
 define LIBGTK3_COMPILE_GLIB_SCHEMAS
-	$(HOST_DIR)/usr/bin/glib-compile-schemas \
+	$(HOST_DIR)/bin/glib-compile-schemas \
 		$(TARGET_DIR)/usr/share/glib-2.0/schemas
 endef
 
@@ -149,7 +149,7 @@ HOST_LIBGTK3_DEPENDENCIES = \
 	host-pkgconf
 
 HOST_LIBGTK3_CFLAGS = \
-	`$(HOST_DIR)/usr/bin/pkgconf --cflags --libs gdk-pixbuf-2.0`
+	`$(HOST_DIR)/bin/pkgconf --cflags --libs gdk-pixbuf-2.0`
 
 define HOST_LIBGTK3_CONFIGURE_CMDS
 	echo "#define GETTEXT_PACKAGE \"gtk30\"" >> $(@D)/gtk/config.h
@@ -170,9 +170,9 @@ endef
 
 define HOST_LIBGTK3_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/gtk/gtk-update-icon-cache \
-		$(HOST_DIR)/usr/bin/gtk-update-icon-cache
+		$(HOST_DIR)/bin/gtk-update-icon-cache
 	$(INSTALL) -D -m 0755 $(@D)/util/extract-strings \
-		$(HOST_DIR)/usr/bin/extract-strings
+		$(HOST_DIR)/bin/extract-strings
 endef
 
 $(eval $(autotools-package))
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 0e92b73..5579bf5 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -44,11 +44,11 @@ endif
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP),y)
 define LIBIIO_INSTALL_CSHARP_BINDINGS_TO_TARGET
 	rm $(TARGET_DIR)/usr/lib/cli/libiio-sharp-$(LIBIIO_VERSION)/libiio-sharp.dll.mdb
-	$(HOST_DIR)/usr/bin/gacutil -root $(TARGET_DIR)/usr/lib -i \
+	$(HOST_DIR)/bin/gacutil -root $(TARGET_DIR)/usr/lib -i \
 		$(TARGET_DIR)/usr/lib/cli/libiio-sharp-$(LIBIIO_VERSION)/libiio-sharp.dll
 endef
 define LIBIIO_INSTALL_CSHARP_BINDINGS_TO_STAGING
-	$(HOST_DIR)/usr/bin/gacutil -root $(STAGING_DIR)/usr/lib -i \
+	$(HOST_DIR)/bin/gacutil -root $(STAGING_DIR)/usr/lib -i \
 		$(STAGING_DIR)/usr/lib/cli/libiio-sharp-$(LIBIIO_VERSION)/libiio-sharp.dll
 endef
 LIBIIO_POST_INSTALL_TARGET_HOOKS += LIBIIO_INSTALL_CSHARP_BINDINGS_TO_TARGET
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index d4b96c4..6caa8a7 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -41,13 +41,13 @@ HOST_LIBSELINUX_DEPENDENCIES = \
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSELINUX_DEPENDENCIES += host-python3
-HOST_LIBSELINUX_PYTHONLIBDIR = -L$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
-HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m/
+HOST_LIBSELINUX_PYTHONLIBDIR = -L$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/
+HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)m/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
 else
 HOST_LIBSELINUX_DEPENDENCIES += host-python
-HOST_LIBSELINUX_PYTHONLIBDIR = -L$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/
-HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/
+HOST_LIBSELINUX_PYTHONLIBDIR = -L$(HOST_DIR)/lib/python$(PYTHON_VERSION_MAJOR)/
+HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/include/python$(PYTHON_VERSION_MAJOR)/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 endif
 
@@ -57,21 +57,21 @@ HOST_LIBSELINUX_MAKE_OPTS = \
 	PYINC="$(HOST_LIBSELINUX_PYINC)" \
 	PYTHONLIBDIR="$(HOST_LIBSELINUX_PYTHONLIBDIR)" \
 	PYLIBVER="$(HOST_LIBSELINUX_PYLIBVER)" \
-	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
 
 define HOST_LIBSELINUX_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
 	$(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
-		SHLIBDIR=$(HOST_DIR)/usr/lib all
+		SHLIBDIR=$(HOST_DIR)/lib all
 	# Generate python interface wrapper
 	$(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
 endef
 
 define HOST_LIBSELINUX_INSTALL_CMDS
 	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
-		SHLIBDIR=$(HOST_DIR)/usr/lib SBINDIR=$(HOST_DIR)/usr/sbin install
-	(cd $(HOST_DIR)/usr/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
+		SHLIBDIR=$(HOST_DIR)/lib SBINDIR=$(HOST_DIR)/sbin install
+	(cd $(HOST_DIR)/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
 	# Install python interface wrapper
 	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
 endef
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 197c14e..8cada0a 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -30,19 +30,19 @@ endef
 HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-libsepol host-libselinux \
 				host-ustr host-bzip2 host-swig
 HOST_LIBSEMANAGE_MAKE_OPTS += $(HOST_CONFIGURE_OPTS) \
-	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
 HOST_LIBSEMANAGE_MAKE_OPTS += \
-	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m/" \
-	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/" \
+	PYINC="-I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)m/" \
+	PYTHONLIBDIR="-L$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/" \
 	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
 else
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python
 HOST_LIBSEMANAGE_MAKE_OPTS += \
-	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
-	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
+	PYINC="-I$(HOST_DIR)/include/python$(PYTHON_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="-L$(HOST_DIR)/lib/python$(PYTHON_VERSION_MAJOR)/" \
 	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
 endif
 
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 1e709c6..ab7d677 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -37,8 +37,8 @@ endef
 
 define HOST_LIBSEPOL_INSTALL_CMDS
 	$(MAKE) -C $(@D) install $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR)
-	mv $(HOST_DIR)/lib/libsepol.so.1 $(HOST_DIR)/usr/lib
-	(cd $(HOST_DIR)/usr/lib; rm -f libsepol.so; ln -s libsepol.so.1 libsepol.so)
+	mv $(HOST_DIR)/lib/libsepol.so.1 $(HOST_DIR)/lib
+	(cd $(HOST_DIR)/lib; rm -f libsepol.so; ln -s libsepol.so.1 libsepol.so)
 	-rmdir $(HOST_DIR)/lib
 endef
 
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 54d0482..e578ea4 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -48,7 +48,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
 LIBSIGROK_CONF_OPTS += --enable-cxx
-LIBSIGROK_AUTORECONF_OPTS += -I $(HOST_DIR)/usr/share/autoconf-archive
+LIBSIGROK_AUTORECONF_OPTS += -I $(HOST_DIR)/share/autoconf-archive
 LIBSIGROK_DEPENDENCIES += \
 	host-autoconf-archive \
 	glibmm \
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index acd08d7..febd3fc 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -23,7 +23,7 @@ LIBSVGTINY_COMPONENT_TYPE = lib-static
 endif
 
 define LIBSVGTINY_CONFIGURE_CMDS
-	ln -sf $(HOST_DIR)/usr/share/netsurf-buildsystem $(@D)/build
+	ln -sf $(HOST_DIR)/share/netsurf-buildsystem $(@D)/build
 endef
 
 define LIBSVGTINY_BUILD_CMDS
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 8688f8b..7e46f51 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -40,5 +40,5 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # variables used by other packages
-LIBTOOL = $(HOST_DIR)/usr/bin/libtool
-LIBTOOLIZE = $(HOST_DIR)/usr/bin/libtoolize
+LIBTOOL = $(HOST_DIR)/bin/libtool
+LIBTOOLIZE = $(HOST_DIR)/bin/libtoolize
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 5c2ac54..e3defba 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -14,12 +14,12 @@ LIBXML_PARSER_PERL_RUN_PERL = `which perl`
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
 	(cd $(@D) ; \
 		$(HOST_CONFIGURE_OPTS) $(LIBXML_PARSER_PERL_RUN_PERL) Makefile.PL \
-			PREFIX=$(HOST_DIR)/usr \
-			EXPATLIBPATH=$(HOST_DIR)/usr/lib \
-			EXPATINCPATH=$(HOST_DIR)/usr/include \
+			PREFIX=$(HOST_DIR) \
+			EXPATLIBPATH=$(HOST_DIR)/lib \
+			EXPATINCPATH=$(HOST_DIR)/include \
 			INSTALLDIRS=site \
-			INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
-			INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
+			INSTALLSITELIB=$(HOST_DIR)/lib/perl \
+			INSTALLSITEARCH=$(HOST_DIR)/lib/perl \
 	)
 endef
 
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index e5832b2..e15bf83 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -45,4 +45,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # libxml2 for the host
-LIBXML2_HOST_BINARY = $(HOST_DIR)/usr/bin/xmllint
+LIBXML2_HOST_BINARY = $(HOST_DIR)/bin/xmllint
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 03a7095..cf48a5e 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -16,7 +16,7 @@ LIBXMLRPC_MAKE = $(MAKE1)
 
 # Using autoconf, not automake, so we cannot use AUTORECONF = YES.
 define LIBXMLRPC_RUN_AUTOCONF
-	cd $(@D); $(HOST_DIR)/usr/bin/autoconf
+	cd $(@D); $(HOST_DIR)/bin/autoconf
 endef
 
 LIBXMLRPC_PRE_CONFIGURE_HOOKS += LIBXMLRPC_RUN_AUTOCONF
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 1fe431a..11d9ba3 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -16,7 +16,7 @@ HOST_LOCALEDEF_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -fgnu89-inline"
 
 # The makefile does not implement an install target
 define HOST_LOCALEDEF_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/localedef $(HOST_DIR)/usr/bin/localedef
+	$(INSTALL) -D -m 0755 $(@D)/localedef $(HOST_DIR)/bin/localedef
 endef
 
 $(eval $(host-autotools-package))
diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index 042e364..a8d8cdc 100644
--- a/package/lpc3250loader/lpc3250loader.mk
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -11,7 +11,7 @@ LPC3250LOADER_LICENSE_FILES = LPC3250loader.py
 
 define HOST_LPC3250LOADER_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/LPC3250loader.py \
-		$(HOST_DIR)/usr/bin/LPC3250loader.py
+		$(HOST_DIR)/bin/LPC3250loader.py
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 0eaaa20..e3b301d 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	  transfer the binary trace output from the target to your
 	  development workstation, and use babeltrace here. Buildroot
 	  automatically builds a host babeltrace in
-	  $(O)/host/usr/bin/babeltrace as a dependency of the
+	  $(O)/host/bin/babeltrace as a dependency of the
 	  lttng-tools package.
 
 	  http://www.efficios.com/babeltrace
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 4c5b5f6..a3136d9 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	  and stop tracing sessions. Analysis of the trace can be done
 	  on the host machine using the babeltrace utility. This
 	  utility is automatically built by Buildroot in
-	  $(O)/host/usr/bin/babeltrace, as a dependency of
+	  $(O)/host/bin/babeltrace, as a dependency of
 	  lttng-tools. However, there is also a lttng-babeltrace
 	  package for the target, if babeltrace on the target is
 	  interesting.
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 1279b76..d95f454 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -97,9 +97,9 @@ define LUA_INSTALL_TARGET_CMDS
 endef
 
 define HOST_LUA_INSTALL_CMDS
-	$(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" -C $(@D) install
+	$(MAKE) INSTALL_TOP="$(HOST_DIR)" -C $(@D) install
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
-		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
+		$(HOST_DIR)/lib/pkgconfig/lua.pc
 endef
 
 $(eval $(generic-package))
diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index a6c98ab..9497a8b 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -9,4 +9,4 @@ LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 $(eval $(virtual-package))
 $(eval $(host-virtual-package))
 
-LUA_RUN = $(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
+LUA_RUN = $(HOST_DIR)/bin/$(call qstrip,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index ccbaaf7..af2d725 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -11,7 +11,7 @@ LUAROCKS_LICENSE_FILES = COPYING
 
 HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter
 
-LUAROCKS_CONFIG_DIR = $(HOST_DIR)/usr/etc/luarocks
+LUAROCKS_CONFIG_DIR = $(HOST_DIR)/etc/luarocks
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
 LUAROCKS_CFLAGS = $(TARGET_CFLAGS) -fPIC
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
@@ -19,9 +19,9 @@ LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
 endif
 
 HOST_LUAROCKS_CONF_OPTS = \
-	--prefix=$(HOST_DIR)/usr \
+	--prefix=$(HOST_DIR) \
 	--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
-	--with-lua=$(HOST_DIR)/usr
+	--with-lua=$(HOST_DIR)
 
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 HOST_LUAROCKS_CONF_OPTS += --lua-suffix=jit
@@ -34,7 +34,7 @@ endef
 define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE)
 	$(MAKE1) -C $(@D) install \
-		PREFIX=$(HOST_DIR)/usr
+		PREFIX=$(HOST_DIR)
 	echo "-- BR cross-compilation"                          >> $(LUAROCKS_CONFIG_FILE)
 	echo "variables = {"                                    >> $(LUAROCKS_CONFIG_FILE)
 	echo "   LUA_INCDIR = [[$(STAGING_DIR)/usr/include]],"  >> $(LUAROCKS_CONFIG_FILE)
@@ -53,8 +53,8 @@ endef
 
 $(eval $(host-generic-package))
 
-LUAROCKS_RUN_ENV = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua"
-LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
+LUAROCKS_RUN_ENV = LUA_PATH="$(HOST_DIR)/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua"
+LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/bin/luarocks
 
 define LUAROCKS_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 90f0771..1b4d7fe 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -10,4 +10,4 @@ LZMA_SITE = http://tukaani.org/lzma
 
 $(eval $(host-autotools-package))
 
-LZMA = $(HOST_DIR)/usr/bin/lzma
+LZMA = $(HOST_DIR)/bin/lzma
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 1b6a7e1..e8bcb5d 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -13,4 +13,4 @@ LZOP_DEPENDENCIES = lzo
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-LZOP = $(HOST_DIR)/usr/bin/lzop
+LZOP = $(HOST_DIR)/bin/lzop
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index fa8e753..636d1b4 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -26,7 +26,7 @@ define HOST_MAKEDEVS_BUILD_CMDS
 endef
 
 define HOST_MAKEDEVS_INSTALL_CMDS
-	$(INSTALL) -D -m 755 $(@D)/makedevs $(HOST_DIR)/usr/bin/makedevs
+	$(INSTALL) -D -m 755 $(@D)/makedevs $(HOST_DIR)/bin/makedevs
 endef
 
 $(eval $(generic-package))
diff --git a/package/mke2img/mke2img.mk b/package/mke2img/mke2img.mk
index 04aaa8f..be0cb08 100644
--- a/package/mke2img/mke2img.mk
+++ b/package/mke2img/mke2img.mk
@@ -8,7 +8,7 @@ HOST_MKE2IMG_SOURCE =
 HOST_MKE2IMG_DEPENDENCIES = host-genext2fs host-e2fsprogs
 
 define HOST_MKE2IMG_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 package/mke2img/mke2img $(HOST_DIR)/usr/bin/mke2img
+	$(INSTALL) -D -m 0755 package/mke2img/mke2img $(HOST_DIR)/bin/mke2img
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/mkpasswd/mkpasswd.mk b/package/mkpasswd/mkpasswd.mk
index 0447ecc..f9a3c5a 100644
--- a/package/mkpasswd/mkpasswd.mk
+++ b/package/mkpasswd/mkpasswd.mk
@@ -19,9 +19,9 @@ define HOST_MKPASSWD_BUILD_CMDS
 endef
 
 define HOST_MKPASSWD_INSTALL_CMDS
-	$(INSTALL) -D -m 755 $(@D)/mkpasswd $(HOST_DIR)/usr/bin/mkpasswd
+	$(INSTALL) -D -m 755 $(@D)/mkpasswd $(HOST_DIR)/bin/mkpasswd
 endef
 
 $(eval $(host-generic-package))
 
-MKPASSWD = $(HOST_DIR)/usr/bin/mkpasswd
+MKPASSWD = $(HOST_DIR)/bin/mkpasswd
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 5889436..d5a274f 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -19,7 +19,7 @@ MOARVM_CONF_OPTS = \
 	--cc="$(TARGET_CC)" \
 	--ld="$(TARGET_CC)" \
 	--prefix="/usr" \
-	--lua=$(HOST_DIR)/usr/bin/luajit \
+	--lua=$(HOST_DIR)/bin/luajit \
 	--has-libuv \
 	--has-libatomic
 
diff --git a/package/mono-gtksharp3/mono-gtksharp3.mk b/package/mono-gtksharp3/mono-gtksharp3.mk
index cccfcde..ffc84c5 100644
--- a/package/mono-gtksharp3/mono-gtksharp3.mk
+++ b/package/mono-gtksharp3/mono-gtksharp3.mk
@@ -12,6 +12,6 @@ MONO_GTKSHARP3_LICENSE = LGPLv2, MIT (cairo)
 MONO_GTKSHARP3_LICENSE_FILES = COPYING
 MONO_GTKSHARP3_INSTALL_STAGING = YES
 MONO_GTKSHARP3_DEPENDENCIES = mono libgtk3
-MONO_GTKSHARP3_CONF_OPTS += CSC=$(HOST_DIR)/usr/bin/mcs
+MONO_GTKSHARP3_CONF_OPTS += CSC=$(HOST_DIR)/bin/mcs
 
 $(eval $(autotools-package))
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 8668aa0..3cfe051 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -30,7 +30,7 @@ MONO_CONF_OPTS = --disable-gtk-doc \
 # architecture-independent, we simply copy them to the target.
 define MONO_INSTALL_LIBS
 	rsync -av --exclude=*.so --exclude=*.mdb \
-		$(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
+		$(HOST_DIR)/lib/mono $(TARGET_DIR)/usr/lib/
 	rsync -av $(HOST_DIR)/etc/mono $(TARGET_DIR)/etc
 endef
 
@@ -59,7 +59,7 @@ HOST_MONO_DEPENDENCIES = host-monolite host-gettext
 
 define HOST_MONO_SETUP_MONOLITE
 	rm -rf $(@D)/mcs/class/lib/monolite
-	(cd $(@D)/mcs/class/lib; ln -s $(HOST_DIR)/usr/lib/monolite monolite)
+	(cd $(@D)/mcs/class/lib; ln -s $(HOST_DIR)/lib/monolite monolite)
 endef
 
 HOST_MONO_POST_CONFIGURE_HOOKS += HOST_MONO_SETUP_MONOLITE
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index aa6c28c..c770a24 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -10,8 +10,8 @@ MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPLv2 or commercial
 
 define HOST_MONOLITE_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/usr/lib/monolite
-	cp $(@D)/* $(HOST_DIR)/usr/lib/monolite
+	mkdir -p $(HOST_DIR)/lib/monolite
+	cp $(@D)/* $(HOST_DIR)/lib/monolite
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index adbf28d..30fb423 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -49,8 +49,8 @@ define HOST_MTD_INSTALL_CMDS
 	$(MAKE1) BUILDDIR=$(@D) DESTDIR=$(HOST_DIR) -C $(@D) install
 endef
 
-MKFS_JFFS2 = $(HOST_DIR)/usr/sbin/mkfs.jffs2
-SUMTOOL = $(HOST_DIR)/usr/sbin/sumtool
+MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2
+SUMTOOL = $(HOST_DIR)/sbin/sumtool
 
 MTD_STAGING_y = lib/libmtd.a ubi-utils/libubi.a
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index c6d9f3a..5edfc67 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -85,7 +85,7 @@ define HOST_MYSQL_BUILD_CMDS
 endef
 
 define HOST_MYSQL_INSTALL_CMDS
-	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
+	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/bin/
 endef
 
 define MYSQL_USERS
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 28b03b8..756d614 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -18,7 +18,7 @@ NCFTP_DEPENDENCIES = host-autoconf
 # We need to pass -I because of the non-standard m4 directory name, and
 # none of the other autotools are used, so the below is the easiest.
 define NCFTP_RUN_AUTOCONF
-	(cd $(@D); $(HOST_DIR)/usr/bin/autoconf -I$(@D)/autoconf_local/)
+	(cd $(@D); $(HOST_DIR)/bin/autoconf -I$(@D)/autoconf_local/)
 endef
 NCFTP_PRE_CONFIGURE_HOOKS += NCFTP_RUN_AUTOCONF
 
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.mk b/package/netsurf-buildsystem/netsurf-buildsystem.mk
index 3478850..aeb7cb6 100644
--- a/package/netsurf-buildsystem/netsurf-buildsystem.mk
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.mk
@@ -10,7 +10,7 @@ NETSURF_BUILDSYSTEM_SITE_METHOD = git
 NETSURF_BUILDSYSTEM_LICENSE = MIT, BSD-3c (for llvm/* files)
 NETSURF_BUILDSYSTEM_LICENSE_FILES = llvm/LICENSE.TXT
 
-NETSURF_BUILDSYSTEM_INSTALL_DIR = $(HOST_DIR)/usr/share/netsurf-buildsystem
+NETSURF_BUILDSYSTEM_INSTALL_DIR = $(HOST_DIR)/share/netsurf-buildsystem
 
 define HOST_NETSURF_BUILDSYSTEM_INSTALL_CMDS
 	mkdir -p $(NETSURF_BUILDSYSTEM_INSTALL_DIR)
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 414f3f3..79b7d95 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -26,9 +26,9 @@ define HOST_NODEJS_CONFIGURE_CMDS
 	# buildroot.
 	(cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
-		PYTHON=$(HOST_DIR)/usr/bin/python2 \
-		$(HOST_DIR)/usr/bin/python2 ./configure \
-		--prefix=$(HOST_DIR)/usr \
+		PYTHON=$(HOST_DIR)/bin/python2 \
+		$(HOST_DIR)/bin/python2 ./configure \
+		--prefix=$(HOST_DIR) \
 		--without-snapshot \
 		--without-dtrace \
 		--without-etw \
@@ -37,13 +37,13 @@ define HOST_NODEJS_CONFIGURE_CMDS
 endef
 
 define HOST_NODEJS_BUILD_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS)
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_CONFIGURE_OPTS)
 endef
@@ -64,8 +64,8 @@ define NODEJS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
 		LD="$(TARGET_CXX)" \
-		PYTHON=$(HOST_DIR)/usr/bin/python2 \
-		$(HOST_DIR)/usr/bin/python2 ./configure \
+		PYTHON=$(HOST_DIR)/bin/python2 \
+		$(HOST_DIR)/bin/python2 ./configure \
 		--prefix=/usr \
 		--without-snapshot \
 		--shared-zlib \
@@ -80,7 +80,7 @@ define NODEJS_CONFIGURE_CMDS
 endef
 
 define NODEJS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(TARGET_CONFIGURE_OPTS) \
 		LD="$(TARGET_CXX)"
@@ -102,7 +102,7 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
 	npm_config_target_arch=$(NODEJS_CPU) \
 	npm_config_build_from_source=true \
 	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
-	$(HOST_DIR)/usr/bin/npm
+	$(HOST_DIR)/bin/npm
 
 #
 # We can only call NPM if there's something to install.
@@ -127,7 +127,7 @@ endef
 endif
 
 define NODEJS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(TARGET_DIR) \
 		$(TARGET_CONFIGURE_OPTS) \
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 9598de9..7c389c2 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -23,7 +23,7 @@ OLA_CONF_OPTS = \
 	--disable-root-check \
 	--disable-java-libs \
 	--disable-fatal-warnings \
-	--with-ola-protoc-plugin=$(HOST_DIR)/usr/bin/ola_protoc_plugin
+	--with-ola-protoc-plugin=$(HOST_DIR)/bin/ola_protoc_plugin
 
 HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf
 
@@ -46,7 +46,7 @@ HOST_OLA_CONF_OPTS = \
 # only.
 HOST_OLA_MAKE_OPTS = protoc/ola_protoc_plugin
 define HOST_OLA_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/protoc/ola_protoc_plugin $(HOST_DIR)/usr/bin/ola_protoc_plugin
+	$(INSTALL) -D -m 0755 $(@D)/protoc/ola_protoc_plugin $(HOST_DIR)/bin/ola_protoc_plugin
 endef
 
 # sets where to find python libs built for target and required by ola
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index 7cfed65..a738cf6 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -15,7 +15,7 @@ endef
 
 define HOST_OMAP_U_BOOT_UTILS_INSTALL_CMDS
 	for f in gpsign pserial tagger ucmd ukermit ; do \
-		$(INSTALL) -D -m 755 $(@D)/$$f $(HOST_DIR)/usr/bin/$$f ; \
+		$(INSTALL) -D -m 755 $(@D)/$$f $(HOST_DIR)/bin/$$f ; \
 	done
 endef
 
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index bf5ba47..d5161ca 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -17,8 +17,8 @@ HOST_OMNIORB_DEPENDENCIES = host-python
 OMNIORB_AUTORECONF = YES
 
 # omniorb is not python3 friendly, so force the python interpreter
-OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
-HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
+OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
+HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
 
 # Defaulting long double support to a safe option for the
 # mix of embedded targets, this could later be automated
@@ -57,7 +57,7 @@ endif
 # cross compiled target OMNIORB application.
 define OMNIORB_ADJUST_TOOLDIR
 	# Point to the host folder to get HOST_OMNIORB tools
-	$(SED) 's:TOOLBINDIR = $$(TOP)/$$(BINDIR):TOOLBINDIR = $(HOST_DIR)/usr/bin:g' $(@D)/mk/beforeauto.mk
+	$(SED) 's:TOOLBINDIR = $$(TOP)/$$(BINDIR):TOOLBINDIR = $(HOST_DIR)/bin:g' $(@D)/mk/beforeauto.mk
 	# Disables OMNIORB app/service/tool building
 	echo "EmbeddedSystem=1" >> $(@D)/mk/beforeauto.mk
 endef
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 3ce78b5..0701227 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -315,7 +315,7 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_python2=ON \
 	-DBUILD_opencv_python3=OFF \
-	-DPYTHON2_EXECUTABLE=$(HOST_DIR)/usr/bin/python2 \
+	-DPYTHON2_EXECUTABLE=$(HOST_DIR)/bin/python2 \
 	-DPYTHON2_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
 	-DPYTHON2_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so \
 	-DPYTHON2_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy/core/include \
@@ -326,7 +326,7 @@ else
 OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_python2=OFF \
 	-DBUILD_opencv_python3=ON \
-	-DPYTHON3_EXECUTABLE=$(HOST_DIR)/usr/bin/python3 \
+	-DPYTHON3_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DPYTHON3_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m \
 	-DPYTHON3_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR)m.so \
 	-DPYTHON3_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include \
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 3b76850..aa43f12 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -89,8 +89,8 @@ HOST_OPENOCD_CONF_OPTS = \
 	--enable-openjtag_ftdi \
 	--enable-buspirate \
 	--enable-sysfsgpio \
-	--oldincludedir=$(HOST_DIR)/usr/include \
-	--includedir=$(HOST_DIR)/usr/include \
+	--oldincludedir=$(HOST_DIR)/include \
+	--includedir=$(HOST_DIR)/include \
 	--disable-doxygen-html \
 	--with-jim-shared=no \
 	--disable-shared \
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index cad8d0c..9558f8c 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -59,7 +59,7 @@ define HOST_OPENSSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		./config \
-		--prefix=$(HOST_DIR)/usr \
+		--prefix=$(HOST_DIR) \
 		--openssldir=$(HOST_DIR)/etc/ssl \
 		--libdir=/lib \
 		shared \
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 7192700..c354067 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -96,7 +96,7 @@ HOST_PERL_DEPENDENCIES =
 
 HOST_PERL_CONF_OPTS = \
 	-des \
-	-Dprefix="$(HOST_DIR)/usr" \
+	-Dprefix="$(HOST_DIR)" \
 	-Dcc="$(HOSTCC)"
 
 define HOST_PERL_CONFIGURE_CMDS
diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
index 0826c19..cdf24f6 100644
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -17,8 +17,8 @@ PHP_GEOIP_LICENSE_FILES = LICENSE
 
 define PHP_GEOIP_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index c5964c2..1cd2079 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -16,8 +16,8 @@ PHP_GNUPG_LICENSE_FILES = LICENSE
 
 define PHP_GNUPG_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index 1cd4a48..600c312 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -17,8 +17,8 @@ PHP_IMAGICK_LICENSE_FILES = LICENSE
 
 define PHP_IMAGICK_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index 599e22e..67bef87 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -19,8 +19,8 @@ PHP_MEMCACHED_LICENSE_FILES = LICENSE
 
 define PHP_MEMCACHED_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index ace68e0..1b3b9fc 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -17,8 +17,8 @@ PHP_SSH2_LICENSE_FILES = LICENSE
 
 define PHP_SSH2_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index b6f259d..e2b04dc 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -17,8 +17,8 @@ PHP_YAML_LICENSE_FILES = LICENSE
 
 define PHP_YAML_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-zmq/php-zmq.mk b/package/php-zmq/php-zmq.mk
index 88c962d..bfb1e36 100644
--- a/package/php-zmq/php-zmq.mk
+++ b/package/php-zmq/php-zmq.mk
@@ -16,8 +16,8 @@ PHP_ZMQ_LICENSE_FILES = LICENSE
 
 define PHP_ZMQ_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index d3e6b7a..a407770 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -39,7 +39,7 @@ endif
 ifeq ($(BR2_PACKAGE_PINENTRY_QT4),y)
 # -pthread needs to be passed for certain toolchains
 # http://autobuild.buildroot.net/results/6be/6be109ccedec603a67cebdb31b55865dcce0e128/
-PINENTRY_CONF_OPTS += LIBS=-pthread MOC=$(HOST_DIR)/usr/bin/moc
+PINENTRY_CONF_OPTS += LIBS=-pthread MOC=$(HOST_DIR)/bin/moc
 PINENTRY_CONF_OPTS += --enable-pinentry-qt4
 PINENTRY_DEPENDENCIES += qt
 else
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 4787914..f53a654 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -220,7 +220,7 @@ define $(2)_CONFIGURE_CMDS
 		$$($$(PKG)_CONF_ENV) \
 		CONFIG_SITE=/dev/null \
 		./configure \
-		--prefix="$$(HOST_DIR)/usr" \
+		--prefix="$$(HOST_DIR)" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
 		--localstatedir="$$(HOST_DIR)/var" \
 		--enable-shared --disable-static \
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 81dcfcc..afd8e4f 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -22,8 +22,8 @@
 
 # Set compiler variables.
 ifeq ($(BR2_CCACHE),y)
-CMAKE_HOST_C_COMPILER = $(HOST_DIR)/usr/bin/ccache
-CMAKE_HOST_CXX_COMPILER = $(HOST_DIR)/usr/bin/ccache
+CMAKE_HOST_C_COMPILER = $(HOST_DIR)/bin/ccache
+CMAKE_HOST_CXX_COMPILER = $(HOST_DIR)/bin/ccache
 CMAKE_HOST_C_COMPILER_ARG1 = $(HOSTCC_NOCCACHE)
 CMAKE_HOST_CXX_COMPILER_ARG1 = $(HOSTCXX_NOCCACHE)
 else
@@ -85,8 +85,8 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
-		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
+	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/bin/cmake $$($$(PKG)_SRCDIR) \
+		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
@@ -110,13 +110,13 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+	$$(HOST_DIR)/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
-		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
+		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)" \
 		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
 		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
 		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
@@ -234,10 +234,10 @@ CMAKE_SYSTEM_PROCESSOR = $(BR2_ARCH)
 endif
 
 # In order to allow the toolchain to be relocated, we calculate the HOST_DIR
-# based on the toolchainfile.cmake file's location: $(HOST_DIR)/usr/share/buildroot
+# based on the toolchainfile.cmake file's location: $(HOST_DIR)/share/buildroot
 # In all the other variables, HOST_DIR will be replaced by RELOCATED_HOST_DIR,
 # so we have to strip "$(HOST_DIR)/" from the paths that contain it.
-$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
+$(HOST_DIR)/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
 	sed \
 		-e 's#@@STAGING_SUBDIR@@#$(call qstrip,$(STAGING_SUBDIR))#' \
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index a06c068..8eca9cc 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -20,7 +20,7 @@
 ################################################################################
 
 PERL_ARCHNAME = $(ARCH)-linux
-PERL_RUN = PERL5LIB= $(HOST_DIR)/usr/bin/perl
+PERL_RUN = PERL5LIB= $(HOST_DIR)/bin/perl
 
 ################################################################################
 # inner-perl-package -- defines how the configuration, compilation and
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b7a702d..e0c5c68 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -46,7 +46,7 @@ HOST_PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH)
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
-	--prefix=$(HOST_DIR)/usr
+	--prefix=$(HOST_DIR)
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
@@ -73,7 +73,7 @@ HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH=$(BR_PATH)
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
-	--prefix=$(HOST_DIR)/usr
+	--prefix=$(HOST_DIR)
 
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
@@ -209,12 +209,12 @@ endif
 #   - otherwise, we use the one requested by *_NEEDS_HOST_PYTHON.
 #
 ifeq ($(4),target)
-$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/python
+$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
 else
 ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
-$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/python
+$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
 else
-$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/$$($(2)_NEEDS_HOST_PYTHON)
+$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/$$($(2)_NEEDS_HOST_PYTHON)
 endif
 endif
 
diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index c727489..68c2da7 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -25,14 +25,14 @@
 # infrastructure tells rebar to NOT download dependencies during
 # the build stage.
 #
-REBAR_HOST_DEPS_DIR = $(HOST_DIR)/usr/share/rebar/deps
+REBAR_HOST_DEPS_DIR = $(HOST_DIR)/share/rebar/deps
 REBAR_TARGET_DEPS_DIR = $(STAGING_DIR)/usr/share/rebar/deps
 
 # Tell rebar where to find the dependencies
 #
 REBAR_HOST_DEPS_ENV = \
 	ERL_COMPILER_OPTIONS='{i, "$(REBAR_HOST_DEPS_DIR)"}' \
-	ERL_EI_LIBDIR=$(HOST_DIR)/usr/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
+	ERL_EI_LIBDIR=$(HOST_DIR)/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
 REBAR_TARGET_DEPS_ENV = \
 	ERL_COMPILER_OPTIONS='{i, "$(REBAR_TARGET_DEPS_DIR)"}' \
 	ERL_EI_LIBDIR=$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index c8b0cba..cc190d2 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -10,7 +10,7 @@ PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
 
-PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config
+PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/pkg-config
 
 define PKGCONF_LINK_PKGCONFIG
 	ln -sf pkgconf $(TARGET_DIR)/usr/bin/pkg-config
@@ -18,18 +18,18 @@ endef
 
 define HOST_PKGCONF_INSTALL_WRAPPER
 	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
-		$(HOST_DIR)/usr/bin/pkg-config
+		$(HOST_DIR)/bin/pkg-config
 	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
 		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
-		$(HOST_DIR)/usr/bin/pkg-config
+		$(HOST_DIR)/bin/pkg-config
 endef
 
 define HOST_PKGCONF_STATIC
-	$(SED) 's, at STATIC@,--static,' $(HOST_DIR)/usr/bin/pkg-config
+	$(SED) 's, at STATIC@,--static,' $(HOST_DIR)/bin/pkg-config
 endef
 
 define HOST_PKGCONF_SHARED
-	$(SED) 's, at STATIC@,,' $(HOST_DIR)/usr/bin/pkg-config
+	$(SED) 's, at STATIC@,,' $(HOST_DIR)/bin/pkg-config
 endef
 
 PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 0426fce..5bcf45d 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -13,7 +13,7 @@ PROTOBUF_AUTORECONF = YES
 
 # N.B. Need to use host protoc during cross compilation.
 PROTOBUF_DEPENDENCIES = host-protobuf
-PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/usr/bin/protoc
+PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/bin/protoc
 
 PROTOBUF_INSTALL_STAGING = YES
 
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 5bc6ec7..42d844b 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -33,7 +33,7 @@ PULSEAUDIO_DEPENDENCIES = \
 
 ifeq ($(BR2_PACKAGE_ORC),y)
 PULSEAUDIO_DEPENDENCIES += orc
-PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/usr/bin/orcc
+PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/bin/orcc
 PULSEAUDIO_CONF_OPTS += --enable-orc
 else
 PULSEAUDIO_CONF_OPTS += --disable-orc
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 74cb054..b426364 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -19,13 +19,13 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON_GOBJECT_DEPENDENCIES += python host-python
 
 PYTHON_GOBJECT_CONF_ENV = \
-	PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	PYTHON=$(HOST_DIR)/bin/python2 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`"
 else
 PYTHON_GOBJECT_DEPENDENCIES += python3 host-python3
 
 PYTHON_GOBJECT_CONF_ENV = \
-	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`"
 endif
 
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 7e46f1d..9d97333 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -19,8 +19,8 @@ HOST_PYTHON_M2CRYPTO_NEEDS_HOST_PYTHON = python2
 define HOST_PYTHON_M2CRYPTO_BUILD_CMDS
 	(cd $(@D); \
 		$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
-		$(HOST_DIR)/usr/bin/python2 setup.py build_ext \
-			--openssl=$(HOST_DIR)/usr)
+		$(HOST_DIR)/bin/python2 setup.py build_ext \
+			--openssl=$(HOST_DIR))
 endef
 
 $(eval $(host-python-package))
diff --git a/package/python-pypcap/python-pypcap.mk b/package/python-pypcap/python-pypcap.mk
index bff9d8f..e601fe9 100644
--- a/package/python-pypcap/python-pypcap.mk
+++ b/package/python-pypcap/python-pypcap.mk
@@ -12,9 +12,9 @@ PYTHON_PYPCAP_SETUP_TYPE = distutils
 PYTHON_PYPCAP_DEPENDENCIES = host-python-pyrex libpcap
 
 define PYTHON_PYPCAP_CONFIGURE_CMDS
-	$(HOST_DIR)/usr/bin/pyrexc $(@D)/pcap.pyx
+	$(HOST_DIR)/bin/pyrexc $(@D)/pcap.pyx
 	(cd $(@D); \
-		$(HOST_DIR)/usr/bin/python setup.py \
+		$(HOST_DIR)/bin/python setup.py \
 		config --with-pcap=$(STAGING_DIR)/usr)
 endef
 
diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index fa298c4..a04a9b5 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -72,7 +72,7 @@ endef
 PYTHON_PYQT_CONF_OPTS = \
 	--bindir $(TARGET_DIR)/usr/bin \
 	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages \
-	--qmake $(HOST_DIR)/usr/bin/qmake \
+	--qmake $(HOST_DIR)/bin/qmake \
 	--sysroot $(STAGING_DIR)/usr \
 	-w --confirm-license \
 	--no-designer-plugin \
@@ -93,7 +93,7 @@ define PYTHON_PYQT_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		$(TARGET_CONFIGURE_OPTS) \
-		$(HOST_DIR)/usr/bin/python configure-ng.py \
+		$(HOST_DIR)/bin/python configure-ng.py \
 			$(PYTHON_PYQT_CONF_OPTS) \
 	)
 endef
@@ -109,7 +109,7 @@ define PYTHON_PYQT_INSTALL_TARGET_CMDS
 	touch $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4/__init__.py
 	$(RM) -rf $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4/uic/$(PYTHON_PYQT_RM_PORT_BASE)
 	PYTHONPATH="$(PYTHON_PATH)" \
-		$(HOST_DIR)/usr/bin/python -c "import compileall; \
+		$(HOST_DIR)/bin/python -c "import compileall; \
 		compileall.compile_dir('$(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4')"
 endef
 
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 4651186..d7162a3 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -26,7 +26,7 @@ endif
 
 define HOST_PYTHON_SIP_CONFIGURE_CMDS
 	(cd $(@D); \
-		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py)
+		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(HOST_DIR)/bin/python configure.py)
 endef
 
 define HOST_PYTHON_SIP_BUILD_CMDS
@@ -39,14 +39,14 @@ endef
 
 define PYTHON_SIP_CONFIGURE_CMDS
 	(cd $(@D); \
-		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py \
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/bin/python configure.py \
 			--bindir $(TARGET_DIR)/usr/bin \
 			--destdir $(TARGET_DIR)/$(PYTHON_SIP_LIB_DIR) \
 			--incdir $(STAGING_DIR)/$(PYTHON_SIP_INCLUDE_DIR)  \
 			--sipdir $(TARGET_DIR)/usr/share/sip \
 			--sysroot $(STAGING_DIR)/usr \
 			--use-qmake && \
-		$(HOST_DIR)/usr/bin/qmake)
+		$(HOST_DIR)/bin/qmake)
 endef
 
 define PYTHON_SIP_BUILD_CMDS
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 313114a..2385e6d 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -11,7 +11,7 @@ PYTHON_WEB2PY_LICENSE_FILES = LICENSE
 PYTHON_WEB2PY_DEPENDENCIES = python python-pydal host-python-pydal
 
 define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
-	$(HOST_DIR)/usr/bin/python2 -c 'import os; \
+	$(HOST_DIR)/bin/python2 -c 'import os; \
 		os.chdir("$(@D)"); \
 		from gluon.main import save_password; \
 		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
diff --git a/package/python/python.mk b/package/python/python.mk
index 80ffbde..9f6712d 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -204,8 +204,8 @@ PYTHON_AUTORECONF = YES
 # for the target, otherwise the default python program may be missing.
 ifneq ($(BR2_PACKAGE_PYTHON3),y)
 define HOST_PYTHON_INSTALL_PYTHON_SYMLINK
-	ln -sf python2 $(HOST_DIR)/usr/bin/python
-	ln -sf python2-config $(HOST_DIR)/usr/bin/python-config
+	ln -sf python2 $(HOST_DIR)/bin/python
+	ln -sf python2-config $(HOST_DIR)/bin/python-config
 endef
 
 HOST_PYTHON_POST_INSTALL_HOOKS += HOST_PYTHON_INSTALL_PYTHON_SYMLINK
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index fd5709a..1e08cfb 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -195,8 +195,8 @@ endif
 # for the target.
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define HOST_PYTHON3_INSTALL_SYMLINK
-	ln -fs python3 $(HOST_DIR)/usr/bin/python
-	ln -fs python3-config $(HOST_DIR)/usr/bin/python-config
+	ln -fs python3 $(HOST_DIR)/bin/python
+	ln -fs python3-config $(HOST_DIR)/bin/python-config
 endef
 
 HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 94e1bcf..c7091b4 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -95,11 +95,11 @@ endif
 define HOST_QEMU_CONFIGURE_CMDS
 	cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure    \
 		--target-list="$(HOST_QEMU_TARGETS)"    \
-		--prefix="$(HOST_DIR)/usr"              \
+		--prefix="$(HOST_DIR)"              \
 		--interp-prefix=$(STAGING_DIR)          \
 		--cc="$(HOSTCC)"                        \
 		--host-cc="$(HOSTCC)"                   \
-		--python=$(HOST_DIR)/usr/bin/python2    \
+		--python=$(HOST_DIR)/bin/python2    \
 		--extra-cflags="$(HOST_CFLAGS)"         \
 		--extra-ldflags="$(HOST_LDFLAGS)"
 endef
@@ -115,7 +115,7 @@ endef
 $(eval $(host-generic-package))
 
 # variable used by other packages
-QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)
+QEMU_USER = $(HOST_DIR)/bin/qemu-$(HOST_QEMU_ARCH)
 
 #-------------------------------------------------------------
 # Target-qemu
@@ -129,8 +129,8 @@ QEMU_LIBS = -lrt -lm
 QEMU_OPTS =
 
 QEMU_VARS = \
-	LIBTOOL=$(HOST_DIR)/usr/bin/libtool \
-	PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	LIBTOOL=$(HOST_DIR)/bin/libtool \
+	PYTHON=$(HOST_DIR)/bin/python2 \
 	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
 # If we want to specify only a subset of targets, we must still enable all
diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index 2e8c1d0..c501e48 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -26,7 +26,7 @@ QPID_PROTON_CONF_OPTS = \
 	-DBUILD_RUBY=OFF \
 	-DENABLE_VALGRIND=OFF \
 	-DENABLE_WARNING_ERROR=OFF \
-	-DPYTHON_EXECUTABLE=$(HOST_DIR)/usr/bin/python2
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python2
 
 define QPID_PROTON_REMOVE_USELESS_FILES
 	rm -fr $(TARGET_DIR)/usr/share/proton-*/
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a64d32f..12f6001 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -461,7 +461,7 @@ endif
 # End of workaround.
 
 # Variable for other Qt applications to use
-QT_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
+QT_QMAKE = $(HOST_DIR)/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set <variable> = <value> in
@@ -502,7 +502,7 @@ define QT_CONFIGURE_CMDS
 	$(call QT_QMAKE_SET,QMAKE_CFLAGS,$(QT_CFLAGS),$(@D))
 	$(call QT_QMAKE_SET,QMAKE_CXXFLAGS,$(QT_CXXFLAGS),$(@D))
 	$(call QT_QMAKE_SET,QMAKE_LFLAGS,$(QT_LDFLAGS),$(@D))
-	$(call QT_QMAKE_SET,PKG_CONFIG,$(HOST_DIR)/usr/bin/pkg-config,$(@D))
+	$(call QT_QMAKE_SET,PKG_CONFIG,$(HOST_DIR)/bin/pkg-config,$(@D))
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
 # instead of the host then. So set PKG_CONFIG* manually.
 	(cd $(@D); \
@@ -592,7 +592,7 @@ ifeq ($(BR2_PACKAGE_QT_TEST),y)
 QT_INSTALL_LIBS += QtTest
 endif
 
-QT_CONF_FILE = $(HOST_DIR)/usr/bin/qt.conf
+QT_CONF_FILE = $(HOST_DIR)/bin/qt.conf
 
 # Since host programs and spec files have been moved to $(HOST_DIR),
 # we need to tell qmake the new location of the various elements,
@@ -600,11 +600,11 @@ QT_CONF_FILE = $(HOST_DIR)/usr/bin/qt.conf
 define QT_INSTALL_QT_CONF
 	mkdir -p $(dir $(QT_CONF_FILE))
 	echo "[Paths]"                             > $(QT_CONF_FILE)
-	echo "Prefix=$(HOST_DIR)/usr"             >> $(QT_CONF_FILE)
+	echo "Prefix=$(HOST_DIR)"             >> $(QT_CONF_FILE)
 	echo "Headers=$(STAGING_DIR)/usr/include" >> $(QT_CONF_FILE)
 	echo "Libraries=$(STAGING_DIR)/usr/lib"   >> $(QT_CONF_FILE)
-	echo "Data=$(HOST_DIR)/usr"               >> $(QT_CONF_FILE)
-	echo "Binaries=$(HOST_DIR)/usr/bin"       >> $(QT_CONF_FILE)
+	echo "Data=$(HOST_DIR)"               >> $(QT_CONF_FILE)
+	echo "Binaries=$(HOST_DIR)/bin"       >> $(QT_CONF_FILE)
 endef
 
 # After running Qt normal installation process (which installs
@@ -616,12 +616,12 @@ endef
 # automatically.
 define QT_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D) install
-	mkdir -p $(HOST_DIR)/usr/bin
-	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
-	ln -sf $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr/mkspecs
+	mkdir -p $(HOST_DIR)/bin
+	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/bin
+	ln -sf $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/mkspecs
 	$(QT_INSTALL_QT_CONF)
 	for i in moc uic rcc lupdate lrelease ; do \
-		$(SED) "s,^$${i}_location=.*,$${i}_location=$(HOST_DIR)/usr/bin/$${i}," \
+		$(SED) "s,^$${i}_location=.*,$${i}_location=$(HOST_DIR)/bin/$${i}," \
 			$(STAGING_DIR)/usr/lib/pkgconfig/Qt*.pc ; \
 	done
 	$(SED) "s,$(STAGING_DIR)/,,g" $(STAGING_DIR)/usr/lib/pkgconfig/Qt*.pc
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index d7f38ac..db79bd7 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -19,4 +19,4 @@ define QT5_LA_PRL_FILES_FIXUP
 endef
 
 # Variable for other Qt applications to use
-QT5_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec devices/linux-buildroot-g++
+QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 570cd35..a8d15f1 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -180,7 +180,7 @@ define QT5BASE_CONFIGURE_CMDS
 		./configure \
 		-v \
 		-prefix /usr \
-		-hostprefix $(HOST_DIR)/usr \
+		-hostprefix $(HOST_DIR) \
 		-headerdir /usr/include/qt5 \
 		-sysroot $(STAGING_DIR) \
 		-plugindir /usr/lib/qt/plugins \
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index fa07d93..7c1bd45 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -23,7 +23,7 @@ QT5CONNECTIVITY_DEPENDENCIES += qt5declarative
 endif
 
 define QT5CONNECTIVITY_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5CONNECTIVITY_BUILD_CMDS
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 296292b..0b0c529 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -19,7 +19,7 @@ QT5DECLARATIVE_REDISTRIBUTE = NO
 endif
 
 define QT5DECLARATIVE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5DECLARATIVE_BUILD_CMDS
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 2a6aa3c..79ccdcc 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -23,7 +23,7 @@ QT5ENGINIO_DEPENDENCIES += qt5declarative
 endif
 
 define QT5ENGINIO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5ENGINIO_BUILD_CMDS
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 2dc2e71..be6462c 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -19,7 +19,7 @@ QT5GRAPHICALEFFECTS_REDISTRIBUTE = NO
 endif
 
 define QT5GRAPHICALEFFECTS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5GRAPHICALEFFECTS_BUILD_CMDS
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 0703db0..500ce77 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -19,7 +19,7 @@ QT5IMAGEFORMATS_REDISTRIBUTE = NO
 endif
 
 define QT5IMAGEFORMATS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5IMAGEFORMATS_BUILD_CMDS
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 50fdd57..891b4f5 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -30,7 +30,7 @@ QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
 endif
 
 define QT5MULTIMEDIA_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5MULTIMEDIA_BUILD_CMDS
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index 7ccf644..61a9f6f 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -20,7 +20,7 @@ QT5QUICK1_REDISTRIBUTE = NO
 endif
 
 define QT5QUICK1_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5QUICK1_BUILD_CMDS
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index a0b9215..8a55919 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -19,7 +19,7 @@ QT5QUICKCONTROLS_REDISTRIBUTE = NO
 endif
 
 define QT5QUICKCONTROLS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5QUICKCONTROLS_BUILD_CMDS
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 250bdfd..c1fe3ee 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -19,7 +19,7 @@ QT5SCRIPT_REDISTRIBUTE = NO
 endif
 
 define QT5SCRIPT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5SCRIPT_BUILD_CMDS
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 522dd8a..5543c55 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -23,7 +23,7 @@ QT5SENSORS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5SENSORS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5SENSORS_BUILD_CMDS
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 14cbf32..6960448 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -19,7 +19,7 @@ QT5SERIALPORT_REDISTRIBUTE = NO
 endif
 
 define QT5SERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5SERIALPORT_BUILD_CMDS
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 5942d01..95119f2 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -19,7 +19,7 @@ QT5SVG_REDISTRIBUTE = NO
 endif
 
 define QT5SVG_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5SVG_BUILD_CMDS
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index cfb6da9..1364fdb 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -23,7 +23,7 @@ QT5WEBCHANNEL_DEPENDENCIES += qt5declarative
 endif
 
 define QT5WEBCHANNEL_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5WEBCHANNEL_BUILD_CMDS
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index b687ac7..33a0740 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -24,7 +24,7 @@ QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5xmlpatterns
 endif
 
 define QT5WEBKIT_EXAMPLES_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5WEBKIT_EXAMPLES_BUILD_CMDS
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 75ad1bf..41c4bcc 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -31,7 +31,7 @@ QT5WEBKIT_DEPENDENCIES += qt5declarative
 endif
 
 define QT5WEBKIT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5WEBKIT_BUILD_CMDS
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 1d7c1f1..def8f41 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -23,7 +23,7 @@ QT5WEBSOCKETS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5WEBSOCKETS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5WEBSOCKETS_BUILD_CMDS
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 280379a..3112781 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -19,7 +19,7 @@ QT5X11EXTRAS_REDISTRIBUTE = NO
 endif
 
 define QT5X11EXTRAS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5X11EXTRAS_BUILD_CMDS
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 136da9f..ffc51fd 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -19,7 +19,7 @@ QT5XMLPATTERNS_REDISTRIBUTE = NO
 endif
 
 define QT5XMLPATTERNS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5XMLPATTERNS_BUILD_CMDS
diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index bfe14ce..d9254f5 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -18,7 +18,7 @@ QT5CINEX_LICENSE = CC-BY-3.0
 QT5CINEX_LICENSE_FILES = README
 
 define QT5CINEX_CONFIGURE_CMDS
-	cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake
+	cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake
 endef
 
 define QT5CINEX_BUILD_CMDS
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 2436376..7d40509 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -52,7 +52,7 @@ HOST_RPI_FIRMWARE_SOURCE =
 HOST_RPI_FIRMWARE_DEPENDENCIES =
 
 define HOST_RPI_FIRMWARE_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 package/rpi-firmware/mkknlimg $(HOST_DIR)/usr/bin/mkknlimg
+	$(INSTALL) -D -m 0755 package/rpi-firmware/mkknlimg $(HOST_DIR)/bin/mkknlimg
 endef
 
 $(eval $(generic-package))
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 2a3c2a1..4913832 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -18,13 +18,13 @@ endef
 
 # Since it's a prebuilt application and it does not conform to the
 # usual Unix hierarchy, we install it in $(HOST_DIR)/opt/sam-ba and
-# then create a symbolic link from $(HOST_DIR)/usr/bin to the
+# then create a symbolic link from $(HOST_DIR)/bin to the
 # application binary, for easier usage.
 
 define HOST_SAM_BA_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/opt/sam-ba/
 	cp -a $(@D)/* $(HOST_DIR)/opt/sam-ba/
-	ln -sf ../../opt/sam-ba/sam-ba $(HOST_DIR)/usr/bin/sam-ba
+	ln -sf ../../opt/sam-ba/sam-ba $(HOST_DIR)/bin/sam-ba
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 6f3fb58..9def725 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -126,7 +126,7 @@ endef
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 define SAMBA4_BUILD_PYC_FILES
 	PYTHONPATH="$(PYTHON_PATH)" \
-		$(HOST_DIR)/usr/bin/python -c "import compileall; \
+		$(HOST_DIR)/bin/python -c "import compileall; \
 		compileall.compile_dir('$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/samba')"
 endef
 SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_BUILD_PYC_FILES
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 39fb258..c56526c 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -13,9 +13,9 @@ SCONS_SETUP_TYPE = distutils
 HOST_SCONS_NEEDS_HOST_PYTHON = python2
 
 HOST_SCONS_INSTALL_OPTS = \
-	--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION)
+	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
 
 $(eval $(host-python-package))
 
 # variables used by other packages
-SCONS = $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons $(if $(QUIET),-s)
+SCONS = $(HOST_DIR)/bin/python2 $(HOST_DIR)/bin/scons $(if $(QUIET),-s)
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index b46fc64..bb7eba1 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -37,8 +37,8 @@ SDL_IMAGE_DEPENDENCIES = sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),webp)
 
 HOST_SDL_IMAGE_CONF_OPTS = \
-	--with-sdl-prefix=$(HOST_DIR)/usr \
-	--with-sdl-exec-prefix=$(HOST_DIR)/usr \
+	--with-sdl-prefix=$(HOST_DIR) \
+	--with-sdl-exec-prefix=$(HOST_DIR) \
 	--disable-sdltest \
 	--disable-static \
 	--disable-jpg-shared \
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index f575f86..1027315 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -44,8 +44,8 @@ HOST_SETOOLS_DEPENDENCIES += host-python
 HOST_SETOOLS_CONF_ENV += am_cv_python_version=$(PYTHON_VERSION)
 endif
 
-HOST_SETOOLS_PYTHON_SITE_PACKAGES = $(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages
-HOST_SETOOLS_PYTHON_INCLUDES = $(HOST_DIR)/usr/include/python$(HOST_SETOOLS_PYTHON_VERSION)
+HOST_SETOOLS_PYTHON_SITE_PACKAGES = $(HOST_DIR)/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages
+HOST_SETOOLS_PYTHON_INCLUDES = $(HOST_DIR)/include/python$(HOST_SETOOLS_PYTHON_VERSION)
 HOST_SETOOLS_PYTHON_LIB = -lpython$(HOST_SETOOLS_PYTHON_VERSION)
 
 # Notes: Need "disable-selinux-check" so the configure does not check to see
@@ -60,16 +60,16 @@ HOST_SETOOLS_CONF_OPTS = \
 	--disable-swig-java \
 	--disable-swig-python \
 	--disable-swig-tcl \
-	--with-sepol-devel="$(HOST_DIR)/usr" \
-	--with-selinux-devel="$(HOST_DIR)/usr" \
-	PYTHON_LDFLAGS="-L$(HOST_DIR)/usr/lib/" \
+	--with-sepol-devel="$(HOST_DIR)" \
+	--with-selinux-devel="$(HOST_DIR)" \
+	PYTHON_LDFLAGS="-L$(HOST_DIR)/lib/" \
 	PYTHON_CPPFLAGS="-I$(HOST_SETOOLS_PYTHON_INCLUDES)" \
 	PYTHON_SITE_PKG="$(HOST_SETOOLS_PYTHON_SITE_PACKAGES)" \
 	PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil $(HOST_SETOOLS_PYTHON_LIB)"
 
 HOST_SETOOLS_CONF_ENV += \
 	am_cv_pathless_PYTHON=python \
-	ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
+	ac_cv_path_PYTHON=$(HOST_DIR)/bin/python \
 	am_cv_python_platform=linux2 \
 	am_cv_python_version=$(HOST_SETOOLS_PYTHON_VERSION) \
 	am_cv_python_pythondir=$(HOST_SETOOLS_PYTHON_SITE_PACKAGES) \
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 80a9526..46ecb1a 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -8,7 +8,7 @@ SHARED_MIME_INFO_VERSION = 0.90
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.bz2
 SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
 SHARED_MIME_INFO_INSTALL_STAGING = YES
-SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
+SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/bin/xmllint
 SHARED_MIME_INFO_DEPENDENCIES = host-shared-mime-info libxml2 libglib2
 SHARED_MIME_INFO_CONF_OPTS = --disable-update-mimedb
 SHARED_MIME_INFO_MAKE = $(MAKE1)
@@ -30,4 +30,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # shared-mime-info for the host
-SHARED_MIME_INFO_HOST_BINARY = $(HOST_DIR)/usr/bin/update-mime-database
+SHARED_MIME_INFO_HOST_BINARY = $(HOST_DIR)/bin/update-mime-database
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index eaf13bc..589dff8 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -35,7 +35,7 @@ SOCAT_CONF_OPTS += --disable-readline
 endif
 
 define SOCAT_RUN_AUTOCONF
-	(cd $(@D); $(HOST_DIR)/usr/bin/autoconf)
+	(cd $(@D); $(HOST_DIR)/bin/autoconf)
 endef
 
 SOCAT_PRE_CONFIGURE_HOOKS += SOCAT_RUN_AUTOCONF
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 489341e..9713622 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -40,7 +40,7 @@ define HOST_SOFTETHER_BUILD_CMDS
 endef
 
 define HOST_SOFTETHER_INSTALL_CMDS
-	$(INSTALL) -m 0755 $(@D)/src/hamcorebuilder/hamcorebuilder $(HOST_DIR)/usr/bin/hamcorebuilder
+	$(INSTALL) -m 0755 $(@D)/src/hamcorebuilder/hamcorebuilder $(HOST_DIR)/bin/hamcorebuilder
 endef
 
 $(eval $(autotools-package))
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 9693eb9..e493030 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -11,7 +11,7 @@ SQLCIPHER_INSTALL_STAGING = YES
 
 SQLCIPHER_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) $(SQLCIPHER_CFLAGS)" \
-	TCLSH_CMD=$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
+	TCLSH_CMD=$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR)
 
 SQLCIPHER_CONF_OPTS = \
 	--enable-threadsafe
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 3204d05..a358216 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -88,7 +88,7 @@ endef
 
 define HOST_SQUASHFS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_SQUASHFS_MAKE_ARGS) \
-		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
+		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/bin install
 endef
 
 $(eval $(generic-package))
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index fe57b3c..12c851e 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -25,7 +25,7 @@ define HOST_SSTRIP_BUILD_CMDS
 endef
 
 define HOST_SSTRIP_INSTALL_CMDS
-	$(INSTALL) -D $(@D)/sstrip $(HOST_DIR)/usr/bin/$(HOST_SSTRIP_BINARY)
+	$(INSTALL) -D $(@D)/sstrip $(HOST_DIR)/bin/$(HOST_SSTRIP_BINARY)
 endef
 
 $(eval $(generic-package))
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 049af9b..5c41865 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -9,7 +9,7 @@ SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPLv2+
 SUNXI_TOOLS_LICENSE_FILES = COPYING
 HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
-FEX2BIN = $(HOST_DIR)/usr/bin/fex2bin
+FEX2BIN = $(HOST_DIR)/bin/fex2bin
 
 define HOST_SUNXI_TOOLS_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
@@ -19,7 +19,7 @@ endef
 
 define HOST_SUNXI_TOOLS_INSTALL_CMDS
 	for i in fexc bin2fex fex2bin bootinfo fel pio; do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(HOST_DIR)/usr/bin/$$i ; \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(HOST_DIR)/bin/$$i ; \
 	done
 endef
 
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 3f3ab2f..8310f55 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -17,19 +17,19 @@ SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
 # CMake looks first at swig2.0 and then swig. However, when doing the
 # search, it will look into the PATH for swig2.0 first, and then for
-# swig. While the PATH contains first our $(HOST_DIR)/usr/bin, it also
+# swig. While the PATH contains first our $(HOST_DIR)/bin, it also
 # contains /usr/bin and other system directories. Therefore, if there
 # is an installed swig2.0 on the system, it will get the preference
-# over the swig installed in $(HOST_DIR)/usr/bin, which isn't nice. To
+# over the swig installed in $(HOST_DIR)/bin, which isn't nice. To
 # prevent this from happening we create a symbolic link swig2.0 ->
 # swig, so that our swig always gets used.
 
 define HOST_SWIG_INSTALL_SYMLINK
-	ln -fs $(HOST_DIR)/usr/bin/swig $(HOST_DIR)/usr/bin/swig$(SWIG_VERSION_MAJOR)
+	ln -fs $(HOST_DIR)/bin/swig $(HOST_DIR)/bin/swig$(SWIG_VERSION_MAJOR)
 endef
 
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
 
 $(eval $(host-autotools-package))
 
-SWIG = $(HOST_DIR)/usr/bin/swig$(SWIG_VERSION_MAJOR)
+SWIG = $(HOST_DIR)/bin/swig$(SWIG_VERSION_MAJOR)
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index 9eb3b7d..bd98dd6 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -10,6 +10,6 @@ TCLLIB_SITE = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VE
 TCLLIB_LICENSE = tcl license
 TCLLIB_LICENSE_FILES = license.terms
 TCLLIB_DEPENDENCIES = host-tcl
-TCLLIB_CONF_ENV = ac_cv_path_tclsh="$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)"
+TCLLIB_CONF_ENV = ac_cv_path_tclsh="$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR)"
 
 $(eval $(autotools-package))
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index a40ddad..291c975 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -21,7 +21,7 @@ HOST_THRIFT_CONF_OPTS = --with-sysroot=$(HOST_DIR) \
 	--disable-tests \
 	--disable-tutorial
 THRIFT_AUTORECONF = YES
-THRIFT_AUTORECONF_OPTS = -I $(HOST_DIR)/usr/share/autoconf-archive
+THRIFT_AUTORECONF_OPTS = -I $(HOST_DIR)/share/autoconf-archive
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
 
@@ -58,7 +58,7 @@ endef
 THRIFT_POST_PATCH_HOOKS += THRIFT_TOOL_NO_HARDCODE
 
 define THRIFT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) THRIFT=$(HOST_DIR)/usr/bin/thrift -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) THRIFT=$(HOST_DIR)/bin/thrift -C $(@D)
 endef
 
 # Install runtime only
@@ -70,4 +70,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # to be used by other packages
-THRIFT = $(HOST_DIR)/usr/bin/thrift
+THRIFT = $(HOST_DIR)/bin/thrift
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 4ffb357..61dd602 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -70,7 +70,7 @@ define TVHEADEND_CONFIGURE_CMDS
 			--prefix=/usr				\
 			--arch="$(ARCH)"			\
 			--cpu="$(BR2_GCC_TARGET_CPU)"		\
-			--python="$(HOST_DIR)/usr/bin/python"	\
+			--python="$(HOST_DIR)/bin/python"	\
 			--enable-dvbscan			\
 			--enable-bundle				\
 			--disable-libffmpeg_static		\
diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 7a756eb..406f0d3 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -11,7 +11,7 @@ TZ_LICENSE = Public domain
 TZ_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
 
 define TZ_BUILD_CMDS
-	(cd $(HOST_DIR)/usr/share/zoneinfo/posix/;                 \
+	(cd $(HOST_DIR)/share/zoneinfo/posix/;                 \
 		for i in $$(find . -type f); do                    \
 			mkdir -p $(@D)/output/$$(dirname $$i);         \
 			$(TZDUMP) -p . -q $${i#./} | sed '1d' > $(@D)/output/$$i; \
@@ -20,9 +20,9 @@ define TZ_BUILD_CMDS
 endef
 
 define TZ_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/zoneinfo/zone.tab \
+	$(INSTALL) -D -m 0644 $(HOST_DIR)/share/zoneinfo/zone.tab \
 		$(TARGET_DIR)/usr/share/zoneinfo/zone.tab
-	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/zoneinfo/iso3166.tab \
+	$(INSTALL) -D -m 0644 $(HOST_DIR)/share/zoneinfo/iso3166.tab \
 		$(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab
 	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 39fc262..2c18a2d 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -29,7 +29,7 @@ TZDATA_EXTRACT_CMDS =
 
 define TZDATA_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/zoneinfo
-	cp -a $(HOST_DIR)/usr/share/zoneinfo/* $(TARGET_DIR)/usr/share/zoneinfo
+	cp -a $(HOST_DIR)/share/zoneinfo/* $(TARGET_DIR)/usr/share/zoneinfo
 	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
 	for zone in posix/*; do                 \
 	    ln -sfn "$${zone}" "$${zone##*/}";  \
@@ -56,8 +56,8 @@ define HOST_TZDATA_BUILD_CMDS
 endef
 
 define HOST_TZDATA_INSTALL_CMDS
-	$(INSTALL) -d -m 0755 $(HOST_DIR)/usr/share/zoneinfo
-	cp -a $(@D)/_output/* $(@D)/*.tab $(HOST_DIR)/usr/share/zoneinfo
+	$(INSTALL) -d -m 0755 $(HOST_DIR)/share/zoneinfo
+	cp -a $(@D)/_output/* $(@D)/*.tab $(HOST_DIR)/share/zoneinfo
 endef
 
 $(eval $(generic-package))
diff --git a/package/tzdump/tzdump.mk b/package/tzdump/tzdump.mk
index 3f035a5..baad978 100644
--- a/package/tzdump/tzdump.mk
+++ b/package/tzdump/tzdump.mk
@@ -13,9 +13,9 @@ define HOST_TZDUMP_BUILD_CMDS
 endef
 
 define HOST_TZDUMP_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/tzdump $(HOST_DIR)/usr/sbin/tzdump
+	$(INSTALL) -m 0755 -D $(@D)/tzdump $(HOST_DIR)/sbin/tzdump
 endef
 
 $(eval $(host-generic-package))
 
-TZDUMP = $(HOST_DIR)/usr/sbin/tzdump
+TZDUMP = $(HOST_DIR)/sbin/tzdump
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 5a239ab..4b3251b 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -77,8 +77,8 @@ define HOST_UBOOT_TOOLS_BUILD_CMDS
 endef
 
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin/mkimage
-	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/usr/bin/mkenvimage
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/bin/mkimage
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/bin/mkenvimage
 endef
 
 $(eval $(generic-package))
@@ -86,7 +86,7 @@ $(eval $(host-generic-package))
 
 # Convenience variables for other mk files that make use of mkimage
 
-MKIMAGE = $(HOST_DIR)/usr/bin/mkimage
+MKIMAGE = $(HOST_DIR)/bin/mkimage
 
 # mkimage supports arm blackfin m68k microblaze mips mips64 nios2 powerpc ppc sh sparc sparc64 x86
 # KERNEL_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index eaac9dc..8318142 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -450,10 +450,10 @@ endef
 # STATIC has no ld* tools, only getconf
 ifeq ($(BR2_STATIC_LIBS),)
 define UCLIBC_INSTALL_UTILS_STAGING
-	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd
-	ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd
-	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig
-	ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig
+	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/bin/ldd
+	ln -sf ldd $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ldd
+	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/bin/ldconfig
+	ln -sf ldconfig $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ldconfig
 endef
 endif
 
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 400d283..96df12c 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -16,13 +16,13 @@ HOST_UPX_DEPENDENCIES = host-ucl host-zlib
 # stating to "please choose a target for 'make'"... :-(
 define HOST_UPX_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) CPPFLAGS="$(HOST_CPPFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" UPX_UCLDIR=$(HOST_DIR)/usr \
+		LDFLAGS="$(HOST_LDFLAGS)" UPX_UCLDIR=$(HOST_DIR) \
 		-C $(@D) all
 endef
 
 # UPX has no install procedure, so install it manually.
 define HOST_UPX_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/upx.out $(HOST_DIR)/usr/bin/upx
+	$(INSTALL) -D -m 0755 $(@D)/src/upx.out $(HOST_DIR)/bin/upx
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ca1f09c..2369a4b 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -297,9 +297,9 @@ endif
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 VLC_CONF_OPTS += --enable-qt
 VLC_CONF_ENV += \
-	ac_cv_path_MOC=$(HOST_DIR)/usr/bin/moc \
-	ac_cv_path_RCC=$(HOST_DIR)/usr/bin/rcc \
-	ac_cv_path_UIC=$(HOST_DIR)/usr/bin/uic
+	ac_cv_path_MOC=$(HOST_DIR)/bin/moc \
+	ac_cv_path_RCC=$(HOST_DIR)/bin/rcc \
+	ac_cv_path_UIC=$(HOST_DIR)/bin/uic
 VLC_DEPENDENCIES += qt
 else
 VLC_CONF_OPTS += --disable-qt
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 4e44fa0..3bd68eb 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -19,10 +19,10 @@ WAYLAND_CONF_OPTS = --disable-scanner
 # We must provide a specialy-crafted wayland-scanner .pc file
 # which we vampirise and adapt from the host-wayland copy
 define WAYLAND_SCANNER_PC
-	$(INSTALL) -m 0644 -D $(HOST_DIR)/usr/lib/pkgconfig/wayland-scanner.pc \
+	$(INSTALL) -m 0644 -D $(HOST_DIR)/lib/pkgconfig/wayland-scanner.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
 	$(SED) 's:^prefix=.*:prefix=/usr:' \
-		-e 's:^wayland_scanner=.*:wayland_scanner=$(HOST_DIR)/usr/bin/wayland-scanner:' \
+		-e 's:^wayland_scanner=.*:wayland_scanner=$(HOST_DIR)/bin/wayland-scanner:' \
 		$(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
 endef
 WAYLAND_POST_INSTALL_STAGING_HOOKS += WAYLAND_SCANNER_PC
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 85a6884..9f01838 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ADOBE_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/f
 XFONT_FONT_ADOBE_100DPI_LICENSE = MIT
 XFONT_FONT_ADOBE_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index bb0a184..1a8af2b 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ADOBE_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/fo
 XFONT_FONT_ADOBE_75DPI_LICENSE = MIT
 XFONT_FONT_ADOBE_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index 390ca67..4ff89f6 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ADOBE_UTOPIA_100DPI_SITE = http://xorg.freedesktop.org/releases/indiv
 XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index 7ecd46e..61005f7 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = http://xorg.freedesktop.org/releases/indivi
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index 6c780e2..9264eaf 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ADOBE_UTOPIA_TYPE1_SITE = http://xorg.freedesktop.org/releases/indivi
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index e2ac236..f6b3008 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ALIAS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ALIAS_LICENSE = MIT
 XFONT_FONT_ALIAS_LICENSE_FILES = COPYING
 
-XFONT_FONT_ALIAS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ALIAS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ALIAS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ALIAS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index fa1269b..0043a00 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ARABIC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/fo
 XFONT_FONT_ARABIC_MISC_LICENSE = MIT
 XFONT_FONT_ARABIC_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index fb16658..9197272 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_100DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index c8ade59..62bee42 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_75DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index a1b61db..0f039a1 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SITE = http://xorg.freedesktop.org/release
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 00a6bd6..892f9ee 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SITE = http://xorg.freedesktop.org/releases
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index f393dd3..f4fcde9 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_TTF_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_TTF_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_TTF_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_TTF_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_TTF_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_TTF_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_TTF_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index bf418d5..f5e6e89 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_TYPE1_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index 5ddca73..931058f 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BITSTREAM_100DPI_SITE = http://xorg.freedesktop.org/releases/individu
 XFONT_FONT_BITSTREAM_100DPI_LICENSE = MIT
 XFONT_FONT_BITSTREAM_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index d7fea27..9e77524 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BITSTREAM_75DPI_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_BITSTREAM_75DPI_LICENSE = MIT
 XFONT_FONT_BITSTREAM_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 813e3cb..a4d4f73 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BITSTREAM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_BITSTREAM_TYPE1_LICENSE = MIT
 XFONT_FONT_BITSTREAM_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 6dc9015..83ded01 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -10,8 +10,8 @@ XFONT_FONT_CRONYX_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_CRONYX_CYRILLIC_LICENSE = MIT
 XFONT_FONT_CRONYX_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 59d6a84..00867a6 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_CURSOR_MISC_SITE = http://xorg.freedesktop.org/releases/individual/fo
 XFONT_FONT_CURSOR_MISC_LICENSE = unencumbered
 XFONT_FONT_CURSOR_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index 59a84c7..f33088e 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -9,8 +9,8 @@ XFONT_FONT_DAEWOO_MISC_SOURCE = font-daewoo-misc-$(XFONT_FONT_DAEWOO_MISC_VERSIO
 XFONT_FONT_DAEWOO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DAEWOO_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index b26296d..fd7e286 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_DEC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DEC_MISC_LICENSE = MIT
 XFONT_FONT_DEC_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 6cec198..045a6bf 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -10,8 +10,8 @@ XFONT_FONT_IBM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_IBM_TYPE1_LICENSE = IBM/MIT X Consortium Courier Typefont agreement (no modification)
 XFONT_FONT_IBM_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 4ac4b9b..7ca1388 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ISAS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ISAS_MISC_LICENSE = MIT
 XFONT_FONT_ISAS_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 5f8b001..12cf8c8 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -9,8 +9,8 @@ XFONT_FONT_JIS_MISC_SOURCE = font-jis-misc-$(XFONT_FONT_JIS_MISC_VERSION).tar.bz
 XFONT_FONT_JIS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_JIS_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 11b4199..ea119b6 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MICRO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/fon
 XFONT_FONT_MICRO_MISC_LICENSE = Public Domain
 XFONT_FONT_MICRO_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 16fd46b..d72f988 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MISC_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/
 XFONT_FONT_MISC_CYRILLIC_LICENSE = MIT / Public Domain
 XFONT_FONT_MISC_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index 7d0825e..8214040 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MISC_ETHIOPIC_SITE = http://xorg.freedesktop.org/releases/individual/
 XFONT_FONT_MISC_ETHIOPIC_LICENSE = MIT
 XFONT_FONT_MISC_ETHIOPIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index 5667869..1b801df 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MISC_MELTHO_SITE = http://xorg.freedesktop.org/releases/individual/fo
 XFONT_FONT_MISC_MELTHO_LICENSE = Meltho License
 XFONT_FONT_MISC_MELTHO_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index 700837c..f9e1ba6 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MISC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_MISC_LICENSE = Public Domain
 XFONT_FONT_MISC_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 53fc192..1312e37 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MUTT_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MUTT_MISC_LICENSE = MIT
 XFONT_FONT_MUTT_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index 0fa4d39..65256ad 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_SCHUMACHER_MISC_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_SCHUMACHER_MISC_LICENSE = MIT
 XFONT_FONT_SCHUMACHER_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index 8158ce5..5687fd6 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -10,8 +10,8 @@ XFONT_FONT_SCREEN_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_SCREEN_CYRILLIC_LICENSE = MIT
 XFONT_FONT_SCREEN_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 035255f..f13fca5 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_SONY_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SONY_MISC_LICENSE = MIT
 XFONT_FONT_SONY_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index 395cb87..4b1a06c 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_SUN_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SUN_MISC_LICENSE = MIT
 XFONT_FONT_SUN_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 665fb90..f894522 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -10,8 +10,8 @@ XFONT_FONT_WINITZKI_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individ
 XFONT_FONT_WINITZKI_CYRILLIC_LICENSE = Public Domain
 XFONT_FONT_WINITZKI_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index e1a2ef6..5aced63 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -10,8 +10,8 @@ XFONT_FONT_XFREE86_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/
 XFONT_FONT_XFREE86_TYPE1_LICENSE = MIT
 XFONT_FONT_XFREE86_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index fc19aa1..68eed24 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -36,7 +36,7 @@ HOST_XLIB_LIBX11_CONF_OPTS = \
 # src/util/makekeys is executed at build time to generate ks_tables.h, so
 # it should get compiled for the host. The libX11 makefile unfortunately
 # doesn't have X11_CFLAGS_FOR_BUILD so this doesn't work.  For buildroot,
-# we know the X11 includes are in $(HOST_DIR)/usr/include, which are already
+# we know the X11 includes are in $(HOST_DIR)/include, which are already
 # in the CFLAGS_FOR_BUILD, so we can just remove the X11_CFLAGS
 define XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
 	$(SED) '/X11_CFLAGS/d' $(@D)/src/util/Makefile*
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 7e7e597..a4313ae 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -15,7 +15,7 @@ X264_CONF_OPTS = --disable-avs
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 # yasm needed for assembly files
 X264_DEPENDENCIES += host-yasm
-X264_CONF_ENV += AS="$(HOST_DIR)/usr/bin/yasm"
+X264_CONF_ENV += AS="$(HOST_DIR)/bin/yasm"
 else ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_aarch64),y)
 # We need to pass gcc as AS, because the ARM assembly files have to be
 # preprocessed
diff --git a/package/yaffs2utils/yaffs2utils.mk b/package/yaffs2utils/yaffs2utils.mk
index fdd5f67..9b5d8bb 100644
--- a/package/yaffs2utils/yaffs2utils.mk
+++ b/package/yaffs2utils/yaffs2utils.mk
@@ -15,7 +15,7 @@ define HOST_YAFFS2UTILS_BUILD_CMDS
 endef
 
 define HOST_YAFFS2UTILS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLDIR=$(HOST_DIR)/usr/bin install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLDIR=$(HOST_DIR)/bin install
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index fcc0288..c6b30c9 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -15,10 +15,10 @@ define HOST_ZIC_BUILD_CMDS
 endef
 
 define HOST_ZIC_INSTALL_CMDS
-	$(INSTALL) -D -m 755 $(@D)/zic $(HOST_DIR)/usr/sbin/zic
-	$(INSTALL) -D -m 644 $(@D)/tzfile.h $(HOST_DIR)/usr/include/tzfile.h
+	$(INSTALL) -D -m 755 $(@D)/zic $(HOST_DIR)/sbin/zic
+	$(INSTALL) -D -m 644 $(@D)/tzfile.h $(HOST_DIR)/include/tzfile.h
 endef
 
 $(eval $(host-generic-package))
 
-ZIC = $(HOST_DIR)/usr/sbin/zic
+ZIC = $(HOST_DIR)/sbin/zic
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index aec9daf..3edf7d7 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -38,7 +38,7 @@ define HOST_ZLIB_CONFIGURE_CMDS
 		$(HOST_CONFIGURE_ARGS) \
 		$(HOST_CONFIGURE_OPTS) \
 		./configure \
-		--prefix="$(HOST_DIR)/usr" \
+		--prefix="$(HOST_DIR)" \
 		--sysconfdir="$(HOST_DIR)/etc" \
 	)
 endef
diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
index 46051fb..22cfa27 100644
--- a/package/zynq-boot-bin/zynq-boot-bin.mk
+++ b/package/zynq-boot-bin/zynq-boot-bin.mk
@@ -16,7 +16,7 @@ define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
 endef
 
 define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/$(ZYNQ_BOOT_BIN_SOURCE) $(HOST_DIR)/usr/bin/$(ZYNQ_BOOT_BIN_SOURCE)
+	$(INSTALL) -D -m 0755 $(@D)/$(ZYNQ_BOOT_BIN_SOURCE) $(HOST_DIR)/bin/$(ZYNQ_BOOT_BIN_SOURCE)
 endef
 
 $(eval $(host-generic-package))
diff --git a/support/dependencies/check-host-tar.mk b/support/dependencies/check-host-tar.mk
index 9840a55..ad0b32e 100644
--- a/support/dependencies/check-host-tar.mk
+++ b/support/dependencies/check-host-tar.mk
@@ -2,5 +2,5 @@ TAR ?= tar
 
 ifeq (,$(call suitable-host-package,tar,$(TAR)))
 DEPENDENCIES_HOST_PREREQ += host-tar
-TAR = $(HOST_DIR)/usr/bin/tar
+TAR = $(HOST_DIR)/bin/tar
 endif
diff --git a/support/dependencies/check-host-xzcat.mk b/support/dependencies/check-host-xzcat.mk
index 5e08b6e..1bc6579 100644
--- a/support/dependencies/check-host-xzcat.mk
+++ b/support/dependencies/check-host-xzcat.mk
@@ -3,5 +3,5 @@
 
 ifeq (,$(call suitable-host-package,xzcat,$(XZCAT)))
 DEPENDENCIES_HOST_PREREQ += host-xz
-XZCAT = $(HOST_DIR)/usr/bin/xzcat
+XZCAT = $(HOST_DIR)/bin/xzcat
 endif
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 5cf381e..9d6e82c 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -4,7 +4,7 @@
 #
 
 # In order to allow the toolchain to be relocated, we calculate the
-# HOST_DIR based on this file's location: $(HOST_DIR)/usr/share/buildroot
+# HOST_DIR based on this file's location: $(HOST_DIR)/share/buildroot
 # and store it in RELOCATED_HOST_DIR.
 # All the other variables that need to refer to HOST_DIR will use the
 # RELOCATED_HOST_DIR variable.
diff --git a/support/scripts/eclipse-register-toolchain b/support/scripts/eclipse-register-toolchain
index 6f91998..891d29e 100755
--- a/support/scripts/eclipse-register-toolchain
+++ b/support/scripts/eclipse-register-toolchain
@@ -45,7 +45,7 @@ if test ! -d ${project_directory}/host ; then
     exit 1
 fi
 
-if test ! -e ${project_directory}/host/usr/bin/${toolchain_prefix}gcc ; then
+if test ! -e ${project_directory}/host/bin/${toolchain_prefix}gcc ; then
     echo "Cannot find the cross-compiler in the project directory"
     exit 1
 fi
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 4e12a1c..6639053 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -60,7 +60,7 @@
 #  so we're sure the correct configuration is always used and the
 #  toolchain behaves similar to an internal toolchain.
 #  This toolchain wrapper and symlinks are installed into
-#  $(HOST_DIR)/usr/bin like for the internal toolchains, and the rest
+#  $(HOST_DIR)/bin like for the internal toolchains, and the rest
 #  of Buildroot is handled identical for the 2 toolchain types.
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
@@ -662,7 +662,7 @@ endef
 ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
-	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
+	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
 	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	FDPIC_SUPPORT_LIB_DIR="" ; \
@@ -690,7 +690,7 @@ endif
 ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT
 	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...") ; \
-	FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
+	FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../bfin-uclinux/bin/bfin-uclinux-gcc ; \
 	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -mid-shared-library -print-file-name=libc`; \
 	if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
 	        $(INSTALL) -D $${FLAT_LIBC_A_LOCATION} $(TARGET_DIR)/lib/lib1.so; \
@@ -700,7 +700,7 @@ endif
 
 # Build toolchain wrapper for preprocessor, C and C++ compiler and setup
 # symlinks for everything else. Skip gdb symlink when we are building our
-# own gdb to prevent two gdb's in output/host/usr/bin.
+# own gdb to prevent two gdb's in output/host/bin.
 # The LTO support in gcc creates wrappers for ar, ranlib and nm which load
 # the lto plugin. These wrappers are called *-gcc-ar, *-gcc-ranlib, and
 # *-gcc-nm and should be used instead of the real programs when -flto is
@@ -708,23 +708,23 @@ endif
 # match the *cc-* pattern. Therefore, an additional case is added for *-ar,
 # *-ranlib and *-nm.
 define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
-	$(Q)cd $(HOST_DIR)/usr/bin; \
+	$(Q)cd $(HOST_DIR)/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
 		case "$$base" in \
 		*-ar|*-ranlib|*-nm) \
-			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
 			;; \
 		*cc|*cc-*|*++|*++-*|*cpp) \
 			ln -sf toolchain-wrapper $$base; \
 			;; \
 		*gdb|*gdbtui) \
 			if test "$(BR2_PACKAGE_HOST_GDB)" != "y"; then \
-				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
 			fi \
 			;; \
 		*) \
-			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
 			;; \
 		esac; \
 	done
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 16a3d78..681ae32 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -117,7 +117,7 @@ int main(int argc, char **argv)
 			perror(__FILE__ ": malloc");
 			return 2;
 		}
-		sprintf(relbasedir, "%s/../..", argv[0]);
+		sprintf(relbasedir, "%s/..", argv[0]);
 		absbasedir = realpath(relbasedir, NULL);
 	} else {
 		basename = progpath;
@@ -147,14 +147,14 @@ int main(int argc, char **argv)
 #elif defined(BR_CROSS_PATH_ABS)
 	ret = snprintf(path, sizeof(path), BR_CROSS_PATH_ABS "/%s" BR_CROSS_PATH_SUFFIX, basename);
 #else
-	ret = snprintf(path, sizeof(path), "%s/usr/bin/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
+	ret = snprintf(path, sizeof(path), "%s/bin/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
 #endif
 	if (ret >= sizeof(path)) {
 		perror(__FILE__ ": overflow");
 		return 3;
 	}
 #ifdef BR_CCACHE
-	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/usr/bin/ccache", absbasedir);
+	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/bin/ccache", absbasedir);
 	if (ret >= sizeof(ccache_path)) {
 		perror(__FILE__ ": overflow");
 		return 3;
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index c78363a..02d26bd 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -26,9 +26,9 @@ endif
 
 # For simplicity, build directly into the install location
 define TOOLCHAIN_BUILD_WRAPPER
-	$(Q)mkdir -p $(HOST_DIR)/usr/bin
+	$(Q)mkdir -p $(HOST_DIR)/bin
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
 		toolchain/toolchain-wrapper.c \
-		-o $(HOST_DIR)/usr/bin/toolchain-wrapper
+		-o $(HOST_DIR)/bin/toolchain-wrapper
 endef
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index c22713b..49a7308 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -14,4 +14,4 @@ TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 $(eval $(virtual-package))
 
-toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
+toolchain: $(HOST_DIR)/share/buildroot/toolchainfile.cmake
-- 
2.6.1
