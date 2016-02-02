From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Feb 2016 16:31:18 +0100
Subject: [Buildroot] [PATCH v3 00/18] Rework atomic handling
Message-ID: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
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
introducing five options: BR2_TOOLCHAIN_HAS_SYNC_1,
BR2_TOOLCHAIN_HAS_SYNC_2, BR2_TOOLCHAIN_HAS_SYNC_4,
BR2_TOOLCHAIN_HAS_SYNC_8 (for __sync built-ins) and
BR2_TOOLCHAIN_HAS_ATOMIC (for __atomic built-ins), to indicate which
variants of atomic operations are available, depending on the
architecture/toolchain. The full details are explained in PATCH 1.

The overall direction of the series is:

 - PATCH 1 fixes an icu problem introduced by a patch present in an
   earlier version of this series.

 - PATCH 2 introduces the BR2_TOOLCHAIN_HAS_{SYNC_x,ATOMIC} options,
   and has all the explanations about why we're doing this.

 - PATCH 3 updates the manual about the
   BR2_TOOLCHAIN_HAS_{SYNC_x,ATOMIC} options.

 - PATCH 4-13 aim at replacing the BR2_ARCH_HAS_ATOMICS usage by the
   appropriate BR2_TOOLCHAIN_HAS_SYNC_x options. Note that in some
   cases, BR2_ARCH_HAS_ATOMICS can be removed completely.

   Along the way, we found that json-c was using some __sync_*()
   built-ins, so we added this dependency, which fixes some build
   failure.

 - PATCH 14 removes the BR2_ARCH_HAS_ATOMICS option, which has become
   no longer used.

 - PATCH 15-18 use the new BR2_TOOLCHAIN_HAS_{SYNC_x,ATOMIC} options
   to fix several outstanding build failures related to atomic
   operations.

Changes compared to v2:

 - Add patch to fix icu build failure caused by libatomic being not
   available on gcc 4.7, only in gcc 4.8.

 - Add a new BR2_TOOLCHAIN_HAS_ATOMIC option, which allows packages to
   know if __atomic_*() built-ins is available, since their
   availability is more compicated than thought in previous iterations
   of the series.

 - Fix the "json-c: needs __sync_val_compare_and_swap_4" patch to
   properly propagate the newly added BR2_TOOLCHAIN_HAS_SYNC_4
   dependency to comments of json-c reverse dependencies. Noticed by
   Yann.

 - Add Reviewed-by from Yann E. Morin on:

   pulseaudio: remove BR2_ARCH_HAS_ATOMICS dependency

 - Add Acked-by from Yann E. Morin on:

   apache, apr: fix atomic handling

 - Rework the openal patch, after the reports from Andr?
   Hentschel. openal can use either __atomic or __sync intrinsics.

Changes compared to v1:

 - Drop patches that have been merged:

    libftdi: C++ bindings need boost
    libftdi: remove BR2_ARCH_HAS_ATOMICS dependency
    icu: remove BR2_ARCH_HAS_ATOMICS dependency
    openocd: remove BR2_ARCH_HAS_ATOMICS dependency

 - Fix numerous english typos in the commit log of "toolchain: add
   BR2_TOOLCHAIN_HAS_SYNC_x hidden booleans" as well as in the patch
   itself. Following the review from Yann E. Morin.

 - Introduced a BR2_TOOLCHAIN_X86_HAS_SYNC_8 in "toolchain: add
   BR2_TOOLCHAIN_HAS_SYNC_x hidden booleans" to simplify the
   expression of the availability of 8-byte intrinsics on 32 bits
   x86. Suggested by Yann E. Morin.

 - In the documentation patch, remove a stray paragraph from a
   previous write-up documenting the new BR2_TOOLCHAIN_HAS_SYNC_x
   options. Noticed by Yann E. Morin.

 - Fix minor typo and add Reviewed-by from Yann E. Morin on patch
   "json-c: needs __sync_val_compare_and_swap_4".

 - Explicitly pass --disable-nonportable-atomics to the apr package
   configure script when no appropriate atomic __sync functions are
   available. Suggested by Yann E. Morin.

 - Added Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr> on:

    jack2: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbol
    gauche: disable on SPARC(64), remove atomics dependency
    msgpack: rework BR2_ARCH_HAS_ATOMICS dependency

 - Added Tested-by/Acked from Yann E. Morin on:

    libtorrent: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbols
    thrift: remove BR2_ARCH_HAS_ATOMICS dependency

 - Added Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr> on

     squid: rework atomic handling
     arch: remove BR2_ARCH_HAS_ATOMICS option
     neard: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
     freerdp: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
     openal: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency

 - Fix a few typos in the commit log of "glog: fix atomic built-in
   problem" and added Reviewed-by from Yann E. Morin.

Those interested can also find this series in the Git branch at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=atomic-rework

Thanks in advance for your review and comments!

Thomas

