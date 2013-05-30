From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 30 May 2013 11:30:23 -0500
Subject: [Buildroot] [PATCH v9 00/14] add Gstreamer 1.X for gst-omx support
Message-ID: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds gst-omx support to buildroot. Thus, making it possible to use
gstreamer applications which utilize hardware acceleration on OpenMAX supported
systems.

To add gst-omx, libglib2 is bumped to 2.36.1 and gstreamer1 is added.

In addition, the patches include the libvpx library and enablement in gstreamer.
This is meant to give an example of how to add support in the future.

To test this patch series on the Raspberry Pi, select the eglgles plugin in
gst1-plugins-bad and select gst-omx.  To decode a 720p h264 encoded .mov file,
the following gst-launch pipeline can be used.

Sample file: http://download.blender.org/peach/trailer/trailer_720p.mov
   
   # gst-launch-1.0 filesrc location=/path/to/file \
   #   ! qtdemux ! h264parse ! omx264dec ! eglglessink

v8 -> v9:
   - Fix webkit build failures due to libglib2 bump.
   - bump gdk-pixbuf to 2.28.1
   - bump libgtk2 to 2.24.18
   - bump libsoup to 2.43.1
   - bump webkit to 1.9.6

v7 -> v8:
   - Incoporate threads patch and rebase on top of master.

v6 -> v7:
   - Additional verification complete with both RPi and Bellagio.
   - Moved additional includes to the gst-omx and gst-plugins bad packages for
     openmax and eglgles.
   - A patch was added that ensures that the config files point to the correct
     location.

v5 -> v6:
   - Combined libglib patches to allow git-bisect
   - added libopenmax virtual package for gst-omx (and future omx packages)

v4 -> v5:
   - added gst-omx as a new package
   - combined glib bump to 2.36.1 with gstreamer 1.x and gst-omx (libglib
     2.32.1 is required for gstreamer 1.X)

v3 -> v4:
   - uses new style if/endif syntax and removes depends properties for
     config elements in gstreamer1

v2 -> v3:
   - fixes issues found while building with all/none plugins enabled
   - change naming from gst-plugins-<blah>1 to gst1-plugins-<blah>
   - options which require currently unpackged libraries are disabled

v1 -> v2:
   - completed patch by adding good/bad/ugly plguins.


*** BLURB HERE ***

