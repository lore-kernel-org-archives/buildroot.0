From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 2 Apr 2010 12:40:32 +0200
Subject: [Buildroot] [git commit master] New package menu structure
Message-ID: <20100402104210.C65298A500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b1c9a155e1d48daa7f310fbfcdc545c5b793174b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES           |    2 +
 package/Config.in |  598 ++++++++++++++++++++++++++++-------------------------
 2 files changed, 323 insertions(+), 277 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1215a5c..d963a44 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,7 @@
 2010.05, Not yet released
 
+	Cleaned up / restructured package menu.
+
 	Toolchain: uClibc 0.9.30.3, older 0.9.30.x removed. 2.6.33
 	kernel headers, binutils 2.20.1, removed broken nios2 support.
 
diff --git a/package/Config.in b/package/Config.in
index dda3f67..047dce9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,14 +1,50 @@
 menu "Package Selection for the target"
 
 source "package/busybox/Config.in"
+source "package/customize/Config.in"
 
-comment "The minimum needed to build a uClibc development system"
+# Audio and video applications
+source "package/multimedia/Config.in"
 
+menu "Compressors and decompressors"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/bash/Config.in"
 source "package/bzip2/Config.in"
+source "package/gzip/Config.in"
+endif
+source "package/lzop/Config.in"
+source "package/lzma/Config.in"
+endmenu
+
+menu "Debugging, profiling and benchmark"
+source "package/dmalloc/Config.in"
+source "package/kexec/Config.in"
+source "package/lmbench/Config.in"
+source "package/lsof/Config.in"
+source "package/ltp-testsuite/Config.in"
+source "package/ltrace/Config.in"
+source "package/memstat/Config.in"
+source "package/netperf/Config.in"
+source "package/oprofile/Config.in"
+source "package/strace/Config.in"
+source "package/valgrind/Config.in"
+endmenu
+
+menu "Development tools"
+source "package/autoconf/Config.in"
+source "package/automake/Config.in"
+source "package/bison/Config.in"
+source "package/bsdiff/Config.in"
+source "toolchain/ccache/Config.in.2"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/coreutils/Config.in"
+endif
+source "package/cvs/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/diffutils/Config.in"
+endif
+source "package/distcc/Config.in"
+source "package/fakeroot/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/findutils/Config.in"
 endif
 source "package/flex/Config.in"
@@ -16,113 +52,284 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/gawk/Config.in"
 endif
 source "toolchain/gcc/Config.in.2"
+source "package/gettext/Config.in"
+source "package/gmp/Config.in"
+source "package/gperf/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/grep/Config.in"
 endif
+source "package/intltool/Config.in"
 source "package/make/Config.in"
+source "package/mpfr/Config.in"
+source "package/libtool/Config.in"
+source "package/m4/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/patch/Config.in"
+endif
+source "package/pkg-config/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sed/Config.in"
 source "package/tar/Config.in"
 endif
+endmenu
 
-comment "Other development stuff"
-source "package/autoconf/Config.in"
-source "package/automake/Config.in"
-source "package/bison/Config.in"
-source "toolchain/ccache/Config.in.2"
-source "package/cvs/Config.in"
-source "package/distcc/Config.in"
-source "package/dmalloc/Config.in"
-source "package/fakeroot/Config.in"
-source "package/gettext/Config.in"
-source "package/gmp/Config.in"
-source "package/gperf/Config.in"
-source "package/mpfr/Config.in"
-source "package/libtool/Config.in"
-source "package/m4/Config.in"
-source "package/oprofile/Config.in"
-source "package/pkg-config/Config.in"
-source "package/readline/Config.in"
-source "package/valgrind/Config.in"
-source "package/pcre/Config.in"
-source "package/intltool/Config.in"
+menu "Games"
+source "package/games/ace_of_penguins/Config.in"
+source "package/games/doom-wad/Config.in"
+source "package/games/gnuchess/Config.in"
+source "package/games/lxdoom/Config.in"
+source "package/games/magiccube4d/Config.in"
+source "package/games/prboom/Config.in"
+source "package/games/rubix/Config.in"
+source "package/games/vice/Config.in"
+endmenu
 