Thomas Petazzoni (18):
  icu: libatomic is only available starting from gcc 4.8
  toolchain: add BR2_TOOLCHAIN_HAS_{SYNC_x,ATOMIC} hidden booleans
  docs/manual: document usage of BR2_TOOLCHAIN_HAS_SYNC_x
  json-c: needs __sync_val_compare_and_swap_4
  pulseaudio: remove BR2_ARCH_HAS_ATOMICS dependency
  apache, apr: fix atomic handling
  jack2: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbol
  libtorrent: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbols
  gauche: disable on SPARC(64), remove atomics dependency
  cairo, harfbuzz: rework atomic dependencies
  squid: rework atomic handling
  thrift: remove BR2_ARCH_HAS_ATOMICS dependency
  msgpack: rework BR2_ARCH_HAS_ATOMICS dependency
  arch: remove BR2_ARCH_HAS_ATOMICS option
  glog: fix atomic built-in problem
  openal: fix atomic handling
  freerdp: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
  neard: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency

 arch/Config.in                                     |  4 --
 arch/Config.in.aarch64                             |  3 -
 arch/Config.in.arc                                 |  3 -
 arch/Config.in.arm                                 |  3 -
 arch/Config.in.bfin                                |  3 -
 arch/Config.in.m68k                                |  3 -
 arch/Config.in.microblaze                          |  3 -
 arch/Config.in.mips                                |  3 -
 arch/Config.in.nios2                               |  3 -
 arch/Config.in.powerpc                             |  3 -
 arch/Config.in.sh                                  |  3 -
 arch/Config.in.x86                                 |  3 -
 arch/Config.in.xtensa                              |  3 -
 docs/manual/adding-packages-directory.txt          | 15 +++-
 package/apache/apache.mk                           |  4 --
 package/apr/apr.mk                                 | 15 ++++
 package/cairo/Config.in                            |  1 -
 package/cairo/cairo.mk                             |  6 ++
 package/cairomm/Config.in                          |  2 -
 package/connman/Config.in                          |  1 +
 package/cwiid/Config.in                            |  2 +-
 package/directfb/Config.in                         |  5 +-
 package/efl/Config.in                              |  2 +-
 package/enlightenment/Config.in                    |  6 +-
 package/espeak/Config.in                           |  2 +-
 package/fastd/Config.in                            |  1 +
 package/freerdp/Config.in                          |  2 +
 package/gauche/Config.in                           |  5 +-
 package/glog/glog.mk                               | 11 +++
 package/gstreamer/gst-plugins-bad/Config.in        |  4 +-
 package/gstreamer/gst-plugins-base/Config.in       |  4 +-
 package/gstreamer/gst-plugins-good/Config.in       |  5 +-
 package/gstreamer1/gst1-plugins-bad/Config.in      |  6 +-
 package/gstreamer1/gst1-plugins-base/Config.in     |  4 +-
 package/gstreamer1/gst1-plugins-good/Config.in     |  5 +-
 package/gtkmm3/Config.in                           |  4 +-
 package/harfbuzz/Config.in                         |  2 +
 package/icu/icu.mk                                 |  6 +-
 package/jack2/Config.in                            |  4 +-
 package/json-c/Config.in                           |  2 +
 package/libevas-generic-loaders/Config.in          |  4 +-
 package/libfm/Config.in                            |  4 +-
 package/libgail/Config.in                          |  4 +-
 package/libgdiplus/Config.in                       |  2 -
 package/libgtk2/Config.in                          |  4 +-
 package/libgtk3/Config.in                          |  4 +-
 package/librsvg/Config.in                          |  4 +-
 package/libsvg-cairo/Config.in                     |  1 -
 package/libtorrent/Config.in                       |  4 +-
 package/mpd/Config.in                              |  6 +-
 package/msgpack/Config.in                          |  4 +-
 package/neard/Config.in                            |  2 +
 .../openal/0001-Fix-detection-of-C11-atomics.patch | 53 +++++++++++++++
 package/openal/Config.in                           | 17 +++++
 package/openal/openal.mk                           |  4 ++
 package/openbox/Config.in                          |  4 +-
 package/opencv/Config.in                           |  2 +-
 package/opencv3/Config.in                          |  4 +-
 package/pango/Config.in                            |  4 +-
 package/pangomm/Config.in                          |  4 +-
 package/pcmanfm/Config.in                          |  4 +-
 package/pinentry/Config.in                         |  4 +-
 package/pulseaudio/Config.in                       |  4 +-
 package/pulseaudio/pulseaudio.mk                   |  7 +-
 package/python-msgpack/Config.in                   |  4 +-
 package/rrdtool/Config.in                          |  2 +-
 package/rsyslog/Config.in                          |  2 +
 package/rtorrent/Config.in                         |  4 +-
 package/squid/squid.mk                             | 10 ++-
 package/thrift/Config.in                           |  2 -
 package/ubus/Config.in                             |  2 +
 package/webkit/Config.in                           |  4 +-
 package/webkitgtk24/Config.in                      |  4 +-
 package/weston/Config.in                           |  4 +-
 package/xscreensaver/Config.in                     |  4 +-
 toolchain/toolchain-common.in                      | 79 ++++++++++++++++++++++
 76 files changed, 299 insertions(+), 142 deletions(-)
 create mode 100644 package/openal/0001-Fix-detection-of-C11-atomics.patch

-- 
2.6.4
