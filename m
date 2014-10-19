From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:07:34 +0200
Subject: [Buildroot] [PATCH 00/31] Removal of BR2_GCC_TARGET_TUNE and other
	arch/ updates
Message-ID: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As discussed during the Buildroot Developers meeting, this patch
series implement a few changes to the handling of the
BR2_GCC_TARGET_{ARCH,CPU,TUNE} options.

In sequence, this patch series:

 - PATCH 1 and 2 fix some dangling architecture dependency and a typo
   on a NIOS 2 architecture dependency. They are really fixes for
   existing issues.

 - PATCH 3 introduces a number of ARM architecture blind options:
   BR2_ARM_CPU_ARMV4, BR2_ARM_CPU_ARMV4T, ...,
   BR2_ARM_CPU_ARMV7A. These options will allow to simplify testing
   against an ARM architecture (instead of using each individual ARM
   core), and also allow to remove tests against BR2_GCC_TARGET_ARCH
   on ARM, since we later get rid of all values for this variable on
   ARM as part of a later patch in this series.

 - PATCH 4 to 20 make use of those new blind options to replace a
   number of dependencies/conditions on individual ARM cores by
   dependencies/conditions on ARM architecture levels.

 - PATCH 21 fixes the dhcpcd package as it uses the
   BR2_GCC_TARGET_ARCH value, which may not always exists on certain
   architectures.

 - PATCH 22 and 23 remove the BR2_GCC_TARGET_ARCH values from the ARM
   architecture, since they are causing conflicts with the
   BR2_GCC_TARGET_CPU values. We now only specify the -mcpu value
   (through BR2_GCC_TARGET_CPU), and let gcc derive the corresponding
   ARM architecture. This fixes a long standing bug report where
   Buildroot would pass conflicting -march and -mcpu values for
   certain versions of gcc.

 - PATCH 24 prepares ffmpeg for the removal of BR2_GCC_TARGET_TUNE by
   using BR2_GCC_TARGET_ARCH or BR2_GCC_TARGET_CPU instead.

 - PATCH 25 to 28 modifies the architecture definitions to no longer
   use BR2_GCC_TARGET_TUNE, and instead use BR2_GCC_TARGET_CPU or
   BR2_GCC_TARGET_ARCH as appropriate.

 - PATCH 29 to 31 finally get rid of BR2_GCC_TARGET_TUNE entirely
   since it is no longer used.

Thomas

Thomas Petazzoni (31):
  ffmpeg: remove dangling reference to BR2_arm10
  libplayer: fix typo on BR2_nios2
  arch/arm: add blind options to know the ARM architecture
  ffmpeg: use the new BR2_ARM_CPU_ARM* options
  gst-ffmpeg: use the new BR2_ARM_CPU_ARM* options
  gst-ffmpeg: allow usage of ARMv6 optimizations on ARMv7 platforms
  gst1-libav: use the new BR2_ARM_CPU_ARM* options
  gst1-libav: allow usage of ARMv6 optimizations on ARMv7 platforms
  mplayer: use BR2_ARM_CPU_ARM* options
  libplayer: use BR2_ARM_CPU_ARM* option
  nettle: use the BR2_ARM_CPU_ARM* options
  nodejs: use BR2_ARM_CPU_ARM* options
  qt5: use the BR2_ARM_CPU_ARM* options
  speex: use BR2_ARM_CPU_ARM* options
  vo-aacenc: use the BR2_ARM_CPU_ARM* options
  webkit: use BR2_ARM_CPU_ARM* options
  valgrind: use the BR2_ARM_CPU_ARM* options
  x264: use the BR2_ARM_CPU_ARMV7A option
  libnspr: use the BR2_ARM_CPU_ARMV7A option
  toolchain-external: use BR2_ARM_CPU_ARM* options
  dhcpcd: do not pass --target option
  arch/arm: do not distinguish revisions of ARM1136JF-S
  arch/arm: remove BR2_GCC_TARGET_ARCH definitions on ARM
  ffmpeg: use arch and cpu instead of tune
  arch/x86: get rid of BR2_GCC_TARGET_TUNE
  arch/sparc: get rid of BR2_GCC_TARGET_TUNE
  arch/powerpc: get rid of BR2_GCC_TARGET_TUNE
  arch/m68k: get rid of BR2_GCC_TARGET_TUNE
  gcc: do not use BR2_GCC_TARGET_TUNE anymore
  toolchain-external: do not use BR2_GCC_TARGET_TUNE anymore
  arch: remove the BR2_GCC_TARGET_TUNE option

 arch/Config.in                                     |  3 -
 arch/Config.in.arm                                 | 69 ++++++++++++----------
 arch/Config.in.m68k                                |  8 ---
 arch/Config.in.powerpc                             |  2 +-
 arch/Config.in.sparc                               |  4 +-
 arch/Config.in.x86                                 | 32 +---------
 package/dhcpcd/dhcpcd.mk                           |  1 -
 package/ffmpeg/ffmpeg.mk                           | 13 ++--
 package/gcc/gcc.mk                                 |  3 -
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk         |  4 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk        |  4 +-
 package/libnspr/libnspr.mk                         |  2 +-
 package/libplayer/Config.in                        |  5 +-
 package/mplayer/Config.in                          |  3 +-
 package/mplayer/mplayer.mk                         |  4 +-
 package/nettle/nettle.mk                           |  2 +-
 package/nodejs/Config.in                           |  4 +-
 package/qt5/Config.in                              |  2 +-
 package/speex/Config.in                            |  2 +-
 package/valgrind/Config.in                         |  7 +--
 package/valgrind/valgrind.mk                       |  4 +-
 package/vo-aacenc/vo-aacenc.mk                     |  2 +-
 package/webkit/Config.in                           |  2 +-
 package/x264/x264.mk                               |  2 +-
 toolchain/toolchain-external/Config.in             | 14 ++---
 .../toolchain-external/ext-toolchain-wrapper.c     | 12 +---
 toolchain/toolchain-external/toolchain-external.mk |  5 --
 27 files changed, 83 insertions(+), 132 deletions(-)

-- 
2.0.0
