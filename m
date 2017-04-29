From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 10:37:20 +0200
Subject: [Buildroot] [PATCH v7 00/31] odi: bump to version 17.1-Krypton
Message-ID: <20170429083751.19625-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series bumps Kodi to 17.1-Krypton, released 2017/03/21:
https://kodi.tv/kodi-v17-1-krypton/

Patches 0001-0021 must be committed together to avoid having
incompatible package versions in buildroot.

Please note the Kodi needs patched versions of libdvdcss, libdvdread
and libdvdnav. Instead of including the Kodi-specific patches in the
respective buildroot packages we let Kodi build the libraries during
make and provide the pre-downloaded and patched tarballs for it.
Debian chose a similar approach to avoid patching the system versions
of libdvd*:
https://sources.debian.net/src/kodi/2:17.1%2Bdfsg1-2/debian/README.source/#L11

Regards, Bernd

v7: rebased
    kodi
    - removed libgrypt from dependencies, it was already an optional
      dependency in Kodi 16, it is not part of the CMake buildsystem
      anymore
    - re-worked patch to support more archs
      With the exception of one arch (i386 without sse - upstream
      decision) all arch-specific limitations were removed
      added -latomic for the BR2_TOOLCHAIN_HAS_LIBATOMIC=y case,
      therefore BR2_TOOLCHAIN_HAS_SYNC_8 was also removed
    - added comment why va & vdpau depend on x11/opengl/egl (Yann)

    To-Do
    - kodi-screensaver-rsxs: take review from Yann into account

