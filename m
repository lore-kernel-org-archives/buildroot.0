From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:05 +0200
Subject: [Buildroot] [PATCH/RFC v3 00/50] package/kodi: bump version to 15.0
	rc2 Isengard
Message-ID: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this series is a RFC and not meant for committing to buildroot.

The Kodi project is preparing its next release 15.0, called Isengard.
This patch series introduces two new dependencies, libsquish and libplatform.
The pvr-addons were split into seperate repositories, the current package
kodi-pvr-addons is removed.
Also audio codecs, which are not part of ffmpeg, were removed from Kodi
and are now provided as seperate addons.

Regards, Bernd

v3:
- bump to rc2, but a later commit fixing problems with disabled
  BR2_PACKAGE_KODI_LIBMICROHTTPD
- Kodi depends on eventfd_read/write support which is missing in
  uclibc 0.9.33.2, I sent this patch upstream:
  package/kodi/0003-ALSA-make-device-change-event-support-optional.patch
  which is currently under discussion:
  https://github.com/xbmc/xbmc/pull/7551
  Depending on the outcome of the discussion I may block Kodi for uclibc
  in the final patch series
- libsquish is now at 1.13, upstream changed to sourceforge and
  the Kodi-specific stuff is now a smaller patch (Thomas)
- various version bumps compared to v2 (libcec, libplatform, ffmpeg)
- Goom and rsxs are now binary addons
To-Do
- Config.in.legacy handling

v2:
- bump to beta2
- libsquish: use upstream source tarball and add kodi-specific patch
  from OpenElec (Yann)
- added libplatform
- bumped libcec (depends on Kodi 15.0, please do not commit on its own)
- added some screensaver and visualisation addons

