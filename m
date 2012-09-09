From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Sep 2012 01:40:49 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_4/7=5D_packages=3A_introduce_the_?=
	=?utf-8?q?=5FAVAILABLE_symbol_to_all_packages?=
In-Reply-To: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1347234052-10527-5-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introducing this symbol to all packages will allow other packages
to both safely select a package, and inherit its dependency.

Given two packages, the mechanism works as follow:

    ---8<---
    config BR2_PKG_FOO_AVAILABLE
    	depends on BR2_LARGEFILE

    config BR2_PKG_FOO
    	bool "foo"
    	depends on BR2_PKG_FOO_AVAILABLE
    ---8<---

    ---8<---
    config BR2_PKG_BAR_AVAILABLE
    	def_bool y
    	depends on BR2_PKG_FOO_AVAILABLE
    	depends on BR2_HAS_THREADS

    config BR2_PKG_BAR
        bool "bar"
    	depends on BR2_PKG_BAR_AVAILABLE
    	select BR2_PKG_FOO
    ---8<---

In this case, the 'select' on package 'foo' from package 'bar' is possible,
because package 'bar' inherits, via the BR2_PKG_BAR_AVAILABLE symbol, the
same dependencies as package 'foo'. So, package 'bar' can not be visible
if package 'foo' is not (although 'bar' may be hidden because of other
dependencies of its own, missing threads in the example).

This patch only introduces this new symbol for all packages, moves the
packages' dependencies to these new symbols, and makes each package depend
solely on this new symbol. Cross-package use of 'select' will be introduced
in a later patch.

With the construct above, using 'select' is now safe.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/acl/Config.in                              |    6 +++++-
 package/acpid/Config.in                            |    6 +++++-
 package/alsa-lib/Config.in                         |    4 ++++
 package/alsamixergui/Config.in                     |    6 +++++-
 package/apr-util/Config.in                         |    6 +++++-
 package/apr/Config.in                              |    6 +++++-
 package/argp-standalone/Config.in                  |    4 ++++
 package/argus/Config.in                            |    4 ++++
 package/at/Config.in                               |    6 +++++-
 package/atk/Config.in                              |    6 +++++-
 package/attr/Config.in                             |    6 +++++-
 package/audiofile/Config.in                        |    6 +++++-
 package/autoconf/Config.in                         |    4 ++++
 package/automake/Config.in                         |    4 ++++
 package/avahi/Config.in                            |    4 ++++
 package/axel/Config.in                             |    6 +++++-
 package/bash/Config.in                             |    6 +++++-
 package/beecrypt/Config.in                         |    6 +++++-
 package/berkeleydb/Config.in                       |    4 ++++
 package/bind/Config.in                             |   10 +++++++---
 package/binutils/Config.in                         |    4 ++++
 package/bison/Config.in                            |    8 ++++++--
 package/blackbox/Config.in                         |    8 ++++++--
 package/bluez_utils/Config.in                      |    8 ++++++--
 package/bmon/Config.in                             |    6 +++++-
 package/boa/Config.in                              |    4 ++++
 package/bonnie/Config.in                           |    8 ++++++--
 package/boost/Config.in                            |    6 +++++-
 package/bootutils/Config.in                        |    6 +++++-
 package/bridge-utils/Config.in                     |    4 ++++
 package/bsdiff/Config.in                           |    4 ++++
 package/busybox/Config.in                          |    4 ++++
 package/bwm-ng/Config.in                           |    4 ++++
 package/bzip2/Config.in                            |    4 ++++
 package/cairo/Config.in                            |    4 ++++
 package/can-utils/Config.in                        |    4 ++++
 package/ccache/Config.in                           |    4 ++++
 package/cdrkit/Config.in                           |    6 +++++-
 package/cgilua/Config.in                           |    4 ++++
 package/cifs-utils/Config.in                       |    6 +++++-
 package/cjson/Config.in                            |    4 ++++
 package/collectd/Config.in                         |    8 ++++++--
 package/connman/Config.in                          |   12 ++++++++----
 package/conntrack-tools/Config.in                  |    8 ++++++--
 package/copas/Config.in                            |    4 ++++
 package/coreutils/Config.in                        |    6 +++++-
 package/coxpcall/Config.in                         |    4 ++++
 package/cpuload/Config.in                          |    4 ++++
 package/cramfs/Config.in                           |    4 ++++
 package/ctorrent/Config.in                         |    6 +++++-
 package/cups/Config.in                             |    6 +++++-
 package/customize/Config.in                        |    6 +++++-
 package/cvs/Config.in                              |    6 +++++-
 package/dash/Config.in                             |    4 ++++
 package/dbus-glib/Config.in                        |    8 ++++++--
 package/dbus-python/Config.in                      |    8 ++++++--
 package/dbus/Config.in                             |    6 +++++-
 package/devmem2/Config.in                          |    4 ++++
 package/dhcp/Config.in                             |    6 +++++-
 package/dhcpdump/Config.in                         |    4 ++++
 package/dhrystone/Config.in                        |    4 ++++
 package/dialog/Config.in                           |    4 ++++
 package/diffutils/Config.in                        |    6 +++++-
 package/directfb-examples/Config.in                |    6 +++++-
 package/directfb/Config.in                         |    4 ++++
 package/distcc/Config.in                           |    6 +++++-
 package/divine/Config.in                           |    6 +++++-
 package/dmalloc/Config.in                          |    4 ++++
 package/dmidecode/Config.in                        |    6 +++++-
 package/dmraid/Config.in                           |    6 +++++-
 package/dnsmasq/Config.in                          |    4 ++++
 package/docker/Config.in                           |    8 ++++++--
 package/dosfstools/Config.in                       |    6 +++++-
 package/dropbear/Config.in                         |    4 ++++
 package/dsp-tools/Config.in                        |    6 +++++-
 package/dstat/Config.in                            |    6 +++++-
 package/e2fsprogs/Config.in                        |    8 ++++++--
 package/ebtables/Config.in                         |    6 +++++-
 package/ed/Config.in                               |    4 ++++
 package/eeprog/Config.in                           |    4 ++++
 package/efl/Config.in                              |    6 +++++-
 package/efl/expedite/Config.in                     |    6 +++++-
 package/efl/libecore/Config.in                     |    4 ++++
 package/efl/libedbus/Config.in                     |    6 +++++-
 package/efl/libedje/Config.in                      |    4 ++++
 package/efl/libeet/Config.in                       |    4 ++++
 package/efl/libefreet/Config.in                    |    4 ++++
 package/efl/libeina/Config.in                      |    4 ++++
 package/efl/libelementary/Config.in                |    4 ++++
 package/efl/libembryo/Config.in                    |    4 ++++
 package/efl/libethumb/Config.in                    |    4 ++++
 package/efl/libevas/Config.in                      |    4 ++++
 package/empty/Config.in                            |    4 ++++
 package/enchant/Config.in                          |    8 ++++++--
 package/erlang/Config.in                           |    4 ++++
 package/ethtool/Config.in                          |    4 ++++
 package/expat/Config.in                            |    4 ++++
 package/explorercanvas/Config.in                   |    4 ++++
 package/ezxml/Config.in                            |    4 ++++
 package/fbdump/Config.in                           |    4 ++++
 package/fbgrab/Config.in                           |    4 ++++
 package/fbset/Config.in                            |    4 ++++
 package/fbterm/Config.in                           |    6 +++++-
 package/fbv/Config.in                              |    4 ++++
 package/fconfig/Config.in                          |    4 ++++
 package/feh/Config.in                              |    6 +++++-
 package/fftw/Config.in                             |    4 ++++
 package/file/Config.in                             |    4 ++++
 package/findutils/Config.in                        |    6 +++++-
 package/fis/Config.in                              |    4 ++++
 package/flashrom/Config.in                         |    6 +++++-
 package/flex/Config.in                             |    4 ++++
 package/flot/Config.in                             |    4 ++++
 package/fltk/Config.in                             |    8 ++++++--
 package/fluxbox/Config.in                          |    8 ++++++--
 package/fmtools/Config.in                          |    4 ++++
 package/fontconfig/Config.in                       |    4 ++++
 package/freerdp/Config.in                          |    6 +++++-
 package/freetype/Config.in                         |    4 ++++
 package/gadgetfs-test/Config.in                    |    4 ++++
 package/games/doom-wad/Config.in                   |    6 +++++-
 package/games/gnuchess/Config.in                   |    6 +++++-
 package/games/prboom/Config.in                     |    4 ++++
 package/games/rubix/Config.in                      |    6 +++++-
 package/gamin/Config.in                            |    6 +++++-
 package/gawk/Config.in                             |    6 +++++-
 package/gdisk/Config.in                            |    8 ++++++--
 package/gdk-pixbuf/Config.in                       |    6 +++++-
 package/genext2fs/Config.in                        |    4 ++++
 package/genromfs/Config.in                         |    6 +++++-
 package/gettext/Config.in                          |    8 ++++++--
 package/giblib/Config.in                           |    6 +++++-
 package/glib-networking/Config.in                  |    6 +++++-
 package/gmp/Config.in                              |    4 ++++
 package/gmpc/Config.in                             |    8 ++++++--
 package/gnutls/Config.in                           |    6 +++++-
 package/gob2/Config.in                             |    8 ++++++--
 package/gperf/Config.in                            |    6 +++++-
 package/gpsd/Config.in                             |    6 +++++-
 package/gqview/Config.in                           |    6 +++++-
 package/grep/Config.in                             |    6 +++++-
 package/gsl/Config.in                              |    4 ++++
 package/gtk2-engines/Config.in                     |    6 +++++-
 package/gtk2-themes/gtk2-theme-hicolor/Config.in   |    4 ++++
 package/gtkperf/Config.in                          |    6 +++++-
 package/gvfs/Config.in                             |    8 ++++++--
 package/gzip/Config.in                             |    6 +++++-
 package/haserl/Config.in                           |    4 ++++
 package/hdparm/Config.in                           |    6 +++++-
 package/heirloom-mailx/Config.in                   |    4 ++++
 package/hiawatha/Config.in                         |    4 ++++
 package/hostapd/Config.in                          |    6 +++++-
 package/htop/Config.in                             |    4 ++++
 package/hwdata/Config.in                           |    4 ++++
 package/i2c-tools/Config.in                        |    4 ++++
 package/icu/Config.in                              |    8 ++++++--
 package/ifplugd/Config.in                          |    4 ++++
 package/igh-ethercat/Config.in                     |    6 +++++-
 package/imagemagick/Config.in                      |    4 ++++
 package/imlib2/Config.in                           |    4 ++++
 package/inadyn/Config.in                           |    4 ++++
 package/inotify-tools/Config.in                    |    6 +++++-
 package/input-event-daemon/Config.in               |    6 +++++-
 package/input-tools/Config.in                      |    4 ++++
 package/intltool/Config.in                         |    8 ++++++--
 package/iostat/Config.in                           |    4 ++++
 package/iperf/Config.in                            |    8 ++++++--
 package/ipkg/Config.in                             |    4 ++++
 package/iproute2/Config.in                         |    4 ++++
 package/ipsec-tools/Config.in                      |    4 ++++
 package/ipset/Config.in                            |    6 +++++-
 package/iptables/Config.in                         |    4 ++++
 package/irda-utils/Config.in                       |    4 ++++
 package/iw/Config.in                               |    6 +++++-
 package/jpeg/Config.in                             |    4 ++++
 package/jquery-sparkline/Config.in                 |    4 ++++
 package/jquery-validation/Config.in                |    4 ++++
 package/jquery/Config.in                           |    4 ++++
 package/jsmin/Config.in                            |    4 ++++
 package/json-c/Config.in                           |    4 ++++
 package/kbd/Config.in                              |    6 +++++-
 package/kexec/Config.in                            |    4 ++++
 package/kismet/Config.in                           |    6 +++++-
 package/kmod/Config.in                             |    4 ++++
 package/latencytop/Config.in                       |    6 +++++-
 package/lcdproc/Config.in                          |    4 ++++
 package/leafpad/Config.in                          |    6 +++++-
 package/less/Config.in                             |    4 ++++
 package/libaio/Config.in                           |    8 ++++++--
 package/libao/Config.in                            |    4 ++++
 package/libarchive/Config.in                       |    6 +++++-
 package/libargtable2/Config.in                     |    4 ++++
 package/libart/Config.in                           |    4 ++++
 package/libatomic_ops/Config.in                    |    6 +++++-
 package/libcap-ng/Config.in                        |    4 ++++
 package/libcap/Config.in                           |    4 ++++
 package/libcdaudio/Config.in                       |    4 ++++
 package/libcgi/Config.in                           |    4 ++++
 package/libcgicc/Config.in                         |    6 +++++-
 package/libconfig/Config.in                        |    4 ++++
 package/libconfuse/Config.in                       |    4 ++++
 package/libcue/Config.in                           |    4 ++++
 package/libcuefile/Config.in                       |    4 ++++
 package/libcurl/Config.in                          |    4 ++++
 package/libdaemon/Config.in                        |    4 ++++
 package/libdmtx/Config.in                          |    4 ++++
 package/libdnet/Config.in                          |    4 ++++
 package/libdrm/Config.in                           |    8 ++++++--
 package/libdvdnav/Config.in                        |    6 +++++-
 package/libdvdread/Config.in                       |    6 +++++-
 package/libeXosip2/Config.in                       |    4 ++++
 package/libelf/Config.in                           |    4 ++++
 package/liberation/Config.in                       |    4 ++++
 package/libesmtp/Config.in                         |    4 ++++
 package/libev/Config.in                            |    4 ++++
 package/libevent/Config.in                         |    4 ++++
 package/libexif/Config.in                          |    4 ++++
 package/libfcgi/Config.in                          |    4 ++++
 package/libffi/Config.in                           |    4 ++++
 package/libfreefare/Config.in                      |    6 +++++-
 package/libftdi/Config.in                          |    6 +++++-
 package/libfuse/Config.in                          |    6 +++++-
 package/libgail/Config.in                          |    6 +++++-
 package/libgcrypt/Config.in                        |    4 ++++
 package/libgeotiff/Config.in                       |    4 ++++
 package/libglade/Config.in                         |    8 ++++++--
 package/libglib2/Config.in                         |    6 +++++-
 package/libgpg-error/Config.in                     |    4 ++++
 package/libgtk2/Config.in                          |   10 +++++++---
 package/libhid/Config.in                           |    6 +++++-
 package/libical/Config.in                          |    6 +++++-
 package/libiconv/Config.in                         |    6 +++++-
 package/libid3tag/Config.in                        |    4 ++++
 package/libidn/Config.in                           |    4 ++++
 package/libiqrf/Config.in                          |    6 +++++-
 package/liblo/Config.in                            |    6 +++++-
 package/liblockfile/Config.in                      |    4 ++++
 package/libmad/Config.in                           |    4 ++++
 package/libmbus/Config.in                          |    4 ++++
 package/libmicrohttpd/Config.in                    |    4 ++++
 package/libmms/Config.in                           |    6 +++++-
 package/libmnl/Config.in                           |    6 +++++-
 package/libmodbus/Config.in                        |    4 ++++
 package/libmpd/Config.in                           |    6 +++++-
 package/libmpeg2/Config.in                         |    4 ++++
 package/libnetfilter_conntrack/Config.in           |    4 ++++
 package/libnetfilter_cttimeout/Config.in           |    6 +++++-
 package/libnfc-llcp/Config.in                      |    6 +++++-
 package/libnfc/Config.in                           |    6 +++++-
 package/libnfnetlink/Config.in                     |    4 ++++
 package/libnl/Config.in                            |    6 +++++-
 package/libnspr/Config.in                          |    6 +++++-
 package/libnss/Config.in                           |    6 +++++-
 package/liboauth/Config.in                         |    4 ++++
 package/libogg/Config.in                           |    4 ++++
 package/liboping/Config.in                         |    6 +++++-
 package/libosip2/Config.in                         |    4 ++++
 package/libpcap/Config.in                          |    4 ++++
 package/libplayer/Config.in                        |    6 +++++-
 package/libpng/Config.in                           |    4 ++++
 package/libraw/Config.in                           |    6 +++++-
 package/libraw1394/Config.in                       |    4 ++++
 package/libreplaygain/Config.in                    |    4 ++++
 package/libroxml/Config.in                         |    4 ++++
 package/librsvg/Config.in                          |    8 ++++++--
 package/librsync/Config.in                         |    4 ++++
 package/libsamplerate/Config.in                    |    4 ++++
 package/libsexy/Config.in                          |    6 +++++-
 package/libsigc/Config.in                          |    6 +++++-
 package/libsndfile/Config.in                       |    4 ++++
 package/libsoup/Config.in                          |    6 +++++-
 package/libsvgtiny/Config.in                       |    4 ++++
 package/libsysfs/Config.in                         |    4 ++++
 package/libtheora/Config.in                        |    4 ++++
 package/libtool/Config.in                          |    4 ++++
 package/libtorrent/Config.in                       |    6 +++++-
 package/libtpl/Config.in                           |    4 ++++
 package/libungif/Config.in                         |    4 ++++
 package/libupnp/Config.in                          |    6 +++++-
 package/liburcu/Config.in                          |    6 +++++-
 package/libusb-compat/Config.in                    |    6 +++++-
 package/libusb/Config.in                           |    6 +++++-
 package/libv4l/Config.in                           |    6 +++++-
 package/libvncserver/Config.in                     |    4 ++++
 package/libvorbis/Config.in                        |    4 ++++
 package/libxml-parser-perl/Config.in               |    6 +++++-
 package/libxml2/Config.in                          |    4 ++++
 package/libxslt/Config.in                          |    4 ++++
 package/libyaml/Config.in                          |    4 ++++
 package/lighttpd/Config.in                         |    4 ++++
 package/links/Config.in                            |    4 ++++
 package/linphone/Config.in                         |    6 +++++-
 package/linux-firmware/Config.in                   |    4 ++++
 package/linux-fusion/Config.in                     |    6 +++++-
 package/linux-pam/Config.in                        |    6 +++++-
 package/lite/Config.in                             |    6 +++++-
 package/live555/Config.in                          |    6 +++++-
 package/lm-sensors/Config.in                       |    4 ++++
 package/lmbench/Config.in                          |    6 +++++-
 package/lockfile-progs/Config.in                   |    4 ++++
 package/logrotate/Config.in                        |    6 +++++-
 package/logsurfer/Config.in                        |    4 ++++
 package/lrzsz/Config.in                            |    4 ++++
 package/lshw/Config.in                             |    8 ++++++--
 package/lsof/Config.in                             |    4 ++++
 package/lsuio/Config.in                            |    4 ++++
 package/ltp-testsuite/Config.in                    |    6 +++++-
 package/ltrace/Config.in                           |    6 +++++-
 package/lttng-babeltrace/Config.in                 |   10 +++++++---
 package/lttng-libust/Config.in                     |   10 +++++++---
 package/lttng-modules/Config.in                    |    6 +++++-
 package/lttng-tools/Config.in                      |    8 ++++++--
 package/lua/Config.in                              |    4 ++++
 package/luacjson/Config.in                         |    4 ++++
 package/luaexpat/Config.in                         |    4 ++++
 package/luafilesystem/Config.in                    |    4 ++++
 package/luajit/Config.in                           |    6 +++++-
 package/luasocket/Config.in                        |    4 ++++
 package/lvm2/Config.in                             |    6 +++++-
 package/lzma/Config.in                             |    8 ++++++--
 package/lzo/Config.in                              |    4 ++++
 package/lzop/Config.in                             |    4 ++++
 package/m4/Config.in                               |    8 ++++++--
 package/make/Config.in                             |    4 ++++
 package/makedevs/Config.in                         |    6 +++++-
 package/matchbox/Config.in                         |    6 +++++-
 package/mdadm/Config.in                            |    4 ++++
 package/mediastreamer/Config.in                    |    6 +++++-
 package/memstat/Config.in                          |    4 ++++
 package/memtester/Config.in                        |    6 +++++-
 package/metacity/Config.in                         |    8 ++++++--
 package/microperl/Config.in                        |    6 +++++-
 package/midori/Config.in                           |   10 +++++++---
 package/mii-diag/Config.in                         |    4 ++++
 package/minicom/Config.in                          |    6 +++++-
 package/mobile-broadband-provider-info/Config.in   |    4 ++++
 package/module-init-tools/Config.in                |    4 ++++
 package/monit/Config.in                            |    4 ++++
 package/mpc/Config.in                              |    4 ++++
 package/mpfr/Config.in                             |    4 ++++
 package/mrouted/Config.in                          |    4 ++++
 package/msmtp/Config.in                            |    4 ++++
 package/mtd/Config.in                              |    4 ++++
 package/mtdev/Config.in                            |    4 ++++
 package/mtdev2tuio/Config.in                       |    6 +++++-
 package/multimedia/alsa-utils/Config.in            |    6 +++++-
 package/multimedia/aumix/Config.in                 |    4 ++++
 package/multimedia/bellagio/Config.in              |    6 +++++-
 package/multimedia/faad2/Config.in                 |    4 ++++
 package/multimedia/ffmpeg/Config.in                |    8 ++++++--
 package/multimedia/flac/Config.in                  |    4 ++++
 package/multimedia/gst-dsp/Config.in               |    6 +++++-
 package/multimedia/gst-ffmpeg/Config.in            |   10 +++++++---
 package/multimedia/gst-omapfb/Config.in            |    6 +++++-
 package/multimedia/gst-plugins-bad/Config.in       |    6 +++++-
 package/multimedia/gst-plugins-base/Config.in      |    6 +++++-
 package/multimedia/gst-plugins-good/Config.in      |    6 +++++-
 package/multimedia/gst-plugins-ugly/Config.in      |    6 +++++-
 package/multimedia/gstreamer/Config.in             |    6 +++++-
 package/multimedia/lame/Config.in                  |    4 ++++
 package/multimedia/madplay/Config.in               |    4 ++++
 package/multimedia/mpd/Config.in                   |    8 ++++++--
 package/multimedia/mpg123/Config.in                |    4 ++++
 package/multimedia/mplayer/Config.in               |    4 ++++
 package/multimedia/musepack/Config.in              |    4 ++++
 package/multimedia/pulseaudio/Config.in            |    6 +++++-
 package/multimedia/tidsp-binaries/Config.in        |    6 +++++-
 package/multimedia/vorbis-tools/Config.in          |    4 ++++
 package/multimedia/wavpack/Config.in               |    4 ++++
 package/mutt/Config.in                             |    6 +++++-
 package/mxml/Config.in                             |    4 ++++
 package/mysql_client/Config.in                     |    6 +++++-
 package/nano/Config.in                             |    4 ++++
 package/nanocom/Config.in                          |    4 ++++
 package/nbd/Config.in                              |    6 +++++-
 package/ncftp/Config.in                            |    6 +++++-
 package/ncurses/Config.in                          |    4 ++++
 package/ndisc6/Config.in                           |    6 +++++-
 package/neon/Config.in                             |    4 ++++
 package/netatalk/Config.in                         |    4 ++++
 package/netcat/Config.in                           |    4 ++++
 package/netkitbase/Config.in                       |    6 +++++-
 package/netkittelnet/Config.in                     |    6 +++++-
 package/netperf/Config.in                          |    4 ++++
 package/netplug/Config.in                          |    4 ++++
 package/netsnmp/Config.in                          |    4 ++++
 package/netstat-nat/Config.in                      |    4 ++++
 package/network-manager/Config.in                  |   10 +++++++---
 package/newt/Config.in                             |    4 ++++
 package/nfs-utils/Config.in                        |    8 ++++++--
 package/ngircd/Config.in                           |    4 ++++
 package/ngrep/Config.in                            |    4 ++++
 package/noip/Config.in                             |    4 ++++
 package/nss-mdns/Config.in                         |    8 ++++++--
 package/ntfs-3g/Config.in                          |    8 ++++++--
 package/ntp/Config.in                              |    4 ++++
 package/nuttcp/Config.in                           |    4 ++++
 package/ocf-linux/Config.in                        |    4 ++++
 package/ofono/Config.in                            |    8 ++++++--
 package/olsr/Config.in                             |    6 +++++-
 package/open2300/Config.in                         |    4 ++++
 package/opencv/Config.in                           |    8 ++++++--
 package/openntpd/Config.in                         |    6 +++++-
 package/openocd/Config.in                          |    6 +++++-
 package/openssh/Config.in                          |    4 ++++
 package/openssl/Config.in                          |    4 ++++
 package/openswan/Config.in                         |    4 ++++
 package/openvpn/Config.in                          |    4 ++++
 package/opkg/Config.in                             |    4 ++++
 package/oprofile/Config.in                         |    6 +++++-
 package/orc/Config.in                              |    4 ++++
 package/ortp/Config.in                             |    4 ++++
 package/owl-linux/Config.in                        |    8 ++++++--
 package/pango/Config.in                            |    8 ++++++--
 package/parted/Config.in                           |    8 ++++++--
 package/patch/Config.in                            |    6 +++++-
 package/pciutils/Config.in                         |    4 ++++
 package/pcmanfm/Config.in                          |   10 +++++++---
 package/pcre/Config.in                             |    4 ++++
 package/php/Config.in                              |    4 ++++
 package/picocom/Config.in                          |    4 ++++
 package/pixman/Config.in                           |    4 ++++
 package/pkg-config/Config.in                       |    6 +++++-
 package/poco/Config.in                             |    8 ++++++--
 package/polarssl/Config.in                         |    4 ++++
 package/popt/Config.in                             |    4 ++++
 package/portaudio/Config.in                        |    4 ++++
 package/portmap/Config.in                          |    6 +++++-
 package/pppd/Config.in                             |    4 ++++
 package/pptp-linux/Config.in                       |    4 ++++
 package/procps/Config.in                           |    4 ++++
 package/proftpd/Config.in                          |    4 ++++
 package/protobuf/Config.in                         |    6 +++++-
 package/psmisc/Config.in                           |    4 ++++
 package/pv/Config.in                               |    4 ++++
 package/python-dpkt/Config.in                      |    6 +++++-
 package/python-id3/Config.in                       |    6 +++++-
 package/python-mad/Config.in                       |    6 +++++-
 package/python-meld3/Config.in                     |    6 +++++-
 package/python-netifaces/Config.in                 |    6 +++++-
 package/python-nfc/Config.in                       |    6 +++++-
 package/python-pygame/Config.in                    |    6 +++++-
 package/python-serial/Config.in                    |    6 +++++-
 package/python-setuptools/Config.in                |    6 +++++-
 package/python/Config.in                           |    6 +++++-
 package/qt/Config.in                               |    6 +++++-
 package/quagga/Config.in                           |    4 ++++
 package/quota/Config.in                            |    8 ++++++--
 package/radvd/Config.in                            |    6 +++++-
 package/ramspeed/Config.in                         |    4 ++++
 package/rdesktop/Config.in                         |    6 +++++-
 package/read-edid/Config.in                        |    6 +++++-
 package/readline/Config.in                         |    4 ++++
 package/rings/Config.in                            |    4 ++++
 package/rng-tools/Config.in                        |    4 ++++
 package/rp-pppoe/Config.in                         |    6 +++++-
 package/rpm/Config.in                              |   10 +++++++---
 package/rrdtool/Config.in                          |    6 +++++-
 package/rsh-redone/Config.in                       |    4 ++++
 package/rsync/Config.in                            |    6 +++++-
 package/rsyslog/Config.in                          |    4 ++++
 package/rt-tests/Config.in                         |    4 ++++
 package/rtai/Config.in                             |    6 +++++-
 package/rtorrent/Config.in                         |    8 ++++++--
 package/ruby/Config.in                             |    6 +++++-
 package/samba/Config.in                            |    4 ++++
 package/sane-backends/Config.in                    |    4 ++++
 package/sawman/Config.in                           |    6 +++++-
 package/screen/Config.in                           |    4 ++++
 package/sdl/Config.in                              |    4 ++++
 package/sdl_gfx/Config.in                          |    6 +++++-
 package/sdl_image/Config.in                        |    6 +++++-
 package/sdl_mixer/Config.in                        |    6 +++++-
 package/sdl_net/Config.in                          |    6 +++++-
 package/sdl_sound/Config.in                        |    6 +++++-
 package/sdl_ttf/Config.in                          |    6 +++++-
 package/sdparm/Config.in                           |    4 ++++
 package/sed/Config.in                              |    6 +++++-
 package/ser2net/Config.in                          |    4 ++++
 package/setserial/Config.in                        |    6 +++++-
 package/shared-mime-info/Config.in                 |    6 +++++-
 package/slang/Config.in                            |    4 ++++
 package/smartmontools/Config.in                    |    6 +++++-
 package/socat/Config.in                            |    4 ++++
 package/socketcand/Config.in                       |    4 ++++
 package/sound-theme-borealis/Config.in             |    4 ++++
 package/sound-theme-freedesktop/Config.in          |    4 ++++
 package/spawn-fcgi/Config.in                       |    4 ++++
 package/speex/Config.in                            |    4 ++++
 package/sqlcipher/Config.in                        |    6 +++++-
 package/sqlite/Config.in                           |    4 ++++
 package/squashfs/Config.in                         |    8 ++++++--
 package/squashfs3/Config.in                        |    8 ++++++--
 package/squid/Config.in                            |    8 ++++++--
 package/sredird/Config.in                          |    4 ++++
 package/sshfs/Config.in                            |    8 ++++++--
 package/sstrip/Config.in                           |    4 ++++
 package/startup-notification/Config.in             |    6 +++++-
 package/statserial/Config.in                       |    4 ++++
 package/strace/Config.in                           |    4 ++++
 package/stress/Config.in                           |    4 ++++
 package/stunnel/Config.in                          |    4 ++++
 package/sudo/Config.in                             |    6 +++++-
 package/supervisor/Config.in                       |    6 +++++-
 package/sylpheed/Config.in                         |    6 +++++-
 package/synergy/Config.in                          |    8 ++++++--
 package/sysklogd/Config.in                         |    6 +++++-
 package/sysprof/Config.in                          |    8 ++++++--
 package/sysstat/Config.in                          |    6 +++++-
 package/systemd/Config.in                          |    8 ++++++--
 package/sysvinit/Config.in                         |    4 ++++
 package/taglib/Config.in                           |    6 +++++-
 package/tar/Config.in                              |    6 +++++-
 package/tcl/Config.in                              |    4 ++++
 package/tcpdump/Config.in                          |    4 ++++
 package/tcpreplay/Config.in                        |    4 ++++
 package/tftpd/Config.in                            |    4 ++++
 package/thttpd/Config.in                           |    4 ++++
 package/ti-utils/Config.in                         |    6 +++++-
 package/tiff/Config.in                             |    4 ++++
 package/tinyhttpd/Config.in                        |    4 ++++
 package/tn5250/Config.in                           |    4 ++++
 package/torsmo/Config.in                           |    6 +++++-
 package/transmission/Config.in                     |    6 +++++-
 package/tremor/Config.in                           |    4 ++++
 package/tslib/Config.in                            |    4 ++++
 package/ttcp/Config.in                             |    6 +++++-
 package/uboot-tools/Config.in                      |    4 ++++
 package/udev/Config.in                             |    8 ++++++--
 package/udpcast/Config.in                          |    6 +++++-
 package/uemacs/Config.in                           |    4 ++++
 package/unionfs/Config.in                          |    6 +++++-
 package/usb_modeswitch/Config.in                   |    6 +++++-
 package/usb_modeswitch_data/Config.in              |    4 ++++
 package/usbmount/Config.in                         |    8 ++++++--
 package/usbutils/Config.in                         |    6 +++++-
 package/ushare/Config.in                           |    6 +++++-
 package/util-linux/Config.in                       |    8 ++++++--
 package/vala/Config.in                             |    6 +++++-
 package/valgrind/Config.in                         |    8 ++++++--
 package/vim/Config.in                              |    4 ++++
 package/vpnc/Config.in                             |    4 ++++
 package/vsftpd/Config.in                           |    4 ++++
 package/vtun/Config.in                             |    4 ++++
 package/webkit/Config.in                           |    8 ++++++--
 package/webrtc-audio-processing/Config.in          |    8 ++++++--
 package/wget/Config.in                             |    8 ++++++--
 package/whetstone/Config.in                        |    4 ++++
 package/which/Config.in                            |    4 ++++
 package/wipe/Config.in                             |    4 ++++
 package/wireless_tools/Config.in                   |    4 ++++
 package/wpa_supplicant/Config.in                   |    4 ++++
 package/wsapi/Config.in                            |    4 ++++
 package/x11r7/libxcb/Config.in                     |    4 ++++
 package/x11r7/mcookie/Config.in                    |    4 ++++
 package/x11r7/mesa3d/Config.in                     |    8 ++++++--
 package/x11r7/pthread-stubs/Config.in              |    4 ++++
 package/x11r7/xapp_appres/Config.in                |    4 ++++
 package/x11r7/xapp_bdftopcf/Config.in              |    4 ++++
 package/x11r7/xapp_beforelight/Config.in           |    4 ++++
 package/x11r7/xapp_bitmap/Config.in                |    4 ++++
 package/x11r7/xapp_editres/Config.in               |    4 ++++
 package/x11r7/xapp_fonttosfnt/Config.in            |    4 ++++
 package/x11r7/xapp_fslsfonts/Config.in             |    4 ++++
 package/x11r7/xapp_fstobdf/Config.in               |    4 ++++
 package/x11r7/xapp_iceauth/Config.in               |    4 ++++
 package/x11r7/xapp_ico/Config.in                   |    4 ++++
 package/x11r7/xapp_listres/Config.in               |    4 ++++
 package/x11r7/xapp_luit/Config.in                  |    4 ++++
 package/x11r7/xapp_mkfontdir/Config.in             |    4 ++++
 package/x11r7/xapp_mkfontscale/Config.in           |    4 ++++
 package/x11r7/xapp_oclock/Config.in                |    4 ++++
 package/x11r7/xapp_rgb/Config.in                   |    4 ++++
 package/x11r7/xapp_rstart/Config.in                |    4 ++++
 package/x11r7/xapp_scripts/Config.in               |    4 ++++
 package/x11r7/xapp_sessreg/Config.in               |    4 ++++
 package/x11r7/xapp_setxkbmap/Config.in             |    4 ++++
 package/x11r7/xapp_showfont/Config.in              |    4 ++++
 package/x11r7/xapp_smproxy/Config.in               |    4 ++++
 package/x11r7/xapp_twm/Config.in                   |    4 ++++
 package/x11r7/xapp_viewres/Config.in               |    4 ++++
 package/x11r7/xapp_x11perf/Config.in               |    4 ++++
 package/x11r7/xapp_xauth/Config.in                 |    4 ++++
 package/x11r7/xapp_xbacklight/Config.in            |    4 ++++
 package/x11r7/xapp_xbiff/Config.in                 |    4 ++++
 package/x11r7/xapp_xcalc/Config.in                 |    4 ++++
 package/x11r7/xapp_xclipboard/Config.in            |    4 ++++
 package/x11r7/xapp_xclock/Config.in                |    4 ++++
 package/x11r7/xapp_xcmsdb/Config.in                |    4 ++++
 package/x11r7/xapp_xcursorgen/Config.in            |    4 ++++
 package/x11r7/xapp_xdbedizzy/Config.in             |    4 ++++
 package/x11r7/xapp_xditview/Config.in              |    4 ++++
 package/x11r7/xapp_xdm/Config.in                   |    4 ++++
 package/x11r7/xapp_xdpyinfo/Config.in              |    4 ++++
 package/x11r7/xapp_xdriinfo/Config.in              |    6 +++++-
 package/x11r7/xapp_xedit/Config.in                 |    4 ++++
 package/x11r7/xapp_xev/Config.in                   |    4 ++++
 package/x11r7/xapp_xeyes/Config.in                 |    4 ++++
 package/x11r7/xapp_xf86dga/Config.in               |    4 ++++
 package/x11r7/xapp_xfd/Config.in                   |    4 ++++
 package/x11r7/xapp_xfontsel/Config.in              |    4 ++++
 package/x11r7/xapp_xfs/Config.in                   |    4 ++++
 package/x11r7/xapp_xfsinfo/Config.in               |    4 ++++
 package/x11r7/xapp_xgamma/Config.in                |    4 ++++
 package/x11r7/xapp_xgc/Config.in                   |    4 ++++
 package/x11r7/xapp_xhost/Config.in                 |    4 ++++
 package/x11r7/xapp_xinit/Config.in                 |    4 ++++
 package/x11r7/xapp_xinput/Config.in                |    4 ++++
 package/x11r7/xapp_xinput_calibrator/Config.in     |    6 +++++-
 package/x11r7/xapp_xkbcomp/Config.in               |    4 ++++
 package/x11r7/xapp_xkbevd/Config.in                |    4 ++++
 package/x11r7/xapp_xkbprint/Config.in              |    4 ++++
 package/x11r7/xapp_xkbutils/Config.in              |    4 ++++
 package/x11r7/xapp_xkill/Config.in                 |    4 ++++
 package/x11r7/xapp_xload/Config.in                 |    4 ++++
 package/x11r7/xapp_xlogo/Config.in                 |    4 ++++
 package/x11r7/xapp_xlsatoms/Config.in              |    4 ++++
 package/x11r7/xapp_xlsclients/Config.in            |    4 ++++
 package/x11r7/xapp_xlsfonts/Config.in              |    4 ++++
 package/x11r7/xapp_xmag/Config.in                  |    4 ++++
 package/x11r7/xapp_xman/Config.in                  |    4 ++++
 package/x11r7/xapp_xmessage/Config.in              |    4 ++++
 package/x11r7/xapp_xmh/Config.in                   |    4 ++++
 package/x11r7/xapp_xmodmap/Config.in               |    4 ++++
 package/x11r7/xapp_xmore/Config.in                 |    4 ++++
 package/x11r7/xapp_xplsprinters/Config.in          |    4 ++++
 package/x11r7/xapp_xpr/Config.in                   |    4 ++++
 package/x11r7/xapp_xprehashprinterlist/Config.in   |    4 ++++
 package/x11r7/xapp_xprop/Config.in                 |    4 ++++
 package/x11r7/xapp_xrandr/Config.in                |    4 ++++
 package/x11r7/xapp_xrdb/Config.in                  |    4 ++++
 package/x11r7/xapp_xrefresh/Config.in              |    4 ++++
 package/x11r7/xapp_xset/Config.in                  |    4 ++++
 package/x11r7/xapp_xsetmode/Config.in              |    4 ++++
 package/x11r7/xapp_xsetpointer/Config.in           |    4 ++++
 package/x11r7/xapp_xsetroot/Config.in              |    4 ++++
 package/x11r7/xapp_xsm/Config.in                   |    4 ++++
 package/x11r7/xapp_xstdcmap/Config.in              |    4 ++++
 package/x11r7/xapp_xvidtune/Config.in              |    4 ++++
 package/x11r7/xapp_xvinfo/Config.in                |    4 ++++
 package/x11r7/xapp_xwd/Config.in                   |    4 ++++
 package/x11r7/xapp_xwininfo/Config.in              |    4 ++++
 package/x11r7/xapp_xwud/Config.in                  |    4 ++++
 package/x11r7/xcb-proto/Config.in                  |    4 ++++
 package/x11r7/xcb-util/Config.in                   |    4 ++++
 package/x11r7/xdata_xbitmaps/Config.in             |    4 ++++
 package/x11r7/xdata_xcursor-themes/Config.in       |    4 ++++
 package/x11r7/xdriver_xf86-input-acecad/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-input-aiptek/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |    4 ++++
 .../x11r7/xdriver_xf86-input-joystick/Config.in    |    4 ++++
 .../x11r7/xdriver_xf86-input-keyboard/Config.in    |    4 ++++
 package/x11r7/xdriver_xf86-input-mouse/Config.in   |    4 ++++
 .../x11r7/xdriver_xf86-input-synaptics/Config.in   |    4 ++++
 package/x11r7/xdriver_xf86-input-tslib/Config.in   |    4 ++++
 package/x11r7/xdriver_xf86-input-vmmouse/Config.in |    6 +++++-
 package/x11r7/xdriver_xf86-input-void/Config.in    |    4 ++++
 package/x11r7/xdriver_xf86-video-apm/Config.in     |    4 ++++
 package/x11r7/xdriver_xf86-video-ark/Config.in     |    4 ++++
 package/x11r7/xdriver_xf86-video-ast/Config.in     |    4 ++++
 package/x11r7/xdriver_xf86-video-ati/Config.in     |    4 ++++
 package/x11r7/xdriver_xf86-video-chips/Config.in   |    4 ++++
 package/x11r7/xdriver_xf86-video-cirrus/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-video-dummy/Config.in   |    4 ++++
 package/x11r7/xdriver_xf86-video-fbdev/Config.in   |    4 ++++
 package/x11r7/xdriver_xf86-video-geode/Config.in   |    4 ++++
 package/x11r7/xdriver_xf86-video-glide/Config.in   |    6 +++++-
 package/x11r7/xdriver_xf86-video-glint/Config.in   |    4 ++++
 package/x11r7/xdriver_xf86-video-i128/Config.in    |    4 ++++
 package/x11r7/xdriver_xf86-video-i740/Config.in    |    4 ++++
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    4 ++++
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-video-mga/Config.in     |    4 ++++
 .../x11r7/xdriver_xf86-video-neomagic/Config.in    |    4 ++++
 package/x11r7/xdriver_xf86-video-newport/Config.in |    4 ++++
 package/x11r7/xdriver_xf86-video-nv/Config.in      |    4 ++++
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-video-r128/Config.in    |    4 ++++
 .../x11r7/xdriver_xf86-video-rendition/Config.in   |    4 ++++
 package/x11r7/xdriver_xf86-video-s3/Config.in      |    4 ++++
 package/x11r7/xdriver_xf86-video-s3virge/Config.in |    4 ++++
 package/x11r7/xdriver_xf86-video-savage/Config.in  |    4 ++++
 .../xdriver_xf86-video-siliconmotion/Config.in     |    4 ++++
 package/x11r7/xdriver_xf86-video-sis/Config.in     |    4 ++++
 package/x11r7/xdriver_xf86-video-sisusb/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-video-suncg14/Config.in |    4 ++++
 package/x11r7/xdriver_xf86-video-suncg3/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-video-suncg6/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-video-sunffb/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-video-sunleo/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-video-suntcx/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-video-tdfx/Config.in    |    4 ++++
 package/x11r7/xdriver_xf86-video-tga/Config.in     |    4 ++++
 package/x11r7/xdriver_xf86-video-trident/Config.in |    4 ++++
 package/x11r7/xdriver_xf86-video-tseng/Config.in   |    4 ++++
 package/x11r7/xdriver_xf86-video-v4l/Config.in     |    4 ++++
 package/x11r7/xdriver_xf86-video-vesa/Config.in    |    4 ++++
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-video-voodoo/Config.in  |    4 ++++
 package/x11r7/xdriver_xf86-video-wsfb/Config.in    |    6 +++++-
 package/x11r7/xdriver_xf86-video-xgi/Config.in     |    4 ++++
 package/x11r7/xdriver_xf86-video-xgixp/Config.in   |    4 ++++
 package/x11r7/xfont_encodings/Config.in            |    4 ++++
 package/x11r7/xfont_font-adobe-100dpi/Config.in    |    4 ++++
 package/x11r7/xfont_font-adobe-75dpi/Config.in     |    4 ++++
 .../x11r7/xfont_font-adobe-utopia-100dpi/Config.in |    4 ++++
 .../x11r7/xfont_font-adobe-utopia-75dpi/Config.in  |    4 ++++
 .../x11r7/xfont_font-adobe-utopia-type1/Config.in  |    4 ++++
 package/x11r7/xfont_font-alias/Config.in           |    4 ++++
 package/x11r7/xfont_font-arabic-misc/Config.in     |    4 ++++
 package/x11r7/xfont_font-bh-100dpi/Config.in       |    4 ++++
 package/x11r7/xfont_font-bh-75dpi/Config.in        |    4 ++++
 .../Config.in                                      |    4 ++++
 .../xfont_font-bh-lucidatypewriter-75dpi/Config.in |    4 ++++
 package/x11r7/xfont_font-bh-ttf/Config.in          |    4 ++++
 package/x11r7/xfont_font-bh-type1/Config.in        |    4 ++++
 .../x11r7/xfont_font-bitstream-100dpi/Config.in    |    4 ++++
 package/x11r7/xfont_font-bitstream-75dpi/Config.in |    4 ++++
 .../x11r7/xfont_font-bitstream-speedo/Config.in    |    4 ++++
 package/x11r7/xfont_font-bitstream-type1/Config.in |    4 ++++
 package/x11r7/xfont_font-cronyx-cyrillic/Config.in |    4 ++++
 package/x11r7/xfont_font-cursor-misc/Config.in     |    4 ++++
 package/x11r7/xfont_font-daewoo-misc/Config.in     |    4 ++++
 package/x11r7/xfont_font-dec-misc/Config.in        |    4 ++++
 package/x11r7/xfont_font-ibm-type1/Config.in       |    4 ++++
 package/x11r7/xfont_font-isas-misc/Config.in       |    4 ++++
 package/x11r7/xfont_font-jis-misc/Config.in        |    4 ++++
 package/x11r7/xfont_font-micro-misc/Config.in      |    4 ++++
 package/x11r7/xfont_font-misc-cyrillic/Config.in   |    4 ++++
 package/x11r7/xfont_font-misc-ethiopic/Config.in   |    4 ++++
 package/x11r7/xfont_font-misc-meltho/Config.in     |    4 ++++
 package/x11r7/xfont_font-misc-misc/Config.in       |    4 ++++
 package/x11r7/xfont_font-mutt-misc/Config.in       |    4 ++++
 package/x11r7/xfont_font-schumacher-misc/Config.in |    4 ++++
 package/x11r7/xfont_font-screen-cyrillic/Config.in |    4 ++++
 package/x11r7/xfont_font-sony-misc/Config.in       |    4 ++++
 package/x11r7/xfont_font-sun-misc/Config.in        |    4 ++++
 package/x11r7/xfont_font-util/Config.in            |    4 ++++
 .../x11r7/xfont_font-winitzki-cyrillic/Config.in   |    4 ++++
 package/x11r7/xfont_font-xfree86-type1/Config.in   |    4 ++++
 package/x11r7/xkeyboard-config/Config.in           |    4 ++++
 package/x11r7/xlib_libFS/Config.in                 |    4 ++++
 package/x11r7/xlib_libICE/Config.in                |    4 ++++
 package/x11r7/xlib_libSM/Config.in                 |    4 ++++
 package/x11r7/xlib_libX11/Config.in                |    4 ++++
 package/x11r7/xlib_libXScrnSaver/Config.in         |    4 ++++
 package/x11r7/xlib_libXau/Config.in                |    4 ++++
 package/x11r7/xlib_libXaw/Config.in                |    4 ++++
 package/x11r7/xlib_libXcomposite/Config.in         |    4 ++++
 package/x11r7/xlib_libXcursor/Config.in            |    4 ++++
 package/x11r7/xlib_libXdamage/Config.in            |    4 ++++
 package/x11r7/xlib_libXdmcp/Config.in              |    4 ++++
 package/x11r7/xlib_libXext/Config.in               |    4 ++++
 package/x11r7/xlib_libXfixes/Config.in             |    4 ++++
 package/x11r7/xlib_libXfont/Config.in              |    4 ++++
 package/x11r7/xlib_libXfontcache/Config.in         |    4 ++++
 package/x11r7/xlib_libXft/Config.in                |    4 ++++
 package/x11r7/xlib_libXi/Config.in                 |    4 ++++
 package/x11r7/xlib_libXinerama/Config.in           |    4 ++++
 package/x11r7/xlib_libXmu/Config.in                |    4 ++++
 package/x11r7/xlib_libXp/Config.in                 |    4 ++++
 package/x11r7/xlib_libXpm/Config.in                |    4 ++++
 package/x11r7/xlib_libXprintAppUtil/Config.in      |    4 ++++
 package/x11r7/xlib_libXprintUtil/Config.in         |    4 ++++
 package/x11r7/xlib_libXrandr/Config.in             |    4 ++++
 package/x11r7/xlib_libXrender/Config.in            |    4 ++++
 package/x11r7/xlib_libXres/Config.in               |    4 ++++
 package/x11r7/xlib_libXt/Config.in                 |    4 ++++
 package/x11r7/xlib_libXtst/Config.in               |    4 ++++
 package/x11r7/xlib_libXv/Config.in                 |    4 ++++
 package/x11r7/xlib_libXvMC/Config.in               |    4 ++++
 package/x11r7/xlib_libXxf86dga/Config.in           |    4 ++++
 package/x11r7/xlib_libXxf86vm/Config.in            |    4 ++++
 package/x11r7/xlib_libdmx/Config.in                |    4 ++++
 package/x11r7/xlib_libfontenc/Config.in            |    4 ++++
 package/x11r7/xlib_liboldX/Config.in               |    4 ++++
 package/x11r7/xlib_libpciaccess/Config.in          |    6 +++++-
 package/x11r7/xlib_libxkbfile/Config.in            |    4 ++++
 package/x11r7/xlib_libxkbui/Config.in              |    4 ++++
 package/x11r7/xlib_xtrans/Config.in                |    4 ++++
 package/x11r7/xproto_applewmproto/Config.in        |    4 ++++
 package/x11r7/xproto_bigreqsproto/Config.in        |    4 ++++
 package/x11r7/xproto_compositeproto/Config.in      |    4 ++++
 package/x11r7/xproto_damageproto/Config.in         |    4 ++++
 package/x11r7/xproto_dmxproto/Config.in            |    4 ++++
 package/x11r7/xproto_dri2proto/Config.in           |    4 ++++
 package/x11r7/xproto_fixesproto/Config.in          |    4 ++++
 package/x11r7/xproto_fontcacheproto/Config.in      |    4 ++++
 package/x11r7/xproto_fontsproto/Config.in          |    4 ++++
 package/x11r7/xproto_glproto/Config.in             |    4 ++++
 package/x11r7/xproto_inputproto/Config.in          |    4 ++++
 package/x11r7/xproto_kbproto/Config.in             |    4 ++++
 package/x11r7/xproto_printproto/Config.in          |    4 ++++
 package/x11r7/xproto_randrproto/Config.in          |    4 ++++
 package/x11r7/xproto_recordproto/Config.in         |    4 ++++
 package/x11r7/xproto_renderproto/Config.in         |    4 ++++
 package/x11r7/xproto_resourceproto/Config.in       |    4 ++++
 package/x11r7/xproto_scrnsaverproto/Config.in      |    4 ++++
 package/x11r7/xproto_videoproto/Config.in          |    4 ++++
 package/x11r7/xproto_windowswmproto/Config.in      |    4 ++++
 package/x11r7/xproto_xcmiscproto/Config.in         |    4 ++++
 package/x11r7/xproto_xextproto/Config.in           |    4 ++++
 package/x11r7/xproto_xf86bigfontproto/Config.in    |    4 ++++
 package/x11r7/xproto_xf86dgaproto/Config.in        |    4 ++++
 package/x11r7/xproto_xf86driproto/Config.in        |    4 ++++
 package/x11r7/xproto_xf86rushproto/Config.in       |    4 ++++
 package/x11r7/xproto_xf86vidmodeproto/Config.in    |    4 ++++
 package/x11r7/xproto_xineramaproto/Config.in       |    4 ++++
 package/x11r7/xproto_xproto/Config.in              |    4 ++++
 package/x11r7/xserver_xorg-server/Config.in        |    6 +++++-
 package/x11r7/xutil_makedepend/Config.in           |    4 ++++
 package/x11r7/xutil_util-macros/Config.in          |    4 ++++
 package/x11vnc/Config.in                           |    6 +++++-
 package/xavante/Config.in                          |    4 ++++
 package/xenomai/Config.in                          |    8 ++++++--
 package/xerces/Config.in                           |    6 +++++-
 package/xfsprogs/Config.in                         |    8 ++++++--
 package/xinetd/Config.in                           |    4 ++++
 package/xl2tp/Config.in                            |    4 ++++
 package/xmlstarlet/Config.in                       |    4 ++++
 package/xstroke/Config.in                          |    6 +++++-
 package/xterm/Config.in                            |    6 +++++-
 package/xvkbd/Config.in                            |    6 +++++-
 package/xz/Config.in                               |    4 ++++
 package/yajl/Config.in                             |    4 ++++
 package/yasm/Config.in                             |    6 +++++-
 package/zeromq/Config.in                           |    8 ++++++--
 package/zlib/Config.in                             |    4 ++++
 package/zxing/Config.in                            |    6 +++++-
 829 files changed, 3684 insertions(+), 368 deletions(-)

diff --git a/package/acl/Config.in b/package/acl/Config.in
index f3d10d5..6fbca7a 100644
--- a/package/acl/Config.in
+++ b/package/acl/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_ACL_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_ACL
 	bool "acl"
 	select BR2_PACKAGE_ATTR
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_ACL_AVAILABLE
 	help
 	  POSIX Access Control Lists, which are used to define more
 	  fine-grained discretionary access rights for files and
diff --git a/package/acpid/Config.in b/package/acpid/Config.in
index ea9a364..3003865 100644
--- a/package/acpid/Config.in
+++ b/package/acpid/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_ACPID_AVAILABLE
+	def_bool y
+	depends on BR2_x86_64 || BR2_i386
+
 config BR2_PACKAGE_ACPID
 	bool "acpid"
-	depends on BR2_x86_64 || BR2_i386
+	depends on BR2_PACKAGE_ACPID_AVAILABLE
 	help
 	  Advanced Configuration and Power Interface event daemon.
 
diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 98b8313..ec8a558 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_ALSA_LIB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_ALSA_LIB
 	bool "alsa-lib"
 	# Temporary until
 	# https://bugtrack.alsa-project.org/alsa-bug/view.php?id=4913
 	# is fixed
 	select BR2_PACKAGE_ALSA_LIB_PCM
+	depends on BR2_PACKAGE_ALSA_LIB_AVAILABLE
 	help
 	  The Advanced Linux Sound Architecture (ALSA) provides audio and MIDI
 	  functionality to the Linux operating system.
diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index 3afc314..ea24538 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -1,11 +1,15 @@
-config BR2_PACKAGE_ALSAMIXERGUI
+config BR2_PACKAGE_ALSAMIXERGUI_AVAILABLE
+	def_bool y
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_ALSA_LIB
 	depends on BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_ALSAMIXERGUI
 	select BR2_PACKAGE_FLTK
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	bool "alsamixergui"
+	depends on BR2_PACKAGE_ALSAMIXERGUI_AVAILABLE
 	help
 	  A nice GUI mixer for Alsa using fltk
 
diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 895dbb8..62d267c 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -1,3 +1,7 @@
+config BR2_PACKAGE_APR_UTIL_AVAILABLE
+	def_bool y
+	depends on !BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_APR_UTIL
 	bool "apr-util"
 	select BR2_PACKAGE_APR
@@ -6,7 +10,7 @@ config BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_NEON_ZLIB
 	select BR2_PACKAGE_ZLIB
 	# apr really needs shared library support
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_PACKAGE_APR_UTIL_AVAILABLE
 	help
 	  The utility library for the apache runtime project
 
diff --git a/package/apr/Config.in b/package/apr/Config.in
index ed319ed..0a66c9d 100644
--- a/package/apr/Config.in
+++ b/package/apr/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_APR_AVAILABLE
+	def_bool y
+	depends on !BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_APR
 	bool "apr"
 	# apr really needs shared library support
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_PACKAGE_APR_AVAILABLE
 	help
 	  The mission of the Apache Portable Runtime (APR) project is to create
 	  and maintain software libraries that provide a predictable and
diff --git a/package/argp-standalone/Config.in b/package/argp-standalone/Config.in
index 5a0c051..3ea792c 100644
--- a/package/argp-standalone/Config.in
+++ b/package/argp-standalone/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_ARGP_STANDALONE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_ARGP_STANDALONE
 	bool "argp-standalone"
+	depends on BR2_PACKAGE_ARGP_STANDALONE_AVAILABLE
 	help
 	  Glibc hierarchical argument parsing standalone library.
 
diff --git a/package/argus/Config.in b/package/argus/Config.in
index 6728ae7..a8853e0 100644
--- a/package/argus/Config.in
+++ b/package/argus/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_ARGUS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_ARGUS
 	bool "argus"
 	select BR2_PACKAGE_LIBPCAP
+	depends on BR2_PACKAGE_ARGUS_AVAILABLE
 	help
 	  A Real Time Flow Monitor-based audit engine.
 
diff --git a/package/at/Config.in b/package/at/Config.in
index d4ddcb2..8480378 100644
--- a/package/at/Config.in
+++ b/package/at/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_AT_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_AT
 	bool "at"
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_AT_AVAILABLE
 	help
 	 At and batch read shell commands from standard input and
 	 store them as jobs to be scheduled for execution in the
diff --git a/package/atk/Config.in b/package/atk/Config.in
index 928fae7..4534761 100644
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_ATK_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_ATK
 	bool "atk"
 	select BR2_PACKAGE_LIBGLIB2
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_ATK_AVAILABLE
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
 
diff --git a/package/attr/Config.in b/package/attr/Config.in
index 79f2336..7f1c97e 100644
--- a/package/attr/Config.in
+++ b/package/attr/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_ATTR_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_ATTR
 	bool "attr"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_ATTR_AVAILABLE
 	help
 	  Commands for Manipulating Filesystem Extended Attributes.
 	  This package also provides libattr.
diff --git a/package/audiofile/Config.in b/package/audiofile/Config.in
index 4f9952c..bc2dff6 100644
--- a/package/audiofile/Config.in
+++ b/package/audiofile/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_AUDIOFILE_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_AUDIOFILE
 	bool "audiofile"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_AUDIOFILE_AVAILABLE
 	help
 	  The Audio File Library handles reading and writing audio files
 	  in many common formats.
diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
index 00b3e2c..5f0a4b1 100644
--- a/package/autoconf/Config.in
+++ b/package/autoconf/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_AUTOCONF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf"
 	select BR2_PACKAGE_MICROPERL
+	depends on BR2_PACKAGE_AUTOCONF_AVAILABLE
 	help
 	  Extensible program for developing configure scripts.  These
 	  scripts handle all the mundane system/feature detection.
diff --git a/package/automake/Config.in b/package/automake/Config.in
index 935f1f1..e5f52a2 100644
--- a/package/automake/Config.in
+++ b/package/automake/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_AUTOMAKE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
 	select BR2_PACKAGE_AUTOCONF
 	select BR2_PACKAGE_MICROPERL
+	depends on BR2_PACKAGE_AUTOMAKE_AVAILABLE
 	help
 	  Tool for automatically generating Makefile's for input to
 	  configure scripts (made by autoconf).
diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index eb3ccb6..4439062 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_AVAHI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on BR2_PACKAGE_AVAHI_AVAILABLE
 	help
 	  Avahi is a system which facilitates service
 	  discovery on a local network.
diff --git a/package/axel/Config.in b/package/axel/Config.in
index 98f4941..5c5a42b 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_AXEL_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_AXEL
 	bool "axel"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_AXEL_AVAILABLE
 	help
 	  HTTP/FTP download accelerator.
 
diff --git a/package/bash/Config.in b/package/bash/Config.in
index 228d5a4..043fb4e 100644
--- a/package/bash/Config.in
+++ b/package/bash/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_BASH_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_BASH
 	bool "bash"
 	select BR2_PACKAGE_NCURSES
 	# uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BASH_AVAILABLE
 	help
 	  The standard GNU Bourne again shell.
 
diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index 19c7f2f..86f55dd 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_BEECRYPT_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_BEECRYPT
 	bool "beecrypt"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ICU if BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
+	depends on BR2_PACKAGE_BEECRYPT_AVAILABLE
 	help
 	  Beecrypt is a general-purpose cryptography library.
 
diff --git a/package/berkeleydb/Config.in b/package/berkeleydb/Config.in
index a597abb..4b3dbad 100644
--- a/package/berkeleydb/Config.in
+++ b/package/berkeleydb/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_BERKELEYDB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_BERKELEYDB
 	bool "berkeleydb"
+	depends on BR2_PACKAGE_BERKELEYDB_AVAILABLE
 	help
 	  The Berkeley database.  A very common library for database
 	  applications.
diff --git a/package/bind/Config.in b/package/bind/Config.in
index 2944f1f..8811b47 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,9 +1,13 @@
-config BR2_PACKAGE_BIND
-	bool "bind"
+config BR2_PACKAGE_BIND_AVAILABLE
+	def_bool y
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
-	# fork()
 	depends on BR2_USE_MMU
+
+config BR2_PACKAGE_BIND
+	bool "bind"
+	# fork()
+	depends on BR2_PACKAGE_BIND_AVAILABLE
 	help
 	  BIND (Berkeley Internet Name Domain) is an implementation of
 	  the Domain Name System (DNS) protocols and provides an openly
diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index e068b20..22b108f 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_BINUTILS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on BR2_PACKAGE_BINUTILS_AVAILABLE
 	help
 	  Install binutils on the target
 
diff --git a/package/bison/Config.in b/package/bison/Config.in
index 1a485c4..a0a4a7f 100644
--- a/package/bison/Config.in
+++ b/package/bison/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_BISON_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_BISON
 	bool "bison"
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_M4
 	# m4 uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BISON_AVAILABLE
 	help
 	  General-purpose parser generator that converts a
 	  grammar description for an LALR context-free grammar into a C
diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
index 70f7eb4..e9b9cb1 100644
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -1,9 +1,13 @@
-config BR2_PACKAGE_BLACKBOX
-	bool "blackbox"
+config BR2_PACKAGE_BLACKBOX_AVAILABLE
+	def_bool y
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_BLACKBOX
+	bool "blackbox"
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_BLACKBOX_AVAILABLE
 	help
 	  Blackbox is a fast, lightweight window manager for the X
 	  Window System.
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index d63284d..4079501 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -1,9 +1,13 @@
-config BR2_PACKAGE_BLUEZ_UTILS
-	bool "bluez-utils"
+config BR2_PACKAGE_BLUEZ_UTILS_AVAILABLE
+	def_bool y
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+
+config BR2_PACKAGE_BLUEZ_UTILS
+	bool "bluez-utils"
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_BLUEZ_UTILS_AVAILABLE
 	help
 	  bluez utils
 
diff --git a/package/bmon/Config.in b/package/bmon/Config.in
index 9692118..05d1755 100644
--- a/package/bmon/Config.in
+++ b/package/bmon/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_BMON_AVAILABLE
+	def_bool y
+	depends on BR2_INET_IPV6
+
 config BR2_PACKAGE_BMON
 	bool "bmon"
-	depends on BR2_INET_IPV6
+	depends on BR2_PACKAGE_BMON_AVAILABLE
 	help
 	  Linux bandwidth monitor
 
diff --git a/package/boa/Config.in b/package/boa/Config.in
index 48943ff..15b8877 100644
--- a/package/boa/Config.in
+++ b/package/boa/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_BOA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_BOA
 	bool "boa"
+	depends on BR2_PACKAGE_BOA_AVAILABLE
 	help
 	  A very small and very fast http daemon.  Not intended as
 	  a feature-packed server.
diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
index 91b1e96..778c544 100644
--- a/package/bonnie/Config.in
+++ b/package/bonnie/Config.in
@@ -1,7 +1,11 @@
-config BR2_PACKAGE_BONNIE
-	bool "bonnie++"
+config BR2_PACKAGE_BONNIE_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
+
+config BR2_PACKAGE_BONNIE
+	bool "bonnie++"
+	depends on BR2_PACKAGE_BONNIE_AVAILABLE
 	help
 	  Filesystem tester
 
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 8798367..7bfdcbb 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -1,11 +1,15 @@
 comment "boost requires a toolchain with C++ support enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
+config BR2_PACKAGE_BOOST_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_BOOST
 	bool "boost"
-	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_BOOST_AVAILABLE
 	help
 	  A general purpose C++ library
 
diff --git a/package/bootutils/Config.in b/package/bootutils/Config.in
index 06a8fd8..804bd81 100644
--- a/package/bootutils/Config.in
+++ b/package/bootutils/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_BOOTUTILS_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_BOOTUTILS
 	bool "bootutils"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_BOOTUTILS_AVAILABLE
 	help
 	  BootUtils is a collection of utilities to facilitate booting of
 	  Linux 2.6-based systems. The process of finding the root volume
diff --git a/package/bridge-utils/Config.in b/package/bridge-utils/Config.in
index 537eb1f..68502f7 100644
--- a/package/bridge-utils/Config.in
+++ b/package/bridge-utils/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_BRIDGE_UTILS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_BRIDGE_UTILS
 	bool "bridge-utils"
+	depends on BR2_PACKAGE_BRIDGE_UTILS_AVAILABLE
 	help
 	  Manage ethernet bridging; a way to connect networks together to
 	  form a larger network.
diff --git a/package/bsdiff/Config.in b/package/bsdiff/Config.in
index 11fd8b9..e5d1424 100644
--- a/package/bsdiff/Config.in
+++ b/package/bsdiff/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_BSDIFF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_BSDIFF
 	bool "bsdiff"
 	select BR2_PACKAGE_BZIP2
+	depends on BR2_PACKAGE_BSDIFF_AVAILABLE
 	help
 	  Binary patch/diff like xdelta but creates smaller diffs.
 	  Needs bzip2 support.
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index dedcf18..23f769f 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_BUSYBOX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_BUSYBOX
 	bool "BusyBox"
 	default y
+	depends on BR2_PACKAGE_BUSYBOX_AVAILABLE
 	help
 	  The Swiss Army Knife of embedded Linux.  It slices, it dices, it
 	  makes Julian Fries.
diff --git a/package/bwm-ng/Config.in b/package/bwm-ng/Config.in
index 25e7cbe..d276449 100644
--- a/package/bwm-ng/Config.in
+++ b/package/bwm-ng/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_BWM_NG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_BWM_NG
 	bool "bwm-ng"
+	depends on BR2_PACKAGE_BWM_NG_AVAILABLE
 	help
 	  Bandwidth Monitor NG is a small and console-based live
 	  network and disk-io bandwidth monitor for Linux, BSD,
diff --git a/package/bzip2/Config.in b/package/bzip2/Config.in
index e8e03cf..3f144a5 100644
--- a/package/bzip2/Config.in
+++ b/package/bzip2/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_BZIP2_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_BZIP2
 	bool "bzip2"
+	depends on BR2_PACKAGE_BZIP2_AVAILABLE
 	help
 	  Freely available, patent free, high-quality data compressor.
 	  It typically compresses files to within 10% to 15% of the best
diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 398e47f..2c61751 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_CAIRO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_CAIRO
 	bool "cairo"
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
+	depends on BR2_PACKAGE_CAIRO_AVAILABLE
 	help
 	  Cairo is a 2D graphics library with support for multiple
 	  output devices. Currently supported output targets include
diff --git a/package/can-utils/Config.in b/package/can-utils/Config.in
index 79c1459..31dfeda 100644
--- a/package/can-utils/Config.in
+++ b/package/can-utils/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_CAN_UTILS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_CAN_UTILS
 	bool "can-utils"
+	depends on BR2_PACKAGE_CAN_UTILS_AVAILABLE
 	help
 	  SocketCAN is a set of open source CAN drivers and a
 	  networking stack.
diff --git a/package/ccache/Config.in b/package/ccache/Config.in
index f4f7f8f..b7fcfb9 100644
--- a/package/ccache/Config.in
+++ b/package/ccache/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_CCACHE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_CCACHE
 	bool "ccache"
+	depends on BR2_PACKAGE_CCACHE_AVAILABLE
 	help
 	  ccache is a compiler cache. It speeds up recompilation by
 	  caching previous compilations and detecting when the same
diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index 7ff50f3..bcd85ef 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_CDRKIT_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_CDRKIT
 	# Needed for libbz
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_LIBCAP
-	depends on BR2_LARGEFILE
 	bool "cdrkit"
+	depends on BR2_PACKAGE_CDRKIT_AVAILABLE
 	help
 	  cdrkit is a suite of programs for recording CDs and DVDs,
 	  blanking CD-RW media, creating ISO-9660 filesystem images,
diff --git a/package/cgilua/Config.in b/package/cgilua/Config.in
index 01928f0..14514ba 100644
--- a/package/cgilua/Config.in
+++ b/package/cgilua/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_CGILUA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_CGILUA
 	bool "cgilua"
 	select BR2_PACKAGE_LUAFILESYSTEM
+	depends on BR2_PACKAGE_CGILUA_AVAILABLE
 	help
 	  CGILua is a tool for creating dynamic HTML pages
 	  and manipulating input data from Web forms.
diff --git a/package/cifs-utils/Config.in b/package/cifs-utils/Config.in
index b433850..ab8772b 100644
--- a/package/cifs-utils/Config.in
+++ b/package/cifs-utils/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_CIFS_UTILS_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_CIFS_UTILS
 	bool "cifs-utils"
 	# uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_CIFS_UTILS_AVAILABLE
 	help
 	  The in-kernel CIFS filesystem is generally the preferred
 	  method for mounting SMB/CIFS shares on Linux. The in-kernel
diff --git a/package/cjson/Config.in b/package/cjson/Config.in
index ff90074..683e855 100644
--- a/package/cjson/Config.in
+++ b/package/cjson/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_CJSON_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_CJSON
 	bool "cJSON"
+	depends on BR2_PACKAGE_CJSON_AVAILABLE
 	help
 	  An ultra-lightweight, portable, single-file, simple-as-can-be ANSI-C
 	  compliant JSON parser, under MIT license.
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index fe520f8..b52917d 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_COLLECTD_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_COLLECTD
 	bool "collectd"
 	# Uses fork()
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_COLLECTD_AVAILABLE
 	help
 	  collectd is a daemon which collects system performance
 	  statistics periodically and provides mechanisms to store
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 082b0ca..10d16e8 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -1,13 +1,17 @@
+config BR2_PACKAGE_CONNMAN_AVAILABLE
+	def_bool y
+	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
+	depends on BR2_USE_WCHAR # libglib2 and gnutls
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+
 config BR2_PACKAGE_CONNMAN
 	bool "connman"
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_GNUTLS
-	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
-	depends on BR2_USE_WCHAR # libglib2 and gnutls
-	depends on BR2_INET_IPV6
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_PACKAGE_CONNMAN_AVAILABLE
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
 	  managing internet connections within embedded devices running
diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index be491e6..2c31226 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -1,9 +1,13 @@
-config BR2_PACKAGE_CONNTRACK_TOOLS
-	bool "conntrack-tools"
+config BR2_PACKAGE_CONNTRACK_TOOLS_AVAILABLE
+	def_bool y
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
+
+config BR2_PACKAGE_CONNTRACK_TOOLS
+	bool "conntrack-tools"
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
+	depends on BR2_PACKAGE_CONNTRACK_TOOLS_AVAILABLE
 	help
 	  The conntrack-tools are a set of tools targeted at
 	  system administrators.
diff --git a/package/copas/Config.in b/package/copas/Config.in
index 9969c8f..c56d01b 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_COPAS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_COPAS
 	bool "copas"
 	select BR2_PACKAGE_COXPCALL
 	select BR2_PACKAGE_LUASOCKET
+	depends on BR2_PACKAGE_COPAS_AVAILABLE
 	help
 	  Copas is a dispatcher based on coroutines that
 	  can be used by TCP/IP servers.
diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index bfd6f26..4960bb3 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_COREUTILS_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_COREUTILS
 	bool "coreutils"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_COREUTILS_AVAILABLE
 	help
 	  All of the basic file/text/shell utilities.  These are the
 	  core utilities which are expected to exist on every system.
diff --git a/package/coxpcall/Config.in b/package/coxpcall/Config.in
index 1237482..f2ff937 100644
--- a/package/coxpcall/Config.in
+++ b/package/coxpcall/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_COXPCALL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_COXPCALL
 	bool "coxpcall"
+	depends on BR2_PACKAGE_COXPCALL_AVAILABLE
 	help
 	  Coxpcall encapsulates the protected calls with a coroutine
 	  based loop, so errors can be dealed without the usual
diff --git a/package/cpuload/Config.in b/package/cpuload/Config.in
index 82bc450..9d50e7a 100644
--- a/package/cpuload/Config.in
+++ b/package/cpuload/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_CPULOAD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_CPULOAD
 	bool "cpuload"
+	depends on BR2_PACKAGE_CPULOAD_AVAILABLE
 	help
 	  cpuload is a simple tool to obtain intuitive vision of CPU load
 	  (including total, user, system, irq and softirq) within a certain
diff --git a/package/cramfs/Config.in b/package/cramfs/Config.in
index a5c73a8..aa23e14 100644
--- a/package/cramfs/Config.in
+++ b/package/cramfs/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_CRAMFS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_CRAMFS
        bool "cramfs"
+	depends on BR2_PACKAGE_CRAMFS_AVAILABLE
        help
          cramfs is a compressed read-only filesystem. This package
          contains the tools to generate and check a cramfs filesystem.
diff --git a/package/ctorrent/Config.in b/package/ctorrent/Config.in
index 5e26c12..7dd8bff 100644
--- a/package/ctorrent/Config.in
+++ b/package/ctorrent/Config.in
@@ -1,9 +1,13 @@
 comment "ctorrent requires a toolchain with C++ support enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
+config BR2_PACKAGE_CTORRENT_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_CTORRENT
 	bool "ctorrent"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_CTORRENT_AVAILABLE
 	help
 	  CTorrent is a BitTorrent client implemented in C++
 	  to be lightweight and quick.
diff --git a/package/cups/Config.in b/package/cups/Config.in
index dc1c2ed..f7a3190 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_CUPS_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_CUPS
 	bool "cups"
 	# needs fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_CUPS_AVAILABLE
 	help
 	  The Common Unix Printing System
 
diff --git a/package/customize/Config.in b/package/customize/Config.in
index 8f8aaa2..8bcddf3 100644
--- a/package/customize/Config.in
+++ b/package/customize/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_CUSTOMIZE_AVAILABLE
+	def_bool y
+	depends on BR2_DEPRECATED
+
 config BR2_PACKAGE_CUSTOMIZE
 	bool "customize"
-	depends on BR2_DEPRECATED
+	depends on BR2_PACKAGE_CUSTOMIZE_AVAILABLE
 	help
 	  Add custom stuff to your buildroot.
 
diff --git a/package/cvs/Config.in b/package/cvs/Config.in
index f9d5955..c815b56 100644
--- a/package/cvs/Config.in
+++ b/package/cvs/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_CVS_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_CVS
 	bool "cvs"
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_CVS_AVAILABLE
 	help
 	  Concurrent Versions System - source code revision control tools.
 
diff --git a/package/dash/Config.in b/package/dash/Config.in
index 20970aa..b5be02f 100644
--- a/package/dash/Config.in
+++ b/package/dash/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_DASH_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_DASH
 	bool "dash"
+	depends on BR2_PACKAGE_DASH_AVAILABLE
 	help
 	  The Debian/Linux port of the NetBSD version of
 	  ash (the Almquist SHell).
diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
index f1dab43..f73dafa 100644
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -1,8 +1,12 @@
-config BR2_PACKAGE_DBUS_GLIB
-	bool "dbus-glib"
+config BR2_PACKAGE_DBUS_GLIB_AVAILABLE
+	def_bool y
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_USE_WCHAR # glib2
+
+config BR2_PACKAGE_DBUS_GLIB
+	bool "dbus-glib"
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_DBUS_GLIB_AVAILABLE
 	help
 	  GLib bindings for D-Bus.
 
diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index 91c127d..1d466ae 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -1,9 +1,13 @@
-config BR2_PACKAGE_DBUS_PYTHON
-	bool "dbus-python"
+config BR2_PACKAGE_DBUS_PYTHON_AVAILABLE
+	def_bool y
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_PACKAGE_PYTHON
+
+config BR2_PACKAGE_DBUS_PYTHON
+	bool "dbus-python"
 	select BR2_PACKAGE_DBUS_GLIB
+	depends on BR2_PACKAGE_DBUS_PYTHON_AVAILABLE
 	help
 	  Python bindings for D-Bus
 
diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 2b04e94..d7f5c66 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_DBUS_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_DBUS
 	bool "dbus"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_DBUS_AVAILABLE
 	help
 	  The D-Bus message bus system.
 
diff --git a/package/devmem2/Config.in b/package/devmem2/Config.in
index cb00a51..c1b0441 100644
--- a/package/devmem2/Config.in
+++ b/package/devmem2/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_DEVMEM2_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_DEVMEM2
 	bool "devmem2"
+	depends on BR2_PACKAGE_DEVMEM2_AVAILABLE
 	help
 	  Simple program to read/write from/to any location in memory.
 
diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index 38cf007..71624fb 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_DHCP_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_DHCP
 	bool "isc dhcp"
 	# fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_DHCP_AVAILABLE
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
diff --git a/package/dhcpdump/Config.in b/package/dhcpdump/Config.in
index 1840e34..19736ac 100644
--- a/package/dhcpdump/Config.in
+++ b/package/dhcpdump/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_DHCPDUMP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_DHCPDUMP
 	bool "dhcpdump"
 	select BR2_PACKAGE_LIBPCAP
+	depends on BR2_PACKAGE_DHCPDUMP_AVAILABLE
 	help
 	  A tool for monitoring dhcp requests using tcpdump.
diff --git a/package/dhrystone/Config.in b/package/dhrystone/Config.in
index d6fb7a7..644954a 100644
--- a/package/dhrystone/Config.in
+++ b/package/dhrystone/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_DHRYSTONE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_DHRYSTONE
 	bool "dhrystone"
+	depends on BR2_PACKAGE_DHRYSTONE_AVAILABLE
 	help
 	  easy-to-use integer benchmark
 
diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index 9d3462e..f26001d 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_DIALOG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_DIALOG
 	bool "dialog"
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_DIALOG_AVAILABLE
 	help
 	  dialog - display dialog boxes from shell scripts
 
diff --git a/package/diffutils/Config.in b/package/diffutils/Config.in
index 86da5d3..d2edb5f 100644
--- a/package/diffutils/Config.in
+++ b/package/diffutils/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_DIFFUTILS_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_DIFFUTILS
 	bool"diffutils"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_DIFFUTILS_AVAILABLE
 	help
 	  GNU diff. Compare files per line.
 
diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
index c463784..41fb1ee 100644
--- a/package/directfb-examples/Config.in
+++ b/package/directfb-examples/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_AVAILABLE
+	def_bool y
+       depends on BR2_PACKAGE_DIRECTFB
+
 config BR2_PACKAGE_DIRECTFB_EXAMPLES
        bool "directfb examples"
-       depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES_AVAILABLE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
        bool "usr/bin/df_andi"
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 47f9fea..a1e3a42 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_DIRECTFB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_DIRECTFB_AVAILABLE
 	help
 	  http://www.directfb.org/
 
diff --git a/package/distcc/Config.in b/package/distcc/Config.in
index 2c30a21..52aec27 100644
--- a/package/distcc/Config.in
+++ b/package/distcc/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_DISTCC_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_DISTCC
 	bool "distcc"
 	# needs fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_DISTCC_AVAILABLE
 	help
 	  Distributed compiler client and server.  Allows you to
 	  distribute compilation of C code across several machines
diff --git a/package/divine/Config.in b/package/divine/Config.in
index 8202292..37f157c 100644
--- a/package/divine/Config.in
+++ b/package/divine/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_DIVINE_AVAILABLE
+	def_bool y
+       depends on BR2_PACKAGE_DIRECTFB
+
 config BR2_PACKAGE_DIVINE
        bool "directfb virtual input extension"
-       depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_DIVINE_AVAILABLE
        help
          DiVine provides a DirectFB input driver that reads input
          events from a pipe and dispatches them via a virtual input
diff --git a/package/dmalloc/Config.in b/package/dmalloc/Config.in
index 315f6ca..25190d3 100644
--- a/package/dmalloc/Config.in
+++ b/package/dmalloc/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_DMALLOC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_DMALLOC
 	bool "dmalloc"
+	depends on BR2_PACKAGE_DMALLOC_AVAILABLE
 	help
 	  A debug memory allocation library which is a drop in replacement for
 	  the system's malloc, realloc, calloc, free and other memory management
diff --git a/package/dmidecode/Config.in b/package/dmidecode/Config.in
index 22272ed..76c1505 100644
--- a/package/dmidecode/Config.in
+++ b/package/dmidecode/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_DMIDECODE_AVAILABLE
+	def_bool y
+	depends on BR2_i386 || BR2_x86_64
+
 config BR2_PACKAGE_DMIDECODE
 	bool "dmidecode"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_DMIDECODE_AVAILABLE
 	help
 	  Dmidecode reports information about your system's hardware
 	  as described in your system BIOS according to the SMBIOS/DMI
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 7b37244..0ab7367 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_DMRAID_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LVM2
+	depends on BR2_PACKAGE_DMRAID_AVAILABLE
 	help
 	  dmraid discovers, activates, deactivates and displays properties
 	  of software RAID sets (eg, ATARAID) and contained DOS partitions.
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index e67aa46..14777e3 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_DNSMASQ_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_DNSMASQ
 	bool "dnsmasq"
+	depends on BR2_PACKAGE_DNSMASQ_AVAILABLE
 	help
 	  A lightweight DNS and DHCP server.  It is intended to provide
 	  coupled DNS and DHCP service to a LAN.
diff --git a/package/docker/Config.in b/package/docker/Config.in
index 75bf5be..515be82 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -1,8 +1,12 @@
-config BR2_PACKAGE_DOCKER
-	bool "docker"
+config BR2_PACKAGE_DOCKER_AVAILABLE
+	def_bool y
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
+
+config BR2_PACKAGE_DOCKER
+	bool "docker"
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_DOCKER_AVAILABLE
 	help
 	  a system tray dock for X
 
diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
index 1b92026..65d1e73 100644
--- a/package/dosfstools/Config.in
+++ b/package/dosfstools/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_DOSFSTOOLS_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_DOSFSTOOLS
 	bool "dosfstools"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_DOSFSTOOLS_AVAILABLE
 	help
 	  Tools for creating and checking DOS FAT filesystems.
 
diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 0903ad1..c38dee6 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_DROPBEAR_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_DROPBEAR
 	bool "dropbear"
 	select BR2_PACKAGE_ZLIB if !BR2_PACKAGE_DROPBEAR_SMALL
+	depends on BR2_PACKAGE_DROPBEAR_AVAILABLE
 	help
 	  A small SSH 2 server designed for small memory environments.
 
diff --git a/package/dsp-tools/Config.in b/package/dsp-tools/Config.in
index 0267454..91b0fac 100644
--- a/package/dsp-tools/Config.in
+++ b/package/dsp-tools/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_DSP_TOOLS_AVAILABLE
+	def_bool y
+	depends on BR2_cortex_a8
+
 config BR2_PACKAGE_DSP_TOOLS
 	bool "dsp-tools"
-	depends on BR2_cortex_a8
 	select BR2_PACKAGE_TIDSP_BINARIES
+	depends on BR2_PACKAGE_DSP_TOOLS_AVAILABLE
 	help
 	  Utilities for TI OMAP3 DSP.
 
diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 1439c8b..74ee200 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_DSTAT_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # python
+
 config BR2_PACKAGE_DSTAT
 	bool "dstat"
-	depends on BR2_USE_WCHAR # python
 	select BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_DSTAT_AVAILABLE
 	help
 	  Dstat, written in Python, is a versatile replacement for vmstat,
 	  iostat, netstat and ifstat. Dstat overcomes some of their limitations
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index d4f4405..bfe8559 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,11 +1,15 @@
 
-config BR2_PACKAGE_E2FSPROGS
-	bool "e2fsprogs"
+config BR2_PACKAGE_E2FSPROGS_AVAILABLE
+	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
+
+config BR2_PACKAGE_E2FSPROGS
+	bool "e2fsprogs"
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	depends on BR2_PACKAGE_E2FSPROGS_AVAILABLE
 	help
 	  The EXT2 file system utilities.
 
diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 40bc45c..311b147 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_EBTABLES_AVAILABLE
+	def_bool y
+	depends on BR2_INET_IPV6
+
 config BR2_PACKAGE_EBTABLES
 	bool "ebtables"
-	depends on BR2_INET_IPV6
+	depends on BR2_PACKAGE_EBTABLES_AVAILABLE
 	help
 	  Ethernet bridge frame table administration
 
diff --git a/package/ed/Config.in b/package/ed/Config.in
index 63dc21e..5d749dd 100644
--- a/package/ed/Config.in
+++ b/package/ed/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_ED_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_ED
 	bool "ed"
+	depends on BR2_PACKAGE_ED_AVAILABLE
 	help
 	  A line-oriented text editor.  Used to create, display, modify,
 	  and otherwise manipulate text files.  Often used in scripts
diff --git a/package/eeprog/Config.in b/package/eeprog/Config.in
index ff313bd..9b97e11 100644
--- a/package/eeprog/Config.in
+++ b/package/eeprog/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_EEPROG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_EEPROG
 	bool "eeprog"
+	depends on BR2_PACKAGE_EEPROG_AVAILABLE
 	help
 	  Simple tool to read/write i2c eeprom chips.
 
diff --git a/package/efl/Config.in b/package/efl/Config.in
index c783d7f..0f755e3 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_EFL_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 menuconfig BR2_PACKAGE_EFL
 	bool "Enlightenment Foundation Libraries"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_EFL_AVAILABLE
 	help
 	  Enlightenment Foundation Libraries
 
diff --git a/package/efl/expedite/Config.in b/package/efl/expedite/Config.in
index 9e131f3..2f5fdd3 100644
--- a/package/efl/expedite/Config.in
+++ b/package/efl/expedite/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_EXPEDITE_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_EXPEDITE
 	bool "expedite"
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LIBEET
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_EXPEDITE_AVAILABLE
 	help
 	  Expedite is the official Evas benchmark tool. It can test different
 	  engines, such as X11, XRender, OpenGL (also ES variant), SDL,
diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
index 6c887f5..67ef94a 100644
--- a/package/efl/libecore/Config.in
+++ b/package/efl/libecore/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBECORE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBECORE
 	bool "libecore"
 	select BR2_PACKAGE_LIBEINA
+	depends on BR2_PACKAGE_LIBECORE_AVAILABLE
 	help
 	  Ecore is the event/X abstraction layer that makes doing
 	  selections, Xdnd, general X stuff, event loops, timeouts and
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 985939e..6019dc1 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_LIBEDBUS_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+
 config BR2_PACKAGE_LIBEDBUS
 	bool "libedbus"
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_DBUS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_PACKAGE_LIBEDBUS_AVAILABLE
 	help
 	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
 	  easily used by EFL applications, automatically providing
diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
index f0985dd..7a377fe 100644
--- a/package/efl/libedje/Config.in
+++ b/package/efl/libedje/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_LIBEDJE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBEDJE
 	bool "libedje"
 	select BR2_PACKAGE_LIBEINA
@@ -7,6 +10,7 @@ config BR2_PACKAGE_LIBEDJE
 	select BR2_PACKAGE_LIBEMBRYO
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_LIBEDJE_AVAILABLE
 	help
 	  A graphical layout and animation library for animated
 	  resizable, compressed and scalable themes.
diff --git a/package/efl/libeet/Config.in b/package/efl/libeet/Config.in
index 48631a0..f9d5a56 100644
--- a/package/efl/libeet/Config.in
+++ b/package/efl/libeet/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_LIBEET_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBEET
 	bool "libeet"
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBEINA
+	depends on BR2_PACKAGE_LIBEET_AVAILABLE
 	help
 	  Eet is a tiny library designed to write an arbitary set of
 	  chunks of data to a file and optionally compress each chunk
diff --git a/package/efl/libefreet/Config.in b/package/efl/libefreet/Config.in
index 8687db4..ec7a033 100644
--- a/package/efl/libefreet/Config.in
+++ b/package/efl/libefreet/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_LIBEFREET_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBEFREET
 	bool "libefreet"
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBEET
 	select BR2_PACKAGE_LIBECORE
+	depends on BR2_PACKAGE_LIBEFREET_AVAILABLE
 	help
 	  Efreet is a library designed to help apps work with several of the
 	  Freedesktop.org standards regarding Icons, Desktop files and Menus.
diff --git a/package/efl/libeina/Config.in b/package/efl/libeina/Config.in
index 80600ad..85cd7be 100644
--- a/package/efl/libeina/Config.in
+++ b/package/efl/libeina/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBEINA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBEINA
 	bool "libeina"
+	depends on BR2_PACKAGE_LIBEINA_AVAILABLE
 	help
 	  Eina is a tiny library to handle data types (list, hash, etc.)
 
diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
index 59af80e..0b4cb3d 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/efl/libelementary/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_LIBELEMENTARY_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBELEMENTARY
 	bool "libelementary"
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBEDJE
+	depends on BR2_PACKAGE_LIBELEMENTARY_AVAILABLE
 	help
 	  Elementary is a widget toolkit and EFL wrapper and convenience
 	  library to make it easy to build applications and tools with UIs
diff --git a/package/efl/libembryo/Config.in b/package/efl/libembryo/Config.in
index 63c7064..efd48c0 100644
--- a/package/efl/libembryo/Config.in
+++ b/package/efl/libembryo/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBEMBRYO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBEMBRYO
 	bool "libembryo"
 	select BR2_PACKAGE_LIBEINA
+	depends on BR2_PACKAGE_LIBEMBRYO_AVAILABLE
 	help
 	  Embryo is primarily a shared library that gives you an API
 	  to load and control interpreted programs compiled into an
diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
index fb0032a..61629b0 100644
--- a/package/efl/libethumb/Config.in
+++ b/package/efl/libethumb/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_LIBETHUMB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBETHUMB
 	bool "libethumb"
 	select BR2_PACKAGE_LIBEINA
@@ -5,6 +8,7 @@ config BR2_PACKAGE_LIBETHUMB
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBECORE_EVAS
 	select BR2_PACKAGE_LIBEDJE
+	depends on BR2_PACKAGE_LIBETHUMB_AVAILABLE
 	help
 	  Ethumb is a library for generating thumbnail images of documents.
 
diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index ddac49e..d25a03e 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_LIBEVAS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBEVAS
 	bool "libevas"
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBEINA
 	# required to build so far
 	select BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH
+	depends on BR2_PACKAGE_LIBEVAS_AVAILABLE
 	help
 	  Evas is a clean display canvas API for several target
 	  display systems that can draw anti-aliased text, smooth
diff --git a/package/empty/Config.in b/package/empty/Config.in
index 67b09fc..c006b68 100644
--- a/package/empty/Config.in
+++ b/package/empty/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_EMPTY_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_EMPTY
 	bool "empty"
+	depends on BR2_PACKAGE_EMPTY_AVAILABLE
 	help
 	  Run processes and applications under pseudo-terminal (PTY) sessions.
 
diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index 33f36db..e7e86c5 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -1,8 +1,12 @@
-config BR2_PACKAGE_ENCHANT
-	bool "enchant"
+config BR2_PACKAGE_ENCHANT_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glib2
+
+config BR2_PACKAGE_ENCHANT
+	bool "enchant"
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_ENCHANT_AVAILABLE
 	help
 	  Enchant is a spell-checking library that provides a consistent
 	  API across a number of spell-checking system backends.
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 6dd5a39..5a1efe6 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_ERLANG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
+	depends on BR2_PACKAGE_ERLANG_AVAILABLE
 	help
 	  Erlang is a programming language used to build massively scalable
 	  soft real-time systems with requirements on high availability.
diff --git a/package/ethtool/Config.in b/package/ethtool/Config.in
index 48c6062..de4159b 100644
--- a/package/ethtool/Config.in
+++ b/package/ethtool/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_ETHTOOL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_ETHTOOL
 	bool "ethtool"
+	depends on BR2_PACKAGE_ETHTOOL_AVAILABLE
 	help
 	  ethtool is a small utility for examining and tuning your
 	  ethernet-based network interface.
diff --git a/package/expat/Config.in b/package/expat/Config.in
index 3988c90..e68b6e0 100644
--- a/package/expat/Config.in
+++ b/package/expat/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_EXPAT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_EXPAT
 	bool"expat"
+	depends on BR2_PACKAGE_EXPAT_AVAILABLE
 	help
 	  The Expat XML Parser.
 
diff --git a/package/explorercanvas/Config.in b/package/explorercanvas/Config.in
index 9714a58..b2708da 100644
--- a/package/explorercanvas/Config.in
+++ b/package/explorercanvas/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_EXPLORERCANVAS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_EXPLORERCANVAS
 	bool "explorercanvas"
+	depends on BR2_PACKAGE_EXPLORERCANVAS_AVAILABLE
 	help
 	  Modern browsers like Firefox, Safari, Chrome and Opera
 	  support the HTML5 canvas tag to allow 2D command-based
diff --git a/package/ezxml/Config.in b/package/ezxml/Config.in
index 285c7a5..6cf5dfa 100644
--- a/package/ezxml/Config.in
+++ b/package/ezxml/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_EZXML_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_EZXML
 	bool "ezxml"
+	depends on BR2_PACKAGE_EZXML_AVAILABLE
 	help
 	  ezXML is a XML parser C library that is simple and easy to use.
 
diff --git a/package/fbdump/Config.in b/package/fbdump/Config.in
index fb4aee6..789dfb7 100644
--- a/package/fbdump/Config.in
+++ b/package/fbdump/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_FBDUMP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FBDUMP
 	bool "fbdump (Framebuffer Capture Tool)"
+	depends on BR2_PACKAGE_FBDUMP_AVAILABLE
 	help
 	  fbdump is a simple tool to capture snapshots from the Linux kernel
 	  framebuffer  device and write them out as a PPM file. Currently,
diff --git a/package/fbgrab/Config.in b/package/fbgrab/Config.in
index ca6c6b7..5a64aa4 100644
--- a/package/fbgrab/Config.in
+++ b/package/fbgrab/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_FBGRAB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FBGRAB
 	bool "fbgrab"
 	select BR2_PACKAGE_LIBPNG
+	depends on BR2_PACKAGE_FBGRAB_AVAILABLE
 	help
 	  FBGrab is a framebuffer screenshot program, capturing the linux
 	  frambuffer and converting it to a png-picture.
diff --git a/package/fbset/Config.in b/package/fbset/Config.in
index 96d090e..42171a0 100644
--- a/package/fbset/Config.in
+++ b/package/fbset/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_FBSET_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FBSET
 	bool "fbset"
+	depends on BR2_PACKAGE_FBSET_AVAILABLE
 	help
 	  Fbset is a system utility to show or change the settings of the frame
 	  buffer device. The frame buffer device provides a simple and unique
diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
index 1e4ab4c..87926ef 100644
--- a/package/fbterm/Config.in
+++ b/package/fbterm/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_FBTERM_AVAILABLE
+	def_bool y
+	depends on (BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+
 config BR2_PACKAGE_FBTERM
 	bool "fbterm"
-	depends on (BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_LIBERATION
+	depends on BR2_PACKAGE_FBTERM_AVAILABLE
 	help
 	  fbterm is a fast terminal emulator for Linux with frame buffer
 	  device or VESA video card.
diff --git a/package/fbv/Config.in b/package/fbv/Config.in
index b8a9fe4..153d0f9 100644
--- a/package/fbv/Config.in
+++ b/package/fbv/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_FBV_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FBV
 	bool "fbv"
+	depends on BR2_PACKAGE_FBV_AVAILABLE
 	help
 	  fbv is a very simple graphic file viewer for the framebuffer console,
 	  capable of displaying GIF, JPEG, PNG and BMP files using libungif,
diff --git a/package/fconfig/Config.in b/package/fconfig/Config.in
index e7dd58a..39deb00 100644
--- a/package/fconfig/Config.in
+++ b/package/fconfig/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_FCONFIG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FCONFIG
 	bool "fconfig"
+	depends on BR2_PACKAGE_FCONFIG_AVAILABLE
 	help
 	  fconfig - get/set RedBoot configuration parameters from Linux.
 
diff --git a/package/feh/Config.in b/package/feh/Config.in
index 31e7239..3760b6f 100644
--- a/package/feh/Config.in
+++ b/package/feh/Config.in
@@ -1,6 +1,9 @@
+config BR2_PACKAGE_FEH_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_FEH
 	bool "feh"
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_IMLIB2_PNG
@@ -8,6 +11,7 @@ config BR2_PACKAGE_FEH
 	select BR2_PACKAGE_IMLIB2_X
 	select BR2_PACKAGE_GIBLIB
 	select BR2_PACKAGE_LIBCURL
+	depends on BR2_PACKAGE_FEH_AVAILABLE
 	help
 	  feh is an X11 image viewer aimed mostly at console users.
 
diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 36f849f..8ed892a 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_FFTW_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FFTW
 	bool "fftw"
+	depends on BR2_PACKAGE_FFTW_AVAILABLE
 	help
 	  Library for computing Fast Fourier Transforms.
 
diff --git a/package/file/Config.in b/package/file/Config.in
index dede331..ed60857 100644
--- a/package/file/Config.in
+++ b/package/file/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_FILE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FILE
 	bool "file"
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_FILE_AVAILABLE
 	help
 	  Program to identify a file's format by scanning binary data
 	  for known patterns.
diff --git a/package/findutils/Config.in b/package/findutils/Config.in
index bbe2cc1..8430972 100644
--- a/package/findutils/Config.in
+++ b/package/findutils/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_FINDUTILS_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_FINDUTILS
 	bool "findutils"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_FINDUTILS_AVAILABLE
 	help
 	  Basic directory searching utilities.  Provides the
 	  common 'find', 'xargs', 'locate', and 'updatedb' binaries.
diff --git a/package/fis/Config.in b/package/fis/Config.in
index 83bbdd3..899760e 100644
--- a/package/fis/Config.in
+++ b/package/fis/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_FIS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FIS
 	bool "fis"
+	depends on BR2_PACKAGE_FIS_AVAILABLE
 	help
 	  fis - manipulate RedBoot partition table from Linux.
 
diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 956500f..4a64e55 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_FLASHROM_AVAILABLE
+	def_bool y
+	depends on BR2_i386 || BR2_x86_64
+
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
 	select BR2_PACKAGE_PCIUTILS
 	# dmidecode is only a runtime dependency
 	select BR2_PACKAGE_DMIDECODE
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_FLASHROM_AVAILABLE
 	help
 	  BIOS-updating utility.
 	  Requires PCIUtils libraries.
diff --git a/package/flex/Config.in b/package/flex/Config.in
index b10eb00..d1d5cf0 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_FLEX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FLEX
 	bool "flex"
+	depends on BR2_PACKAGE_FLEX_AVAILABLE
 	help
 	  A fast lexical analyser generator.  A tool for generating
 	  programs that perform pattern-matching on text.
diff --git a/package/flot/Config.in b/package/flot/Config.in
index 60534c1..d63bcb5 100644
--- a/package/flot/Config.in
+++ b/package/flot/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_FLOT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FLOT
 	bool "flot"
 	select BR2_PACKAGE_JQUERY
+	depends on BR2_PACKAGE_FLOT_AVAILABLE
 	help
 	  Flot is a pure Javascript plotting library for jQuery. It
 	  produces graphical plots of arbitrary datasets on-the-fly
diff --git a/package/fltk/Config.in b/package/fltk/Config.in
index eff72b5..ca978c2 100644
--- a/package/fltk/Config.in
+++ b/package/fltk/Config.in
@@ -1,8 +1,12 @@
-config BR2_PACKAGE_FLTK
-	bool "fltk"
+config BR2_PACKAGE_FLTK_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_FLTK
+	bool "fltk"
 	select BR2_PACKAGE_XLIB_LIBXT
+	depends on BR2_PACKAGE_FLTK_AVAILABLE
 	help
 	  A cross-platform C++ GUI toolkit for UNIX/Linux (X11),
 	  Microsoft Windows, and MacOS X.
diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
index e4d6c37..ec8a4f7 100644
--- a/package/fluxbox/Config.in
+++ b/package/fluxbox/Config.in
@@ -1,8 +1,12 @@
-config BR2_PACKAGE_FLUXBOX
-	bool "fluxbox"
+config BR2_PACKAGE_FLUXBOX_AVAILABLE
+	def_bool y
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_FLUXBOX
+	bool "fluxbox"
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_FLUXBOX_AVAILABLE
 	help
 	  The Fluxbox lightweight window manager for X
 
diff --git a/package/fmtools/Config.in b/package/fmtools/Config.in
index 1591618..5de9972 100644
--- a/package/fmtools/Config.in
+++ b/package/fmtools/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_FMTOOLS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FMTOOLS
 	bool "fmtools"
+	depends on BR2_PACKAGE_FMTOOLS_AVAILABLE
 	help
 	  fmtools is a pair of simple command-line utilities for
 	  "video4linux" radio tuner cards under Linux. It includes
diff --git a/package/fontconfig/Config.in b/package/fontconfig/Config.in
index 49878d2..670cfd4 100644
--- a/package/fontconfig/Config.in
+++ b/package/fontconfig/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_FONTCONFIG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FONTCONFIG
 	bool "fontconfig"
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_EXPAT
+	depends on BR2_PACKAGE_FONTCONFIG_AVAILABLE
 	help
 	  a library for font customization and configuration.
 
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index c5ff769..21a12bd 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -1,3 +1,7 @@
+config BR2_PACKAGE_FREERDP_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_FREERDP
 	bool "freerdp"
 	select BR2_PACKAGE_OPENSSL
@@ -6,7 +10,7 @@ config BR2_PACKAGE_FREERDP
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_FREERDP_AVAILABLE
 	help
 	  FreeRDP is a free implementation of the Remote Desktop
 	  Protocol (RDP), released under the Apache license
diff --git a/package/freetype/Config.in b/package/freetype/Config.in
index ded8738..912eb31 100644
--- a/package/freetype/Config.in
+++ b/package/freetype/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_FREETYPE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FREETYPE
 	bool "freetype"
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
 	help
 	  a free, high-quality and portable font engine.
 
diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
index 276ec54..c9ed46d 100644
--- a/package/gadgetfs-test/Config.in
+++ b/package/gadgetfs-test/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_GADGETFS_TEST_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_GADGETFS_TEST
 	bool "gadgetfs-test"
+	depends on BR2_PACKAGE_GADGETFS_TEST_AVAILABLE
 	help
 	  Test program for gadgetfs from linux-usb.org
 
diff --git a/package/games/doom-wad/Config.in b/package/games/doom-wad/Config.in
index aa1d029..5533c18 100644
--- a/package/games/doom-wad/Config.in
+++ b/package/games/doom-wad/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_DOOM_WAD_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_PRBOOM
+
 config BR2_PACKAGE_DOOM_WAD
 	bool "shareware Doom WAD file"
-	depends on BR2_PACKAGE_PRBOOM
+	depends on BR2_PACKAGE_DOOM_WAD_AVAILABLE
 	help
 	  This will install the shareware wad data file for the doom game.
 
diff --git a/package/games/gnuchess/Config.in b/package/games/gnuchess/Config.in
index c79c52d..6d65b66 100644
--- a/package/games/gnuchess/Config.in
+++ b/package/games/gnuchess/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_GNUCHESS_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GNUCHESS
 	bool "gnuchess"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_GNUCHESS_AVAILABLE
 	help
 	  GNU Chess lets most modern computers play a full game of chess.
 
diff --git a/package/games/prboom/Config.in b/package/games/prboom/Config.in
index 2835929..aa51225 100644
--- a/package/games/prboom/Config.in
+++ b/package/games/prboom/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_PRBOOM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PRBOOM
 	bool "PrBoom"
 	select BR2_PACKAGE_SDL
 	select BR2_PACKAGE_SDL_MIXER
 	select BR2_PACKAGE_SDL_NET
+	depends on BR2_PACKAGE_PRBOOM_AVAILABLE
 	help
 	  PrBoom is a Doom client which allows you to play the good old game on
 	  newer hardware. It even supports higher resolution and better
diff --git a/package/games/rubix/Config.in b/package/games/rubix/Config.in
index 6da8c71..249a33c 100644
--- a/package/games/rubix/Config.in
+++ b/package/games/rubix/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_RUBIX_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_RUBIX
 	bool "rubix"
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_RUBIX_AVAILABLE
 	help
 	  A 3D rubiks cube game for X
 
diff --git a/package/gamin/Config.in b/package/gamin/Config.in
index 3ede2e4..d835789 100644
--- a/package/gamin/Config.in
+++ b/package/gamin/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_GAMIN_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_GAMIN
 	bool "gamin"
-	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_GAMIN_AVAILABLE
 	help
 	  the File Alteration Monitor
 
diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index 82c970f..57e201d 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_GAWK_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_GAWK
 	bool "gawk"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_GAWK_AVAILABLE
 	help
 	  A special-purpose programming language which is data driven
 	  rather than procedural.  Allows for simple data-reformatting jobs
diff --git a/package/gdisk/Config.in b/package/gdisk/Config.in
index 24d305d..4abe39e 100644
--- a/package/gdisk/Config.in
+++ b/package/gdisk/Config.in
@@ -1,8 +1,12 @@
-config BR2_PACKAGE_GDISK
-	bool "gdisk"
+config BR2_PACKAGE_GDISK_AVAILABLE
+	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # util-linux
+
+config BR2_PACKAGE_GDISK
+	bool "gdisk"
+	depends on BR2_PACKAGE_GDISK_AVAILABLE
 	help
 	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
 	  text-mode partitioning tool that works on Globally Unique Identifier
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 28a0f12..7bb6e13 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -1,10 +1,14 @@
+config BR2_PACKAGE_GDK_PIXBUF_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_GDK_PIXBUF
 	bool "gdk-pixbuf"
-	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_GDK_PIXBUF_AVAILABLE
 	help
 	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
 	  and the GLib, to integrate well with GNOME applications.
diff --git a/package/genext2fs/Config.in b/package/genext2fs/Config.in
index 82992f8..14dc33c 100644
--- a/package/genext2fs/Config.in
+++ b/package/genext2fs/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_GENEXT2FS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_GENEXT2FS
        bool "genext2fs"
+	depends on BR2_PACKAGE_GENEXT2FS_AVAILABLE
        help
          genext2fs generates an ext2 filesystem as a normal (non-root)
 	 user.  It does not require you to mount the image file to
diff --git a/package/genromfs/Config.in b/package/genromfs/Config.in
index 2caf2a4..08f827e 100644
--- a/package/genromfs/Config.in
+++ b/package/genromfs/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_GENROMFS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_GENROMFS
        bool "genromfs"
+	depends on BR2_PACKAGE_GENROMFS_AVAILABLE
        help
          Tool to generate a ROMFS filesystem.
 
-	 http://romfs.sourceforge.net/
\ No newline at end of file
+	 http://romfs.sourceforge.net/
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index fabfe1e..684b84b 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -1,7 +1,11 @@
-config BR2_PACKAGE_GETTEXT
-	bool "gettext"
+config BR2_PACKAGE_GETTEXT_AVAILABLE
+	def_bool y
 	depends on BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
+
+config BR2_PACKAGE_GETTEXT
+	bool "gettext"
+	depends on BR2_PACKAGE_GETTEXT_AVAILABLE
 	help
 	  The GNU `gettext' utilities are a set of tools that provide a
 	  framework to help other GNU packages produce multi-lingual
diff --git a/package/giblib/Config.in b/package/giblib/Config.in
index 7153bd5..2bc3aa6 100644
--- a/package/giblib/Config.in
+++ b/package/giblib/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_GIBLIB_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_GIBLIB
 	bool "giblib"
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_IMLIB2
 	select BR2_PACKAGE_IMLIB2_X
+	depends on BR2_PACKAGE_GIBLIB_AVAILABLE
 	help
 	  Giblib is a simple library which wraps imlib2.
 
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 16f0d4a..6dc6da2 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_GLIB_NETWORKING_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_GLIB_NETWORKING
 	bool "glib-networking"
-	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	depends on BR2_PACKAGE_GLIB_NETWORKING_AVAILABLE
 	help
 	  Network-related GIO modules for glib.
 
diff --git a/package/gmp/Config.in b/package/gmp/Config.in
index 226e088..e18b6c6 100644
--- a/package/gmp/Config.in
+++ b/package/gmp/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_GMP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_GMP
 	bool "gmp"
+	depends on BR2_PACKAGE_GMP_AVAILABLE
 	help
 	  GNU Multiple Precision Arithmetic Library.
 
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index f86945c..13a1dc2 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -1,8 +1,11 @@
-config BR2_PACKAGE_GMPC
-	bool "gmpc"
+config BR2_PACKAGE_GMPC_AVAILABLE
+	def_bool y
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_GMPC
+	bool "gmpc"
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -14,6 +17,7 @@ config BR2_PACKAGE_GMPC
 	select BR2_PACKAGE_XLIB_LIBICE
 	select BR2_PACKAGE_XLIB_LIBSM
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_GMPC_AVAILABLE
 	help
 	  Gnome Music Player Client is a GNOME/GTK2.2 client for
 	  Music Player Daemon.
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 556caea..a9271c4 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_GNUTLS_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	select BR2_PACKAGE_LIBGCRYPT
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_GNUTLS_AVAILABLE
 	help
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index cbe30d6..a39e04f 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -1,12 +1,16 @@
+config BR2_PACKAGE_GOB2_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_GOB2
 	bool "gob2"
-	depends on BR2_USE_WCHAR # glib2
 	# m4 uses fork(), so does bison then
-	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
 	select BR2_PACKAGE_BISON
+	depends on BR2_PACKAGE_GOB2_AVAILABLE
 	help
 	  GOB (GTK+ Object Builder) is a preprocessor which simplifies
 	  the writing of GObjects in C.
diff --git a/package/gperf/Config.in b/package/gperf/Config.in
index 67b286b..7f1d113 100644
--- a/package/gperf/Config.in
+++ b/package/gperf/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_GPERF_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_GPERF
 	bool "gperf"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_GPERF_AVAILABLE
 	help
 	  A 'perfect hash function' generator
 
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index a11c553..fe8d827 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_GPSD_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_GPSD
 	bool "gpsd"
 	# Uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_GPSD_AVAILABLE
 	help
 	  gpsd is a service daemon that monitors one or more GPSes or AIS
 	  receivers attached to a host computer through serial or USB ports,
diff --git a/package/gqview/Config.in b/package/gqview/Config.in
index c1df40c..88d6177 100644
--- a/package/gqview/Config.in
+++ b/package/gqview/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_GQVIEW_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LIBGTK2
+
 config BR2_PACKAGE_GQVIEW
 	bool "gqview"
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_GQVIEW_AVAILABLE
 	help
 	  GQview is an image viewer for Unix operating systems
 
diff --git a/package/grep/Config.in b/package/grep/Config.in
index 1b39922..3c4f8bd 100644
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_GREP_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_GREP
 	bool "grep"
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on BR2_PACKAGE_GREP_AVAILABLE
 	help
 	  The GNU regular expression matcher.
 
diff --git a/package/gsl/Config.in b/package/gsl/Config.in
index aa431d1..befa674 100644
--- a/package/gsl/Config.in
+++ b/package/gsl/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_GSL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_GSL
 	bool "gsl"
+	depends on BR2_PACKAGE_GSL_AVAILABLE
 	help
 	  The GNU Scientific Library (GSL) is a numerical library for
 	  C and C++ programmers.  The library provides a wide range of
diff --git a/package/gtk2-engines/Config.in b/package/gtk2-engines/Config.in
index 756a7d0..5c6b503 100644
--- a/package/gtk2-engines/Config.in
+++ b/package/gtk2-engines/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_GTK2_ENGINES_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LIBGTK2
+
 config BR2_PACKAGE_GTK2_ENGINES
 	bool "gtk engines"
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_GTK2_ENGINES_AVAILABLE
 	help
 	  A collection of basic theme engines for GTK+.
diff --git a/package/gtk2-themes/gtk2-theme-hicolor/Config.in b/package/gtk2-themes/gtk2-theme-hicolor/Config.in
index 144f1d8..fc05c24 100644
--- a/package/gtk2-themes/gtk2-theme-hicolor/Config.in
+++ b/package/gtk2-themes/gtk2-theme-hicolor/Config.in
@@ -1,2 +1,6 @@
+config BR2_PACKAGE_GTK2_THEME_HICOLOR_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_GTK2_THEME_HICOLOR
 	bool "hicolor (default theme)"
+	depends on BR2_PACKAGE_GTK2_THEME_HICOLOR_AVAILABLE
diff --git a/package/gtkperf/Config.in b/package/gtkperf/Config.in
index 0122b52..f297f0f 100644
--- a/package/gtkperf/Config.in
+++ b/package/gtkperf/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_GTKPERF_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LIBGTK2
+
 config BR2_PACKAGE_GTKPERF
 	bool "gtkperf (performance test for GTK2)"
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_GTKPERF_AVAILABLE
 	help
 	  GtkPerf is an application designed to test GTK+ performance.
 	  The point is to create common testing platform to run
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 87f9a03..e453df4 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -1,10 +1,14 @@
-config BR2_PACKAGE_GVFS
-	bool "gvfs"
+config BR2_PACKAGE_GVFS_AVAILABLE
+	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
+
+config BR2_PACKAGE_GVFS
+	bool "gvfs"
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SHARED_MIME_INFO
+	depends on BR2_PACKAGE_GVFS_AVAILABLE
 	help
 	  gvfs is a userspace virtual filesystem where mount runs as a
 	  separate processes which you talk to via D-Bus. It also
diff --git a/package/gzip/Config.in b/package/gzip/Config.in
index f501d5c..c447cbc 100644
--- a/package/gzip/Config.in
+++ b/package/gzip/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_GZIP_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_GZIP
 	bool "gzip"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_GZIP_AVAILABLE
 	help
 	  Standard GNU compressor.  Provides things like gzip,
 	  gunzip, gzcat, etc...
diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 7710fa1..08101cf 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_HASERL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_HASERL
 	bool "haserl"
+	depends on BR2_PACKAGE_HASERL_AVAILABLE
 	help
 	  Haserl is a small cgi wrapper that enables shell scripts to be
 	  embedded into html documents. It is intended for environments
diff --git a/package/hdparm/Config.in b/package/hdparm/Config.in
index 32bd247..9cd1199 100644
--- a/package/hdparm/Config.in
+++ b/package/hdparm/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_HDPARM_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_HDPARM
 	bool "hdparm"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_HDPARM_AVAILABLE
 	help
 	  hdparm - get/set hard disk parameters for Linux IDE drives.
 
diff --git a/package/heirloom-mailx/Config.in b/package/heirloom-mailx/Config.in
index 9a871d4..0d72232 100644
--- a/package/heirloom-mailx/Config.in
+++ b/package/heirloom-mailx/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_HEIRLOOM_MAILX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_HEIRLOOM_MAILX
 	bool "heirloom-mailx"
+	depends on BR2_PACKAGE_HEIRLOOM_MAILX_AVAILABLE
 	help
 	  Heirloom mailx (previously known as nail) is a mail user
 	  agent for Unix systems.
diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 431a9fa..993cd99 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_HIAWATHA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_HIAWATHA
 	bool "hiawatha"
+	depends on BR2_PACKAGE_HIAWATHA_AVAILABLE
 	help
 	  Hiawatha is a webserver for Unix and has been built with
 	  security in mind. This resulted in a highly secure
diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 49e8400..7434548 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_HOSTAPD_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+
 config BR2_PACKAGE_HOSTAPD
 	bool "hostapd"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_LIBNL
+	depends on BR2_PACKAGE_HOSTAPD_AVAILABLE
 	help
 	  User space daemon for wireless access points.
 
diff --git a/package/htop/Config.in b/package/htop/Config.in
index 55b4b15..b644d14 100644
--- a/package/htop/Config.in
+++ b/package/htop/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_HTOP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_HTOP
 	bool "htop"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_HTOP_AVAILABLE
 	help
 	  htop is an interactive text-mode process viewer for Linux.
 	  It aims to be a better top.
diff --git a/package/hwdata/Config.in b/package/hwdata/Config.in
index 33e0738..0b62eec 100644
--- a/package/hwdata/Config.in
+++ b/package/hwdata/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_HWDATA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_HWDATA
 	bool "hwdata"
+	depends on BR2_PACKAGE_HWDATA_AVAILABLE
 	help
 	  Various hardware identification and configuration data, such as
 	  the pci.ids database, or the XFree86/xorg Cards database.
diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
index 43f5e05..6958929 100644
--- a/package/i2c-tools/Config.in
+++ b/package/i2c-tools/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_I2C_TOOLS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_I2C_TOOLS
 	bool "i2c-tools"
+	depends on BR2_PACKAGE_I2C_TOOLS_AVAILABLE
 	help
 	  Heterogeneous set of I2C tools for Linux
 
diff --git a/package/icu/Config.in b/package/icu/Config.in
index 21f5c2f..649c150 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -1,7 +1,11 @@
-config BR2_PACKAGE_ICU
-	bool "icu"
+config BR2_PACKAGE_ICU_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+
+config BR2_PACKAGE_ICU
+	bool "icu"
+	depends on BR2_PACKAGE_ICU_AVAILABLE
 	help
 	  International Components for Unicode.
 
diff --git a/package/ifplugd/Config.in b/package/ifplugd/Config.in
index 0311ad7..cff64de 100644
--- a/package/ifplugd/Config.in
+++ b/package/ifplugd/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_IFPLUGD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_IFPLUGD
 	bool "ifplugd"
 	select BR2_PACKAGE_LIBDAEMON
+	depends on BR2_PACKAGE_IFPLUGD_AVAILABLE
 	help
 	  Ifplugd is a daemon which will automatically configure your
 	  ethernet device when a cable is plugged in and automatically
diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
index 890bb12..99e3a93 100644
--- a/package/igh-ethercat/Config.in
+++ b/package/igh-ethercat/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_IGH_ETHERCAT_AVAILABLE
+	def_bool y
+	depends on BR2_LINUX_KERNEL
+
 config BR2_PACKAGE_IGH_ETHERCAT
 	bool "igh-ethercat"
-	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_IGH_ETHERCAT_AVAILABLE
 	help
 	  IgH EtherCAT Master for Linux.
 
diff --git a/package/imagemagick/Config.in b/package/imagemagick/Config.in
index e66ded0..d963a8b 100644
--- a/package/imagemagick/Config.in
+++ b/package/imagemagick/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_IMAGEMAGICK_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_IMAGEMAGICK
 	bool "imagemagick"
+	depends on BR2_PACKAGE_IMAGEMAGICK_AVAILABLE
 	help
 	  ImageMagick(R) is a software suite to create, edit, and compose
 	  bitmap images. It can read, convert and write images in a variety of
diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
index 16a94d6..069b8a6 100644
--- a/package/imlib2/Config.in
+++ b/package/imlib2/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_IMLIB2_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_IMLIB2
 	bool "imlib2"
 	select BR2_PACKAGE_FREETYPE
+	depends on BR2_PACKAGE_IMLIB2_AVAILABLE
 	help
 	  Imlib 2 is the successor to Imlib. This library provides
 	  routines to load, save and render images in various formats.
diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index 623da41..faa7959 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_INADYN_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_INADYN
 	bool "inadyn"
+	depends on BR2_PACKAGE_INADYN_AVAILABLE
 	help
 	  INADYN is a free DynDNS client. It gives the possibility
 	  to have your own fixed hostname registered on the internet,
diff --git a/package/inotify-tools/Config.in b/package/inotify-tools/Config.in
index ed94b3f..4386af1 100644
--- a/package/inotify-tools/Config.in
+++ b/package/inotify-tools/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_INOTIFY_TOOLS_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_INOTIFY_TOOLS
 	bool "inotify-tools"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_INOTIFY_TOOLS_AVAILABLE
 	help
 	  inotify-tools is a C library and a set of command-line
 	  programs for Linux providing a simple interface to inotify.
diff --git a/package/input-event-daemon/Config.in b/package/input-event-daemon/Config.in
index 84177fd..2a125cb 100644
--- a/package/input-event-daemon/Config.in
+++ b/package/input-event-daemon/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_INPUT_EVENT_DAEMON_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_INPUT_EVENT_DAEMON
 	bool "input-event-daemon"
 	# Uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_INPUT_EVENT_DAEMON_AVAILABLE
 	help
 	  input-event-daemon is a daemon which executes
 	  a user-defined command on input events, such as
diff --git a/package/input-tools/Config.in b/package/input-tools/Config.in
index 489b130..b263079 100644
--- a/package/input-tools/Config.in
+++ b/package/input-tools/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_INPUT_TOOLS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_INPUT_TOOLS
 	bool "input-tools"
+	depends on BR2_PACKAGE_INPUT_TOOLS_AVAILABLE
 	help
 	  Tools for the Linux kernel input layer.
 	  http://linuxconsole.sourceforge.net/
diff --git a/package/intltool/Config.in b/package/intltool/Config.in
index 990a227..2cc2e3d 100644
--- a/package/intltool/Config.in
+++ b/package/intltool/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_INTLTOOL_AVAILABLE
+	def_bool y
+       depends on BR2_HOST_ONLY
+
 config BR2_PACKAGE_INTLTOOL
        bool "intltool"
        # Hide from configuration as we only support the host package
        # for the moment
-       depends on BR2_HOST_ONLY
+	depends on BR2_PACKAGE_INTLTOOL_AVAILABLE
        help
          Utility scripts for internationalizing XML
 
-	 http://www.freedesktop.org/wiki/Software/intltool
\ No newline at end of file
+	 http://www.freedesktop.org/wiki/Software/intltool
diff --git a/package/iostat/Config.in b/package/iostat/Config.in
index 1aa1464..86a094f 100644
--- a/package/iostat/Config.in
+++ b/package/iostat/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_IOSTAT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_IOSTAT
 	bool "iostat"
+	depends on BR2_PACKAGE_IOSTAT_AVAILABLE
 	help
 	  An I/O performance monitoring utility.
 
diff --git a/package/iperf/Config.in b/package/iperf/Config.in
index c284bfd..7bc4272 100644
--- a/package/iperf/Config.in
+++ b/package/iperf/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_IPERF_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_IPERF
 	bool "iperf"
-	depends on BR2_INSTALL_LIBSTDCPP
 	# uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_IPERF_AVAILABLE
 	help
 	  Internet Protocol bandwidth measuring tool for measuring
 	  TCP/UDP performance.
diff --git a/package/ipkg/Config.in b/package/ipkg/Config.in
index ef65ca0..731e0ab 100644
--- a/package/ipkg/Config.in
+++ b/package/ipkg/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_IPKG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_IPKG
 	bool "ipkg"
+	depends on BR2_PACKAGE_IPKG_AVAILABLE
 	help
 	  The Itsy Package Installer from handhelds.org
 
diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index b6ee86e..6c837b8 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_IPROUTE2_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
+	depends on BR2_PACKAGE_IPROUTE2_AVAILABLE
 	help
 	  Kernel routing and traffic control utilities.  Provides things
 	  like ip and tc.
diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 6f6dc37..b90ec23 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_IPSEC_TOOLS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
+	depends on BR2_PACKAGE_IPSEC_TOOLS_AVAILABLE
 	help
 	  This package is required to support IPSec for Linux 2.6+
 
diff --git a/package/ipset/Config.in b/package/ipset/Config.in
index af16fa8..e96c8fe 100644
--- a/package/ipset/Config.in
+++ b/package/ipset/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_IPSET_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_IPSET
 	bool "ipset"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBMNL
+	depends on BR2_PACKAGE_IPSET_AVAILABLE
 	help
 	  Utility to manage IP sets in the linux kernel.
 	  Requires a patched kernel or version >=2.6.39.
diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index 8c4e989..8598478 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_IPTABLES_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_IPTABLES
 	bool "iptables"
+	depends on BR2_PACKAGE_IPTABLES_AVAILABLE
 	help
 	  Linux kernel (2.4+) firewall, NAT, and packet mangling tools.
 
diff --git a/package/irda-utils/Config.in b/package/irda-utils/Config.in
index 418ab61..7bbc78f 100644
--- a/package/irda-utils/Config.in
+++ b/package/irda-utils/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_IRDA_UTILS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_IRDA_UTILS
 	bool "irda-utils"
+	depends on BR2_PACKAGE_IRDA_UTILS_AVAILABLE
 	help
 	  user space utilities which control the IrDA stack
 
diff --git a/package/iw/Config.in b/package/iw/Config.in
index 69ef675..4abca8d 100644
--- a/package/iw/Config.in
+++ b/package/iw/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_IW_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+
 config BR2_PACKAGE_IW
 	bool "iw"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_LIBNL
+	depends on BR2_PACKAGE_IW_AVAILABLE
 	help
 	  Utility for wireless devices using the mac80211 kernel stack
 
diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 36d73c5..4f308b4 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_JPEG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_JPEG
 	bool "jpeg"
+	depends on BR2_PACKAGE_JPEG_AVAILABLE
 	help
 	  The ubiquitous C library for manipulating JPEG images.
 
diff --git a/package/jquery-sparkline/Config.in b/package/jquery-sparkline/Config.in
index ae66364..4c9d8c3 100644
--- a/package/jquery-sparkline/Config.in
+++ b/package/jquery-sparkline/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_JQUERY_SPARKLINE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_JQUERY_SPARKLINE
 	bool "jQuery-Sparkline"
 	select BR2_PACKAGE_JQUERY
+	depends on BR2_PACKAGE_JQUERY_SPARKLINE_AVAILABLE
 	help
 	  This jQuery plugin generates sparklines (small inline
 	  charts) directly in the browser using data supplied either
diff --git a/package/jquery-validation/Config.in b/package/jquery-validation/Config.in
index 2a764c1..a8a1603 100644
--- a/package/jquery-validation/Config.in
+++ b/package/jquery-validation/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_JQUERY_VALIDATION_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_JQUERY_VALIDATION
 	bool "jQuery-Validation"
 	select BR2_PACKAGE_JQUERY
+	depends on BR2_PACKAGE_JQUERY_VALIDATION_AVAILABLE
 	help
 	  The jQuery Validation Plugin provides drop-in validation for
 	  your existing forms, while making all kinds of
diff --git a/package/jquery/Config.in b/package/jquery/Config.in
index 92f5604..4465962 100644
--- a/package/jquery/Config.in
+++ b/package/jquery/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_JQUERY_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_JQUERY
 	bool "jQuery"
+	depends on BR2_PACKAGE_JQUERY_AVAILABLE
 	help
 	  jQuery is a fast and concise JavaScript Library that
 	  simplifies HTML document traversing, event handling,
diff --git a/package/jsmin/Config.in b/package/jsmin/Config.in
index d0948b8..ef693f6 100644
--- a/package/jsmin/Config.in
+++ b/package/jsmin/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_JSMIN_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_JSMIN
 	bool "jsmin"
+	depends on BR2_PACKAGE_JSMIN_AVAILABLE
 	help
 	  JSMin is a filter which removes comments and unnecessary
 	  whitespace from JavaScript files. It typically reduces
diff --git a/package/json-c/Config.in b/package/json-c/Config.in
index dbdd75b..5e1bbd0 100644
--- a/package/json-c/Config.in
+++ b/package/json-c/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_JSON_C_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_JSON_C
 	bool "json-c"
+	depends on BR2_PACKAGE_JSON_C_AVAILABLE
 	help
 	  JSON-C - A JSON implementation in C
 
diff --git a/package/kbd/Config.in b/package/kbd/Config.in
index a23b70a..f1dc8be 100644
--- a/package/kbd/Config.in
+++ b/package/kbd/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_KBD_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_KBD
 	bool "kbd"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	# Uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_KBD_AVAILABLE
 	help
 	  Keytable files and keyboard utilities.
 
diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 6f10b89..4d098e0 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_KEXEC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_KEXEC
 	bool "kexec"
+	depends on BR2_PACKAGE_KEXEC_AVAILABLE
 	help
 	  Kexec is a user space utiltity for loading another kernel
 	  and asking the currently running kernel to do something with it.
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 6954665..e868fff 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,12 +1,16 @@
 comment "Kismet requires a toolchain with C++ support enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
+config BR2_PACKAGE_KISMET_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_KISMET
 	bool "kismet"
-	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_LIBPCAP
+	depends on BR2_PACKAGE_KISMET_AVAILABLE
 	help
 	  Kismet - 802.11 layer2 wireless network detector, sniffer,
 	  and intrusion detection system.
diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index 4965237..0183127 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_KMOD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_KMOD
 	bool "kmod"
+	depends on BR2_PACKAGE_KMOD_AVAILABLE
 	help
 	  handle kernel modules
 
diff --git a/package/latencytop/Config.in b/package/latencytop/Config.in
index 12176c0..d4c0b2a 100644
--- a/package/latencytop/Config.in
+++ b/package/latencytop/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_LATENCYTOP_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_LATENCYTOP
 	bool "latencytop"
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_LATENCYTOP_AVAILABLE
 	help
 	  There are many types and causes of latency. LatencyTOP
 	  focuses on the type of latency that causes skips in audio,
diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index 7261105..9231203 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LCDPROC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LCDPROC
        bool "lcdproc"
        select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_LCDPROC_AVAILABLE
        help
          LCD display driver daemon and clients
 
diff --git a/package/leafpad/Config.in b/package/leafpad/Config.in
index a440854..7c9ce45 100644
--- a/package/leafpad/Config.in
+++ b/package/leafpad/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LEAFPAD_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LIBGTK2
+
 config BR2_PACKAGE_LEAFPAD
 	bool "leafpad"
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LEAFPAD_AVAILABLE
 	help
 	  GTK+ based simple text editor
 
diff --git a/package/less/Config.in b/package/less/Config.in
index b7aa152..d71f9f1 100644
--- a/package/less/Config.in
+++ b/package/less/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LESS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LESS
 	bool "less"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_LESS_AVAILABLE
 	help
 	  Excellent text file viewer.
 
diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index 833009a..219950a 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -1,8 +1,12 @@
-config BR2_PACKAGE_LIBAIO
-	bool "libaio"
+config BR2_PACKAGE_LIBAIO_AVAILABLE
+	def_bool y
 	depends on \
 		BR2_arm   || BR2_armeb || BR2_avr32  || BR2_i386    || \
 		BR2_m68k  || BR2_mips  || BR2_mipsel || BR2_powerpc || \
 		BR2_sparc || BR2_x86_64
+
+config BR2_PACKAGE_LIBAIO
+	bool "libaio"
+	depends on BR2_PACKAGE_LIBAIO_AVAILABLE
 	help
 	  Library for doing asynchronous I/O
diff --git a/package/libao/Config.in b/package/libao/Config.in
index 3c99ab9..e41f568 100644
--- a/package/libao/Config.in
+++ b/package/libao/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBAO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBAO
 	bool "libao"
+	depends on BR2_PACKAGE_LIBAO_AVAILABLE
 	help
 	  Libao is a cross-platform audio library that allows programs
 	  to output audio using a simple API on a wide variety of platforms.
diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
index 38928b0..084f056 100644
--- a/package/libarchive/Config.in
+++ b/package/libarchive/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBARCHIVE_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_LIBARCHIVE
 	bool "libarchive"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBARCHIVE_AVAILABLE
 	help
 	  Libarchive is a reusable C library for reading and writing a
 	  variety of streaming archive formats.
diff --git a/package/libargtable2/Config.in b/package/libargtable2/Config.in
index 42d067b..cde9646 100644
--- a/package/libargtable2/Config.in
+++ b/package/libargtable2/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBARGTABLE2_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBARGTABLE2
 	bool "libargtable2"
+	depends on BR2_PACKAGE_LIBARGTABLE2_AVAILABLE
 	help
 	  A greatly simplified and yet quite robust argument parsing
 	  set of library calls.
diff --git a/package/libart/Config.in b/package/libart/Config.in
index 9262335..402ef5d 100644
--- a/package/libart/Config.in
+++ b/package/libart/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBART_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBART
 	bool "libart"
+	depends on BR2_PACKAGE_LIBART_AVAILABLE
 	help
 	  Libart is a library for high-performance 2D graphics. It
 	  supports a very powerful imaging model, basically the same
diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index 3d5d0a8..ea67143 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBATOMIC_OPS_AVAILABLE
+	def_bool y
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
+
 config BR2_PACKAGE_LIBATOMIC_OPS
 	bool "libatomic_ops"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_AVAILABLE
 	help
 	  Atomic operations library
diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index d1663cd..0cdf989 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBCAP_NG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBCAP_NG
 	bool "libcap-ng"
+	depends on BR2_PACKAGE_LIBCAP_NG_AVAILABLE
 	help
 	  The libcap-ng library is intended to make programming with
 	  posix capabilities much easier than the traditional libcap
diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index f1fc8fa..edecdf2 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBCAP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBCAP
 	bool "libcap"
+	depends on BR2_PACKAGE_LIBCAP_AVAILABLE
 	help
 	 This library implements the user-space interfaces to the
 	 POSIX 1003.1e capabilities available in Linux kernels. These
diff --git a/package/libcdaudio/Config.in b/package/libcdaudio/Config.in
index 02df01e..acb2121 100644
--- a/package/libcdaudio/Config.in
+++ b/package/libcdaudio/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBCDAUDIO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBCDAUDIO
 	bool "libcdaudio"
+	depends on BR2_PACKAGE_LIBCDAUDIO_AVAILABLE
 	help
 	  libcdaudio is a library designed to provide functions to
 	  control operation of a CD-ROM when playing audio CDs. It
diff --git a/package/libcgi/Config.in b/package/libcgi/Config.in
index 430039e..1353915 100644
--- a/package/libcgi/Config.in
+++ b/package/libcgi/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBCGI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBCGI
 	bool "libcgi"
+	depends on BR2_PACKAGE_LIBCGI_AVAILABLE
 	help
 	  LibCGI is a library written from scratch to easily make
 	  CGI applications in C.
diff --git a/package/libcgicc/Config.in b/package/libcgicc/Config.in
index 098f9a6..8d61cc4 100644
--- a/package/libcgicc/Config.in
+++ b/package/libcgicc/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBCGICC_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_LIBCGICC
 	bool "libcgicc"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LIBCGICC_AVAILABLE
 	help
 	  GNU cgicc is a C++ class library that greatly simplifies
 	  the creation of CGI applications for the World Wide Web.
diff --git a/package/libconfig/Config.in b/package/libconfig/Config.in
index 75dacab..041871e 100644
--- a/package/libconfig/Config.in
+++ b/package/libconfig/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBCONFIG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBCONFIG
 	bool "libconfig"
+	depends on BR2_PACKAGE_LIBCONFIG_AVAILABLE
 	help
 	  Libconfig is a simple library for manipulating structured
 	  configuration files. The file format is more compact and more
diff --git a/package/libconfuse/Config.in b/package/libconfuse/Config.in
index be18cbb..7031f70 100644
--- a/package/libconfuse/Config.in
+++ b/package/libconfuse/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBCONFUSE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBCONFUSE
 	bool "libconfuse"
+	depends on BR2_PACKAGE_LIBCONFUSE_AVAILABLE
 	help
 	  LibConfuse is a configuration file parser library written in
 	  C. It supports sections and (lists of) values (strings,
diff --git a/package/libcue/Config.in b/package/libcue/Config.in
index e5e2e16..0645578 100644
--- a/package/libcue/Config.in
+++ b/package/libcue/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LIBCUE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBCUE
 	bool "libcue"
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
+	depends on BR2_PACKAGE_LIBCUE_AVAILABLE
 	help
 	  CUE Sheet Parser Library
 
diff --git a/package/libcuefile/Config.in b/package/libcuefile/Config.in
index 416b3e1..58d4420 100644
--- a/package/libcuefile/Config.in
+++ b/package/libcuefile/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBCUEFILE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBCUEFILE
 	bool "libcuefile"
+	depends on BR2_PACKAGE_LIBCUEFILE_AVAILABLE
 	help
 	  Cue File library from Musepack
 
diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 1d6d08e..169a0bb 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBCURL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBCURL
 	bool "libcurl"
+	depends on BR2_PACKAGE_LIBCURL_AVAILABLE
 	help
 	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
 	  and Dict servers, using any of the supported protocols.
diff --git a/package/libdaemon/Config.in b/package/libdaemon/Config.in
index 6943263..f377f8d 100644
--- a/package/libdaemon/Config.in
+++ b/package/libdaemon/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBDAEMON_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBDAEMON
 	bool "libdaemon"
+	depends on BR2_PACKAGE_LIBDAEMON_AVAILABLE
 	help
 	  libdaemon is a lightweight C library that eases the
 	  writing of UNIX daemons.
diff --git a/package/libdmtx/Config.in b/package/libdmtx/Config.in
index db4187f..2821ba6 100644
--- a/package/libdmtx/Config.in
+++ b/package/libdmtx/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBDMTX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBDMTX
 	bool "libdmtx"
+	depends on BR2_PACKAGE_LIBDMTX_AVAILABLE
 	help
 	  libdmtx is a software library that enables programs to read and write
 	  Data Matrix barcodes of the modern ECC200 variety.
diff --git a/package/libdnet/Config.in b/package/libdnet/Config.in
index 589903f..a14c5d4 100644
--- a/package/libdnet/Config.in
+++ b/package/libdnet/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBDNET_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBDNET
 	bool "libdnet"
+	depends on BR2_PACKAGE_LIBDNET_AVAILABLE
 	help
 	  libdnet - simplified interface to low-level networking routines.
 
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index f3dab9a..636e72f 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,7 +1,10 @@
-config BR2_PACKAGE_LIBDRM
-	bool "libdrm"
+config BR2_PACKAGE_LIBDRM_AVAILABLE
+	def_bool y
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_LARGEFILE
+
+config BR2_PACKAGE_LIBDRM
+	bool "libdrm"
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
@@ -12,6 +15,7 @@ config BR2_PACKAGE_LIBDRM
 	# architectures, and we make the assumption that the intel
 	# driver can only be used on x86 and x86_64 machines.
 	select BR2_PACKAGE_LIBATOMIC_OPS if (BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL && (BR2_i386 || BR2_x86_64))
+	depends on BR2_PACKAGE_LIBDRM_AVAILABLE
 	help
 	  Direct Rendering Manager
 
diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index 5ba31e8..0425976 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LIBDVDNAV_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE # libdvdread
+
 config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
-	depends on BR2_LARGEFILE # libdvdread
         select BR2_PACKAGE_LIBDVDREAD
+	depends on BR2_PACKAGE_LIBDVDNAV_AVAILABLE
 	help
 	  libdvdnav is a library that allows easy use of sophisticated
 	  DVD navigation features such as DVD menus, multiangle
diff --git a/package/libdvdread/Config.in b/package/libdvdread/Config.in
index b63f082..2a09efb 100644
--- a/package/libdvdread/Config.in
+++ b/package/libdvdread/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBDVDREAD_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_LIBDVDREAD
 	bool "libdvdread"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBDVDREAD_AVAILABLE
 	help
 	  libdvdread provides a simple foundation for reading
 	  DVD-Video images.
diff --git a/package/libeXosip2/Config.in b/package/libeXosip2/Config.in
index 755d284..3a71fa7 100644
--- a/package/libeXosip2/Config.in
+++ b/package/libeXosip2/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBEXOSIP2_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBEXOSIP2
 	bool "libeXosip2"
 	select BR2_PACKAGE_LIBOSIP2
+	depends on BR2_PACKAGE_LIBEXOSIP2_AVAILABLE
 	help
 	  eXosip is a library that hides the complexity of using the
 	  SIP protocol for mutlimedia session establishement.
diff --git a/package/libelf/Config.in b/package/libelf/Config.in
index 600ef68..a5f0c4d 100644
--- a/package/libelf/Config.in
+++ b/package/libelf/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBELF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBELF
 	bool "libelf"
+	depends on BR2_PACKAGE_LIBELF_AVAILABLE
 	help
 	  The elf library provides routines to access, and manipulate,
 	  Elf object files.
diff --git a/package/liberation/Config.in b/package/liberation/Config.in
index 48d4195..4b7a881 100644
--- a/package/liberation/Config.in
+++ b/package/liberation/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBERATION_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBERATION
 	bool "Liberation (Free fonts)"
+	depends on BR2_PACKAGE_LIBERATION_AVAILABLE
 	help
 	  The Liberation Fonts are intended to be replacements for the
 	  three most commonly used fonts on Microsoft systems:
diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
index 4e9e455..5fb4e45 100644
--- a/package/libesmtp/Config.in
+++ b/package/libesmtp/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBESMTP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBESMTP
 	bool "libesmtp"
+	depends on BR2_PACKAGE_LIBESMTP_AVAILABLE
 	help
 	  Library for sending emails through SMTP.
 
diff --git a/package/libev/Config.in b/package/libev/Config.in
index 71abe77..2395c17 100644
--- a/package/libev/Config.in
+++ b/package/libev/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBEV_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBEV
 	bool "libev"
+	depends on BR2_PACKAGE_LIBEV_AVAILABLE
 	help
 	  Userspace library for handling asynchronous notifications
 
diff --git a/package/libevent/Config.in b/package/libevent/Config.in
index 680fa48..b7c63bb 100644
--- a/package/libevent/Config.in
+++ b/package/libevent/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBEVENT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBEVENT
 	bool "libevent"
+	depends on BR2_PACKAGE_LIBEVENT_AVAILABLE
 	help
 	  Userspace library for handling asynchronous notifications
 
diff --git a/package/libexif/Config.in b/package/libexif/Config.in
index 9c89df4..99b9573 100644
--- a/package/libexif/Config.in
+++ b/package/libexif/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBEXIF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBEXIF
 	bool "libexif"
+	depends on BR2_PACKAGE_LIBEXIF_AVAILABLE
 	help
 	  Most digital cameras produce EXIF files, which are JPEG
 	  files with extra tags that contain information about the
diff --git a/package/libfcgi/Config.in b/package/libfcgi/Config.in
index a622ec3..6fc36f0 100644
--- a/package/libfcgi/Config.in
+++ b/package/libfcgi/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBFCGI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBFCGI
 	bool "libfcgi"
+	depends on BR2_PACKAGE_LIBFCGI_AVAILABLE
 	help
 	  FCGI, a fastcgi developer library for C/C++
 
diff --git a/package/libffi/Config.in b/package/libffi/Config.in
index 7211f8f..326a905 100644
--- a/package/libffi/Config.in
+++ b/package/libffi/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBFFI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBFFI
 	bool "libffi"
+	depends on BR2_PACKAGE_LIBFFI_AVAILABLE
 	help
 	  The libffi library provides a portable, high level
 	  programming interface to various calling conventions. This
diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index 6877000..1dfea84 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_LIBFREEFARE_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+
 config BR2_PACKAGE_LIBFREEFARE
 	bool "libfreefare"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBNFC
+	depends on BR2_PACKAGE_LIBFREEFARE_AVAILABLE
 	help
 	  Library for high level manipulation of MIFARE cards.
 
diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index 48e9ceb..f37ccc7 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_LIBFTDI_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+
 config BR2_PACKAGE_LIBFTDI
 	bool "libftdi"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_PACKAGE_LIBFTDI_AVAILABLE
 	help
 	  Userspace access to FTDI USB interface chips
 
diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
index dffadf8..832c7b1 100644
--- a/package/libfuse/Config.in
+++ b/package/libfuse/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBFUSE_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_LIBFUSE
 	bool "libfuse"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBFUSE_AVAILABLE
 	help
 	  FUSE (Filesystem in UserSpacE)
 
diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index ba74795..f96726e 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LIBGAIL_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LIBGTK2
+
 config BR2_PACKAGE_LIBGAIL
 	bool "libgail"
-	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_PANGO
+	depends on BR2_PACKAGE_LIBGAIL_AVAILABLE
 	help
 	  GAIL provides accessibility support for gtk+ and
 	  libgnomecanvas by implementing AtkObjects for widgets in
diff --git a/package/libgcrypt/Config.in b/package/libgcrypt/Config.in
index 55d2f17..ee4749a 100644
--- a/package/libgcrypt/Config.in
+++ b/package/libgcrypt/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBGCRYPT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBGCRYPT
 	bool "libgcrypt"
 	select BR2_PACKAGE_LIBGPG_ERROR
+	depends on BR2_PACKAGE_LIBGCRYPT_AVAILABLE
 	help
 	  LibGCrypt is GNU's basic cryptographic library.
 
diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
index 7489a47..4fd59ce 100644
--- a/package/libgeotiff/Config.in
+++ b/package/libgeotiff/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBGEOTIFF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBGEOTIFF
        bool "libgeotiff"
        select BR2_PACKAGE_TIFF
+	depends on BR2_PACKAGE_LIBGEOTIFF_AVAILABLE
        help
          Libgeotiff is an open source library normally hosted on top of
          libtiff for reading, and writing GeoTIFF information tags.
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index f7a9a1c..f129bdd 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -1,10 +1,14 @@
-config BR2_PACKAGE_LIBGLADE
-	bool "libglade"
+config BR2_PACKAGE_LIBGLADE_AVAILABLE
+	def_bool y
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_WCHAR # glib2
+
+config BR2_PACKAGE_LIBGLADE
+	bool "libglade"
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_LIBXML2
+	depends on BR2_PACKAGE_LIBGLADE_AVAILABLE
 	help
 	  Libglade allows you to load glade interface files in a program
 	  at runtime. It doesn't require GLADE to be used, but GLADE is
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index d1d7231..3a47038 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -1,3 +1,7 @@
+config BR2_PACKAGE_LIBGLIB2_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # gettext
+
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
@@ -5,7 +9,7 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 8287f98..c6071db 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBGPG_ERROR_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_AVAILABLE
 	help
 	  Libgpg-error is a small library with error codes and
 	  descriptions shared by most GnuPG related software.
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index efaf12f..c0ecf49 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -1,3 +1,9 @@
+config BR2_PACKAGE_LIBGTK2_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+
 config BR2_PACKAGE_LIBGTK2
 	bool "libgtk2"
 	select BR2_PACKAGE_ATK
@@ -8,9 +14,7 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_GDK_PIXBUF
-	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 	help
 	  The GTK+ version 2 graphical user interface library
 
diff --git a/package/libhid/Config.in b/package/libhid/Config.in
index 093b98f..ec3abb8 100644
--- a/package/libhid/Config.in
+++ b/package/libhid/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_LIBHID_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+
 config BR2_PACKAGE_LIBHID
 	bool "libhid"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_PACKAGE_LIBHID_AVAILABLE
 	help
 	  Userspace library for accessing USB HID devices
 
diff --git a/package/libical/Config.in b/package/libical/Config.in
index 5907548..095e504 100644
--- a/package/libical/Config.in
+++ b/package/libical/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBICAL_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_LIBICAL
 	bool "libical"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBICAL_AVAILABLE
 	help
 	  libical is an Open Source (MPL/LGPL) implementation of the IETF's
 	  iCalendar Calendaring and Scheduling protocols.
diff --git a/package/libiconv/Config.in b/package/libiconv/Config.in
index ee4fd62..b0a4659 100644
--- a/package/libiconv/Config.in
+++ b/package/libiconv/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBICONV_AVAILABLE
+	def_bool y
+	depends on !BR2_ENABLE_LOCALE
+
 config BR2_PACKAGE_LIBICONV
 	bool "libiconv"
-	depends on !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_LIBICONV_AVAILABLE
 	help
 	  unicode conversion library
 
diff --git a/package/libid3tag/Config.in b/package/libid3tag/Config.in
index 869b9f7..8e13b54 100644
--- a/package/libid3tag/Config.in
+++ b/package/libid3tag/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBID3TAG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBID3TAG
 	bool "libid3tag"
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_LIBID3TAG_AVAILABLE
 	help
 	  ID3 tag reading library from the MAD project.
 
diff --git a/package/libidn/Config.in b/package/libidn/Config.in
index dcf9724..ab5bcbe 100644
--- a/package/libidn/Config.in
+++ b/package/libidn/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBIDN_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBIDN
 	bool "libidn"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on BR2_PACKAGE_LIBIDN_AVAILABLE
 	help
 	  Libidn's purpose is to encode and decode internationalized
 	  domain names.
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
index 7222536..9007752 100644
--- a/package/libiqrf/Config.in
+++ b/package/libiqrf/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LIBIQRF_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+
 config BR2_PACKAGE_LIBIQRF
 	bool "libiqrf"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
+	depends on BR2_PACKAGE_LIBIQRF_AVAILABLE
 	help
 	  This library implement specific protocol
 	  which is used for communicating with iqrf devices
diff --git a/package/liblo/Config.in b/package/liblo/Config.in
index 4c2d719..9eb66a3 100644
--- a/package/liblo/Config.in
+++ b/package/liblo/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBLO_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBLO
 	bool "liblo"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBLO_AVAILABLE
 	help
 	  liblo is an implementation of the Open Sound Control
 	  protocol for POSIX systems
diff --git a/package/liblockfile/Config.in b/package/liblockfile/Config.in
index 88a9c33..ba5c1ec 100644
--- a/package/liblockfile/Config.in
+++ b/package/liblockfile/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_LIBLOCKFILE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBLOCKFILE
 	bool "liblockfile"
+	depends on BR2_PACKAGE_LIBLOCKFILE_AVAILABLE
 	help
 	  NFS-safe locking library.
diff --git a/package/libmad/Config.in b/package/libmad/Config.in
index d0edc49..90bb5b7 100644
--- a/package/libmad/Config.in
+++ b/package/libmad/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBMAD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBMAD
 	bool "libmad"
+	depends on BR2_PACKAGE_LIBMAD_AVAILABLE
 	help
 	  High-quality MPEG audio decoder.  All computations are performed
 	  with fixed-point integer arithmetic, making it ideal for systems
diff --git a/package/libmbus/Config.in b/package/libmbus/Config.in
index 1e2a8de..4e7e445 100644
--- a/package/libmbus/Config.in
+++ b/package/libmbus/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBMBUS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBMBUS
 	bool "libmbus"
+	depends on BR2_PACKAGE_LIBMBUS_AVAILABLE
 	help
 	  libmbus is a library for communicating with energy metering devices.
 	  It supports TCP and RS232 M-bus gateways.
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index cfedc8f..4af98b0 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBMICROHTTPD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBMICROHTTPD
 	bool "libmicrohttpd"
+	depends on BR2_PACKAGE_LIBMICROHTTPD_AVAILABLE
 	help
 	  GNU libmicrohttpd is a small C library that makes it easy to
 	  run an HTTP server as part of another application.
diff --git a/package/libmms/Config.in b/package/libmms/Config.in
index 17cb406..80fe2e4 100644
--- a/package/libmms/Config.in
+++ b/package/libmms/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LIBMMS_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_LIBMMS
 	bool "libmms"
-	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_LIBMMS_AVAILABLE
 	help
           LibMMS is a common library for parsing mms:// and mmsh://
           type network streams. These are commonly used to stream
diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
index 87475df..5df3fcf 100644
--- a/package/libmnl/Config.in
+++ b/package/libmnl/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBMNL_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_LIBMNL
 	bool "libmnl"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBMNL_AVAILABLE
 	help
 	  libmnl is a minimalistic user-space library oriented
 	  to Netlink developers.
diff --git a/package/libmodbus/Config.in b/package/libmodbus/Config.in
index ccf1190..3b52eec 100644
--- a/package/libmodbus/Config.in
+++ b/package/libmodbus/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBMODBUS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBMODBUS
 	bool "libmodbus"
+	depends on BR2_PACKAGE_LIBMODBUS_AVAILABLE
 	help
 	  libmodbus is a free software library to send/receive data according
 	  to the Modbus protocol. This library is written in C and supports
diff --git a/package/libmpd/Config.in b/package/libmpd/Config.in
index 9259c19..65eb21b 100644
--- a/package/libmpd/Config.in
+++ b/package/libmpd/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_LIBMPD_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_LIBMPD
 	bool "libmpd"
-	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_LIBMPD_AVAILABLE
 	help
 	  High-level client library for accessing Music Player Daemon.
 	  LibMpd is a library that provides high-level, callback-based
diff --git a/package/libmpeg2/Config.in b/package/libmpeg2/Config.in
index 3694689..3a38e31 100644
--- a/package/libmpeg2/Config.in
+++ b/package/libmpeg2/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBMPEG2_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBMPEG2
 	bool "libmpeg2"
+	depends on BR2_PACKAGE_LIBMPEG2_AVAILABLE
 	help
 	  MPEG1/MPEG2 video decoder library
 
diff --git a/package/libnetfilter_conntrack/Config.in b/package/libnetfilter_conntrack/Config.in
index caf8a8a..cb13940 100644
--- a/package/libnetfilter_conntrack/Config.in
+++ b/package/libnetfilter_conntrack/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBNETFILTER_CONNTRACK_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	bool "libnetfilter_conntrack"
 	select BR2_PACKAGE_LIBNFNETLINK
+	depends on BR2_PACKAGE_LIBNETFILTER_CONNTRACK_AVAILABLE
 	help
 	  libnetfilter_conntrack is a userspace library providing
 	  a programming interface (API) to the in-kernel
diff --git a/package/libnetfilter_cttimeout/Config.in b/package/libnetfilter_cttimeout/Config.in
index 8e2f438..9781203 100644
--- a/package/libnetfilter_cttimeout/Config.in
+++ b/package/libnetfilter_cttimeout/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
 	bool "libnetfilter_cttimeout"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBMNL
+	depends on BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT_AVAILABLE
 	help
 	  libnetfilter_cttimeout is the userspace library that provides
 	  the programming interface to the fine-grain
diff --git a/package/libnfc-llcp/Config.in b/package/libnfc-llcp/Config.in
index f557926..67e88ce 100644
--- a/package/libnfc-llcp/Config.in
+++ b/package/libnfc-llcp/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LIBNFC_LLCP_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+
 config BR2_PACKAGE_LIBNFC_LLCP
 	bool "libnfc-llcp"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBNFC
+	depends on BR2_PACKAGE_LIBNFC_LLCP_AVAILABLE
 	help
 	  Library extending libnfc with support for Logical Link Control
 	  Protocol.
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index 159578f..065dabc 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_LIBNFC_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+
 config BR2_PACKAGE_LIBNFC
 	bool "libnfc"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_PACKAGE_LIBNFC_AVAILABLE
 	help
 	  Public platform independent Near Field Communication (NFC) library.
 
diff --git a/package/libnfnetlink/Config.in b/package/libnfnetlink/Config.in
index fa247c5..4929f58 100644
--- a/package/libnfnetlink/Config.in
+++ b/package/libnfnetlink/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBNFNETLINK_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBNFNETLINK
 	bool "libnfnetlink"
+	depends on BR2_PACKAGE_LIBNFNETLINK_AVAILABLE
 	help
 	  libnfnetlink is the low-level library for netfilter related
 	  kernel/userspace communication.
diff --git a/package/libnl/Config.in b/package/libnl/Config.in
index f4a1dc2..be00d47 100644
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBNL_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBNL
 	bool "libnl"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBNL_AVAILABLE
 	help
 	  A library for applications dealing with netlink socket.
 
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 53086f0..e63c2ea 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBNSPR_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_LIBNSPR
 	bool "libnspr"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBNSPR_AVAILABLE
 	help
 	  NSPR is the Netscape Portable Runtime library which provides
 	  a platform-neutral API for system level and libc like
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 55928a4..f0ece99 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_LIBNSS_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_LIBNSS
 	bool "libnss"
 	select BR2_PACKAGE_LIBNSPR
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBNSS_AVAILABLE
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
diff --git a/package/liboauth/Config.in b/package/liboauth/Config.in
index 77a78f1..74e0b4d 100644
--- a/package/liboauth/Config.in
+++ b/package/liboauth/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBOAUTH_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBOAUTH
 	bool "liboauth"
 	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_LIBOAUTH_AVAILABLE
 	help
 	  liboauth is a collection of c functions implementing the oAuth
 	  Core 1.0 Rev A standard API. liboauth provides basic functions to
diff --git a/package/libogg/Config.in b/package/libogg/Config.in
index bf719ff..3117425 100644
--- a/package/libogg/Config.in
+++ b/package/libogg/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBOGG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBOGG
 	bool "libogg"
+	depends on BR2_PACKAGE_LIBOGG_AVAILABLE
 	help
 	  Ogg is a multimedia container format, and the native file
 	  and stream format for the Xiph.org multimedia codecs. As
diff --git a/package/liboping/Config.in b/package/liboping/Config.in
index 04e0e0d..2e60b35 100644
--- a/package/liboping/Config.in
+++ b/package/liboping/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBOPING_AVAILABLE
+	def_bool y
+	depends on BR2_INET_IPV6
+
 config BR2_PACKAGE_LIBOPING
 	bool "liboping"
-	depends on BR2_INET_IPV6
+	depends on BR2_PACKAGE_LIBOPING_AVAILABLE
 	help
 	  liboping is a C library to generate ICMP echo requests,
 	  better known as "ping packets".
diff --git a/package/libosip2/Config.in b/package/libosip2/Config.in
index be5de2d..6c0e253 100644
--- a/package/libosip2/Config.in
+++ b/package/libosip2/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBOSIP2_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBOSIP2
 	bool "libosip2"
+	depends on BR2_PACKAGE_LIBOSIP2_AVAILABLE
 	help
 	  GNU SIP (Session Initiation Protocol)
 	  This library aims to provide multimedia and telecom software
diff --git a/package/libpcap/Config.in b/package/libpcap/Config.in
index 7f9517a..2e8e0ae 100644
--- a/package/libpcap/Config.in
+++ b/package/libpcap/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBPCAP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBPCAP
 	bool "libpcap"
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_LIBPCAP_AVAILABLE
 	help
 	  A system-independent library for user-level network packet capture.
 
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index fe851ac..308839c 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -1,6 +1,10 @@
-config BR2_PACKAGE_LIBPLAYER
+config BR2_PACKAGE_LIBPLAYER_AVAILABLE
+	def_bool y
 	depends on BR2_LARGEFILE
+
+config BR2_PACKAGE_LIBPLAYER
 	bool "libplayer"
+	depends on BR2_PACKAGE_LIBPLAYER_AVAILABLE
 	help
 	  libplayer provides a generic A/V API that relies on various multimedia
 	  player for Linux systems. It currently supports MPlayer, xine VLC and
diff --git a/package/libpng/Config.in b/package/libpng/Config.in
index b0a3646..b0796bb 100644
--- a/package/libpng/Config.in
+++ b/package/libpng/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBPNG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBPNG
 	bool "libpng"
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_LIBPNG_AVAILABLE
 	help
 	  Library for handling PNG (Portable Network Graphics)
 	  images.
diff --git a/package/libraw/Config.in b/package/libraw/Config.in
index 4378ccd..bc5947a 100644
--- a/package/libraw/Config.in
+++ b/package/libraw/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBRAW_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_LIBRAW
 	bool "libraw"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LIBRAW_AVAILABLE
 	help
 	  libraw is a raw image manipulation library
 
diff --git a/package/libraw1394/Config.in b/package/libraw1394/Config.in
index 7a64959..58cade4 100644
--- a/package/libraw1394/Config.in
+++ b/package/libraw1394/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBRAW1394_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBRAW1394
 	bool "libraw1394"
+	depends on BR2_PACKAGE_LIBRAW1394_AVAILABLE
 	help
 	  libraw1394 provides direct access to the IEEE 1394 bus through
 	  the Linux 1394 subsystem's raw1394 user space interface.
diff --git a/package/libreplaygain/Config.in b/package/libreplaygain/Config.in
index d0045b2..363b14f 100644
--- a/package/libreplaygain/Config.in
+++ b/package/libreplaygain/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBREPLAYGAIN_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBREPLAYGAIN
 	bool "libreplaygain"
+	depends on BR2_PACKAGE_LIBREPLAYGAIN_AVAILABLE
 	help
 	  Replay Gain library from Musepack
 
diff --git a/package/libroxml/Config.in b/package/libroxml/Config.in
index b6b253f..e2ec7ba 100644
--- a/package/libroxml/Config.in
+++ b/package/libroxml/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBROXML_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBROXML
 	bool "roxml"
+	depends on BR2_PACKAGE_LIBROXML_AVAILABLE
 	help
 	  libroxml is a light and powerful xml parsing library with
 	  xpath handling. Roxml is a binary using libroxml to explore
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index fdb7d31..5d99f4e 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -1,3 +1,8 @@
+config BR2_PACKAGE_LIBRSVG_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_LIBRSVG
 	bool "librsvg"
 	select BR2_PACKAGE_LIBXML2
@@ -5,8 +10,7 @@ config BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_LIBGLIB2
-	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBRSVG_AVAILABLE
 	help
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
diff --git a/package/librsync/Config.in b/package/librsync/Config.in
index 5dcdfc8..9ed2b24 100644
--- a/package/librsync/Config.in
+++ b/package/librsync/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_LIBRSYNC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBRSYNC
 	bool "librsync"
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_POPT
+	depends on BR2_PACKAGE_LIBRSYNC_AVAILABLE
 	help
 	  librsync implements the rolling-checksum algorithm of
 	  remote file synchronization that was popularized by the
diff --git a/package/libsamplerate/Config.in b/package/libsamplerate/Config.in
index b394fdb..b6145e5 100644
--- a/package/libsamplerate/Config.in
+++ b/package/libsamplerate/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBSAMPLERATE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBSAMPLERATE
 	bool "libsamplerate"
+	depends on BR2_PACKAGE_LIBSAMPLERATE_AVAILABLE
 	help
 	  Secret Rabbit Code (aka libsamplerate) is a Sample Rate
 	  Converter for audio. One example of where such a thing would
diff --git a/package/libsexy/Config.in b/package/libsexy/Config.in
index 5d1e710..3607401 100644
--- a/package/libsexy/Config.in
+++ b/package/libsexy/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LIBSEXY_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LIBGTK2
+
 config BR2_PACKAGE_LIBSEXY
 	bool "libsexy"
-	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBXML2
+	depends on BR2_PACKAGE_LIBSEXY_AVAILABLE
 	help
 	  libsexy is a collection of GTK+ widgets that extend the
 	  functionality of such standard widgets as GtkEntry and
diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
index 93fa3f4..4601e13 100644
--- a/package/libsigc/Config.in
+++ b/package/libsigc/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBSIGC_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_LIBSIGC
 	bool "libsigc++"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LIBSIGC_AVAILABLE
 	help
 	  libsigc++ implements a typesafe callback system for standard C++.
 	  It allows you to define signals and to connect those signals to
diff --git a/package/libsndfile/Config.in b/package/libsndfile/Config.in
index 9afe496..a07f8cc 100644
--- a/package/libsndfile/Config.in
+++ b/package/libsndfile/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBSNDFILE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBSNDFILE
 	bool "libsndfile"
+	depends on BR2_PACKAGE_LIBSNDFILE_AVAILABLE
 	help
 	  Libsndfile is a C library for reading and writing files containing
 	  sampled sound (such as MS Windows WAV and the Apple/SGI AIFF format)
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index f40625d..190f160 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,10 +1,14 @@
+config BR2_PACKAGE_LIBSOUP_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2 and gnutls
+
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
-	depends on BR2_USE_WCHAR # glib2 and gnutls
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	depends on BR2_PACKAGE_LIBSOUP_AVAILABLE
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
 	  and the GLib main loop, to integrate well with GNOME
diff --git a/package/libsvgtiny/Config.in b/package/libsvgtiny/Config.in
index 836dec2..aa28766 100644
--- a/package/libsvgtiny/Config.in
+++ b/package/libsvgtiny/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBSVGTINY_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBSVGTINY
 	bool "libsvgtiny"
 	select BR2_PACKAGE_LIBXML2
+	depends on BR2_PACKAGE_LIBSVGTINY_AVAILABLE
 	help
 	  Libsvgtiny is an implementation of SVG Tiny, written in C.
 	  It is currently in development for use with NetSurf and is
diff --git a/package/libsysfs/Config.in b/package/libsysfs/Config.in
index e4e6f28..4a367b8 100644
--- a/package/libsysfs/Config.in
+++ b/package/libsysfs/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBSYSFS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBSYSFS
 	bool "libsysfs"
+	depends on BR2_PACKAGE_LIBSYSFS_AVAILABLE
 	help
 	These are a set of utilities built upon sysfs, a filesystem in
 	Linux 2.6 kernels that exposes a system's device tree.
diff --git a/package/libtheora/Config.in b/package/libtheora/Config.in
index bf20a50..c17c96c 100644
--- a/package/libtheora/Config.in
+++ b/package/libtheora/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LIBTHEORA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBTHEORA
 	bool "libtheora"
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBVORBIS
+	depends on BR2_PACKAGE_LIBTHEORA_AVAILABLE
 	help
 	  A library for the free and open video compression format "Theora"
 	  from the Xiph.org Foundation.
diff --git a/package/libtool/Config.in b/package/libtool/Config.in
index d3cf2d7..6f6dbeb 100644
--- a/package/libtool/Config.in
+++ b/package/libtool/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBTOOL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBTOOL
 	bool "libtool"
+	depends on BR2_PACKAGE_LIBTOOL_AVAILABLE
 	help
 	  Library that hides the complexity of using shared/static libraries
 	  on different platforms behind a consistent, portable interface.
diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index f0315a4..f26d6cf 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LIBTORRENT_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_LIBTORRENT
 	bool "libtorrent"
-	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBSIGC
+	depends on BR2_PACKAGE_LIBTORRENT_AVAILABLE
 	help
 	  BitTorrent library written in C++ for *nix
 
diff --git a/package/libtpl/Config.in b/package/libtpl/Config.in
index a2c2c2d..901c951 100644
--- a/package/libtpl/Config.in
+++ b/package/libtpl/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBTPL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBTPL
 	bool "libtpl"
+	depends on BR2_PACKAGE_LIBTPL_AVAILABLE
 	help
 	  Easily store and retrieve binary data in C
 
diff --git a/package/libungif/Config.in b/package/libungif/Config.in
index e8c301c..17fc665 100644
--- a/package/libungif/Config.in
+++ b/package/libungif/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBUNGIF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBUNGIF
 	bool "libungif"
+	depends on BR2_PACKAGE_LIBUNGIF_AVAILABLE
 	help
 	  libungif is a library for handling the uncompressed GIF image format.
 
diff --git a/package/libupnp/Config.in b/package/libupnp/Config.in
index 2e6edcd..7919530 100644
--- a/package/libupnp/Config.in
+++ b/package/libupnp/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBUPNP_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_LIBUPNP
 	bool "libupnp"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBUPNP_AVAILABLE
 	help
 	  The portable SDK for UPnP(tm) Devices (libupnp) provides developers
 	  with an API and open source code for building control points,
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 69878b1..013af3a 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBURCU_AVAILABLE
+	def_bool y
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_LIBURCU_AVAILABLE
 	help
 	  Userspace implementation of the Read-Copy-Update (RCU)
 	  synchronization mechanism. This library is mainly used by
diff --git a/package/libusb-compat/Config.in b/package/libusb-compat/Config.in
index f6f49ca..70d8878 100644
--- a/package/libusb-compat/Config.in
+++ b/package/libusb-compat/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBUSB_COMPAT_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LIBUSB
+
 config BR2_PACKAGE_LIBUSB_COMPAT
 	bool "libusb-compat"
-	depends on BR2_PACKAGE_LIBUSB
+	depends on BR2_PACKAGE_LIBUSB_COMPAT_AVAILABLE
 	help
 	  libusb-0.1 compatibility layer for libusb-1.0.
 
diff --git a/package/libusb/Config.in b/package/libusb/Config.in
index 2eed3fa..0842e4d 100644
--- a/package/libusb/Config.in
+++ b/package/libusb/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBUSB_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBUSB
 	bool "libusb"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBUSB_AVAILABLE
 	help
 	  Userspace library for accessing USB devices
 
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 1e5eec6..85fb809 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBV4L_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_LIBV4L
 	bool "libv4l"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBV4L_AVAILABLE
 	help
 	  libv4l is an accompanying collection of libraries that adds a thin
 	  abstraction layer on top of video4linux2 (V4L2) devices.
diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index ff83e34..416f698 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBVNCSERVER_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBVNCSERVER
 	bool "libvncserver"
+	depends on BR2_PACKAGE_LIBVNCSERVER_AVAILABLE
 	help
 	  libvncserver is a VNC server/client library.
 
diff --git a/package/libvorbis/Config.in b/package/libvorbis/Config.in
index e322dd2..dca00da 100644
--- a/package/libvorbis/Config.in
+++ b/package/libvorbis/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBVORBIS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBVORBIS
 	bool "libvorbis"
 	select BR2_PACKAGE_LIBOGG
+	depends on BR2_PACKAGE_LIBVORBIS_AVAILABLE
 	help
 	  Library for the Vorbis open source audio decoder
 	  Ogg Vorbis is a fully open, non-proprietary, patent-and-royalty-free,
diff --git a/package/libxml-parser-perl/Config.in b/package/libxml-parser-perl/Config.in
index e90e50e..a3028b3 100644
--- a/package/libxml-parser-perl/Config.in
+++ b/package/libxml-parser-perl/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_LIBXML_PARSER_PERL_AVAILABLE
+	def_bool y
+       depends on BR2_HOST_ONLY
+
 config BR2_PACKAGE_LIBXML_PARSER_PERL
        bool "libxml-parser-perl"
        select BR2_PACKAGE_EXPAT
        # Hide from configuration as we only support the host package
        # for the moment
-       depends on BR2_HOST_ONLY
+	depends on BR2_PACKAGE_LIBXML_PARSER_PERL_AVAILABLE
        help
          The Perl XML::Parser module.
 
diff --git a/package/libxml2/Config.in b/package/libxml2/Config.in
index ebd63fe..46cdb53 100644
--- a/package/libxml2/Config.in
+++ b/package/libxml2/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBXML2_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBXML2
 	bool "libxml2"
+	depends on BR2_PACKAGE_LIBXML2_AVAILABLE
 	help
 	  XML C Parser
 
diff --git a/package/libxslt/Config.in b/package/libxslt/Config.in
index 1dca1f0..0e3d4b2 100644
--- a/package/libxslt/Config.in
+++ b/package/libxslt/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBXSLT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBXSLT
 	bool "libxslt"
 	select BR2_PACKAGE_LIBXML2
+	depends on BR2_PACKAGE_LIBXSLT_AVAILABLE
 	help
 	  Install the xslt library which is used
 	  to transform XML files to other XML files.
diff --git a/package/libyaml/Config.in b/package/libyaml/Config.in
index 00a48b2..a2265d9 100644
--- a/package/libyaml/Config.in
+++ b/package/libyaml/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBYAML_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBYAML
 	bool "libyaml"
+	depends on BR2_PACKAGE_LIBYAML_AVAILABLE
 	help
 	  LibYAML is a YAML 1.1 parser and emitter written in C.
 
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index cb759ff..1819989 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIGHTTPD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIGHTTPD
 	bool "lighttpd"
+	depends on BR2_PACKAGE_LIGHTTPD_AVAILABLE
 	help
 	  lighttpd a secure, fast, compliant and very flexible web-server
 	  which has been optimized for high-performance environments. It
diff --git a/package/links/Config.in b/package/links/Config.in
index fddf3d2..f67a7f2 100644
--- a/package/links/Config.in
+++ b/package/links/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LINKS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LINKS
 	bool "links"
+	depends on BR2_PACKAGE_LINKS_AVAILABLE
 	help
 	  Graphics and text mode WWW browser (kind of like lynx).
 
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index 1a6cfdb..f641009 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -1,10 +1,14 @@
+config BR2_PACKAGE_LINPHONE_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer
+
 config BR2_PACKAGE_LINPHONE
 	bool "linphone"
 	select BR2_PACKAGE_LIBEXOSIP2
 	select BR2_PACKAGE_SPEEX
 	select BR2_PACKAGE_ORTP
 	select BR2_PACKAGE_MEDIASTREAMER
-	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer
+	depends on BR2_PACKAGE_LINPHONE_AVAILABLE
 	help
 	  Linphone is an internet phone or Voice Over IP phone (VoIP).
 
diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 0c24d98..500d951 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LINUX_FIRMWARE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LINUX_FIRMWARE
 	bool "linux-firmware"
+	depends on BR2_PACKAGE_LINUX_FIRMWARE_AVAILABLE
 	help
 	  This package provides various binary firmware files (closed
 	  binary blobs) for such devices like LAN, WLAN cards etc.
diff --git a/package/linux-fusion/Config.in b/package/linux-fusion/Config.in
index 197e81b..f89116d 100644
--- a/package/linux-fusion/Config.in
+++ b/package/linux-fusion/Config.in
@@ -1,6 +1,10 @@
-config BR2_PACKAGE_LINUX_FUSION
+config BR2_PACKAGE_LINUX_FUSION_AVAILABLE
+	def_bool y
 	depends on BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_LINUX_FUSION
 	bool "linux-fusion communication layer for DirectFB multi"
+	depends on BR2_PACKAGE_LINUX_FUSION_AVAILABLE
 	help
 	  DirectFB Communication Layer allowing multiple DirectFB
 	  applications to run concurrently
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 722b875..e75da43 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -1,10 +1,14 @@
+config BR2_PACKAGE_LINUX_PAM_AVAILABLE
+	def_bool y
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+
 config BR2_PACKAGE_LINUX_PAM
 	bool "linux-pam"
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
-	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+	depends on BR2_PACKAGE_LINUX_PAM_AVAILABLE
 	help
 	  A Security Framework that Provides Authentication for Applications
 
diff --git a/package/lite/Config.in b/package/lite/Config.in
index 8840fe4..679ca93 100644
--- a/package/lite/Config.in
+++ b/package/lite/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LITE_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_DIRECTFB
+
 config BR2_PACKAGE_LITE
 	bool "LiTE (toolbox engine)"
-	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_LITE_AVAILABLE
 	help
 	   LiTE stands for LiTE is a Toolbox Engine. 
 	   Its role is to facilitate the functions of DirectFB so that a
diff --git a/package/live555/Config.in b/package/live555/Config.in
index 610fafc..d1731bf 100644
--- a/package/live555/Config.in
+++ b/package/live555/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIVE555_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_LIVE555
 	bool "live555"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LIVE555_AVAILABLE
 	help
 	  LIVE555 Streaming Media forms a set of C++ libraries for multimedia
 	  streaming, using open standard protocols (RTP/RTCP, RTSP, SIP).
diff --git a/package/lm-sensors/Config.in b/package/lm-sensors/Config.in
index 33c59fd..b32c99a 100644
--- a/package/lm-sensors/Config.in
+++ b/package/lm-sensors/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LM_SENSORS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LM_SENSORS
 	bool "lm-sensors"
+	depends on BR2_PACKAGE_LM_SENSORS_AVAILABLE
 	help
 	  Lm-sensors is a hardware health monitoring package for
 	  Linux. It allows you to access information from
diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index c8423d1..cde05d6 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LMBENCH_AVAILABLE
+	def_bool y
+	depends on BR2_INET_RPC
+
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
 	# Uses pmap_set, pmap__unset, pmap_getport, etc.
-	depends on BR2_INET_RPC
+	depends on BR2_PACKAGE_LMBENCH_AVAILABLE
 	help
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
diff --git a/package/lockfile-progs/Config.in b/package/lockfile-progs/Config.in
index de101a9..ce10a94 100644
--- a/package/lockfile-progs/Config.in
+++ b/package/lockfile-progs/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LOCKFILE_PROGS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LOCKFILE_PROGS
 	bool "lockfile programs"
 	select BR2_PACKAGE_LIBLOCKFILE
+	depends on BR2_PACKAGE_LOCKFILE_PROGS_AVAILABLE
 	help
 	  Build lockfile utility programs.
diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 0d0ec61..0130b0c 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LOGROTATE_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_LOGROTATE
 	bool "logrotate"
 	select BR2_PACKAGE_POPT
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LOGROTATE_AVAILABLE
 	help
 	  A simple program to rotate logs.
 
diff --git a/package/logsurfer/Config.in b/package/logsurfer/Config.in
index 27d1881..cdfe970 100644
--- a/package/logsurfer/Config.in
+++ b/package/logsurfer/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LOGSURFER_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LOGSURFER
 	bool "logsurfer"
+	depends on BR2_PACKAGE_LOGSURFER_AVAILABLE
 	help
 	  Logsurfer is a program for monitoring system logs in real-time,
 	  and reporting on the occurrence of events.
diff --git a/package/lrzsz/Config.in b/package/lrzsz/Config.in
index 70f10cd..c3ce9ac 100644
--- a/package/lrzsz/Config.in
+++ b/package/lrzsz/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LRZSZ_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LRZSZ
 	bool "lrzsz"
+	depends on BR2_PACKAGE_LRZSZ_AVAILABLE
 	help
 	  Portable and fast implementation of the X/Y/Zmodem protocols.
 
diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 4960ac9..20d97a9 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -1,8 +1,12 @@
-config BR2_PACKAGE_LSHW
-	bool "lshw"
+config BR2_PACKAGE_LSHW_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+
+config BR2_PACKAGE_LSHW
+	bool "lshw"
+	depends on BR2_PACKAGE_LSHW_AVAILABLE
 	help
 	  lshw (Hardware Lister) is a small tool to provide
 	  detailed information on the hardware configuration of the machine.
diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index cc7512c..6be0d89 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LSOF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LSOF
 	bool "lsof"
+	depends on BR2_PACKAGE_LSOF_AVAILABLE
 	help
 	  lsof (LiSt Open Files)
 	  The lsof tool lists information about files opened by
diff --git a/package/lsuio/Config.in b/package/lsuio/Config.in
index 675a318..33457aa 100644
--- a/package/lsuio/Config.in
+++ b/package/lsuio/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LSUIO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LSUIO
 	bool "lsuio"
+	depends on BR2_PACKAGE_LSUIO_AVAILABLE
 	help
 	  list available userspace I/O (UIO) devices
 
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 86aa4fb..b56e707 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LTP_TESTSUITE_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LTP_TESTSUITE_AVAILABLE
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 9e71d82..c3f9714 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_LTRACE_AVAILABLE
+	def_bool y
+	depends on !(BR2_avr32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64 || BR2_xtensa)
+
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
-	depends on !(BR2_avr32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64 || BR2_xtensa)
 	select BR2_PACKAGE_LIBELF
+	depends on BR2_PACKAGE_LTRACE_AVAILABLE
 	help
 	  Debugging program which runs a specified command until it exits.
 	  While the command is executing, ltrace intercepts and records
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 6f47304..a2a5dcd 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -1,14 +1,18 @@
+config BR2_PACKAGE_LTTNG_BABELTRACE_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LTTNG_TOOLS
+	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_LTTNG_BABELTRACE
 	bool "lttng-babeltrace"
-	depends on BR2_PACKAGE_LTTNG_TOOLS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
 	# libglib2 needs gettext which needs wchar support, and we
 	# also depends on util-linux which needs wchar
-	depends on BR2_USE_WCHAR
 	# util-linux depends on largefile support
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LTTNG_BABELTRACE_AVAILABLE
 	help
 	  Babeltrace is part of the LTTng 2.x project.
 
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index ab12963..f22c75e 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -1,13 +1,17 @@
+config BR2_PACKAGE_LTTNG_LIBUST_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+
 config BR2_PACKAGE_LTTNG_LIBUST
 	bool "lttng-libust"
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	# util-linux needs wchar and largefile
-	depends on BR2_USE_WCHAR
-	depends on BR2_LARGEFILE
 	# liburcu only works on some architectures
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_LTTNG_LIBUST_AVAILABLE
 	help
 	  Userspace tracing library for the Lttng tracing
 	  infrastructure. It allows userspace programs to create
diff --git a/package/lttng-modules/Config.in b/package/lttng-modules/Config.in
index 2a0f938..973aec0 100644
--- a/package/lttng-modules/Config.in
+++ b/package/lttng-modules/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LTTNG_MODULES_AVAILABLE
+	def_bool y
+	depends on BR2_LINUX_KERNEL
+
 config BR2_PACKAGE_LTTNG_MODULES
 	bool "lttng-modules"
-	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_LTTNG_MODULES_AVAILABLE
 	help
 	  Kernel modules for the LTTng 2.0 kernel tracing
 	  infrastructure.
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index b854757..03d38b7 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -1,10 +1,14 @@
+config BR2_PACKAGE_LTTNG_TOOLS_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LTTNG_MODULES
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+
 config BR2_PACKAGE_LTTNG_TOOLS
 	bool "lttng-tools"
-	depends on BR2_PACKAGE_LTTNG_MODULES
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_POPT
 	# liburcu only works on some architectures
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_LTTNG_TOOLS_AVAILABLE
 	help
 	  Userspace utilities for the LTTng 2.0 tracing
 	  infrastructure.
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 76359c0..a38ba57 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LUA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LUA
 	bool "lua"
+	depends on BR2_PACKAGE_LUA_AVAILABLE
 	help
 	  Lua is a powerful, fast, light-weight, embeddable scripting language.
 
diff --git a/package/luacjson/Config.in b/package/luacjson/Config.in
index 8a5624f..f2fd2c2 100644
--- a/package/luacjson/Config.in
+++ b/package/luacjson/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LUACJSON_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LUACJSON
 	bool "luacjson"
+	depends on BR2_PACKAGE_LUACJSON_AVAILABLE
 	help
 	  The Lua CJSON module provides JSON support for Lua. It features:
 	  - Fast, standards compliant encoding/parsing routines
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index 186c5c9..4e893d3 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LUAEXPAT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
 	select BR2_PACKAGE_EXPAT
+	depends on BR2_PACKAGE_LUAEXPAT_AVAILABLE
 	help
 	  LuaExpat is a SAX XML parser based on the Expat library.
 
diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
index 7c130f8..a40ff70 100644
--- a/package/luafilesystem/Config.in
+++ b/package/luafilesystem/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LUAFILESYSTEM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LUAFILESYSTEM
 	bool "luafilesystem"
+	depends on BR2_PACKAGE_LUAFILESYSTEM_AVAILABLE
 	help
 	  LuaFileSystem offers a portable way to access
 	  the underlying directory structure and file attributes.
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 23b2650..82adcb2 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_LUAJIT_AVAILABLE
+	def_bool y
+	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb
+
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
-	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb
+	depends on BR2_PACKAGE_LUAJIT_AVAILABLE
 	help
 	  LuaJIT implements the full set of language features defined
 	  by Lua 5.1. The virtual machine (VM) is API- and
diff --git a/package/luasocket/Config.in b/package/luasocket/Config.in
index 4526303..ffa1efc 100644
--- a/package/luasocket/Config.in
+++ b/package/luasocket/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LUASOCKET_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LUASOCKET
 	bool "luasocket"
+	depends on BR2_PACKAGE_LUASOCKET_AVAILABLE
 	help
 	  LuaSocket is the most comprehensive networking support library
 	  for the Lua language.
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 30af14e..3012e2f 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LVM2_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_LVM2
 	bool "lvm2 & device mapper"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LVM2_AVAILABLE
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and disk
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
index 2b94dde..aa4aff3 100644
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -1,7 +1,11 @@
-config BR2_PACKAGE_LZMA
-	bool "lzma"
+config BR2_PACKAGE_LZMA_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_DEPRECATED
+
+config BR2_PACKAGE_LZMA
+	bool "lzma"
+	depends on BR2_PACKAGE_LZMA_AVAILABLE
 	help
 	  Lempel Ziv compression method (LZMA) is a compression
 	  algorithm with high compression ratio.
diff --git a/package/lzo/Config.in b/package/lzo/Config.in
index 1b6f80b..47e2d68 100644
--- a/package/lzo/Config.in
+++ b/package/lzo/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LZO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LZO
 	bool "lzo"
+	depends on BR2_PACKAGE_LZO_AVAILABLE
 	help
 	  Portable lossless data compression library written in ANSI C.
 
diff --git a/package/lzop/Config.in b/package/lzop/Config.in
index c911823..43136d5 100644
--- a/package/lzop/Config.in
+++ b/package/lzop/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LZOP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LZOP
 	bool "lzop"
 	select BR2_PACKAGE_LZO
+	depends on BR2_PACKAGE_LZOP_AVAILABLE
 	help
 	  lzop is a file compressor which is very similar to gzip.
 	  lzop uses the LZO data compression library for compression services.
diff --git a/package/m4/Config.in b/package/m4/Config.in
index dee2d83..6de461c 100644
--- a/package/m4/Config.in
+++ b/package/m4/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_M4_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_M4
 	bool "m4"
-	depends on BR2_USE_WCHAR
 	# uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_M4_AVAILABLE
 	help
 	  An implementation of the traditional Unix macro processor.
 
diff --git a/package/make/Config.in b/package/make/Config.in
index 364bb1e..3583ae1 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_MAKE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MAKE
 	bool "make"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on BR2_PACKAGE_MAKE_AVAILABLE
 	help
 	  A tool which controls the generation of executables and other
 	  non-source files of a program from the program's source files.
diff --git a/package/makedevs/Config.in b/package/makedevs/Config.in
index 4f8c38d..c415893 100644
--- a/package/makedevs/Config.in
+++ b/package/makedevs/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MAKEDEVS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MAKEDEVS
        bool "makedevs"
+	depends on BR2_PACKAGE_MAKEDEVS_AVAILABLE
        help
          The makedevs utility allows to create a set of device files
-         according to a configuration file.
\ No newline at end of file
+         according to a configuration file.
diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index e4b6149..006211e 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,11 +1,15 @@
+config BR2_PACKAGE_MATCHBOX_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_MATCHBOX
 	bool "MatchBox Window Manager"
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	depends on BR2_PACKAGE_MATCHBOX_AVAILABLE
 	help
 	  http://projects.o-hand.com/matchbox
 
diff --git a/package/mdadm/Config.in b/package/mdadm/Config.in
index 6426453..a0869d6 100644
--- a/package/mdadm/Config.in
+++ b/package/mdadm/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MDADM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MDADM
 	bool "mdadm"
+	depends on BR2_PACKAGE_MDADM_AVAILABLE
 	help
 	  Utility for managing RAID hardware.
 
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index 2e1af93..c20e056 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_MEDIASTREAMER_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP # until fixed
+
 config BR2_PACKAGE_MEDIASTREAMER
 	bool "mediastreamer"
 	select BR2_PACKAGE_ORTP
-	depends on BR2_INSTALL_LIBSTDCPP # until fixed
+	depends on BR2_PACKAGE_MEDIASTREAMER_AVAILABLE
 	help
 	  Mediastreamer is a powerful and lightweighted streaming
 	  engine specialized for voice/video telephony applications.
diff --git a/package/memstat/Config.in b/package/memstat/Config.in
index ca34ea3..085a373 100644
--- a/package/memstat/Config.in
+++ b/package/memstat/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MEMSTAT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MEMSTAT
 	bool "memstat"
+	depends on BR2_PACKAGE_MEMSTAT_AVAILABLE
 	help
 	  Memstat lists all the processes, executables, and shared
 	  libraries that are using up virtual memory. It's helpful to
diff --git a/package/memtester/Config.in b/package/memtester/Config.in
index 82769f5..86c06ea 100644
--- a/package/memtester/Config.in
+++ b/package/memtester/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_MEMTESTER_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_MEMTESTER
 	bool "memtester"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_MEMTESTER_AVAILABLE
 	help
 	  A userspace utility for testing the memory subsystem for faults.
 
diff --git a/package/metacity/Config.in b/package/metacity/Config.in
index c483c44..75ed570 100644
--- a/package/metacity/Config.in
+++ b/package/metacity/Config.in
@@ -1,6 +1,10 @@
-config BR2_PACKAGE_METACITY
-	bool "metacity"
+config BR2_PACKAGE_METACITY_AVAILABLE
+	def_bool y
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_METACITY
+	bool "metacity"
+	depends on BR2_PACKAGE_METACITY_AVAILABLE
 	help
 	  Metacity is a window manager for the X Window System.
diff --git a/package/microperl/Config.in b/package/microperl/Config.in
index 66bbedd..21b3d83 100644
--- a/package/microperl/Config.in
+++ b/package/microperl/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_MICROPERL_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_MICROPERL
 	bool "microperl"
 	# needs fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_MICROPERL_AVAILABLE
 	help
 	  Perl without operating-specific functions such as readdir.
 
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 49867e4..c2d1b59 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,3 +1,9 @@
+config BR2_PACKAGE_MIDORI_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_INSTALL_LIBSTDCPP # webkit
+	depends on BR2_USE_WCHAR	 # webkit
+
 config BR2_PACKAGE_MIDORI
 	bool "midori"
 	select BR2_PACKAGE_WEBKIT
@@ -5,9 +11,7 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_INSTALL_LIBSTDCPP # webkit
-	depends on BR2_USE_WCHAR	 # webkit
+	depends on BR2_PACKAGE_MIDORI_AVAILABLE
 	help
 	  Midori is a lightweight web browser based on WebKit
 
diff --git a/package/mii-diag/Config.in b/package/mii-diag/Config.in
index ca48ba2..3b3d264 100644
--- a/package/mii-diag/Config.in
+++ b/package/mii-diag/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MII_DIAG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MII_DIAG
 	bool "mii-diag"
+	depends on BR2_PACKAGE_MII_DIAG_AVAILABLE
 	help
 	  mii-diag allows you to manipulate the MII registers of
 	  network cards.
diff --git a/package/minicom/Config.in b/package/minicom/Config.in
index a8a2635..76c1391 100644
--- a/package/minicom/Config.in
+++ b/package/minicom/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_MINICOM_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_MINICOM
 	bool "minicom"
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_MINICOM_AVAILABLE
 	help
 	  Minicom is a menu driven communications program.
 	  It emulates ANSI and VT102 terminals. It has a
diff --git a/package/mobile-broadband-provider-info/Config.in b/package/mobile-broadband-provider-info/Config.in
index dda7105..f4e1900 100644
--- a/package/mobile-broadband-provider-info/Config.in
+++ b/package/mobile-broadband-provider-info/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
 	bool "mobile-broadband-provider-info"
+	depends on BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO_AVAILABLE
 	help
 	  Mobile broadband provider database.
 
diff --git a/package/module-init-tools/Config.in b/package/module-init-tools/Config.in
index 77e3bce..1a67917 100644
--- a/package/module-init-tools/Config.in
+++ b/package/module-init-tools/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MODULE_INIT_TOOLS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MODULE_INIT_TOOLS
 	bool "module-init-tools"
+	depends on BR2_PACKAGE_MODULE_INIT_TOOLS_AVAILABLE
 	help
 	  The module-init-tools package contains a set of programs for
 	  loading, inserting, and removing kernel modules for Linux
diff --git a/package/monit/Config.in b/package/monit/Config.in
index 6933aaf..8d1e3f2 100644
--- a/package/monit/Config.in
+++ b/package/monit/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MONIT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MONIT
 	bool "monit"
+	depends on BR2_PACKAGE_MONIT_AVAILABLE
 	help
 	  Monit is a free open source utility for managing and
 	  monitoring, processes, programs, files, directories and
diff --git a/package/mpc/Config.in b/package/mpc/Config.in
index 8377013..8ec89e6 100644
--- a/package/mpc/Config.in
+++ b/package/mpc/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_MPC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MPC
 	bool "mpc"
 	select BR2_PACKAGE_MPFR
 	select BR2_PACKAGE_GMP
+	depends on BR2_PACKAGE_MPC_AVAILABLE
 	help
 	  Mpc is a C library for the arithmetic of complex numbers with
 	  arbitrarily high precision and correct rounding of the result.
diff --git a/package/mpfr/Config.in b/package/mpfr/Config.in
index 9acb0b4..1df1ffc 100644
--- a/package/mpfr/Config.in
+++ b/package/mpfr/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_MPFR_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MPFR
 	bool "mpfr"
 	default y if BR2_INSTALL_FORTRAN
 	select BR2_PACKAGE_GMP
+	depends on BR2_PACKAGE_MPFR_AVAILABLE
 	help
 	  C library for multiple-precision floating-point computations
 	  with exact rounding.
diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index 1503cc6..3404179 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MROUTED_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MROUTED
 	bool "mrouted"
+	depends on BR2_PACKAGE_MROUTED_AVAILABLE
 	help
 	  An implementation of the DVMRP multicast routing protocol.
 
diff --git a/package/msmtp/Config.in b/package/msmtp/Config.in
index 385ad90..10e5aaf 100644
--- a/package/msmtp/Config.in
+++ b/package/msmtp/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MSMTP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MSMTP
 	bool "msmtp"
+	depends on BR2_PACKAGE_MSMTP_AVAILABLE
 	help
 	  msmtp is an SMTP client. In the default mode, it transmits a
 	  mail to an SMTP server (for example at a free mail provider)
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 7330dd5..599108d 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MTD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MTD
 	bool "mtd/jffs2 utilities"
+	depends on BR2_PACKAGE_MTD_AVAILABLE
 	help
 	  Build mtd/jffs utilities
 
diff --git a/package/mtdev/Config.in b/package/mtdev/Config.in
index 3419903..cc99187 100644
--- a/package/mtdev/Config.in
+++ b/package/mtdev/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MTDEV_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MTDEV
 	bool "mtdev"
+	depends on BR2_PACKAGE_MTDEV_AVAILABLE
 	help
 	  The mtdev is a stand-alone library which transforms all
 	  variants of kernel MT events to the slotted type B protocol.
diff --git a/package/mtdev2tuio/Config.in b/package/mtdev2tuio/Config.in
index 74453c4..b8ccf08 100644
--- a/package/mtdev2tuio/Config.in
+++ b/package/mtdev2tuio/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_MTDEV2TUIO_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # liblo
+
 config BR2_PACKAGE_MTDEV2TUIO
 	bool "mtdev2tuio"
 	select BR2_PACKAGE_LIBLO
 	select BR2_PACKAGE_MTDEV
-	depends on BR2_TOOLCHAIN_HAS_THREADS # liblo
+	depends on BR2_PACKAGE_MTDEV2TUIO_AVAILABLE
 	help
 	  mtdev2tuio is a simple application for converting touch
 	  events captured from libmtdev to TUIO 1.1
diff --git a/package/multimedia/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
index c65e33f..fd21957 100644
--- a/package/multimedia/alsa-utils/Config.in
+++ b/package/multimedia/alsa-utils/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_ALSA_UTILS_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_ALSA_LIB
+	depends on BR2_PACKAGE_ALSA_UTILS_AVAILABLE
 	help
 	  This package contains the command line utilities for the ALSA
 	  project.
diff --git a/package/multimedia/aumix/Config.in b/package/multimedia/aumix/Config.in
index 3d32082..7987915 100644
--- a/package/multimedia/aumix/Config.in
+++ b/package/multimedia/aumix/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_AUMIX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_AUMIX
 	bool "aumix"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_AUMIX_AVAILABLE
 	help
 	  aumix is a small, easy-to-use program to control the mixer
 	  of your sound card. It runs in text mode using the ncurses
diff --git a/package/multimedia/bellagio/Config.in b/package/multimedia/bellagio/Config.in
index 1458f63..30dd085 100644
--- a/package/multimedia/bellagio/Config.in
+++ b/package/multimedia/bellagio/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_BELLAGIO_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_BELLAGIO
 	bool "bellagio"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_BELLAGIO_AVAILABLE
 	help
 	  Bellagio is an opensource implementation of the
 	  OpenMAX IL API.
diff --git a/package/multimedia/faad2/Config.in b/package/multimedia/faad2/Config.in
index 5b7fc1c..c178467 100644
--- a/package/multimedia/faad2/Config.in
+++ b/package/multimedia/faad2/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_FAAD2_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FAAD2
 	bool "faad2"
+	depends on BR2_PACKAGE_FAAD2_AVAILABLE
 	help
 	  FAAD2 is an open source MPEG-4 and MPEG-2 AAC decoder,
 
diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
index d11233e..55d6762 100644
--- a/package/multimedia/ffmpeg/Config.in
+++ b/package/multimedia/ffmpeg/Config.in
@@ -1,10 +1,14 @@
 comment "ffmpeg requires a toolchain with LARGEFILE and IPV6 support"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
 
-menuconfig BR2_PACKAGE_FFMPEG
-	bool "ffmpeg"
+config BR2_PACKAGE_FFMPEG_AVAILABLE
+	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
+
+menuconfig BR2_PACKAGE_FFMPEG
+	bool "ffmpeg"
+	depends on BR2_PACKAGE_FFMPEG_AVAILABLE
 	help
          FFmpeg is a complete, cross-platform solution to record, convert
          and stream audio and video.
diff --git a/package/multimedia/flac/Config.in b/package/multimedia/flac/Config.in
index 357e24f..e53af59 100644
--- a/package/multimedia/flac/Config.in
+++ b/package/multimedia/flac/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_FLAC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_FLAC
 	bool "flac"
+	depends on BR2_PACKAGE_FLAC_AVAILABLE
 	help
           FLAC is an Open Source lossless audio codec.
 
diff --git a/package/multimedia/gst-dsp/Config.in b/package/multimedia/gst-dsp/Config.in
index 590931a..66c542d 100644
--- a/package/multimedia/gst-dsp/Config.in
+++ b/package/multimedia/gst-dsp/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_GST_DSP_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_GSTREAMER && BR2_cortex_a8
+
 config BR2_PACKAGE_GST_DSP
 	bool "gst-dsp"
-	depends on BR2_PACKAGE_GSTREAMER && BR2_cortex_a8
 	select BR2_PACKAGE_TIDSP_BINARIES
+	depends on BR2_PACKAGE_GST_DSP_AVAILABLE
 	help
 	  GStreamer plug-in to access TI OMAP3 DSP algorithms.
 
diff --git a/package/multimedia/gst-ffmpeg/Config.in b/package/multimedia/gst-ffmpeg/Config.in
index 537101e..d5c8537 100644
--- a/package/multimedia/gst-ffmpeg/Config.in
+++ b/package/multimedia/gst-ffmpeg/Config.in
@@ -1,13 +1,17 @@
+config BR2_PACKAGE_GST_FFMPEG_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_GSTREAMER
+	depends on BR2_LARGEFILE
+	depends on BR2_INET_IPV6
+
 config BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
-	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
 	select BR2_PACKAGE_FFMPEG_POSTPROC
 	select BR2_PACKAGE_FFMPEG_SWSCALE
-	depends on BR2_LARGEFILE
-	depends on BR2_INET_IPV6
+	depends on BR2_PACKAGE_GST_FFMPEG_AVAILABLE
 	help
 	  GStreamer plugin using FFmpeg.
 
diff --git a/package/multimedia/gst-omapfb/Config.in b/package/multimedia/gst-omapfb/Config.in
index e603cb1..6d27c2e 100644
--- a/package/multimedia/gst-omapfb/Config.in
+++ b/package/multimedia/gst-omapfb/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_GST_OMAPFB_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_GSTREAMER && BR2_cortex_a8
+
 config BR2_PACKAGE_GST_OMAPFB
 	bool "gst-omapfb"
-	depends on BR2_PACKAGE_GSTREAMER && BR2_cortex_a8
+	depends on BR2_PACKAGE_GST_OMAPFB_AVAILABLE
 	help
 	  GStreamer plug-in to use OMAP framebuffer.
 
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index cb50fbd..d88a432 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_GST_PLUGINS_BAD_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_GSTREAMER
+
 menuconfig BR2_PACKAGE_GST_PLUGINS_BAD
 	bool "gst-plugins-bad"
-	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
+	depends on BR2_PACKAGE_GST_PLUGINS_BAD_AVAILABLE
 	help
 	  A set of plug-ins for GStreamer that may be of poor quality or
 	  lacking some features.
diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 5d82533..4987e1a 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_GST_PLUGINS_BASE_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_GSTREAMER
+
 menuconfig BR2_PACKAGE_GST_PLUGINS_BASE
 	bool "gst-plugins-base"
-	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXV if BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_GST_PLUGINS_BASE_AVAILABLE
 	help
 	  A basic set of well-supported plug-ins for GStreamer.
 
diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 33ecb5c..5feca88 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_GST_PLUGINS_GOOD_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_GSTREAMER
+
 menuconfig BR2_PACKAGE_GST_PLUGINS_GOOD
 	bool "gst-plugins-good"
-	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
+	depends on BR2_PACKAGE_GST_PLUGINS_GOOD_AVAILABLE
 	help
 	  A set of well-supported plug-ins for GStreamer under the preferred
 	  license.
diff --git a/package/multimedia/gst-plugins-ugly/Config.in b/package/multimedia/gst-plugins-ugly/Config.in
index c0046e4..1bbd0e5 100644
--- a/package/multimedia/gst-plugins-ugly/Config.in
+++ b/package/multimedia/gst-plugins-ugly/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_GST_PLUGINS_UGLY_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_GSTREAMER
+
 menuconfig BR2_PACKAGE_GST_PLUGINS_UGLY
 	bool "gst-plugins-ugly"
-	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
+	depends on BR2_PACKAGE_GST_PLUGINS_UGLY_AVAILABLE
 	help
 	  A set of well-supported plug-ins for GStreamer, but might pose
 	  problems for distributors.
diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 4d279b8..bc5507f 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_GSTREAMER_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer"
-	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_GSTREAMER_AVAILABLE
 	help
 	  GStreamer is an open source multimedia framework.
 
diff --git a/package/multimedia/lame/Config.in b/package/multimedia/lame/Config.in
index 2b144a0..c0806a4 100644
--- a/package/multimedia/lame/Config.in
+++ b/package/multimedia/lame/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LAME_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LAME
 	bool "lame"
+	depends on BR2_PACKAGE_LAME_AVAILABLE
 	help
 	  LAME is a high quality MPEG Audio Layer III (MP3) encoder.
 
diff --git a/package/multimedia/madplay/Config.in b/package/multimedia/madplay/Config.in
index a77cc36..92ce1e4 100644
--- a/package/multimedia/madplay/Config.in
+++ b/package/multimedia/madplay/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_MADPLAY_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MADPLAY
 	bool "madplay"
 	select BR2_PACKAGE_LIBMAD
 	select BR2_PACKAGE_LIBID3TAG
+	depends on BR2_PACKAGE_MADPLAY_AVAILABLE
 	help
 	  Command-line front-end to libmad, a high-quality MPEG audio decoder.
 	  It currently supports MPEG-1 and the MPEG-2 extension to lower
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index c7c0cd7..84de844 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -1,10 +1,14 @@
-menuconfig BR2_PACKAGE_MPD
-	bool "mpd"
+config BR2_PACKAGE_MPD_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+
+menuconfig BR2_PACKAGE_MPD
+	bool "mpd"
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
+	depends on BR2_PACKAGE_MPD_AVAILABLE
 	help
 	  MPD is a flexible, powerful, server-side application
 	  for playing music. Through plugins and libraries
diff --git a/package/multimedia/mpg123/Config.in b/package/multimedia/mpg123/Config.in
index 18ac41c..463482e 100644
--- a/package/multimedia/mpg123/Config.in
+++ b/package/multimedia/mpg123/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MPG123_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MPG123
 	bool "mpg123"
+	depends on BR2_PACKAGE_MPG123_AVAILABLE
 	help
 	  Fast, free and portable MPEG audio player for Unix.  It supports
 	  MPEG 1.0/2.0 layers 1, 2 and 3.
diff --git a/package/multimedia/mplayer/Config.in b/package/multimedia/mplayer/Config.in
index a9a4bb6..73defc1 100644
--- a/package/multimedia/mplayer/Config.in
+++ b/package/multimedia/mplayer/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MPLAYER_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
+	depends on BR2_PACKAGE_MPLAYER_AVAILABLE
 	help
 	  MPlayer is a movie player which runs on many systems and supports
 	  many different file formats.
diff --git a/package/multimedia/musepack/Config.in b/package/multimedia/musepack/Config.in
index 2a966a4..15ab2da 100644
--- a/package/multimedia/musepack/Config.in
+++ b/package/multimedia/musepack/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_MUSEPACK_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MUSEPACK
 	bool "musepack"
 	select BR2_PACKAGE_LIBCUEFILE
 	select BR2_PACKAGE_LIBREPLAYGAIN
+	depends on BR2_PACKAGE_MUSEPACK_AVAILABLE
 	help
 	  Musepack is an audio compression format with a strong emphasis
 	  on high quality. It's not lossless, but it is designed
diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
index 6e6d64c..21ee4ea 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -1,11 +1,15 @@
+config BR2_PACKAGE_PULSEAUDIO_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	depends on BR2_PACKAGE_PULSEAUDIO_AVAILABLE
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
diff --git a/package/multimedia/tidsp-binaries/Config.in b/package/multimedia/tidsp-binaries/Config.in
index 48f85a5..f341193 100644
--- a/package/multimedia/tidsp-binaries/Config.in
+++ b/package/multimedia/tidsp-binaries/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_TIDSP_BINARIES_AVAILABLE
+	def_bool y
+	depends on BR2_cortex_a8
+
 config BR2_PACKAGE_TIDSP_BINARIES
 	bool "tidsp-binaries"
-	depends on BR2_cortex_a8
+	depends on BR2_PACKAGE_TIDSP_BINARIES_AVAILABLE
 	help
 	  TI OMAP3 DSP algorithms.
 
diff --git a/package/multimedia/vorbis-tools/Config.in b/package/multimedia/vorbis-tools/Config.in
index 6092e01..4ad76ab 100644
--- a/package/multimedia/vorbis-tools/Config.in
+++ b/package/multimedia/vorbis-tools/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_VORBIS_TOOLS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_VORBIS_TOOLS
 	bool "vorbis-tools"
 	select BR2_PACKAGE_LIBAO
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_LIBCURL
+	depends on BR2_PACKAGE_VORBIS_TOOLS_AVAILABLE
 	help
 	  Standalone player, encoder and decoder for Ogg format files.
 
diff --git a/package/multimedia/wavpack/Config.in b/package/multimedia/wavpack/Config.in
index 1ef3e42..7fe67c5 100644
--- a/package/multimedia/wavpack/Config.in
+++ b/package/multimedia/wavpack/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_WAVPACK_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_WAVPACK
 	bool "wavpack"
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_WAVPACK_AVAILABLE
 	help
 	  WavPack is a completely open audio compression format providing
 	  lossless, high-quality lossy, and a unique hybrid compression mode.
diff --git a/package/mutt/Config.in b/package/mutt/Config.in
index 754979a..03062f6 100644
--- a/package/mutt/Config.in
+++ b/package/mutt/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_MUTT_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_MUTT
 	bool "mutt"
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_MUTT_AVAILABLE
 	help
 	  Mutt is a sophisticated text-based Mail User Agent (MUA)
 
diff --git a/package/mxml/Config.in b/package/mxml/Config.in
index d3202b4..f190f42 100644
--- a/package/mxml/Config.in
+++ b/package/mxml/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MXML_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MXML
 	bool "Mini-XML"
+	depends on BR2_PACKAGE_MXML_AVAILABLE
 	help
 	  Lightweight XML Library
 
diff --git a/package/mysql_client/Config.in b/package/mysql_client/Config.in
index f07fdb4..23b416b 100644
--- a/package/mysql_client/Config.in
+++ b/package/mysql_client/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_MYSQL_CLIENT_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_MYSQL_CLIENT
 	bool "MySQL client"
-	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
+	depends on BR2_PACKAGE_MYSQL_CLIENT_AVAILABLE
 	help
 	  MySQL client
 
diff --git a/package/nano/Config.in b/package/nano/Config.in
index ef7f69d..9db120a 100644
--- a/package/nano/Config.in
+++ b/package/nano/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_NANO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NANO
 	bool "nano"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_NANO_AVAILABLE
 	help
 	  A nice ncurses-based editor. Started out as a clone of pico.
 	  Great editor for new users.
diff --git a/package/nanocom/Config.in b/package/nanocom/Config.in
index 51d628a..d533cf5 100644
--- a/package/nanocom/Config.in
+++ b/package/nanocom/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_NANOCOM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NANOCOM
 	bool "nanocom"
+	depends on BR2_PACKAGE_NANOCOM_AVAILABLE
 	help
 	  Nanocom is based upon microcom (http://microcom.port5.com/) but
 	  removes the scripting and logging features while introducing support
diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index 6e92f93..3be526c 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_NBD_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_NBD
 	bool "nbd"
-	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_NBD_AVAILABLE
 	help
 	  NBD is a set of utilities to configure network block devices,
 	  allowing access to remote block devices over TCP/IP network.
diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index 4aaa62d..2baf0f3 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_NCFTP_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_NCFTP
 	bool "ncftp"
 	# fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_NCFTP_AVAILABLE
 	help
 	  NcFTP Client (also known as just NcFTP) is a set of FREE application
 	  programs implementing the File Transfer Protocol (FTP).
diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index d80f573..be06d2b 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_NCURSES_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NCURSES
 	bool "ncurses"
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 	help
 	  The Ncurses (new curses) library is a free software emulation of
 	  curses in System V Release 4.0, and more.
diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
index 126bfa2..e19dd9d 100644
--- a/package/ndisc6/Config.in
+++ b/package/ndisc6/Config.in
@@ -1,9 +1,13 @@
 comment "ndisc6 requires a toolchain with IPv6 support"
 	depends on !BR2_INET_IPV6
 
+config BR2_PACKAGE_NDISC6_AVAILABLE
+	def_bool y
+	depends on BR2_INET_IPV6
+
 config BR2_PACKAGE_NDISC6
 	bool "ndisc6 tools"
-	depends on BR2_INET_IPV6
+	depends on BR2_PACKAGE_NDISC6_AVAILABLE
 	help
 	  NDisc6 is a small collection of useful tools for IPv6 networking
 
diff --git a/package/neon/Config.in b/package/neon/Config.in
index f972dbb..709112f 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_NEON_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NEON
 	bool "libneon"
+	depends on BR2_PACKAGE_NEON_AVAILABLE
 	help
 	  HTTP and WebDAV client library, with a C interface.
 
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index 26f14c3..b72e0ef 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_NETATALK_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NETATALK
 	bool "netatalk"
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
+	depends on BR2_PACKAGE_NETATALK_AVAILABLE
 	help
 	  Netatalk can be used to turn a *NIX machine into an extremely
 	  high-performance and reliable file server for Macintosh computers.
diff --git a/package/netcat/Config.in b/package/netcat/Config.in
index 54aac76..f95432e 100644
--- a/package/netcat/Config.in
+++ b/package/netcat/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_NETCAT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NETCAT
 	bool "netcat"
+	depends on BR2_PACKAGE_NETCAT_AVAILABLE
 	help
 	  Netcat is a featured networking utility which reads and writes data
 	  across network connections, using the TCP/IP protocol.
diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
index 725e500..09e5494 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_NETKITBASE_AVAILABLE
+	def_bool y
+	depends on BR2_INET_RPC
+
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
-	depends on BR2_INET_RPC
+	depends on BR2_PACKAGE_NETKITBASE_AVAILABLE
 	help
 	  Old-style inetd.
 
diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
index 058d210..e5b98d4 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_NETKITTELNET_AVAILABLE
+	def_bool y
+	depends on BR2_INET_RPC
+
 config BR2_PACKAGE_NETKITTELNET
 	bool "netkittelnet"
-	depends on BR2_INET_RPC
 	select BR2_PACKAGE_NETKITBASE
+	depends on BR2_PACKAGE_NETKITTELNET_AVAILABLE
 	help
 	  Standard Linux telnet client and server.
 
diff --git a/package/netperf/Config.in b/package/netperf/Config.in
index 2f36b1b..928d3cf 100644
--- a/package/netperf/Config.in
+++ b/package/netperf/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_NETPERF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NETPERF
 	bool "netperf"
+	depends on BR2_PACKAGE_NETPERF_AVAILABLE
 	help
 	  Network performance benchmark tool
 
diff --git a/package/netplug/Config.in b/package/netplug/Config.in
index 5c9bca6..8247e4e 100644
--- a/package/netplug/Config.in
+++ b/package/netplug/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_NETPLUG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NETPLUG
 	bool "netplug"
+	depends on BR2_PACKAGE_NETPLUG_AVAILABLE
 	help
 	  A Linux daemon that manages network interfaces in
 	  response to network cables being plugged in and out.
diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 108ab83..987dd73 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_NETSNMP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NETSNMP
 	bool "netsnmp"
+	depends on BR2_PACKAGE_NETSNMP_AVAILABLE
 	help
 	  Suite of applications used to implement SNMP v1, SNMP v2c, and
 	  SNMP v3 using both IPv4 and IPv6.
diff --git a/package/netstat-nat/Config.in b/package/netstat-nat/Config.in
index 6afcf89..f84cfee 100644
--- a/package/netstat-nat/Config.in
+++ b/package/netstat-nat/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_NETSTAT_NAT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NETSTAT_NAT
 	bool "netstat-nat"
+	depends on BR2_PACKAGE_NETSTAT_NAT_AVAILABLE
 	help
 	  Displays NAT connections
 
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 3f01fef..254458e 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,11 +1,14 @@
-config BR2_PACKAGE_NETWORK_MANAGER
-	bool "NetworkManager"
+config BR2_PACKAGE_NETWORK_MANAGER_AVAILABLE
+	def_bool y
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	select BR2_PACKAGE_DBUS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+
+config BR2_PACKAGE_NETWORK_MANAGER
+	bool "NetworkManager"
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
@@ -15,6 +18,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_WIRELESS_TOOLS
 	select BR2_PACKAGE_WIRELESS_TOOLS_LIB
+	depends on BR2_PACKAGE_NETWORK_MANAGER_AVAILABLE
 	help
 	  NetworkManager is a set of co-operative tools that make networking
 	  simple and straightforward. Whether WiFi, wired, 3G, or Bluetooth,
diff --git a/package/newt/Config.in b/package/newt/Config.in
index ae6b69c..547911a 100644
--- a/package/newt/Config.in
+++ b/package/newt/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_NEWT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NEWT
 	bool "newt"
 	select BR2_PACKAGE_SLANG
+	depends on BR2_PACKAGE_NEWT_AVAILABLE
 	help
 	  Programming library for color text mode, widget based user interfaces.
 
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 67d25a7..ecb7d05 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,8 +1,12 @@
-config BR2_PACKAGE_NFS_UTILS
-	bool "nfs-utils"
+config BR2_PACKAGE_NFS_UTILS_AVAILABLE
+	def_bool y
 	depends on BR2_INET_RPC
 	depends on BR2_LARGEFILE
+
+config BR2_PACKAGE_NFS_UTILS
+	bool "nfs-utils"
 	select BR2_PACKAGE_PORTMAP
+	depends on BR2_PACKAGE_NFS_UTILS_AVAILABLE
 	help
 	  The NFS Linux kernel server.
 	  Warning: We do not force largefile support on here on purpose.
diff --git a/package/ngircd/Config.in b/package/ngircd/Config.in
index e8fc3d0..720d372 100644
--- a/package/ngircd/Config.in
+++ b/package/ngircd/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_NGIRCD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NGIRCD
 	bool "ngircd"
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_NGIRCD_AVAILABLE
 	help
 	  Next Generation IRC server deamon.
 
diff --git a/package/ngrep/Config.in b/package/ngrep/Config.in
index cd91225..258f7c0 100644
--- a/package/ngrep/Config.in
+++ b/package/ngrep/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_NGREP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NGREP
 	bool "ngrep"
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_PCRE
+	depends on BR2_PACKAGE_NGREP_AVAILABLE
 	help
 	  Network grep.
 
diff --git a/package/noip/Config.in b/package/noip/Config.in
index 02039dd..831c5de 100644
--- a/package/noip/Config.in
+++ b/package/noip/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_NOIP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NOIP
 	bool "noip"
+	depends on BR2_PACKAGE_NOIP_AVAILABLE
 	help
 	  Dynamic DNS update client for no-ip.com
 
diff --git a/package/nss-mdns/Config.in b/package/nss-mdns/Config.in
index 485cfcd..8654bb1 100644
--- a/package/nss-mdns/Config.in
+++ b/package/nss-mdns/Config.in
@@ -1,7 +1,11 @@
-config BR2_PACKAGE_NSS_MDNS
-	bool "nss-mdns"
+config BR2_PACKAGE_NSS_MDNS_AVAILABLE
+	def_bool y
 	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc
 	depends on BR2_PACKAGE_AVAHI_DAEMON
+
+config BR2_PACKAGE_NSS_MDNS
+	bool "nss-mdns"
+	depends on BR2_PACKAGE_NSS_MDNS_AVAILABLE
 	help
 	  nss-mdns is a plugin for the GNU Name Service Switch (NSS)
 	  functionality of the GNU C Library (glibc) providing host
diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index 5301038..20883b8 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -1,7 +1,11 @@
-config BR2_PACKAGE_NTFS_3G
-	bool "ntfs-3g"
+config BR2_PACKAGE_NTFS_3G_AVAILABLE
+	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+
+config BR2_PACKAGE_NTFS_3G
+	bool "ntfs-3g"
+	depends on BR2_PACKAGE_NTFS_3G_AVAILABLE
 	help
 	  The NTFS-3G driver is an open source, freely available
 	  read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD,
diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 5996596..5fe10a4 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_NTP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NTP
 	bool "ntp"
+	depends on BR2_PACKAGE_NTP_AVAILABLE
 	help
 	  Network Time Protocol suite/programs.
 	  Provides things like ntpd, ntpdate, ntpq, etc...
diff --git a/package/nuttcp/Config.in b/package/nuttcp/Config.in
index fb6d3b1..41f3fb6 100644
--- a/package/nuttcp/Config.in
+++ b/package/nuttcp/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_NUTTCP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_NUTTCP
 	bool "nuttcp"
+	depends on BR2_PACKAGE_NUTTCP_AVAILABLE
 	help
 	  nuttcp is a TCP/UDP network testing tool, much like iperf
 
diff --git a/package/ocf-linux/Config.in b/package/ocf-linux/Config.in
index 9dc5766..f59360e 100644
--- a/package/ocf-linux/Config.in
+++ b/package/ocf-linux/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_OCF_LINUX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_OCF_LINUX
 	bool "ocf-linux"
+	depends on BR2_PACKAGE_OCF_LINUX_AVAILABLE
 	help
 	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
 	  Framework (OCF). This port aims to bring full asynchronous HW/SW
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 74c8b53..55e0607 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -1,11 +1,15 @@
-config BR2_PACKAGE_OFONO
-	bool "ofono"
+config BR2_PACKAGE_OFONO_AVAILABLE
+	def_bool y
 	depends on BR2_USE_WCHAR # gettext/libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+
+config BR2_PACKAGE_OFONO
+	bool "ofono"
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
+	depends on BR2_PACKAGE_OFONO_AVAILABLE
 	help
 	  oFono is a free, open source project for mobile telephony
 	  (GSM/UMTS) applications. It uses high-level D-Bus API for
diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index ada82b4..672053c 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_OLSR_AVAILABLE
+	def_bool y
+	depends on BR2_INET_IPV6
+
 config BR2_PACKAGE_OLSR
 	bool "OLSR mesh networking Daemon"
-	depends on BR2_INET_IPV6
+	depends on BR2_PACKAGE_OLSR_AVAILABLE
 	help
 	  The Optimized Link State Routing protocol (OLSR) is a
 	  routing protocol that is optimised for mobile ad-hoc
diff --git a/package/open2300/Config.in b/package/open2300/Config.in
index df0a969..1735dea 100644
--- a/package/open2300/Config.in
+++ b/package/open2300/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_OPEN2300_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_OPEN2300
 	bool "open2300"
+	depends on BR2_PACKAGE_OPEN2300_AVAILABLE
 	help
 	  open2300 reads (and writes) data from a Lacrosse
 	  WS2300/WS2305/WS2310/WS2315 Weather Station
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 3e9ead6..d0f953f 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_OPENCV_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+
 menuconfig BR2_PACKAGE_OPENCV
 	bool "opencv"
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_OPENCV_AVAILABLE
 	help
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 4dd9a29..d4bf9fc 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_OPENNTPD_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_OPENNTPD
 	bool "openntpd"
 	# fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_OPENNTPD_AVAILABLE
 	help
 	  OpenNTPD is an easy to use implementation of the Network Time
 	  Protocol. It provides the ability to sync the local clock
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 4ea66a5..b53535d 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_OPENOCD_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+
 config BR2_PACKAGE_OPENOCD
 	bool "openocd"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_PACKAGE_OPENOCD_AVAILABLE
 	help
 	  OpenOCD - Open On-Chip Debugger
 
diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 0c3d993..de3b1e1 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_OPENSSH_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_OPENSSH_AVAILABLE
 	help
 	  A free version of the SSH protocol suite of network connectivity
 	  tools.  The standard 'ssh', 'sshd', 'scp', and friends.
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 6ba644a..0382826 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_OPENSSL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_OPENSSL
 	bool "openssl"
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
 	help
 	  A collaborative effort to develop a robust, commercial-grade, fully
 	  featured, and Open Source toolkit implementing the Secure Sockets
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 3336156..7d09454 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_OPENSWAN_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
+	depends on BR2_PACKAGE_OPENSWAN_AVAILABLE
 	help
 	  Openswan is an implementation of IPsec for Linux
 
diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 9f9057d..e9f2bc5 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_OPENVPN_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
+	depends on BR2_PACKAGE_OPENVPN_AVAILABLE
  	help
 	  OpenVPN is a full-featured SSL VPN solution which can
 	  accomodate a wide range of configurations, including road
diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index eb997a7..e0db91a 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_OPKG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_OPKG
 	bool "opkg"
+	depends on BR2_PACKAGE_OPKG_AVAILABLE
 	help
 	  Opkg is a lightweight package management system, based on ipkg. It is
 	  written in C and resembles apt/dpkg in operation. It is intended for
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 562c910..9525eec 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_OPROFILE_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_OPROFILE_AVAILABLE
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
diff --git a/package/orc/Config.in b/package/orc/Config.in
index 1de0f23..2a3b25f 100644
--- a/package/orc/Config.in
+++ b/package/orc/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_ORC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_ORC
 	bool "orc"
+	depends on BR2_PACKAGE_ORC_AVAILABLE
 	help
 	  Orc is a library and set of tools for compiling and executing
 	  very simple programs that operate on arrays of data.
diff --git a/package/ortp/Config.in b/package/ortp/Config.in
index 39d9c9a..916615c 100644
--- a/package/ortp/Config.in
+++ b/package/ortp/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_ORTP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_ORTP
 	bool "oRTP"
+	depends on BR2_PACKAGE_ORTP_AVAILABLE
 	help
 	  oRTP, a Real-time Transport Protocol (RTP,RFC3550) library
 
diff --git a/package/owl-linux/Config.in b/package/owl-linux/Config.in
index f6e18d5..835d3c6 100644
--- a/package/owl-linux/Config.in
+++ b/package/owl-linux/Config.in
@@ -1,8 +1,12 @@
-config BR2_PACKAGE_OWL_LINUX
-	bool "owl-linux"
+config BR2_PACKAGE_OWL_LINUX_AVAILABLE
+	def_bool y
 	depends on BR2_LINUX_KERNEL
 	depends on (BR2_arm920t || BR2_arm922t || BR2_arm926t)
 	depends on BR2_ARM_EABI
+
+config BR2_PACKAGE_OWL_LINUX
+	bool "owl-linux"
+	depends on BR2_PACKAGE_OWL_LINUX_AVAILABLE
 	help
 	  Linux kernel driver for the H&D Wireless SPB104 SD-card WiFi SIP.
 
diff --git a/package/pango/Config.in b/package/pango/Config.in
index 923c3d4..c064f91 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -1,12 +1,16 @@
-config BR2_PACKAGE_PANGO
-	bool "pango"
+config BR2_PACKAGE_PANGO_AVAILABLE
+	def_bool y
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
+
+config BR2_PACKAGE_PANGO
+	bool "pango"
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on BR2_PACKAGE_PANGO_AVAILABLE
 	help
 	  Pango is a library for laying out and rendering of text, with an
 	  emphasis on internationalization. Pango can be used anywhere that
diff --git a/package/parted/Config.in b/package/parted/Config.in
index 7349763..a5f8422 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -1,11 +1,15 @@
-config BR2_PACKAGE_PARTED
-	bool "parted"
+config BR2_PACKAGE_PARTED_AVAILABLE
+	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+
+config BR2_PACKAGE_PARTED
+	bool "parted"
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	depends on BR2_PACKAGE_PARTED_AVAILABLE
 	help
 	  parted, the GNU partition resizing program
 
diff --git a/package/patch/Config.in b/package/patch/Config.in
index dd6d51c..060fcfd 100644
--- a/package/patch/Config.in
+++ b/package/patch/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_PATCH_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_PATCH
 	bool "patch"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_PATCH_AVAILABLE
 	help
 	  Take patch files (containing difference listings) and apply them
 	  to original files, producing patched versions.
diff --git a/package/pciutils/Config.in b/package/pciutils/Config.in
index a082f23..4e2e9fc 100644
--- a/package/pciutils/Config.in
+++ b/package/pciutils/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_PCIUTILS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PCIUTILS
 	bool "pciutils"
+	depends on BR2_PACKAGE_PCIUTILS_AVAILABLE
 	help
 	  Various utilities dealing with the PCI bus.
 	  Provides things like setpci and lspci.
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index c8b4deb..f9d203b 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -1,10 +1,14 @@
-config BR2_PACKAGE_PCMANFM
-	bool "pcmanfm"
+config BR2_PACKAGE_PCMANFM_AVAILABLE
+	def_bool y
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGTK2
+
+config BR2_PACKAGE_PCMANFM
+	bool "pcmanfm"
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_PCMANFM_AVAILABLE
 	help
 	  An extremly fast and lightweight file manager which features
 	  tabbed browsing and user-friendly interface.
diff --git a/package/pcre/Config.in b/package/pcre/Config.in
index a4e2547..8130d31 100644
--- a/package/pcre/Config.in
+++ b/package/pcre/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_PCRE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PCRE
 	bool "pcre"
+	depends on BR2_PACKAGE_PCRE_AVAILABLE
 	help
 	  Perl Compatible Regular Expressions
 
diff --git a/package/php/Config.in b/package/php/Config.in
index c8c100c..af12c5c 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_PHP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PHP
 	bool "php"
+	depends on BR2_PACKAGE_PHP_AVAILABLE
 	help
 	  PHP  is a widely-used general-purpose scripting
 	  language that is especially suited for Web development
diff --git a/package/picocom/Config.in b/package/picocom/Config.in
index bd584e2..b0009b4 100644
--- a/package/picocom/Config.in
+++ b/package/picocom/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_PICOCOM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PICOCOM
 	bool "picocom"
+	depends on BR2_PACKAGE_PICOCOM_AVAILABLE
 	help
 	  picocom is a minimal dumb-terminal emulation program. It
 	  is, in principle, very much like minicom, only it's pico
diff --git a/package/pixman/Config.in b/package/pixman/Config.in
index aa2a68f..6b3b57d 100644
--- a/package/pixman/Config.in
+++ b/package/pixman/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_PIXMAN_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PIXMAN
 	bool "pixman"
+	depends on BR2_PACKAGE_PIXMAN_AVAILABLE
 	help
 	  Cairo pixel manager
 
diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
index eae0a21..a7edcfc 100644
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_PKG_CONFIG_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_PKG_CONFIG
 	bool "pkg-config"
-	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_PKG_CONFIG_AVAILABLE
 	help
 	  pkg-config is a system for managing library compile/link
 	  flags that works with automake and autoconf. It replaces
diff --git a/package/poco/Config.in b/package/poco/Config.in
index 36d8de9..449fa93 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -1,9 +1,13 @@
-config BR2_PACKAGE_POCO
-	bool "poco"
+config BR2_PACKAGE_POCO_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+
+config BR2_PACKAGE_POCO
+	bool "poco"
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
+	depends on BR2_PACKAGE_POCO_AVAILABLE
 	help
 	  The C++ Portable Components Libraries
 
diff --git a/package/polarssl/Config.in b/package/polarssl/Config.in
index 3414a7f..5226f46 100644
--- a/package/polarssl/Config.in
+++ b/package/polarssl/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_POLARSSL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_POLARSSL
 	bool "polarssl"
+	depends on BR2_PACKAGE_POLARSSL_AVAILABLE
 	help
 	  PolarSSL is an SSL library written in ANSI C. PolarSSL makes
 	  it easy for developers to include cryptographic and SSL/TLS
diff --git a/package/popt/Config.in b/package/popt/Config.in
index cbcdc15..ca33ca5 100644
--- a/package/popt/Config.in
+++ b/package/popt/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_POPT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_POPT
 	bool "popt"
+	depends on BR2_PACKAGE_POPT_AVAILABLE
 	help
 	  Popt is a C library for parsing command line parameters.
 
diff --git a/package/portaudio/Config.in b/package/portaudio/Config.in
index f91acc0..4b73301 100644
--- a/package/portaudio/Config.in
+++ b/package/portaudio/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_PORTAUDIO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PORTAUDIO
 	bool "portaudio"
+	depends on BR2_PACKAGE_PORTAUDIO_AVAILABLE
 	help
 	  PortAudio is a free, cross-platform, open-source,
 	  audio I/O library.
diff --git a/package/portmap/Config.in b/package/portmap/Config.in
index 5914357..d1f3c25 100644
--- a/package/portmap/Config.in
+++ b/package/portmap/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_PORTMAP_AVAILABLE
+	def_bool y
+	depends on BR2_INET_RPC
+
 config BR2_PACKAGE_PORTMAP
 	bool "portmap"
-	depends on BR2_INET_RPC
+	depends on BR2_PACKAGE_PORTMAP_AVAILABLE
 	help
 	  The standard portmapper for RPC services.
 
diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 879b263..7686eb0 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_PPPD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PPPD
 	bool "pppd"
+	depends on BR2_PACKAGE_PPPD_AVAILABLE
 	help
 	  An implementation of the Point-to-point protocol.
 
diff --git a/package/pptp-linux/Config.in b/package/pptp-linux/Config.in
index 165f79b..13ae2a5 100644
--- a/package/pptp-linux/Config.in
+++ b/package/pptp-linux/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_PPTP_LINUX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PPTP_LINUX
 	bool "pptp-linux"
+	depends on BR2_PACKAGE_PPTP_LINUX_AVAILABLE
 	help
 	  An implementation of the Point-to-point protocol client.
 
diff --git a/package/procps/Config.in b/package/procps/Config.in
index 48baf7b..0af3bdf 100644
--- a/package/procps/Config.in
+++ b/package/procps/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_PROCPS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PROCPS
 	bool "procps"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_PROCPS_AVAILABLE
 	help
 	  Standard informational utilities and process-handling tools.
 	  Provides things like kill, ps, uptime, free, top, etc...
diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index abdedc9..e423518 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_PROFTPD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PROFTPD
 	bool "proftpd"
+	depends on BR2_PACKAGE_PROFTPD_AVAILABLE
 	help
 	  ProFTPD, a highly configurable FTP server.
 
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index b044ef0..a5459d3 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_PROTOBUF_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_PROTOBUF_AVAILABLE
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
 	  extensible mechanism for serializing structured data.
diff --git a/package/psmisc/Config.in b/package/psmisc/Config.in
index a138204..05fe88d 100644
--- a/package/psmisc/Config.in
+++ b/package/psmisc/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_PSMISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PSMISC
 	bool "psmisc"
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on BR2_PACKAGE_PSMISC_AVAILABLE
 	help
 	  Helpful /proc related utilities such as pstree, fuser, and killall
 
diff --git a/package/pv/Config.in b/package/pv/Config.in
index 671f78e..2dd9df1 100644
--- a/package/pv/Config.in
+++ b/package/pv/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_PV_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PV
 	bool "pv"
+	depends on BR2_PACKAGE_PV_AVAILABLE
 	help
 	  Pipe Viewer - is a terminal-based tool for
 	  monitoring the progress of data through a
diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
index aac9f09..4ab9a26 100644
--- a/package/python-dpkt/Config.in
+++ b/package/python-dpkt/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_PYTHON_DPKT_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_PYTHON
+
 config BR2_PACKAGE_PYTHON_DPKT
 	bool "python-dpkt"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_ZLIB
+	depends on BR2_PACKAGE_PYTHON_DPKT_AVAILABLE
 	help
 	  Fast, simple packet creation / parsing, with definitions
 	  for the basic TCP/IP protocols.
diff --git a/package/python-id3/Config.in b/package/python-id3/Config.in
index 829a657..807be1b 100644
--- a/package/python-id3/Config.in
+++ b/package/python-id3/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_PYTHON_ID3_AVAILABLE
+	def_bool y
+    depends on BR2_PACKAGE_PYTHON
+
 config BR2_PACKAGE_PYTHON_ID3
     bool "python-id3"
-    depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_ID3_AVAILABLE
     help
       This module allows one to read and manipulate so-called ID3
       informational tags on MP3 files through an object-oriented
diff --git a/package/python-mad/Config.in b/package/python-mad/Config.in
index 2535421..f6d884b 100644
--- a/package/python-mad/Config.in
+++ b/package/python-mad/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_PYTHON_MAD_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_PYTHON
+
 config BR2_PACKAGE_PYTHON_MAD
 	bool "python-mad"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_LIBMAD
+	depends on BR2_PACKAGE_PYTHON_MAD_AVAILABLE
 	help
 	  python-mad is a Python binding for the MAD library, a
 	  high-quality integer-only MPEG decoder.
diff --git a/package/python-meld3/Config.in b/package/python-meld3/Config.in
index 8dee723..f4b04fc 100644
--- a/package/python-meld3/Config.in
+++ b/package/python-meld3/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_PYTHON_MELD3_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_PYTHON
+
 config BR2_PACKAGE_PYTHON_MELD3
 	bool "python-meld3"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_PYEXPAT
+	depends on BR2_PACKAGE_PYTHON_MELD3_AVAILABLE
 	help
 	  A HTML/XML templating system.
 
diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
index b9d66d8..d13d5ec 100644
--- a/package/python-netifaces/Config.in
+++ b/package/python-netifaces/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_PYTHON_NETIFACES_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_PYTHON
+
 config BR2_PACKAGE_PYTHON_NETIFACES
 	bool "python-netifaces"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	depends on BR2_PACKAGE_PYTHON_NETIFACES_AVAILABLE
 	help
 	  Portable access to network interfaces from Python.
 
diff --git a/package/python-nfc/Config.in b/package/python-nfc/Config.in
index c928ba1..3202bc4 100644
--- a/package/python-nfc/Config.in
+++ b/package/python-nfc/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_PYTHON_NFC_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_PYTHON
+
 config BR2_PACKAGE_PYTHON_NFC
 	bool "python-nfc"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_PACKAGE_PYTHON_NFC_AVAILABLE
 	help
 	  Python module for near field communication.
 
diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
index 1b0a8b9..ab51c1c 100644
--- a/package/python-pygame/Config.in
+++ b/package/python-pygame/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_PYTHON_PYGAME_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_PYTHON
+
 config BR2_PACKAGE_PYTHON_PYGAME
 	bool "pygame"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_SDL
+	depends on BR2_PACKAGE_PYTHON_PYGAME_AVAILABLE
 	help
 	  Pygame is a cross-platfrom library designed to make it easy to write
 	  multimedia software, such as games, in Python. Pygame requires the
diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
index ea090bd..7475367 100644
--- a/package/python-serial/Config.in
+++ b/package/python-serial/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_PYTHON_SERIAL_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_PYTHON
+
 config BR2_PACKAGE_PYTHON_SERIAL
 	bool "python-serial"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_SERIAL_AVAILABLE
 	help
 	  python-serial is a Python library to access serial ports.
 
diff --git a/package/python-setuptools/Config.in b/package/python-setuptools/Config.in
index 63c2b01..f03eb53 100644
--- a/package/python-setuptools/Config.in
+++ b/package/python-setuptools/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_PYTHON_SETUPTOOLS_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_PYTHON
+
 config BR2_PACKAGE_PYTHON_SETUPTOOLS
 	bool "python-setuptools"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_ZLIB
+	depends on BR2_PACKAGE_PYTHON_SETUPTOOLS_AVAILABLE
 	help
 	  Download, build, install, upgrade, and uninstall Python packages.
 
diff --git a/package/python/Config.in b/package/python/Config.in
index 11aa267..ebcbef2 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_PYTHON_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_PYTHON
 	bool "python"
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBFFI
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 	help
 	  The python language interpreter.
 
diff --git a/package/qt/Config.in b/package/qt/Config.in
index b75f224..737702c 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -1,9 +1,13 @@
 comment "qt requires a toolchain with C++ support enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
+config BR2_PACKAGE_QT_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 menuconfig BR2_PACKAGE_QT
 	bool "Qt"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_QT_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 0834201..8933fe7 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_QUAGGA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_QUAGGA
 	bool "quagga"
+	depends on BR2_PACKAGE_QUAGGA_AVAILABLE
 	help
 	  Routing software suite, providing implementations of
 	  OSPFv2, OSPFv3 (IPv6), RIP v1 and v2, RIPng (IPv6) and BGPv4+.
diff --git a/package/quota/Config.in b/package/quota/Config.in
index 6c2beff..8a41b4d 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -1,12 +1,16 @@
-config BR2_PACKAGE_QUOTA
-	bool "quota"
+config BR2_PACKAGE_QUOTA_AVAILABLE
+	def_bool y
 	depends on BR2_INET_RPC
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+
+config BR2_PACKAGE_QUOTA
+	bool "quota"
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on BR2_PACKAGE_QUOTA_AVAILABLE
 	help
 	  Implementation of the disk quota system.
 
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index 90c1fd4..bfcb1f5 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_RADVD_AVAILABLE
+	def_bool y
+	depends on BR2_INET_IPV6
+
 config BR2_PACKAGE_RADVD
 	bool "radvd"
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
 	select BR2_PACKAGE_LIBDAEMON
-	depends on BR2_INET_IPV6
+	depends on BR2_PACKAGE_RADVD_AVAILABLE
 	help
 	  IPv6 Router Advertisement Daemon.
 
diff --git a/package/ramspeed/Config.in b/package/ramspeed/Config.in
index b236329..61d84a2 100644
--- a/package/ramspeed/Config.in
+++ b/package/ramspeed/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_RAMSPEED_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_RAMSPEED
 	bool "ramspeed"
+	depends on BR2_PACKAGE_RAMSPEED_AVAILABLE
 	help
 	  RAMspeed is a free open source command line utility
 	  to measure cache and memory performance.
diff --git a/package/rdesktop/Config.in b/package/rdesktop/Config.in
index c0abe27..e82e4cc 100644
--- a/package/rdesktop/Config.in
+++ b/package/rdesktop/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_RDESKTOP_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_RDESKTOP
 	bool "rdesktop"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_RDESKTOP_AVAILABLE
 	help
 	  rdesktop is an open source client for Windows NT Terminal
 	  Server and Windows 2000/2003 Terminal Services, capable of
diff --git a/package/read-edid/Config.in b/package/read-edid/Config.in
index bdcb7a7..985a18b 100644
--- a/package/read-edid/Config.in
+++ b/package/read-edid/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_READ_EDID_AVAILABLE
+	def_bool y
+	depends on BR2_i386
+
 config BR2_PACKAGE_READ_EDID
 	bool "read-edid"
-	depends on BR2_i386
+	depends on BR2_PACKAGE_READ_EDID_AVAILABLE
 	help
 	  Read-edid is a pair of tools for reading the EDID from a
 	  monitor.  It should work with most monitors made since 1996
diff --git a/package/readline/Config.in b/package/readline/Config.in
index 305955a..b46bb2c 100644
--- a/package/readline/Config.in
+++ b/package/readline/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_READLINE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_READLINE
 	bool "readline"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_READLINE_AVAILABLE
 	help
 	    Enable GNU readline support?
diff --git a/package/rings/Config.in b/package/rings/Config.in
index d1f1efe..857f2eb 100644
--- a/package/rings/Config.in
+++ b/package/rings/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_RINGS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_RINGS
 	bool "rings"
+	depends on BR2_PACKAGE_RINGS_AVAILABLE
 	help
 	  Provides a way to create new Lua states from within Lua.
 
diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index e6dcf9d..e6a0112 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_RNG_TOOLS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
 	select BR2_PACKAGE_ARGP_STANDALONE
+	depends on BR2_PACKAGE_RNG_TOOLS_AVAILABLE
 	help
 	  Daemon to use hardware random number generators.
 
diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index 668a443..0f8a412 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_RP_PPPOE_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_PPPD
+
 config BR2_PACKAGE_RP_PPPOE
 	bool "rp-pppoe"
-	depends on BR2_PACKAGE_PPPD
+	depends on BR2_PACKAGE_RP_PPPOE_AVAILABLE
 	help
 	  An implementation of the Point-to-point protocol over Ethernet.
 	  Has userspace client and server deamons.  You likely only need
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 14072c9..f807cec 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -4,16 +4,20 @@ comment "rpm requires a toolchain with thread support"
 comment "rpm requires libneon with SSL, XML and ZLIB support"
 	depends on !BR2_PACKAGE_NEON || BR2_PACKAGE_NEON_NOXML && BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_RPM_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
+	depends on BR2_PACKAGE_NEON
+	depends on !BR2_PACKAGE_NEON_NOXML
+
 config BR2_PACKAGE_RPM
 	bool "rpm"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	select BR2_PACKAGE_BEECRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_OPENSSL
-	depends on BR2_PACKAGE_NEON
-	depends on !BR2_PACKAGE_NEON_NOXML
 	select BR2_PACKAGE_NEON_ZLIB
 	select BR2_PACKAGE_NEON_SSL
+	depends on BR2_PACKAGE_RPM_AVAILABLE
 	help
 	  The RPM package management system.
 
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index d315b57..d52f8e4 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -1,10 +1,14 @@
+config BR2_PACKAGE_RRDTOOL_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_RRDTOOL
 	bool "rrdtool"
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBART
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_RRDTOOL_AVAILABLE
 	help
 	  RRDtool is the OpenSource industry standard, high performance
 	  data logging and graphing system for time series data.
diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index 454bf30..c16830b 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_RSH_REDONE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_RSH_REDONE
 	bool "rsh-redone"
+	depends on BR2_PACKAGE_RSH_REDONE_AVAILABLE
 	help
 	  Rsh-redone is a reimplementation of the remote shell clients and
 	  servers.  It is written from the ground up to avoid the bugs found
diff --git a/package/rsync/Config.in b/package/rsync/Config.in
index be95a7c..a228dd6 100644
--- a/package/rsync/Config.in
+++ b/package/rsync/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_RSYNC_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_RSYNC
 	bool "rsync"
 	# fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_RSYNC_AVAILABLE
 	help
 	  File transfer program to keep remote files in sync.
 
diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 2503f71..eacb52f 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_RSYSLOG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_RSYSLOG
 	bool "rsyslog"
+	depends on BR2_PACKAGE_RSYSLOG_AVAILABLE
 	help
 	  Rsyslog is a powerful and flexible syslog implementation
 
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index e645266..c4a840a 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_RT_TESTS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
+	depends on BR2_PACKAGE_RT_TESTS_AVAILABLE
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
diff --git a/package/rtai/Config.in b/package/rtai/Config.in
index ecbff38..9617b12 100644
--- a/package/rtai/Config.in
+++ b/package/rtai/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_RTAI_AVAILABLE
+	def_bool y
+	depends on BR2_LINUX_KERNEL_EXT_RTAI
+
 config BR2_PACKAGE_RTAI
 	bool "rtai"
-	depends on BR2_LINUX_KERNEL_EXT_RTAI
+	depends on BR2_PACKAGE_RTAI_AVAILABLE
 	help
 	  RTAI - the RealTime Application Interface for Linux.
 
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 142ff8b..4f1a445 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -1,12 +1,16 @@
-config BR2_PACKAGE_RTORRENT
-	bool "rtorrent"
+config BR2_PACKAGE_RTORRENT_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+
+config BR2_PACKAGE_RTORRENT
+	bool "rtorrent"
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBSIGC
 	select BR2_PACKAGE_LIBTORRENT
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_RTORRENT_AVAILABLE
 	help
 	  BitTorrent Client using libtorrent
 
diff --git a/package/ruby/Config.in b/package/ruby/Config.in
index c18d8ad..780c5f7 100644
--- a/package/ruby/Config.in
+++ b/package/ruby/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_RUBY_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_RUBY
 	bool "ruby"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_RUBY_AVAILABLE
 	help
 	  Object Oriented Scripting Language.
 
diff --git a/package/samba/Config.in b/package/samba/Config.in
index 928b40b..036505b 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SAMBA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SAMBA
 	bool "samba"
 	select BR2_PACKAGE_POPT
+	depends on BR2_PACKAGE_SAMBA_AVAILABLE
 	help
 	  Provides print services to all manner of SMB/CIFS clients,
 	  including the numerous versions of Microsoft Windows
diff --git a/package/sane-backends/Config.in b/package/sane-backends/Config.in
index 04222fc..37fe800 100644
--- a/package/sane-backends/Config.in
+++ b/package/sane-backends/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SANE_BACKENDS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SANE_BACKENDS
 	bool "sane-backends"
+	depends on BR2_PACKAGE_SANE_BACKENDS_AVAILABLE
 	help
 	  SANE - Scanner Access Now Easy
 
diff --git a/package/sawman/Config.in b/package/sawman/Config.in
index 8dd3ace..23567dd 100644
--- a/package/sawman/Config.in
+++ b/package/sawman/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SAWMAN_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_DIRECTFB
+
 config BR2_PACKAGE_SAWMAN
 	bool "SawMan (Window Manager)"
-	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_SAWMAN_AVAILABLE
 	help
 	  SaWMan is a new window manager module for use with DirectFB. 
           Its main difference to the default module is that it allows 
diff --git a/package/screen/Config.in b/package/screen/Config.in
index c232392..cc0cc46 100644
--- a/package/screen/Config.in
+++ b/package/screen/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SCREEN_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SCREEN
 	bool "screen"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_SCREEN_AVAILABLE
 	help
 	  Screen is a full-screen window manager that multiplexes a physical
 	  terminal between several processes, typically interactive shells.
diff --git a/package/sdl/Config.in b/package/sdl/Config.in
index 65ac8a2..0ba920f 100644
--- a/package/sdl/Config.in
+++ b/package/sdl/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SDL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SDL
 	bool "SDL"
+	depends on BR2_PACKAGE_SDL_AVAILABLE
 	help
 	  Simple DirectMedia Layer - SDL is a library that allows
 	  programs portable low level access to a video framebuffer,
diff --git a/package/sdl_gfx/Config.in b/package/sdl_gfx/Config.in
index 4910b2d..f75bd09 100644
--- a/package/sdl_gfx/Config.in
+++ b/package/sdl_gfx/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SDL_GFX_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_SDL
+
 config BR2_PACKAGE_SDL_GFX
 	bool "SDL_gfx"
-	depends on BR2_PACKAGE_SDL
+	depends on BR2_PACKAGE_SDL_GFX_AVAILABLE
 	help
 	  The SDL_gfx library is an extension to the SDL library which
 	  provides basic antialiased drawing routines such as lines,
diff --git a/package/sdl_image/Config.in b/package/sdl_image/Config.in
index 36aa4a8..21f67b4 100644
--- a/package/sdl_image/Config.in
+++ b/package/sdl_image/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SDL_IMAGE_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_SDL
+
 config BR2_PACKAGE_SDL_IMAGE
 	bool "SDL_image"
-	depends on BR2_PACKAGE_SDL
+	depends on BR2_PACKAGE_SDL_IMAGE_AVAILABLE
 	help
 	  SDL_image is an image file loading library. It loads images
 	  as SDL surfaces, and supports the following formats:
diff --git a/package/sdl_mixer/Config.in b/package/sdl_mixer/Config.in
index 42dfe63..6e43935 100644
--- a/package/sdl_mixer/Config.in
+++ b/package/sdl_mixer/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SDL_MIXER_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_SDL
+
 config BR2_PACKAGE_SDL_MIXER
 	bool "SDL_mixer"
-	depends on BR2_PACKAGE_SDL
+	depends on BR2_PACKAGE_SDL_MIXER_AVAILABLE
 	help
 	  SDL_mixer is a sample multi-channel audio mixer library.
 	  It supports any number of simultaneously playing channels of
diff --git a/package/sdl_net/Config.in b/package/sdl_net/Config.in
index 2001d23..7f213dd 100644
--- a/package/sdl_net/Config.in
+++ b/package/sdl_net/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SDL_NET_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_SDL
+
 config BR2_PACKAGE_SDL_NET
 	bool "SDL_net"
-	depends on BR2_PACKAGE_SDL
+	depends on BR2_PACKAGE_SDL_NET_AVAILABLE
 	help
 	  SDL_net is a small, low-level, cross-platform network library, that
 	  can be used with the Simple DirectMedia Layer library (SDL).
diff --git a/package/sdl_sound/Config.in b/package/sdl_sound/Config.in
index 542c996..693af1a 100644
--- a/package/sdl_sound/Config.in
+++ b/package/sdl_sound/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_SDL_SOUND_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_SDL
+
 config BR2_PACKAGE_SDL_SOUND
 	bool "SDL_sound"
-	depends on BR2_PACKAGE_SDL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_SDL_SOUND_AVAILABLE
 	help
 	  SDL_sound is a library that handles the decoding of several
 	  popular sound file formats, such as .WAV and .MP3.
diff --git a/package/sdl_ttf/Config.in b/package/sdl_ttf/Config.in
index 9f78b90..606428b 100644
--- a/package/sdl_ttf/Config.in
+++ b/package/sdl_ttf/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_SDL_TTF_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_SDL
+
 config BR2_PACKAGE_SDL_TTF
 	bool "SDL_TTF"
-	depends on BR2_PACKAGE_SDL
 	select BR2_PACKAGE_FREETYPE
+	depends on BR2_PACKAGE_SDL_TTF_AVAILABLE
 	help
 	  SDL_ttf is a sample TrueType font library. It allows you to
 	  use TrueType fonts in your SDL applications.
diff --git a/package/sdparm/Config.in b/package/sdparm/Config.in
index cec0f84..6fd96ac 100644
--- a/package/sdparm/Config.in
+++ b/package/sdparm/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SDPARM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SDPARM
 	bool "sdparm"
+	depends on BR2_PACKAGE_SDPARM_AVAILABLE
 	help
 	  Utility to accesses SCSI device parameters.
 
diff --git a/package/sed/Config.in b/package/sed/Config.in
index 1430915..1813d6f 100644
--- a/package/sed/Config.in
+++ b/package/sed/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SED_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_SED
 	bool "sed"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_SED_AVAILABLE
 	help
 	  Super-useful stream editor.
 
diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 7eb3a6a..3a6ee46 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SER2NET_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SER2NET
 	bool "ser2net"
+	depends on BR2_PACKAGE_SER2NET_AVAILABLE
 	help
 	  Ser2net provides a way for a user to connect from a network
 	  connection to a serial port..
diff --git a/package/setserial/Config.in b/package/setserial/Config.in
index cffe50e..d84d3d6 100644
--- a/package/setserial/Config.in
+++ b/package/setserial/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SETSERIAL_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_SETSERIAL
 	bool "setserial"
 	# Uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_SETSERIAL_AVAILABLE
 	help
 	     Setserial : configuration of serial ports
diff --git a/package/shared-mime-info/Config.in b/package/shared-mime-info/Config.in
index b08c1fd..d3ffe6d 100644
--- a/package/shared-mime-info/Config.in
+++ b/package/shared-mime-info/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_SHARED_MIME_INFO_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_SHARED_MIME_INFO
 	bool "shared-mime-info"
-	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
+	depends on BR2_PACKAGE_SHARED_MIME_INFO_AVAILABLE
 	help
 	  The shared-mime-info package contains the core
 	  database of common types and the update-mime-database
diff --git a/package/slang/Config.in b/package/slang/Config.in
index 60facbb..32581a6 100644
--- a/package/slang/Config.in
+++ b/package/slang/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SLANG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SLANG
 	bool "slang"
+	depends on BR2_PACKAGE_SLANG_AVAILABLE
 	help
 	  Multi-platform console display library.
 
diff --git a/package/smartmontools/Config.in b/package/smartmontools/Config.in
index 18320f0..884a5eb 100644
--- a/package/smartmontools/Config.in
+++ b/package/smartmontools/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SMARTMONTOOLS_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_SMARTMONTOOLS
 	bool "smartmontools"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_SMARTMONTOOLS_AVAILABLE
 	help
 	  Control and monitor storage systems using S.M.A.R.T.
 
diff --git a/package/socat/Config.in b/package/socat/Config.in
index ae88be9..ca53c08 100644
--- a/package/socat/Config.in
+++ b/package/socat/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SOCAT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SOCAT
 	bool "socat"
+	depends on BR2_PACKAGE_SOCAT_AVAILABLE
 	help
 	  Multipurpose socket relay program.
 
diff --git a/package/socketcand/Config.in b/package/socketcand/Config.in
index 0d1d983..059f6f5 100644
--- a/package/socketcand/Config.in
+++ b/package/socketcand/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SOCKETCAND_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SOCKETCAND
 	bool "socketcand"
 	select BR2_PACKAGE_LIBCONFIG
+	depends on BR2_PACKAGE_SOCKETCAND_AVAILABLE
 	help
 	  Socketcand is a daemon that provides access to CAN interfaces
 	  on a machine via a network interface.
diff --git a/package/sound-theme-borealis/Config.in b/package/sound-theme-borealis/Config.in
index fcc109f..b453405 100644
--- a/package/sound-theme-borealis/Config.in
+++ b/package/sound-theme-borealis/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SOUND_THEME_BOREALIS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SOUND_THEME_BOREALIS
 	bool "sound-theme-borealis"
+	depends on BR2_PACKAGE_SOUND_THEME_BOREALIS_AVAILABLE
 	help
 	  Borealis sound theme.
 
diff --git a/package/sound-theme-freedesktop/Config.in b/package/sound-theme-freedesktop/Config.in
index 8b48015..f81da7a 100644
--- a/package/sound-theme-freedesktop/Config.in
+++ b/package/sound-theme-freedesktop/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SOUND_THEME_FREEDESKTOP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SOUND_THEME_FREEDESKTOP
 	bool "sound-theme-freedesktop"
+	depends on BR2_PACKAGE_SOUND_THEME_FREEDESKTOP_AVAILABLE
 	help
 	  Default theme for the XDG Sound Theme Specification.
 
diff --git a/package/spawn-fcgi/Config.in b/package/spawn-fcgi/Config.in
index 34cbbb1..1745793 100644
--- a/package/spawn-fcgi/Config.in
+++ b/package/spawn-fcgi/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SPAWN_FCGI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SPAWN_FCGI
 	bool "spawn-fcgi"
+	depends on BR2_PACKAGE_SPAWN_FCGI_AVAILABLE
 	help
 	  FastCGI process spawner.
 	  Project split from lighttpd.
diff --git a/package/speex/Config.in b/package/speex/Config.in
index 424a830..223eee9 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SPEEX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SPEEX
 	bool "speex"
 	select BR2_PACKAGE_LIBOGG
+	depends on BR2_PACKAGE_SPEEX_AVAILABLE
 	help
 	  Speex is an Open Source/Free Software patent-free
 	  audio compression format designed for speech.
diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
index 8970115..8afbddb 100644
--- a/package/sqlcipher/Config.in
+++ b/package/sqlcipher/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_SQLCIPHER_AVAILABLE
+	def_bool y
+	depends on !BR2_PACKAGE_SQLITE
+
 config BR2_PACKAGE_SQLCIPHER
 	bool "sqlcipher"
-	depends on !BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_SQLCIPHER_AVAILABLE
 	help
 	  SQLCipher is an SQLite extension that provides 256 bits AES
 	  encryption of database files.  Note that it is a fork of SQLite
diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index 25aaa3f..88d570b 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SQLITE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SQLITE
 	bool "sqlite"
+	depends on BR2_PACKAGE_SQLITE_AVAILABLE
 	help
 	  SQLite is a small C library that implements a self-contained,
 	  embeddable, zero-configuration SQL database engine.
diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 93d3594..aaca83e 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -1,8 +1,12 @@
-config BR2_PACKAGE_SQUASHFS
-	bool "squashfs"
+config BR2_PACKAGE_SQUASHFS_AVAILABLE
+	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_SQUASHFS
+	bool "squashfs"
 	select BR2_PACKAGE_SQUASHFS_GZIP if !(BR2_PACKAGE_SQUASHFS_LZMA || BR2_PACKAGE_SQUASHFS_LZO)
+	depends on BR2_PACKAGE_SQUASHFS_AVAILABLE
 	help
 	  Tools to generate SquashFS filesystems.
 
diff --git a/package/squashfs3/Config.in b/package/squashfs3/Config.in
index 3291272..4993a41 100644
--- a/package/squashfs3/Config.in
+++ b/package/squashfs3/Config.in
@@ -1,7 +1,11 @@
-config BR2_PACKAGE_SQUASHFS3
-	bool "squashfs3"
+config BR2_PACKAGE_SQUASHFS3_AVAILABLE
+	def_bool y
 	depends on BR2_DEPRECATED
 	depends on BR2_LARGEFILE
+
+config BR2_PACKAGE_SQUASHFS3
+	bool "squashfs3"
+	depends on BR2_PACKAGE_SQUASHFS3_AVAILABLE
 	help
 	  Tools to generate SquashFS 3.x filesystems.
 
diff --git a/package/squid/Config.in b/package/squid/Config.in
index 4ec7fa4..d09267e 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,11 +1,15 @@
 comment "Squid requires a toolchain with C++ and IPv6 support enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6
 
-config BR2_PACKAGE_SQUID
-	bool "squid"
+config BR2_PACKAGE_SQUID_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_INET_IPV6
+
+config BR2_PACKAGE_SQUID
+	bool "squid"
 	select BR2_PACKAGE_LIBCAP
+	depends on BR2_PACKAGE_SQUID_AVAILABLE
 	help
 	  Caching proxy for the Web supporting HTTP, HTTPS, FTP, and more.
 
diff --git a/package/sredird/Config.in b/package/sredird/Config.in
index 463269a..cd0b28c 100644
--- a/package/sredird/Config.in
+++ b/package/sredird/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SREDIRD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SREDIRD
 	bool "sredird"
+	depends on BR2_PACKAGE_SREDIRD_AVAILABLE
 	help
 	  Sredird is a serial port redirector that is compliant with
 	  the RFC 2217 "Telnet Com Port Control Option" protocol. This
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 73d552f..d5e544e 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -1,3 +1,8 @@
+config BR2_PACKAGE_SSHFS_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_SSHFS
 	bool "sshfs (FUSE)"
 	select BR2_PACKAGE_LIBFUSE
@@ -6,8 +11,7 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSH
-	depends on BR2_LARGEFILE
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_SSHFS_AVAILABLE
 	help
 	  FUSE filesystem client based on the SSH File Transfer Protocol.
 
diff --git a/package/sstrip/Config.in b/package/sstrip/Config.in
index 12a5941..9f09864 100644
--- a/package/sstrip/Config.in
+++ b/package/sstrip/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SSTRIP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SSTRIP
 	bool "sstrip"
+	depends on BR2_PACKAGE_SSTRIP_AVAILABLE
 	help
 	  Small utility that removes a few bytes from an executable that
 	  strip leaves behind.
diff --git a/package/startup-notification/Config.in b/package/startup-notification/Config.in
index 277d300..0b626d2 100644
--- a/package/startup-notification/Config.in
+++ b/package/startup-notification/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_STARTUP_NOTIFICATION_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_STARTUP_NOTIFICATION
 	bool "startup-notification"
 	select BR2_PACKAGE_XLIB_LIBX11
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_STARTUP_NOTIFICATION_AVAILABLE
 	help
 	  Startup-notification is a library used to monitor application startup.
 
diff --git a/package/statserial/Config.in b/package/statserial/Config.in
index 4db5eb1..ef48c02 100644
--- a/package/statserial/Config.in
+++ b/package/statserial/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_STATSERIAL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_STATSERIAL
 	bool "statserial"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_STATSERIAL_AVAILABLE
 	help
 	  Displays a table of the signals on a standard
 	  9-pin or 25-pin serial port, and indicates the
diff --git a/package/strace/Config.in b/package/strace/Config.in
index bbb582a..b3a1270 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_STRACE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_STRACE
 	bool "strace"
+	depends on BR2_PACKAGE_STRACE_AVAILABLE
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
diff --git a/package/stress/Config.in b/package/stress/Config.in
index b092b03..9550e58 100644
--- a/package/stress/Config.in
+++ b/package/stress/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_STRESS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_STRESS
 	bool "stress"
+	depends on BR2_PACKAGE_STRESS_AVAILABLE
 	help
 	  A deliberately simple workload generator for POSIX systems.
 	  It imposes a configurable amount of CPU, memory, I/O, and
diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
index b1977ed..e3ee61a 100644
--- a/package/stunnel/Config.in
+++ b/package/stunnel/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_STUNNEL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_STUNNEL
 	bool "stunnel"
 	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_STUNNEL_AVAILABLE
 	help
 	  Stunnel is a program that wraps any TCP connection with an SSL
 	  connection.
diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index cd7ab81..6764778 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_SUDO_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_SUDO
 	bool "sudo"
 	# uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_SUDO_AVAILABLE
 	help
 	  Sudo is a program designed to allow a sysadmin to give
 	  limited root privileges to users and log root activity.  The
diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
index 5340181..6bdb274 100644
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_SUPERVISOR_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_PYTHON
+
 config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	select BR2_PACKAGE_PYTHON_MELD3
+	depends on BR2_PACKAGE_SUPERVISOR_AVAILABLE
 	help
 	  A client/server system that allows its users to control a
 	  number of processes on UNIX-like operating systems.
diff --git a/package/sylpheed/Config.in b/package/sylpheed/Config.in
index 16f03be..37b3cfc 100644
--- a/package/sylpheed/Config.in
+++ b/package/sylpheed/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SYLPHEED_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_LIBGTK2
+
 config BR2_PACKAGE_SYLPHEED
 	bool "sylpheed"
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_SYLPHEED_AVAILABLE
 	help
 	  lightweight and user-friendly e-mail client.
 
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 04351b7..e21c170 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -1,9 +1,13 @@
-config BR2_PACKAGE_SYNERGY
-	bool "synergy"
+config BR2_PACKAGE_SYNERGY_AVAILABLE
+	def_bool y
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+
+config BR2_PACKAGE_SYNERGY
+	bool "synergy"
 	select BR2_PACKAGE_XLIB_LIBXTST
+	depends on BR2_PACKAGE_SYNERGY_AVAILABLE
 	help
 	  Synergy lets you easily share a single mouse and
 	  keyboard between multiple computers with different
diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index e3cf2ba..cb14de1 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_SYSKLOGD_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_SYSKLOGD
 	bool "syslogd & klogd"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_SYSKLOGD_AVAILABLE
 	help
 	  System log daemons syslogd and klogd.
 
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 513a32c..79e387a 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -1,10 +1,14 @@
+config BR2_PACKAGE_SYSPROF_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
+
 config BR2_PACKAGE_SYSPROF
 	bool "sysprof"
 	select BR2_PACKAGE_LIBGLIB2
-	depends on BR2_USE_WCHAR # glib2
 	# In its util.h file, sysprof contains architecture-specific
 	# code
-	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
+	depends on BR2_PACKAGE_SYSPROF_AVAILABLE
 	help
 	  Sysprof is a statistical, system-wide profiler that can
 	  profile user and kernel code using the perf API.
diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
index 6e62ff1..0b8e917 100644
--- a/package/sysstat/Config.in
+++ b/package/sysstat/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_SYSSTAT_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_SYSSTAT
 	bool "sysstat"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	# Uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_SYSSTAT_AVAILABLE
 	help
           The sysstat utilities are a collection of performance
           monitoring tools for Linux. These include sar, sadf, mpstat,
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 0e7fc39..b73212f 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -1,10 +1,14 @@
-config BR2_PACKAGE_SYSTEMD
-	bool "systemd"
+config BR2_PACKAGE_SYSTEMD_AVAILABLE
+	def_bool y
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+
+config BR2_PACKAGE_SYSTEMD
+	bool "systemd"
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCAP
+	depends on BR2_PACKAGE_SYSTEMD_AVAILABLE
 	help
 	  systemd is a system and service manager for Linux, compatible with
 	  SysV and LSB init scripts. systemd provides aggressive parallelization
diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index 34ec391..d37ce4a 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_SYSVINIT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_SYSVINIT
 	bool "sysvinit"
+	depends on BR2_PACKAGE_SYSVINIT_AVAILABLE
 	help
 	  /sbin/init - parent of all processes
 
diff --git a/package/taglib/Config.in b/package/taglib/Config.in
index d172c34..1bb0ee6 100644
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -1,7 +1,11 @@
 
+config BR2_PACKAGE_TAGLIB_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_TAGLIB
 	bool "taglib"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_TAGLIB_AVAILABLE
 	help
 	  TagLib is a library for reading and editing the meta-data of
           several popular audio formats. Currently it supports both ID3v1
diff --git a/package/tar/Config.in b/package/tar/Config.in
index 427cae4..1fa844a 100644
--- a/package/tar/Config.in
+++ b/package/tar/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_TAR_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_TAR
 	bool "tar"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_TAR_AVAILABLE
 	help
 	  A program that saves many files together into a single tape or disk
 	  archive, and can restore individual files from the archive.
diff --git a/package/tcl/Config.in b/package/tcl/Config.in
index 7a4d887..0d4cad0 100644
--- a/package/tcl/Config.in
+++ b/package/tcl/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_TCL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_TCL
 	bool "tcl"
+	depends on BR2_PACKAGE_TCL_AVAILABLE
 	help
 	  TCL (Tool Command Language) is a simple textual language.
 
diff --git a/package/tcpdump/Config.in b/package/tcpdump/Config.in
index c284398..42af213 100644
--- a/package/tcpdump/Config.in
+++ b/package/tcpdump/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_TCPDUMP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_TCPDUMP
 	bool "tcpdump"
 	select BR2_PACKAGE_LIBPCAP
+	depends on BR2_PACKAGE_TCPDUMP_AVAILABLE
 	help
 	  A tool for network monitoring and data acquisition.
 
diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
index 6d3a3bf..c907b2a 100644
--- a/package/tcpreplay/Config.in
+++ b/package/tcpreplay/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_TCPREPLAY_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_TCPREPLAY
 	bool "tcpreplay"
 	select BR2_PACKAGE_LIBPCAP
+	depends on BR2_PACKAGE_TCPREPLAY_AVAILABLE
 	help
 	  Tcpreplay is a tool for replaying network traffic from files saved
 	  with tcpdump or other tools which write pcap(3) files.
diff --git a/package/tftpd/Config.in b/package/tftpd/Config.in
index 52e23a3..c8a4a39 100644
--- a/package/tftpd/Config.in
+++ b/package/tftpd/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_TFTPD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_TFTPD
 	bool "tftpd"
+	depends on BR2_PACKAGE_TFTPD_AVAILABLE
 	help
 	  HPA's Trivial File Transfer Protocol (tftp) server.
 
diff --git a/package/thttpd/Config.in b/package/thttpd/Config.in
index 172a2d6..4d73802 100644
--- a/package/thttpd/Config.in
+++ b/package/thttpd/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_THTTPD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_THTTPD
 	bool "thttpd"
+	depends on BR2_PACKAGE_THTTPD_AVAILABLE
 	help
 	  thttpd is a simple, small, portable, fast, and secure HTTP server
 
diff --git a/package/ti-utils/Config.in b/package/ti-utils/Config.in
index 94d6204..2bd1ab5c 100644
--- a/package/ti-utils/Config.in
+++ b/package/ti-utils/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_TI_UTILS_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+
 config BR2_PACKAGE_TI_UTILS
 	bool "ti-utils"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_LIBNL
+	depends on BR2_PACKAGE_TI_UTILS_AVAILABLE
 	help
 	  The calibrator and other useful utilities for TI wireless solution,
 	  based on wl12xx driver.
diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index 7850965..eb82eb4 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_TIFF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_TIFF
 	bool "tiff"
+	depends on BR2_PACKAGE_TIFF_AVAILABLE
 	help
 	  Library for handling TIFF (Tag Image File Format) images.
 
diff --git a/package/tinyhttpd/Config.in b/package/tinyhttpd/Config.in
index 5a6ee88..4b5f9ff 100644
--- a/package/tinyhttpd/Config.in
+++ b/package/tinyhttpd/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_TINYHTTPD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_TINYHTTPD
 	bool "tinyhttpd"
+	depends on BR2_PACKAGE_TINYHTTPD_AVAILABLE
 	help
 	  A relatively simple webserver written as a school project. It is
 	  exceedingly simple, threaded and handles basic CGI scripts.
diff --git a/package/tn5250/Config.in b/package/tn5250/Config.in
index 807def0..39a9841 100644
--- a/package/tn5250/Config.in
+++ b/package/tn5250/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_TN5250_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_TN5250
 	bool "tn5250"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_TN5250_AVAILABLE
 	help
 	  Telnet client that emulates 5250 terminals and printers.
 
diff --git a/package/torsmo/Config.in b/package/torsmo/Config.in
index ec9cb22..0a67e72 100644
--- a/package/torsmo/Config.in
+++ b/package/torsmo/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_TORSMO_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_TORSMO
 	bool "torsmo"
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_TORSMO_AVAILABLE
 	help
 	  Torsmo is a system monitor that sits in the corner of your desktop.
 
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index e7e9f66..3c888bc 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -1,10 +1,14 @@
+config BR2_PACKAGE_TRANSMISSION_AVAILABLE
+	def_bool y
+	depends on BR2_INET_IPV6
+
 config BR2_PACKAGE_TRANSMISSION
 	bool "transmission"
-	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBEVENT
+	depends on BR2_PACKAGE_TRANSMISSION_AVAILABLE
 	help
 	  Transmission is a cross-platform BitTorrent client.
 
diff --git a/package/tremor/Config.in b/package/tremor/Config.in
index 2e58e09..325c6ad 100644
--- a/package/tremor/Config.in
+++ b/package/tremor/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_TREMOR_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_TREMOR
 	bool "tremor (fixed point vorbis decoder)"
+	depends on BR2_PACKAGE_TREMOR_AVAILABLE
 	help
 	  Tremor is a fixed point implementation of an Ogg Vorbis
           decoder. It provides a decoding API similar to libvorbis,
diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index 76f1349..7eb7cf5 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_TSLIB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_TSLIB
 	bool "libts - The Touchscreen tslib Library"
+	depends on BR2_PACKAGE_TSLIB_AVAILABLE
 	help
 	    http://tslib.berlios.de/
 
diff --git a/package/ttcp/Config.in b/package/ttcp/Config.in
index 0262fc9..de26650 100644
--- a/package/ttcp/Config.in
+++ b/package/ttcp/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_TTCP_AVAILABLE
+	def_bool y
+	depends on BR2_DEPRECATED
+
 config BR2_PACKAGE_TTCP
 	bool "ttcp"
-	depends on BR2_DEPRECATED
+	depends on BR2_PACKAGE_TTCP_AVAILABLE
 	help
 	  Benchmarking tool for determining TCP and UDP performance.
 
diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 9cc837c..4cbb490 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_UBOOT_TOOLS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_UBOOT_TOOLS
 	bool "u-boot tools"
+	depends on BR2_PACKAGE_UBOOT_TOOLS_AVAILABLE
 	help
 	  Companion tools for Das U-Boot bootloader.
 
diff --git a/package/udev/Config.in b/package/udev/Config.in
index d3244d1..651087a 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,11 +1,15 @@
-config BR2_PACKAGE_UDEV
-	bool "udev"
+config BR2_PACKAGE_UDEV_AVAILABLE
+	def_bool y
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+
+config BR2_PACKAGE_UDEV
+	bool "udev"
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
+	depends on BR2_PACKAGE_UDEV_AVAILABLE
 	help
 	  Userspace device daemon.
 
diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index d7ccfb4..0a2276d 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_UDPCAST_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_UDPCAST
 	bool "udpcast"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_UDPCAST_AVAILABLE
 	help
 	  A multicast protocol implementation which happens to
 	  be very handy for imaging drives over the network.
diff --git a/package/uemacs/Config.in b/package/uemacs/Config.in
index f093218..412ea9d 100644
--- a/package/uemacs/Config.in
+++ b/package/uemacs/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_UEMACS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_UEMACS
 	bool "uemacs"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_UEMACS_AVAILABLE
 	help
 	  A small emacs.
 
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index a974c8c..ba437e7 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_UNIONFS_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_UNIONFS
 	bool "unionfs (FUSE)"
 	select BR2_PACKAGE_LIBFUSE
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_UNIONFS_AVAILABLE
 	help
 	  A userspace unionfs implementation.
 
diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index a27b3ee..0292985 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_USB_MODESWITCH_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+
 config BR2_PACKAGE_USB_MODESWITCH
 	bool "usb_modeswitch"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_PACKAGE_USB_MODESWITCH_AVAILABLE
 	help
 	  USB mode switcher.
 	  Used to switch mode on multiple-function devices
diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
index 8698bb6..ae05890 100644
--- a/package/usb_modeswitch_data/Config.in
+++ b/package/usb_modeswitch_data/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_USB_MODESWITCH_DATA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_USB_MODESWITCH_DATA
 	bool "usb_modeswitch_data"
 	select BR2_PACKAGE_USB_MODESWITCH
 	# tcl is a runtime dependency
 	select BR2_PACKAGE_TCL
 	select BR2_PACKAGE_TCL_TCLSH
+	depends on BR2_PACKAGE_USB_MODESWITCH_DATA_AVAILABLE
 	help
 	  USB mode switch data
 	  Contains udev rules and events to allow usb_modeswitch to
diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index 30c7b5a..3d4588f 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -1,11 +1,15 @@
-config BR2_PACKAGE_USBMOUNT
-	bool "usbmount"
+config BR2_PACKAGE_USBMOUNT_AVAILABLE
+	def_bool y
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_PACKAGE_UDEV
+
+config BR2_PACKAGE_USBMOUNT
+	bool "usbmount"
 	select BR2_PACKAGE_LOCKFILE_PROGS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	depends on BR2_PACKAGE_USBMOUNT_AVAILABLE
 	help
 	  The usbmount package automatically mounts USB mass storage devices
 	  when they are plugged in, and unmounts them when they are removed.
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index fd9926c..72c5279 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_USBUTILS_AVAILABLE
+	def_bool y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
+	depends on BR2_PACKAGE_USBUTILS_AVAILABLE
 	help
 	  USB enumeration utilities
 
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index acf025f..dcb2ef7 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_USHARE_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_USHARE
 	bool "ushare"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on BR2_PACKAGE_USHARE_AVAILABLE
 	help
 	  uShare is a UPnP (TM) A/V & DLNA Media Server.
 	  It implements the server component that provides UPnP media devices
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 43a8444..7e667e8 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,7 +1,11 @@
-config BR2_PACKAGE_UTIL_LINUX
-	bool "util-linux"
+config BR2_PACKAGE_UTIL_LINUX_AVAILABLE
+	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+
+config BR2_PACKAGE_UTIL_LINUX
+	bool "util-linux"
+	depends on BR2_PACKAGE_UTIL_LINUX_AVAILABLE
 	help
 	  Various useful/essential Linux utilities.
 
diff --git a/package/vala/Config.in b/package/vala/Config.in
index 89b4459..a022acc 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -1,10 +1,14 @@
+config BR2_PACKAGE_VALA_AVAILABLE
+	def_bool y
+	depends on BR2_USE_WCHAR # glib2
+
 config BR2_PACKAGE_VALA
 	bool "vala"
-	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_VALA_AVAILABLE
 	help
 	  Compiler for the GObject type system.
 
diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index dacdd86..fde0b53 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,7 +1,11 @@
-config BR2_PACKAGE_VALGRIND
-	bool "valgrind"
+config BR2_PACKAGE_VALGRIND_AVAILABLE
+	def_bool y
 	depends on BR2_i386 || BR2_x86_64 || BR2_cortex_a8 || \
 		   BR2_cortex_a9 || BR2_powerpc
+
+config BR2_PACKAGE_VALGRIND
+	bool "valgrind"
+	depends on BR2_PACKAGE_VALGRIND_AVAILABLE
 	help
 	  Tool for debugging and profiling Linux programs.
 
diff --git a/package/vim/Config.in b/package/vim/Config.in
index 0da158f..99fa37c 100644
--- a/package/vim/Config.in
+++ b/package/vim/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_VIM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_VIM
 	bool "vim"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_VIM_AVAILABLE
 	help
 	  VIM Text editor
 
diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index 9abc0c5..b1d7588 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_VPNC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_VPNC
 	bool "vpnc"
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
+	depends on BR2_PACKAGE_VPNC_AVAILABLE
 	help
 	  Client for Cisco VPN concentrator
 	  3000 Series VPN Concentrator
diff --git a/package/vsftpd/Config.in b/package/vsftpd/Config.in
index 8414c88..52aa307 100644
--- a/package/vsftpd/Config.in
+++ b/package/vsftpd/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_VSFTPD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_VSFTPD
 	bool "vsftpd"
+	depends on BR2_PACKAGE_VSFTPD_AVAILABLE
 	help
 	  vsftpd is an ftp daemon written with security in mind.
 	  http://vsftpd.beasts.org/
diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index b40de25..37b0ffc 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_VTUN_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_VTUN
 	bool "vtun - BEWARE: read package/vtun/README.txt before use"
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_VTUN_AVAILABLE
 	help
 	  Tool for easily creating Virtual Tunnels over TCP/IP networks
 	  with traffic shaping, compression, and encryption.
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 34071e4..a365361 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -1,8 +1,11 @@
-config BR2_PACKAGE_WEBKIT
-	bool "webkit"
+config BR2_PACKAGE_WEBKIT_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LIBGTK2
+
+config BR2_PACKAGE_WEBKIT
+	bool "webkit"
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
@@ -13,6 +16,7 @@ config BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_LIBGAIL
 	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_WEBKIT_AVAILABLE
 	help
 	  WebKit is an open source, standards compliant web browser engine.
 
diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index 90341d6..7eef5f8 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -1,7 +1,11 @@
-config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
-	bool "webrtc-audio-processing"
+config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_AVAILABLE
+	def_bool y
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
 	depends on BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
+	bool "webrtc-audio-processing"
+	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_AVAILABLE
 	help
 	  AudioProcessing library based on Google's implementation of
 	  WebRTC.
diff --git a/package/wget/Config.in b/package/wget/Config.in
index 354b48f..271218b 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_WGET_AVAILABLE
+	def_bool y
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR
+
 config BR2_PACKAGE_WGET
 	bool "wget"
 	# fork()
-	depends on BR2_USE_MMU
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_WGET_AVAILABLE
 	help
 	  Network utility to retrieve files from http, https and ftp.
 
diff --git a/package/whetstone/Config.in b/package/whetstone/Config.in
index 7a68160..deca27a 100644
--- a/package/whetstone/Config.in
+++ b/package/whetstone/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_WHETSTONE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_WHETSTONE
 	bool "whetstone"
+	depends on BR2_PACKAGE_WHETSTONE_AVAILABLE
 	help
 	  C Converted Whetstone Double Precision Benchmark
 
diff --git a/package/which/Config.in b/package/which/Config.in
index 5811083..eb75a58 100644
--- a/package/which/Config.in
+++ b/package/which/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_WHICH_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_WHICH
 	bool "which"
+	depends on BR2_PACKAGE_WHICH_AVAILABLE
 	help
 	  The standard 'which' utility.
 
diff --git a/package/wipe/Config.in b/package/wipe/Config.in
index 0241c13..2365f0d 100644
--- a/package/wipe/Config.in
+++ b/package/wipe/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_WIPE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_WIPE
 	bool "wipe"
+	depends on BR2_PACKAGE_WIPE_AVAILABLE
 	help
 	  Wipe is a little command for securely erasing files
 	  from magnetic media. It compiles under various unix platforms.
diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
index c51ee9b..0f41a92 100644
--- a/package/wireless_tools/Config.in
+++ b/package/wireless_tools/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_WIRELESS_TOOLS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_WIRELESS_TOOLS
 	bool "wireless tools"
+	depends on BR2_PACKAGE_WIRELESS_TOOLS_AVAILABLE
 	help
 	  A collection of tools to configure wireless lan cards.
 
diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index d7cefe3..3dbd8a0 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_WPA_SUPPLICANT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT_AVAILABLE
 	help
 	  WPA supplicant for secure wireless networks
 
diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
index 3621648..43efcf4 100644
--- a/package/wsapi/Config.in
+++ b/package/wsapi/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_WSAPI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_WSAPI
 	bool "wsapi"
 	select BR2_PACKAGE_COXPCALL
 	select BR2_PACKAGE_LUAFILESYSTEM
 	select BR2_PACKAGE_RINGS
+	depends on BR2_PACKAGE_WSAPI_AVAILABLE
 	help
 	  API that abstracts the web server from Lua web applications.
 
diff --git a/package/x11r7/libxcb/Config.in b/package/x11r7/libxcb/Config.in
index 9554529..bdb2c90 100644
--- a/package/x11r7/libxcb/Config.in
+++ b/package/x11r7/libxcb/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_LIBXCB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_LIBXCB
 	bool "libxcb"
 	select BR2_PACKAGE_PTHREAD_STUBS
 	select BR2_PACKAGE_XCB_PROTO
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXAU
+	depends on BR2_PACKAGE_LIBXCB_AVAILABLE
 	help
 	  The X protocol C-language Binding (XCB) is a replacement for
 	  Xlib featuring a small footprint, latency hiding, direct access
diff --git a/package/x11r7/mcookie/Config.in b/package/x11r7/mcookie/Config.in
index 2e9cfc7..3e5eccb 100644
--- a/package/x11r7/mcookie/Config.in
+++ b/package/x11r7/mcookie/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_MCOOKIE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_MCOOKIE
 	bool "mcookie"
+	depends on BR2_PACKAGE_MCOOKIE_AVAILABLE
 	help
 	  cookie generator for X server
 
diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
index 47ded29..4fe949d 100644
--- a/package/x11r7/mesa3d/Config.in
+++ b/package/x11r7/mesa3d/Config.in
@@ -1,3 +1,8 @@
+config BR2_PACKAGE_MESA3D_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XSERVER_xorg
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_MESA3D
 	bool "Mesa 3D Graphics Library"
 	select BR2_PACKAGE_XPROTO_GLPROTO
@@ -7,8 +12,7 @@ config BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_DRI2PROTO
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
-	depends on BR2_PACKAGE_XSERVER_xorg
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
 
diff --git a/package/x11r7/pthread-stubs/Config.in b/package/x11r7/pthread-stubs/Config.in
index c17f7da..0299806 100644
--- a/package/x11r7/pthread-stubs/Config.in
+++ b/package/x11r7/pthread-stubs/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_PTHREAD_STUBS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_PTHREAD_STUBS
 	bool "pthread-stubs"
+	depends on BR2_PACKAGE_PTHREAD_STUBS_AVAILABLE
 	help
 	  This library provides weak aliases for pthread functions not
 	  provided in libc or otherwise available by default.
diff --git a/package/x11r7/xapp_appres/Config.in b/package/x11r7/xapp_appres/Config.in
index 7574659..b0c19dd 100644
--- a/package/x11r7/xapp_appres/Config.in
+++ b/package/x11r7/xapp_appres/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_APPRES_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_APPRES
 	bool "appres"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
+	depends on BR2_PACKAGE_XAPP_APPRES_AVAILABLE
 	help
 	  list X application resource database
diff --git a/package/x11r7/xapp_bdftopcf/Config.in b/package/x11r7/xapp_bdftopcf/Config.in
index a9caffa..f738419 100644
--- a/package/x11r7/xapp_bdftopcf/Config.in
+++ b/package/x11r7/xapp_bdftopcf/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_BDFTOPCF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_BDFTOPCF
 	bool "bdftopcf"
 	select BR2_PACKAGE_XLIB_LIBXFONT
+	depends on BR2_PACKAGE_XAPP_BDFTOPCF_AVAILABLE
 	help
 	  X.Org bdftopcf application
diff --git a/package/x11r7/xapp_beforelight/Config.in b/package/x11r7/xapp_beforelight/Config.in
index 3a11189..f06738d 100644
--- a/package/x11r7/xapp_beforelight/Config.in
+++ b/package/x11r7/xapp_beforelight/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XAPP_BEFORELIGHT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_BEFORELIGHT
 	bool "beforelight"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXT
+	depends on BR2_PACKAGE_XAPP_BEFORELIGHT_AVAILABLE
 	help
 	  screen saver
diff --git a/package/x11r7/xapp_bitmap/Config.in b/package/x11r7/xapp_bitmap/Config.in
index e5bb5e8..efc8007 100644
--- a/package/x11r7/xapp_bitmap/Config.in
+++ b/package/x11r7/xapp_bitmap/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XAPP_BITMAP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_BITMAP
 	bool "bitmap"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XDATA_XBITMAPS
+	depends on BR2_PACKAGE_XAPP_BITMAP_AVAILABLE
 	help
 	  X.Org bitmap application
diff --git a/package/x11r7/xapp_editres/Config.in b/package/x11r7/xapp_editres/Config.in
index 390ec48..1586de7 100644
--- a/package/x11r7/xapp_editres/Config.in
+++ b/package/x11r7/xapp_editres/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XAPP_EDITRES_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_EDITRES
 	bool "editres"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
+	depends on BR2_PACKAGE_XAPP_EDITRES_AVAILABLE
 	help
 	  a dynamic resource editor for X Toolkit applications
diff --git a/package/x11r7/xapp_fonttosfnt/Config.in b/package/x11r7/xapp_fonttosfnt/Config.in
index eb35710..684123d 100644
--- a/package/x11r7/xapp_fonttosfnt/Config.in
+++ b/package/x11r7/xapp_fonttosfnt/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_FONTTOSFNT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_FONTTOSFNT
 	bool "fonttosfnt"
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
+	depends on BR2_PACKAGE_XAPP_FONTTOSFNT_AVAILABLE
 	help
 	  X.Org fonttosfnt application
diff --git a/package/x11r7/xapp_fslsfonts/Config.in b/package/x11r7/xapp_fslsfonts/Config.in
index 1917d61..b31bce2 100644
--- a/package/x11r7/xapp_fslsfonts/Config.in
+++ b/package/x11r7/xapp_fslsfonts/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_FSLSFONTS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_FSLSFONTS
 	bool "fslsfonts"
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_FSLSFONTS_AVAILABLE
 	help
 	  list fonts served by X font server
diff --git a/package/x11r7/xapp_fstobdf/Config.in b/package/x11r7/xapp_fstobdf/Config.in
index 0a1f62b..a82fc17 100644
--- a/package/x11r7/xapp_fstobdf/Config.in
+++ b/package/x11r7/xapp_fstobdf/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_FSTOBDF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_FSTOBDF
 	bool "fstobdf"
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_FSTOBDF_AVAILABLE
 	help
 	  generate BDF font from X font server
diff --git a/package/x11r7/xapp_iceauth/Config.in b/package/x11r7/xapp_iceauth/Config.in
index ce2db98..1802936 100644
--- a/package/x11r7/xapp_iceauth/Config.in
+++ b/package/x11r7/xapp_iceauth/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_ICEAUTH_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_ICEAUTH
 	bool "iceauth"
 	select BR2_PACKAGE_XLIB_LIBICE
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_ICEAUTH_AVAILABLE
 	help
 	  ICE authority file utility
diff --git a/package/x11r7/xapp_ico/Config.in b/package/x11r7/xapp_ico/Config.in
index 892f2be..d797212 100644
--- a/package/x11r7/xapp_ico/Config.in
+++ b/package/x11r7/xapp_ico/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_ICO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_ICO
 	bool "ico"
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_ICO_AVAILABLE
 	help
 	  animate an icosahedron or other polyhedron
diff --git a/package/x11r7/xapp_listres/Config.in b/package/x11r7/xapp_listres/Config.in
index a3be6b3..e718445 100644
--- a/package/x11r7/xapp_listres/Config.in
+++ b/package/x11r7/xapp_listres/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XAPP_LISTRES_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_LISTRES
 	bool "listres"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
+	depends on BR2_PACKAGE_XAPP_LISTRES_AVAILABLE
 	help
 	  list resources in widgets
diff --git a/package/x11r7/xapp_luit/Config.in b/package/x11r7/xapp_luit/Config.in
index aec83a0..c29b005 100644
--- a/package/x11r7/xapp_luit/Config.in
+++ b/package/x11r7/xapp_luit/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_LUIT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_LUIT
 	bool "luit"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
+	depends on BR2_PACKAGE_XAPP_LUIT_AVAILABLE
 	help
 	  Locale and ISO 2022 support for Unicode terminals
diff --git a/package/x11r7/xapp_mkfontdir/Config.in b/package/x11r7/xapp_mkfontdir/Config.in
index 155772d..ae0643a 100644
--- a/package/x11r7/xapp_mkfontdir/Config.in
+++ b/package/x11r7/xapp_mkfontdir/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_MKFONTDIR_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_MKFONTDIR
 	bool "mkfontdir"
 	select BR2_PACKAGE_XAPP_MKFONTSCALE
+	depends on BR2_PACKAGE_XAPP_MKFONTDIR_AVAILABLE
 	help
 	  create an index of X font files in a directory
diff --git a/package/x11r7/xapp_mkfontscale/Config.in b/package/x11r7/xapp_mkfontscale/Config.in
index 540dd45..67afb3b 100644
--- a/package/x11r7/xapp_mkfontscale/Config.in
+++ b/package/x11r7/xapp_mkfontscale/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_MKFONTSCALE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_MKFONTSCALE
 	bool "mkfontscale"
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
+	depends on BR2_PACKAGE_XAPP_MKFONTSCALE_AVAILABLE
 	help
 	  create an index of scalable font files for X
diff --git a/package/x11r7/xapp_oclock/Config.in b/package/x11r7/xapp_oclock/Config.in
index 00cd413..caa4530 100644
--- a/package/x11r7/xapp_oclock/Config.in
+++ b/package/x11r7/xapp_oclock/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_OCLOCK_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_OCLOCK
 	bool "oclock"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_OCLOCK_AVAILABLE
 	help
 	  round X clock
diff --git a/package/x11r7/xapp_rgb/Config.in b/package/x11r7/xapp_rgb/Config.in
index 038b849..8ada3c2 100644
--- a/package/x11r7/xapp_rgb/Config.in
+++ b/package/x11r7/xapp_rgb/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_RGB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_RGB
 	bool "rgb"
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XAPP_RGB_AVAILABLE
 	help
 	  uncompile an rgb color-name database
diff --git a/package/x11r7/xapp_rstart/Config.in b/package/x11r7/xapp_rstart/Config.in
index 1bf61b3..a0ed6c1 100644
--- a/package/x11r7/xapp_rstart/Config.in
+++ b/package/x11r7/xapp_rstart/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_RSTART_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_RSTART
 	bool "rstart"
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_RSTART_AVAILABLE
 	help
 	  X.Org rstart application
diff --git a/package/x11r7/xapp_scripts/Config.in b/package/x11r7/xapp_scripts/Config.in
index 691f0e2..32a9080 100644
--- a/package/x11r7/xapp_scripts/Config.in
+++ b/package/x11r7/xapp_scripts/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_SCRIPTS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_SCRIPTS
 	bool "scripts"
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_SCRIPTS_AVAILABLE
 	help
 	  start an X program on a remote machine
diff --git a/package/x11r7/xapp_sessreg/Config.in b/package/x11r7/xapp_sessreg/Config.in
index 0796bc1..1d859fc 100644
--- a/package/x11r7/xapp_sessreg/Config.in
+++ b/package/x11r7/xapp_sessreg/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_SESSREG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_SESSREG
 	bool "sessreg"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XAPP_SESSREG_AVAILABLE
 	help
 	  manage utmp/wtmp entries for non-init clients
diff --git a/package/x11r7/xapp_setxkbmap/Config.in b/package/x11r7/xapp_setxkbmap/Config.in
index 2b1389c..d269756 100644
--- a/package/x11r7/xapp_setxkbmap/Config.in
+++ b/package/x11r7/xapp_setxkbmap/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_SETXKBMAP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_SETXKBMAP
 	bool "setxkbmap"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	depends on BR2_PACKAGE_XAPP_SETXKBMAP_AVAILABLE
 	help
 	  Controls the keyboard layout of a running X server.
diff --git a/package/x11r7/xapp_showfont/Config.in b/package/x11r7/xapp_showfont/Config.in
index edfab3f..627a56c 100644
--- a/package/x11r7/xapp_showfont/Config.in
+++ b/package/x11r7/xapp_showfont/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_SHOWFONT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_SHOWFONT
 	bool "showfont"
 	select BR2_PACKAGE_XLIB_LIBFS
+	depends on BR2_PACKAGE_XAPP_SHOWFONT_AVAILABLE
 	help
 	  font dumper for X font server
diff --git a/package/x11r7/xapp_smproxy/Config.in b/package/x11r7/xapp_smproxy/Config.in
index 80ab984..4d33c9c 100644
--- a/package/x11r7/xapp_smproxy/Config.in
+++ b/package/x11r7/xapp_smproxy/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_SMPROXY_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_SMPROXY
 	bool "smproxy"
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
+	depends on BR2_PACKAGE_XAPP_SMPROXY_AVAILABLE
 	help
 	  Session Manager Proxy
diff --git a/package/x11r7/xapp_twm/Config.in b/package/x11r7/xapp_twm/Config.in
index 25bf800..e4d4d1f 100644
--- a/package/x11r7/xapp_twm/Config.in
+++ b/package/x11r7/xapp_twm/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XAPP_TWM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_TWM
 	bool "twm"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_TWM_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xapp_viewres/Config.in b/package/x11r7/xapp_viewres/Config.in
index 32827c8..f5ffc98 100644
--- a/package/x11r7/xapp_viewres/Config.in
+++ b/package/x11r7/xapp_viewres/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_VIEWRES_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_VIEWRES
 	bool "viewres"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_VIEWRES_AVAILABLE
 	help
 	  graphical class browser for Xt
diff --git a/package/x11r7/xapp_x11perf/Config.in b/package/x11r7/xapp_x11perf/Config.in
index 0f1eca8..21c019b 100644
--- a/package/x11r7/xapp_x11perf/Config.in
+++ b/package/x11r7/xapp_x11perf/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_X11PERF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_X11PERF
 	bool "x11perf"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXFT
+	depends on BR2_PACKAGE_XAPP_X11PERF_AVAILABLE
 	help
 	  summarize x11perf results
diff --git a/package/x11r7/xapp_xauth/Config.in b/package/x11r7/xapp_xauth/Config.in
index 919fd50..a84d908 100644
--- a/package/x11r7/xapp_xauth/Config.in
+++ b/package/x11r7/xapp_xauth/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XAPP_XAUTH_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XAUTH
 	bool "xauth"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XAUTH_AVAILABLE
 	help
 	  X authority file utility
diff --git a/package/x11r7/xapp_xbacklight/Config.in b/package/x11r7/xapp_xbacklight/Config.in
index 9756235..4468add 100644
--- a/package/x11r7/xapp_xbacklight/Config.in
+++ b/package/x11r7/xapp_xbacklight/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_XBACKLIGHT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XBACKLIGHT
 	bool "xbacklight"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBXRENDER
+	depends on BR2_PACKAGE_XAPP_XBACKLIGHT_AVAILABLE
 	help
 	  xbacklight
diff --git a/package/x11r7/xapp_xbiff/Config.in b/package/x11r7/xapp_xbiff/Config.in
index ea4b58a..6e3701a 100644
--- a/package/x11r7/xapp_xbiff/Config.in
+++ b/package/x11r7/xapp_xbiff/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XBIFF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XBIFF
 	bool "xbiff"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XDATA_XBITMAPS
+	depends on BR2_PACKAGE_XAPP_XBIFF_AVAILABLE
 	help
 	  mailbox flag for X
diff --git a/package/x11r7/xapp_xcalc/Config.in b/package/x11r7/xapp_xcalc/Config.in
index 2552be0..9c80b7e 100644
--- a/package/x11r7/xapp_xcalc/Config.in
+++ b/package/x11r7/xapp_xcalc/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XCALC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XCALC
 	bool "xcalc"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XCALC_AVAILABLE
 	help
 	  scientific calculator for X
diff --git a/package/x11r7/xapp_xclipboard/Config.in b/package/x11r7/xapp_xclipboard/Config.in
index 941c219..b032770 100644
--- a/package/x11r7/xapp_xclipboard/Config.in
+++ b/package/x11r7/xapp_xclipboard/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XCLIPBOARD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XCLIPBOARD
 	bool "xclipboard"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XCLIPBOARD_AVAILABLE
 	help
 	  interchange between cut buffer and selection
diff --git a/package/x11r7/xapp_xclock/Config.in b/package/x11r7/xapp_xclock/Config.in
index 083a6d1..f2234ba 100644
--- a/package/x11r7/xapp_xclock/Config.in
+++ b/package/x11r7/xapp_xclock/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XAPP_XCLOCK_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XCLOCK
 	bool "xclock"
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -5,5 +8,6 @@ config BR2_PACKAGE_XAPP_XCLOCK
 	select BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	depends on BR2_PACKAGE_XAPP_XCLOCK_AVAILABLE
 	help
 	  analog / digital clock for X
diff --git a/package/x11r7/xapp_xcmsdb/Config.in b/package/x11r7/xapp_xcmsdb/Config.in
index 99c9cbb..1795970 100644
--- a/package/x11r7/xapp_xcmsdb/Config.in
+++ b/package/x11r7/xapp_xcmsdb/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XCMSDB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XCMSDB
 	bool "xcmsdb"
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_XCMSDB_AVAILABLE
 	help
 	  Device Color Characterization utility for X Color Management System
diff --git a/package/x11r7/xapp_xcursorgen/Config.in b/package/x11r7/xapp_xcursorgen/Config.in
index c47ec28..705c113 100644
--- a/package/x11r7/xapp_xcursorgen/Config.in
+++ b/package/x11r7/xapp_xcursorgen/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_XCURSORGEN_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XCURSORGEN
 	bool "xcursorgen"
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	depends on BR2_PACKAGE_XAPP_XCURSORGEN_AVAILABLE
 	help
 	  create an X cursor file from a collection of PNG images
diff --git a/package/x11r7/xapp_xdbedizzy/Config.in b/package/x11r7/xapp_xdbedizzy/Config.in
index 5cba398..c2d3020 100644
--- a/package/x11r7/xapp_xdbedizzy/Config.in
+++ b/package/x11r7/xapp_xdbedizzy/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_XDBEDIZZY_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XDBEDIZZY
 	bool "xdbedizzy"
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXP
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	depends on BR2_PACKAGE_XAPP_XDBEDIZZY_AVAILABLE
 	help
 	  X.Org xdbedizzy application
diff --git a/package/x11r7/xapp_xditview/Config.in b/package/x11r7/xapp_xditview/Config.in
index 22944f7..1c18c3f 100644
--- a/package/x11r7/xapp_xditview/Config.in
+++ b/package/x11r7/xapp_xditview/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XDITVIEW_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XDITVIEW
 	bool "xditview"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XDITVIEW_AVAILABLE
 	help
 	  display ditroff output
diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index b1c50d5..4de04ec 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XAPP_XDM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XDM
 	bool "xdm"
 	select BR2_PACKAGE_XAPP_XINIT
@@ -10,5 +13,6 @@ config BR2_PACKAGE_XAPP_XDM
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XAPP_XDM_AVAILABLE
 	help
 	  X.Org xdm application
diff --git a/package/x11r7/xapp_xdpyinfo/Config.in b/package/x11r7/xapp_xdpyinfo/Config.in
index e6ff686..803f0e2 100644
--- a/package/x11r7/xapp_xdpyinfo/Config.in
+++ b/package/x11r7/xapp_xdpyinfo/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XAPP_XDPYINFO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XDPYINFO
 	bool "xdpyinfo"
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -14,5 +17,6 @@ config BR2_PACKAGE_XAPP_XDPYINFO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
+	depends on BR2_PACKAGE_XAPP_XDPYINFO_AVAILABLE
 	help
 	  display information utility for X
diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index 970bff5..670cf21 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_XDRIINFO_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_MESA3D
+
 config BR2_PACKAGE_XAPP_XDRIINFO
 	bool "xdriinfo"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_GLPROTO
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_XAPP_XDRIINFO_AVAILABLE
 	help
 	  query configuration information of DRI drivers
diff --git a/package/x11r7/xapp_xedit/Config.in b/package/x11r7/xapp_xedit/Config.in
index 98e230d..828600c 100644
--- a/package/x11r7/xapp_xedit/Config.in
+++ b/package/x11r7/xapp_xedit/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XEDIT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XEDIT
 	bool "xedit"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	depends on BR2_PACKAGE_XAPP_XEDIT_AVAILABLE
 	help
 	  simple text editor for X
diff --git a/package/x11r7/xapp_xev/Config.in b/package/x11r7/xapp_xev/Config.in
index e2e05b3..e495b6a 100644
--- a/package/x11r7/xapp_xev/Config.in
+++ b/package/x11r7/xapp_xev/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XEV_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XEV
 	bool "xev"
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_XEV_AVAILABLE
 	help
 	  print contents of X events
diff --git a/package/x11r7/xapp_xeyes/Config.in b/package/x11r7/xapp_xeyes/Config.in
index a7b7737..0c72907 100644
--- a/package/x11r7/xapp_xeyes/Config.in
+++ b/package/x11r7/xapp_xeyes/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XAPP_XEYES_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XEYES
 	bool "xeyes"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
+	depends on BR2_PACKAGE_XAPP_XEYES_AVAILABLE
 	help
 	  X.Org xeyes application
diff --git a/package/x11r7/xapp_xf86dga/Config.in b/package/x11r7/xapp_xf86dga/Config.in
index 769ebf6..9f30122 100644
--- a/package/x11r7/xapp_xf86dga/Config.in
+++ b/package/x11r7/xapp_xf86dga/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XF86DGA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XF86DGA
 	bool "xf86dga"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXXF86DGA
+	depends on BR2_PACKAGE_XAPP_XF86DGA_AVAILABLE
 	help
 	  test program for the XFree86-DGA extension
diff --git a/package/x11r7/xapp_xfd/Config.in b/package/x11r7/xapp_xfd/Config.in
index f006b1e..1f2d787 100644
--- a/package/x11r7/xapp_xfd/Config.in
+++ b/package/x11r7/xapp_xfd/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XAPP_XFD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XFD
 	bool "xfd"
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXFT
+	depends on BR2_PACKAGE_XAPP_XFD_AVAILABLE
 	help
 	  X.Org xfd application
diff --git a/package/x11r7/xapp_xfontsel/Config.in b/package/x11r7/xapp_xfontsel/Config.in
index 0c6aa37..03ca2ef 100644
--- a/package/x11r7/xapp_xfontsel/Config.in
+++ b/package/x11r7/xapp_xfontsel/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XFONTSEL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XFONTSEL
 	bool "xfontsel"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XFONTSEL_AVAILABLE
 	help
 	  point and click selection of X11 font names
diff --git a/package/x11r7/xapp_xfs/Config.in b/package/x11r7/xapp_xfs/Config.in
index e71d89f..f72ab68 100644
--- a/package/x11r7/xapp_xfs/Config.in
+++ b/package/x11r7/xapp_xfs/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_XFS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XFS
 	bool "xfs"
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	depends on BR2_PACKAGE_XAPP_XFS_AVAILABLE
 	help
 	  X font server
diff --git a/package/x11r7/xapp_xfsinfo/Config.in b/package/x11r7/xapp_xfsinfo/Config.in
index 84c8ac1..c67ab1f 100644
--- a/package/x11r7/xapp_xfsinfo/Config.in
+++ b/package/x11r7/xapp_xfsinfo/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XFSINFO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XFSINFO
 	bool "xfsinfo"
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_XFSINFO_AVAILABLE
 	help
 	  X font server information utility
diff --git a/package/x11r7/xapp_xgamma/Config.in b/package/x11r7/xapp_xgamma/Config.in
index b20a784..442506e 100644
--- a/package/x11r7/xapp_xgamma/Config.in
+++ b/package/x11r7/xapp_xgamma/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XGAMMA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XGAMMA
 	bool "xgamma"
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	depends on BR2_PACKAGE_XAPP_XGAMMA_AVAILABLE
 	help
 	  Alter a monitor's gamma correction through the X server
diff --git a/package/x11r7/xapp_xgc/Config.in b/package/x11r7/xapp_xgc/Config.in
index 98faba8..375c838 100644
--- a/package/x11r7/xapp_xgc/Config.in
+++ b/package/x11r7/xapp_xgc/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XGC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XGC
 	bool "xgc"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XGC_AVAILABLE
 	help
 	  X graphics demo
diff --git a/package/x11r7/xapp_xhost/Config.in b/package/x11r7/xapp_xhost/Config.in
index 659b34d..910e35a 100644
--- a/package/x11r7/xapp_xhost/Config.in
+++ b/package/x11r7/xapp_xhost/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XHOST_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XHOST
 	bool "xhost"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XHOST_AVAILABLE
 	help
 	  Controls host and/or user access to a running X server.
diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
index 9ac2817..1ea946c 100644
--- a/package/x11r7/xapp_xinit/Config.in
+++ b/package/x11r7/xapp_xinit/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XINIT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XINIT
 	bool "xinit"
 	select BR2_PACKAGE_XAPP_XAUTH
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_XINIT_AVAILABLE
 	help
 	  X Window System initializer
diff --git a/package/x11r7/xapp_xinput/Config.in b/package/x11r7/xapp_xinput/Config.in
index 2505dd3..11a441f 100644
--- a/package/x11r7/xapp_xinput/Config.in
+++ b/package/x11r7/xapp_xinput/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XINPUT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XINPUT
 	bool "xinput"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXI
+	depends on BR2_PACKAGE_XAPP_XINPUT_AVAILABLE
 	help
 	  xinput
diff --git a/package/x11r7/xapp_xinput_calibrator/Config.in b/package/x11r7/xapp_xinput_calibrator/Config.in
index ac98b8d..fbe9c32 100644
--- a/package/x11r7/xapp_xinput_calibrator/Config.in
+++ b/package/x11r7/xapp_xinput_calibrator/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR
 	bool "xinput-calibrator"
-	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXI
+	depends on BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR_AVAILABLE
 	help
 	  A generic touchscreen calibration program for X.Org.
 
diff --git a/package/x11r7/xapp_xkbcomp/Config.in b/package/x11r7/xapp_xkbcomp/Config.in
index 2b575b2..78f08c9 100644
--- a/package/x11r7/xapp_xkbcomp/Config.in
+++ b/package/x11r7/xapp_xkbcomp/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XKBCOMP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XKBCOMP
 	bool "xkbcomp"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	depends on BR2_PACKAGE_XAPP_XKBCOMP_AVAILABLE
 	help
 	  compile XKB keyboard description
diff --git a/package/x11r7/xapp_xkbevd/Config.in b/package/x11r7/xapp_xkbevd/Config.in
index cf31565..40f6d80 100644
--- a/package/x11r7/xapp_xkbevd/Config.in
+++ b/package/x11r7/xapp_xkbevd/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XKBEVD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XKBEVD
 	bool "xkbevd"
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	depends on BR2_PACKAGE_XAPP_XKBEVD_AVAILABLE
 	help
 	  XKB event daemon
diff --git a/package/x11r7/xapp_xkbprint/Config.in b/package/x11r7/xapp_xkbprint/Config.in
index e7a4242..3ea8e20 100644
--- a/package/x11r7/xapp_xkbprint/Config.in
+++ b/package/x11r7/xapp_xkbprint/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XKBPRINT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XKBPRINT
 	bool "xkbprint"
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	depends on BR2_PACKAGE_XAPP_XKBPRINT_AVAILABLE
 	help
 	  print an XKB keyboard description
diff --git a/package/x11r7/xapp_xkbutils/Config.in b/package/x11r7/xapp_xkbutils/Config.in
index 22a819b..92354db 100644
--- a/package/x11r7/xapp_xkbutils/Config.in
+++ b/package/x11r7/xapp_xkbutils/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XKBUTILS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XKBUTILS
 	bool "xkbutils"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	depends on BR2_PACKAGE_XAPP_XKBUTILS_AVAILABLE
 	help
 	  X.Org xkbutils application
diff --git a/package/x11r7/xapp_xkill/Config.in b/package/x11r7/xapp_xkill/Config.in
index fcab92a..0981405 100644
--- a/package/x11r7/xapp_xkill/Config.in
+++ b/package/x11r7/xapp_xkill/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XKILL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XKILL
 	bool "xkill"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XKILL_AVAILABLE
 	help
 	  kill a client by its X resource
diff --git a/package/x11r7/xapp_xload/Config.in b/package/x11r7/xapp_xload/Config.in
index 25c79d2..536909d 100644
--- a/package/x11r7/xapp_xload/Config.in
+++ b/package/x11r7/xapp_xload/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XLOAD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XLOAD
 	bool "xload"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XLOAD_AVAILABLE
 	help
 	  system load average display for X
diff --git a/package/x11r7/xapp_xlogo/Config.in b/package/x11r7/xapp_xlogo/Config.in
index 04f779d..6f5f9d7 100644
--- a/package/x11r7/xapp_xlogo/Config.in
+++ b/package/x11r7/xapp_xlogo/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XAPP_XLOGO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XLOGO
 	bool "xlogo"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXFT
+	depends on BR2_PACKAGE_XAPP_XLOGO_AVAILABLE
 	help
 	  X Window System logo
diff --git a/package/x11r7/xapp_xlsatoms/Config.in b/package/x11r7/xapp_xlsatoms/Config.in
index 2ad8484..70f3a9e 100644
--- a/package/x11r7/xapp_xlsatoms/Config.in
+++ b/package/x11r7/xapp_xlsatoms/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XLSATOMS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XLSATOMS
 	bool "xlsatoms"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XLSATOMS_AVAILABLE
 	help
 	  list interned atoms defined on server
diff --git a/package/x11r7/xapp_xlsclients/Config.in b/package/x11r7/xapp_xlsclients/Config.in
index f8f6132..14f5bb8 100644
--- a/package/x11r7/xapp_xlsclients/Config.in
+++ b/package/x11r7/xapp_xlsclients/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XLSCLIENTS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XLSCLIENTS
 	bool "xlsclients"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XLSCLIENTS_AVAILABLE
 	help
 	  X.Org xlsclients application
diff --git a/package/x11r7/xapp_xlsfonts/Config.in b/package/x11r7/xapp_xlsfonts/Config.in
index dab61eb..f0ec061 100644
--- a/package/x11r7/xapp_xlsfonts/Config.in
+++ b/package/x11r7/xapp_xlsfonts/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XLSFONTS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XLSFONTS
 	bool "xlsfonts"
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_XLSFONTS_AVAILABLE
 	help
 	  X.Org xlsfonts application
diff --git a/package/x11r7/xapp_xmag/Config.in b/package/x11r7/xapp_xmag/Config.in
index 44d2c8e..3dbe45e 100644
--- a/package/x11r7/xapp_xmag/Config.in
+++ b/package/x11r7/xapp_xmag/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XMAG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XMAG
 	bool "xmag"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XMAG_AVAILABLE
 	help
 	  X.Org xmag application
diff --git a/package/x11r7/xapp_xman/Config.in b/package/x11r7/xapp_xman/Config.in
index 4f4f067..59de3e3 100644
--- a/package/x11r7/xapp_xman/Config.in
+++ b/package/x11r7/xapp_xman/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XMAN_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XMAN
 	bool "xman"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XMAN_AVAILABLE
 	help
 	  Manual page display program for the X Window System
diff --git a/package/x11r7/xapp_xmessage/Config.in b/package/x11r7/xapp_xmessage/Config.in
index e80562f..ead9e85 100644
--- a/package/x11r7/xapp_xmessage/Config.in
+++ b/package/x11r7/xapp_xmessage/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XMESSAGE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XMESSAGE
 	bool "xmessage"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XMESSAGE_AVAILABLE
 	help
 	  display a message or query in a window (X-based /bin/echo)
diff --git a/package/x11r7/xapp_xmh/Config.in b/package/x11r7/xapp_xmh/Config.in
index 3da965a..3c29311 100644
--- a/package/x11r7/xapp_xmh/Config.in
+++ b/package/x11r7/xapp_xmh/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XMH_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XMH
 	bool "xmh"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XMH_AVAILABLE
 	help
 	  send and read mail with an X interface to MH
diff --git a/package/x11r7/xapp_xmodmap/Config.in b/package/x11r7/xapp_xmodmap/Config.in
index 9be79ab..252e45e 100644
--- a/package/x11r7/xapp_xmodmap/Config.in
+++ b/package/x11r7/xapp_xmodmap/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XMODMAP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XMODMAP
 	bool "xmodmap"
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_XMODMAP_AVAILABLE
 	help
 	  utility for modifying keymaps and pointer button mappings in X
diff --git a/package/x11r7/xapp_xmore/Config.in b/package/x11r7/xapp_xmore/Config.in
index 23fd147..9b52ea0 100644
--- a/package/x11r7/xapp_xmore/Config.in
+++ b/package/x11r7/xapp_xmore/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XMORE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XMORE
 	bool "xmore"
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XMORE_AVAILABLE
 	help
 	  plain text display program for the X Window System
diff --git a/package/x11r7/xapp_xplsprinters/Config.in b/package/x11r7/xapp_xplsprinters/Config.in
index 16a139b..484be69 100644
--- a/package/x11r7/xapp_xplsprinters/Config.in
+++ b/package/x11r7/xapp_xplsprinters/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_XPLSPRINTERS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XPLSPRINTERS
 	bool "xplsprinters"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXP
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	depends on BR2_PACKAGE_XAPP_XPLSPRINTERS_AVAILABLE
 	help
 	  shows a list of Xprint printers and it's attributes
diff --git a/package/x11r7/xapp_xpr/Config.in b/package/x11r7/xapp_xpr/Config.in
index 0710d62..0b3971c 100644
--- a/package/x11r7/xapp_xpr/Config.in
+++ b/package/x11r7/xapp_xpr/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XPR_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XPR
 	bool "xpr"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XPR_AVAILABLE
 	help
 	  X.Org xpr application
diff --git a/package/x11r7/xapp_xprehashprinterlist/Config.in b/package/x11r7/xapp_xprehashprinterlist/Config.in
index 056fdb6..1514a1a 100644
--- a/package/x11r7/xapp_xprehashprinterlist/Config.in
+++ b/package/x11r7/xapp_xprehashprinterlist/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XPREHASHPRINTERLIST_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XPREHASHPRINTERLIST
 	bool "xprehashprinterlist"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXP
+	depends on BR2_PACKAGE_XAPP_XPREHASHPRINTERLIST_AVAILABLE
 	help
 	  Recomputes the list of available printers.
diff --git a/package/x11r7/xapp_xprop/Config.in b/package/x11r7/xapp_xprop/Config.in
index 314e79f..67877e3 100644
--- a/package/x11r7/xapp_xprop/Config.in
+++ b/package/x11r7/xapp_xprop/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XPROP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XPROP
 	bool "xprop"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XPROP_AVAILABLE
 	help
 	  property displayer for X
diff --git a/package/x11r7/xapp_xrandr/Config.in b/package/x11r7/xapp_xrandr/Config.in
index fe9bd4e..d1d507b 100644
--- a/package/x11r7/xapp_xrandr/Config.in
+++ b/package/x11r7/xapp_xrandr/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XRANDR_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XRANDR
 	bool "xrandr"
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_XRANDR_AVAILABLE
 	help
 	  primitive command line interface to RandR extension
diff --git a/package/x11r7/xapp_xrdb/Config.in b/package/x11r7/xapp_xrdb/Config.in
index 8c07857..6310e49 100644
--- a/package/x11r7/xapp_xrdb/Config.in
+++ b/package/x11r7/xapp_xrdb/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XRDB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XRDB
 	bool "xrdb"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XRDB_AVAILABLE
 	help
 	  X server resource database utility
diff --git a/package/x11r7/xapp_xrefresh/Config.in b/package/x11r7/xapp_xrefresh/Config.in
index 16b1e50..b897056 100644
--- a/package/x11r7/xapp_xrefresh/Config.in
+++ b/package/x11r7/xapp_xrefresh/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XREFRESH_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XREFRESH
 	bool "xrefresh"
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_XREFRESH_AVAILABLE
 	help
 	  refresh all or part of an X screen
diff --git a/package/x11r7/xapp_xset/Config.in b/package/x11r7/xapp_xset/Config.in
index ff697e5..c692fa0 100644
--- a/package/x11r7/xapp_xset/Config.in
+++ b/package/x11r7/xapp_xset/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XSET_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XSET
 	bool "xset"
 	select BR2_PACKAGE_XLIB_LIBXFONTCACHE
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XSET_AVAILABLE
 	help
 	  X.Org xset application
diff --git a/package/x11r7/xapp_xsetmode/Config.in b/package/x11r7/xapp_xsetmode/Config.in
index a08e02d..2d64a25 100644
--- a/package/x11r7/xapp_xsetmode/Config.in
+++ b/package/x11r7/xapp_xsetmode/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XSETMODE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XSETMODE
 	bool "xsetmode"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXI
+	depends on BR2_PACKAGE_XAPP_XSETMODE_AVAILABLE
 	help
 	  set the mode for an X Input device
diff --git a/package/x11r7/xapp_xsetpointer/Config.in b/package/x11r7/xapp_xsetpointer/Config.in
index 2b0b462..768fcf6 100644
--- a/package/x11r7/xapp_xsetpointer/Config.in
+++ b/package/x11r7/xapp_xsetpointer/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_XSETPOINTER_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XSETPOINTER
 	bool "xsetpointer"
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXI
+	depends on BR2_PACKAGE_XAPP_XSETPOINTER_AVAILABLE
 	help
 	  set an X Input device as the main pointer
diff --git a/package/x11r7/xapp_xsetroot/Config.in b/package/x11r7/xapp_xsetroot/Config.in
index 82c0dba..2e9e29d 100644
--- a/package/x11r7/xapp_xsetroot/Config.in
+++ b/package/x11r7/xapp_xsetroot/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XAPP_XSETROOT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XSETROOT
 	bool "xsetroot"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XDATA_XBITMAPS
+	depends on BR2_PACKAGE_XAPP_XSETROOT_AVAILABLE
 	help
 	  X.Org xsetroot application
diff --git a/package/x11r7/xapp_xsm/Config.in b/package/x11r7/xapp_xsm/Config.in
index d06dc6c..943ea7a 100644
--- a/package/x11r7/xapp_xsm/Config.in
+++ b/package/x11r7/xapp_xsm/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XSM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XSM
 	bool "xsm"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_PACKAGE_XAPP_XSM_AVAILABLE
 	help
 	  X Session Manager
diff --git a/package/x11r7/xapp_xstdcmap/Config.in b/package/x11r7/xapp_xstdcmap/Config.in
index f15c36b..117edd9 100644
--- a/package/x11r7/xapp_xstdcmap/Config.in
+++ b/package/x11r7/xapp_xstdcmap/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XSTDCMAP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XSTDCMAP
 	bool "xstdcmap"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XSTDCMAP_AVAILABLE
 	help
 	  X standard colormap utility
diff --git a/package/x11r7/xapp_xvidtune/Config.in b/package/x11r7/xapp_xvidtune/Config.in
index b1902cd..230090b 100644
--- a/package/x11r7/xapp_xvidtune/Config.in
+++ b/package/x11r7/xapp_xvidtune/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XVIDTUNE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XVIDTUNE
 	bool "xvidtune"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	depends on BR2_PACKAGE_XAPP_XVIDTUNE_AVAILABLE
 	help
 	  video mode tuner for Xorg
diff --git a/package/x11r7/xapp_xvinfo/Config.in b/package/x11r7/xapp_xvinfo/Config.in
index 2612c04..a0a99af 100644
--- a/package/x11r7/xapp_xvinfo/Config.in
+++ b/package/x11r7/xapp_xvinfo/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XVINFO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XVINFO
 	bool "xvinfo"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXV
+	depends on BR2_PACKAGE_XAPP_XVINFO_AVAILABLE
 	help
 	  Print out X-Video extension adaptor information
diff --git a/package/x11r7/xapp_xwd/Config.in b/package/x11r7/xapp_xwd/Config.in
index b7b3172..542b41c 100644
--- a/package/x11r7/xapp_xwd/Config.in
+++ b/package/x11r7/xapp_xwd/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XWD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XWD
 	bool "xwd"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XWD_AVAILABLE
 	help
 	  dump an image of an X window
diff --git a/package/x11r7/xapp_xwininfo/Config.in b/package/x11r7/xapp_xwininfo/Config.in
index 4e09570..738f78c 100644
--- a/package/x11r7/xapp_xwininfo/Config.in
+++ b/package/x11r7/xapp_xwininfo/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XAPP_XWININFO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XWININFO
 	bool "xwininfo"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_PACKAGE_XAPP_XWININFO_AVAILABLE
 	help
 	  window information utility for X
diff --git a/package/x11r7/xapp_xwud/Config.in b/package/x11r7/xapp_xwud/Config.in
index cb8337e..afa1f92 100644
--- a/package/x11r7/xapp_xwud/Config.in
+++ b/package/x11r7/xapp_xwud/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XAPP_XWUD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAPP_XWUD
 	bool "xwud"
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XAPP_XWUD_AVAILABLE
 	help
 	  image displayer for X
diff --git a/package/x11r7/xcb-proto/Config.in b/package/x11r7/xcb-proto/Config.in
index 4a6dfe4..ce79b41 100644
--- a/package/x11r7/xcb-proto/Config.in
+++ b/package/x11r7/xcb-proto/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XCB_PROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XCB_PROTO
 	bool "xcb-proto"
+	depends on BR2_PACKAGE_XCB_PROTO_AVAILABLE
 	help
 		The protocol headers that define XCB.
 
diff --git a/package/x11r7/xcb-util/Config.in b/package/x11r7/xcb-util/Config.in
index cf79327..e7e6555 100644
--- a/package/x11r7/xcb-util/Config.in
+++ b/package/x11r7/xcb-util/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XCB_UTIL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XCB_UTIL
 	bool "xcb-util"
+	depends on BR2_PACKAGE_XCB_UTIL_AVAILABLE
 	help
 	  Libraries which sit on top of libxcb, the core X protocol library,
 	  and some of the extension libraries.
diff --git a/package/x11r7/xdata_xbitmaps/Config.in b/package/x11r7/xdata_xbitmaps/Config.in
index 2308cae..be90d7a 100644
--- a/package/x11r7/xdata_xbitmaps/Config.in
+++ b/package/x11r7/xdata_xbitmaps/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XDATA_XBITMAPS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDATA_XBITMAPS
 	bool "xbitmaps"
+	depends on BR2_PACKAGE_XDATA_XBITMAPS_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xdata_xcursor-themes/Config.in b/package/x11r7/xdata_xcursor-themes/Config.in
index 78d1020..c138ab9 100644
--- a/package/x11r7/xdata_xcursor-themes/Config.in
+++ b/package/x11r7/xdata_xcursor-themes/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XDATA_XCURSOR_THEMES_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDATA_XCURSOR_THEMES
 	bool "xdata_xcursor-themes"
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	depends on BR2_PACKAGE_XDATA_XCURSOR_THEMES_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xdriver_xf86-input-acecad/Config.in b/package/x11r7/xdriver_xf86-input-acecad/Config.in
index 7e1838e..b720d6c 100644
--- a/package/x11r7/xdriver_xf86-input-acecad/Config.in
+++ b/package/x11r7/xdriver_xf86-input-acecad/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_ACECAD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_ACECAD
 	bool "xf86-input-acecad"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_INPUT_ACECAD_AVAILABLE
 	help
 	  Acecad Flair input driver
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/Config.in b/package/x11r7/xdriver_xf86-input-aiptek/Config.in
index 87fe5b3..6fc9539 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/Config.in
+++ b/package/x11r7/xdriver_xf86-input-aiptek/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_AIPTEK_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_AIPTEK
 	bool "xf86-input-aiptek"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_INPUT_AIPTEK_AVAILABLE
 	help
 	  Aiptek USB Digital Tablet Input Driver for Linux
diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
index 248be7e..ee4a124 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	bool "xf86-input-evdev"
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV_AVAILABLE
 	help
 	  Generic Linux input driver
diff --git a/package/x11r7/xdriver_xf86-input-joystick/Config.in b/package/x11r7/xdriver_xf86-input-joystick/Config.in
index 4a7439a..b823866 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/Config.in
+++ b/package/x11r7/xdriver_xf86-input-joystick/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK
 	bool "xf86-input-joystick"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK_AVAILABLE
 	help
 	  X.Org driver for joystick input devices
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/Config.in b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
index 481c763..0b3bcf2 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/Config.in
+++ b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
 	bool "xf86-input-keyboard"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -5,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
 	select BR2_PACKAGE_XPROTO_KBPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD_AVAILABLE
 	help
 	  Keyboard input driver
diff --git a/package/x11r7/xdriver_xf86-input-mouse/Config.in b/package/x11r7/xdriver_xf86-input-mouse/Config.in
index c8e39b0..80a2d9b 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-mouse/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
 	bool "xf86-input-mouse"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE_AVAILABLE
 	help
 	  X.Org driver for mouse input devices
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/Config.in b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
index 258dee2..f10dbe4 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/Config.in
+++ b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS
 	bool "xf86-input-synaptics"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS_AVAILABLE
 	help
 	  X.Org driver for synaptics input devices
diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
index 5185273..fc1868f 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	bool "xf86-input-tslib"
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
@@ -5,6 +8,7 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_TSLIB
+	depends on BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB_AVAILABLE
 	help
 	  Touch screen library input driver
 
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
index b2284cd..26aa758 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE_AVAILABLE
+	def_bool y
+	depends on BR2_i386 || BR2_x86_64
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE
 	bool "xf86-input-vmmouse"
-	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE_AVAILABLE
 	help
 	  VMWare mouse input driver
diff --git a/package/x11r7/xdriver_xf86-input-void/Config.in b/package/x11r7/xdriver_xf86-input-void/Config.in
index ab4230b..776f805 100644
--- a/package/x11r7/xdriver_xf86-input-void/Config.in
+++ b/package/x11r7/xdriver_xf86-input-void/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
 	bool "xf86-input-void"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID_AVAILABLE
 	help
 	  null input driver
diff --git a/package/x11r7/xdriver_xf86-video-apm/Config.in b/package/x11r7/xdriver_xf86-video-apm/Config.in
index dea5258..6f369eb 100644
--- a/package/x11r7/xdriver_xf86-video-apm/Config.in
+++ b/package/x11r7/xdriver_xf86-video-apm/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM
 	bool "xf86-video-apm"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -8,5 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86RUSHPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM_AVAILABLE
 	help
 	  Alliance ProMotion video driver
diff --git a/package/x11r7/xdriver_xf86-video-ark/Config.in b/package/x11r7/xdriver_xf86-video-ark/Config.in
index d9703de..064955b 100644
--- a/package/x11r7/xdriver_xf86-video-ark/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ark/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK
 	bool "xf86-video-ark"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -6,5 +9,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK_AVAILABLE
 	help
 	  X.Org driver for ark cards
diff --git a/package/x11r7/xdriver_xf86-video-ast/Config.in b/package/x11r7/xdriver_xf86-video-ast/Config.in
index b2a0bc8..2d1819c 100644
--- a/package/x11r7/xdriver_xf86-video-ast/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ast/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AST_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AST
 	bool "xf86-video-ast"
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_AST_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 107a57b..793193a 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -11,5 +14,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI_AVAILABLE
 	help
 	  ATI video driver
diff --git a/package/x11r7/xdriver_xf86-video-chips/Config.in b/package/x11r7/xdriver_xf86-video-chips/Config.in
index 29a99ec..55dd600 100644
--- a/package/x11r7/xdriver_xf86-video-chips/Config.in
+++ b/package/x11r7/xdriver_xf86-video-chips/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS
 	bool "xf86-video-chips"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -6,5 +9,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS_AVAILABLE
 	help
 	  Chips and Technologies video driver
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/Config.in b/package/x11r7/xdriver_xf86-video-cirrus/Config.in
index 31ed634..8aaa664 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/Config.in
+++ b/package/x11r7/xdriver_xf86-video-cirrus/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS
 	bool "xf86-video-cirrus"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS_AVAILABLE
 	help
 	  Cirrus Logic video driver
diff --git a/package/x11r7/xdriver_xf86-video-dummy/Config.in b/package/x11r7/xdriver_xf86-video-dummy/Config.in
index 2a172cc..cc8e988 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/Config.in
+++ b/package/x11r7/xdriver_xf86-video-dummy/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY
 	bool "xf86-video-dummy"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY_AVAILABLE
 	help
 	  X.Org driver for dummy cards
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/Config.in b/package/x11r7/xdriver_xf86-video-fbdev/Config.in
index 8907fe1..46c567d 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/Config.in
+++ b/package/x11r7/xdriver_xf86-video-fbdev/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV
 	bool "xf86-video-fbdev"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -6,5 +9,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV_AVAILABLE
 	help
 	  video driver for framebuffer device
diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index c60b62c..c589823 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	bool "xf86-video-geode"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -6,5 +9,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE_AVAILABLE
 	help
 	  video driver for geode device
diff --git a/package/x11r7/xdriver_xf86-video-glide/Config.in b/package/x11r7/xdriver_xf86-video-glide/Config.in
index ea9abd7..cc9559d 100644
--- a/package/x11r7/xdriver_xf86-video-glide/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glide/Config.in
@@ -1,3 +1,7 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE_AVAILABLE
+	def_bool y
+	depends on BROKEN # needs glide library from http://glide.sourceforge.net/
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE
 	bool "xf86-video-glide"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -6,6 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
-	depends on BROKEN # needs glide library from http://glide.sourceforge.net/
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE_AVAILABLE
 	help
 	  video driver for glide device
diff --git a/package/x11r7/xdriver_xf86-video-glint/Config.in b/package/x11r7/xdriver_xf86-video-glint/Config.in
index 782b6da..9f5edca 100644
--- a/package/x11r7/xdriver_xf86-video-glint/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glint/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
 	bool "xf86-video-glint"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -12,5 +15,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT_AVAILABLE
 	help
 	  GLINT/Permedia video driver
diff --git a/package/x11r7/xdriver_xf86-video-i128/Config.in b/package/x11r7/xdriver_xf86-video-i128/Config.in
index a66fda6..6e49475 100644
--- a/package/x11r7/xdriver_xf86-video-i128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-i128/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128
 	bool "xf86-video-i128"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128_AVAILABLE
 	help
 	  Number 9 I128 video driver
diff --git a/package/x11r7/xdriver_xf86-video-i740/Config.in b/package/x11r7/xdriver_xf86-video-i740/Config.in
index 9d1a040..363ceb7 100644
--- a/package/x11r7/xdriver_xf86-video-i740/Config.in
+++ b/package/x11r7/xdriver_xf86-video-i740/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I740_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I740
 	bool "xf86-video-i740"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I740
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_I740_AVAILABLE
 	help
 	  Intel i740 video driver
diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index 9a1d6cf..ca938f8 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	bool "xf86-video-intel"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -8,5 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL_AVAILABLE
 	help
 	  Intel video driver
diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
index f2464e7..d6d10f7 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mach64/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	bool "xf86-video-mach64"
 	select BR2_PACKAGE_MESA3D
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64_AVAILABLE
 	help
 	  mach64 video driver
diff --git a/package/x11r7/xdriver_xf86-video-mga/Config.in b/package/x11r7/xdriver_xf86-video-mga/Config.in
index 40c6f3a..ef06083 100644
--- a/package/x11r7/xdriver_xf86-video-mga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mga/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
 	bool "xf86-video-mga"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -11,5 +14,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA_AVAILABLE
 	help
 	  Matrox video driver
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/Config.in b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
index 2e028a7..7faf833 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/Config.in
+++ b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC
 	bool "xf86-video-neomagic"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -8,5 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC_AVAILABLE
 	help
 	  Neomagic video driver
diff --git a/package/x11r7/xdriver_xf86-video-newport/Config.in b/package/x11r7/xdriver_xf86-video-newport/Config.in
index e2effe8..aee66de 100644
--- a/package/x11r7/xdriver_xf86-video-newport/Config.in
+++ b/package/x11r7/xdriver_xf86-video-newport/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT
 	bool "xf86-video-newport"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -6,5 +9,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT_AVAILABLE
 	help
 	  Newport video driver
diff --git a/package/x11r7/xdriver_xf86-video-nv/Config.in b/package/x11r7/xdriver_xf86-video-nv/Config.in
index 943bc14..ab3cd8f 100644
--- a/package/x11r7/xdriver_xf86-video-nv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-nv/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV
 	bool "xf86-video-nv"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV_AVAILABLE
 	help
 	  NVIDIA video driver
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index 4a69246..5aa5917 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	bool "xf86-video-openchrome"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -12,6 +15,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME_AVAILABLE
 	help
 	  Openchrome, A free and Open Source video driver for the VIA/S3G
 	  UniChrome and UniChrome Pro graphics chipsets.
diff --git a/package/x11r7/xdriver_xf86-video-r128/Config.in b/package/x11r7/xdriver_xf86-video-r128/Config.in
index 96bd8d7..3fbea5c 100644
--- a/package/x11r7/xdriver_xf86-video-r128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-r128/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
 	bool "xf86-video-r128"
 	select BR2_PACKAGE_MESA3D
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128_AVAILABLE
 	help
 	  R128 video driver
diff --git a/package/x11r7/xdriver_xf86-video-rendition/Config.in b/package/x11r7/xdriver_xf86-video-rendition/Config.in
index 9238aec..aa4d69e 100644
--- a/package/x11r7/xdriver_xf86-video-rendition/Config.in
+++ b/package/x11r7/xdriver_xf86-video-rendition/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION
 	bool "xf86-video-rendition"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -6,5 +9,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION_AVAILABLE
 	help
 	  Rendition video driver
diff --git a/package/x11r7/xdriver_xf86-video-s3/Config.in b/package/x11r7/xdriver_xf86-video-s3/Config.in
index 1091028..e82ebfd 100644
--- a/package/x11r7/xdriver_xf86-video-s3/Config.in
+++ b/package/x11r7/xdriver_xf86-video-s3/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3
 	bool "xf86-video-s3"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3_AVAILABLE
 	help
 	  X.Org driver for s3 cards
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/Config.in b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
index 6f31864..ff51138 100644
--- a/package/x11r7/xdriver_xf86-video-s3virge/Config.in
+++ b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE
 	bool "xf86-video-s3virge"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE_AVAILABLE
 	help
 	  S3 ViRGE video driver
diff --git a/package/x11r7/xdriver_xf86-video-savage/Config.in b/package/x11r7/xdriver_xf86-video-savage/Config.in
index a9c8f6c..03bfe8b 100644
--- a/package/x11r7/xdriver_xf86-video-savage/Config.in
+++ b/package/x11r7/xdriver_xf86-video-savage/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
 	bool "xf86-video-savage"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -10,5 +13,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE_AVAILABLE
 	help
 	  S3 Savage video driver
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
index db15116..5ad4c6b 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION
 	bool "xf86-video-siliconmotion"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION_AVAILABLE
 	help
 	  Silicon Motion video driver
diff --git a/package/x11r7/xdriver_xf86-video-sis/Config.in b/package/x11r7/xdriver_xf86-video-sis/Config.in
index ac2b632..9d676be 100644
--- a/package/x11r7/xdriver_xf86-video-sis/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sis/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
 	bool "xf86-video-sis"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -12,5 +15,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS_AVAILABLE
 	help
 	  SiS and XGI video driver
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/Config.in b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
index b00a8a7..56b8e52 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB
 	bool "xf86-video-sisusb"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -8,5 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB_AVAILABLE
 	help
 	  SiS USB video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg14/Config.in b/package/x11r7/xdriver_xf86-video-suncg14/Config.in
index 661c179..e963973 100644
--- a/package/x11r7/xdriver_xf86-video-suncg14/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg14/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG14_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG14
 	bool "xf86-video-suncg14"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -5,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG14
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG14_AVAILABLE
 	help
 	  CG14 video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/Config.in b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
index 539a95a..f689c01 100644
--- a/package/x11r7/xdriver_xf86-video-suncg3/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3
 	bool "xf86-video-suncg3"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -5,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3_AVAILABLE
 	help
 	  CG3 video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/Config.in b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
index 9496f8d..c5dcbf4 100644
--- a/package/x11r7/xdriver_xf86-video-suncg6/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6
 	bool "xf86-video-suncg6"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -5,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6_AVAILABLE
 	help
 	  GX/Turbo GX video driver
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/Config.in b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
index 76f5b9a..4e91610 100644
--- a/package/x11r7/xdriver_xf86-video-sunffb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB
 	bool "xf86-video-sunffb"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -8,5 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB_AVAILABLE
 	help
 	  SUNFFB video driver
diff --git a/package/x11r7/xdriver_xf86-video-sunleo/Config.in b/package/x11r7/xdriver_xf86-video-sunleo/Config.in
index 29d24a2..712110b 100644
--- a/package/x11r7/xdriver_xf86-video-sunleo/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sunleo/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNLEO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNLEO
 	bool "xf86-video-sunleo"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -5,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNLEO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNLEO_AVAILABLE
 	help
 	  Leo video driver
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/Config.in b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
index 3c82739..eab688f 100644
--- a/package/x11r7/xdriver_xf86-video-suntcx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX
 	bool "xf86-video-suntcx"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -5,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX_AVAILABLE
 	help
 	  TCX video driver
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/Config.in b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
index 57bb411..4c1a3f6 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
 	bool "xf86-video-tdfx"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -10,5 +13,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX_AVAILABLE
 	help
 	  3Dfx video driver
diff --git a/package/x11r7/xdriver_xf86-video-tga/Config.in b/package/x11r7/xdriver_xf86-video-tga/Config.in
index 800a8f6..346ee47 100644
--- a/package/x11r7/xdriver_xf86-video-tga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tga/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
 	bool "xf86-video-tga"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -8,5 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA_AVAILABLE
 	help
 	  X.Org driver for tga cards
diff --git a/package/x11r7/xdriver_xf86-video-trident/Config.in b/package/x11r7/xdriver_xf86-video-trident/Config.in
index 4a7a477..e6ee3e4 100644
--- a/package/x11r7/xdriver_xf86-video-trident/Config.in
+++ b/package/x11r7/xdriver_xf86-video-trident/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT
 	bool "xf86-video-trident"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -8,5 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT_AVAILABLE
 	help
 	  Trident video driver
diff --git a/package/x11r7/xdriver_xf86-video-tseng/Config.in b/package/x11r7/xdriver_xf86-video-tseng/Config.in
index f72b87b..6b9cf43 100644
--- a/package/x11r7/xdriver_xf86-video-tseng/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tseng/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG
 	bool "xf86-video-tseng"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG_AVAILABLE
 	help
 	  Tseng Labs video driver
diff --git a/package/x11r7/xdriver_xf86-video-v4l/Config.in b/package/x11r7/xdriver_xf86-video-v4l/Config.in
index 3bb41fc..a6a154f 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/Config.in
+++ b/package/x11r7/xdriver_xf86-video-v4l/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_V4L_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_V4L
 	bool "xf86-video-v4l"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_V4L_AVAILABLE
 	help
 	  video4linux driver
diff --git a/package/x11r7/xdriver_xf86-video-vesa/Config.in b/package/x11r7/xdriver_xf86-video-vesa/Config.in
index 865f52c..426fd43 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vesa/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA
 	bool "xf86-video-vesa"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -6,5 +9,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA_AVAILABLE
 	help
 	  Generic VESA video driver
diff --git a/package/x11r7/xdriver_xf86-video-vmware/Config.in b/package/x11r7/xdriver_xf86-video-vmware/Config.in
index 9093b38..ab5de69 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vmware/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
 	bool "xf86-video-vmware"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE_AVAILABLE
 	help
 	  VMware SVGA video driver
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/Config.in b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
index 9b770be..7b8d9a9 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/Config.in
+++ b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO
 	bool "xf86-video-voodoo"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO_AVAILABLE
 	help
 	  Voodoo video driver
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/Config.in b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
index 3b3d406..c8e8b99 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
@@ -1,3 +1,7 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB_AVAILABLE
+	def_bool y
+	depends on BROKEN # Fails to build. Actually this is OpenBSD/NetBSD stuff.
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB
 	bool "xf86-video-wsfb"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
@@ -6,6 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
-	depends on BROKEN # Fails to build. Actually this is OpenBSD/NetBSD stuff.
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB_AVAILABLE
 	help
 	  WSFB based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-xgi/Config.in b/package/x11r7/xdriver_xf86-video-xgi/Config.in
index d0fe665..b758324 100644
--- a/package/x11r7/xdriver_xf86-video-xgi/Config.in
+++ b/package/x11r7/xdriver_xf86-video-xgi/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI
 	bool "xf86-video-xgi"
 	select BR2_PACKAGE_MESA3D
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI_AVAILABLE
 	help
 	  XGI based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/Config.in b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
index 8d466f4..52a80ec 100644
--- a/package/x11r7/xdriver_xf86-video-xgixp/Config.in
+++ b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP
 	bool "xf86-video-xgixp"
 	select BR2_PACKAGE_MESA3D
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP_AVAILABLE
 	help
 	  XGIXP based chips video driver
diff --git a/package/x11r7/xfont_encodings/Config.in b/package/x11r7/xfont_encodings/Config.in
index af40da1..e29bd2b 100644
--- a/package/x11r7/xfont_encodings/Config.in
+++ b/package/x11r7/xfont_encodings/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_ENCODINGS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_ENCODINGS
 	bool "encodings"
+	depends on BR2_PACKAGE_XFONT_ENCODINGS_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-100dpi/Config.in b/package/x11r7/xfont_font-adobe-100dpi/Config.in
index aaac639..8134869 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-100dpi/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_ADOBE_100DPI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_ADOBE_100DPI
 	bool "font-adobe-100dpi"
+	depends on BR2_PACKAGE_XFONT_FONT_ADOBE_100DPI_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-75dpi/Config.in b/package/x11r7/xfont_font-adobe-75dpi/Config.in
index f1c0a41..d48a5ee 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-75dpi/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_ADOBE_75DPI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_ADOBE_75DPI
 	bool "font-adobe-75dpi"
+	depends on BR2_PACKAGE_XFONT_FONT_ADOBE_75DPI_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in b/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
index 02f2aeb..7141b16 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI
 	bool "font-adobe-utopia-100dpi"
+	depends on BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in b/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
index 4a6e29c..7002afc 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI
 	bool "font-adobe-utopia-75dpi"
+	depends on BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/Config.in b/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
index d1efb70..36c41ff 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1
 	bool "font-adobe-utopia-type1"
+	depends on BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-alias/Config.in b/package/x11r7/xfont_font-alias/Config.in
index b655160..63c2913 100644
--- a/package/x11r7/xfont_font-alias/Config.in
+++ b/package/x11r7/xfont_font-alias/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_ALIAS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_ALIAS
 	bool "font-alias"
+	depends on BR2_PACKAGE_XFONT_FONT_ALIAS_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-arabic-misc/Config.in b/package/x11r7/xfont_font-arabic-misc/Config.in
index acbdf7c..5850c3f 100644
--- a/package/x11r7/xfont_font-arabic-misc/Config.in
+++ b/package/x11r7/xfont_font-arabic-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_ARABIC_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_ARABIC_MISC
 	bool "font-arabic-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_ARABIC_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-100dpi/Config.in b/package/x11r7/xfont_font-bh-100dpi/Config.in
index dc405a2..09d468b 100644
--- a/package/x11r7/xfont_font-bh-100dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-100dpi/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_BH_100DPI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_BH_100DPI
 	bool "font-bh-100dpi"
+	depends on BR2_PACKAGE_XFONT_FONT_BH_100DPI_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-75dpi/Config.in b/package/x11r7/xfont_font-bh-75dpi/Config.in
index 6cd334e..33d5135 100644
--- a/package/x11r7/xfont_font-bh-75dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-75dpi/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_BH_75DPI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_BH_75DPI
 	bool "font-bh-75dpi"
+	depends on BR2_PACKAGE_XFONT_FONT_BH_75DPI_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
index 0e082d5..5a3122c 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI
 	bool "font-bh-lucidatypewriter-100dpi"
+	depends on BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
index 126fb85..07e9c86 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI
 	bool "font-bh-lucidatypewriter-75dpi"
+	depends on BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-ttf/Config.in b/package/x11r7/xfont_font-bh-ttf/Config.in
index 2590798..9f56478 100644
--- a/package/x11r7/xfont_font-bh-ttf/Config.in
+++ b/package/x11r7/xfont_font-bh-ttf/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_BH_TTF_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_BH_TTF
 	bool "font-bh-ttf"
+	depends on BR2_PACKAGE_XFONT_FONT_BH_TTF_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-type1/Config.in b/package/x11r7/xfont_font-bh-type1/Config.in
index 047268c..9e598b7 100644
--- a/package/x11r7/xfont_font-bh-type1/Config.in
+++ b/package/x11r7/xfont_font-bh-type1/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_BH_TYPE1_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_BH_TYPE1
 	bool "font-bh-type1"
+	depends on BR2_PACKAGE_XFONT_FONT_BH_TYPE1_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/Config.in b/package/x11r7/xfont_font-bitstream-100dpi/Config.in
index 81393c5..e5ed91e 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/Config.in
+++ b/package/x11r7/xfont_font-bitstream-100dpi/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_BITSTREAM_100DPI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_100DPI
 	bool "font-bitstream-100dpi"
+	depends on BR2_PACKAGE_XFONT_FONT_BITSTREAM_100DPI_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/Config.in b/package/x11r7/xfont_font-bitstream-75dpi/Config.in
index bada475..40c5b82 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/Config.in
+++ b/package/x11r7/xfont_font-bitstream-75dpi/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_BITSTREAM_75DPI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_75DPI
 	bool "font-bitstream-75dpi"
+	depends on BR2_PACKAGE_XFONT_FONT_BITSTREAM_75DPI_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-speedo/Config.in b/package/x11r7/xfont_font-bitstream-speedo/Config.in
index 70750f6..b2d94ee 100644
--- a/package/x11r7/xfont_font-bitstream-speedo/Config.in
+++ b/package/x11r7/xfont_font-bitstream-speedo/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_BITSTREAM_SPEEDO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_SPEEDO
 	bool "font-bitstream-speedo"
+	depends on BR2_PACKAGE_XFONT_FONT_BITSTREAM_SPEEDO_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-type1/Config.in b/package/x11r7/xfont_font-bitstream-type1/Config.in
index d482a6d..eac0566 100644
--- a/package/x11r7/xfont_font-bitstream-type1/Config.in
+++ b/package/x11r7/xfont_font-bitstream-type1/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_BITSTREAM_TYPE1_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_TYPE1
 	bool "font-bitstream-type1"
+	depends on BR2_PACKAGE_XFONT_FONT_BITSTREAM_TYPE1_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/Config.in b/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
index a0085f5..80439f7 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_CRONYX_CYRILLIC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_CRONYX_CYRILLIC
 	bool "font-cronyx-cyrillic"
+	depends on BR2_PACKAGE_XFONT_FONT_CRONYX_CYRILLIC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-cursor-misc/Config.in b/package/x11r7/xfont_font-cursor-misc/Config.in
index 03ed530..11d60dc 100644
--- a/package/x11r7/xfont_font-cursor-misc/Config.in
+++ b/package/x11r7/xfont_font-cursor-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_CURSOR_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_CURSOR_MISC
 	bool "font-cursor-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_CURSOR_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-daewoo-misc/Config.in b/package/x11r7/xfont_font-daewoo-misc/Config.in
index 9e45341..62562ee 100644
--- a/package/x11r7/xfont_font-daewoo-misc/Config.in
+++ b/package/x11r7/xfont_font-daewoo-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_DAEWOO_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_DAEWOO_MISC
 	bool "font-daewoo-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_DAEWOO_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-dec-misc/Config.in b/package/x11r7/xfont_font-dec-misc/Config.in
index 326ea9b..3cc39b5 100644
--- a/package/x11r7/xfont_font-dec-misc/Config.in
+++ b/package/x11r7/xfont_font-dec-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_DEC_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_DEC_MISC
 	bool "font-dec-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_DEC_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-ibm-type1/Config.in b/package/x11r7/xfont_font-ibm-type1/Config.in
index 92783af..a42c105 100644
--- a/package/x11r7/xfont_font-ibm-type1/Config.in
+++ b/package/x11r7/xfont_font-ibm-type1/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_IBM_TYPE1_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_IBM_TYPE1
 	bool "font-ibm-type1"
+	depends on BR2_PACKAGE_XFONT_FONT_IBM_TYPE1_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-isas-misc/Config.in b/package/x11r7/xfont_font-isas-misc/Config.in
index 2e77f66..d10d432 100644
--- a/package/x11r7/xfont_font-isas-misc/Config.in
+++ b/package/x11r7/xfont_font-isas-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_ISAS_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_ISAS_MISC
 	bool "font-isas-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_ISAS_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-jis-misc/Config.in b/package/x11r7/xfont_font-jis-misc/Config.in
index 6a59cce..b13f018 100644
--- a/package/x11r7/xfont_font-jis-misc/Config.in
+++ b/package/x11r7/xfont_font-jis-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_JIS_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_JIS_MISC
 	bool "font-jis-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_JIS_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-micro-misc/Config.in b/package/x11r7/xfont_font-micro-misc/Config.in
index 1420cbd..c2a7e01 100644
--- a/package/x11r7/xfont_font-micro-misc/Config.in
+++ b/package/x11r7/xfont_font-micro-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_MICRO_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_MICRO_MISC
 	bool "font-micro-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_MICRO_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-cyrillic/Config.in b/package/x11r7/xfont_font-misc-cyrillic/Config.in
index e793d70..b771179 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-misc-cyrillic/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_MISC_CYRILLIC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_MISC_CYRILLIC
 	bool "font-misc-cyrillic"
+	depends on BR2_PACKAGE_XFONT_FONT_MISC_CYRILLIC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-ethiopic/Config.in b/package/x11r7/xfont_font-misc-ethiopic/Config.in
index aa3b834..5145243 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/Config.in
+++ b/package/x11r7/xfont_font-misc-ethiopic/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_MISC_ETHIOPIC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_MISC_ETHIOPIC
 	bool "font-misc-ethiopic"
+	depends on BR2_PACKAGE_XFONT_FONT_MISC_ETHIOPIC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-meltho/Config.in b/package/x11r7/xfont_font-misc-meltho/Config.in
index dcc6c84..8a9c2a3 100644
--- a/package/x11r7/xfont_font-misc-meltho/Config.in
+++ b/package/x11r7/xfont_font-misc-meltho/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_MISC_MELTHO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_MISC_MELTHO
 	bool "font-misc-meltho"
+	depends on BR2_PACKAGE_XFONT_FONT_MISC_MELTHO_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-misc/Config.in b/package/x11r7/xfont_font-misc-misc/Config.in
index b3e4fc1..066309a 100644
--- a/package/x11r7/xfont_font-misc-misc/Config.in
+++ b/package/x11r7/xfont_font-misc-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_MISC_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_MISC_MISC
 	bool "font-misc-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_MISC_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-mutt-misc/Config.in b/package/x11r7/xfont_font-mutt-misc/Config.in
index e27ea74..cdec328 100644
--- a/package/x11r7/xfont_font-mutt-misc/Config.in
+++ b/package/x11r7/xfont_font-mutt-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_MUTT_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_MUTT_MISC
 	bool "font-mutt-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_MUTT_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-schumacher-misc/Config.in b/package/x11r7/xfont_font-schumacher-misc/Config.in
index d37babc..2826b80 100644
--- a/package/x11r7/xfont_font-schumacher-misc/Config.in
+++ b/package/x11r7/xfont_font-schumacher-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_SCHUMACHER_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_SCHUMACHER_MISC
 	bool "font-schumacher-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_SCHUMACHER_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-screen-cyrillic/Config.in b/package/x11r7/xfont_font-screen-cyrillic/Config.in
index a1f02d0..c4da2a8 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-screen-cyrillic/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_SCREEN_CYRILLIC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_SCREEN_CYRILLIC
 	bool "font-screen-cyrillic"
+	depends on BR2_PACKAGE_XFONT_FONT_SCREEN_CYRILLIC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-sony-misc/Config.in b/package/x11r7/xfont_font-sony-misc/Config.in
index a4ce4ab..bdcbeeb 100644
--- a/package/x11r7/xfont_font-sony-misc/Config.in
+++ b/package/x11r7/xfont_font-sony-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_SONY_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_SONY_MISC
 	bool "font-sony-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_SONY_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-sun-misc/Config.in b/package/x11r7/xfont_font-sun-misc/Config.in
index 07603a1..37c4332 100644
--- a/package/x11r7/xfont_font-sun-misc/Config.in
+++ b/package/x11r7/xfont_font-sun-misc/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_SUN_MISC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_SUN_MISC
 	bool "font-sun-misc"
+	depends on BR2_PACKAGE_XFONT_FONT_SUN_MISC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-util/Config.in b/package/x11r7/xfont_font-util/Config.in
index 4edeffd..6578f77 100644
--- a/package/x11r7/xfont_font-util/Config.in
+++ b/package/x11r7/xfont_font-util/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_UTIL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_UTIL
 	bool "font-util"
+	depends on BR2_PACKAGE_XFONT_FONT_UTIL_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/Config.in b/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
index c804441..a16c0ab 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_WINITZKI_CYRILLIC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_WINITZKI_CYRILLIC
 	bool "font-winitzki-cyrillic"
+	depends on BR2_PACKAGE_XFONT_FONT_WINITZKI_CYRILLIC_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-xfree86-type1/Config.in b/package/x11r7/xfont_font-xfree86-type1/Config.in
index b7d0587..48e50ea 100644
--- a/package/x11r7/xfont_font-xfree86-type1/Config.in
+++ b/package/x11r7/xfont_font-xfree86-type1/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XFONT_FONT_XFREE86_TYPE1_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XFONT_FONT_XFREE86_TYPE1
 	bool "font-xfree86-type1"
+	depends on BR2_PACKAGE_XFONT_FONT_XFREE86_TYPE1_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xkeyboard-config/Config.in b/package/x11r7/xkeyboard-config/Config.in
index 8e27dac..a4c49da 100644
--- a/package/x11r7/xkeyboard-config/Config.in
+++ b/package/x11r7/xkeyboard-config/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XKEYBOARD_CONFIG_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XKEYBOARD_CONFIG
 	bool "xkeyboard-config"
 	select BR2_PACKAGE_XAPP_XKBCOMP
+	depends on BR2_PACKAGE_XKEYBOARD_CONFIG_AVAILABLE
 	help
 	  keyboard configuration database for X
 
diff --git a/package/x11r7/xlib_libFS/Config.in b/package/x11r7/xlib_libFS/Config.in
index 0c8a729..bfe8ec1 100644
--- a/package/x11r7/xlib_libFS/Config.in
+++ b/package/x11r7/xlib_libFS/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBFS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBFS
 	bool "libFS"
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	depends on BR2_PACKAGE_XLIB_LIBFS_AVAILABLE
 	help
 	  X.Org FS library
diff --git a/package/x11r7/xlib_libICE/Config.in b/package/x11r7/xlib_libICE/Config.in
index d63f935..7286d81 100644
--- a/package/x11r7/xlib_libICE/Config.in
+++ b/package/x11r7/xlib_libICE/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XLIB_LIBICE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBICE
 	bool "libICE"
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBICE_AVAILABLE
 	help
 	  X.Org ICE library
diff --git a/package/x11r7/xlib_libSM/Config.in b/package/x11r7/xlib_libSM/Config.in
index ef83b53..0646e58 100644
--- a/package/x11r7/xlib_libSM/Config.in
+++ b/package/x11r7/xlib_libSM/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBSM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBSM
 	bool "libSM"
 	select BR2_PACKAGE_XLIB_LIBICE
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBSM_AVAILABLE
 	help
 	  X.Org SM library
diff --git a/package/x11r7/xlib_libX11/Config.in b/package/x11r7/xlib_libX11/Config.in
index e1189ff..9915d36 100644
--- a/package/x11r7/xlib_libX11/Config.in
+++ b/package/x11r7/xlib_libX11/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBX11
 	bool "libX11"
 	select BR2_PACKAGE_LIBXCB
@@ -12,5 +15,6 @@ config BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
 	select BR2_PACKAGE_XPROTO_BIGREQSPROTO
 	select BR2_PACKAGE_XPROTO_XCMISCPROTO
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 	help
 	  X.Org X11 library
diff --git a/package/x11r7/xlib_libXScrnSaver/Config.in b/package/x11r7/xlib_libXScrnSaver/Config.in
index 5df9a00..098c8dc 100644
--- a/package/x11r7/xlib_libXScrnSaver/Config.in
+++ b/package/x11r7/xlib_libXScrnSaver/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBXSCRNSAVER_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXSCRNSAVER
 	bool "libXScrnSaver"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXSCRNSAVER_AVAILABLE
 	help
 	  X.Org XScrnSaver library
diff --git a/package/x11r7/xlib_libXau/Config.in b/package/x11r7/xlib_libXau/Config.in
index a220f01..e6e2815 100644
--- a/package/x11r7/xlib_libXau/Config.in
+++ b/package/x11r7/xlib_libXau/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XLIB_LIBXAU_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXAU
 	bool "libXau"
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	depends on BR2_PACKAGE_XLIB_LIBXAU_AVAILABLE
 	help
 	  X.Org Xau library
diff --git a/package/x11r7/xlib_libXaw/Config.in b/package/x11r7/xlib_libXaw/Config.in
index 1c10bc0..5bcbbd0 100644
--- a/package/x11r7/xlib_libXaw/Config.in
+++ b/package/x11r7/xlib_libXaw/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXAW
 	bool "libXaw"
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -6,5 +9,6 @@ config BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXPM
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XLIB_LIBXP
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 	help
 	  X.Org Xaw library
diff --git a/package/x11r7/xlib_libXcomposite/Config.in b/package/x11r7/xlib_libXcomposite/Config.in
index 14da977..17d2dae 100644
--- a/package/x11r7/xlib_libXcomposite/Config.in
+++ b/package/x11r7/xlib_libXcomposite/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBXCOMPOSITE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	bool "libXcomposite"
 	select BR2_PACKAGE_XPROTO_COMPOSITEPROTO
@@ -5,5 +8,6 @@ config BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXCOMPOSITE_AVAILABLE
 	help
 	  X.Org Xcomposite library
diff --git a/package/x11r7/xlib_libXcursor/Config.in b/package/x11r7/xlib_libXcursor/Config.in
index 6519cc7..46ac040 100644
--- a/package/x11r7/xlib_libXcursor/Config.in
+++ b/package/x11r7/xlib_libXcursor/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXCURSOR_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXCURSOR
 	bool "libXcursor"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXCURSOR_AVAILABLE
 	help
 	  X.Org Xcursor library
diff --git a/package/x11r7/xlib_libXdamage/Config.in b/package/x11r7/xlib_libXdamage/Config.in
index 2427486..6e4facc 100644
--- a/package/x11r7/xlib_libXdamage/Config.in
+++ b/package/x11r7/xlib_libXdamage/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXDAMAGE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXDAMAGE
 	bool "libXdamage"
 	select BR2_PACKAGE_XPROTO_DAMAGEPROTO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXDAMAGE_AVAILABLE
 	help
 	  X.Org Xdamage library
diff --git a/package/x11r7/xlib_libXdmcp/Config.in b/package/x11r7/xlib_libXdmcp/Config.in
index 218ff15..7e4266c 100644
--- a/package/x11r7/xlib_libXdmcp/Config.in
+++ b/package/x11r7/xlib_libXdmcp/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XLIB_LIBXDMCP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXDMCP
 	bool "libXdmcp"
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXDMCP_AVAILABLE
 	help
 	  X.Org Xdmcp library
diff --git a/package/x11r7/xlib_libXext/Config.in b/package/x11r7/xlib_libXext/Config.in
index 823a165..8d7b2c3 100644
--- a/package/x11r7/xlib_libXext/Config.in
+++ b/package/x11r7/xlib_libXext/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXEXT
 	bool "libXext"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
 	help
 	  X.Org Xext library
diff --git a/package/x11r7/xlib_libXfixes/Config.in b/package/x11r7/xlib_libXfixes/Config.in
index 9bbabb2..fdc134f 100644
--- a/package/x11r7/xlib_libXfixes/Config.in
+++ b/package/x11r7/xlib_libXfixes/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXFIXES_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXFIXES
 	bool "libXfixes"
 	select BR2_PACKAGE_XPROTO_FIXESPROTO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXFIXES_AVAILABLE
 	help
 	  X.Org Xfixes library
diff --git a/package/x11r7/xlib_libXfont/Config.in b/package/x11r7/xlib_libXfont/Config.in
index 407a099..ec4d48e 100644
--- a/package/x11r7/xlib_libXfont/Config.in
+++ b/package/x11r7/xlib_libXfont/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBXFONT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXFONT
 	bool "libXfont"
 	select BR2_PACKAGE_FREETYPE
@@ -7,5 +10,6 @@ config BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XFONT_ENCODINGS
+	depends on BR2_PACKAGE_XLIB_LIBXFONT_AVAILABLE
 	help
 	  X.Org Xfont library
diff --git a/package/x11r7/xlib_libXfontcache/Config.in b/package/x11r7/xlib_libXfontcache/Config.in
index 3a20451..e40c9cd 100644
--- a/package/x11r7/xlib_libXfontcache/Config.in
+++ b/package/x11r7/xlib_libXfontcache/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBXFONTCACHE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXFONTCACHE
 	bool "libXfontcache"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_FONTCACHEPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXFONTCACHE_AVAILABLE
 	help
 	  X.Org Xfontcache library
diff --git a/package/x11r7/xlib_libXft/Config.in b/package/x11r7/xlib_libXft/Config.in
index 6eef170..6e1dab0 100644
--- a/package/x11r7/xlib_libXft/Config.in
+++ b/package/x11r7/xlib_libXft/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBXFT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXFT
 	bool "libXft"
 	select BR2_PACKAGE_FONTCONFIG
@@ -6,5 +9,6 @@ config BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXFT_AVAILABLE
 	help
 	  X.Org Xft library
diff --git a/package/x11r7/xlib_libXi/Config.in b/package/x11r7/xlib_libXi/Config.in
index ca5ab59..cdb2622 100644
--- a/package/x11r7/xlib_libXi/Config.in
+++ b/package/x11r7/xlib_libXi/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXI
 	bool "libXi"
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXI_AVAILABLE
 	help
 	  X.Org Xi library
diff --git a/package/x11r7/xlib_libXinerama/Config.in b/package/x11r7/xlib_libXinerama/Config.in
index 5a79b4e..5c07517 100644
--- a/package/x11r7/xlib_libXinerama/Config.in
+++ b/package/x11r7/xlib_libXinerama/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBXINERAMA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXINERAMA
 	bool "libXinerama"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXINERAMA_AVAILABLE
 	help
 	  X.Org Xinerama library
diff --git a/package/x11r7/xlib_libXmu/Config.in b/package/x11r7/xlib_libXmu/Config.in
index ed239dc..4bc3333 100644
--- a/package/x11r7/xlib_libXmu/Config.in
+++ b/package/x11r7/xlib_libXmu/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXMU
 	bool "libXmu"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
 	help
 	  X.Org Xmu library
diff --git a/package/x11r7/xlib_libXp/Config.in b/package/x11r7/xlib_libXp/Config.in
index 532d8ac..eb0298c 100644
--- a/package/x11r7/xlib_libXp/Config.in
+++ b/package/x11r7/xlib_libXp/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXP
 	bool "libXp"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_PRINTPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXP_AVAILABLE
 	help
 	  X.Org Xp library
diff --git a/package/x11r7/xlib_libXpm/Config.in b/package/x11r7/xlib_libXpm/Config.in
index 528498c..f83b881 100644
--- a/package/x11r7/xlib_libXpm/Config.in
+++ b/package/x11r7/xlib_libXpm/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXPM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXPM
 	bool "libXpm"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXPM_AVAILABLE
 	help
 	  X.Org Xpm library
diff --git a/package/x11r7/xlib_libXprintAppUtil/Config.in b/package/x11r7/xlib_libXprintAppUtil/Config.in
index 351675a..3ebf84f 100644
--- a/package/x11r7/xlib_libXprintAppUtil/Config.in
+++ b/package/x11r7/xlib_libXprintAppUtil/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL
 	bool "libXprintAppUtil"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXP
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	depends on BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL_AVAILABLE
 	help
 	  X.Org XprintAppUtil library
diff --git a/package/x11r7/xlib_libXprintUtil/Config.in b/package/x11r7/xlib_libXprintUtil/Config.in
index 1f397f4..c437dca 100644
--- a/package/x11r7/xlib_libXprintUtil/Config.in
+++ b/package/x11r7/xlib_libXprintUtil/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXPRINTUTIL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	bool "libXprintUtil"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXP
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_PRINTPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXPRINTUTIL_AVAILABLE
 	help
 	  X.Org XprintUtil library
diff --git a/package/x11r7/xlib_libXrandr/Config.in b/package/x11r7/xlib_libXrandr/Config.in
index 3b3ebd5..2243a7a 100644
--- a/package/x11r7/xlib_libXrandr/Config.in
+++ b/package/x11r7/xlib_libXrandr/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBXRANDR_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXRANDR
 	bool "libXrandr"
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
@@ -6,5 +9,6 @@ config BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXRANDR_AVAILABLE
 	help
 	  X.Org Xrandr library
diff --git a/package/x11r7/xlib_libXrender/Config.in b/package/x11r7/xlib_libXrender/Config.in
index c723e4d..b5f8d76 100644
--- a/package/x11r7/xlib_libXrender/Config.in
+++ b/package/x11r7/xlib_libXrender/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBXRENDER_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXRENDER
 	bool "libXrender"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXRENDER_AVAILABLE
 	help
 	  X.Org Xrender library
diff --git a/package/x11r7/xlib_libXres/Config.in b/package/x11r7/xlib_libXres/Config.in
index 39abbbf..a511ff6 100644
--- a/package/x11r7/xlib_libXres/Config.in
+++ b/package/x11r7/xlib_libXres/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXRES_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXRES
 	bool "libXres"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXRES_AVAILABLE
 	help
 	  X.Org XRes library
diff --git a/package/x11r7/xlib_libXt/Config.in b/package/x11r7/xlib_libXt/Config.in
index 6557e20..8c7c74a 100644
--- a/package/x11r7/xlib_libXt/Config.in
+++ b/package/x11r7/xlib_libXt/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXT
 	bool "libXt"
 	select BR2_PACKAGE_XLIB_LIBSM
@@ -6,5 +9,6 @@ config BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XCB_PROTO
 	select BR2_PACKAGE_LIBXCB
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 	help
 	  X.Org Xt library
diff --git a/package/x11r7/xlib_libXtst/Config.in b/package/x11r7/xlib_libXtst/Config.in
index 8853bde..0e5067c 100644
--- a/package/x11r7/xlib_libXtst/Config.in
+++ b/package/x11r7/xlib_libXtst/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXTST_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXTST
 	bool "libXtst"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_RECORDPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXTST_AVAILABLE
 	help
 	  X.Org Xtst library
diff --git a/package/x11r7/xlib_libXv/Config.in b/package/x11r7/xlib_libXv/Config.in
index 90f07f3..d9da0ef 100644
--- a/package/x11r7/xlib_libXv/Config.in
+++ b/package/x11r7/xlib_libXv/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXV_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXV
 	bool "libXv"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXV_AVAILABLE
 	help
 	  X.Org Xv library
diff --git a/package/x11r7/xlib_libXvMC/Config.in b/package/x11r7/xlib_libXvMC/Config.in
index 90c0e74..50784ed 100644
--- a/package/x11r7/xlib_libXvMC/Config.in
+++ b/package/x11r7/xlib_libXvMC/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBXVMC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXVMC
 	bool "libXvMC"
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -5,5 +8,6 @@ config BR2_PACKAGE_XLIB_LIBXVMC
 	select BR2_PACKAGE_XLIB_LIBXV
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXVMC_AVAILABLE
 	help
 	  X.Org XvMC library
diff --git a/package/x11r7/xlib_libXxf86dga/Config.in b/package/x11r7/xlib_libXxf86dga/Config.in
index 5e21502..4bcdd74 100644
--- a/package/x11r7/xlib_libXxf86dga/Config.in
+++ b/package/x11r7/xlib_libXxf86dga/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXXF86DGA_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXXF86DGA
 	bool "libXxf86dga"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXXF86DGA_AVAILABLE
 	help
 	  X.Org Xxf86dga library
diff --git a/package/x11r7/xlib_libXxf86vm/Config.in b/package/x11r7/xlib_libXxf86vm/Config.in
index 9e32188..41a36bd 100644
--- a/package/x11r7/xlib_libXxf86vm/Config.in
+++ b/package/x11r7/xlib_libXxf86vm/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XLIB_LIBXXF86VM_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXXF86VM
 	bool "libXxf86vm"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXXF86VM_AVAILABLE
 	help
 	  X.Org Xxf86vm library
diff --git a/package/x11r7/xlib_libdmx/Config.in b/package/x11r7/xlib_libdmx/Config.in
index 879f689..d1d3b8b 100644
--- a/package/x11r7/xlib_libdmx/Config.in
+++ b/package/x11r7/xlib_libdmx/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBDMX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBDMX
 	bool "libdmx"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_DMXPROTO
+	depends on BR2_PACKAGE_XLIB_LIBDMX_AVAILABLE
 	help
 	  X.Org dmx library
diff --git a/package/x11r7/xlib_libfontenc/Config.in b/package/x11r7/xlib_libfontenc/Config.in
index d2a3023..ccf26b8 100644
--- a/package/x11r7/xlib_libfontenc/Config.in
+++ b/package/x11r7/xlib_libfontenc/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XLIB_LIBFONTENC_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBFONTENC
 	bool "libfontenc"
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_PACKAGE_XLIB_LIBFONTENC_AVAILABLE
 	help
 	  X.Org fontenc library
diff --git a/package/x11r7/xlib_liboldX/Config.in b/package/x11r7/xlib_liboldX/Config.in
index e312921..5ad792e 100644
--- a/package/x11r7/xlib_liboldX/Config.in
+++ b/package/x11r7/xlib_liboldX/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XLIB_LIBOLDX_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBOLDX
 	bool "liboldX"
 	select BR2_PACKAGE_XLIB_LIBX11
+	depends on BR2_PACKAGE_XLIB_LIBOLDX_AVAILABLE
 	help
 	  X.Org oldX library
diff --git a/package/x11r7/xlib_libpciaccess/Config.in b/package/x11r7/xlib_libpciaccess/Config.in
index b53aa31..62f062f 100644
--- a/package/x11r7/xlib_libpciaccess/Config.in
+++ b/package/x11r7/xlib_libpciaccess/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XLIB_LIBPCIACCESS_AVAILABLE
+	def_bool y
+	depends on BR2_LARGEFILE
+
 config BR2_PACKAGE_XLIB_LIBPCIACCESS
 	bool "libpciaccess"
-	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_XLIB_LIBPCIACCESS_AVAILABLE
 	help
 	  X.Org libpciaccess
 
diff --git a/package/x11r7/xlib_libxkbfile/Config.in b/package/x11r7/xlib_libxkbfile/Config.in
index ccd35fa..cb61e21 100644
--- a/package/x11r7/xlib_libxkbfile/Config.in
+++ b/package/x11r7/xlib_libxkbfile/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XLIB_LIBXKBFILE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXKBFILE
 	bool "libxkbfile"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_KBPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXKBFILE_AVAILABLE
 	help
 	  X.Org xkbfile library
diff --git a/package/x11r7/xlib_libxkbui/Config.in b/package/x11r7/xlib_libxkbui/Config.in
index ceab305..d852ee2 100644
--- a/package/x11r7/xlib_libxkbui/Config.in
+++ b/package/x11r7/xlib_libxkbui/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBXKBUI_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_LIBXKBUI
 	bool "libxkbui"
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_KBPROTO
+	depends on BR2_PACKAGE_XLIB_LIBXKBUI_AVAILABLE
 	help
 	  X.Org xkbui library
diff --git a/package/x11r7/xlib_xtrans/Config.in b/package/x11r7/xlib_xtrans/Config.in
index 7c8bae7..c73780b 100644
--- a/package/x11r7/xlib_xtrans/Config.in
+++ b/package/x11r7/xlib_xtrans/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XLIB_XTRANS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XLIB_XTRANS
 	bool "xtrans"
+	depends on BR2_PACKAGE_XLIB_XTRANS_AVAILABLE
 	help
 	  X.Org xtrans library
diff --git a/package/x11r7/xproto_applewmproto/Config.in b/package/x11r7/xproto_applewmproto/Config.in
index 51a5fd5..c328fae 100644
--- a/package/x11r7/xproto_applewmproto/Config.in
+++ b/package/x11r7/xproto_applewmproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_APPLEWMPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_APPLEWMPROTO
 	bool "applewmproto"
+	depends on BR2_PACKAGE_XPROTO_APPLEWMPROTO_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xproto_bigreqsproto/Config.in b/package/x11r7/xproto_bigreqsproto/Config.in
index c431ef2..3f73cae 100644
--- a/package/x11r7/xproto_bigreqsproto/Config.in
+++ b/package/x11r7/xproto_bigreqsproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_BIGREQSPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_BIGREQSPROTO
 	bool "bigreqsproto"
+	depends on BR2_PACKAGE_XPROTO_BIGREQSPROTO_AVAILABLE
 	help
 	  X.Org BigReqs protocol headers
diff --git a/package/x11r7/xproto_compositeproto/Config.in b/package/x11r7/xproto_compositeproto/Config.in
index 136900a..fe6173c 100644
--- a/package/x11r7/xproto_compositeproto/Config.in
+++ b/package/x11r7/xproto_compositeproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_COMPOSITEPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_COMPOSITEPROTO
 	bool "compositeproto"
+	depends on BR2_PACKAGE_XPROTO_COMPOSITEPROTO_AVAILABLE
 	help
 	  X.Org Composite protocol headers
diff --git a/package/x11r7/xproto_damageproto/Config.in b/package/x11r7/xproto_damageproto/Config.in
index 068ed2b..317ac10 100644
--- a/package/x11r7/xproto_damageproto/Config.in
+++ b/package/x11r7/xproto_damageproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_DAMAGEPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_DAMAGEPROTO
 	bool "damageproto"
+	depends on BR2_PACKAGE_XPROTO_DAMAGEPROTO_AVAILABLE
 	help
 	  X.Org Damage protocol headers
diff --git a/package/x11r7/xproto_dmxproto/Config.in b/package/x11r7/xproto_dmxproto/Config.in
index dc048b1..174bae3 100644
--- a/package/x11r7/xproto_dmxproto/Config.in
+++ b/package/x11r7/xproto_dmxproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_DMXPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_DMXPROTO
 	bool "dmxproto"
+	depends on BR2_PACKAGE_XPROTO_DMXPROTO_AVAILABLE
 	help
 	  X.Org DMX protocol headers
diff --git a/package/x11r7/xproto_dri2proto/Config.in b/package/x11r7/xproto_dri2proto/Config.in
index 3fe5aa1..6bac3d1 100644
--- a/package/x11r7/xproto_dri2proto/Config.in
+++ b/package/x11r7/xproto_dri2proto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_DRI2PROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_DRI2PROTO
 	bool "dri2proto"
+	depends on BR2_PACKAGE_XPROTO_DRI2PROTO_AVAILABLE
 	help
 	  X.Org DRI2 protocol headers
diff --git a/package/x11r7/xproto_fixesproto/Config.in b/package/x11r7/xproto_fixesproto/Config.in
index d419fa1..c5fee23 100644
--- a/package/x11r7/xproto_fixesproto/Config.in
+++ b/package/x11r7/xproto_fixesproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_FIXESPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_FIXESPROTO
 	bool "fixesproto"
+	depends on BR2_PACKAGE_XPROTO_FIXESPROTO_AVAILABLE
 	help
 	  X.Org Fixes protocol headers
diff --git a/package/x11r7/xproto_fontcacheproto/Config.in b/package/x11r7/xproto_fontcacheproto/Config.in
index daa6c7f..d1fef1c 100644
--- a/package/x11r7/xproto_fontcacheproto/Config.in
+++ b/package/x11r7/xproto_fontcacheproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_FONTCACHEPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_FONTCACHEPROTO
 	bool "fontcacheproto"
+	depends on BR2_PACKAGE_XPROTO_FONTCACHEPROTO_AVAILABLE
 	help
 	  X.Org Fontcache protocol headers
diff --git a/package/x11r7/xproto_fontsproto/Config.in b/package/x11r7/xproto_fontsproto/Config.in
index b00220c..dfdebd9 100644
--- a/package/x11r7/xproto_fontsproto/Config.in
+++ b/package/x11r7/xproto_fontsproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_FONTSPROTO
 	bool "fontsproto"
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 	help
 	  X.Org Fonts protocol headers
diff --git a/package/x11r7/xproto_glproto/Config.in b/package/x11r7/xproto_glproto/Config.in
index 28ceb9c..4a7941d 100644
--- a/package/x11r7/xproto_glproto/Config.in
+++ b/package/x11r7/xproto_glproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_GLPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_GLPROTO
 	bool "glproto"
+	depends on BR2_PACKAGE_XPROTO_GLPROTO_AVAILABLE
 	help
 	  X.Org GL protocol headers
diff --git a/package/x11r7/xproto_inputproto/Config.in b/package/x11r7/xproto_inputproto/Config.in
index fcccb26..fc32030 100644
--- a/package/x11r7/xproto_inputproto/Config.in
+++ b/package/x11r7/xproto_inputproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_INPUTPROTO
 	bool "inputproto"
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
 	help
 	  X.Org Input protocol headers
diff --git a/package/x11r7/xproto_kbproto/Config.in b/package/x11r7/xproto_kbproto/Config.in
index ce568d7..41ff4e7 100644
--- a/package/x11r7/xproto_kbproto/Config.in
+++ b/package/x11r7/xproto_kbproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_KBPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_KBPROTO
 	bool "kbproto"
+	depends on BR2_PACKAGE_XPROTO_KBPROTO_AVAILABLE
 	help
 	  X.Org KB protocol headers
diff --git a/package/x11r7/xproto_printproto/Config.in b/package/x11r7/xproto_printproto/Config.in
index 69e214f..3067089 100644
--- a/package/x11r7/xproto_printproto/Config.in
+++ b/package/x11r7/xproto_printproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_PRINTPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_PRINTPROTO
 	bool "printproto"
+	depends on BR2_PACKAGE_XPROTO_PRINTPROTO_AVAILABLE
 	help
 	  X.Org Print protocol headers
diff --git a/package/x11r7/xproto_randrproto/Config.in b/package/x11r7/xproto_randrproto/Config.in
index 097ec8f..b6938ff 100644
--- a/package/x11r7/xproto_randrproto/Config.in
+++ b/package/x11r7/xproto_randrproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_RANDRPROTO
 	bool "randrproto"
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
 	help
 	  X.Org Randr protocol headers
diff --git a/package/x11r7/xproto_recordproto/Config.in b/package/x11r7/xproto_recordproto/Config.in
index 9fd5b88..3265c79 100644
--- a/package/x11r7/xproto_recordproto/Config.in
+++ b/package/x11r7/xproto_recordproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_RECORDPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_RECORDPROTO
 	bool "recordproto"
+	depends on BR2_PACKAGE_XPROTO_RECORDPROTO_AVAILABLE
 	help
 	  X.Org Record protocol headers
diff --git a/package/x11r7/xproto_renderproto/Config.in b/package/x11r7/xproto_renderproto/Config.in
index 5b5806f..00d7dde 100644
--- a/package/x11r7/xproto_renderproto/Config.in
+++ b/package/x11r7/xproto_renderproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_RENDERPROTO
 	bool "renderproto"
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
 	help
 	  X.Org Render protocol headers
diff --git a/package/x11r7/xproto_resourceproto/Config.in b/package/x11r7/xproto_resourceproto/Config.in
index 4aec708..9f73608 100644
--- a/package/x11r7/xproto_resourceproto/Config.in
+++ b/package/x11r7/xproto_resourceproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_RESOURCEPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_RESOURCEPROTO
 	bool "resourceproto"
+	depends on BR2_PACKAGE_XPROTO_RESOURCEPROTO_AVAILABLE
 	help
 	  X.Org Resource protocol headers
diff --git a/package/x11r7/xproto_scrnsaverproto/Config.in b/package/x11r7/xproto_scrnsaverproto/Config.in
index 83176a0..45830e2 100644
--- a/package/x11r7/xproto_scrnsaverproto/Config.in
+++ b/package/x11r7/xproto_scrnsaverproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_SCRNSAVERPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
 	bool "scrnsaverproto"
+	depends on BR2_PACKAGE_XPROTO_SCRNSAVERPROTO_AVAILABLE
 	help
 	  X.Org ScrnSaver protocol headers
diff --git a/package/x11r7/xproto_videoproto/Config.in b/package/x11r7/xproto_videoproto/Config.in
index 271c78f..d80ecb5 100644
--- a/package/x11r7/xproto_videoproto/Config.in
+++ b/package/x11r7/xproto_videoproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_VIDEOPROTO
 	bool "videoproto"
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
 	help
 	  X.Org Video protocol headers
diff --git a/package/x11r7/xproto_windowswmproto/Config.in b/package/x11r7/xproto_windowswmproto/Config.in
index d1a36ac..a5b1391 100644
--- a/package/x11r7/xproto_windowswmproto/Config.in
+++ b/package/x11r7/xproto_windowswmproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_WINDOWSWMPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_WINDOWSWMPROTO
 	bool "windowswmproto"
+	depends on BR2_PACKAGE_XPROTO_WINDOWSWMPROTO_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xproto_xcmiscproto/Config.in b/package/x11r7/xproto_xcmiscproto/Config.in
index f7ba153..54c54d5 100644
--- a/package/x11r7/xproto_xcmiscproto/Config.in
+++ b/package/x11r7/xproto_xcmiscproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_XCMISCPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_XCMISCPROTO
 	bool "xcmiscproto"
+	depends on BR2_PACKAGE_XPROTO_XCMISCPROTO_AVAILABLE
 	help
 	  X.Org XCMisc protocol headers
diff --git a/package/x11r7/xproto_xextproto/Config.in b/package/x11r7/xproto_xextproto/Config.in
index d80d76c..816fbd4 100644
--- a/package/x11r7/xproto_xextproto/Config.in
+++ b/package/x11r7/xproto_xextproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_XEXTPROTO
 	bool "xextproto"
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
 	help
 	  X.Org XExt protocol headers
diff --git a/package/x11r7/xproto_xf86bigfontproto/Config.in b/package/x11r7/xproto_xf86bigfontproto/Config.in
index 7af30d0..9719b08 100644
--- a/package/x11r7/xproto_xf86bigfontproto/Config.in
+++ b/package/x11r7/xproto_xf86bigfontproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
 	bool "xf86bigfontproto"
+	depends on BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO_AVAILABLE
 	help
 	  X.Org XF86BigFont protocol headers
diff --git a/package/x11r7/xproto_xf86dgaproto/Config.in b/package/x11r7/xproto_xf86dgaproto/Config.in
index 7561b8a..751d872 100644
--- a/package/x11r7/xproto_xf86dgaproto/Config.in
+++ b/package/x11r7/xproto_xf86dgaproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	bool "xf86dgaproto"
+	depends on BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
 	help
 	  X.Org XF86DGA protocol headers
diff --git a/package/x11r7/xproto_xf86driproto/Config.in b/package/x11r7/xproto_xf86driproto/Config.in
index 8aeac87..48a92f7 100644
--- a/package/x11r7/xproto_xf86driproto/Config.in
+++ b/package/x11r7/xproto_xf86driproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_XF86DRIPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	bool "xf86driproto"
+	depends on BR2_PACKAGE_XPROTO_XF86DRIPROTO_AVAILABLE
 	help
 	  X.Org XF86DRI protocol headers
diff --git a/package/x11r7/xproto_xf86rushproto/Config.in b/package/x11r7/xproto_xf86rushproto/Config.in
index 961c31f..bf2017b 100644
--- a/package/x11r7/xproto_xf86rushproto/Config.in
+++ b/package/x11r7/xproto_xf86rushproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_XF86RUSHPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_XF86RUSHPROTO
 	bool "xf86rushproto"
+	depends on BR2_PACKAGE_XPROTO_XF86RUSHPROTO_AVAILABLE
 	help
 	  X.Org XF86Rush protocol headers
diff --git a/package/x11r7/xproto_xf86vidmodeproto/Config.in b/package/x11r7/xproto_xf86vidmodeproto/Config.in
index 395c175..0f97b9f 100644
--- a/package/x11r7/xproto_xf86vidmodeproto/Config.in
+++ b/package/x11r7/xproto_xf86vidmodeproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	bool "xf86vidmodeproto"
+	depends on BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO_AVAILABLE
 	help
 	  X.Org XF86VidMode protocol headers
diff --git a/package/x11r7/xproto_xineramaproto/Config.in b/package/x11r7/xproto_xineramaproto/Config.in
index 12c8e05..0f570c2 100644
--- a/package/x11r7/xproto_xineramaproto/Config.in
+++ b/package/x11r7/xproto_xineramaproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_XINERAMAPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	bool "xineramaproto"
+	depends on BR2_PACKAGE_XPROTO_XINERAMAPROTO_AVAILABLE
 	help
 	  X.Org Xinerama protocol headers
diff --git a/package/x11r7/xproto_xproto/Config.in b/package/x11r7/xproto_xproto/Config.in
index a5f88ef..7669d35 100644
--- a/package/x11r7/xproto_xproto/Config.in
+++ b/package/x11r7/xproto_xproto/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XPROTO_XPROTO
 	bool "xproto"
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 	help
 	  X.Org xproto protocol headers
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index ddc03c6..8de8fd1 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,3 +1,7 @@
+config BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	def_bool y
+	depends on !BR2_avr32
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XSERVER_xorg
@@ -48,7 +52,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
-	depends on !BR2_avr32
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
 	help
 	  xorg-server 1.7.5
 	  No description available
diff --git a/package/x11r7/xutil_makedepend/Config.in b/package/x11r7/xutil_makedepend/Config.in
index 0b091b0..b141316 100644
--- a/package/x11r7/xutil_makedepend/Config.in
+++ b/package/x11r7/xutil_makedepend/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XUTIL_MAKEDEPEND_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XUTIL_MAKEDEPEND
 	bool "makedepend"
+	depends on BR2_PACKAGE_XUTIL_MAKEDEPEND_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11r7/xutil_util-macros/Config.in b/package/x11r7/xutil_util-macros/Config.in
index 10b1a59..787c52f 100644
--- a/package/x11r7/xutil_util-macros/Config.in
+++ b/package/x11r7/xutil_util-macros/Config.in
@@ -1,4 +1,8 @@
+config BR2_PACKAGE_XUTIL_UTIL_MACROS_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XUTIL_UTIL_MACROS
 	bool "util-macros"
+	depends on BR2_PACKAGE_XUTIL_UTIL_MACROS_AVAILABLE
 	help
 	  No description available
diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index fdb3bad..61f2327 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_X11VNC_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_X11VNC
 	bool "x11vnc"
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT
+	depends on BR2_PACKAGE_X11VNC_AVAILABLE
 	help
 	  VNC server for X11 display
diff --git a/package/xavante/Config.in b/package/xavante/Config.in
index db34d66..c534520 100644
--- a/package/xavante/Config.in
+++ b/package/xavante/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_XAVANTE_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XAVANTE
 	bool "xavante"
 	select BR2_PACKAGE_CGILUA
@@ -6,6 +9,7 @@ config BR2_PACKAGE_XAVANTE
 	select BR2_PACKAGE_LUAFILESYSTEM
 	select BR2_PACKAGE_LUASOCKET
 	select BR2_PACKAGE_WSAPI
+	depends on BR2_PACKAGE_XAVANTE_AVAILABLE
 	help
 	  Xavante is a Lua HTTP 1.1 Web server that uses a modular
 	  architecture based on URI mapped handlers.
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index ecab23e..bef3f41 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,7 +1,11 @@
-config BR2_PACKAGE_XENOMAI
-	bool "Xenomai Userspace"
+config BR2_PACKAGE_XENOMAI_AVAILABLE
+	def_bool y
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
 		   BR2_bfin || BR2_powerpc || BR2_sh4
+
+config BR2_PACKAGE_XENOMAI
+	bool "Xenomai Userspace"
+	depends on BR2_PACKAGE_XENOMAI_AVAILABLE
 	help
 	  Real-Time Framework for Linux
 	  http://www.xenomai.org
diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 374729a..78cabd1 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XERCES_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
+
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
-	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
+	depends on BR2_PACKAGE_XERCES_AVAILABLE
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index fda068f..2c03807 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -5,12 +5,16 @@ comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and UCL
 comment "xfsprogs requires a toolchain with LARGEFILE + WCHAR support"
         depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
-config BR2_PACKAGE_XFSPROGS
-	bool "xfsprogs"
+config BR2_PACKAGE_XFSPROGS_AVAILABLE
+	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
+
+config BR2_PACKAGE_XFSPROGS
+	bool "xfsprogs"
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	depends on BR2_PACKAGE_XFSPROGS_AVAILABLE
 	help
 	  The XFS file system utilities and libraries
 
diff --git a/package/xinetd/Config.in b/package/xinetd/Config.in
index 76fe603..e53504e 100644
--- a/package/xinetd/Config.in
+++ b/package/xinetd/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XINETD_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XINETD
 	bool "xinetd"
+	depends on BR2_PACKAGE_XINETD_AVAILABLE
 	help
 	  xinetd is a secure replacement for inetd. It was originally written by
 	  panos at cs.colorado.edu.
diff --git a/package/xl2tp/Config.in b/package/xl2tp/Config.in
index 8f9d9b1..18f47f1 100644
--- a/package/xl2tp/Config.in
+++ b/package/xl2tp/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_XL2TP_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XL2TP
 	bool "xl2tp"
 	select BR2_PACKAGE_LIBPCAP
+	depends on BR2_PACKAGE_XL2TP_AVAILABLE
 	help
 	  Layer 2 Tunnelling Protocol (RFC2661).
 
diff --git a/package/xmlstarlet/Config.in b/package/xmlstarlet/Config.in
index 99762b8..0fcfe72 100644
--- a/package/xmlstarlet/Config.in
+++ b/package/xmlstarlet/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XMLSTARLET_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XMLSTARLET
 	bool "xmlstarlet"
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_XMLSTARLET_AVAILABLE
 	help
 	  Command Line XML Toolkit
 
diff --git a/package/xstroke/Config.in b/package/xstroke/Config.in
index 5589fe6..4325263 100644
--- a/package/xstroke/Config.in
+++ b/package/xstroke/Config.in
@@ -1,9 +1,13 @@
+config BR2_PACKAGE_XSTROKE_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_XSTROKE
 	bool "xstroke"
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXPM
+	depends on BR2_PACKAGE_XSTROKE_AVAILABLE
 	help
 	  Handwriting recognition for X
 
diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index 33adf25..7950145 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XTERM_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_XTERM
 	bool "xterm"
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_XLIB_LIBXAW
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XTERM_AVAILABLE
 	help
 	  xterm terminal emulator
 
diff --git a/package/xvkbd/Config.in b/package/xvkbd/Config.in
index a75687d..155b32a 100644
--- a/package/xvkbd/Config.in
+++ b/package/xvkbd/Config.in
@@ -1,8 +1,12 @@
+config BR2_PACKAGE_XVKBD_AVAILABLE
+	def_bool y
+	depends on BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_XVKBD
 	bool "xvkbd"
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXTST
+	depends on BR2_PACKAGE_XVKBD_AVAILABLE
 	help
 	  on-screen keyboard for X
 
diff --git a/package/xz/Config.in b/package/xz/Config.in
index 50116f2..f196f33 100644
--- a/package/xz/Config.in
+++ b/package/xz/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_XZ_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_XZ
 	bool "xz-utils"
+	depends on BR2_PACKAGE_XZ_AVAILABLE
 	help
 	  XZ is the successor to the Lempel-Ziv/Markov-chain Algorithm
 	  compression format, which provides memory-hungry but powerful
diff --git a/package/yajl/Config.in b/package/yajl/Config.in
index be2c133..cfbf721 100644
--- a/package/yajl/Config.in
+++ b/package/yajl/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_YAJL_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_YAJL
 	bool "yajl"
+	depends on BR2_PACKAGE_YAJL_AVAILABLE
 	help
 	  Yet Another JSON Library. YAJL is a small event-driven
 	  (SAX-style) JSON parser written in ANSI C, and a small
diff --git a/package/yasm/Config.in b/package/yasm/Config.in
index 2dc25aa..66d75c7 100644
--- a/package/yasm/Config.in
+++ b/package/yasm/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_YASM_AVAILABLE
+	def_bool y
+	depends on BR2_i386 || BR2_x86_64
+
 config BR2_PACKAGE_YASM
 	bool "yasm"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_YASM_AVAILABLE
 	help
 	  Yasm is a complete rewrite of the NASM-2.10.01 assembler.
 	  It supports the x86 and AMD64 instruction sets, accepts NASM
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index e1d3d52..dd1adb6 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,13 +1,17 @@
 comment "zeromq requires a toolchain with C++, LARGEFILE + WCHAR support"
 	depends on !(BR2_INSTALL_LIBSTDCPP &&  BR2_LARGEFILE && BR2_USE_WCHAR)
 
-config BR2_PACKAGE_ZEROMQ
-	bool "zeromq"
+config BR2_PACKAGE_ZEROMQ_AVAILABLE
+	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+
+config BR2_PACKAGE_ZEROMQ
+	bool "zeromq"
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	depends on BR2_PACKAGE_ZEROMQ_AVAILABLE
 	help
 	  ?MQ (ZeroMQ, 0MQ, zmq) looks like an embeddable networking
 	  library but acts like a concurrency framework. It gives you
diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index 8954214..f17495e 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_ZLIB_AVAILABLE
+	def_bool y
+
 config BR2_PACKAGE_ZLIB
 	bool "zlib"
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
 	help
 	  Standard (de)compression library.  Used by things like
 	  gzip and libpng.
diff --git a/package/zxing/Config.in b/package/zxing/Config.in
index c1d342c..fd91424 100644
--- a/package/zxing/Config.in
+++ b/package/zxing/Config.in
@@ -1,10 +1,14 @@
 comment "zxing requires a toolchain with C++ support"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
+config BR2_PACKAGE_ZXING_AVAILABLE
+	def_bool y
+	depends on BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_ZXING
 	bool "zxing"
-	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_ZXING_AVAILABLE
 	help
 	  ZXing (pronounced "zebra crossing") is an open-source,
 	  multi-format 1D/2D barcode image processing library
-- 
1.7.2.5
