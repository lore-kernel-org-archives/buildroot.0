From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 May 2012 23:10:44 +0200
Subject: [Buildroot] [PATCH] pkg-infra: remove the call from XXXTARGETS
Message-ID: <1336857045-10679-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace $(call XXXTARGETS,host) with $(XXXTARGETS_HOST) and
$(call XXXTARGETS) with $(XXXTARGETS).

Also includes documentation update, but not for buildroot.html.

This brings the time for 'make -qp' (which is used by bash-completion)
down from 1.85s to 1.35s on my laptop.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Although this is a huge patch, not much has changed.

pkg-gentargets, pkg-maketargets and pkg-cmaketargets have manual changes.

Documentation is updated.

pkg-stats script is updated (brokennes from the pkg-*.mk files remains).

All the rest is done with
find package linux toolchain boot -name \*.mk | \
  xargs sed -i 's/$(eval $(call GENTARGETS,host))/$(eval $(GENTARGETS_HOST))/;
                s/$(eval $(call GENTARGETS))/$(eval $(GENTARGETS))/'

I could have split it up into separate patches but I didn't see much point.
It wouldn't make the review or integration easier if you ask me.  And if
we ever want to revert, we want to revert all of it.

 boot/at91bootstrap/at91bootstrap.mk                |    2 +-
 boot/at91dataflashboot/at91dataflashboot.mk        |    2 +-
 boot/barebox/barebox.mk                            |    2 +-
 boot/grub/grub.mk                                  |    2 +-
 boot/lpc32xxcdl/lpc32xxcdl.mk                      |    2 +-
 boot/syslinux/syslinux.mk                          |    4 ++--
 boot/uboot/uboot.mk                                |    2 +-
 boot/xloader/xloader.mk                            |    2 +-
 docs/manual/adding-packages-autotargets.txt        |    4 ++--
 docs/manual/adding-packages-cmaketargets.txt       |    5 ++--
 docs/manual/adding-packages-gentargets.txt         |   25 +++++++++-----------
 linux/linux.mk                                     |    2 +-
 package/acl/acl.mk                                 |    2 +-
 package/acpid/acpid.mk                             |    2 +-
 package/alsa-lib/alsa-lib.mk                       |    2 +-
 package/alsamixergui/alsamixergui.mk               |    2 +-
 package/apr-util/apr-util.mk                       |    2 +-
 package/apr/apr.mk                                 |    2 +-
 package/argp-standalone/argp-standalone.mk         |    2 +-
 package/argus/argus.mk                             |    2 +-
 package/at/at.mk                                   |    2 +-
 package/atk/atk.mk                                 |    4 ++--
 package/attr/attr.mk                               |    2 +-
 package/audiofile/audiofile.mk                     |    2 +-
 package/autoconf/autoconf.mk                       |    4 ++--
 package/automake/automake.mk                       |    4 ++--
 package/avahi/avahi.mk                             |    2 +-
 package/axel/axel.mk                               |    2 +-
 package/bash/bash.mk                               |    2 +-
 package/beecrypt/beecrypt.mk                       |    2 +-
 package/berkeleydb/berkeleydb.mk                   |    2 +-
 package/bind/bind.mk                               |    2 +-
 package/binutils/binutils.mk                       |    4 ++--
 package/bison/bison.mk                             |    4 ++--
 package/blackbox/blackbox.mk                       |    2 +-
 package/bluez_utils/bluez_utils.mk                 |    2 +-
 package/bmon/bmon.mk                               |    2 +-
 package/boa/boa.mk                                 |    2 +-
 package/bonnie/bonnie.mk                           |    2 +-
 package/boost/boost.mk                             |    2 +-
 package/bootutils/bootutils.mk                     |    2 +-
 package/bridge-utils/bridge-utils.mk               |    2 +-
 package/bsdiff/bsdiff.mk                           |    2 +-
 package/busybox/busybox.mk                         |    2 +-
 package/bwm-ng/bwm-ng.mk                           |    2 +-
 package/bzip2/bzip2.mk                             |    4 ++--
 package/cairo/cairo.mk                             |    2 +-
 package/can-utils/can-utils.mk                     |    2 +-
 package/ccache/ccache.mk                           |    4 ++--
 package/cdrkit/cdrkit.mk                           |    4 ++--
 package/cgilua/cgilua.mk                           |    2 +-
 package/cifs-utils/cifs-utils.mk                   |    2 +-
 package/cloop/cloop.mk                             |    4 ++--
 package/cmake/cmake.mk                             |    4 ++--
 package/connman/connman.mk                         |    2 +-
 package/conntrack-tools/conntrack-tools.mk         |    2 +-
 package/copas/copas.mk                             |    2 +-
 package/coreutils/coreutils.mk                     |    2 +-
 package/coxpcall/coxpcall.mk                       |    2 +-
 package/cramfs/cramfs.mk                           |    4 ++--
 package/crosstool-ng/crosstool-ng.mk               |    2 +-
 package/ctorrent/ctorrent.mk                       |    2 +-
 package/cups/cups.mk                               |    2 +-
 package/cvs/cvs.mk                                 |    2 +-
 package/dash/dash.mk                               |    2 +-
 package/dbus-glib/dbus-glib.mk                     |    4 ++--
 package/dbus-python/dbus-python.mk                 |    2 +-
 package/dbus/dbus.mk                               |    4 ++--
 package/devmem2/devmem2.mk                         |    2 +-
 package/dhcp/dhcp.mk                               |    2 +-
 package/dhcpdump/dhcpdump.mk                       |    2 +-
 package/dhrystone/dhrystone.mk                     |    2 +-
 package/dialog/dialog.mk                           |    2 +-
 package/diffutils/diffutils.mk                     |    2 +-
 package/directfb-examples/directfb-examples.mk     |    2 +-
 package/directfb/directfb.mk                       |    4 ++--
 package/distcc/distcc.mk                           |    2 +-
 package/divine/divine.mk                           |    2 +-
 package/dmalloc/dmalloc.mk                         |    2 +-
 package/dmraid/dmraid.mk                           |    2 +-
 package/dnsmasq/dnsmasq.mk                         |    2 +-
 package/docker/docker.mk                           |    2 +-
 package/dosfstools/dosfstools.mk                   |    2 +-
 package/dropbear/dropbear.mk                       |    2 +-
 package/dsp-tools/dsp-tools.mk                     |    2 +-
 package/dstat/dstat.mk                             |    2 +-
 package/e2fsprogs/e2fsprogs.mk                     |    4 ++--
 package/ebtables/ebtables.mk                       |    2 +-
 package/ed/ed.mk                                   |    2 +-
 package/eeprog/eeprog.mk                           |    2 +-
 package/efl/expedite/expedite.mk                   |    2 +-
 package/efl/libecore/libecore.mk                   |    4 ++--
 package/efl/libedbus/libedbus.mk                   |    2 +-
 package/efl/libedje/libedje.mk                     |    4 ++--
 package/efl/libeet/libeet.mk                       |    4 ++--
 package/efl/libefreet/libefreet.mk                 |    2 +-
 package/efl/libeina/libeina.mk                     |    4 ++--
 package/efl/libelementary/libelementary.mk         |    2 +-
 package/efl/libembryo/libembryo.mk                 |    4 ++--
 package/efl/libethumb/libethumb.mk                 |    2 +-
 package/efl/libevas/libevas.mk                     |    4 ++--
 package/empty/empty.mk                             |    2 +-
 package/enchant/enchant.mk                         |    2 +-
 package/ethtool/ethtool.mk                         |    2 +-
 package/expat/expat.mk                             |    4 ++--
 package/explorercanvas/explorercanvas.mk           |    2 +-
 package/ezxml/ezxml.mk                             |    2 +-
 package/fakeroot/fakeroot.mk                       |    2 +-
 package/fbdump/fbdump.mk                           |    2 +-
 package/fbgrab/fbgrab.mk                           |    2 +-
 package/fbset/fbset.mk                             |    2 +-
 package/fbv/fbv.mk                                 |    2 +-
 package/fconfig/fconfig.mk                         |    2 +-
 package/feh/feh.mk                                 |    2 +-
 package/fftw/fftw.mk                               |    2 +-
 package/file/file.mk                               |    4 ++--
 package/findutils/findutils.mk                     |    2 +-
 package/fis/fis.mk                                 |    2 +-
 package/flex/flex.mk                               |    4 ++--
 package/flot/flot.mk                               |    2 +-
 package/fltk/fltk.mk                               |    2 +-
 package/fluxbox/fluxbox.mk                         |    2 +-
 package/fmtools/fmtools.mk                         |    2 +-
 package/fontconfig/fontconfig.mk                   |    4 ++--
 package/freetype/freetype.mk                       |    4 ++--
 package/gadgetfs-test/gadgetfs-test.mk             |    2 +-
 package/games/doom-wad/doom-wad.mk                 |    2 +-
 package/games/gnuchess/gnuchess.mk                 |    2 +-
 package/games/prboom/prboom.mk                     |    2 +-
 package/games/rubix/rubix.mk                       |    2 +-
 package/gamin/gamin.mk                             |    2 +-
 package/gawk/gawk.mk                               |    4 ++--
 package/gdisk/gdisk.mk                             |    2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                   |    4 ++--
 package/genext2fs/genext2fs.mk                     |    4 ++--
 package/genromfs/genromfs.mk                       |    4 ++--
 package/giblib/giblib.mk                           |    2 +-
 package/glib-networking/glib-networking.mk         |    2 +-
 package/gmp/gmp.mk                                 |    4 ++--
 package/gmpc/gmpc.mk                               |    2 +-
 package/gnutls/gnutls.mk                           |    2 +-
 package/gob2/gob2.mk                               |    4 ++--
 package/gperf/gperf.mk                             |    4 ++--
 package/gpsd/gpsd.mk                               |    2 +-
 package/gqview/gqview.mk                           |    2 +-
 package/grep/grep.mk                               |    2 +-
 package/gtk2-engines/gtk2-engines.mk               |    2 +-
 .../gtk2-theme-hicolor/gtk2-theme-hicolor.mk       |    2 +-
 package/gtkperf/gtkperf.mk                         |    2 +-
 package/gvfs/gvfs.mk                               |    2 +-
 package/gzip/gzip.mk                               |    2 +-
 package/haserl/haserl.mk                           |    2 +-
 package/hdparm/hdparm.mk                           |    2 +-
 package/heirloom-mailx/heirloom-mailx.mk           |    2 +-
 package/hiawatha/hiawatha.mk                       |    2 +-
 package/hostapd/hostapd.mk                         |    2 +-
 package/htop/htop.mk                               |    2 +-
 package/hwdata/hwdata.mk                           |    2 +-
 package/i2c-tools/i2c-tools.mk                     |    2 +-
 package/icu/icu.mk                                 |    4 ++--
 package/ifplugd/ifplugd.mk                         |    2 +-
 package/igh-ethercat/igh-ethercat.mk               |    2 +-
 package/imagemagick/imagemagick.mk                 |    2 +-
 package/imlib2/imlib2.mk                           |    2 +-
 package/inotify-tools/inotify-tools.mk             |    2 +-
 package/input-event-daemon/input-event-daemon.mk   |    2 +-
 package/input-tools/input-tools.mk                 |    2 +-
 package/intltool/intltool.mk                       |    4 ++--
 package/iostat/iostat.mk                           |    2 +-
 package/iperf/iperf.mk                             |    2 +-
 package/ipkg/ipkg.mk                               |    2 +-
 package/iproute2/iproute2.mk                       |    2 +-
 package/ipsec-tools/ipsec-tools.mk                 |    2 +-
 package/ipset/ipset.mk                             |    2 +-
 package/iptables/iptables.mk                       |    2 +-
 package/irda-utils/irda-utils.mk                   |    2 +-
 package/iw/iw.mk                                   |    2 +-
 package/jpeg/jpeg.mk                               |    4 ++--
 package/jquery-sparkline/jquery-sparkline.mk       |    2 +-
 package/jquery-validation/jquery-validation.mk     |    2 +-
 package/jquery/jquery.mk                           |    2 +-
 package/jsmin/jsmin.mk                             |    4 ++--
 package/json-c/json-c.mk                           |    2 +-
 package/kbd/kbd.mk                                 |    2 +-
 package/kexec/kexec.mk                             |    2 +-
 package/kismet/kismet.mk                           |    2 +-
 package/kmod/kmod.mk                               |    2 +-
 package/latencytop/latencytop.mk                   |    2 +-
 package/lcdproc/lcdproc.mk                         |    2 +-
 package/leafpad/leafpad.mk                         |    2 +-
 package/less/less.mk                               |    2 +-
 package/libaio/libaio.mk                           |    2 +-
 package/libao/libao.mk                             |    2 +-
 package/libarchive/libarchive.mk                   |    2 +-
 package/libargtable2/libargtable2.mk               |    2 +-
 package/libart/libart.mk                           |    2 +-
 package/libatomic_ops/libatomic_ops.mk             |    2 +-
 package/libcap-ng/libcap-ng.mk                     |    2 +-
 package/libcap/libcap.mk                           |    4 ++--
 package/libcdaudio/libcdaudio.mk                   |    2 +-
 package/libcgi/libcgi.mk                           |    2 +-
 package/libcgicc/libcgicc.mk                       |    2 +-
 package/libconfig/libconfig.mk                     |    2 +-
 package/libconfuse/libconfuse.mk                   |    2 +-
 package/libcue/libcue.mk                           |    2 +-
 package/libcuefile/libcuefile.mk                   |    2 +-
 package/libcurl/libcurl.mk                         |    2 +-
 package/libdaemon/libdaemon.mk                     |    2 +-
 package/libdmtx/libdmtx.mk                         |    2 +-
 package/libdnet/libdnet.mk                         |    2 +-
 package/libdrm/libdrm.mk                           |    2 +-
 package/libdvdnav/libdvdnav.mk                     |    2 +-
 package/libdvdread/libdvdread.mk                   |    2 +-
 package/libeXosip2/libeXosip2.mk                   |    2 +-
 package/libelf/libelf.mk                           |    2 +-
 package/liberation/liberation.mk                   |    2 +-
 package/libesmtp/libesmtp.mk                       |    2 +-
 package/libev/libev.mk                             |    2 +-
 package/libevent/libevent.mk                       |    2 +-
 package/libexif/libexif.mk                         |    2 +-
 package/libfcgi/libfcgi.mk                         |    2 +-
 package/libffi/libffi.mk                           |    4 ++--
 package/libftdi/libftdi.mk                         |    4 ++--
 package/libfuse/libfuse.mk                         |    2 +-
 package/libgail/libgail.mk                         |    2 +-
 package/libgcrypt/libgcrypt.mk                     |    2 +-
 package/libgeotiff/libgeotiff.mk                   |    2 +-
 package/libglade/libglade.mk                       |    2 +-
 package/libglib2/libglib2.mk                       |    4 ++--
 package/libgpg-error/libgpg-error.mk               |    2 +-
 package/libgtk2/libgtk2.mk                         |    4 ++--
 package/libhid/libhid.mk                           |    2 +-
 package/libical/libical.mk                         |    2 +-
 package/libiconv/libiconv.mk                       |    2 +-
 package/libid3tag/libid3tag.mk                     |    2 +-
 package/libidn/libidn.mk                           |    2 +-
 package/libiqrf/libiqrf.mk                         |    2 +-
 package/liblockfile/liblockfile.mk                 |    2 +-
 package/libmad/libmad.mk                           |    2 +-
 package/libmbus/libmbus.mk                         |    2 +-
 package/libmicrohttpd/libmicrohttpd.mk             |    2 +-
 package/libmms/libmms.mk                           |    2 +-
 package/libmnl/libmnl.mk                           |    2 +-
 package/libmodbus/libmodbus.mk                     |    2 +-
 package/libmpd/libmpd.mk                           |    2 +-
 package/libmpeg2/libmpeg2.mk                       |    2 +-
 .../libnetfilter-conntrack.mk                      |    2 +-
 package/libnfnetlink/libnfnetlink.mk               |    2 +-
 package/libnl/libnl.mk                             |    2 +-
 package/libnspr/libnspr.mk                         |    2 +-
 package/libnss/libnss.mk                           |    2 +-
 package/liboauth/liboauth.mk                       |    2 +-
 package/libogg/libogg.mk                           |    2 +-
 package/libosip2/libosip2.mk                       |    2 +-
 package/libpcap/libpcap.mk                         |    2 +-
 package/libplayer/libplayer.mk                     |    2 +-
 package/libpng/libpng.mk                           |    4 ++--
 package/libraw/libraw.mk                           |    2 +-
 package/libraw1394/libraw1394.mk                   |    2 +-
 package/libreplaygain/libreplaygain.mk             |    2 +-
 package/libroxml/libroxml.mk                       |    2 +-
 package/librsvg/librsvg.mk                         |    2 +-
 package/librsync/librsync.mk                       |    2 +-
 package/libsamplerate/libsamplerate.mk             |    2 +-
 package/libsexy/libsexy.mk                         |    2 +-
 package/libsigc/libsigc.mk                         |    2 +-
 package/libsndfile/libsndfile.mk                   |    2 +-
 package/libsoup/libsoup.mk                         |    2 +-
 package/libsvgtiny/libsvgtiny.mk                   |    2 +-
 package/libsysfs/libsysfs.mk                       |    2 +-
 package/libtheora/libtheora.mk                     |    2 +-
 package/libtool/libtool.mk                         |    4 ++--
 package/libtpl/libtpl.mk                           |    2 +-
 package/libungif/libungif.mk                       |    2 +-
 package/libupnp/libupnp.mk                         |    2 +-
 package/liburcu/liburcu.mk                         |    2 +-
 package/libusb-compat/libusb-compat.mk             |    4 ++--
 package/libusb/libusb.mk                           |    4 ++--
 package/libv4l/libv4l.mk                           |    2 +-
 package/libvncserver/libvncserver.mk               |    2 +-
 package/libvorbis/libvorbis.mk                     |    2 +-
 package/libxml-parser-perl/libxml-parser-perl.mk   |    4 ++--
 package/libxml2/libxml2.mk                         |    4 ++--
 package/libxslt/libxslt.mk                         |    4 ++--
 package/libyaml/libyaml.mk                         |    2 +-
 package/lighttpd/lighttpd.mk                       |    2 +-
 package/links/links.mk                             |    2 +-
 package/linux-firmware/linux-firmware.mk           |    2 +-
 package/linux-fusion/linux-fusion.mk               |    2 +-
 package/lite/lite.mk                               |    2 +-
 package/live555/live555.mk                         |    2 +-
 package/lm-sensors/lm-sensors.mk                   |    2 +-
 package/lmbench/lmbench.mk                         |    2 +-
 package/localedef/localedef.mk                     |    2 +-
 package/lockfile-progs/lockfile-progs.mk           |    2 +-
 package/logrotate/logrotate.mk                     |    2 +-
 package/lpc3250loader/lpc3250loader.mk             |    2 +-
 package/lrzsz/lrzsz.mk                             |    2 +-
 package/lsof/lsof.mk                               |    2 +-
 package/lsuio/lsuio.mk                             |    2 +-
 package/ltp-testsuite/ltp-testsuite.mk             |    2 +-
 package/ltrace/ltrace.mk                           |    2 +-
 package/lttng-babeltrace/lttng-babeltrace.mk       |    4 ++--
 package/lttng-libust/lttng-libust.mk               |    2 +-
 package/lttng-modules/lttng-modules.mk             |    2 +-
 package/lttng-tools/lttng-tools.mk                 |    2 +-
 package/lua/lua.mk                                 |    4 ++--
 package/luafilesystem/luafilesystem.mk             |    2 +-
 package/luasocket/luasocket.mk                     |    2 +-
 package/lvm2/lvm2.mk                               |    2 +-
 package/lzma/lzma.mk                               |    4 ++--
 package/lzo/lzo.mk                                 |    4 ++--
 package/lzop/lzop.mk                               |    2 +-
 package/m4/m4.mk                                   |    4 ++--
 package/make/make.mk                               |    2 +-
 package/makedevs/makedevs.mk                       |    4 ++--
 .../matchbox/matchbox-common/matchbox-common.mk    |    2 +-
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |    2 +-
 .../matchbox/matchbox-fakekey/matchbox-fakekey.mk  |    2 +-
 .../matchbox-keyboard/matchbox-keyboard.mk         |    2 +-
 package/matchbox/matchbox-lib/matchbox-lib.mk      |    2 +-
 package/matchbox/matchbox-panel/matchbox-panel.mk  |    2 +-
 .../matchbox-startup-monitor.mk                    |    2 +-
 package/matchbox/matchbox-wm/matchbox-wm.mk        |    2 +-
 package/mdadm/mdadm.mk                             |    2 +-
 package/memstat/memstat.mk                         |    2 +-
 package/memtester/memtester.mk                     |    2 +-
 package/metacity/metacity.mk                       |    2 +-
 package/microperl/microperl.mk                     |    4 ++--
 package/midori/midori.mk                           |    2 +-
 package/mii-diag/mii-diag.mk                       |    2 +-
 package/minicom/minicom.mk                         |    2 +-
 package/module-init-tools/module-init-tools.mk     |    4 ++--
 package/mpc/mpc.mk                                 |    4 ++--
 package/mpfr/mpfr.mk                               |    4 ++--
 package/mrouted/mrouted.mk                         |    2 +-
 package/msmtp/msmtp.mk                             |    2 +-
 package/mtd/mtd.mk                                 |    4 ++--
 package/multimedia/alsa-utils/alsa-utils.mk        |    2 +-
 package/multimedia/aumix/aumix.mk                  |    2 +-
 package/multimedia/bellagio/bellagio.mk            |    2 +-
 package/multimedia/faad2/faad2.mk                  |    2 +-
 package/multimedia/ffmpeg/ffmpeg.mk                |    2 +-
 package/multimedia/flac/flac.mk                    |    2 +-
 package/multimedia/gst-dsp/gst-dsp.mk              |    2 +-
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk        |    2 +-
 package/multimedia/gst-omapfb/gst-omapfb.mk        |    2 +-
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    2 +-
 .../gst-plugins-base/gst-plugins-base.mk           |    2 +-
 .../gst-plugins-good/gst-plugins-good.mk           |    2 +-
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 +-
 package/multimedia/gstreamer/gstreamer.mk          |    2 +-
 package/multimedia/lame/lame.mk                    |    2 +-
 package/multimedia/madplay/madplay.mk              |    2 +-
 package/multimedia/mpd/mpd.mk                      |    2 +-
 package/multimedia/mpg123/mpg123.mk                |    2 +-
 package/multimedia/mplayer/mplayer.mk              |    2 +-
 package/multimedia/musepack/musepack.mk            |    2 +-
 package/multimedia/pulseaudio/pulseaudio.mk        |    2 +-
 .../multimedia/tidsp-binaries/tidsp-binaries.mk    |    2 +-
 package/multimedia/vorbis-tools/vorbis-tools.mk    |    2 +-
 package/multimedia/wavpack/wavpack.mk              |    2 +-
 package/mutt/mutt.mk                               |    2 +-
 package/mxml/mxml.mk                               |    2 +-
 package/mysql_client/mysql_client.mk               |    2 +-
 package/nano/nano.mk                               |    2 +-
 package/nasm/nasm.mk                               |    4 ++--
 package/nbd/nbd.mk                                 |    2 +-
 package/ncftp/ncftp.mk                             |    2 +-
 package/ncurses/ncurses.mk                         |    4 ++--
 package/ndisc6/ndisc6.mk                           |    2 +-
 package/neon/neon.mk                               |    2 +-
 package/netatalk/netatalk.mk                       |    2 +-
 package/netcat/netcat.mk                           |    2 +-
 package/netperf/netperf.mk                         |    2 +-
 package/netplug/netplug.mk                         |    2 +-
 package/netsnmp/netsnmp.mk                         |    2 +-
 package/netstat-nat/netstat-nat.mk                 |    2 +-
 package/network-manager/network-manager.mk         |    2 +-
 package/nfs-utils/nfs-utils.mk                     |    2 +-
 package/ngircd/ngircd.mk                           |    2 +-
 package/ngrep/ngrep.mk                             |    2 +-
 package/noip/noip.mk                               |    2 +-
 package/ntfs-3g/ntfs-3g.mk                         |    2 +-
 package/ntp/ntp.mk                                 |    2 +-
 package/nuttcp/nuttcp.mk                           |    2 +-
 package/ocf-linux/ocf-linux.mk                     |    2 +-
 package/olsr/olsr.mk                               |    2 +-
 package/open2300/open2300.mk                       |    2 +-
 package/opencv/opencv.mk                           |    2 +-
 package/openntpd/openntpd.mk                       |    2 +-
 package/openocd/openocd.mk                         |    4 ++--
 package/openssh/openssh.mk                         |    2 +-
 package/openssl/openssl.mk                         |    2 +-
 package/openswan/openswan.mk                       |    2 +-
 package/openvpn/openvpn.mk                         |    2 +-
 package/oprofile/oprofile.mk                       |    2 +-
 package/orc/orc.mk                                 |    4 ++--
 package/pango/pango.mk                             |    2 +-
 package/parted/parted.mk                           |    2 +-
 package/patch/patch.mk                             |    2 +-
 package/pciutils/pciutils.mk                       |    2 +-
 package/pcmanfm/pcmanfm.mk                         |    2 +-
 package/pcre/pcre.mk                               |    2 +-
 package/php/php.mk                                 |    2 +-
 package/picocom/picocom.mk                         |    2 +-
 package/pixman/pixman.mk                           |    4 ++--
 package/pkg-autotargets.mk                         |    9 ++-----
 package/pkg-cmaketargets.mk                        |    9 ++-----
 package/pkg-config/pkg-config.mk                   |    4 ++--
 package/pkg-gentargets.mk                          |    9 ++-----
 package/poco/poco.mk                               |    2 +-
 package/polarssl/polarssl.mk                       |    2 +-
 package/popt/popt.mk                               |    4 ++--
 package/portaudio/portaudio.mk                     |    2 +-
 package/portmap/portmap.mk                         |    2 +-
 package/pppd/pppd.mk                               |    2 +-
 package/pptp-linux/pptp-linux.mk                   |    2 +-
 package/procps/procps.mk                           |    2 +-
 package/proftpd/proftpd.mk                         |    2 +-
 package/protobuf/protobuf.mk                       |    4 ++--
 package/psmisc/psmisc.mk                           |    2 +-
 package/pv/pv.mk                                   |    2 +-
 .../python-distutilscross/python-distutilscross.mk |    2 +-
 package/python-dpkt/python-dpkt.mk                 |    2 +-
 package/python-mad/python-mad.mk                   |    2 +-
 package/python-netifaces/python-netifaces.mk       |    2 +-
 package/python-pygame/python-pygame.mk             |    2 +-
 package/python-serial/python-serial.mk             |    2 +-
 package/python-setuptools/python-setuptools.mk     |    4 ++--
 package/python/python.mk                           |    4 ++--
 package/qt/qt.mk                                   |    2 +-
 package/quagga/quagga.mk                           |    2 +-
 package/radvd/radvd.mk                             |    2 +-
 package/rdesktop/rdesktop.mk                       |    2 +-
 package/read-edid/read-edid.mk                     |    2 +-
 package/readline/readline.mk                       |    2 +-
 package/rings/rings.mk                             |    2 +-
 package/rng-tools/rng-tools.mk                     |    2 +-
 package/rp-pppoe/rp-pppoe.mk                       |    2 +-
 package/rpm/rpm.mk                                 |    2 +-
 package/rrdtool/rrdtool.mk                         |    2 +-
 package/rsh-redone/rsh-redone.mk                   |    2 +-
 package/rsync/rsync.mk                             |    2 +-
 package/rsyslog/rsyslog.mk                         |    2 +-
 package/rt-tests/rt-tests.mk                       |    2 +-
 package/rtai/rtai.mk                               |    2 +-
 package/ruby/ruby.mk                               |    4 ++--
 package/sam-ba/sam-ba.mk                           |    2 +-
 package/samba/samba.mk                             |    2 +-
 package/sane-backends/sane-backends.mk             |    2 +-
 package/sawman/sawman.mk                           |    2 +-
 package/scons/scons.mk                             |    2 +-
 package/screen/screen.mk                           |    2 +-
 package/sdl/sdl.mk                                 |    2 +-
 package/sdl_gfx/sdl_gfx.mk                         |    2 +-
 package/sdl_image/sdl_image.mk                     |    2 +-
 package/sdl_mixer/sdl_mixer.mk                     |    2 +-
 package/sdl_net/sdl_net.mk                         |    2 +-
 package/sdl_sound/sdl_sound.mk                     |    2 +-
 package/sdl_ttf/sdl_ttf.mk                         |    2 +-
 package/sdparm/sdparm.mk                           |    2 +-
 package/sed/sed.mk                                 |    2 +-
 package/ser2net/ser2net.mk                         |    2 +-
 package/setserial/setserial.mk                     |    2 +-
 package/shared-mime-info/shared-mime-info.mk       |    4 ++--
 package/slang/slang.mk                             |    2 +-
 package/smartmontools/smartmontools.mk             |    2 +-
 package/socat/socat.mk                             |    2 +-
 package/socketcand/socketcand.mk                   |    2 +-
 package/spawn-fcgi/spawn-fcgi.mk                   |    2 +-
 package/speex/speex.mk                             |    2 +-
 package/sqlcipher/sqlcipher.mk                     |    2 +-
 package/sqlite/sqlite.mk                           |    2 +-
 package/squashfs/squashfs.mk                       |    4 ++--
 package/squashfs3/squashfs3.mk                     |    4 ++--
 package/squid/squid.mk                             |    2 +-
 package/sredird/sredird.mk                         |    2 +-
 package/sshfs/sshfs.mk                             |    2 +-
 package/sstrip/sstrip.mk                           |    4 ++--
 .../startup-notification/startup-notification.mk   |    2 +-
 package/statserial/statserial.mk                   |    2 +-
 package/strace/strace.mk                           |    2 +-
 package/stress/stress.mk                           |    2 +-
 package/stunnel/stunnel.mk                         |    2 +-
 package/sudo/sudo.mk                               |    2 +-
 package/sylpheed/sylpheed.mk                       |    2 +-
 package/synergy/synergy.mk                         |    2 +-
 package/sysklogd/sysklogd.mk                       |    2 +-
 package/sysstat/sysstat.mk                         |    2 +-
 package/systemd/systemd.mk                         |    2 +-
 package/sysvinit/sysvinit.mk                       |    2 +-
 package/taglib/taglib.mk                           |    2 +-
 package/tar/tar.mk                                 |    4 ++--
 package/tcl/tcl.mk                                 |    4 ++--
 package/tcpdump/tcpdump.mk                         |    2 +-
 package/tcpreplay/tcpreplay.mk                     |    2 +-
 package/tftpd/tftpd.mk                             |    2 +-
 package/thttpd/thttpd.mk                           |    2 +-
 package/ti-utils/ti-utils.mk                       |    2 +-
 package/tiff/tiff.mk                               |    2 +-
 package/tinyhttpd/tinyhttpd.mk                     |    2 +-
 package/tn5250/tn5250.mk                           |    2 +-
 package/torsmo/torsmo.mk                           |    2 +-
 package/transmission/transmission.mk               |    2 +-
 package/tremor/tremor.mk                           |    2 +-
 package/tslib/tslib.mk                             |    2 +-
 package/uboot-tools/uboot-tools.mk                 |    4 ++--
 package/udev/udev.mk                               |    2 +-
 package/udpcast/udpcast.mk                         |    2 +-
 package/uemacs/uemacs.mk                           |    2 +-
 package/unionfs/unionfs.mk                         |    2 +-
 package/usb_modeswitch/usb_modeswitch.mk           |    2 +-
 package/usbmount/usbmount.mk                       |    2 +-
 package/usbutils/usbutils.mk                       |    2 +-
 package/ushare/ushare.mk                           |    2 +-
 package/util-linux/util-linux.mk                   |    4 ++--
 package/vala/vala.mk                               |    4 ++--
 package/valgrind/valgrind.mk                       |    2 +-
 package/vim/vim.mk                                 |    2 +-
 package/vsftpd/vsftpd.mk                           |    2 +-
 package/vtun/vtun.mk                               |    2 +-
 package/webkit/webkit.mk                           |    2 +-
 package/wget/wget.mk                               |    2 +-
 package/whetstone/whetstone.mk                     |    2 +-
 package/which/which.mk                             |    2 +-
 package/wipe/wipe.mk                               |    2 +-
 package/wireless_tools/wireless_tools.mk           |    2 +-
 package/wpa_supplicant/wpa_supplicant.mk           |    2 +-
 package/wsapi/wsapi.mk                             |    2 +-
 package/x11r7/libxcb/libxcb.mk                     |    4 ++--
 package/x11r7/mcookie/mcookie.mk                   |    2 +-
 package/x11r7/mesa3d/mesa3d.mk                     |    2 +-
 package/x11r7/pthread-stubs/pthread-stubs.mk       |    4 ++--
 package/x11r7/xapp_appres/xapp_appres.mk           |    2 +-
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk       |    4 ++--
 package/x11r7/xapp_beforelight/xapp_beforelight.mk |    2 +-
 package/x11r7/xapp_bitmap/xapp_bitmap.mk           |    2 +-
 package/x11r7/xapp_editres/xapp_editres.mk         |    2 +-
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   |    2 +-
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk     |    2 +-
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk         |    2 +-
 package/x11r7/xapp_iceauth/xapp_iceauth.mk         |    2 +-
 package/x11r7/xapp_ico/xapp_ico.mk                 |    2 +-
 package/x11r7/xapp_listres/xapp_listres.mk         |    2 +-
 package/x11r7/xapp_luit/xapp_luit.mk               |    2 +-
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk     |    4 ++--
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    4 ++--
 package/x11r7/xapp_oclock/xapp_oclock.mk           |    2 +-
 package/x11r7/xapp_rgb/xapp_rgb.mk                 |    2 +-
 package/x11r7/xapp_rstart/xapp_rstart.mk           |    2 +-
 package/x11r7/xapp_scripts/xapp_scripts.mk         |    2 +-
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |    2 +-
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk     |    2 +-
 package/x11r7/xapp_showfont/xapp_showfont.mk       |    2 +-
 package/x11r7/xapp_smproxy/xapp_smproxy.mk         |    2 +-
 package/x11r7/xapp_twm/xapp_twm.mk                 |    2 +-
 package/x11r7/xapp_viewres/xapp_viewres.mk         |    2 +-
 package/x11r7/xapp_x11perf/xapp_x11perf.mk         |    2 +-
 package/x11r7/xapp_xauth/xapp_xauth.mk             |    2 +-
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   |    2 +-
 package/x11r7/xapp_xbiff/xapp_xbiff.mk             |    2 +-
 package/x11r7/xapp_xcalc/xapp_xcalc.mk             |    2 +-
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   |    2 +-
 package/x11r7/xapp_xclock/xapp_xclock.mk           |    2 +-
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk           |    2 +-
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   |    4 ++--
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk     |    2 +-
 package/x11r7/xapp_xditview/xapp_xditview.mk       |    2 +-
 package/x11r7/xapp_xdm/xapp_xdm.mk                 |    2 +-
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |    2 +-
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk       |    2 +-
 package/x11r7/xapp_xedit/xapp_xedit.mk             |    2 +-
 package/x11r7/xapp_xev/xapp_xev.mk                 |    2 +-
 package/x11r7/xapp_xeyes/xapp_xeyes.mk             |    2 +-
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk         |    2 +-
 package/x11r7/xapp_xfd/xapp_xfd.mk                 |    2 +-
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk       |    2 +-
 package/x11r7/xapp_xfs/xapp_xfs.mk                 |    2 +-
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk         |    2 +-
 package/x11r7/xapp_xgamma/xapp_xgamma.mk           |    2 +-
 package/x11r7/xapp_xgc/xapp_xgc.mk                 |    2 +-
 package/x11r7/xapp_xhost/xapp_xhost.mk             |    2 +-
 package/x11r7/xapp_xinit/xapp_xinit.mk             |    2 +-
 package/x11r7/xapp_xinput/xapp_xinput.mk           |    2 +-
 .../xapp_xinput-calibrator.mk                      |    2 +-
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |    4 ++--
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk           |    2 +-
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk       |    2 +-
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk       |    2 +-
 package/x11r7/xapp_xkill/xapp_xkill.mk             |    2 +-
 package/x11r7/xapp_xload/xapp_xload.mk             |    2 +-
 package/x11r7/xapp_xlogo/xapp_xlogo.mk             |    2 +-
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk       |    2 +-
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   |    2 +-
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk       |    2 +-
 package/x11r7/xapp_xmag/xapp_xmag.mk               |    2 +-
 package/x11r7/xapp_xman/xapp_xman.mk               |    2 +-
 package/x11r7/xapp_xmessage/xapp_xmessage.mk       |    2 +-
 package/x11r7/xapp_xmh/xapp_xmh.mk                 |    2 +-
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk         |    2 +-
 package/x11r7/xapp_xmore/xapp_xmore.mk             |    2 +-
 .../x11r7/xapp_xplsprinters/xapp_xplsprinters.mk   |    2 +-
 package/x11r7/xapp_xpr/xapp_xpr.mk                 |    2 +-
 .../xapp_xprehashprinterlist.mk                    |    2 +-
 package/x11r7/xapp_xprop/xapp_xprop.mk             |    2 +-
 package/x11r7/xapp_xrandr/xapp_xrandr.mk           |    2 +-
 package/x11r7/xapp_xrdb/xapp_xrdb.mk               |    2 +-
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk       |    2 +-
 package/x11r7/xapp_xset/xapp_xset.mk               |    2 +-
 package/x11r7/xapp_xsetmode/xapp_xsetmode.mk       |    2 +-
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk |    2 +-
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk       |    2 +-
 package/x11r7/xapp_xsm/xapp_xsm.mk                 |    2 +-
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk       |    2 +-
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk       |    2 +-
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk           |    2 +-
 package/x11r7/xapp_xwd/xapp_xwd.mk                 |    2 +-
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk       |    2 +-
 package/x11r7/xapp_xwud/xapp_xwud.mk               |    2 +-
 package/x11r7/xcb-proto/xcb-proto.mk               |    4 ++--
 package/x11r7/xcb-util/xcb-util.mk                 |    2 +-
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk     |    2 +-
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |    2 +-
 .../xdriver_xf86-input-acecad.mk                   |    2 +-
 .../xdriver_xf86-input-aiptek.mk                   |    2 +-
 .../xdriver_xf86-input-evdev.mk                    |    2 +-
 .../xdriver_xf86-input-joystick.mk                 |    2 +-
 .../xdriver_xf86-input-keyboard.mk                 |    2 +-
 .../xdriver_xf86-input-mouse.mk                    |    2 +-
 .../xdriver_xf86-input-synaptics.mk                |    2 +-
 .../xdriver_xf86-input-tslib.mk                    |    2 +-
 .../xdriver_xf86-input-vmmouse.mk                  |    2 +-
 .../xdriver_xf86-input-void.mk                     |    2 +-
 .../xdriver_xf86-video-apm.mk                      |    2 +-
 .../xdriver_xf86-video-ark.mk                      |    2 +-
 .../xdriver_xf86-video-ast.mk                      |    2 +-
 .../xdriver_xf86-video-ati.mk                      |    2 +-
 .../xdriver_xf86-video-chips.mk                    |    2 +-
 .../xdriver_xf86-video-cirrus.mk                   |    2 +-
 .../xdriver_xf86-video-dummy.mk                    |    2 +-
 .../xdriver_xf86-video-fbdev.mk                    |    2 +-
 .../xdriver_xf86-video-geode.mk                    |    2 +-
 .../xdriver_xf86-video-glide.mk                    |    2 +-
 .../xdriver_xf86-video-glint.mk                    |    2 +-
 .../xdriver_xf86-video-i128.mk                     |    2 +-
 .../xdriver_xf86-video-i740.mk                     |    2 +-
 .../xdriver_xf86-video-intel.mk                    |    2 +-
 .../xdriver_xf86-video-mach64.mk                   |    2 +-
 .../xdriver_xf86-video-mga.mk                      |    2 +-
 .../xdriver_xf86-video-neomagic.mk                 |    2 +-
 .../xdriver_xf86-video-newport.mk                  |    2 +-
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |    2 +-
 .../xdriver_xf86-video-openchrome.mk               |    2 +-
 .../xdriver_xf86-video-r128.mk                     |    2 +-
 .../xdriver_xf86-video-rendition.mk                |    2 +-
 .../xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk |    2 +-
 .../xdriver_xf86-video-s3virge.mk                  |    2 +-
 .../xdriver_xf86-video-savage.mk                   |    2 +-
 .../xdriver_xf86-video-siliconmotion.mk            |    2 +-
 .../xdriver_xf86-video-sis.mk                      |    2 +-
 .../xdriver_xf86-video-sisusb.mk                   |    2 +-
 .../xdriver_xf86-video-suncg14.mk                  |    2 +-
 .../xdriver_xf86-video-suncg3.mk                   |    2 +-
 .../xdriver_xf86-video-suncg6.mk                   |    2 +-
 .../xdriver_xf86-video-sunffb.mk                   |    2 +-
 .../xdriver_xf86-video-sunleo.mk                   |    2 +-
 .../xdriver_xf86-video-suntcx.mk                   |    2 +-
 .../xdriver_xf86-video-tdfx.mk                     |    2 +-
 .../xdriver_xf86-video-tga.mk                      |    2 +-
 .../xdriver_xf86-video-trident.mk                  |    2 +-
 .../xdriver_xf86-video-tseng.mk                    |    2 +-
 .../xdriver_xf86-video-v4l.mk                      |    2 +-
 .../xdriver_xf86-video-vesa.mk                     |    2 +-
 .../xdriver_xf86-video-vmware.mk                   |    2 +-
 .../xdriver_xf86-video-voodoo.mk                   |    2 +-
 .../xdriver_xf86-video-wsfb.mk                     |    2 +-
 .../xdriver_xf86-video-xgi.mk                      |    2 +-
 .../xdriver_xf86-video-xgixp.mk                    |    2 +-
 package/x11r7/xfont_encodings/xfont_encodings.mk   |    4 ++--
 .../xfont_font-adobe-100dpi.mk                     |    2 +-
 .../xfont_font-adobe-75dpi.mk                      |    2 +-
 .../xfont_font-adobe-utopia-100dpi.mk              |    2 +-
 .../xfont_font-adobe-utopia-75dpi.mk               |    2 +-
 .../xfont_font-adobe-utopia-type1.mk               |    2 +-
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |    2 +-
 .../xfont_font-arabic-misc.mk                      |    2 +-
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |    2 +-
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |    2 +-
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |    2 +-
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |    2 +-
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |    2 +-
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |    2 +-
 .../xfont_font-bitstream-100dpi.mk                 |    2 +-
 .../xfont_font-bitstream-75dpi.mk                  |    2 +-
 .../xfont_font-bitstream-speedo.mk                 |    2 +-
 .../xfont_font-bitstream-type1.mk                  |    2 +-
 .../xfont_font-cronyx-cyrillic.mk                  |    2 +-
 .../xfont_font-cursor-misc.mk                      |    2 +-
 .../xfont_font-daewoo-misc.mk                      |    2 +-
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |    2 +-
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |    2 +-
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |    2 +-
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |    2 +-
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |    2 +-
 .../xfont_font-misc-cyrillic.mk                    |    2 +-
 .../xfont_font-misc-ethiopic.mk                    |    2 +-
 .../xfont_font-misc-meltho.mk                      |    2 +-
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    2 +-
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |    2 +-
 .../xfont_font-schumacher-misc.mk                  |    2 +-
 .../xfont_font-screen-cyrillic.mk                  |    2 +-
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |    2 +-
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |    2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk   |    4 ++--
 .../xfont_font-winitzki-cyrillic.mk                |    2 +-
 .../xfont_font-xfree86-type1.mk                    |    2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 package/x11r7/xlib_libFS/xlib_libFS.mk             |    2 +-
 package/x11r7/xlib_libICE/xlib_libICE.mk           |    2 +-
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    4 ++--
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    4 ++--
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |    2 +-
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    2 +-
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    4 ++--
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |    2 +-
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    4 ++--
 package/x11r7/xlib_libXext/xlib_libXext.mk         |    2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |    4 ++--
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    4 ++--
 .../x11r7/xlib_libXfontcache/xlib_libXfontcache.mk |    2 +-
 package/x11r7/xlib_libXft/xlib_libXft.mk           |    2 +-
 package/x11r7/xlib_libXi/xlib_libXi.mk             |    2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |    2 +-
 package/x11r7/xlib_libXp/xlib_libXp.mk             |    2 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    2 +-
 .../xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk |    2 +-
 .../x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk |    2 +-
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |    2 +-
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |    4 ++--
 package/x11r7/xlib_libXres/xlib_libXres.mk         |    2 +-
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |    2 +-
 package/x11r7/xlib_libXv/xlib_libXv.mk             |    2 +-
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |    2 +-
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 +-
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |    2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    4 ++--
 package/x11r7/xlib_liboldX/xlib_liboldX.mk         |    2 +-
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    2 +-
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    4 ++--
 package/x11r7/xlib_libxkbui/xlib_libxkbui.mk       |    2 +-
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    4 ++--
 .../xproto_applewmproto/xproto_applewmproto.mk     |    2 +-
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |    2 +-
 .../xproto_compositeproto/xproto_compositeproto.mk |    2 +-
 .../x11r7/xproto_damageproto/xproto_damageproto.mk |    2 +-
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk   |    2 +-
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 +-
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |    4 ++--
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |    4 ++--
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |    4 ++--
 package/x11r7/xproto_glproto/xproto_glproto.mk     |    2 +-
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |    4 ++--
 package/x11r7/xproto_kbproto/xproto_kbproto.mk     |    4 ++--
 .../x11r7/xproto_printproto/xproto_printproto.mk   |    2 +-
 .../x11r7/xproto_randrproto/xproto_randrproto.mk   |    2 +-
 .../x11r7/xproto_recordproto/xproto_recordproto.mk |    2 +-
 .../x11r7/xproto_renderproto/xproto_renderproto.mk |    4 ++--
 .../xproto_resourceproto/xproto_resourceproto.mk   |    2 +-
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |    2 +-
 .../x11r7/xproto_videoproto/xproto_videoproto.mk   |    2 +-
 .../xproto_windowswmproto/xproto_windowswmproto.mk |    2 +-
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |    4 ++--
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    4 ++--
 .../xproto_xf86bigfontproto.mk                     |    4 ++--
 .../xproto_xf86dgaproto/xproto_xf86dgaproto.mk     |    2 +-
 .../xproto_xf86driproto/xproto_xf86driproto.mk     |    2 +-
 .../xproto_xf86rushproto/xproto_xf86rushproto.mk   |    2 +-
 .../xproto_xf86vidmodeproto.mk                     |    2 +-
 .../xproto_xineramaproto/xproto_xineramaproto.mk   |    2 +-
 package/x11r7/xproto_xproto/xproto_xproto.mk       |    4 ++--
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    4 ++--
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    4 ++--
 package/x11vnc/x11vnc.mk                           |    2 +-
 package/xavante/xavante.mk                         |    2 +-
 package/xenomai/xenomai.mk                         |    2 +-
 package/xerces/xerces.mk                           |    2 +-
 package/xfsprogs/xfsprogs.mk                       |    2 +-
 package/xl2tp/xl2tp.mk                             |    2 +-
 package/xmlstarlet/xmlstarlet.mk                   |    2 +-
 package/xstroke/xstroke.mk                         |    2 +-
 package/xterm/xterm.mk                             |    2 +-
 package/xvkbd/xvkbd.mk                             |    2 +-
 package/xz/xz.mk                                   |    4 ++--
 package/yajl/yajl.mk                               |    2 +-
 package/zeromq/zeromq.mk                           |    2 +-
 package/zlib/zlib.mk                               |    4 ++--
 support/scripts/pkg-stats                          |   12 +++++-----
 804 files changed, 940 insertions(+), 957 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 5592d37..b0eaa1e 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -38,7 +38,7 @@ define AT91BOOTSTRAP_INSTALL_IMAGES_CMDS
 	cp $(@D)/$(AT91BOOTSTRAP_BINARY) $(BINARIES_DIR)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
 # we NEED a board name unless we're at make source
diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index 6c0188a..c1faf9b 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -19,4 +19,4 @@ define AT91DATAFLASHBOOT_INSTALL_IMAGES_CMDS
 	cp $(@D)/DataflashBoot-$(AT91DATAFLASHBOOT_VERSION).bin $(BINARIES_DIR)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 0cbe641..867e5a6 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -72,7 +72,7 @@ define BAREBOX_INSTALL_TARGET_CMDS
 endef
 endif
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
 
 ifeq ($(BR2_TARGET_BAREBOX),y)
 # we NEED a board defconfig file unless we're at make source
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 1b5ca0d..b6e1f7e 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -82,4 +82,4 @@ define GRUB_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/boot/grub
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/boot/lpc32xxcdl/lpc32xxcdl.mk b/boot/lpc32xxcdl/lpc32xxcdl.mk
index d11be6c..897e975 100644
--- a/boot/lpc32xxcdl/lpc32xxcdl.mk
+++ b/boot/lpc32xxcdl/lpc32xxcdl.mk
@@ -67,4 +67,4 @@ define LPC32XXCDL_INSTALL_IMAGES_CMDS
 	cp $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_S1L)/*gnu.bin $(BINARIES_DIR)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 3e89bdf..842dc32 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -39,5 +39,5 @@ define HOST_SYSLINUX_CLEAN_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 3119092..d36284a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -94,7 +94,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
 		cp -dpf $(@D)/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
 # we NEED a board name unless we're at make source
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index e8dd380..d770a28 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -19,7 +19,7 @@ define XLOADER_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/MLO $(BINARIES_DIR)/
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
 
 #############################################################
 #
diff --git a/docs/manual/adding-packages-autotargets.txt b/docs/manual/adding-packages-autotargets.txt
index 428a182..c9c3750 100644
--- a/docs/manual/adding-packages-autotargets.txt
+++ b/docs/manual/adding-packages-autotargets.txt
@@ -23,7 +23,7 @@ package, with an example :
 11: LIBFOO_CONF_OPT = --enable-shared
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
 13:
-14: $(eval $(call AUTOTARGETS))
+14: $(eval $(AUTOTARGETS))
 ------------------------
 
 On line 6, we declare the version of the package.
@@ -71,7 +71,7 @@ The main macro of the autotools package infrastructure is
 same semantic as the +GENTARGETS+ macro, which is the main
 macro of the generic package infrastructure. For autotools packages, the
 ability to have target and host packages is also available (and is
-actually widely used).
+actually widely used) using the +AUTOTARGETS_HOST+ macro.
 
 Just like the generic infrastructure, the autotools infrastructure
 works by defining a number of variables before calling the
diff --git a/docs/manual/adding-packages-cmaketargets.txt b/docs/manual/adding-packages-cmaketargets.txt
index 3e400ec..296efb7 100644
--- a/docs/manual/adding-packages-cmaketargets.txt
+++ b/docs/manual/adding-packages-cmaketargets.txt
@@ -23,7 +23,7 @@ with an example :
 11: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
 13:
-14: $(eval $(call CMAKETARGETS))
+14: $(eval $(CMAKETARGETS))
 ------------------------
 
 On line 6, we declare the version of the package.
@@ -69,7 +69,8 @@ The main macro of the CMake package infrastructure is
 +CMAKETARGETS+. It has the same number of arguments and the same
 semantic as the +GENTARGETS+ macro, which is the main macro of the
 generic package infrastructure. For CMake packages, the ability to
-have target and host packages is also available.
+have target and host packages is also available, with the
++CMAKETARGETS_HOST+ macro.
 
 Just like the generic infrastructure, the CMake infrastructure works
 by defining a number of variables before calling the +CMAKETARGETS+
diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index cfcee8c..b1b1355 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -46,7 +46,7 @@ system is based on hand-written Makefiles or shell scripts.
 32: 	/bin/foo  f  4755  0  0  -  -  -  -  -
 33: endef
 34:
-35: $(eval $(call GENTARGETS))
+35: $(eval $(GENTARGETS))
 --------------------------------
 
 The Makefile begins on line 6 to 8 with metadata information: the
@@ -92,19 +92,16 @@ Makefile code necessary to make your package working.
 +GENTARGETS+ Reference
 ~~~~~~~~~~~~~~~~~~~~~~
 
-The +GENTARGETS+ macro takes one optional argument. This argument can
-be used to tell if the package is a target package (cross-compiled for
-the target) or a host package (natively compiled for the host). If
-unspecified, it is assumed that it is a target package. See below for
-details.
-
-For a given package, in a single +.mk+ file, it is possible to call
-GENTARGETS twice, once to create the rules to generate a target
+There are two variants of the generic target. The +GENTARGETS+ macro is
+used for packages to be cross-compiled for the target.  The
++GENTARGETS_HOST+ macro is used for host packages, natively compiled
+for the host.  It is possible to call both of them in a single +.mk+
+file: once to create the rules to generate a target
 package and once to create the rules to generate a host package:
 
 ----------------------
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
 ----------------------
 
 This might be useful if the compilation of the target package requires
@@ -115,12 +112,12 @@ some tools to be installed on the host. If the package name is
 variables of other packages, if they depend on +libfoo+ or
 +host-libfoo+.
 
-The call to the +GENTARGETS+ macro *must* be at the end of the +.mk+
-file, after all variable definitions.
+The call to the +GENTARGETS+ and/or +GENTARGETS_HOST+ macro *must* be
+at the end of the +.mk+ file, after all variable definitions.
 
 For the target package, the +GENTARGETS+ uses the variables defined by
 the .mk file and prefixed by the uppercased package name:
-+LIBFOO_*+. For the host package, it uses the +HOST_LIBFOO_*+. For
++LIBFOO_*+. +GENTARGETS_HOST+ uses the +HOST_LIBFOO_*+ variables. For
 'some' variables, if the +HOST_LIBFOO_+ prefixed variable doesn't
 exist, the package infrastructure uses the corresponding variable
 prefixed by +LIBFOO_+. This is done for variables that are likely to
diff --git a/linux/linux.mk b/linux/linux.mk
index 34f8623..d4a45c1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -201,7 +201,7 @@ endef
 
 include linux/linux-ext-*.mk
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
 
 ifeq ($(BR2_LINUX_KERNEL),y)
 linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs linux-configure
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 48db8ae..fcc37ce 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -25,4 +25,4 @@ ACL_INSTALL_TARGET_OPT = 			\
 	exec_prefix=$(TARGET_DIR)/usr 		\
 	install install-lib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 317cb16..fc71551 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -30,4 +30,4 @@ define ACPID_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 2d27c96..2308581 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -83,4 +83,4 @@ define ALSA_LIB_UNINSTALL_STAGING_CMDS
 	-rm -rf $(STAGING_DIR)/usr/share/alsa
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index e8c8dda..6b74c2d 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -14,5 +14,5 @@ ALSAMIXERGUI_CONF_ENV = ac_cv_lib_fltk_numericsort=yes \
 
 ALSAMIXERGUI_DEPENDENCIES = fltk alsa-lib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 564b1bb..1bf4e92 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -10,4 +10,4 @@ APR_UTIL_DEPENDENCIES = apr sqlite neon zlib
 APR_UTIL_CONF_OPT = \
 	--with-apr=$(BUILD_DIR)/apr-$(APR_VERSION) \
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 3158913..d84d243 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -15,4 +15,4 @@ APR_CONF_ENV = \
 	ac_cv_sizeof_struct_iovec=8 \
 	apr_cv_mutex_recursive=yes
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index ac0890d..4975f89 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -18,4 +18,4 @@ define ARGP_STANDALONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/argp.h $(TARGET_DIR)/usr/include/argp.h
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index ac07db2..f4b5196 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -17,4 +17,4 @@ endef
 
 ARGUS_POST_PATCH_HOOKS += ARGUS_DEBIAN_PATCH_APPLY
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/at/at.mk b/package/at/at.mk
index c9d503a..35fa251 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -38,4 +38,4 @@ define AT_UNINSTALL_TARGET_CMDS
 		at.1 atq.1 atrm.1 batch.1 at_allow.5 at_deny.5 atd.8 atrun.8)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 4ac96ff..5551c75 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -54,5 +54,5 @@ ATK_DEPENDENCIES = libglib2 host-pkg-config
 HOST_ATK_CONF_OPT = \
 		--disable-glibtest
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index beecb31..cb3794a 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -24,4 +24,4 @@ ATTR_INSTALL_TARGET_OPT = 			\
 	exec_prefix=$(TARGET_DIR)/usr 		\
 	install install-lib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index a49cc3e..3396d2d 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -16,4 +16,4 @@ endef
 
 AUDIOFILE_POST_PATCH_HOOKS += AUDIOFILE_DISABLE_EXAMPLES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 7c42bf9..77bab2d 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -17,8 +17,8 @@ HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 # variables used by other packages
 AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 7f35f3f..b463a88 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -23,8 +23,8 @@ endef
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 # variables used by other packages
 AUTOMAKE = $(HOST_DIR)/usr/bin/automake
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 32e3df7..b9e51db 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -163,4 +163,4 @@ ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_DAEMON_INITSCRIPT
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 91f6d1e..5036d8b 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -44,4 +44,4 @@ define AXEL_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 44f9337..f4c5ea8 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -39,4 +39,4 @@ define BASH_UNINSTALL_TARGET_CMDS
 	fi
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index a0187ce..9e34c46 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -26,4 +26,4 @@ endef
 BEECRYPT_POST_CONFIGURE_HOOKS += BEECRYPT_LINK_WITH_CC
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index d737896..274cfa9 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -56,4 +56,4 @@ BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
 
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 987bd4e..0640de4 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -63,4 +63,4 @@ define BIND_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S81named
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0a5a948..33f69a7 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -56,5 +56,5 @@ define BINUTILS_INSTALL_TARGET_CMDS
 endef
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index a1de39a..70df442 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -16,5 +16,5 @@ endef
 
 BISON_POST_CONFIGURE_HOOKS += BISON_DISABLE_EXAMPLES
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index 600ba6c..37256cc 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -17,4 +17,4 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 BLACKBOX_DEPENDENCIES += libiconv
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index eb42e23..6646fed 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -45,4 +45,4 @@ BLUEZ_UTILS_CONF_OPT +=	\
 	--disable-usb
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 98c0ab7..c87d3c1 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -29,4 +29,4 @@ define BMON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/bmon
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index c09e87f..34982e9 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -25,4 +25,4 @@ define BOA_UNINSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/mime.types $(TARGET_DIR)/etc/boa
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index 2251ebc..8cea08b 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -15,4 +15,4 @@ define BONNIE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/bonnie++ $(TARGET_DIR)/usr/sbin/zcav
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 3667964..091fef4 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -85,4 +85,4 @@ define BOOST_INSTALL_STAGING_CMDS
 	--layout=system install)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index 35df95b..6c887e4 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -8,4 +8,4 @@ BOOTUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge
 
 BOOTUTILS_CONF_OPT = --prefix=/ --exec-prefix=/
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index 7e942ef..6e750aa 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -15,4 +15,4 @@ define BRIDGE_UTILS_UNINSTALL_TARGET_CMDS
 		include/libbridge.h share/man/man8/brctl.8 sbin/brctl)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 66a7722..97d0c29 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -28,4 +28,4 @@ define BSDIFF_CLEAN_CMDS
 	rm -f $(@D)/bsdiff $(@D)/bspatch
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1d988f8..39592c9 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -197,7 +197,7 @@ define BUSYBOX_CLEAN_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
 
 busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index 618a61f..a16160e 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -13,4 +13,4 @@ BWM_NG_CONF_OPT += --with-ncurses
 BWM_NG_DEPENDENCIES += ncurses
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 1bc4449..2d84565 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -102,5 +102,5 @@ define HOST_BZIP2_INSTALL_CMDS
 	$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 55068dd..2e2b08e 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -77,4 +77,4 @@ else
 	CAIRO_CONF_OPT += --disable-svg
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 5039043..2c90c67 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -8,4 +8,4 @@ CAN_UTILS_VERSION = 50775159276d896d8b3102b6dbc658a91a2a1d53
 CAN_UTILS_SITE = git://gitorious.org/linux-can/can-utils.git
 CAN_UTILS_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index f71376e..8d07f22 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -42,8 +42,8 @@ endef
 HOST_CCACHE_POST_CONFIGURE_HOOKS += \
 	HOST_CCACHE_FIX_CCACHE_DIR
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 ifeq ($(BR2_CCACHE),y)
 ccache-stats: host-ccache
diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index a060b03..6f14309 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -23,5 +23,5 @@ CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)"
 HOST_CDRKIT_CONF_OPT += -DCMAKE_C_FLAGS="-I$(HOST_DIR)/usr/include"
 HOST_CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)"
 
-$(eval $(call CMAKETARGETS))
-$(eval $(call CMAKETARGETS,host))
+$(eval $(CMAKETARGETS))
+$(eval $(CMAKETARGETS_HOST))
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index d46c2a6..6efca25 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -17,4 +17,4 @@ define CGILUA_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/lua/cgilua.lua"
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 0fdb689..b7d2edd 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -8,4 +8,4 @@ endef
 
 CIFS_UTILS_POST_PATCH_HOOKS += CIFS_UTILS_NO_WERROR
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 52567dd..f59ef0f 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -14,5 +14,5 @@ define HOST_CLOOP_INSTALL_CMDS
 	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/usr/bin
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index af88eea..0b20ffa 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -17,5 +17,5 @@ define HOST_CMAKE_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 6b9bbe6..caa9f2d 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -36,4 +36,4 @@ endef
 CONNMAN_POST_INSTALL_TARGET_HOOKS += CONNMAN_INSTALL_CM
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 8b41127..a1538ad 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -9,4 +9,4 @@ CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkg-config libnetfilter_conntrack
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 28b822c..84182d4 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -17,4 +17,4 @@ define COPAS_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/lua/copas.lua"
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index b2cca39..f26957d 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -81,4 +81,4 @@ COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_POST_INSTALL
 # If both coreutils and busybox are selected, the corresponding applets
 # may need to be reinstated by the clean targets.
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 81125d7..d3ba048 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -17,4 +17,4 @@ define COXPCALL_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/lua/coxpcall.lua"
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 57dbe40..f5a4a74 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -28,5 +28,5 @@ define HOST_CRAMFS_INSTALL_CMDS
  install -D -m 755 $(@D)/cramfsck $(HOST_DIR)/usr/bin/cramfsck
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 3540f70..0a04af6 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -5,4 +5,4 @@ CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
 HOST_CROSSTOOL_NG_DEPENDENCIES = $(if $(BR2_CCACHE),host-ccache) host-gawk host-automake
 
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index f086447..608591f 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -14,4 +14,4 @@ else
 CTORRENT_CONF_OPT+=--with-ssl=no
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index f06502a..7c63779 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -69,4 +69,4 @@ endef
 
 CUPS_POST_INSTALL_STAGING_HOOKS += CUPS_FIXUP_CUPS_CONFIG
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index b3074b0..dca8091 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -48,6 +48,6 @@ define CVS_INSTALL_TARGET_CMDS
 	install -D $(@D)/src/cvs $(TARGET_DIR)/usr/bin/cvs
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
 
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 26c6431..188c42f 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -18,4 +18,4 @@ define DASH_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/bin/dash
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 397996e..4c976ee 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -32,8 +32,8 @@ HOST_DBUS_GLIB_CONF_OPT = \
 		--disable-doxygen-docs \
 		--enable-asserts=yes
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 # dbus-glib for the host
 DBUS_GLIB_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-binding-tool
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 83e3aee..bc559c7 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -20,4 +20,4 @@ DBUS_PYTHON_CONF_OPT = --disable-html-docs --disable-api-docs
 
 DBUS_PYTHON_DEPENDENCIES = dbus-glib python host-python
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7e72e3d..024a073 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -87,5 +87,5 @@ HOST_DBUS_GEN_INTROSPECT = \
 
 HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index f477589..6b07ea4 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -28,4 +28,4 @@ define DEVMEM2_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/devmem2
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 9ec27d3..a21fd4c 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -61,4 +61,4 @@ define DHCP_INSTALL_TARGET_CMDS
 	$(DHCP_INSTALL_CLIENT)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index dd454bf..d8df6f0 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -18,4 +18,4 @@ define DHCPDUMP_INSTALL_TARGET_CMDS
 	install -m 0755 -D $(@D)/dhcpdump $(TARGET_DIR)/usr/bin/dhcpdump
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index 098b9f1..cca921f 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -29,4 +29,4 @@ define DHRYSTONE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/dhrystone
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 175ed93..6b6200b 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -24,4 +24,4 @@ define DIALOG_POST_CLEAN
 	rm -f $(TARGET_DIR)/usr/bin/dialog
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 6d1896a..4fbe75a 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -14,4 +14,4 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 DIFFUTILS_DEPENDENCIES += busybox
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index d8e61f7..f976ad5 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -100,5 +100,5 @@ define DIRECTFB_EXAMPLES_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 7aa0398..ea1d73b 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -141,8 +141,8 @@ endef
 
 DIRECTFB_POST_INSTALL_STAGING_HOOKS += DIRECTFB_STAGING_CONFIG_FIXUP
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 # directfb-csource for the host
 DIRECTFB_HOST_BINARY:=$(HOST_DIR)/usr/bin/directfb-csource
diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
index dc3b36b..bb278c7 100644
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -20,4 +20,4 @@ define DISTCC_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index 3e8d093..3b3e4ed 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -10,4 +10,4 @@ DIVINE_SOURCE = DiVine-$(DIVINE_VERSION).tar.gz
 DIVINE_INSTALL_STAGING = YES
 DIVINE_DEPENDENCIES = directfb
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 89d067d..1a558e6 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -55,4 +55,4 @@ define DMALLOC_CLEAN_CMDS
 endef
 
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 7763aaa..eea2212 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -26,4 +26,4 @@ define DMRAID_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 2e3575c..f0d2125 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -97,4 +97,4 @@ define DNSMASQ_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/dnsmasq.8
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index fd12cce..2b61818 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -18,4 +18,4 @@ DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 
 DOCKER_DEPENDENCIES = host-pkg-config libglib2 xserver_xorg-server
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 7a8a7e8..b474e13 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -34,4 +34,4 @@ define DOSFSTOOLS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index fea96d6..9c78abb 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -69,4 +69,4 @@ define DROPBEAR_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S50dropbear
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
index b9fed0b..ed37581 100644
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -15,4 +15,4 @@ define DSP_TOOLS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/dsp-, load probe test exec)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index a19d1d4..3ba136a 100644
--- a/package/dstat/dstat.mk
+++ b/package/dstat/dstat.mk
@@ -12,4 +12,4 @@ define DSTAT_INSTALL_TARGET_CMDS
        $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 5f87b40..5b23666 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -103,5 +103,5 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
 E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FINDFS_SYMLINK
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index ddda985..791de94 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -28,4 +28,4 @@ define EBTABLES_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/ebtables
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index f5a4b22..b8685a3 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -9,4 +9,4 @@ ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index 40b059e..2011ce3 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -19,4 +19,4 @@ define EEPROG_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/eeprog
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
index 4c01190..1df4ef3 100644
--- a/package/efl/expedite/expedite.mk
+++ b/package/efl/expedite/expedite.mk
@@ -8,4 +8,4 @@ EXPEDITE_VERSION = 1.1.0
 EXPEDITE_SITE = http://download.enlightenment.org/releases/
 EXPEDITE_DEPENDENCIES = libevas libeina libeet
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index d5d2896..d82f930 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -98,5 +98,5 @@ else
 LIBECORE_CONF_OPT += --disable-ecore-evas
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index c03474d..babe62d 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -31,4 +31,4 @@ else
 LIBEDBUS_CONF_OPT += --disable-enotify
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index 5252d6e..65b45e0 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -20,5 +20,5 @@ endif
 
 HOST_LIBEDJE_CONF_OPT = --enable-edje-cc
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index f9af219..cf61588 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -11,5 +11,5 @@ LIBEET_INSTALL_STAGING = YES
 
 LIBEET_DEPENDENCIES = host-pkg-config zlib jpeg libeina
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
index 14fb8cb..1a24e11 100644
--- a/package/efl/libefreet/libefreet.mk
+++ b/package/efl/libefreet/libefreet.mk
@@ -11,4 +11,4 @@ LIBEFREET_INSTALL_STAGING = YES
 
 LIBEFREET_DEPENDENCIES = libeina libeet libecore
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index b457e3f..ccb6292 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -11,5 +11,5 @@ LIBEINA_INSTALL_STAGING = YES
 
 LIBEINA_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 475fd45..3ed2a79 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -15,4 +15,4 @@ LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
 LIBELEMENTARY_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index 0054ff4..38a4fd5 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -11,5 +11,5 @@ LIBEMBRYO_INSTALL_STAGING = YES
 
 LIBEMBRYO_DEPENDENCIES = host-pkg-config libeina
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index 617de0d..3b50783 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -21,4 +21,4 @@ ifeq ($(BR2_PACKAGE_LIBEDBUS),y)
 LIBETHUMB_DEPENDENCIES += libedbus
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index e716cea..0f20c83 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -212,5 +212,5 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 LIBEVAS_CONF_OPT += --disable-doc
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 137e196..961c703 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -15,4 +15,4 @@ define EMPTY_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/empty $(TARGET_DIR)/usr/bin/empty
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 9d7ae0e..ca456a0 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -9,4 +9,4 @@ ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
 ENCHANT_DEPENDENCIES = libglib2 host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 101d0a1..9682a3a 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -7,4 +7,4 @@
 ETHTOOL_VERSION = 3.2
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index ea008db..b540e99 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -11,5 +11,5 @@ EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
 EXPAT_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
index 93dcb1f..6193a7a 100644
--- a/package/explorercanvas/explorercanvas.mk
+++ b/package/explorercanvas/explorercanvas.mk
@@ -15,4 +15,4 @@ define EXPLORERCANVAS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/var/www/excanvas.js
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 321e466..e87bb21 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -37,4 +37,4 @@ define EZXML_CLEAN_CMDS
 	-$(MAKE) -C $(@D) -f GNUmakefile clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 64203b8..9e34478 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -7,4 +7,4 @@ FAKEROOT_VERSION = 1.18.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
 FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20111201T093630Z/pool/main/f/fakeroot/
 
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index eca432e..e2c13e6 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -7,5 +7,5 @@ FBDUMP_VERSION:=0.4.2
 FBDUMP_SOURCE:=fbdump-$(FBDUMP_VERSION).tar.gz
 FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 892043e..78cb3d4 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -15,4 +15,4 @@ define FBGRAB_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/fbgrab
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 95d8aa7..aea463d 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -29,4 +29,4 @@ define FBSET_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 855a0d4..4bcbe81 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -33,4 +33,4 @@ define FBV_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 8144a16..5678298 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -25,4 +25,4 @@ define FCONFIG_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 4f326ef..6fe3170 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -18,4 +18,4 @@ define FEH_UNINSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index f9d0fba..7a184b1 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -8,4 +8,4 @@ FFTW_VERSION = 3.3
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/file/file.mk b/package/file/file.mk
index c9846e4..8bf85af 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -15,5 +15,5 @@ define FILE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
 endef
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 7c9e596..b42a203 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -9,4 +9,4 @@ FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_CONF_ENV = gl_cv_func_stdin=yes \
 			gl_cv_func_wcwidth_works=yes
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index d2cd196..d7ef470 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -21,4 +21,4 @@ define FIS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/fis
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 041aba8..f29dda3 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -43,5 +43,5 @@ FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LIBFL
 FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LIBFL
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
index 8b51b55..2a766da 100644
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -20,4 +20,4 @@ define FLOT_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/var/www/jquery.flot*
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 1686a58..8409dc7 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -13,4 +13,4 @@ FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_CONF_OPT = --enable-threads --with-x
 FLTK_DEPENDENCIES = xserver_xorg-server xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 5848606..f64f41e 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -20,4 +20,4 @@ endef
 
 FLUXBOX_POST_INSTALL_TARGET_HOOKS += FLUXBOX_INSTALL_XSESSION_FILE
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
index f705173..62a5de7 100644
--- a/package/fmtools/fmtools.mk
+++ b/package/fmtools/fmtools.mk
@@ -16,4 +16,4 @@ define FMTOOLS_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/fmscan $(TARGET_DIR)/usr/sbin/fmscan
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 329f819..3cba7ee 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -25,5 +25,5 @@ HOST_FONTCONFIG_CONF_OPT = \
 		--disable-docs \
 		--disable-static
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index ded10d2..8a3e110 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -33,5 +33,5 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 FREETYPE_POST_INSTALL_TARGET_HOOKS += FREETYPE_FREETYPE_CONFIG_TARGET_REMOVE
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 46bfd24..afac118 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -29,4 +29,4 @@ define GADGETFS_TEST_CLEAN_CMDS
 	-$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/games/doom-wad/doom-wad.mk b/package/games/doom-wad/doom-wad.mk
index 1143b3d..3214cc2 100644
--- a/package/games/doom-wad/doom-wad.mk
+++ b/package/games/doom-wad/doom-wad.mk
@@ -21,4 +21,4 @@ define DOOM_WAD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/games/doom/doom1.wad
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/games/gnuchess/gnuchess.mk b/package/games/gnuchess/gnuchess.mk
index a627844..e1b52f9 100644
--- a/package/games/gnuchess/gnuchess.mk
+++ b/package/games/gnuchess/gnuchess.mk
@@ -9,5 +9,5 @@ GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 
 GNUCHESS_DEPENDENCIES = $(if $(BR2_PACKAGE_READLINE),readline)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/games/prboom/prboom.mk b/package/games/prboom/prboom.mk
index 9ffecee..8fa4dd1 100644
--- a/package/games/prboom/prboom.mk
+++ b/package/games/prboom/prboom.mk
@@ -41,4 +41,4 @@ define PRBOOM_UINSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/games/prboom
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/games/rubix/rubix.mk b/package/games/rubix/rubix.mk
index a66e6e1..f35a100 100644
--- a/package/games/rubix/rubix.mk
+++ b/package/games/rubix/rubix.mk
@@ -12,5 +12,5 @@ RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB=
 
 RUBIX_DEPENDENCIES = xserver_xorg-server
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index 5858138..a6564dc 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -22,5 +22,5 @@ endif
 
 GAMIN_DEPENDENCIES = libglib2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 8f374cb..95ec437 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -30,5 +30,5 @@ define GAWK_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/awk
 endef
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
index a53ee83..378c21c 100644
--- a/package/gdisk/gdisk.mk
+++ b/package/gdisk/gdisk.mk
@@ -36,4 +36,4 @@ endef
 
 endif
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 8dc1c47..62d13d1 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -46,7 +46,7 @@ endef
 
 GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_POST_INSTALL_TWEAKS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
 HOST_GDK_PIXBUF_CONF_OPT = \
 	--without-libjpeg \
@@ -54,4 +54,4 @@ HOST_GDK_PIXBUF_CONF_OPT = \
 
 HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng
 
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index 1863cf1..bac732d 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -8,5 +8,5 @@ GENEXT2FS_VERSION=1.4.1
 GENEXT2FS_SOURCE=genext2fs-$(GENEXT2FS_VERSION).tar.gz
 GENEXT2FS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/genext2fs
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index d6f4875..3bddd40 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -27,5 +27,5 @@ define HOST_GENROMFS_INSTALL_CMDS
   $(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
\ No newline at end of file
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
\ No newline at end of file
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 75012ea..6d4727c 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -13,4 +13,4 @@ GIBLIB_AUTORECONF_OPT = --install
 GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
 		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 9165835..a16a6d7 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -25,4 +25,4 @@ else
 GLIB_NETWORKING_CONF_OPT += --without-gnutls
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 7899b71..c7253d4 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -14,5 +14,5 @@ ifeq ($(ARCH),arm)
 GMP_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 1db5346..7a9f1ba 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -13,4 +13,4 @@ GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkg-config host-vala \
 	xlib_libICE xlib_libSM xlib_libX11 \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index ce570d5..95810e2 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -12,4 +12,4 @@ GNUTLS_CONF_OPT = --with-libgcrypt --with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 		--without-p11-kit
 GNUTLS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index c557288..be72ec1 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -9,8 +9,8 @@ GOB2_SITE = http://ftp.5z.com/pub/gob
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config host-flex
 HOST_GOB2_DEPENDENCIES = host-libglib2
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 # gob2 for the host
 GOB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/gob2
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index faea978..2c4efa3 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -7,5 +7,5 @@
 GPERF_VERSION = 3.0.4
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 94f39aa..b847ccd 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -182,4 +182,4 @@ define GPSD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index b87ad76..802e6f2 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -8,5 +8,5 @@ GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
 GQVIEW_DEPENDENCIES = host-pkg-config libgtk2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index aa22910..6dd448e 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -21,4 +21,4 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 GREP_DEPENDENCIES += busybox
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index b8694ad..8008bb5 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -83,4 +83,4 @@ GTK2_ENGINES_CONF_OPT = \
 		--disable-paranoia \
 		--disable-deprecated
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index 055205c..e4de622 100644
--- a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
+++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
@@ -9,4 +9,4 @@ GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases/
 
 GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index 5459e69..e6a2397 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -8,5 +8,5 @@ GTKPERF_SOURCE:=gtkperf_$(GTKPERF_VERSION).tar.gz
 GTKPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gtkperf
 GTKPERF_DEPENDENCIES = libgtk2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index f56c14a..17d6d1a 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -76,4 +76,4 @@ GVFS_POST_INSTALL_TARGET_HOOKS += \
 	GVFS_REMOVE_TARGET_SCHEMAS	\
 	GVFS_COMPILE_SCHEMAS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index f712f98..efb2c29 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -7,4 +7,4 @@ GZIP_VERSION:=1.4
 GZIP_SOURCE:=gzip-$(GZIP_VERSION).tar.gz
 GZIP_SITE:=$(BR2_GNU_MIRROR)/gzip
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index dfe4cf0..3d3d847 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -21,4 +21,4 @@ endef
 
 HASERL_POST_INSTALL_TARGET_HOOKS += HASERL_REMOVE_EXAMPLES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index fb90ce2..0866ac4 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -33,4 +33,4 @@ define HDPARM_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index 2b28a3f..4ec4a97 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -25,4 +25,4 @@ define HEIRLOOM_MAILX_INSTALL_TARGET_CMDS
 		install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index aa245f3..691d9d3 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -10,4 +10,4 @@ HIAWATHA_CONF_OPT += \
 	-DENABLE_TOOLKIT=OFF \
 	-DENABLE_XSLT=OFF
 
-$(eval $(call CMAKETARGETS))
+$(eval $(CMAKETARGETS))
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 26ebf1d..8d6baab 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -108,4 +108,4 @@ define HOSTAPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/hostapd
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 07b750c..d7a84df 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -11,4 +11,4 @@ HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
 HTOP_CONF_OPT += --disable-unicode
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index e4f72a5..d8a265f 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -18,4 +18,4 @@ define HWDATA_UNINSTALL_TARGET_CMDS
 	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index aeabf02..3347c3f 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -19,4 +19,4 @@ define I2C_TOOLS_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index d4c220b..2093070 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -25,5 +25,5 @@ endef
 
 ICU_POST_INSTALL_TARGET_HOOKS += ICU_PREFIX_FIXUP
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index cb06b63..932bbb9 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -33,4 +33,4 @@ endef
 
 IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index b6ac5b8..1f0e338 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -38,4 +38,4 @@ endef
 
 IGH_ETHERCAT_POST_INSTALL_TARGET_HOOKS += IGH_ETHERCAT_INSTALL_MODULES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 602b7a5..5adfdde 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -115,4 +115,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 IMAGEMAGICK_POST_INSTALL_TARGET_HOOKS += IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index f32b865..eacf857 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -60,5 +60,5 @@ endef
 
 IMLIB2_POST_INSTALL_STAGING_HOOKS += IMLIB2_FIXUP_IMLIB2_CONFIG
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index ad47909..5cc2b1e 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -5,4 +5,4 @@
 #############################################################
 INOTIFY_TOOLS_VERSION = 3.14
 INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index a938ae7..af5394a 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -33,4 +33,4 @@ define INPUT_EVENT_DAEMON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/input-event-daemon.conf
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index 38db2ea..e9f6b57 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -45,4 +45,4 @@ define INPUT_TOOLS_CLEAN_CMDS
 	rm -f $(addprefix $(@D)/,$(INPUT_TOOLS_TARGETS_y))
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 6d13cc1..eb05d3e 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -12,6 +12,6 @@ HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
 HOST_INTLTOOL_CONF_OPT = \
   PERLLIB=$(HOST_DIR)/usr/lib/perl
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 83eea07..b1f3075 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -28,4 +28,4 @@ define IOSTAT_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/iostat.8
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 26cd3fb..f70ee8b 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -16,4 +16,4 @@ IPERF_CONF_OPT = \
 	--disable-dependency-tracking \
 	--disable-web100
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index ecb97b6..c863253 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -9,4 +9,4 @@ IPKG_SOURCE = ipkg-$(IPKG_VERSION).tar.gz
 IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
 IPKG_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index ee5c04a..1a8338e 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -52,4 +52,4 @@ define IPROUTE2_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/sbin/, $(IPROUTE2_TARGET_SBINS))
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index f24e4a4..047fb06 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -66,4 +66,4 @@ ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_KERNEL),y)
 IPSEC_TOOLS_CONF_OPT+= --enable-security-context=kernel
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 06393f4..cd065f4 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -11,4 +11,4 @@ IPSET_AUTORECONF = YES
 IPSET_DEPENDENCIES = libmnl host-pkg-config
 IPSET_CONF_OPT = --with-kmod=no
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 87578d5..f4d43f7 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -43,4 +43,4 @@ define IPTABLES_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/xtables
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index cbc6886..48cdbbc 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -43,4 +43,4 @@ define IRDA_UTILS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(IRDA_UTILS_SBINS-))
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 5cd40a3..076d89f 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -32,4 +32,4 @@ define IW_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/iw.8*
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index a652381..017ed8c 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -14,5 +14,5 @@ endef
 
 JPEG_POST_INSTALL_TARGET_HOOKS += JPEG_REMOVE_USELESS_TOOLS
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index d0b478a..eeb95fc 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -15,4 +15,4 @@ define JQUERY_SPARKLINE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/var/www/jquery.sparkline.js
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 5fee4c1..b862805 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -15,4 +15,4 @@ define JQUERY_VALIDATION_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/var/www/jquery.validate.js
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 08dd4a3..0f1f852 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -15,4 +15,4 @@ define JQUERY_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/var/www/jquery.js
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index 491bb3e..0161b60 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -21,5 +21,5 @@ define HOST_JSMIN_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/jsmin $(HOST_DIR)/usr/bin/jsmin
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 81a02b0..bc650a2 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -8,4 +8,4 @@ JSON_C_VERSION = 0.9
 JSON_C_SITE = http://oss.metaparadigm.com/json-c/
 JSON_C_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index af30e8e..92172ba 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,4 +4,4 @@ KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 
 KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index ef99dfb..a7aeaec 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -20,4 +20,4 @@ endef
 
 KEXEC_POST_INSTALL_TARGET_HOOKS += KEXEC_REMOVE_LIB_TOOLS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 854c9dd..c211c30 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -64,4 +64,4 @@ define KISMET_UNINSTALL_TARGET_CMDS
 	$(KISMET_UNINSTALL_TARGET_CONFIGS)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 1382901..c713abb 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -30,4 +30,4 @@ else
 KMOD_CONF_OPT += --disable-tools
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/latencytop/latencytop.mk b/package/latencytop/latencytop.mk
index 73d5ba2..77895d4 100644
--- a/package/latencytop/latencytop.mk
+++ b/package/latencytop/latencytop.mk
@@ -18,4 +18,4 @@ define LATENCYTOP_INSTALL_TARGET_CMDS
 	$(MAKE) install -C $(@D) DESTDIR=$(TARGET_DIR) HAS_GTK_GUI=
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 745b386..83aeaf4 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -11,4 +11,4 @@ LCDPROC_CONF_OPT = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS)
 
 LCDPROC_DEPENDENCIES = ncurses
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index 7e4d179..42eb08d 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -8,5 +8,5 @@ LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_DEPENDENCIES = libgtk2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/less/less.mk b/package/less/less.mk
index 5f74f5c..7dac259 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -16,4 +16,4 @@ define LESS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/less
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 05a4d5c..f6ef692 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -20,5 +20,5 @@ define LIBAIO_INSTALL_TARGET_CMDS
   $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
 
diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 617b1ee..9b23061 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -18,4 +18,4 @@ else
 LIBAO_CONF_OPT += --disable-alsa
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 087032d..d01515a 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -23,4 +23,4 @@ else
 LIBARCHIVE_CONF_OPT += --without-xml2
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index d192923..6857c79 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -14,4 +14,4 @@ LIBARGTABLE2_CONF_OPT= --disable-example \
 		--enable-lib \
 		--enable-util
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index a37095d..81fb037 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -10,4 +10,4 @@ LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index e0b19f4..513551c 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -9,4 +9,4 @@ LIBATOMIC_OPS_SOURCE = libatomic_ops-$(LIBATOMIC_OPS_VERSION).tar.gz
 LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/research/linux/atomic_ops/download
 LIBATOMIC_OPS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 4a52702..207999c 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -11,4 +11,4 @@ LIBCAP_NG_INSTALL_STAGING = YES
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPT = --without-python
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 4683121..2670996 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -38,5 +38,5 @@ define HOST_LIBCAP_INSTALL_CMDS
 		prefix=/usr lib=lib install
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index 8ceb87a..45799be 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -11,4 +11,4 @@ LIBCDAUDIO_AUTORECONF = YES
 LIBCDAUDIO_LIBTOOL_PATCH = YES
 LIBCDAUDIO_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 5a52fa6..8e04669 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -10,4 +10,4 @@ LIBCGI_INSTALL_STAGING = YES
 # use cross CC/AR rather than host
 LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)"
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 0ea63b5..3a88a7e 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -13,4 +13,4 @@ LIBCGICC_CONF_OPT = \
 	--disable-demos \
 	--disable-doc
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 8ef927b..261674e 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -11,4 +11,4 @@ ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBCONFIG_CONF_OPT = --disable-cxx
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index feababf..3146a08 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -9,4 +9,4 @@ LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPT = --disable-rpath
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index b815c0f..d82f2cb 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -10,4 +10,4 @@ LIBCUE_SOURCE = libcue-$(LIBCUE_VERSION).tar.bz2
 LIBCUE_DEPENDENCIES = flex
 LIBCUE_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libcuefile/libcuefile.mk b/package/libcuefile/libcuefile.mk
index 7e1c843..16cdf6f 100644
--- a/package/libcuefile/libcuefile.mk
+++ b/package/libcuefile/libcuefile.mk
@@ -20,4 +20,4 @@ endef
 LIBCUEFILE_POST_INSTALL_STAGING_HOOKS += LIBCUEFILE_INSTALL_STAGING_INCLUDES
 LIBCUEFILE_POST_INSTALL_TARGET_HOOKS += LIBCUEFILE_INSTALL_TARGET_INCLUDES
 
-$(eval $(call CMAKETARGETS))
+$(eval $(CMAKETARGETS))
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e094e31..d4f7a00 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -30,7 +30,7 @@ endef
 
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
 curl: libcurl
 curl-clean: libcurl-clean
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index c04537a..0704f9d 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -11,4 +11,4 @@ LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPT = --disable-lynx
 LIBDAEMON_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 495e59a..405ebe4 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -9,4 +9,4 @@ LIBDMTX_SOURCE = libdmtx-$(LIBDMTX_VERSION).tar.gz
 LIBDMTX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libdmtx
 LIBDMTX_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index f351d6b..f23fe9a 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -36,4 +36,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBDNET_POST_INSTALL_TARGET_HOOKS += LIBDNET_REMOVE_CONFIG_SCRIPT
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index e88a163..655be32 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -28,4 +28,4 @@ ifneq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI),y)
 LIBDRM_CONF_OPT += --disable-radeon
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 1c38904..bec9d78 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -16,4 +16,4 @@ LIBDVDNAV_DEPENDENCIES = libdvdread host-pkg-config
 # of cross compilation, we prefer using pkg-config.
 LIBDVDNAV_CONF_OPT = --with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 3a9d5be..55dbd4d 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -11,4 +11,4 @@ LIBDVDREAD_AUTORECONF = YES
 LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 4b778a9..bc92374 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -18,4 +18,4 @@ else
 LIBEXOSIP2_CONF_OPT += --disable-openssl
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index 13ad371..79139b2 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -18,4 +18,4 @@ LIBELF_CONF_OPT = --disable-sanity-checks \
 		$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug) \
 		$(if $(BR2_LARGEFILE),--enable-elf64)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 3686d55..d8f2c14 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -18,4 +18,4 @@ define LIBERATION_CLEAN_CMDS
 	rm -rf $(LIBERATION_TARGET_DIR)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index f9be7cc..33eac80 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -10,4 +10,4 @@ LIBESMTP_INSTALL_STAGING = YES
 
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 6656d15..2b4bbaa 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -8,4 +8,4 @@ LIBEV_SOURCE = libev-$(LIBEV_VERSION).tar.gz
 LIBEV_SITE = http://dist.schmorp.de/libev/
 LIBEV_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 733e29d..9460b88 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -18,4 +18,4 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 1832a7e..ec9334e 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -11,4 +11,4 @@ LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_CONF_OPT = --disable-docs
 LIBEXIF_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index 22ac2f1..0c8eaed 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -9,4 +9,4 @@ LIBFCGI_SITE = http://www.fastcgi.com/dist
 LIBFCGI_INSTALL_STAGING = YES
 LIBFCGI_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index adcd6f8..20b0a94 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -31,6 +31,6 @@ endef
 
 LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_MOVE_TARGET_HEADERS
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index d84fc32..5dc6494 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -20,5 +20,5 @@ else
 LIBFDTI_CONF_OPT += --disable-libftdipp
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 15c63ab..87b12e1 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -26,4 +26,4 @@ define LIBFUSE_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/lib/libfuse.so*
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index 3c42e6c..0af0ddb 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -17,4 +17,4 @@ endif
 
 LIBGAIL_DEPENDENCIES = host-pkg-config libgtk2 pango
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 68c6c47..7a14dd4 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -17,4 +17,4 @@ LIBGCRYPT_CONF_OPT = \
 
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index a704754..1c846e7 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -9,4 +9,4 @@ LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_DEPENDENCIES = tiff
 LIBGEOTIFF_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 1bb9d14..0840630 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -16,4 +16,4 @@ endef
 
 LIBGLADE_POST_INSTALL_TARGET_HOOKS += LIBGLADE_INSTALL_FIX
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d2445a1..3279e98 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -88,7 +88,7 @@ ifneq ($(BR2_PACKAGE_GDB),y)
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_GDB_FILES
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 LIBGLIB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/glib-genmarshal
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 1b78b17..9cd5488 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -8,4 +8,4 @@ LIBGPG_ERROR_VERSION = 1.10
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index b54743f..92f802f 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -151,5 +151,5 @@ define HOST_LIBGTK2_INSTALL_CMDS
  cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
 endef
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 8ad9ac1..09fc11b 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -18,4 +18,4 @@ LIBHID_CONF_OPT = \
 	--without-doxygen \
 	--disable-package-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index ee251eb..7923e5c 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -8,5 +8,5 @@ LIBICAL_VERSION = 0.48
 LIBICAL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
 LIBICAL_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 48a380f..5f012eb 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -20,7 +20,7 @@ endef
 LIBICONV_POST_INSTALL_TARGET_HOOKS += LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
 LIBICONV_POST_INSTALL_STAGING_HOOKS += LIBICONV_STAGING_REMOVE_PRELOADABLE_LIBS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
 # Configurations where the toolchain supports locales and the libiconv
 # package is enabled are incorrect, because the toolchain already
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index def2dbc..79f0c0d 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -11,4 +11,4 @@ LIBID3TAG_INSTALL_STAGING=YES
 LIBID3TAG_DEPENDENCIES=zlib
 LIBID3TAG_LIBTOOL_PATCH=NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 935240b..76ff94c 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -30,4 +30,4 @@ define LIBIDN_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/idn
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index 81e8421..d0a3d30 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -10,5 +10,5 @@ LIBIQRF_INSTALL_STAGING = YES
 
 LIBIQRF_DEPENDENCIES = libusb
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 7c8cd8a..48bd36f 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -29,4 +29,4 @@ define LIBLOCKFILE_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 6e53cf2..c262627 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -32,4 +32,4 @@ LIBMAD_CONF_OPT = \
 		--disable-debugging \
 		--enable-speed
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index 9abb2bf..2bfd487 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -12,4 +12,4 @@ LIBMBUS_INSTALL_STAGING = YES
 #   cannot find input file: `test/Makefile.in'
 LIBMBUS_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index ff2b55d..1c83f5a 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -16,4 +16,4 @@ else
 LIBMICROHTTPD_CONF_OPT += --disable-https
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index 45d1844..7df020e 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -11,4 +11,4 @@ LIBMMS_INSTALL_STAGING = YES
 
 LIBMMS_DEPENDENCIES = host-pkg-config libglib2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 407ca52..61fe4eb 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -9,4 +9,4 @@ LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 4dcfe23..dbd4401 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -8,4 +8,4 @@ LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
 LIBMODBUS_SOURCE = libmodbus-$(LIBMODBUS_VERSION).tar.gz
 LIBMODBUS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
index 9fd12f5..775feff 100644
--- a/package/libmpd/libmpd.mk
+++ b/package/libmpd/libmpd.mk
@@ -9,4 +9,4 @@ LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8.16
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_DEPENDENCIES = libglib2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index 5290af1..1918b0f 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -27,4 +27,4 @@ endef
 LIBMPEG2_POST_INSTALL_TARGET_HOOKS += LIBMPEG2_REMOVE_BINS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
index 66f0f69..be857ce 100644
--- a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
@@ -10,4 +10,4 @@ LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_con
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
 LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkg-config libnfnetlink
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
index 67ea266..f1989a1 100644
--- a/package/libnfnetlink/libnfnetlink.mk
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -9,4 +9,4 @@ LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
 LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
 LIBNFNETLINK_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 40aaf38..f31229a 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -15,4 +15,4 @@ define LIBNL_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/libnl
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 24b5370..1757d34 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -14,4 +14,4 @@ LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
 # NSPR mixes up --build and --host
 LIBNSPR_CONF_OPT = --host=$(GNU_HOST_NAME)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index ea6a329..20fcee8 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -64,4 +64,4 @@ define LIBNSS_CLEAN_CMDS
 					BUILD_OPT=1
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
index 8646947..ed937c4 100644
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -16,4 +16,4 @@ else
 LIBOAUTH_CONF_OPT += --disable-libcurl
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index c40f04e..87c2a58 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -10,4 +10,4 @@ LIBOGG_INSTALL_STAGING = YES
 
 LIBOGG_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 1d53f76..5526d8c 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -9,4 +9,4 @@ LIBOSIP2_SOURCE = libosip2-$(LIBOSIP2_VERSION).tar.gz
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 0b88a42..185837d 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -17,4 +17,4 @@ LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
 		ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index 093821e..88282a0 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -41,4 +41,4 @@ ifeq ($(BR2_PACKAGE_LIBPLAYER_PYTHON),y)
 	LIBPLAYER_CONF_OPT += --enable-binding-python
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 56d0377..a3e820b 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -30,5 +30,5 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBPNG_POST_INSTALL_TARGET_HOOKS += LIBPNG_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 2430c9d..b6b3f65 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -13,4 +13,4 @@ LIBRAW_CONF_OPT += --disable-examples --disable-lcms \
 			--disable-openmp --disable-demosaic-pack-gpl2 \
 			--disable-demosaic-pack-gpl3
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index 2f77a48..5d93297 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -8,4 +8,4 @@ LIBRAW1394_VERSION = 2.0.7
 LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
 LIBRAW1394_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libreplaygain/libreplaygain.mk b/package/libreplaygain/libreplaygain.mk
index 47bf586..e5c43cd 100644
--- a/package/libreplaygain/libreplaygain.mk
+++ b/package/libreplaygain/libreplaygain.mk
@@ -11,4 +11,4 @@ LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
 LIBREPLAYGAIN_AUTORECONF = YES
 LIBREPLAYGAIN_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 5c0bf01..f554a34 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -30,4 +30,4 @@ define LIBROXML_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index f5c223e..d3fde1f 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -13,4 +13,4 @@ LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPT = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 libgtk2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 0d765ea..f21424f 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -9,4 +9,4 @@ LIBRSYNC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/l
 LIBRSYNC_INSTALL_STAGING = YES
 LIBRSYNC_DEPENDENCIES = zlib bzip2 popt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index d03a5d9..6cde253 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -14,4 +14,4 @@ ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LIBSAMPLERATE_DEPENDENCIES += libsndfile
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
index 905089b..5d3ad85 100644
--- a/package/libsexy/libsexy.mk
+++ b/package/libsexy/libsexy.mk
@@ -10,4 +10,4 @@ LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy/
 LIBSEXY_DEPENDENCIES = libgtk2 libxml2
 LIBSEXY_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 8c20ba3..d0f930b 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -8,4 +8,4 @@ LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
 LIBSIGC_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 5480618..6e16c1b 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -8,4 +8,4 @@ LIBSNDFILE_VERSION = 1.0.25
 LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 6572585..d18f47e 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -27,4 +27,4 @@ else
 LIBSOUP_CONF_OPT += --disable-tls-check
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index f53f88f..039d8ce 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -37,4 +37,4 @@ define LIBSVGTINY_CLEAN_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index 39cf030..0c5b36e 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -26,4 +26,4 @@ LIBSYSFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/l
 LIBSYSFS_SOURCE:=sysfsutils-$(LIBSYSFS_VERSION).tar.gz
 LIBSYSFS_INSTALL_STAGING=YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index 89489b7..f3bf2e7 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -17,4 +17,4 @@ LIBTHEORA_CONF_OPT = \
 
 LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 6c69394..ae13b4c 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -10,8 +10,8 @@ LIBTOOL_INSTALL_STAGING = YES
 
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 # variables used by other packages
 LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index e565bb9..e9ecbd1 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -8,4 +8,4 @@ LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
 LIBTPL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tpl
 LIBTPL_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index 3484ec4..6a6eea4 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -21,4 +21,4 @@ endef
 
 LIBUNGIF_POST_INSTALL_TARGET_HOOKS += LIBUNGIF_BINS_CLEANUP
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index a6028e1..e9d3e37 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -10,4 +10,4 @@ LIBUPNP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/pupnp
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index a34079d..1efab75 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,4 +4,4 @@ LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 
 LIBURCU_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index d44eb27..298caab 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -17,5 +17,5 @@ endef
 
 LIBUSB_COMPAT_POST_INSTALL_STAGING_HOOKS+=LIBUSB_COMPAT_FIXUP_CONFIG
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 9abfcfc..69c9a38 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -9,5 +9,5 @@ LIBUSB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb
 LIBUSB_DEPENDENCIES = host-pkg-config
 LIBUSB_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index dbd8769..14f47fa 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -39,5 +39,5 @@ define LIBV4L_INSTALL_TARGET_CMDS
 			DESTDIR=$(TARGET_DIR) $(LIBV4L_MAKE_OPTS) install; done
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
 
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 90c021d..a688f49 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -48,4 +48,4 @@ else
 LIBVNCSERVER_CONF_OPT += --without-zlib
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 6844414..296e01d 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -13,4 +13,4 @@ LIBVORBIS_CONF_OPT = --disable-oggtest
 
 LIBVORBIS_DEPENDENCIES = host-pkg-config libogg
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 0d02981..270e6fa 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -36,6 +36,6 @@ define HOST_LIBXML_PARSER_PERL_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
 
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 54ad123..6acaa6e 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -34,8 +34,8 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBXML2_POST_INSTALL_TARGET_HOOKS += LIBXML2_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 # libxml2 for the host
 LIBXML2_HOST_BINARY:=$(HOST_DIR)/usr/bin/xmllint
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 15b6e6a..ead0d0f 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -40,5 +40,5 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBXSLT_POST_INSTALL_TARGET_HOOKS += LIBXSLT_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index 34580a2..9de46d2 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -8,5 +8,5 @@ LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
 LIBYAML_SITE = http://pyyaml.org/download/libyaml/
 LIBYAML_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 8d1f212..159bcd3 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -94,4 +94,4 @@ define LIGHTTPD_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/lighttpd
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/links/links.mk b/package/links/links.mk
index 52a71f1..780239f 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -33,4 +33,4 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 LINKS_DEPENDENCIES += zlib
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ba33d37..e42d686 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -70,4 +70,4 @@ endef
 
 endif
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index a6d15e1..5bb4650 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -48,4 +48,4 @@ define LINUX_FUSION_UNINSTALL_TARGET_CMDS
 	rm -f $(LINUX_FUSION_ETC_DIR)/40-fusion.rules
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/lite/lite.mk b/package/lite/lite.mk
index d331d9d..847cfef 100644
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -21,4 +21,4 @@ endef
 
 LITE_POST_INSTALL_TARGET_HOOKS += LITE_FINALIZE_INSTALL
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index c987fa2..1263be7 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -74,4 +74,4 @@ define LIVE555_UNINSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index a351329..a23fcc4 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -44,4 +44,4 @@ define LM_SENSORS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index bb4abf9..b343812 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -27,4 +27,4 @@ define LMBENCH_CLEAN_CMDS
 	$(MAKE) -C $(@D)/src clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 1a044e3..7ddafe7 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -17,4 +17,4 @@ define HOST_LOCALEDEF_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/localedef $(HOST_DIR)/usr/bin/localedef
 endef
 
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 4a7f25c..ca5d42f 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -30,4 +30,4 @@ define LOCKFILE_PROGS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 20317f1..a1b5fea 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -33,4 +33,4 @@ define LOGROTATE_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index ed6485c..2c4e0b7 100644
--- a/package/lpc3250loader/lpc3250loader.mk
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -6,4 +6,4 @@ define HOST_LPC3250LOADER_INSTALL_CMDS
 		$(HOST_DIR)/usr/bin/LPC3250loader.py
 endef
 
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 314f46a..6d2b5b8 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -47,4 +47,4 @@ define LRZSZ_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 7bc22c0..a96ccb4 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -66,4 +66,4 @@ define LSOF_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
index 3cdd846..f895b28 100644
--- a/package/lsuio/lsuio.mk
+++ b/package/lsuio/lsuio.mk
@@ -8,4 +8,4 @@ LSUIO_VERSION = 0.2.0
 LSUIO_SOURCE = lsuio-$(LSUIO_VERSION).tar.gz
 LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index f0a57ae..dc16ca5 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -7,4 +7,4 @@ LTP_TESTSUITE_VERSION = 20101031
 LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).bz2
 LTP_TESTSUITE_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ltp
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 8c0a145..a7a9095 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -9,4 +9,4 @@ LTRACE_DEPENDENCIES = libelf
 LTRACE_AUTORECONF   = YES
 LTRACE_CONF_OPT     += --disable-werror
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 5173028..df75b1a 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -11,5 +11,5 @@ HOST_LTTNG_BABELTRACE_AUTORECONF = YES
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index f54999e..90a7cd0 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -7,4 +7,4 @@ LTTNG_LIBUST_DEPENDENCIES    = liburcu util-linux
 
 LTTNG_LIBUST_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 1820c8f..fa5f19e 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -12,4 +12,4 @@ define LTTNG_MODULES_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR) modules_install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 8e6fc1a..cd42a44 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -17,4 +17,4 @@ else
 LTTNG_TOOLS_CONF_OPT += --disable-lttng-ust
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index aa0b4bf..555c4c1 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -160,5 +160,5 @@ define HOST_LUA_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 928e154..d8057c0 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -28,4 +28,4 @@ define LUAFILESYSTEM_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index daca248..f18217f 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -33,4 +33,4 @@ define LUASOCKET_CLEAN_CMDS
 	$(MAKE) -C $(@D) -f makefile clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 40e0152..b4908bc 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -51,4 +51,4 @@ define LVM2_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/lib/,libdevmapper.so*)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index e195049..6fabca5 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -9,7 +9,7 @@ LZMA_SITE:=http://tukaani.org/lzma/
 LZMA_INSTALL_STAGING = YES
 LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 LZMA=$(HOST_DIR)/usr/bin/lzma
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 84f31f0..f2e94f5 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -7,5 +7,5 @@ LZO_VERSION = 2.06
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 6d1d674..a56551e 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -8,4 +8,4 @@ LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
 LZOP_SITE = http://www.lzop.org/download/
 LZOP_DEPENDENCIES = lzo
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 173bba8..9ac4eb9 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -15,5 +15,5 @@ endif
 
 HOST_M4_CONF_OPT = --disable-static
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/make/make.mk b/package/make/make.mk
index 2886032..34f78d8 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -13,4 +13,4 @@ MAKE_CONF_ENV = make_cv_sys_gnu_glob=no \
 		GLOBINC='-I$(@D)/glob' \
 		GLOBLIB=glob/libglob.a
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 31dc95d..bd7bc54 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -31,5 +31,5 @@ define HOST_MAKEDEVS_INSTALL_CMDS
 	install -D -m 755 $(@D)/makedevs $(HOST_DIR)/usr/bin/makedevs
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index 0468d99..6788bb2 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -15,4 +15,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index 611323d..56785f6 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -21,4 +21,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
index 4246626..25ebc40 100644
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -20,4 +20,4 @@ MATCHBOX_FAKEKEY_POST_CONFIGURE_HOOKS += MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 558a4f7..2df9146 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -28,4 +28,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index b0be393..6ee4aa6 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -55,4 +55,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index fe43cb9..878defa 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -21,4 +21,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
index 2540e4b..7aa5629 100644
--- a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -12,4 +12,4 @@ MATCHBOX_STARTUP_MONITOR_CONF_OPT =
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index 4b32073..94246c6 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -39,4 +39,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 39dbea0..5a6c121 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -20,4 +20,4 @@ define MDADM_CONFIGURE_CMDS
 	# Do nothing
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 7d3f5b2..c68e56c 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -24,4 +24,4 @@ define MEMSTAT_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/memstat
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 00e3124..5061112 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -26,4 +26,4 @@ define MEMTESTER_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 5f5fcfa..4538abc 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -25,4 +25,4 @@ endef
 
 METACITY_POST_INSTALL_TARGET_HOOKS += METACITY_INSTALL_XSESSION
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 5bf4a2e..486c536 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -150,5 +150,5 @@ define MICROPERL_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/perl5
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 3e46b1a..6ab8064 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -33,4 +33,4 @@ define MIDORI_INSTALL_TARGET_CMDS
        (cd $(@D); ./waf --destdir=$(TARGET_DIR) install)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index 0731bf7..0d2983e 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -32,4 +32,4 @@ define MII_DIAG_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index ab65bb6..967f535 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -15,4 +15,4 @@ MINICOM_CONF_ENV = PKG_CONFIG=/bin/false
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index ad92a1a..7894b56 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -19,6 +19,6 @@ MODULE_INIT_TOOLS_AUTORECONF = YES
 HOST_MODULE_INIT_TOOLS_AUTORECONF = YES
 HOST_MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index e5ee489..c604f52 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -11,5 +11,5 @@ MPC_DEPENDENCIES = gmp mpfr
 MPC_AUTORECONF = YES
 HOST_MPC_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index c3df710..30c3210 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -11,5 +11,5 @@ MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
 MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 99b54bc..b76afc7 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -24,4 +24,4 @@ define MROUTED_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 2c71229..5793b4f 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -25,4 +25,4 @@ MSMTP_CONF_OPT += \
 	--without-libgsasl \
 	--without-gnome-keyring
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 8ccd4dd..4d02d8e 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -80,5 +80,5 @@ define MTD_INSTALL_TARGET_CMDS
  done
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 744ec85..754e056 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -58,4 +58,4 @@ define ALSA_UTILS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/,$(ALSA_UTILS_TARGETS_) $(ALSA_UTILS_TARGETS_y))
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/aumix/aumix.mk b/package/multimedia/aumix/aumix.mk
index b6fbdd2..5d1bf35 100644
--- a/package/multimedia/aumix/aumix.mk
+++ b/package/multimedia/aumix/aumix.mk
@@ -18,4 +18,4 @@ AUMIX_CONF_OPT = \
 
 AUMIX_DEPENDENCIES = ncurses
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/bellagio/bellagio.mk b/package/multimedia/bellagio/bellagio.mk
index d013953..d078430 100644
--- a/package/multimedia/bellagio/bellagio.mk
+++ b/package/multimedia/bellagio/bellagio.mk
@@ -9,4 +9,4 @@ BELLAGIO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/
 BELLAGIO_AUTORECONF = YES
 BELLAGIO_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/faad2/faad2.mk b/package/multimedia/faad2/faad2.mk
index 366515c..133c3cd 100644
--- a/package/multimedia/faad2/faad2.mk
+++ b/package/multimedia/faad2/faad2.mk
@@ -8,4 +8,4 @@ FAAD2_VERSION = 2.7
 FAAD2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/faac
 FAAD2_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 4cc29ee..8b04a21 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -177,4 +177,4 @@ define FFMPEG_CONFIGURE_CMDS
 	)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/flac/flac.mk b/package/multimedia/flac/flac.mk
index 79ecfd1..af9e49f 100644
--- a/package/multimedia/flac/flac.mk
+++ b/package/multimedia/flac/flac.mk
@@ -20,4 +20,4 @@ else
 FLAC_CONF_OPT += --disable-ogg
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
index 9682962..fbb0d57 100644
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -15,4 +15,4 @@ endef
 
 GST_DSP_DEPENDENCIES = gstreamer tidsp-binaries host-pkg-config
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index c955632..39da8f8 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -15,4 +15,4 @@ ifeq ($(BR2_PACKAGE_BZIP2),y)
 GST_FFMPEG_DEPENDENCIES += bzip2
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/gst-omapfb/gst-omapfb.mk b/package/multimedia/gst-omapfb/gst-omapfb.mk
index f3956bc..31fc7eb 100644
--- a/package/multimedia/gst-omapfb/gst-omapfb.mk
+++ b/package/multimedia/gst-omapfb/gst-omapfb.mk
@@ -16,4 +16,4 @@ endef
 
 GST_OMAPFB_DEPENDENCIES = gstreamer
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index a737bef..6e9d687 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -556,4 +556,4 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-vcd
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 848eaf2..81b9583 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -180,4 +180,4 @@ else
 GST_PLUGINS_BASE_CONF_OPT += --disable-zlib
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 4e6b73e..ae502e0 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -365,4 +365,4 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-speex
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index 37ed624..b046750 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -81,4 +81,4 @@ else
 GST_PLUGINS_UGLY_CONF_OPT += --disable-mpeg2dec
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index cc29932..1196021 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -25,4 +25,4 @@ GSTREAMER_CONF_OPT = \
 
 GSTREAMER_DEPENDENCIES = libglib2 host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index 7b4b0ae..e5a2d8f 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -30,4 +30,4 @@ endif
 
 LAME_POST_CONFIGURE_HOOKS += LAME_BIGENDIAN_ARCH
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/madplay/madplay.mk b/package/multimedia/madplay/madplay.mk
index 9fad45f..a848068 100644
--- a/package/multimedia/madplay/madplay.mk
+++ b/package/multimedia/madplay/madplay.mk
@@ -16,4 +16,4 @@ MADPLAY_CONF_OPT+=--with-alsa
 MADPLAY_DEPENDENCIES+=alsa-lib
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 43d429b..6b4d2a9 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -135,4 +135,4 @@ endef
 
 MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 65523f3..7908de3 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -64,4 +64,4 @@ MPG123_DEPENDENCIES += libtool
 MPG123_CONF_OPT += --with-modules --with-module-suffix=.so
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 216bb46..fc72ae9 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -169,4 +169,4 @@ define MPLAYER_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/multimedia/musepack/musepack.mk b/package/multimedia/musepack/musepack.mk
index ac3660f..23106ee 100644
--- a/package/multimedia/musepack/musepack.mk
+++ b/package/multimedia/musepack/musepack.mk
@@ -11,4 +11,4 @@ MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
 MUSEPACK_MAKE = $(MAKE1)
 
-$(eval $(call CMAKETARGETS))
+$(eval $(CMAKETARGETS))
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index eefc497..4868254 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -47,4 +47,4 @@ endef
 PULSEAUDIO_POST_INSTALL_TARGET_HOOKS += PULSEAUDIO_REMOVE_VALA
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/tidsp-binaries/tidsp-binaries.mk b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
index 0b64fb8..ac3dde9 100644
--- a/package/multimedia/tidsp-binaries/tidsp-binaries.mk
+++ b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
@@ -10,4 +10,4 @@ define TIDSP_BINARIES_UNINSTALL_TARGET_CMDS
 	$(RM) -r $(TARGET_DIR)/lib/dsp
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/multimedia/vorbis-tools/vorbis-tools.mk b/package/multimedia/vorbis-tools/vorbis-tools.mk
index fc79b3f..40be15a 100644
--- a/package/multimedia/vorbis-tools/vorbis-tools.mk
+++ b/package/multimedia/vorbis-tools/vorbis-tools.mk
@@ -17,4 +17,4 @@ ifeq ($(BR2_PACKAGE_SPEEX),y)
 VORBIS_TOOLS_DEPENDENCIES += speex
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/multimedia/wavpack/wavpack.mk b/package/multimedia/wavpack/wavpack.mk
index 8b0af0b..8513e7a 100644
--- a/package/multimedia/wavpack/wavpack.mk
+++ b/package/multimedia/wavpack/wavpack.mk
@@ -13,4 +13,4 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 WAVPACK_DEPENDENCIES += libiconv
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 4c8e399..e32c9e9 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -10,4 +10,4 @@ MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPT = --disable-iconv --disable-smtp
 MUTT_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index c05c3a7..3a974ca 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -12,4 +12,4 @@ MXML_INSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) install
 MXML_UNINSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) uninstall
 MXML_UNINSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) uninstall
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index a1640c3..61089bd 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -42,4 +42,4 @@ endef
 MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_REMOVE_TEST_PROGS
 MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_ADD_MYSQL_LIB_PATH
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 439f583..f28d78c 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -22,4 +22,4 @@ define NANO_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/nano
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index b819df0..7687f07 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -14,5 +14,5 @@ NASM_VERSION=2.08.01
 NASM_SOURCE=nasm-$(NASM_VERSION).tar.bz2
 NASM_SITE=http://www.nasm.us/pub/nasm/releasebuilds/2.08.01/
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 62ae9be..7de4a5d 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -29,4 +29,4 @@ endef
 
 NBD_POST_INSTALL_TARGET_HOOKS += NBD_CLEANUP_AFTER_INSTALL
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 3000e7a..51bab77 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -41,4 +41,4 @@ define NCFTP_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS) ncftpspooler)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 10a55dd..d13b444 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -137,5 +137,5 @@ HOST_NCURSES_DEPENDENCIES =
 HOST_NCURSES_CONF_OPT = \
 	--without-shared --without-gpm
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 8451e06..1edd755 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -34,4 +34,4 @@ endef
 
 NDISC6_POST_INSTALL_TARGET_HOOKS += NDISC6_REMOVE_UNNEEDED
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 6e365b3..f7749f7 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -52,4 +52,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 NEON_POST_INSTALL_TARGET_HOOKS += NEON_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 4f0ec09..94df49a 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -34,4 +34,4 @@ endef
 
 NETATALK_POST_INSTALL_TARGET_HOOKS += NETATALK_INSTALL_EXTRA_FILES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index bc58af2..c9efe0a 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -8,4 +8,4 @@ NETCAT_VERSION:=0.7.1
 NETCAT_SOURCE:=netcat-$(NETCAT_VERSION).tar.gz
 NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netcat
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 6a8aced..e9a9100 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -20,4 +20,4 @@ define NETPERF_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/netserver
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index db76021..e5df9a1 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -25,4 +25,4 @@ define NETPLUG_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 448e3fd..7219533 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -87,4 +87,4 @@ endef
 
 NETSNMP_POST_INSTALL_STAGING_HOOKS += NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
index fbe1939..0cdfca1 100644
--- a/package/netstat-nat/netstat-nat.mk
+++ b/package/netstat-nat/netstat-nat.mk
@@ -7,4 +7,4 @@
 NETSTAT_NAT_VERSION = 1.4.10
 NETSTAT_NAT_SITE = http://tweegy.nl/download
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index cfcf32c..95f58fc 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -47,4 +47,4 @@ endef
 
 NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 557e7e8..c53be85 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -30,4 +30,4 @@ endef
 
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index a55f7ba..bb64cc1 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -8,4 +8,4 @@ NGIRCD_VERSION = 17.1
 NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
 NGIRCD_DEPENDENCIES = zlib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index daf7c6f..9700720 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -17,4 +17,4 @@ NGREP_CONF_OPT =  \
 
 NGREP_DEPENDENCIES = libpcap pcre
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index 0fe427a..56e48b8 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -27,4 +27,4 @@ define NOIP_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 8e616cb..5b842d8 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -29,4 +29,4 @@ ifneq ($(BR2_PACKAGE_NTFS_3G_NTFSPROGS),y)
 	NTFS_3G_CONF_OPT += --disable-ntfsprogs
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 8076ce7..deef1fb 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -65,4 +65,4 @@ endef
 
 NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index 8c0203c..660f854 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -22,4 +22,4 @@ define NUTTCP_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/nuttcp
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
index e615225..da127b3 100644
--- a/package/ocf-linux/ocf-linux.mk
+++ b/package/ocf-linux/ocf-linux.mk
@@ -18,4 +18,4 @@ define OCF_LINUX_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/include/crypto/cryptodev.h
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 9ed4d5b..93b93d4 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -38,4 +38,4 @@ define OLSR_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 59be66f..1a686e2 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -26,4 +26,4 @@ define OPEN2300_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index d415e51..323f452 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -121,4 +121,4 @@ endef
 OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DATA
 endif
 
-$(eval $(call CMAKETARGETS))
+$(eval $(CMAKETARGETS))
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 3358905..dd1c548 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -14,4 +14,4 @@ define OPENNTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man?/ntpd*
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index a12ba6c..ecea171 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -39,5 +39,5 @@ HOST_OPENOCD_CONF_OPT = 	\
 	--enable-jlink 		\
 	--enable-vsllink
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 2b93def..523f8d7 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -18,4 +18,4 @@ endef
 
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 748252c..6ecf3dc 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -114,4 +114,4 @@ define OPENSSL_UNINSTALL_CMDS
 	rm -rf $(addprefix $(STAGING_DIR)/usr/lib/,ssl engines libcrypto* libssl* pkgconfig/libcrypto.pc)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index a25ca8f..5bba41f 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -32,4 +32,4 @@ define OPENSWAN_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) $(OPENSWAN_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index bcb121d..761a7d3 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -34,4 +34,4 @@ define OPENVPN_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/openvpn
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 5da794b..55d30af 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -42,4 +42,4 @@ define OPROFILE_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/oprofile
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 6602e36..ffa3a23 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -23,5 +23,5 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 ORC_POST_INSTALL_TARGET_HOOKS += ORC_REMOVE_DEVFILES
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index f46bdc6..9cb737e 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -59,4 +59,4 @@ endef
 
 PANGO_POST_INSTALL_TARGET_HOOKS += PANGO_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index c4107e7..ee3fea8 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -10,4 +10,4 @@ PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = readline util-linux lvm2
 PARTED_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 2062b9f..15a183c 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -7,4 +7,4 @@
 PATCH_VERSION = 2.6
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 37a17c4..8a42e93 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -50,4 +50,4 @@ define PCIUTILS_INSTALL_TARGET_CMDS
 		SHARED=$(PCIUTILS_SHARED) install-lib
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index f2112f0..616e7a5 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -9,5 +9,5 @@ PCMANFM_SITE = http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 PCMANFM_CONF_OPT = --disable-hal
 PCMANFM_DEPENDENCIES = host-pkg-config libgtk2 gamin startup-notification xserver_xorg-server
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index db896fd..657000a 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -29,4 +29,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 PCRE_POST_INSTALL_TARGET_HOOKS += PCRE_TARGET_REMOVE_PCRE_CONFIG
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/php/php.mk b/package/php/php.mk
index 6de6a9e..c123fb5 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -204,4 +204,4 @@ endef
 
 PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)"
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index fce50d9..1e01405 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -15,4 +15,4 @@ define PICOCOM_INSTALL_TARGET_CMDS
 	install -D -m 0755 $(@D)/picocom $(TARGET_DIR)/usr/bin/picocom
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 3e056d4..92ecccc 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -16,5 +16,5 @@ ifneq ($(BR2_iwmmxt),y)
 PIXMAN_CONF_OPT += --disable-arm-iwmmxt
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/pkg-autotargets.mk b/package/pkg-autotargets.mk
index c9887c2..ff022f3 100644
--- a/package/pkg-autotargets.mk
+++ b/package/pkg-autotargets.mk
@@ -305,10 +305,5 @@ endef
 # Argument 1 is "target" or "host"           [optional, default: "target"]
 ################################################################################
 
-define AUTOTARGETS
-ifeq ($(1),host)
-$(call AUTOTARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
-else
-$(call AUTOTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-endif
-endef
+AUTOTARGETS = $(call AUTOTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+AUTOTARGETS_HOST = $(call AUTOTARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
diff --git a/package/pkg-cmaketargets.mk b/package/pkg-cmaketargets.mk
index 371ab11..a627375 100644
--- a/package/pkg-cmaketargets.mk
+++ b/package/pkg-cmaketargets.mk
@@ -190,13 +190,8 @@ endef
 # Argument 1 is "target" or "host"           [optional, default: "target"]
 ################################################################################
 
-define CMAKETARGETS
-ifeq ($(1),host)
-$(call CMAKETARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
-else
-$(call CMAKETARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-endif
-endef
+CMAKETARGETS_HOST = $(call CMAKETARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+CMAKETARGETS = $(call CMAKETARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
 
 ################################################################################
 # Generation of the CMake toolchain file
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 137800c..de72a8f 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -19,7 +19,7 @@ HOST_PKG_CONFIG_CONF_OPT = \
 HOST_PKG_CONFIG_AUTORECONF = YES
 HOST_PKG_CONFIG_DEPENDENCIES =
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
diff --git a/package/pkg-gentargets.mk b/package/pkg-gentargets.mk
index 1c9b458..98c5547 100644
--- a/package/pkg-gentargets.mk
+++ b/package/pkg-gentargets.mk
@@ -443,14 +443,9 @@ endef # GENTARGETS_INNER
 # Argument 1 is "target" or "host"           [optional, default: "target"]
 ################################################################################
 
-define GENTARGETS
-ifeq ($(1),host)
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-$(call GENTARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
-else
+GENTARGETS_HOST = $(call GENTARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
 # In the case of target packages, keep the package name "pkg"
-$(call GENTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-endif
-endef
+GENTARGETS = $(call GENTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
 
 # :mode=makefile:
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index ddb5b25..7d307a0 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -55,4 +55,4 @@ define POCO_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index d07cdc6..99099b4 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -9,5 +9,5 @@ POLARSSL_CONF_OPT = \
 
 POLARSSL_INSTALL_STAGING = YES
 
-$(eval $(call CMAKETARGETS))
+$(eval $(CMAKETARGETS))
 
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index fd25caa..a71ddce 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -15,5 +15,5 @@ POPT_CONF_ENV += am_cv_lib_iconv=yes
 POPT_CONF_OPT += --with-libiconv-prefix=$(STAGING_DIR)/usr
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
index a824735..bc41fc8 100644
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -18,4 +18,4 @@ PORTAUDIO_CONF_OPT = \
        $(if $(BR2_PACKAGE_PORTAUDIO_OSS),--with-oss,--without-oss) \
        $(if $(BR2_PACKAGE_PORTAUDIO_CXX),--enable-cxx,--disable-cxx)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index cb7c0e3..0c79436 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -43,4 +43,4 @@ define PORTMAP_UNINSTALL_TARGET_CMDS
 		$(addsuffix .8,$(PORTMAP_SBINS)))
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 2137f6a..e0df916 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -102,4 +102,4 @@ define PPPD_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 77ae34d..f52543a 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -25,4 +25,4 @@ define PPTP_LINUX_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/pptp.8
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/procps/procps.mk b/package/procps/procps.mk
index 8228052..7409167 100644
--- a/package/procps/procps.mk
+++ b/package/procps/procps.mk
@@ -20,4 +20,4 @@ define PROCPS_INSTALL_TARGET_CMDS
 		ldconfig=true install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 5352ea7..d906eed 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -43,4 +43,4 @@ define PROFTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/proftpd.conf
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index f18261e..f6c301e 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -17,5 +17,5 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 PROTOBUF_DEPENDENCIES += zlib
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 0b0e046..52202c2 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -18,4 +18,4 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 PSMISC_DEPENDENCIES += busybox
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 5f15f5b..48d3698 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -8,4 +8,4 @@ PV_VERSION = 1.2.0
 PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://pipeviewer.googlecode.com/files
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/python-distutilscross/python-distutilscross.mk b/package/python-distutilscross/python-distutilscross.mk
index 9003189..ca23c32 100644
--- a/package/python-distutilscross/python-distutilscross.mk
+++ b/package/python-distutilscross/python-distutilscross.mk
@@ -18,4 +18,4 @@ define HOST_PYTHON_DISTUTILSCROSS_INSTALL_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index 7ac873c..646a214 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -18,5 +18,5 @@ define PYTHON_DPKT_INSTALL_TARGET_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
 
diff --git a/package/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
index 7d898ed..587f0c7 100644
--- a/package/python-mad/python-mad.mk
+++ b/package/python-mad/python-mad.mk
@@ -38,4 +38,4 @@ define PYTHON_MAD_INSTALL_TARGET_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index b5185f0..f2d2c39 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -22,4 +22,4 @@ define PYTHON_NETIFACES_INSTALL_TARGET_CMDS
 	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index f5603b6..c2d2bf4 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -108,4 +108,4 @@ define PYTHON_PYGAME_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame*
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index add9667..407e52d 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -18,4 +18,4 @@ define PYTHON_SERIAL_INSTALL_TARGET_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 70ebb85..9156611 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -27,6 +27,6 @@ define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
 	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
 
diff --git a/package/python/python.mk b/package/python/python.mk
index 28e215c..657b7fe 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -167,5 +167,5 @@ PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
 
 PYTHON_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 7e6c5dd..d3746db 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -637,4 +637,4 @@ define QT_UNINSTALL_TARGET_CMDS
 	-rm $(TARGET_DIR)/usr/lib/libphonon.so.*
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 1073852..65eeae8 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -86,4 +86,4 @@ else
 QUAGGA_CONF_OPT+=--disable-opaque-lsa
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index e63e8e0..d191761 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -14,4 +14,4 @@ endef
 
 RADVD_POST_INSTALL_TARGET_HOOKS += RADVD_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index 732a08b..0ab7491 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -10,4 +10,4 @@ RDESKTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/
 RDESKTOP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt
 RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/read-edid/read-edid.mk b/package/read-edid/read-edid.mk
index b568d5b..e774bae 100644
--- a/package/read-edid/read-edid.mk
+++ b/package/read-edid/read-edid.mk
@@ -16,4 +16,4 @@ define READ_EDID_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/parse-edid $(TARGET_DIR)/sbin/parse-edid
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index cd9946e..e069949 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -21,4 +21,4 @@ define READLINE_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index 4862fad..22ee5e8 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -26,4 +26,4 @@ define RINGS_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 7642c82..fe504eb 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -9,4 +9,4 @@ RNG_TOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge
 RNG_TOOLS_CONF_ENV = LIBS="-largp"
 RNG_TOOLS_DEPENDENCIES = argp-standalone
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 30bc1a4..d7dd075 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -33,4 +33,4 @@ define RP_PPPOE_UNINSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 4ce2ecb..2a76313 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -45,4 +45,4 @@ RPM_MAKE = $(MAKE1)
 
 RPM_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) program_transform_name= install
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 55bdd51..c9e0ade 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -26,4 +26,4 @@ define RRDTOOL_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/librrd*
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index 0c2b838..bd57bb7 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -33,4 +33,4 @@ define RSH_REDONE_UNINSTALL_TARGET_CMDS
 		$(addprefix $(TARGET_DIR)/usr/sbin/,$(rsh-redone-sbin-y))
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 12a33c6..f402f7f 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -10,4 +10,4 @@ RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 RSYNC_CONF_OPT = --with-included-popt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index b7576cd..b929d4e 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -24,4 +24,4 @@ endef
 
 RSYSLOG_POST_INSTALL_TARGET_HOOKS += RSYSLOG_INSTALL_CONF_SCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 222733f..e8efc52 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -21,5 +21,5 @@ define RT_TESTS_INSTALL_TARGET_CMDS
 		install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
 
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 2dc1468..8c006cb 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -12,4 +12,4 @@ RTAI_CONF_OPT = \
 
 RTAI_MAKE = $(MAKE1)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index d89c25b..2c093d9 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -31,5 +31,5 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 	RUBY_DEPENDENCIES += zlib
 endif
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index d5ab9f6..3293c98 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -19,4 +19,4 @@ define HOST_SAM_BA_INSTALL_CMDS
 	ln -s ../../opt/sam-ba/sam-ba $(HOST_DIR)/usr/bin/sam-ba
 endef
 
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 1203693..d19a489 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -182,4 +182,4 @@ endef
 
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_INITSCRIPTS_CONFIG
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 621cff5..c604a74 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -37,4 +37,4 @@ else
 SANE_BACKENDS_CONF_OPT += --without-snmp
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 03bec89..fc69e37 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -9,4 +9,4 @@ SAWMAN_SITE = http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
 SAWMAN_DEPENDENCIES = directfb
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 73c68ed..f738f6d 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -10,4 +10,4 @@ define HOST_SCONS_INSTALL_CMDS
 	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index d117bde..0b57362 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -20,4 +20,4 @@ endef
 
 SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 5460f51..b77dcf2 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -74,4 +74,4 @@ define SDL_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL*.so* $(TARGET_DIR)/usr/lib/
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index a25987d..1cb7a75 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -20,4 +20,4 @@ else
 SDL_GFX_CONF_OPT += --disable-mmx
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index b93dc08..11e8769 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -33,4 +33,4 @@ SDL_IMAGE_DEPENDENCIES:=sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_PNG),libpng) \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index eee3e14..e4d3bed 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -41,4 +41,4 @@ define SDL_MIXER_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index 4992b8c..05c9a00 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -15,4 +15,4 @@ SDL_NET_INSTALL_STAGING = YES
 
 SDL_NET_DEPENDENCIES = sdl
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index f95d6bc..dcde3ff 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -54,4 +54,4 @@ define SDL_SOUND_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libSDL_sound*so*
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index efba5fa..9fdf9da 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -14,4 +14,4 @@ SDL_TTF_CONF_OPT = --without-x \
 		--with-sdl-prefix=$(STAGING_DIR)/usr
 
 SDL_TTF_MAKE_OPT = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index 9d2b00b..62b126b 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -2,4 +2,4 @@ SDPARM_VERSION = 1.07
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
 SDPARM_SITE = http://sg.danny.cz/sg/p/
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 79467ef..a518c94 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -23,4 +23,4 @@ endef
 
 SED_POST_INSTALL_TARGET_HOOKS = SED_MOVE_BINARY
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 1fd589c..c4a7d96 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -8,4 +8,4 @@ SER2NET_VERSION = 2.7
 SER2NET_SOURCE = ser2net-$(SER2NET_VERSION).tar.gz
 SER2NET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ser2net
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 80dbb12..d2a5e62 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -19,4 +19,4 @@ endef
 
 SETSERIAL_POST_PATCH_HOOKS += SETSERIAL_APPLY_DEBIAN_PATCHES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index dc53fce..95a0579 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -25,8 +25,8 @@ define SHARED_MIME_INFO_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(STAGING_DIR)/usr/share/mime/mime.cache $(TARGET_DIR)/usr/share/mime/mime.cache
 endef
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 # shared-mime-info for the host
 SHARED_MIME_INFO_HOST_BINARY:=$(HOST_DIR)/usr/bin/update-mime-database
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 2f5787c..1f857f4 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -51,4 +51,4 @@ define SLANG_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 3a6fce7..dd64cd6 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -7,4 +7,4 @@
 SMARTMONTOOLS_VERSION = 5.42
 SMARTMONTOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/smartmontools
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 5f7feac..a1164aa 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -12,4 +12,4 @@ SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
 		 sc_cv_sys_tabdly_shift=11 \
 		 sc_cv_sys_csize_shift=4
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 97ab876..0a2c53c 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -8,4 +8,4 @@ SOCKETCAND_SITE = git://github.com/dschanoeh/socketcand.git
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_DEPENDENCIES = libconfig
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index 2502b11..6234b66 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -12,4 +12,4 @@ ifneq ($(BR2_INET_IPV6),y)
 SPAWN_FCGI_CONF_OPT = --disable-ipv6
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index c9d9ed3..d850d58 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -31,4 +31,4 @@ define SPEEX_BUILD_CMDS
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 3e69a96..8536b1a 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -53,4 +53,4 @@ define SQLCIPHER_UNINSTALL_STAGING_CMDS
 	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 2065ce1..e461e03 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -45,4 +45,4 @@ define SQLITE_UNINSTALL_STAGING_CMDS
 	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 4d0ad51..123fb8b 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -72,5 +72,5 @@ define HOST_SQUASHFS_INSTALL_CMDS
    -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
index 81cdf79..e4d5c00 100644
--- a/package/squashfs3/squashfs3.mk
+++ b/package/squashfs3/squashfs3.mk
@@ -24,6 +24,6 @@ define HOST_SQUASHFS3_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
 
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 9cdbeb5..840cafc 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -32,4 +32,4 @@ endef
 
 SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index 44fe16d..a942865 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -24,4 +24,4 @@ define SREDIRD_CLEAN_CMDS
 	rm -f $(@D)/sredird
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index e60cdeb..35363f5 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -12,4 +12,4 @@ SSHFS_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index 9a5aede..afb60f6 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -41,5 +41,5 @@ define HOST_SSTRIP_UNINSTALL_CMDS
 	rm -f $(HOST_DIR)/usr/bin/$(HOST_SSTRIP_BINARY)
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index 60778ca..d4102a4 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -13,5 +13,5 @@ STARTUP_NOTIFICATION_CONF_OPT = --with-x \
 	--x-includes="$(STAGING_DIR)/usr/include/X11" \
 	--x-libraries="$(STAGING_DIR)/usr/lib"
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index 8c39693..e9dfb1b 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -16,4 +16,4 @@ define STATSERIAL_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/statserial $(TARGET_DIR)/usr/bin/statserial
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 8cda09b..8522e52 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -18,4 +18,4 @@ endef
 
 STRACE_POST_INSTALL_TARGET_HOOKS += STRACE_REMOVE_STRACE_GRAPH
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 8b4f40b..55d34ff 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -10,4 +10,4 @@ STRESS_VERSION = 1.0.4
 STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
 STRESS_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 6088e58..0178484 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -21,4 +21,4 @@ endef
 
 STUNNEL_POST_INSTALL_TARGET_HOOKS += STUNNEL_INSTALL_CONF_SCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 71d7a20..3f08dda 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -22,4 +22,4 @@ define SUDO_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/sudoers
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 3ed0ff1..5a21a3e 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -21,4 +21,4 @@ else
 SYLPHEED_CONF_OPT += --disable-ssl
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 5a09359..f4e0f12 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -12,4 +12,4 @@ SYNERGY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 
 SYNERGY_DEPENDENCIES = xserver_xorg-server xlib_libXtst
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index a5dedf2..13a3334 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -52,4 +52,4 @@ define SYSKLOGD_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 55991c4..dbf1dcb 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -22,4 +22,4 @@ endif
 # among other things. So we don't install it.
 SYSSTAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALL_ISAG=n install
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 717bdcc..ee3bc2f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -68,4 +68,4 @@ SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_TTY_HOOK \
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 0d65c43..de85df1 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -46,4 +46,4 @@ define SYSVINIT_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index da2db0c..a56fc51 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -25,4 +25,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 TAGLIB_POST_INSTALL_TARGET_HOOKS += TAGLIB_REMOVE_DEVFILE
 endif
 
-$(eval $(call CMAKETARGETS))
+$(eval $(CMAKETARGETS))
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 9e856b5..b796cdb 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -13,7 +13,7 @@ TAR_DEPENDENCIES += busybox
 HOST_TAR_DEPENDENCIES =
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
 # host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
 # of needing tar to build tar.
@@ -25,4 +25,4 @@ define HOST_TAR_EXTRACT_CMDS
 	mv $(@D)/tar-$(TAR_VERSION)/* $(@D)
 	rmdir $(@D)/tar-$(TAR_VERSION)
 endef
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 8ed81ab..7c5d6ba 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -31,5 +31,5 @@ endef
 
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_CLEANUP
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index ab9d4f1..654b13d 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -21,4 +21,4 @@ endef
 
 TCPDUMP_POST_INSTALL_TARGET_HOOKS += TCPDUMP_REMOVE_DUPLICATED_BINARY
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 3a526a7..f06643a 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -11,5 +11,5 @@ TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
 
 TCPREPLAY_DEPENDENCIES = uclibc libpcap
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 80f2935..ed586d1 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -18,4 +18,4 @@ define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 98d45ca..ff456eb 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -48,4 +48,4 @@ define THTTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/syslogtocern
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 71a610d..5e8d86a 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -28,4 +28,4 @@ define TI_UTILS_UNINSTALL_TARGET_CMDS
 	rm -fr $(TARGET_DIR)/usr/share/ti-utils
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 3ab0d4f..9344152 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -81,4 +81,4 @@ define TIFF_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 9b06589..e599671 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -23,4 +23,4 @@ define TINYHTTPD_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S85tinyhttpd
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 7a4c0f2..b5c860a 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -29,4 +29,4 @@ define TN5250_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/tn5250
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index df97c5e..e29c23d 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -13,5 +13,5 @@ TORSMO_CONF_OPT = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries=
 
 TORSMO_DEPENDENCIES = xserver_xorg-server
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 9ffd432..8037421 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -56,4 +56,4 @@ else
 	TRANSMISSION_CONF_OPT += --disable-gtk
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index b836010..fe8535c 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -12,4 +12,4 @@ TREMOR_AUTORECONF = YES
 TREMOR_INSTALL_STAGING = YES
 TREMOR_DEPENDENCIES = libogg
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 885bd88..024f16e 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -9,4 +9,4 @@ TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index d757ade..b11da5c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -51,5 +51,5 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin/mkimage
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 726aed6..8f65a5f 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -45,4 +45,4 @@ endef
 
 UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 212609f..dc6a9b1 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -26,4 +26,4 @@ ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
 UDPCAST_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_RECEIVER
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index b7b942c..43567d1 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -23,4 +23,4 @@ define UEMACS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/em
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index ce6d582..5028b47 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -17,4 +17,4 @@ define UNIONFS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 7b982d8..798ad6a 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -25,5 +25,5 @@ define USB_MODESWITCH_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man1/usb_modeswitch.1
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
 
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index a6b2d43..7a3cde5 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -31,4 +31,4 @@ define USBMOUNT_UNINSTALL_TARGET_CMDS
 		$(TARGET_DIR)/media/usb?
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index a242f93..8f74a49 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -53,4 +53,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_DEVFILES
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 5421d8a..b2d46d1 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -33,4 +33,4 @@ define USHARE_INSTALL_TARGET_CMDS
 endef
 
 # Even though configure is called it's not autoconf
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d8a3ac9..00d7b20 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -81,8 +81,8 @@ HOST_UTIL_LINUX_CONF_OPT += \
 	--disable-fallocate --disable-unshare --disable-rename \
 	--disable-schedutils --disable-wall --disable-partx
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
 # MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
 # one, so it disappears
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index a3ad037..fc649c4 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -13,5 +13,5 @@ VALA_DEPENDENCIES = host-flex libglib2 \
 		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 HOST_VALA_DEPENDENCIES = host-flex host-libglib2
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 004c1ac..a7fbf67 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -120,4 +120,4 @@ endef
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_NULGRIND
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index ef8d925..dfb90b5 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -38,4 +38,4 @@ ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_RUNTIME_CMDS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 3c9aa65..c319c75 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -50,4 +50,4 @@ define VSFTPD_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 07334ad..c3edad9 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -16,4 +16,4 @@ VTUN_CONF_OPT = \
 		--with-lzo-headers=$(STAGING_DIR)/usr/include/lzo \
 		--with-lzo-lib=$(STAGING_DIR)/usr/lib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index b71103a..ac851a6 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -21,4 +21,4 @@ endif
 
 WEBKIT_CONF_OPT += --disable-video
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index b14cd92..2c667b4 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -30,4 +30,4 @@ ifneq ($(BR2_PACKAGE_OPENSSL),y)
 endif
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
index 048f4de..f676276 100644
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -28,4 +28,4 @@ define WHETSTONE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/whetstone
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/which/which.mk b/package/which/which.mk
index a7bb577..4cb3a25 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -7,4 +7,4 @@
 WHICH_VERSION = 2.20
 WHICH_SITE = http://carlo17.home.xs4all.nl/which
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index ec1b692..e172a77 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -19,4 +19,4 @@ define WIPE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man1/wipe.1
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index b059839..3a080ff 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -42,4 +42,4 @@ define WIRELESS_TOOLS_UNINSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" uninstall
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 4a1baea..abf80c3 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -132,4 +132,4 @@ define WPA_SUPPLICANT_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/etc/wpa_supplicant.conf
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index f9ab334..69673f5 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -18,4 +18,4 @@ define WSAPI_UNINSTALL_TARGET_CMDS
 	rm -rf "$(TARGET_DIR)/usr/share/lua/wsapi"
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 3e15951..e85bd67 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -19,6 +19,6 @@ LIBXCB_CONF_OPT = --disable-build-docs
 
 HOST_LIBXCB_CONF_OPT = --disable-build-docs
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/x11r7/mcookie/mcookie.mk b/package/x11r7/mcookie/mcookie.mk
index 030dd74..702be44 100644
--- a/package/x11r7/mcookie/mcookie.mk
+++ b/package/x11r7/mcookie/mcookie.mk
@@ -19,4 +19,4 @@ define MCOOKIE_INSTALL_TARGET_CMDS
 	install -m 0755 -D $(@D)/mcookie $(TARGET_DIR)/usr/bin/mcookie
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 1e9ec77..dd3a607 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -28,4 +28,4 @@ MESA3D_DEPENDENCIES = \
 	libdrm \
 	expat
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/pthread-stubs/pthread-stubs.mk b/package/x11r7/pthread-stubs/pthread-stubs.mk
index 25b4433..ee88ec1 100644
--- a/package/x11r7/pthread-stubs/pthread-stubs.mk
+++ b/package/x11r7/pthread-stubs/pthread-stubs.mk
@@ -9,6 +9,6 @@ PTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
 
 PTHREAD_STUBS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index a91a416..08643fb 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -9,4 +9,4 @@ XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.bz2
 XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_APPRES_DEPENDENCIES = xlib_libX11 xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 00ce339..d92cfea 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -9,5 +9,5 @@ XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
 XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
index d806231..2a889f1 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
@@ -9,4 +9,4 @@ XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.bz2
 XAPP_BEFORELIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index 5fdc260..0e8de0b 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -9,4 +9,4 @@ XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.bz2
 XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index 794985f..ee17cc5 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -9,4 +9,4 @@ XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.bz2
 XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index b71819a..bf1bcb0 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -9,4 +9,4 @@ XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
 XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FONTTOSFNT_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index f18424e..2178a5a 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -9,4 +9,4 @@ XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.bz2
 XAPP_FSLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FSLSFONTS_DEPENDENCIES = xlib_libFS xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
index 190bab8..45aef51 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
@@ -9,4 +9,4 @@ XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.bz2
 XAPP_FSTOBDF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FSTOBDF_DEPENDENCIES = xlib_libFS xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index 93d55dc..9a1f646 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -9,4 +9,4 @@ XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.bz2
 XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICEAUTH_DEPENDENCIES = xlib_libICE xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
index 1dd4604..8976e0a 100644
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ b/package/x11r7/xapp_ico/xapp_ico.mk
@@ -9,4 +9,4 @@ XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.bz2
 XAPP_ICO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICO_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index 49224bb..f304968 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -9,4 +9,4 @@ XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.bz2
 XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_LISTRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_luit/xapp_luit.mk b/package/x11r7/xapp_luit/xapp_luit.mk
index bab8045..92c717f 100644
--- a/package/x11r7/xapp_luit/xapp_luit.mk
+++ b/package/x11r7/xapp_luit/xapp_luit.mk
@@ -9,4 +9,4 @@ XAPP_LUIT_SOURCE = luit-$(XAPP_LUIT_VERSION).tar.bz2
 XAPP_LUIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_LUIT_DEPENDENCIES = xlib_libX11 xlib_libfontenc
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index 8047b21..e41e79a 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -9,5 +9,5 @@ XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
 XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index 02e7824..ba9448e 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -9,5 +9,5 @@ XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index 1300e63..f555f21 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -9,4 +9,4 @@ XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.bz2
 XAPP_OCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_OCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index 0b0d541..b303453 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -9,4 +9,4 @@ XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
 XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_RGB_DEPENDENCIES = xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_rstart/xapp_rstart.mk b/package/x11r7/xapp_rstart/xapp_rstart.mk
index cd71890..d62b1ba 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.mk
+++ b/package/x11r7/xapp_rstart/xapp_rstart.mk
@@ -9,4 +9,4 @@ XAPP_RSTART_SOURCE = rstart-$(XAPP_RSTART_VERSION).tar.bz2
 XAPP_RSTART_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_RSTART_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_scripts/xapp_scripts.mk b/package/x11r7/xapp_scripts/xapp_scripts.mk
index 3e844b4..d4f1fd1 100644
--- a/package/x11r7/xapp_scripts/xapp_scripts.mk
+++ b/package/x11r7/xapp_scripts/xapp_scripts.mk
@@ -9,4 +9,4 @@ XAPP_SCRIPTS_SOURCE = scripts-$(XAPP_SCRIPTS_VERSION).tar.bz2
 XAPP_SCRIPTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SCRIPTS_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index a1f3f4b..ebe2eda 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -9,4 +9,4 @@ XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
 XAPP_SESSREG_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SESSREG_DEPENDENCIES = xlib_libX11 xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index f503a47..9986a5a 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -9,4 +9,4 @@ XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.bz2
 XAPP_SETXKBMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SETXKBMAP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index 4c8b689..c3c0b49 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -9,4 +9,4 @@ XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.bz2
 XAPP_SHOWFONT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SHOWFONT_DEPENDENCIES = xlib_libFS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index 3082cb1..e04decf 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -9,4 +9,4 @@ XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.bz2
 XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SMPROXY_DEPENDENCIES = xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index 18de28f..0b82c97 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -9,4 +9,4 @@ XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 69d8598..9cb1beb 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -9,4 +9,4 @@ XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
 XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_VIEWRES_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index 6112769..bb399c8 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -9,4 +9,4 @@ XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
 XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_X11PERF_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXft
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index 93977f9..0d74f70 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -9,4 +9,4 @@ XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
 XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index 8be5d37..031a330 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -9,4 +9,4 @@ XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
 XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index 78adad9..870101b 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -9,4 +9,4 @@ XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
 XAPP_XBIFF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBIFF_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index beb1313..ce88c34 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -10,4 +10,4 @@ XAPP_XCALC_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCALC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec install-data
 XAPP_XCALC_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index 28a93b9..ddbdfe6 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -9,4 +9,4 @@ XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.bz2
 XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index 271b1b0..d4221f0 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -9,4 +9,4 @@ XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.bz2
 XAPP_XCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index deab354..7a2ea76 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -9,4 +9,4 @@ XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.bz2
 XAPP_XCMSDB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index f191ecb..1a085d4 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -9,5 +9,5 @@ XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.bz2
 XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
index 8559a16..14cf21a 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
@@ -9,4 +9,4 @@ XAPP_XDBEDIZZY_SOURCE = xdbedizzy-$(XAPP_XDBEDIZZY_VERSION).tar.bz2
 XAPP_XDBEDIZZY_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext xlib_libXp xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index 3b1152d..53eea94 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -9,4 +9,4 @@ XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.bz2
 XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDITVIEW_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 7268d5d..5afcf91 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -19,4 +19,4 @@ endef
 
 XAPP_XDM_POST_INSTALL_TARGET_HOOKS += XAPP_XDM_INSTALL_STARTUP_SCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index 9cd6c97..045c1f9 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -9,4 +9,4 @@ XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
 XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXp xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index 3e7284b..cf7eed6 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -9,4 +9,4 @@ XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
 XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDRIINFO_DEPENDENCIES = xlib_libX11 xproto_glproto mesa3d
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index fd4158e..28b4e19 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -9,4 +9,4 @@ XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.bz2
 XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEDIT_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 4fa50fe..74d21c5 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -9,4 +9,4 @@ XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
 XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEV_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 8019aa9..806c510 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -9,4 +9,4 @@ XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
 XAPP_XEYES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
index 726d5ed..cf43bbb 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
@@ -15,4 +15,4 @@ XAPP_XF86DGA_DEPENDENCIES = \
 	xlib_libXaw \
 	xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 5717875..d6a9678 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -9,4 +9,4 @@ XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
 XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 9556fca..09ed000 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -9,4 +9,4 @@ XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.bz2
 XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 611b642..a2fa352 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -9,4 +9,4 @@ XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
 XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index bef0aed..009a22b 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -9,4 +9,4 @@ XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.bz2
 XAPP_XFSINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFSINFO_DEPENDENCIES = xlib_libFS xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index 0993482..78e0501 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -9,4 +9,4 @@ XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.bz2
 XAPP_XGAMMA_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGAMMA_DEPENDENCIES = xlib_libXxf86vm
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index e39d268..bc0037b 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -9,4 +9,4 @@ XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
 XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGC_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index 7859f23..9efd26b 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -9,4 +9,4 @@ XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
 XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XHOST_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index dc1decf..39a0bf5 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -9,4 +9,4 @@ XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
 XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 4bc5879..9a39422 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -9,4 +9,4 @@ XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk b/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk
index f84d1c2..3357863 100644
--- a/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk
+++ b/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk
@@ -9,4 +9,4 @@ XAPP_XINPUT_CALIBRATOR_SOURCE = xinput_calibrator-$(XAPP_XINPUT_CALIBRATOR_VERSI
 XAPP_XINPUT_CALIBRATOR_SITE = http://github.com/downloads/tias/xinput_calibrator
 XAPP_XINPUT_CALIBRATOR_DEPENDENCIES = xlib_libX11 xlib_libXi
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index f92588c..76e9d73 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -9,5 +9,5 @@ XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index e8f7a36..f9d2d5e 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -9,4 +9,4 @@ XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.bz2
 XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBEVD_DEPENDENCIES = xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index 98c7560..44abda6 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -9,4 +9,4 @@ XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.bz2
 XAPP_XKBPRINT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBPRINT_DEPENDENCIES = xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index 1ccbdb9..4bb1c30 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -9,4 +9,4 @@ XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
 XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBUTILS_DEPENDENCIES = xlib_libXaw xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index 16c3760..5613953 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -9,4 +9,4 @@ XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.bz2
 XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKILL_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index f84c158..7cee86b 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -9,4 +9,4 @@ XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.bz2
 XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index f79eafa..20ca359 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -10,4 +10,4 @@ XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil xlib_libXrender \
 			  xlib_libXft host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index 887f815..ad3534d 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -9,4 +9,4 @@ XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
 XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSATOMS_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index 5a8563a..c857cd0 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -9,4 +9,4 @@ XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
 XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index 6f997d8..a17be1d 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -9,4 +9,4 @@ XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.bz2
 XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSFONTS_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index caf7bf6..f53e7e0 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -9,4 +9,4 @@ XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.bz2
 XAPP_XMAG_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAG_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index c14a5ba..b5ed7c7 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -12,4 +12,4 @@ XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
 		ac_cv_file__etc_man_config=no \
 		ac_cv_file__etc_manpath_config=no
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 3f47b26..bc9dd1c 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -9,4 +9,4 @@ XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.bz2
 XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index 280b7e7..3f5f678 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -9,4 +9,4 @@ XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
 XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMH_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index 1a6c44a..36270b5 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -9,4 +9,4 @@ XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.bz2
 XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMODMAP_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index bd371ea..2f5370a 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -9,4 +9,4 @@ XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
 XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMORE_DEPENDENCIES = xlib_libXprintUtil xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk b/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
index 08a1b4a..63cc06d 100644
--- a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
+++ b/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
@@ -9,4 +9,4 @@ XAPP_XPLSPRINTERS_SOURCE = xplsprinters-$(XAPP_XPLSPRINTERS_VERSION).tar.bz2
 XAPP_XPLSPRINTERS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPLSPRINTERS_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index 4ac3da4..833eb1c 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -9,4 +9,4 @@ XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.bz2
 XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk b/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
index 1bb7365..55f6ddf 100644
--- a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
+++ b/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
@@ -9,4 +9,4 @@ XAPP_XPREHASHPRINTERLIST_SOURCE = xprehashprinterlist-$(XAPP_XPREHASHPRINTERLIST
 XAPP_XPREHASHPRINTERLIST_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPREHASHPRINTERLIST_DEPENDENCIES = xlib_libX11 xlib_libXp
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 1615ac2..a04776e 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -9,4 +9,4 @@ XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
 XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPROP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 74bf97b..80fe182 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -10,4 +10,4 @@ XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
 XAPP_XRANDR_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index 3a0cfdc..4fae336 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -9,4 +9,4 @@ XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.bz2
 XAPP_XRDB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRDB_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index ac7ed7c..b2bcdf4 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -9,4 +9,4 @@ XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.bz2
 XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 32d6722..bc28486 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -9,4 +9,4 @@ XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
 XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSET_DEPENDENCIES = xlib_libXfontcache xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
index 158318d..0b894c9 100644
--- a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
+++ b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
@@ -9,4 +9,4 @@ XAPP_XSETMODE_SOURCE = xsetmode-$(XAPP_XSETMODE_VERSION).tar.bz2
 XAPP_XSETMODE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETMODE_DEPENDENCIES = xlib_libX11 xlib_libXi
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
index 1a02542..c0173c0 100644
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
+++ b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
@@ -9,4 +9,4 @@ XAPP_XSETPOINTER_SOURCE = xsetpointer-$(XAPP_XSETPOINTER_VERSION).tar.bz2
 XAPP_XSETPOINTER_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETPOINTER_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXi
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 937f3e5..84ebfdb 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -9,4 +9,4 @@ XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
 XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xdata_xbitmaps
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index c7e261f..60277f1 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -9,4 +9,4 @@ XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.bz2
 XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSM_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
index e33a51e..a51cc23 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
@@ -9,4 +9,4 @@ XAPP_XSTDCMAP_SOURCE = xstdcmap-$(XAPP_XSTDCMAP_VERSION).tar.bz2
 XAPP_XSTDCMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSTDCMAP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
index 0fd91db..348c29d 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
@@ -9,4 +9,4 @@ XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.bz2
 XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index fe10628..10832cf 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -9,4 +9,4 @@ XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
 XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVINFO_DEPENDENCIES = xlib_libX11 xlib_libXv
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index 95d6098..e222fbe 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -9,4 +9,4 @@ XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
 XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index 541efde..0205688 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -9,4 +9,4 @@ XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.bz2
 XAPP_XWININFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWININFO_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 69bb228..03a72dd 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -9,4 +9,4 @@ XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.bz2
 XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 3479a23..77246ec 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -11,6 +11,6 @@ XCB_PROTO_INSTALL_STAGING = YES
 
 XCB_PROTO_DEPENDENCIES = host-python
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index c43e4cb..c3d9571 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -9,5 +9,5 @@ XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
 XCB_UTIL_INSTALL_STAGING = YES
 XCB_UTIL_DEPENDENCIES = host-gperf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index 52b21ea..669c2b5 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -9,4 +9,4 @@ XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.bz2
 XDATA_XBITMAPS_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XBITMAPS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index 08a8855..0403189 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -9,4 +9,4 @@ XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
 XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
index e55f979..57b1bad 100644
--- a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
+++ b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_ACECAD_SOURCE = xf86-input-acecad-$(XDRIVER_XF86_INPUT_ACECAD
 XDRIVER_XF86_INPUT_ACECAD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_ACECAD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
index c3299ac..26ba27e 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
+++ b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_AIPTEK_SOURCE = xf86-input-aiptek-$(XDRIVER_XF86_INPUT_AIPTEK
 XDRIVER_XF86_INPUT_AIPTEK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_AIPTEK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index d1964b2..8a0713d 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VE
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index afbf286..1bcf3b0 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JO
 XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index e0b57de..51fddad 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KE
 XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_kbproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 55c6370..c51bf3f 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VE
 XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 6f9d66d..dc33cba 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_
 XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index eaf8f2a..5184ac4 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -14,4 +14,4 @@ XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = \
 	xproto_xproto \
 	tslib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index 386c4d1..f44e246 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMO
 XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
index 1beed2e..f053711 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_VOID_SOURCE = xf86-input-void-$(XDRIVER_XF86_INPUT_VOID_VERSI
 XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
index ab6e8fb..34b5587 100644
--- a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
+++ b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_APM_SOURCE = xf86-video-apm-$(XDRIVER_XF86_VIDEO_APM_VERSION)
 XDRIVER_XF86_VIDEO_APM_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_APM_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86rushproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
index 6cb689e..1ddbc07 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION)
 XDRIVER_XF86_VIDEO_ARK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index f71b707..4865aff 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -8,4 +8,4 @@ XDRIVER_XF86_VIDEO_AST_VERSION = 0.89.9
 XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index a357cf2..c1e945d 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
index 5e9d9ab..85cc7ee 100644
--- a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
+++ b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_CHIPS_SOURCE = xf86-video-chips-$(XDRIVER_XF86_VIDEO_CHIPS_VE
 XDRIVER_XF86_VIDEO_CHIPS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_CHIPS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index 774688d..f0cf009 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_CIRRUS_SOURCE = xf86-video-cirrus-$(XDRIVER_XF86_VIDEO_CIRRUS
 XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 91182fe..c0d067c 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VE
 XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index 7634d92..ad5a31d 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VE
 XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index faee8ca..df35b2d 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VE
 XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
index cd611b6..b88dbce 100644
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_GLIDE_SOURCE = xf86-video-glide-$(XDRIVER_XF86_VIDEO_GLIDE_VE
 XDRIVER_XF86_VIDEO_GLIDE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
index 2ff7669..a5a241a 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_GLINT_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_GLINT_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index 4188dc5..2678dd2 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSI
 XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
index 47ba28d..11c0b4a 100644
--- a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
+++ b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_I740_SOURCE = xf86-video-i740-$(XDRIVER_XF86_VIDEO_I740_VERSI
 XDRIVER_XF86_VIDEO_I740_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_I740_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index a24a241..cbf83a6 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -11,4 +11,4 @@ XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = --enable-dri
 XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 0636085..d7ba337 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 64bae46..b36a7e4 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
index 27e028b..9c86660 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_NEOMAGIC_SOURCE = xf86-video-neomagic-$(XDRIVER_XF86_VIDEO_NE
 XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NEOMAGIC_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
index 1138744..98dfe90 100644
--- a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
+++ b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_NEWPORT_SOURCE = xf86-video-newport-$(XDRIVER_XF86_VIDEO_NEWP
 XDRIVER_XF86_VIDEO_NEWPORT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NEWPORT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 4886fe8..5e9eb8c 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).ta
 XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index c166559..b4bd166 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -24,4 +24,4 @@ XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
 
 XDRIVER_XF86_VIDEO_OPENCHROME_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 8430d73..56d0c85 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_R128_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
index 51efbd4..e1c083a 100644
--- a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
+++ b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_RENDITION_SOURCE = xf86-video-rendition-$(XDRIVER_XF86_VIDEO_
 XDRIVER_XF86_VIDEO_RENDITION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_RENDITION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
index 6c619c9..ced1c69 100644
--- a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
+++ b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_S3_SOURCE = xf86-video-s3-$(XDRIVER_XF86_VIDEO_S3_VERSION).ta
 XDRIVER_XF86_VIDEO_S3_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_S3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
index 68b0acc..c53bf96 100644
--- a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
+++ b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_S3VIRGE_SOURCE = xf86-video-s3virge-$(XDRIVER_XF86_VIDEO_S3VI
 XDRIVER_XF86_VIDEO_S3VIRGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_S3VIRGE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 32ef7f5..a11b41a 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 9f5d7fd..59b133b 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF8
 XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index 69a5d52..05402ce 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
index e9e529d..978b7cd 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
+++ b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SISUSB_SOURCE = xf86-video-sisusb-$(XDRIVER_XF86_VIDEO_SISUSB
 XDRIVER_XF86_VIDEO_SISUSB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
index f7c4f64..3309bdc 100644
--- a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNCG14_SOURCE = xf86-video-suncg14-$(XDRIVER_XF86_VIDEO_SUNC
 XDRIVER_XF86_VIDEO_SUNCG14_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG14_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
index adef006..c7ebec7 100644
--- a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNCG3_SOURCE = xf86-video-suncg3-$(XDRIVER_XF86_VIDEO_SUNCG3
 XDRIVER_XF86_VIDEO_SUNCG3_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
index 0d1f11e..c53aea4 100644
--- a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNCG6_SOURCE = xf86-video-suncg6-$(XDRIVER_XF86_VIDEO_SUNCG6
 XDRIVER_XF86_VIDEO_SUNCG6_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG6_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
index be667a2..43fb79b 100644
--- a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
+++ b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNFFB_SOURCE = xf86-video-sunffb-$(XDRIVER_XF86_VIDEO_SUNFFB
 XDRIVER_XF86_VIDEO_SUNFFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNFFB_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk b/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
index b0cc953..1eb5db8 100644
--- a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
+++ b/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNLEO_SOURCE = xf86-video-sunleo-$(XDRIVER_XF86_VIDEO_SUNLEO
 XDRIVER_XF86_VIDEO_SUNLEO_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNLEO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
index 135ddd7..e2e0960 100644
--- a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
+++ b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNTCX_SOURCE = xf86-video-suntcx-$(XDRIVER_XF86_VIDEO_SUNTCX
 XDRIVER_XF86_VIDEO_SUNTCX_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNTCX_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index dd2643a..939d986 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
index fb69d51..7c8b7ec 100644
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_TGA_SOURCE = xf86-video-tga-$(XDRIVER_XF86_VIDEO_TGA_VERSION)
 XDRIVER_XF86_VIDEO_TGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TGA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index af44f69..3f72104 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRID
 XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
index dc3d8fa..910ea2e 100644
--- a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
+++ b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_TSENG_SOURCE = xf86-video-tseng-$(XDRIVER_XF86_VIDEO_TSENG_VE
 XDRIVER_XF86_VIDEO_TSENG_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TSENG_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
index 214fc67..84cfb0d 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
+++ b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_V4L_SOURCE = xf86-video-v4l-$(XDRIVER_XF86_VIDEO_V4L_VERSION)
 XDRIVER_XF86_VIDEO_V4L_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_V4L_DEPENDENCIES = xserver_xorg-server xproto_randrproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index bc4c38e..8698260 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_VESA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index 4425112..5eb31c3 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE
 XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
index 86caaae..843a6e6 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
+++ b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_VOODOO_SOURCE = xf86-video-voodoo-$(XDRIVER_XF86_VIDEO_VOODOO
 XDRIVER_XF86_VIDEO_VOODOO_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
index 7dfbd8d..6218730 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_WSFB_SOURCE = xf86-video-wsfb-$(XDRIVER_XF86_VIDEO_WSFB_VERSI
 XDRIVER_XF86_VIDEO_WSFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
index 837c9dd..fbe1531 100644
--- a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
+++ b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_XGI_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_XGI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_XGI_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
index a3edd20..659b2d7 100644
--- a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
+++ b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_XGIXP_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_XGIXP_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_XGIXP_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index ead8ace..d32979b 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -9,5 +9,5 @@ XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
 XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 45029e1..32ef00b 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE
 XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index e172323..b8fc1e3 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index cbb78ad..e742713 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFO
 XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index f4e9c8b..756cb5e 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFON
 XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index 5056e63..41fe519 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFON
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index 34b52e2..502b562 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ALIAS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST
 XFONT_FONT_ALIAS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index e26f998..2efcfb3 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index 52e30b5..c7e9fb6 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index 58ebb96..5009bfc 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index 7f3e82a..3e8be73 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DI
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 35b1ecc..7cba54a 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index 2ded871..940c5ca 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_TTF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOS
 XFONT_FONT_BH_TTF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index 524bbc6..4bb6448 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index 46fe2f7..9c57d53 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTS
 XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index f489def..78948ea 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
index 72dd7cc..aa81f38 100644
--- a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
+++ b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTS
 XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_SPEEDO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 5ee876e..2d87655 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 7b8c25a..0a27fcb 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -11,5 +11,5 @@ XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 47c5433..40646c2 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index 7b2d16d..88126ce 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index d90733d..f394ed4 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 561179d..1dd9242 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -11,5 +11,5 @@ XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 837ed13..57f8cad 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 742a995..93b9fc8 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 6f0bd58..51c231e 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$
 XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 716e04a..efec5cb 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -11,5 +11,5 @@ XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCAL
 XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index 2af5345..7e874ca 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -11,5 +11,5 @@ XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCAL
 XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index 3707c1f..d493315 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -11,5 +11,5 @@ XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index af4cc31..68621e1 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -11,4 +11,4 @@ XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 7c24ed9..065fb1b 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index 2cf822e..69bc2f3 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index 7db1b53..18592fe 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -11,5 +11,5 @@ XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 53036af..05cfde5 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index 7001e5d..ce3f01c 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index c5243ad..ecc065b 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -11,5 +11,5 @@ XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
 XFONT_FONT_UTIL_INSTALL_STAGING = YES
 XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 8a55a50..548327c 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -11,5 +11,5 @@ XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONT
 XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index 999b789..b69fdb1 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -11,5 +11,5 @@ XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCAL
 XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 453f862..c84b941 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -9,5 +9,5 @@ XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-conf
 XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
 XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index d6334aa..a188fad 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -11,4 +11,4 @@ XLIB_LIBFS_INSTALL_STAGING = YES
 XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto
 XLIB_LIBFS_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 566e1de..b7d56bb 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -10,4 +10,4 @@ XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBICE_INSTALL_STAGING = YES
 XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 7ff5830..4aeb561 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -11,4 +11,4 @@ XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
 XLIB_LIBSM_CONF_OPT = --without-libuuid
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 4d12a84..b30fcdc 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -37,5 +37,5 @@ endef
 
 XLIB_LIBX11_POST_CONFIGURE_HOOKS += XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 00cc452..b345ad0 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -11,4 +11,4 @@ XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
 XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
 XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 8d67501..717d35f 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -10,5 +10,5 @@ XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index 1142c76..2bf6b73 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -11,4 +11,4 @@ XLIB_LIBXAW_INSTALL_STAGING = YES
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto xlib_libXp
 XLIB_LIBXAW_CONF_OPT = --disable-docs
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index 919d6fc..a02b562 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -10,4 +10,4 @@ XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
 XLIB_LIBXCOMPOSITE_DEPENDENCIES = xproto_compositeproto xlib_libX11 xlib_libXext xlib_libXfixes xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index d12520a..db85704 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -10,5 +10,5 @@ XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 9f10e56..b76a737 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -10,4 +10,4 @@ XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
 XLIB_LIBXDAMAGE_DEPENDENCIES = xproto_damageproto xlib_libX11 xlib_libXfixes xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 5308206..78e8e05 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -10,5 +10,5 @@ XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 2cdffa6..d255585 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -11,4 +11,4 @@ XLIB_LIBXEXT_INSTALL_STAGING = YES
 XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
 XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 2db9b36..b456611 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -10,5 +10,5 @@ XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 2b47e4e..d3c8f5f 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -14,5 +14,5 @@ XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 
 HOST_XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
index 1b1d4db..f66fbf1 100644
--- a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
+++ b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
@@ -11,4 +11,4 @@ XLIB_LIBXFONTCACHE_INSTALL_STAGING = YES
 XLIB_LIBXFONTCACHE_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_fontcacheproto
 XLIB_LIBXFONTCACHE_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 44ddcbe..2458217 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -11,4 +11,4 @@ XLIB_LIBXFT_AUTORECONF = YES
 XLIB_LIBXFT_INSTALL_STAGING = YES
 XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 8c14007..700bc7d 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -11,4 +11,4 @@ XLIB_LIBXI_INSTALL_STAGING = YES
 XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
 XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index aadf129..3e5ce0e 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -11,4 +11,4 @@ XLIB_LIBXINERAMA_INSTALL_STAGING = YES
 XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
 XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index ad0d49d..00c3d92 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -10,4 +10,4 @@ XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXMU_INSTALL_STAGING = YES
 XLIB_LIBXMU_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXp/xlib_libXp.mk b/package/x11r7/xlib_libXp/xlib_libXp.mk
index 1df392f..5dab086 100644
--- a/package/x11r7/xlib_libXp/xlib_libXp.mk
+++ b/package/x11r7/xlib_libXp/xlib_libXp.mk
@@ -11,4 +11,4 @@ XLIB_LIBXP_INSTALL_STAGING = YES
 XLIB_LIBXP_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xproto_printproto
 XLIB_LIBXP_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 6819f57..e7eef39 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -10,4 +10,4 @@ XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPM_INSTALL_STAGING = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk b/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
index f942626..68a08dd 100644
--- a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
+++ b/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
@@ -10,4 +10,4 @@ XLIB_LIBXPRINTAPPUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPRINTAPPUTIL_INSTALL_STAGING = YES
 XLIB_LIBXPRINTAPPUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
index b693b28..eba9e9f 100644
--- a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
+++ b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
@@ -10,4 +10,4 @@ XLIB_LIBXPRINTUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPRINTUTIL_INSTALL_STAGING = YES
 XLIB_LIBXPRINTUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXt xproto_printproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 038494b..2410735 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -11,4 +11,4 @@ XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
 XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 7a0a45e..d1b8b2d 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -11,5 +11,5 @@ XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
 XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 79c3bcf..d09e48d 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -11,4 +11,4 @@ XLIB_LIBXRES_INSTALL_STAGING = YES
 XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_resourceproto xproto_xproto
 XLIB_LIBXRES_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 765f0d5..666bd6c 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -12,4 +12,4 @@ XLIB_LIBXT_INSTALL_STAGING = YES
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
 XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --disable-install-makestrs
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index feab32a..f978b92 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -15,4 +15,4 @@ XLIB_LIBXTST_DEPENDENCIES = \
 	xlib_libXi \
 	xproto_recordproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index c51e4d0..28fd5ba 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -11,4 +11,4 @@ XLIB_LIBXV_INSTALL_STAGING = YES
 XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
 XLIB_LIBXV_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 725fa1e..cc1ceaf 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -11,4 +11,4 @@ XLIB_LIBXVMC_INSTALL_STAGING = YES
 XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xproto_videoproto xproto_xproto
 XLIB_LIBXVMC_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index 515bf51..22044a0 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -11,4 +11,4 @@ XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
 XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
 XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index b7a3292..e0bb4dc 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -11,4 +11,4 @@ XLIB_LIBXXF86VM_INSTALL_STAGING = YES
 XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
 XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index bd21f22..213c24f 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -11,4 +11,4 @@ XLIB_LIBDMX_INSTALL_STAGING = YES
 XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
 XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index eef592a..617e47b 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -10,5 +10,5 @@ XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_liboldX/xlib_liboldX.mk b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
index 56895ab..4342fe0 100644
--- a/package/x11r7/xlib_liboldX/xlib_liboldX.mk
+++ b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
@@ -11,4 +11,4 @@ XLIB_LIBOLDX_INSTALL_STAGING = YES
 XLIB_LIBOLDX_DEPENDENCIES = xlib_libX11
 XLIB_LIBOLDX_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index 6c78225..8c81fe7 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -9,4 +9,4 @@ XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
 XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index b964593..d4820c6 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -10,5 +10,5 @@ XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_INSTALL_STAGING = YES
 XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
index d605989..e0dcde2 100644
--- a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
+++ b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
@@ -10,4 +10,4 @@ XLIB_LIBXKBUI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBUI_INSTALL_STAGING = YES
 XLIB_LIBXKBUI_DEPENDENCIES = xlib_libxkbfile xlib_libXt xproto_kbproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index a153f4a..425efa5 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -9,5 +9,5 @@ XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
index 0ba5830..fc308d9 100644
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
+++ b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
@@ -10,4 +10,4 @@ XPROTO_APPLEWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_APPLEWMPROTO_INSTALL_STAGING = YES
 XPROTO_APPLEWMPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
index c9ce4cc..47bd238 100644
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -10,4 +10,4 @@ XPROTO_BIGREQSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_BIGREQSPROTO_INSTALL_STAGING = YES
 XPROTO_BIGREQSPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
index becf87f..795927d 100644
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
@@ -10,4 +10,4 @@ XPROTO_COMPOSITEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/pro
 XPROTO_COMPOSITEPROTO_INSTALL_STAGING = YES
 XPROTO_COMPOSITEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
index eb2d0a9..2c8ee2c 100644
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
@@ -10,4 +10,4 @@ XPROTO_DAMAGEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DAMAGEPROTO_INSTALL_STAGING = YES
 XPROTO_DAMAGEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
index eb6a4b1..de24967 100644
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
@@ -10,4 +10,4 @@ XPROTO_DMXPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DMXPROTO_INSTALL_STAGING = YES
 XPROTO_DMXPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
index 5fe2252..3fc5fa6 100644
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -10,4 +10,4 @@ XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DRI2PROTO_INSTALL_STAGING = YES
 XPROTO_DRI2PROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index 3ead64f..f38d2ab 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -10,5 +10,5 @@ XPROTO_FIXESPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FIXESPROTO_INSTALL_STAGING = YES
 XPROTO_FIXESPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 5e5ff5e..896498d 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -10,5 +10,5 @@ XPROTO_FONTCACHEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/pro
 XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
 XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index 33c1a80..9b66c95 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -10,5 +10,5 @@ XPROTO_FONTSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FONTSPROTO_INSTALL_STAGING = YES
 XPROTO_FONTSPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
index d5816cd..74d9f76 100644
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ b/package/x11r7/xproto_glproto/xproto_glproto.mk
@@ -10,4 +10,4 @@ XPROTO_GLPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_GLPROTO_INSTALL_STAGING = YES
 XPROTO_GLPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index 063a7f3..9a23b69 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -10,5 +10,5 @@ XPROTO_INPUTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 XPROTO_INPUTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index b2478f2..cd9fa61 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -10,5 +10,5 @@ XPROTO_KBPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_KBPROTO_INSTALL_STAGING = YES
 XPROTO_KBPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_printproto/xproto_printproto.mk b/package/x11r7/xproto_printproto/xproto_printproto.mk
index b500002..abea754 100644
--- a/package/x11r7/xproto_printproto/xproto_printproto.mk
+++ b/package/x11r7/xproto_printproto/xproto_printproto.mk
@@ -10,4 +10,4 @@ XPROTO_PRINTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_PRINTPROTO_INSTALL_STAGING = YES
 XPROTO_PRINTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index dd60b7f..11c7e82 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -10,4 +10,4 @@ XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RANDRPROTO_INSTALL_STAGING = YES
 XPROTO_RANDRPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
index d37eec7..73de777 100644
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.mk
+++ b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
@@ -10,4 +10,4 @@ XPROTO_RECORDPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RECORDPROTO_INSTALL_STAGING = YES
 XPROTO_RECORDPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index 49d2fbc..ef8fb5b 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -10,5 +10,5 @@ XPROTO_RENDERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RENDERPROTO_INSTALL_STAGING = YES
 XPROTO_RENDERPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
index 134c76c..78cfb91 100644
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
@@ -10,4 +10,4 @@ XPROTO_RESOURCEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/prot
 XPROTO_RESOURCEPROTO_INSTALL_STAGING = YES
 XPROTO_RESOURCEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
index 7eee0f8..c39f24d 100644
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -10,4 +10,4 @@ XPROTO_SCRNSAVERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/pro
 XPROTO_SCRNSAVERPROTO_INSTALL_STAGING = YES
 XPROTO_SCRNSAVERPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
index 1fd61a8..a8801ed 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
@@ -10,4 +10,4 @@ XPROTO_VIDEOPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_VIDEOPROTO_INSTALL_STAGING = YES
 XPROTO_VIDEOPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
index 4e1ea80..e2bd88e 100644
--- a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
+++ b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
@@ -10,4 +10,4 @@ XPROTO_WINDOWSWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/pro
 XPROTO_WINDOWSWMPROTO_INSTALL_STAGING = YES
 XPROTO_WINDOWSWMPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index f8e498d..13604a3 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -10,5 +10,5 @@ XPROTO_XCMISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
 XPROTO_XCMISCPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index 881ab70..053a019 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -10,5 +10,5 @@ XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XEXTPROTO_INSTALL_STAGING = YES
 XPROTO_XEXTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
index 87b607e..9ee12ce 100644
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -10,5 +10,5 @@ XPROTO_XF86BIGFONTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/p
 XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
 XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
index e8aed3c..8ad42ff 100644
--- a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
+++ b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
@@ -10,4 +10,4 @@ XPROTO_XF86DGAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XF86DGAPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DGAPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
index 0eb57f6..5cb688b 100644
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
+++ b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
@@ -10,4 +10,4 @@ XPROTO_XF86DRIPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XF86DRIPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DRIPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk b/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
index 577e325..caaded4 100644
--- a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
+++ b/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
@@ -10,4 +10,4 @@ XPROTO_XF86RUSHPROTO_SITE = http://xorg.freedesktop.org/releases/individual/prot
 XPROTO_XF86RUSHPROTO_INSTALL_STAGING = YES
 XPROTO_XF86RUSHPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
index 0194070..c502c6b 100644
--- a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
+++ b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
@@ -10,4 +10,4 @@ XPROTO_XF86VIDMODEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/p
 XPROTO_XF86VIDMODEPROTO_INSTALL_STAGING = YES
 XPROTO_XF86VIDMODEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
index ad2357c..4399e1d 100644
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
@@ -10,4 +10,4 @@ XPROTO_XINERAMAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/prot
 XPROTO_XINERAMAPROTO_INSTALL_STAGING = YES
 XPROTO_XINERAMAPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index 8f81d05..c24fa8f 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -10,5 +10,5 @@ XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XPROTO_INSTALL_STAGING = YES
 XPROTO_XPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index df7ba9a..20bec5e 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -152,4 +152,4 @@ else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-glx
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index a69d21f..9d85aaf 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -10,5 +10,5 @@ XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
 
 XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index c06cf01..85bfab0 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -10,5 +10,5 @@ XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
 XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index f130e42..76c5910 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -11,4 +11,4 @@ X11VNC_CONF_OPT = \
 
 X11VNC_DEPENDENCIES = xserver_xorg-server xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index e6dd312..9d101b0 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -20,4 +20,4 @@ define XAVANTE_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/sajax.lua"
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 72100f0..c5ef843 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -119,4 +119,4 @@ endef
 
 XENOMAI_POST_UNINSTALL_TARGET_HOOKS += XENOMAI_REMOVE_UDEV_RULES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 2a8817c..6d1adee 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -23,4 +23,4 @@ else
 XERCES_CONF_OPT += --disable-network
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 784f9b6..06c7a4e 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -18,4 +18,4 @@ XFSPROGS_CONF_OPT = \
 XFSPROGS_INSTALL_TARGET_OPT = DIST_ROOT=$(TARGET_DIR) install
 XFSPROGS_UNINSTALL_TARGET_OPT = DIST_ROOT=$(TARGET_DIR) uninstall
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index e44b75f..5d32a02 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -30,4 +30,4 @@ define XL2TP_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(GENTARGETS))
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 24637ec..2ca8f35 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -15,4 +15,4 @@ XMLSTARLET_CONF_OPT += --disable-static-libs \
 	--with-libxslt-prefix=${STAGING_DIR}/usr \
 	--with-libiconv-prefix=${STAGING_DIR}/usr
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index 16b45d7..73c25d9 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -9,5 +9,5 @@ XSTROKE_SITE = http://avr32linux.org/twiki/pub/Main/XStroke
 
 XSTROKE_DEPENDENCIES = xlib_libXft xlib_libXtst xlib_libXpm
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index f462c7f..c958df6 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -10,4 +10,4 @@ XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
 XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 8b03e65..7e8b42c 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -12,5 +12,5 @@ XVKBD_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_CC)" \
 
 XVKBD_DEPENDENCIES = xserver_xorg-server xlib_libXaw xlib_libXtst
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
 
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 8f2e0f1..dcb9f61 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -9,5 +9,5 @@ XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 1c0df38..bfe57a9 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -8,4 +8,4 @@ YAJL_VERSION = 2.0.4
 YAJL_SITE = git://github.com/lloyd/yajl.git
 YAJL_INSTALL_STAGING = YES
 
-$(eval $(call CMAKETARGETS))
+$(eval $(CMAKETARGETS))
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index b6c499d..1f3cec7 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -9,4 +9,4 @@ ZEROMQ_SITE = http://download.zeromq.org/
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 
-$(eval $(call AUTOTARGETS))
+$(eval $(AUTOTARGETS))
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index eca98b8..5e81fae 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -74,5 +74,5 @@ define HOST_ZLIB_UNINSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) uninstall
 endef
 
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(GENTARGETS_HOST))
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 06d9d0d..a3511ef 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -100,27 +100,27 @@ for i in $(find package/ -name '*.mk') ; do
     is_manual_target=0
     is_manual_host=0
 
-    if grep -E "\(call AUTOTARGETS,host\)" $i > /dev/null ; then
+    if grep -E "\(AUTOTARGETS_HOST\)" $i > /dev/null ; then
 	is_auto_host=1
     fi
 
-    if grep -E "\(call AUTOTARGETS\)" $i > /dev/null ; then
+    if grep -E "\(AUTOTARGETS\)" $i > /dev/null ; then
 	is_auto_target=1
     fi
 
-    if grep -E "\(call GENTARGETS,host\)" $i > /dev/null ; then
+    if grep -E "\(GENTARGETS_HOST\)" $i > /dev/null ; then
 	is_pkg_host=1
     fi
 
-    if grep -E "\(call GENTARGETS\)" $i > /dev/null ; then
+    if grep -E "\(GENTARGETS\)" $i > /dev/null ; then
 	is_pkg_target=1
     fi
 
-    if grep -E "\(call CMAKETARGETS,host\)" $i > /dev/null ; then
+    if grep -E "\(CMAKETARGETS_HOST\)" $i > /dev/null ; then
 	is_cmake_host=1
     fi
 
-    if grep -E "\(call CMAKETARGETS\)" $i > /dev/null ; then
+    if grep -E "\(CMAKETARGETS\)" $i > /dev/null ; then
 	is_cmake_target=1
     fi
 
-- 
tg: (9f7bf3b..) t/autotargets (depends on: master)
