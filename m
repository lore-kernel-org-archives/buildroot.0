From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:12 +0100
Subject: [Buildroot] [pull request] Pull request for branch xorg-improvements
Message-ID: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a series of improvements to the X.org support. Initially, my
intention was to:

 (1) Fix the X.org modular vs. Kdrive selection as we discussed on the
     list recently (the selection was in the main X.org menu, while it
     should really be in the X.org server section of the
     configuration).

 (2) Fix all the incorrect dependencies on xserver-xorg_server: many X
     client applications or libraries where depending on the server,
     which is technically not correct.

In the end, I ended up doing a bit more cleanup in places, so this
series has grown to do a bit more. Here is a quick presentation of the
changes.

 * Patches 1 to 7 are fixes around the X.org modular vs. Kdrive
   selection (moving at the right place, renaming options), add
   support to build some Kdrive input drivers (evdev, mouse, kbd),
   etc.

 * Patch 8 remove the global X.org dependencies, that did not make
   sense.

 * Patch 9 remove useless dependencies of libX11, and patch 10 changes
   its list of dependencies to be on multiple lines.

 * Patch 11 changes cairo to depend on the appropriate X.org libraries
   and not the X server, and patch 12 updates Cairo to allows enable
   the XCB support (since all needed dependencies are always here).

 * Patch 13 and 14 remove the mandatory dependency of X.org server on
   openssl. X.org only needs an implementation of SHA1, and it can use
   one from either libsha1, libgcrypt, or openssl. So, in patch 23, we
   add a package for libsha1. And in patch 24, we modify the X.org
   server package to use libsha1 if neither libgcrypt nor openssl are
   available, or to use either libgcrypt or openssl if one of them is
   available.

 * Patch 15 changes docker to depend on the appropriate X.org
   libraries and not the X server.

 * Patch 16 changes fltk to depend on the appropriate X.org libraries
   and not the X server.

 * Patch 17 changes libgtk2 to depend on the appropriate X.org
   libraries and not the X server.

 * Patch 18 adds in libgtk2 the support for some optional X.org
   libraries.

 * Patch 19 cleans up atk, which does not need any X.org related
   option, and patch 20 removes the host variant of atk, which isn't
   used anywhere.

 * Patch 21 changes pango to depend on the appropriate X.org
   libraries and not the X server.

 * Patch 22 changes metacity to depend on the appropriate X.org
   libraries and not the X server.

 * Patch 23 changes rubix to depend on the appropriate X.org
   libraries and not the X server.

 * Patch 24 changes torsmo to depend on the appropriate X.org
   libraries and not the X server.

 * Patch 25 changes xvkbd to depend on the appropriate X.org libraries
   and not the X server, patch 26 cleans up the xvkbd package, and
   patch 27 removes the version from the patch file name of the xvkbd
   package.

 * Patch 28 fixes Webkit to not depend on X.org server, but on the
   X.org libraries.

I have done a fairly big number of builds to check all those changes,
but I'm pretty sure there will remain some corner cases: only the
autobuilders can find all those corner cases!

Best regards,

Thomas