-comment "Other stuff"
-source "package/at/Config.in"
-source "package/beecrypt/Config.in"
-source "package/berkeleydb/Config.in"
-source "package/bsdiff/Config.in"
+menu "Graphic libraries and applications (graphic/text)"
+
+comment "graphic libraries"
+source "package/directfb/Config.in"
+source "package/directfb-examples/Config.in"
+source "package/divine/Config.in"
+source "package/fbdump/Config.in"
+source "package/imagemagick/Config.in"
+source "package/linux-fusion/Config.in"
+source "package/lite/Config.in"
+source "package/sawman/Config.in"
+source "package/sdl/Config.in"
+source "package/sdl_image/Config.in"
+source "package/sdl_mixer/Config.in"
+source "package/sdl_sound/Config.in"
+source "package/sdl_net/Config.in"
+source "package/sdl_ttf/Config.in"
+source "package/sdl_gfx/Config.in"
+
+comment "busybox graphic applications"
+comment "--> May be broken in busybox"
+source "package/fbv/Config.in"
+source "package/fbset/Config.in"
+
+comment "other GUIs"
+source "package/qt/Config.in"
+
+#source "package/microwin/Config.in"
+
+source "package/x11r7/Config.in"
+
+comment "X libraries and helper libraries"
+source "package/liberation/Config.in"
+source "package/libsexy/Config.in"
+
+comment "X Window managers"
+source "package/matchbox/Config.in"
+source "package/metacity/Config.in"
+source "package/blackbox/Config.in"
+
+comment "X applications"
+source "package/alsamixergui/Config.in"
+source "package/dillo/Config.in"
+source "package/docker/Config.in"
+source "package/gqview/Config.in"
+source "package/gmpc/Config.in"
+source "package/gob2/Config.in"
+source "package/gtkperf/Config.in"
+source "package/leafpad/Config.in"
+source "package/midori/Config.in"
+source "package/pcmanfm/Config.in"
+source "package/rdesktop/Config.in"
+source "package/rxvt/Config.in"
+source "package/sylpheed/Config.in"
+source "package/synergy/Config.in"
+source "package/torsmo/Config.in"
+source "package/x11vnc/Config.in"
+source "package/xstroke/Config.in"
+source "package/xvkbd/Config.in"
+endmenu
+
+menu "Hardware handling"
+source "package/acpid/Config.in"
+source "package/dbus/Config.in"
+source "package/dbus-glib/Config.in"
+source "package/dbus-python/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/bootutils/Config.in"
+source "package/devmem2/Config.in"
 endif
-source "package/cups/Config.in"
-source "package/customize/Config.in"
+source "package/dmraid/Config.in"
+source "package/dosfstools/Config.in"
+source "package/e2fsprogs/Config.in"
+source "package/eeprog/Config.in"
+source "package/fconfig/Config.in"
+source "package/fis/Config.in"
+source "package/gadgetfs-test/Config.in"
+source "package/gvfs/Config.in"
+source "package/hal/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/dash/Config.in"
+source "package/hdparm/Config.in"
+source "package/hotplug/Config.in"
 endif
-source "package/enchant/Config.in"
-source "package/file/Config.in"
-source "package/gamin/Config.in"
-source "package/icu/Config.in"
-source "package/kexec/Config.in"
+source "package/hwdata/Config.in"
+source "package/i2c-tools/Config.in"
+source "package/input-tools/Config.in"
+source "package/iostat/Config.in"
+source "package/lm-sensors/Config.in"
+source "package/lvm2/Config.in"
+source "package/mdadm/Config.in"
+source "package/memtester/Config.in"
+source "package/mtd/Config.in"
+source "package/ntfs-3g/Config.in"
+source "package/ntfsprogs/Config.in"
+source "package/pciutils/Config.in"
+source "package/pcmcia/Config.in"
+source "package/setserial/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/less/Config.in"
+# busybox has fdisk
+source "package/sfdisk/Config.in"
 endif
+source "package/smartmontools/Config.in"
+source "package/sshfs/Config.in"
+source "package/sysstat/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+# mdev
+source "package/udev/Config.in"
+endif
+source "package/usb_modeswitch/Config.in"
+source "package/usbmount/Config.in"
+source "package/usbutils/Config.in"
+source "package/wipe/Config.in"
+source "package/xfsprogs/Config.in"
+endmenu
+
+menu "Interpreter languages and scripting"
+source "package/haserl/Config.in"
+source "package/java/jamvm/Config.in"
+source "package/lua/Config.in"
+source "package/microperl/Config.in"
+source "package/php/Config.in"
+source "package/python/Config.in"
+source "package/ruby/Config.in"
+source "package/tcl/Config.in"
+endmenu
+
+menu "Libraries"
+
+menu "Compression and decompression"
+source "package/libarchive/Config.in"
+source "package/lzo/Config.in"
+source "package/zlib/Config.in"
+endmenu
+
+menu "Crypto"
+source "package/beecrypt/Config.in"
+source "package/libgcrypt/Config.in"
+source "package/libgpg-error/Config.in"
+source "package/openssl/Config.in"
+endmenu
+
+menu "Database"
+source "package/berkeleydb/Config.in"
+source "package/database/mysql_client/Config.in"
+source "package/database/sqlite/Config.in"
+endmenu
+
+menu "Filesystem"
+source "package/gamin/Config.in"
 source "package/libconfig/Config.in"
 source "package/libconfuse/Config.in"
