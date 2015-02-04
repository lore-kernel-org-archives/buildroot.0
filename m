From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:33:58 +0100
Subject: [Buildroot] [0/21] Add missing indirect dependencies
Message-ID: <1423010059-23446-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 With the fix for randconfig that I made in
http://patchwork.ozlabs.org/patch/432554/ it is now possible to run
'make randconfig' and get usable results. So I ran the following loop
to detect missing indirect dependencies:

while true; do make randconfig 2>&1 | grep warning; done

If there is a missing indirect dependency, this will output a line like:

warning: (BR2_PACKAGE_UTIL_LINUX_SETPRIV) selects BR2_PACKAGE_LIBCAP_NG which has unmet direct dependencies (!BR2_avr32)


 After this series, I ran about 6000 randconfigs and didn't encounter any
warning anymore.


 It would be good to include such a test in a jenkins job to detect this
type of error earlier.

 Regards,
 Arnout

----------------------------------------------------------------
Arnout Vandecappelle (Essensium/Mind) (21):
      python-coherence: add missing indirect dependency on c++
      gst-plugins-bad: add missing indirect dependency on atomics for rsvg
      gst1-plugins-bad: add missing indirect dependency on atomics for rsvg
      gst-plugins-base: add missing indirect dependency on atomics for pango
      gst1-plugins-base: add missing indirect dependency on atomics for pango
      qemu: add missing indirect dependency on dynamic library for fdt
      grantlee: add missing indirect dependency on jscore available
      libgail: add missing indirect dependency on C++ and atomics
      espeak: add missing indirect dependency on atomics for pulseaudio
      kodi: add missing indirect dependency on dynamic lib for shairport
      oprofile: add missing indirect dependency on NPTL for PPC
      util-linux: add missing indirect dependency on !avr32 for setpriv
      dovecot: add missing indirect dependency on !avr32 for mysql
      php: add missing indirect dependency on !avr32 for mysql extensions
      cwiid: add missing indirect dependency on atomics for wmgui
      opencv: add missing indirect dependency on atomics for gtk support
      pinenty: add missing indirect dependency on atomics for gtk2 support
      xscreensaver: add missing indirect dependency on atomics
      enlightenment: add missing indirect dependency on atomics
      qt5cinex: add missing indirect dependency on libegl
      qt5webkit: add missing indirect dependency on atomics and !flat

 package/cwiid/Config.in                        |  6 ++++++
 package/dovecot/Config.in                      |  6 ++++--
 package/enlightenment/Config.in                |  3 +++
 package/espeak/Config.in                       |  4 +++-
 package/grantlee/Config.in                     |  6 ++++--
 package/gstreamer/gst-plugins-bad/Config.in    | 11 +++++------
 package/gstreamer/gst-plugins-base/Config.in   | 10 ++++------
 package/gstreamer1/gst1-plugins-bad/Config.in  | 11 +++++------
 package/gstreamer1/gst1-plugins-base/Config.in | 10 ++++------
 package/kodi/Config.in                         |  4 ++++
 package/libgail/Config.in                      |  7 +++++--
 package/opencv/Config.in                       |  1 +
 package/oprofile/Config.in                     |  4 ++--
 package/php/Config.ext                         |  8 ++++++--
 package/pinentry/Config.in                     |  6 ++----
 package/python-coherence/Config.in             |  5 +++++
 package/qemu/Config.in                         |  8 ++++++++
 package/qt5/qt5webkit/Config.in                |  2 ++
 package/qt5cinex/Config.in                     |  5 +++--
 package/util-linux/Config.in                   |  1 +
 package/xscreensaver/Config.in                 | 13 ++++++++-----
 21 files changed, 85 insertions(+), 46 deletions(-)
