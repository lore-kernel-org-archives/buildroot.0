From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:48:27 +0200
Subject: [Buildroot] [git commit] package/kodi: bump to version 17.1-Krypton
Message-ID: <20170429101426.52086818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24a07d58af39f534845b671bea8c96dc88ef713c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed unneeded patches
- 0001-Fixup-include-path.patch (not needed after CMake switch)
- 0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
  (applied upstream)
- 0006-ffmpeg30.patch (was backported from 17.0-Krypton to 16.0-Jarvis)
- 0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch
  (was backported from 17.0-Krypton to 16.0-Jarvis)
- 0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
  (was backported from 17.0-Krypton to 16.0-Jarvis)
- 0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
  (cximage was removed in bump from 16.x to 17.0)
- 0010-curl-support-version-7.5.0-and-upwards.patch
  (applied upstream)
- 0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
  (applied upstream)
- 0012-Fix_includes_in_amcodec.patch
  (was backported from 17.0-Krypton to 16.0-Jarvis)

Rebased patches
- 0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
  also renamed to 0001-...

Removed dependencies not needed anymore:
- boost
  https://github.com/xbmc/xbmc/commit/41ae93f0913f7ba72087a48370f8d66a3eac9fcc
- giflib
  https://github.com/xbmc/xbmc/commit/d44338baf1f6d1e6b76cd7dbab6453d76cc2ac31
- jasper/tiff
  https://github.com/xbmc/xbmc/commit/00724eb109a702f0098089d849f7c02ea173a4a9
- jpeg
  https://github.com/xbmc/xbmc/commit/7d5bdfb9a09348bde92b323ef6077b5e75edaca7
- libdcadec
  https://github.com/xbmc/xbmc/commit/378eb2687c1da5f97ef47c78431033b52f0d4417
- libglew
  https://github.com/xbmc/xbmc/commit/03ff0d5ea02963b1283fe8bc7c1bad18f2dd97b6
- libgcrypt
  was already an optional dependency in Kodi 16, not part of the CMake
  buildsystem anymore
- libmpeg2
  https://github.com/xbmc/xbmc/commit/d22c829d67937e8d03fdac8f8b0bf2d1fa8fbf70
- libogg/libvorbis
  https://github.com/xbmc/xbmc/commit/4c609691776ab845d83153e19d191b7fd445edb9
- libpng
  https://github.com/xbmc/xbmc/commit/be6b50c6c3f91809a9045c199d054cbc1d637d5d
- librtmp, the new rtmp inputstream addon will be added later
  https://github.com/xbmc/xbmc/commit/d04f43a4eb6f920cc42a28627b580f17e2be1bb5
- libsquish
  https://github.com/xbmc/xbmc/commit/ed03f828be3615d294eb4a4cfccc5cdccec22997
- xlib_libXmu
- xlib_libXt

Switched to CMake, autoconf was deprecated:
https://github.com/xbmc/xbmc/pull/10797

The dependency for egl/gles on arm, formerly enforced by the automake
build system, was not ported to CMake.

Bumped BR2_TOOLCHAIN_GCC_AT_LEAST to 4.8 to fix build errors with
gcc-4.7 found while testing
http://autobuild.buildroot.net/toolchains/configs/sourcery-x86.config
For details please read
http://lists.busybox.net/pipermail/buildroot/2017-April/190195.html

Added hard-dependency for libegl, needed after
https://github.com/xbmc/xbmc/commit/0ac305f7cf82e98021b6e0d70c3d4c51fc1cf18a

Libva support depends on X11
https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/modules/FindVAAPI.cmake#L42
and OpenGL/EGL
https://github.com/xbmc/xbmc/blob/Krypton/xbmc/cores/VideoPlayer/DVDCodecs/Video/VAAPI.h#L23

Libvdpau support depends on X11
https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/modules/FindVDPAU.cmake#L21
and OpenGL/EGL
https://github.com/xbmc/xbmc/blob/Krypton/xbmc/cores/VideoPlayer/DVDCodecs/Video/VDPAU.h#L43

Updated clean-up hook and added host-xmlstarlet as dependency to
manipulate the list of default system addons in addon-manifest.xml.

Added dependency to BR2_ENABLE_LOCALE, needs iconv_open:
https://github.com/xbmc/xbmc/blob/Krypton/xbmc/utils/CharsetConverter.cpp#L200

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: minor tweaks.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |    6 +
 package/kodi/0001-Fixup-include-path.patch         |   33 -
 ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |   42 +
 ...e-dependency-on-gmp-and-libintl-from-Find.patch |   39 +
 ...0003-ALSA-fix-device-change-event-support.patch |   67 -
 ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |   41 -
 ...exturePacker-fix-compilation-with-gcc-4.6.patch |   53 -
 package/kodi/0006-ffmpeg30.patch                   |  646 ---------
 ...r-out-of-memory-errors-with-large-numbers.patch |   45 -
 ...ding-issue-when-reading-certain-id3v1-tag.patch |   82 --
 ...lib-cximage-6.0-fix-compilation-with-gcc6.patch | 1438 --------------------
 ...10-curl-support-version-7.5.0-and-upwards.patch |   34 -
 ...bmc_pvr_types.h-Fix-compilation-with-gcc6.patch |   30 -
 package/kodi/0012-Fix_includes_in_amcodec.patch    |   38 -
 package/kodi/Config.in                             |   65 +-
 package/kodi/kodi.hash                             |    7 +-
 package/kodi/kodi.mk                               |  300 ++--
 17 files changed, 280 insertions(+), 2686 deletions(-)

Patch is too large, so refusing to show it