+source "package/fuse/Config.in"
+source "package/liblockfile/Config.in"
+source "package/libsysfs/Config.in"
+endmenu
+
+menu "Graphics"
+source "package/atk/Config.in"
+source "package/cairo/Config.in"
+source "package/fltk/Config.in"
+source "package/fontconfig/Config.in"
+source "package/freetype/Config.in"
+source "package/gtk2-engines/Config.in"
+source "package/gtk2-themes/Config.in"
+source "package/jpeg/Config.in"
+source "package/libart/Config.in"
+source "package/libdrm/Config.in"
+source "package/libglade/Config.in"
+source "package/libgtk12/Config.in"
+source "package/libgtk2/Config.in"
+source "package/libpng/Config.in"
+source "package/libungif/Config.in"
+source "package/pango/Config.in"
+source "package/pixman/Config.in"
+source "package/tiff/Config.in"
+source "package/webkit/Config.in"
+endmenu
+
+menu "Hardware handling"
+source "package/libaio/Config.in"
+source "package/libraw1394/Config.in"
+source "package/tslib/Config.in"
+source "package/libusb/Config.in"
+endmenu
+
+menu "Java"
+source "package/java/classpath/Config.in"
+source "package/java/concierge/Config.in"
+endmenu
+
+menu "Networking"
+source "package/libcgi/Config.in"
+source "package/libcgicc/Config.in"
+source "package/libcurl/Config.in"
+source "package/libdnet/Config.in"
+source "package/libeXosip2/Config.in"
+source "package/libidn/Config.in"
+source "package/libmicrohttpd/Config.in"
+source "package/neon/Config.in"
+source "package/libnl/Config.in"
+source "package/libpcap/Config.in"
+source "package/libosip2/Config.in"
+source "package/librsync/Config.in"
+source "package/libsoup/Config.in"
+source "package/libupnp/Config.in"
+endmenu
+
+menu "Other"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libfloat/Config.in"
-source "package/libgcrypt/Config.in"
-source "package/libgpg-error/Config.in"
-source "package/libiconv/Config.in"
-source "package/libidn/Config.in"
-source "package/liblockfile/Config.in"
+source "package/libglib12/Config.in"
+source "package/libglib2/Config.in"
 source "package/liboil/Config.in"
-source "package/librsync/Config.in"
-source "package/libsysfs/Config.in"
-source "package/lockfile-progs/Config.in"
-source "package/logrotate/Config.in"
-source "package/lsof/Config.in"
-source "package/lmbench/Config.in"
-source "package/ltp-testsuite/Config.in"
-source "package/ltrace/Config.in"
-source "package/memstat/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/module-init-tools/Config.in"
-source "package/modutils/Config.in"
-endif
-source "package/ng-spice-rework/Config.in"
-source "package/popt/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/procps/Config.in"
-endif
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/psmisc/Config.in"
-endif
-source "package/screen/Config.in"
-source "package/shared-mime-info/Config.in"
 source "package/startup-notification/Config.in"
-source "package/strace/Config.in"
-source "package/sudo/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/sysklogd/Config.in"
-# busybox has init and the runit stuff
-source "package/sysvinit/Config.in"
-source "package/util-linux/Config.in"
-source "package/which/Config.in"
-endif
+endmenu
+
+menu "Text and terminal handling"
+source "package/enchant/Config.in"
+source "package/icu/Config.in"
+source "package/libiconv/Config.in"
+source "package/ncurses/Config.in"
+source "package/newt/Config.in"
+source "package/pcre/Config.in"
+source "package/popt/Config.in"
+source "package/readline/Config.in"
+source "package/slang/Config.in"
+endmenu
 
-source "package/database/Config.in"
+menu "XML"
+source "package/expat/Config.in"
+source "package/ezxml/Config.in"
+source "package/libxml-parser-perl/Config.in"
+source "package/libxml2/Config.in"
+source "package/libxslt/Config.in"
+source "package/xerces/Config.in"
+endmenu
 
-# text editors
-source "package/editors/Config.in"
+endmenu
 
