From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 19 Jun 2013 23:13:59 -0500
Subject: [Buildroot] [PATCH v11 00/11] add Gstreamer 1.X for gst-omx support
Message-ID: <1371701651-7739-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds gst-omx support to buildroot. Thus, making it possible to use
gstreamer applications which utilize hardware acceleration on OpenMAX supported
systems.

In addition, the patches include the libvpx library and enablement in gstreamer.
This is meant to give an example of how to add support in the future.

To test this patch series on the Raspberry Pi, select the eglgles plugin in
gst1-plugins-bad and select gst-omx.  To decode a 720p h264 encoded .mov file,
the following gst-launch pipeline can be used.

Sample file: http://download.blender.org/peach/trailer/trailer_720p.mov

   # gst-launch-1.0 filesrc location=/path/to/file \
   #   ! qtdemux ! h264parse ! omx264dec ! eglglessink

v10 -> v11:
   - Add descriptions for each plugin from gst-inspect xml files.
   - Put plugins in "./configure --help" order
   - Add new options to gstreamer1
   - Include rudimentry gst-libav (needs additional work) 

v9 -> v10:
   - Bump to gstreamer version 1.1.1 which due to poor packaging required a
     patch to reinclude some header files.
   - Add licensing information.
   - Cleanup headers and whitespace changes.

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

Spenser Gilliland (11):
  gstreamer1: Add gstreamer version 1.1.1 package
  gstreamer: update for gstreamer1
  gst1-plugins-base: add gstreamer1 base plugins
  gst1-plugins-good: add gstreamer1 good plugins
  gst1-plugins-bad: add gstreamer1 bad plugins
  gst1-plugins-ugly: add gstreamer1 ugly plugins
  gst1-plugins-good: add libvpx support
  gst-omx: add gst-omx package
  multimedia: reorganize for gst1
  libav: add new package
  gst-libav: add libav plugin for gtreamer 1.x

 package/multimedia/Config.in                       |   21 +-
 package/multimedia/gst-libav/Config.in             |   16 +
 package/multimedia/gst-libav/gst-libav.mk          |   18 +
 package/multimedia/gst-omx/Config.in               |   11 +
 .../multimedia/gst-omx/gst-omx-config-files.patch  |  127 ++++
 package/multimedia/gst-omx/gst-omx.mk              |   37 ++
 package/multimedia/gst1-plugins-bad/Config.in      |  457 +++++++++++++
 .../gst1-plugins-bad-dist-opencv-headers.patch     |  214 ++++++
 .../gst1-plugins-bad-use-gettext-0.18.patch        |   17 +
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  691 ++++++++++++++++++++
 package/multimedia/gst1-plugins-base/Config.in     |  153 +++++
 .../gst1-plugins-base/gst1-plugins-base.mk         |  206 ++++++
 package/multimedia/gst1-plugins-good/Config.in     |  330 ++++++++++
 .../gst1-plugins-good/gst1-plugins-good.mk         |  411 ++++++++++++
 package/multimedia/gst1-plugins-ugly/Config.in     |   69 ++
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  104 +++
 package/multimedia/gstreamer/Config.in             |    3 +-
 package/multimedia/gstreamer1/Config.in            |   55 ++
 package/multimedia/gstreamer1/gstreamer1.mk        |   40 ++
 package/multimedia/libav/Config.in                 |  158 +++++
 package/multimedia/libav/libav.mk                  |  200 ++++++
 21 files changed, 3333 insertions(+), 5 deletions(-)
 create mode 100644 package/multimedia/gst-libav/Config.in
 create mode 100644 package/multimedia/gst-libav/gst-libav.mk
 create mode 100644 package/multimedia/gst-omx/Config.in
 create mode 100644 package/multimedia/gst-omx/gst-omx-config-files.patch
 create mode 100644 package/multimedia/gst-omx/gst-omx.mk
 create mode 100644 package/multimedia/gst1-plugins-bad/Config.in
 create mode 100644 package/multimedia/gst1-plugins-bad/gst1-plugins-bad-dist-opencv-headers.patch
 create mode 100644 package/multimedia/gst1-plugins-bad/gst1-plugins-bad-use-gettext-0.18.patch
 create mode 100644 package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
 create mode 100644 package/multimedia/gst1-plugins-base/Config.in
 create mode 100644 package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
 create mode 100644 package/multimedia/gst1-plugins-good/Config.in
 create mode 100644 package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
 create mode 100644 package/multimedia/gst1-plugins-ugly/Config.in
 create mode 100644 package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
 create mode 100644 package/multimedia/gstreamer1/Config.in
 create mode 100644 package/multimedia/gstreamer1/gstreamer1.mk
 create mode 100644 package/multimedia/libav/Config.in
 create mode 100644 package/multimedia/libav/libav.mk

-- 
1.7.9.5
