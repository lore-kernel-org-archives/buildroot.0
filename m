From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 00:07:46 +0100
Subject: [Buildroot] [PATCH 00/21] Rework atomic handling
Message-ID: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As many of you are aware, we have a number of build failures related
to __sync_*() atomic operations, which we can't really solve properly
today with our single BR2_ARCH_HAS_ATOMICS boolean option.

This patch series aims at reworking our atomic operation handling, by
introducing four options: BR2_TOOLCHAIN_HAS_SYNC_1,
BR2_TOOLCHAIN_HAS_SYNC_2, BR2_TOOLCHAIN_HAS_SYNC_4,
BR2_TOOLCHAIN_HAS_SYNC_8, to indicate which variants of atomic
operations are available, depending on the architecture/toolchain. The
full details are explained in PATCH 3.

The overall direction of the series is:

 - PATCH 1 and 2 are preparation patches on libftdi, to remove the
   BR2_ARCH_HAS_ATOMICS dependency which is not needed.

 - PATCH 3 introduces the BR2_TOOLCHAIN_HAS_SYNC_x options, and has
   all the explanations about why we're doing this.

 - PATCH 4 updates the manual about the BR2_TOOLCHAIN_HAS_SYNC_x
   options.

 - PATCH 5-16 aim at replacing the BR2_ARCH_HAS_ATOMICS usage by the
   appropriate BR2_TOOLCHAIN_HAS_SYNC_x options. Note that in some
   cases, BR2_ARCH_HAS_ATOMICS can be removed completely.

   Along the way, we found that json-c was using some __sync_*()
   built-ins, so we added this dependency, which fixes some build
   failure.

 - PATCH 17 removes the BR2_ARCH_HAS_ATOMICS option, which has become
   no longer used.

 - PATCH 18-21 use the new BR2_TOOLCHAIN_HAS_SYNC_x options to fix
   numerous outstanding build failures related to atomic operations.

Those interested can also find this series in the Git branch at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=atomic-rework

Thanks in advance for your review and comments!

Thomas