-menu "Networking"
+menu "Miscellaneous"
+source "package/ng-spice-rework/Config.in"
+source "package/shared-mime-info/Config.in"
+endmenu
 
-comment "Networking applications"
+menu "Networking applications"
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
@@ -133,13 +340,13 @@ source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
 source "package/ctorrent/Config.in"
+source "package/cups/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
 endif
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ethtool/Config.in"
-source "package/haserl/Config.in"
 source "package/hostapd/Config.in"
 source "package/ifplugd/Config.in"
 source "package/iperf/Config.in"
@@ -149,17 +356,6 @@ source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
 source "package/l2tp/Config.in"
-source "package/libcgi/Config.in"
-source "package/libcgicc/Config.in"
-source "package/libcurl/Config.in"
-source "package/libdnet/Config.in"
-source "package/libeXosip2/Config.in"
-source "package/libmicrohttpd/Config.in"
-source "package/libnl/Config.in"
-source "package/libosip2/Config.in"
-source "package/libpcap/Config.in"
-source "package/libsoup/Config.in"
-source "package/libupnp/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/lighttpd/Config.in"
 endif
@@ -173,13 +369,11 @@ source "package/mrouted/Config.in"
 source "package/mutt/Config.in"
 source "package/nbd/Config.in"
 source "package/ncftp/Config.in"
-source "package/neon/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/netcat/Config.in"
 source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"
 endif
-source "package/netperf/Config.in"
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
@@ -188,7 +382,6 @@ source "package/ntp/Config.in"
 source "package/olsr/Config.in"
 source "package/openntpd/Config.in"
 source "package/openssh/Config.in"
-source "package/openssl/Config.in"
 source "package/openvpn/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
@@ -226,201 +419,52 @@ source "package/wpa_supplicant/Config.in"
 
 endmenu
 
-menu "Hardware handling / blockdevices and filesystem maintenance"
-source "package/acpid/Config.in"
-source "package/dbus/Config.in"
-source "package/dbus-glib/Config.in"
-source "package/dbus-python/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/devmem2/Config.in"
-endif
-source "package/dmraid/Config.in"
-source "package/dosfstools/Config.in"
-source "package/e2fsprogs/Config.in"
-source "package/eeprog/Config.in"
-source "package/fconfig/Config.in"
-source "package/fis/Config.in"
-source "package/fuse/Config.in"
-source "package/gadgetfs-test/Config.in"
-source "package/gvfs/Config.in"
-source "package/hal/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/hdparm/Config.in"
-source "package/hotplug/Config.in"
-endif
-source "package/hwdata/Config.in"
-source "package/i2c-tools/Config.in"
-source "package/input-tools/Config.in"
-source "package/iostat/Config.in"
-source "package/libaio/Config.in"
-source "package/libraw1394/Config.in"
-source "package/libusb/Config.in"
-source "package/lm-sensors/Config.in"
-source "package/lvm2/Config.in"
-source "package/mdadm/Config.in"
-source "package/memtester/Config.in"
-source "package/mtd/Config.in"
-source "package/ntfs-3g/Config.in"
-source "package/ntfsprogs/Config.in"
-source "package/pciutils/Config.in"
-source "package/pcmcia/Config.in"
-source "package/setserial/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-# busybox has fdisk
-source "package/sfdisk/Config.in"
-endif
-source "package/smartmontools/Config.in"
-source "package/sshfs/Config.in"
-source "package/sysstat/Config.in"
+menu "Package managers"
+source "package/ipkg/Config.in"
+source "package/portage/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-# mdev
-source "package/udev/Config.in"
+source "package/rpm/Config.in"
 endif
-source "package/usb_modeswitch/Config.in"
-source "package/usbmount/Config.in"
-source "package/usbutils/Config.in"
-source "package/wipe/Config.in"
-source "package/xfsprogs/Config.in"
 endmenu
 
-# Audio/Video support
-source "package/multimedia/Config.in"
-
-menu "Graphic libraries and applications (graphic/text)"
-comment "text rendering libraries"
-source "package/ncurses/Config.in"
-source "package/newt/Config.in"
-source "package/slang/Config.in"
-
-comment "text rendering applications"
+menu "Shell and utilities"
+source "package/at/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/bash/Config.in"
+source "package/dash/Config.in"
+endif
 source "package/dialog/Config.in"