Spenser Gilliland (14):
  libglib2: Bump libglib2 to 2.36.1
  gdk-pixbuf: bump to version 2.28.1
  libgtk2: bump to version 2.24.18
  libsoup: bump to version 2.43.1
  webkit: bump to version 1.9.6
  gstreamer1: Add gstreamer version 1.0.7 package
  gst1-plugins-base: add gstreamer1 base plugins
  gst1-plugins-good: add gstreamer1 good plugins
  gst1-plugins-bad: add gstreamer1 bad plugins
  gst1-plugins-ugly: add gstreamer1 ugly plugins
  libvpx: new package libvpx
  gst1-plugins-good: add libvpx support
  libopenmax: Add libopenmax virtual package
  gst-omx: add gst-omx package

 package/gdk-pixbuf/gdk-pixbuf.mk                   |    2 +-
 package/glib-networking/glib-networking.mk         |    4 +-
 package/glibmm/glibmm.mk                           |    2 +-
 ...ib2-0004-fix-build-when-no-thread-support.patch |   18 +-
 ...b2-make-codegen-python2-python3-compliant.patch |  192 ------
 package/libglib2/libglib2-no-tests.patch           |  117 ----
 package/libglib2/libglib2.mk                       |   10 +-
 package/libgtk2/Config.in                          |   13 +-
 package/libgtk2/libgtk2-reduce-dependencies.patch  |   51 +-
 package/libgtk2/libgtk2.mk                         |    2 +-
 package/libsoup/Config.in                          |    1 +
 package/libsoup/libsoup.mk                         |    6 +-
 package/multimedia/Config.in                       |    7 +
 package/multimedia/bellagio/Config.in              |    1 +
 package/multimedia/gst-omx/Config.in               |   11 +
 .../multimedia/gst-omx/gst-omx-config-files.patch  |  127 ++++
 package/multimedia/gst-omx/gst-omx.mk              |   37 ++
 package/multimedia/gst1-plugins-bad/Config.in      |  325 ++++++++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  664 +++++++++++++++++++
 package/multimedia/gst1-plugins-base/Config.in     |  106 +++
 .../gst1-plugins-base/gst1-plugins-base.mk         |  201 ++++++
 package/multimedia/gst1-plugins-good/Config.in     |  218 +++++++
 .../gst1-plugins-good/gst1-plugins-good.mk         |  406 ++++++++++++
 package/multimedia/gst1-plugins-ugly/Config.in     |   49 ++
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |   89 +++
 package/multimedia/gstreamer1/Config.in            |   38 ++
 package/multimedia/gstreamer1/gstreamer1.mk        |   36 ++
 package/multimedia/libvpx/Config.in                |    6 +
 package/multimedia/libvpx/libvpx.mk                |   53 ++
 package/opengl/Config.in                           |    3 +
 package/opengl/libopenmax/libopenmax.mk            |   24 +
 package/rpi-userland/Config.in                     |    1 +
 package/webkit/webkit-bison-2-6-compat.patch       |  672 --------------------
 package/webkit/webkit-disable-docrebase.patch      |   21 +
 package/webkit/webkit-disable-tests.patch          |   76 +++
 package/webkit/webkit-execinfo_h.patch             |   24 +
 .../webkit-fix-build-issue-with-old-gtk.patch      |   22 -
 package/webkit/webkit-fix-build-with-gcc-4-6.patch |   45 --
 .../webkit-fix-compilation-on-DirectFB-2.patch     |   33 -
 .../webkit-fix-compilation-on-DirectFB.patch       |  144 -----
 package/webkit/webkit-fix-pool.patch               |   67 --
 package/webkit/webkit-pthread_getattr_np.patch     |   80 ---
 package/webkit/webkit.mk                           |   31 +-
 43 files changed, 2598 insertions(+), 1437 deletions(-)
 delete mode 100644 package/libglib2/libglib2-make-codegen-python2-python3-compliant.patch
 delete mode 100644 package/libglib2/libglib2-no-tests.patch
 create mode 100644 package/multimedia/gst-omx/Config.in
 create mode 100644 package/multimedia/gst-omx/gst-omx-config-files.patch
 create mode 100644 package/multimedia/gst-omx/gst-omx.mk
 create mode 100644 package/multimedia/gst1-plugins-bad/Config.in
 create mode 100644 package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
 create mode 100644 package/multimedia/gst1-plugins-base/Config.in
 create mode 100644 package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
 create mode 100644 package/multimedia/gst1-plugins-good/Config.in
 create mode 100644 package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
 create mode 100644 package/multimedia/gst1-plugins-ugly/Config.in
 create mode 100644 package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
 create mode 100644 package/multimedia/gstreamer1/Config.in
 create mode 100644 package/multimedia/gstreamer1/gstreamer1.mk
 create mode 100644 package/multimedia/libvpx/Config.in
 create mode 100644 package/multimedia/libvpx/libvpx.mk
 create mode 100644 package/opengl/libopenmax/libopenmax.mk
 delete mode 100644 package/webkit/webkit-bison-2-6-compat.patch
 create mode 100644 package/webkit/webkit-disable-docrebase.patch
 create mode 100644 package/webkit/webkit-disable-tests.patch
 create mode 100644 package/webkit/webkit-execinfo_h.patch
 delete mode 100644 package/webkit/webkit-fix-build-issue-with-old-gtk.patch
 delete mode 100644 package/webkit/webkit-fix-build-with-gcc-4-6.patch
 delete mode 100644 package/webkit/webkit-fix-compilation-on-DirectFB-2.patch
 delete mode 100644 package/webkit/webkit-fix-compilation-on-DirectFB.patch
 delete mode 100644 package/webkit/webkit-fix-pool.patch
 delete mode 100644 package/webkit/webkit-pthread_getattr_np.patch

-- 
1.7.9.5