Thomas Petazzoni (21):
  libftdi: C++ bindings need boost
  libftdi: remove BR2_ARCH_HAS_ATOMICS dependency
  toolchain: add BR2_TOOLCHAIN_HAS_SYNC_x hidden booleans
  docs/manual: document usage of BR2_TOOLCHAIN_HAS_SYNC_x
  icu: remove BR2_ARCH_HAS_ATOMICS dependency
  json-c: needs __sync_val_compare_and_swap_4
  pulseaudio: remove BR2_ARCH_HAS_ATOMICS dependency
  apache, apr: fix atomic handling
  jack2: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbol
  libtorrent: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbols
  gauche: disable on SPARC(64), remove atomics dependency
  cairo, harfbuzz: rework atomic dependencies
  openocd: remove BR2_ARCH_HAS_ATOMICS dependency
  squid: rework atomic handling
  thrift: remove BR2_ARCH_HAS_ATOMICS dependency
  msgpack: rework BR2_ARCH_HAS_ATOMICS dependency
  arch: remove BR2_ARCH_HAS_ATOMICS option
  glog: fix atomic built-in problem
  openal: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
  freerdp: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
  neard: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency

 arch/Config.in                                 |  4 --
 arch/Config.in.aarch64                         |  3 --
 arch/Config.in.arc                             |  3 --
 arch/Config.in.arm                             |  3 --
 arch/Config.in.bfin                            |  3 --
 arch/Config.in.m68k                            |  3 --
 arch/Config.in.microblaze                      |  3 --
 arch/Config.in.mips                            |  3 --
 arch/Config.in.nios2                           |  3 --
 arch/Config.in.powerpc                         |  3 --
 arch/Config.in.sh                              |  3 --
 arch/Config.in.x86                             |  3 --
 arch/Config.in.xtensa                          |  3 --
 docs/manual/adding-packages-directory.txt      | 14 +++++--
 package/apache/apache.mk                       |  4 --
 package/apr/apr.mk                             | 17 ++++++++
 package/beecrypt/Config.in                     |  2 -
 package/cairo/Config.in                        |  1 -
 package/cairo/cairo.mk                         |  6 +++
 package/cairomm/Config.in                      |  2 -
 package/connman/Config.in                      |  1 +
 package/cppcms/Config.in                       |  1 -
 package/cwiid/Config.in                        |  2 +-
 package/directfb/Config.in                     |  5 +--
 package/efl/Config.in                          |  2 +-
 package/enlightenment/Config.in                |  6 +--
 package/espeak/Config.in                       |  2 +-
 package/fastd/Config.in                        |  1 +
 package/flashrom/Config.in                     |  2 -
 package/freerdp/Config.in                      |  2 +
 package/gauche/Config.in                       |  5 +--
 package/glog/glog.mk                           | 11 ++++++
 package/gstreamer/gst-plugins-bad/Config.in    |  4 +-
 package/gstreamer/gst-plugins-base/Config.in   |  4 +-
 package/gstreamer/gst-plugins-good/Config.in   |  5 +--
 package/gstreamer1/gst1-plugins-bad/Config.in  |  6 ++-
 package/gstreamer1/gst1-plugins-base/Config.in |  4 +-
 package/gstreamer1/gst1-plugins-good/Config.in |  5 +--
 package/gtkmm3/Config.in                       |  4 +-
 package/harfbuzz/Config.in                     |  2 +
 package/icu/Config.in                          |  2 -
 package/icu/icu.mk                             |  8 ++++
 package/jack2/Config.in                        |  4 +-
 package/json-c/Config.in                       |  2 +
 package/libevas-generic-loaders/Config.in      |  4 +-
 package/libfm/Config.in                        |  4 +-
 package/libftdi/Config.in                      | 11 ++++--
 package/libftdi/libftdi.mk                     |  1 +
 package/libgail/Config.in                      |  4 +-
 package/libgdiplus/Config.in                   |  2 -
 package/libgtk2/Config.in                      |  4 +-
 package/libgtk3/Config.in                      |  4 +-
 package/librsvg/Config.in                      |  4 +-
 package/libsvg-cairo/Config.in                 |  1 -
 package/libtorrent/Config.in                   |  4 +-
 package/mpd/Config.in                          |  6 ++-
 package/msgpack/Config.in                      |  4 +-
 package/neard/Config.in                        |  2 +
 package/openal/Config.in                       |  2 +
 package/openbox/Config.in                      |  4 +-
 package/opencv/Config.in                       |  2 +-
 package/opencv3/Config.in                      |  4 +-
 package/openocd/Config.in                      |  4 --
 package/pango/Config.in                        |  4 +-
 package/pangomm/Config.in                      |  4 +-
 package/pcmanfm/Config.in                      |  4 +-
 package/php/Config.ext                         |  2 -
 package/pinentry/Config.in                     |  4 +-
 package/pulseaudio/Config.in                   |  4 +-
 package/pulseaudio/pulseaudio.mk               |  7 +++-
 package/python-msgpack/Config.in               |  4 +-
 package/qt-webkit-kiosk/Config.in              |  1 -
 package/qt5/qt5base/Config.in                  |  1 -
 package/qt5/qt5webkit/Config.in                |  1 -
 package/rrdtool/Config.in                      |  2 +-
 package/rsyslog/Config.in                      |  2 +
 package/rtorrent/Config.in                     |  4 +-
 package/squid/squid.mk                         | 10 ++---
 package/thrift/Config.in                       |  2 -
 package/ubus/Config.in                         |  1 +
 package/webkit/Config.in                       |  4 +-
 package/webkitgtk24/Config.in                  |  4 +-
 package/weston/Config.in                       |  4 +-
 package/xscreensaver/Config.in                 |  4 +-
 toolchain/toolchain-common.in                  | 54 ++++++++++++++++++++++++++
 85 files changed, 216 insertions(+), 158 deletions(-)

-- 
2.6.4