Bernd Kuhls (50):
  package/ffmpeg: bump version to 2.7.1
  package/libsquish: New package
  package/libplatform: new package
  package/libcec: bump to version 3.0.1
  package/kodi: bump version to 15.0rc3 Isengard
  package/kodi: Add option for lirc support
  package/kodi: Rework audio encoder support
  package/kodi-audioencoder-flac: bump version
  package/kodi-audioencoder-lame: bump version
  package/kodi-audioencoder-vorbis: bump version
  package/kodi-audioencoder-wav: bump version
  package/kodi-addon-xvdr: bump version
  package/kodi-pvr-addons: Prepare to split into addon-specific
    packages
  package/kodi-platform: new package
  package/kodi-pvr-argustv: new package
  package/kodi-pvr-dvblink: new package
  package/kodi-pvr-dvbviewer: new package
  package/kodi-pvr-filmon: new package
  package/kodi-pvr-hts: new package
  package/kodi-pvr-iptvsimple: new package
  package/kodi-pvr-mediaportal-tvserver: new package
  package/kodi-pvr-mythtv: new package
  package/kodi-pvr-nextpvr: new package
  package/kodi-pvr-njoy: new package
  package/kodi-pvr-pctv: new package
  package/kodi-pvr-stalker: new package
  package/kodi-pvr-vbox: new package
  package/kodi-pvr-vdr-vnsi: new package
  package/kodi-pvr-vuplus: new package
  package/kodi-pvr-wmc: new package
  package/kodi-audiodecoder-modplug: new package
  package/kodi-audiodecoder-nosefart: new package
  package/kodi-audiodecoder-sidplay: new package
  package/kodi-audiodecoder-snesapu: new package
  package/kodi-audiodecoder-stsound: new package
  package/kodi-audiodecoder-timidity: new package
  package/kodi-audiodecoder-vgmstream: new package
  package/kodi-screensaver-asteroids: new package
  package/kodi-screensaver-biogenesis: new package
  package/kodi-screensaver-crystalmorph: new package
  package/kodi-screensaver-greynetic: new package
  package/kodi-screensaver-pingpong: new package
  package/kodi-screensaver-pyro: new package
  package/kodi-screensaver-stars: new package
  package/kodi-visualisation-shadertoy: new package
  package/kodi-visualisation-waveform: new package
  package/kodi-visualisation-spectrum: new package
  package/kodi-visualisation-waveforhue: new package
  package/kodi-visualisation-goom: new package
  package/kodi-screensaver-rsxs: new package

 package/Config.in                                  |    2 +
 ...ix-dxva-playback-of-streams-that-don-t-st.patch |    6 +-
 package/ffmpeg/0014-fix-ff-thread-get-format.patch |  131 --------
 .../ffmpeg/0015-hevc-avoid-unnecessary-calls.patch |   72 -----
 package/ffmpeg/ffmpeg.hash                         |    2 +-
 package/ffmpeg/ffmpeg.mk                           |    2 +-
 package/kodi-addon-xvdr/kodi-addon-xvdr.mk         |    4 +-
 package/kodi-audiodecoder-modplug/Config.in        |    8 +
 .../kodi-audiodecoder-modplug.mk                   |   17 +
 package/kodi-audiodecoder-nosefart/Config.in       |    7 +
 .../kodi-audiodecoder-nosefart.mk                  |   17 +
 package/kodi-audiodecoder-sidplay/Config.in        |    8 +
 .../kodi-audiodecoder-sidplay.mk                   |   17 +
 package/kodi-audiodecoder-snesapu/Config.in        |    7 +
 .../kodi-audiodecoder-snesapu.mk                   |   17 +
 package/kodi-audiodecoder-stsound/Config.in        |    7 +
 .../kodi-audiodecoder-stsound.mk                   |   17 +
 package/kodi-audiodecoder-timidity/Config.in       |    7 +
 .../kodi-audiodecoder-timidity.mk                  |   17 +
 package/kodi-audiodecoder-vgmstream/Config.in      |    7 +
 .../kodi-audiodecoder-vgmstream.mk                 |   17 +
 package/kodi-audioencoder-flac/Config.in           |    1 +
 .../kodi-audioencoder-flac.mk                      |    2 +-
 package/kodi-audioencoder-lame/Config.in           |    1 +
 .../kodi-audioencoder-lame.mk                      |    2 +-
 package/kodi-audioencoder-vorbis/Config.in         |    1 +
 .../kodi-audioencoder-vorbis.mk                    |    2 +-
 package/kodi-audioencoder-wav/Config.in            |    1 +
 .../kodi-audioencoder-wav/kodi-audioencoder-wav.mk |    2 +-
 package/kodi-platform/Config.in                    |    7 +
 package/kodi-platform/kodi-platform.mk             |   17 +
 package/kodi-pvr-addons/Config.in                  |    6 -
 package/kodi-pvr-addons/kodi-pvr-addons.mk         |   27 --
 package/kodi-pvr-argustv/Config.in                 |    7 +
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk       |   17 +
 package/kodi-pvr-dvblink/Config.in                 |    8 +
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk       |   17 +
 package/kodi-pvr-dvbviewer/Config.in               |    7 +
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   |   17 +
 package/kodi-pvr-filmon/Config.in                  |    8 +
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk         |   17 +
 package/kodi-pvr-hts/Config.in                     |    7 +
 package/kodi-pvr-hts/kodi-pvr-hts.mk               |   17 +
 package/kodi-pvr-iptvsimple/Config.in              |    7 +
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk |   17 +
 package/kodi-pvr-mediaportal-tvserver/Config.in    |    7 +
 .../kodi-pvr-mediaportal-tvserver.mk               |   17 +
 package/kodi-pvr-mythtv/Config.in                  |    7 +
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk         |   17 +
 package/kodi-pvr-nextpvr/Config.in                 |    7 +
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk       |   17 +
 package/kodi-pvr-njoy/Config.in                    |    7 +
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk             |   17 +
 package/kodi-pvr-pctv/Config.in                    |    8 +
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk             |   17 +
 package/kodi-pvr-stalker/Config.in                 |    7 +
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk       |   17 +
 package/kodi-pvr-vbox/Config.in                    |    7 +
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk             |   17 +
 package/kodi-pvr-vdr-vnsi/Config.in                |    7 +
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk     |   17 +
 package/kodi-pvr-vuplus/Config.in                  |    7 +
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk         |   17 +
 package/kodi-pvr-wmc/Config.in                     |    7 +
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk               |   17 +
 package/kodi-screensaver-asteroids/Config.in       |    6 +
 .../kodi-screensaver-asteroids.mk                  |   17 +
 package/kodi-screensaver-biogenesis/Config.in      |    6 +
 .../kodi-screensaver-biogenesis.mk                 |   17 +
 package/kodi-screensaver-crystalmorph/Config.in    |   10 +
 .../kodi-screensaver-crystalmorph.mk               |   17 +
 package/kodi-screensaver-greynetic/Config.in       |    6 +
 .../kodi-screensaver-greynetic.mk                  |   17 +
 package/kodi-screensaver-pingpong/Config.in        |    6 +
 .../kodi-screensaver-pingpong.mk                   |   17 +
 package/kodi-screensaver-pyro/Config.in            |    6 +
 .../kodi-screensaver-pyro/kodi-screensaver-pyro.mk |   17 +
 .../kodi-screensaver-rsxs/0001-cross-compile.patch |   28 ++
 package/kodi-screensaver-rsxs/Config.in            |    6 +
 .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk |   15 +
 package/kodi-screensaver-stars/Config.in           |    6 +
 .../kodi-screensaver-stars.mk                      |   17 +
 .../0001-cross-compile.patch                       |   23 ++
 package/kodi-visualisation-goom/Config.in          |   10 +
 .../kodi-visualisation-goom.mk                     |   17 +
 package/kodi-visualisation-shadertoy/Config.in     |    6 +
 .../kodi-visualisation-shadertoy.mk                |   17 +
 package/kodi-visualisation-spectrum/Config.in      |    6 +
 .../kodi-visualisation-spectrum.mk                 |   17 +
 package/kodi-visualisation-waveforhue/Config.in    |    6 +
 .../kodi-visualisation-waveforhue.mk               |   17 +
 package/kodi-visualisation-waveform/Config.in      |    6 +
 .../kodi-visualisation-waveform.mk                 |   17 +
 package/kodi/0001-Fixup-include-path.patch         |   48 ---
 package/kodi/0002-texturepacker.patch              |   12 +
 ...make-device-change-event-support-optional.patch |  179 +++++++++++
 package/kodi/Config.in                             |  113 ++++---
 package/kodi/kodi.mk                               |   66 ++--
 package/libcec/0001-remove-Wno-psabi.patch         |   21 --
 package/libcec/Config.in                           |    4 +
 package/libcec/libcec.mk                           |   23 +-
 package/libplatform/Config.in                      |    6 +
 package/libplatform/libplatform.mk                 |   16 +
 package/libsquish/0001-kodi.patch                  |  327 ++++++++++++++++++++
 package/libsquish/Config.in                        |   13 +
 package/libsquish/libsquish.hash                   |    2 +
 package/libsquish/libsquish.mk                     |   36 +++
 107 files changed, 1660 insertions(+), 407 deletions(-)
 delete mode 100644 package/ffmpeg/0014-fix-ff-thread-get-format.patch
 delete mode 100644 package/ffmpeg/0015-hevc-avoid-unnecessary-calls.patch
 create mode 100644 package/kodi-audiodecoder-modplug/Config.in
 create mode 100644 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
 create mode 100644 package/kodi-audiodecoder-nosefart/Config.in
 create mode 100644 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
 create mode 100644 package/kodi-audiodecoder-sidplay/Config.in
 create mode 100644 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
 create mode 100644 package/kodi-audiodecoder-snesapu/Config.in
 create mode 100644 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
 create mode 100644 package/kodi-audiodecoder-stsound/Config.in
 create mode 100644 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
 create mode 100644 package/kodi-audiodecoder-timidity/Config.in
 create mode 100644 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
 create mode 100644 package/kodi-audiodecoder-vgmstream/Config.in
 create mode 100644 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
 create mode 100644 package/kodi-platform/Config.in
 create mode 100644 package/kodi-platform/kodi-platform.mk
 delete mode 100644 package/kodi-pvr-addons/Config.in
 delete mode 100644 package/kodi-pvr-addons/kodi-pvr-addons.mk
 create mode 100644 package/kodi-pvr-argustv/Config.in
 create mode 100644 package/kodi-pvr-argustv/kodi-pvr-argustv.mk
 create mode 100644 package/kodi-pvr-dvblink/Config.in
 create mode 100644 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
 create mode 100644 package/kodi-pvr-dvbviewer/Config.in
 create mode 100644 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
 create mode 100644 package/kodi-pvr-filmon/Config.in
 create mode 100644 package/kodi-pvr-filmon/kodi-pvr-filmon.mk
 create mode 100644 package/kodi-pvr-hts/Config.in
 create mode 100644 package/kodi-pvr-hts/kodi-pvr-hts.mk
 create mode 100644 package/kodi-pvr-iptvsimple/Config.in
 create mode 100644 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/Config.in
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
 create mode 100644 package/kodi-pvr-mythtv/Config.in
 create mode 100644 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
 create mode 100644 package/kodi-pvr-nextpvr/Config.in
 create mode 100644 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
 create mode 100644 package/kodi-pvr-njoy/Config.in
 create mode 100644 package/kodi-pvr-njoy/kodi-pvr-njoy.mk
 create mode 100644 package/kodi-pvr-pctv/Config.in
 create mode 100644 package/kodi-pvr-pctv/kodi-pvr-pctv.mk
 create mode 100644 package/kodi-pvr-stalker/Config.in
 create mode 100644 package/kodi-pvr-stalker/kodi-pvr-stalker.mk
 create mode 100644 package/kodi-pvr-vbox/Config.in
 create mode 100644 package/kodi-pvr-vbox/kodi-pvr-vbox.mk
 create mode 100644 package/kodi-pvr-vdr-vnsi/Config.in
 create mode 100644 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
 create mode 100644 package/kodi-pvr-vuplus/Config.in
 create mode 100644 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
 create mode 100644 package/kodi-pvr-wmc/Config.in
 create mode 100644 package/kodi-pvr-wmc/kodi-pvr-wmc.mk
 create mode 100644 package/kodi-screensaver-asteroids/Config.in
 create mode 100644 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
 create mode 100644 package/kodi-screensaver-biogenesis/Config.in
 create mode 100644 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
 create mode 100644 package/kodi-screensaver-crystalmorph/Config.in
 create mode 100644 package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
 create mode 100644 package/kodi-screensaver-greynetic/Config.in
 create mode 100644 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
 create mode 100644 package/kodi-screensaver-pingpong/Config.in
 create mode 100644 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
 create mode 100644 package/kodi-screensaver-pyro/Config.in
 create mode 100644 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
 create mode 100644 package/kodi-screensaver-rsxs/0001-cross-compile.patch
 create mode 100644 package/kodi-screensaver-rsxs/Config.in
 create mode 100644 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
 create mode 100644 package/kodi-screensaver-stars/Config.in
 create mode 100644 package/kodi-screensaver-stars/kodi-screensaver-stars.mk
 create mode 100644 package/kodi-visualisation-goom/0001-cross-compile.patch
 create mode 100644 package/kodi-visualisation-goom/Config.in
 create mode 100644 package/kodi-visualisation-goom/kodi-visualisation-goom.mk
 create mode 100644 package/kodi-visualisation-shadertoy/Config.in
 create mode 100644 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
 create mode 100644 package/kodi-visualisation-spectrum/Config.in
 create mode 100644 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
 create mode 100644 package/kodi-visualisation-waveforhue/Config.in
 create mode 100644 package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
 create mode 100644 package/kodi-visualisation-waveform/Config.in
 create mode 100644 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
 create mode 100644 package/kodi/0002-texturepacker.patch
 create mode 100644 package/kodi/0003-ALSA-make-device-change-event-support-optional.patch
 delete mode 100644 package/libcec/0001-remove-Wno-psabi.patch
 create mode 100644 package/libplatform/Config.in
 create mode 100644 package/libplatform/libplatform.mk
 create mode 100644 package/libsquish/0001-kodi.patch
 create mode 100644 package/libsquish/Config.in
 create mode 100644 package/libsquish/libsquish.hash
 create mode 100644 package/libsquish/libsquish.mk

-- 
1.7.10.4