The following changes since commit d3210cbac3cce63ae74fd2936849937b90c35cfb:

  gstreamer: provide necessary config value for AArch64 (2013-01-06 17:43:51 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git xorg-improvements

for you to fetch changes up to eeaa9cf0f64ff3eeee4360332b54c188d6c4d50f:

  webkit: remove X.org server dependency (2013-01-06 22:26:31 +0100)

----------------------------------------------------------------
Thomas Petazzoni (28):
      x11r7: move X.org server style option
      x11r7: remove useless depends on of X.org drivers
      x11r7: fix indentation
      xserver-xorg_server: Mention that TinyX is also known as Kdrive
      xserver_xorg-server: rename server-style configuration options
      xserver_xorg-server: option to build KDrive input drivers
      xserver_xorg-server: add more explanations about the two variants
      x11r7: do not globally select libraries
      xlib_libX11: do not depend on bigreqsproto nor xcmiscproto
      xlib_libX11: split the DEPENDENCIES variable on multiple lines
      libsha1: new package
      xserver_xorg-server: provide more options for SHA1 library
      cairo: do not depend on xserver-xorg_server, but on the right library
      cairo: always enable XCB support when X backend is enabled
      docker: depend on xlib_libX11 and not the X.org server
      fltk: replace dependency on X.org server with dependency on libraries
      libgtk2: replace dependency on X.org server by dependency on libraries
      libgtk2: add support for some optional X dependencies
      atk: remove useless configuration options
      atk: remove unused host variant
      pango: fix X.org dependencies
      metacity: fix X.org dependencies
      rubix: fix X.org dependency
      torsmo: fix X.org dependency
      xvkbd: fix X.org dependencies
      xvkbd: turn into a generic-package
      xvkbd: remove version from the patch file name
      webkit: remove X.org server dependency

 Config.in.legacy                                   |   16 +++++
 package/Config.in                                  |    1 +
 package/atk/atk.mk                                 |   12 ----
 package/cairo/Config.in                            |    1 +
 package/cairo/cairo.mk                             |    6 +-
 package/docker/Config.in                           |    1 +
 package/docker/docker.mk                           |    2 +-
 package/efl/libevas/Config.in                      |    8 +--
 package/fltk/Config.in                             |    2 +
 package/fltk/fltk.mk                               |    2 +-
 package/libgtk2/Config.in                          |    5 ++
 package/libgtk2/libgtk2.mk                         |   38 ++++++++++-
 package/libsha1/Config.in                          |    9 +++
 package/libsha1/libsha1.mk                         |   15 +++++
 package/metacity/Config.in                         |   10 +++
 package/metacity/metacity.mk                       |   12 +++-
 package/pango/Config.in                            |    3 +
 package/pango/pango.mk                             |   13 +++-
 package/rubix/Config.in                            |    1 +
 package/rubix/rubix.mk                             |    2 +-
 package/torsmo/Config.in                           |    2 +
 package/torsmo/torsmo.mk                           |    2 +-
 package/webkit/webkit.mk                           |    2 +-
 package/x11r7/Config.in                            |   31 ++-------
 package/x11r7/mesa3d/Config.in                     |    2 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |    1 -
 .../x11r7/xdriver_xf86-input-joystick/Config.in    |    1 -
 .../x11r7/xdriver_xf86-input-keyboard/Config.in    |    1 -
 package/x11r7/xdriver_xf86-input-mouse/Config.in   |    1 -
 .../x11r7/xdriver_xf86-input-synaptics/Config.in   |    1 -
 package/x11r7/xdriver_xf86-input-tslib/Config.in   |    1 -
 package/x11r7/xdriver_xf86-input-vmmouse/Config.in |    1 -
 package/x11r7/xdriver_xf86-input-void/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-ark/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-ati/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-cirrus/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-dummy/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-fbdev/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-geode/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-glide/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-glint/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-i128/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-mga/Config.in     |    1 -
 .../x11r7/xdriver_xf86-video-neomagic/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-newport/Config.in |    1 -
 package/x11r7/xdriver_xf86-video-nv/Config.in      |    1 -
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-r128/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-savage/Config.in  |    1 -
 .../xdriver_xf86-video-siliconmotion/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-sis/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-tdfx/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-tga/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-trident/Config.in |    1 -
 package/x11r7/xdriver_xf86-video-v4l/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-vesa/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-voodoo/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-wsfb/Config.in    |    1 -
 package/x11r7/xlib_libX11/Config.in                |    2 -
 package/x11r7/xlib_libX11/xlib_libX11.mk           |   14 ++++-
 package/x11r7/xserver_xorg-server/Config.in        |   66 +++++++++++++++++++-
 .../xserver_xorg-server/xserver_xorg-server.mk     |   37 +++++++++--
 package/xvkbd/Config.in                            |    7 +++
 ...kbd-2.8-makefile.patch => xvkbd-makefile.patch} |    5 --
 package/xvkbd/xvkbd.mk                             |   25 ++++++--
 68 files changed, 279 insertions(+), 111 deletions(-)
 create mode 100644 package/libsha1/Config.in
 create mode 100644 package/libsha1/libsha1.mk
 rename package/xvkbd/{xvkbd-2.8-makefile.patch => xvkbd-makefile.patch} (99%)

Thanks,
-- 
Thomas Petazzoni