v6: rebased
    removed patch to disable online check (Yann)
    re-ordered addon version bump patches (Yann)

    kodi
    - removed gmp, leftover code before
      CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch
      was added (Yann)
    - event clients: added URL to Config.in help text (Yann)
    - added dependency to BR2_TOOLCHAIN_HAS_SYNC_4 for pulseaudio,
      added comment about libglib2 dependencies (Yann)
    - added libxml2 as additional dependency for optional xslt support
      (Yann)
    - squashed removal of internal rtmp support (Yann)
    - added commit note that libva support depends on x11 (Yann)
    - added explanation why gcc >= 4.8 is now required (Yann)
    - depends on locale support (needs libiconv_open), removed
      0002-cmake-add-FindIconv.cmake.patch (Yann)
    - removed dependency to host-gettext

    kodi-jsonschemabuilder
    - updated (Yann)
    - share source tarball with kodi package

    kodi-texturepacker
    - updated (Yann)
    - share source tarball with kodi package

    kodi-platform: bump (Yann)

    libplatform: updated according to Yann's comments

    kodi-inputstream-rtmp: add select for the new package in
    Config.in.legacy (Yann)

    kodi-pvr-mediaportal-tvserver: removed "needs locale support" patch,
    kodi itself now depends on locale

    kodi-skin-confluence: removed patch for now. Fixing it will require
    some time and debugging (it works for me, though, and I would like
    to see the working part of the series in buildroot 2017.05, if
    possible.

    libsquish
    - removed patch to remove libsquish (Yann)
    - removed Kodi-specific patch
    - bumped to 1.15 (Yann)

    To-Do
    - kodi-screensaver-rsxs: take review from Yann into account
    - explain why libva and libvdpau depend on OpenGL
    - optimize KODI_CONF_OPTS for -DWITH_ARCH & -DWITH_CPU (includes
      much testing), this patch can be committed later. Therefore this
      patch is the last one in the series.

v5: removed patches for libdvd*
    add dependency to libglib2 for pulseaudio
    fix c/cxxflags for gles
    BR2_PACKAGE_KODI_LIBVA depends on xorg
    squashed patches to enhance supported archs
    bumped kodi-pvr-dvblink
    enable optional support for OpenGL on arm
v4: package/kodi: switched up CMake, bumped to 17.1
    package/libdvd*: static build is not needed anymore
    various addon bumps and new optional packages for Kodi
v3: fixed legal-info for libplatform & kodi-skin-confluence
v2: added commit log to "package/kodi: add Kconfig option to make
    TexturePacker optional" (Thomas)
    

Bernd Kuhls (31):
  package/kodi-visualisation-fountain: remove package
  package/libplatform: bump version
  package/kodi-platform: bump version
  package/libcec: bump version to 4.0.2
  package/xmlstarlet: add host variant
  package/kodi-jsonschemabuilder: new host package
  package/kodi-texturepacker: new host package
  package/kodi: bump to version 17.1-Krypton
  package/kodi-pvr-*: mass version bump
  package/kodi-pvr-mythtv: bump version to 4.15.0
  package/kodi-pvr-nextpvr: bump version to 2.4.11
  package/kodi-adsp-basic: bump version
  package/kodi-adsp-freesurround: bump version
  package/kodi-audioencoder-*: mass version bump
  package/kodi-audiodecoder-*: mass version bump
  package/kodi-audiodecoder-timidity: bump version
  package/kodi-screensaver-*: mass version bump
  package/kodi-screensaver-rsxs: bump version
  package/kodi-visualisation-*: mass version bump
  package/kodi-visualisation-waveforhue: bump version
  package/kodi-visualisation-shadertoy: bump version
  package/kodi: add optional support for bluez5
  package/kodi: libxslt is an optional package
  package/kodi: add optional support for pulseaudio
  package/kodi: add optional support for event clients
  package/kodi: add optional support for lcms2
  package/kodi-inputstream-rtmp: new package
  package/kodi-inputstream-adaptive: new package
  package/libsquish: Remove Kodi-specific patch
  package/libsquish: bump version to 1.15
  package/kodi: Add support for more archs

 Config.in.legacy                                   |   14 +
 package/kodi-adsp-basic/kodi-adsp-basic.hash       |    2 +-
 package/kodi-adsp-basic/kodi-adsp-basic.mk         |    4 +-
 .../kodi-adsp-freesurround.hash                    |    2 +-
 .../kodi-adsp-freesurround.mk                      |    4 +-
 .../kodi-audiodecoder-modplug.hash                 |    2 +-
 .../kodi-audiodecoder-modplug.mk                   |    2 +-
 .../kodi-audiodecoder-nosefart.hash                |    2 +-
 .../kodi-audiodecoder-nosefart.mk                  |    2 +-
 .../kodi-audiodecoder-opus.hash                    |    2 +-
 .../kodi-audiodecoder-opus.mk                      |    2 +-
 .../kodi-audiodecoder-sidplay.hash                 |    2 +-
 .../kodi-audiodecoder-sidplay.mk                   |    2 +-
 .../kodi-audiodecoder-snesapu.hash                 |    2 +-
 .../kodi-audiodecoder-snesapu.mk                   |    2 +-
 .../kodi-audiodecoder-stsound.hash                 |    2 +-
 .../kodi-audiodecoder-stsound.mk                   |    2 +-
 package/kodi-audiodecoder-timidity/Config.in       |    1 -
 .../kodi-audiodecoder-timidity.hash                |    2 +-
 .../kodi-audiodecoder-timidity.mk                  |    4 +-
 .../kodi-audiodecoder-vgmstream.hash               |    2 +-
 .../kodi-audiodecoder-vgmstream.mk                 |    2 +-
 .../kodi-audioencoder-flac.hash                    |    2 +-
 .../kodi-audioencoder-flac.mk                      |    2 +-
 .../kodi-audioencoder-lame.hash                    |    2 +-
 .../kodi-audioencoder-lame.mk                      |    2 +-
 .../kodi-audioencoder-vorbis.hash                  |    2 +-
 .../kodi-audioencoder-vorbis.mk                    |    2 +-
 .../kodi-audioencoder-wav.hash                     |    2 +-
 .../kodi-audioencoder-wav/kodi-audioencoder-wav.mk |    2 +-
 package/kodi-inputstream-adaptive/Config.in        |    8 +
 .../kodi-inputstream-adaptive.hash                 |    2 +
 .../kodi-inputstream-adaptive.mk                   |   13 +
 package/kodi-inputstream-rtmp/Config.in            |    7 +
 .../kodi-inputstream-rtmp.hash                     |    2 +
 .../kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk |   13 +
 .../kodi-jsonschemabuilder.hash                    |    1 +
 .../kodi-jsonschemabuilder.mk                      |   25 +
 package/kodi-platform/kodi-platform.hash           |    2 +-
 package/kodi-platform/kodi-platform.mk             |    2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash     |    2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk       |    4 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash     |    2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk       |    4 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash |    2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   |    4 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash       |    2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk         |    4 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash |    2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk   |    4 +-
 package/kodi-pvr-hts/kodi-pvr-hts.hash             |    2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk               |    4 +-
 .../kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash   |    2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk |    4 +-
 package/kodi-pvr-mediaportal-tvserver/Config.in    |    2 +
 .../kodi-pvr-mediaportal-tvserver.hash             |    2 +-
 .../kodi-pvr-mediaportal-tvserver.mk               |    4 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash       |    2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk         |    6 +-
 ...epresentation-of-char_class_e-in-struct-t.patch |   48 -
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash     |    2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk       |    4 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash           |    2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk             |    4 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash           |    2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk             |    4 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash     |    2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk       |    4 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash           |    2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk             |    4 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash   |    2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk     |    4 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash       |    2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk         |    4 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash             |    2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk               |    4 +-
 .../kodi-screensaver-asteroids.hash                |    2 +-
 .../kodi-screensaver-asteroids.mk                  |    2 +-
 .../kodi-screensaver-asterwave.hash                |    2 +-
 .../kodi-screensaver-asterwave.mk                  |    2 +-
 .../kodi-screensaver-biogenesis.hash               |    2 +-
 .../kodi-screensaver-biogenesis.mk                 |    2 +-
 .../kodi-screensaver-cpblobs.hash                  |    2 +-
 .../kodi-screensaver-cpblobs.mk                    |    2 +-
 .../kodi-screensaver-crystalmorph.hash             |    2 +-
 .../kodi-screensaver-crystalmorph.mk               |    2 +-
 .../kodi-screensaver-greynetic.hash                |    2 +-
 .../kodi-screensaver-greynetic.mk                  |    2 +-
 .../kodi-screensaver-matrixtrails.hash             |    2 +-
 .../kodi-screensaver-matrixtrails.mk               |    2 +-
 .../kodi-screensaver-pingpong.hash                 |    2 +-
 .../kodi-screensaver-pingpong.mk                   |    2 +-
 .../kodi-screensaver-planestate.hash               |    2 +-
 .../kodi-screensaver-planestate.mk                 |    2 +-
 .../kodi-screensaver-pyro.hash                     |    2 +-
 .../kodi-screensaver-pyro/kodi-screensaver-pyro.mk |    2 +-
 .../kodi-screensaver-rsxs/0001-cross-compile.patch |    2 +-
 .../0002-fix-default-include-dir.patch             |   28 +
 package/kodi-screensaver-rsxs/Config.in            |    1 +
 .../kodi-screensaver-rsxs.hash                     |    2 +-
 .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk |    5 +-
 .../kodi-screensaver-stars.hash                    |    2 +-
 .../kodi-screensaver-stars.mk                      |    2 +-
 .../0001-texturepacker.patch}                      |    0
 package/kodi-texturepacker/kodi-texturepacker.hash |    1 +
 package/kodi-texturepacker/kodi-texturepacker.mk   |   41 +
 .../kodi-visualisation-fishbmc.hash                |    2 +-
 .../kodi-visualisation-fishbmc.mk                  |    2 +-
 package/kodi-visualisation-fountain/Config.in      |   11 -
 .../kodi-visualisation-fountain.hash               |    2 -
 .../kodi-visualisation-fountain.mk                 |   11 -
 .../kodi-visualisation-goom.hash                   |    2 +-
 .../kodi-visualisation-goom.mk                     |    2 +-
 ...GLES2-also-search-for-egl-with-pkg-config.patch |    4 +-
 package/kodi-visualisation-shadertoy/Config.in     |    1 -
 .../kodi-visualisation-shadertoy.hash              |    2 +-
 .../kodi-visualisation-shadertoy.mk                |    6 +-
 .../kodi-visualisation-spectrum.hash               |    2 +-
 .../kodi-visualisation-spectrum.mk                 |    2 +-
 .../kodi-visualisation-waveforhue.hash             |    2 +-
 .../kodi-visualisation-waveforhue.mk               |    4 +-
 .../kodi-visualisation-waveform.hash               |    2 +-
 .../kodi-visualisation-waveform.mk                 |    2 +-
 package/kodi/0001-Fixup-include-path.patch         |   33 -
 ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |   42 +
 ...e-dependency-on-gmp-and-libintl-from-Find.patch |   39 +
 ...0003-ALSA-fix-device-change-event-support.patch |   67 -
 package/kodi/0003-Add-support-for-sh4.patch        |  108 ++
 package/kodi/0004-Add-support-for-sparc.patch      |   91 ++
 ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |   41 -
 package/kodi/0005-Add-support-for-arc.patch        |   91 ++
 ...exturePacker-fix-compilation-with-gcc-4.6.patch |   53 -
 package/kodi/0006-Add-support-for-xtensa.patch     |   91 ++
 package/kodi/0006-ffmpeg30.patch                   |  646 ---------
 ...r-out-of-memory-errors-with-large-numbers.patch |   45 -
 ...ding-issue-when-reading-certain-id3v1-tag.patch |   82 --
 ...lib-cximage-6.0-fix-compilation-with-gcc6.patch | 1438 --------------------
 ...10-curl-support-version-7.5.0-and-upwards.patch |   34 -
 ...bmc_pvr_types.h-Fix-compilation-with-gcc6.patch |   30 -
 package/kodi/0012-Fix_includes_in_amcodec.patch    |   38 -
 package/kodi/Config.in                             |  106 +-
 package/kodi/kodi.hash                             |    8 +-
 package/kodi/kodi.mk                               |  359 +++--
 package/libcec/libcec.hash                         |    2 +-
 package/libcec/libcec.mk                           |    4 +-
 .../0001-p8-platform-config-fix-lookup-paths.patch |   38 +
 ...nfig.cmake-fix-paths-for-cross-compilatio.patch |   40 -
 package/libplatform/libplatform.hash               |    2 +-
 package/libplatform/libplatform.mk                 |    6 +-
 package/libsquish/0001-kodi.patch                  |  327 -----
 package/libsquish/libsquish.hash                   |    3 +-
 package/libsquish/libsquish.mk                     |    2 +-
 package/xmlstarlet/xmlstarlet.mk                   |    3 +
 153 files changed, 1088 insertions(+), 3270 deletions(-)
 create mode 100644 package/kodi-inputstream-adaptive/Config.in
 create mode 100644 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
 create mode 100644 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
 create mode 100644 package/kodi-inputstream-rtmp/Config.in
 create mode 100644 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
 create mode 100644 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
 create mode 120000 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
 create mode 100644 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
 delete mode 100644 package/kodi-pvr-nextpvr/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch
 create mode 100644 package/kodi-screensaver-rsxs/0002-fix-default-include-dir.patch
 rename package/{kodi/0002-texturepacker.patch => kodi-texturepacker/0001-texturepacker.patch} (100%)
 create mode 120000 package/kodi-texturepacker/kodi-texturepacker.hash
 create mode 100644 package/kodi-texturepacker/kodi-texturepacker.mk
 delete mode 100644 package/kodi-visualisation-fountain/Config.in
 delete mode 100644 package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash
 delete mode 100644 package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
 delete mode 100644 package/kodi/0001-Fixup-include-path.patch
 create mode 100644 package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
 create mode 100644 package/kodi/0002-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch
 delete mode 100644 package/kodi/0003-ALSA-fix-device-change-event-support.patch
 create mode 100644 package/kodi/0003-Add-support-for-sh4.patch
 create mode 100644 package/kodi/0004-Add-support-for-sparc.patch
 delete mode 100644 package/kodi/0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
 create mode 100644 package/kodi/0005-Add-support-for-arc.patch
 delete mode 100644 package/kodi/0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
 create mode 100644 package/kodi/0006-Add-support-for-xtensa.patch
 delete mode 100644 package/kodi/0006-ffmpeg30.patch
 delete mode 100644 package/kodi/0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch
 delete mode 100644 package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
 delete mode 100644 package/kodi/0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
 delete mode 100644 package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch
 delete mode 100644 package/kodi/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
 delete mode 100644 package/kodi/0012-Fix_includes_in_amcodec.patch
 create mode 100644 package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch
 delete mode 100644 package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch
 delete mode 100644 package/libsquish/0001-kodi.patch

-- 
2.11.0