-
-comment "graphic libraries"
-source "package/directfb/Config.in"
-source "package/directfb-examples/Config.in"
-source "package/divine/Config.in"
-source "package/fbdump/Config.in"
-source "package/imagemagick/Config.in"
-source "package/jpeg/Config.in"
-source "package/libart/Config.in"
-source "package/libpng/Config.in"
-source "package/libungif/Config.in"
-source "package/linux-fusion/Config.in"
-source "package/lite/Config.in"
-source "package/pixman/Config.in"
-source "package/sawman/Config.in"
-source "package/sdl/Config.in"
-source "package/sdl_image/Config.in"
-source "package/sdl_mixer/Config.in"
-source "package/sdl_sound/Config.in"
-source "package/sdl_net/Config.in"
-source "package/sdl_ttf/Config.in"
-source "package/sdl_gfx/Config.in"
-source "package/tiff/Config.in"
-
-comment "busybox graphic applications"
-comment "--> May be broken in busybox"
-source "package/fbv/Config.in"
-source "package/fbset/Config.in"
-
-comment "other GUIs"
-source "package/qt/Config.in"
-
-#source "package/microwin/Config.in"
-
-source "package/x11r7/Config.in"
-
-comment "X libraries and helper libraries"
-source "package/atk/Config.in"
-source "package/cairo/Config.in"
-source "package/pango/Config.in"
-source "package/libdrm/Config.in"
-source "package/liberation/Config.in"
-source "package/libglade/Config.in"
-source "package/libglib12/Config.in"
-source "package/libglib2/Config.in"
-source "package/libgtk12/Config.in"
-source "package/libgtk2/Config.in"
-source "package/gtk2-engines/Config.in"
-source "package/gtk2-themes/Config.in"
-source "package/libsexy/Config.in"
-source "package/fltk/Config.in"
-source "package/fontconfig/Config.in"
-source "package/freetype/Config.in"
-source "package/tslib/Config.in"
-source "package/webkit/Config.in"
-
-comment "X Window managers"
-source "package/matchbox/Config.in"
-source "package/metacity/Config.in"
-source "package/blackbox/Config.in"
-
-comment "X applications"
-source "package/alsamixergui/Config.in"
-source "package/dillo/Config.in"
-source "package/docker/Config.in"
-source "package/gqview/Config.in"
-source "package/gmpc/Config.in"
-source "package/gob2/Config.in"
-source "package/gtkperf/Config.in"
-source "package/leafpad/Config.in"
-source "package/midori/Config.in"
-source "package/pcmanfm/Config.in"
-source "package/rdesktop/Config.in"
-source "package/rxvt/Config.in"
-source "package/sylpheed/Config.in"
-source "package/synergy/Config.in"
-source "package/torsmo/Config.in"
-source "package/x11vnc/Config.in"
-source "package/xstroke/Config.in"
-source "package/xvkbd/Config.in"
+source "package/file/Config.in"
+source "package/lockfile-progs/Config.in"
+source "package/logrotate/Config.in"
+source "package/screen/Config.in"
+source "package/sudo/Config.in"
+source "package/which/Config.in"
 endmenu
 
-menu "Compressors / decompressors"
-
+menu "System tools"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/gzip/Config.in"
+source "package/bootutils/Config.in"
+source "package/module-init-tools/Config.in"
+source "package/modutils/Config.in"
+source "package/procps/Config.in"
+source "package/psmisc/Config.in"
+source "package/sysklogd/Config.in"
+source "package/sysvinit/Config.in"
+source "package/util-linux/Config.in"
 endif
-source "package/libarchive/Config.in"
-source "package/lzo/Config.in"
-source "package/lzop/Config.in"
-source "package/lzma/Config.in"
-source "package/zlib/Config.in"
 endmenu
 
-menu "Package managers"
-
-source "package/ipkg/Config.in"
-source "package/portage/Config.in"
+menu "Text editors and viewers"
+source "package/editors/ed/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/rpm/Config.in"
+source "package/less/Config.in"
+endif
+source "package/editors/nano/Config.in"
+source "package/editors/uemacs/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/editors/vim/Config.in"
 endif
 endmenu
 
-menu "Interpreter languages / Scripting"
-
-source "package/lua/Config.in"
-source "package/microperl/Config.in"
-source "package/python/Config.in"
-source "package/ruby/Config.in"
-source "package/tcl/Config.in"
-source "package/php/Config.in"
-endmenu
-
-menu "XML handling"
-
-source "package/expat/Config.in"
-source "package/ezxml/Config.in"
-source "package/libxml2/Config.in"
-source "package/libxslt/Config.in"
-source "package/xerces/Config.in"
-source "package/libxml-parser-perl/Config.in"
-endmenu
-
-# java support
-source "package/java/Config.in"
-
-# various games packages
-source "package/games/Config.in"
-
 endmenu
-- 
1.6.3.3
