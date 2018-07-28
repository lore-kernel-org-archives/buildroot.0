From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 28 Jul 2018 19:24:51 -0400
Subject: [Buildroot] [PATCH v7 0/5] Gobject-introspection: New package
Message-ID: <20180728232456.19550-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am releasing version 7 of the gobject-introspection patch series.
I received reports of some packages requiring installed .typelib files
on the target filing system from the gobject-introspection package.
Previous versions of this patch had the configure flag
of --disable-introspection-data set. This patch now sets this flag
to enabled, which builds the .typelib files.

This change requires a few changes, however:

First: I wasn't able to get the cross-ldd script to work correctly.
What was happening was that cross-ldd was calling out my host-ldd,
which then would cause the .typelib files to fail the linking step.
Adding the prelink-cross package fixes this issue. As such, I removed
the cross-ldd wrapper from package/gobject-introspection.

Second: I had to move some logic around first to install the ldd and qemu
wrappers first, as gobject-introspection calls g-ir-ldd-wrapper and
g-ir-scanner-qemuwrapper during the compiling process.


Adam Duskett (5):
  binutils: install libiberty for host build.
  prelink-cross: new package
  gstreamer1 packages: explicitly disable introspection
  gobject-introspection: new package
  gstreamer1 packages: add support for introspection

 DEVELOPERS                                    |   1 +
 Makefile                                      |   2 +
 package/Config.in                             |   1 +
 package/Config.in.host                        |   1 +
 package/binutils/binutils.mk                  |   1 +
 ...lete-upstream-attempt-at-cross-compi.patch |  50 +++++
 ...-host-gi-gi-cross-wrapper-gi-ldd-wra.patch | 203 ++++++++++++++++++
 ...canner-add-use-binary-wrapper-option.patch |  52 +++++
 ...scanner-add-a-use-ldd-wrapper-option.patch |  48 +++++
 .../0005-add-PYTHON_INCLUDES-override.patch   |  39 ++++
 ...scanner-add-a-lib-dirs-envvar-option.patch |  73 +++++++
 .../0007-Add-rpath-links-to-ccompiler.patch   |  29 +++
 package/gobject-introspection/Config.in       |  30 +++
 .../gobject-introspection/g-ir-compiler.in    |   2 +
 .../g-ir-scanner-lddwrapper.in                |   2 +
 .../g-ir-scanner-qemuwrapper.in               |  10 +
 package/gobject-introspection/g-ir-scanner.in |   3 +
 .../gobject-introspection.hash                |   4 +
 .../gobject-introspection.mk                  |  98 +++++++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk      |   8 +-
 ...ect-reference-to-gstreamer-sdp-in-Ma.patch |  26 +++
 .../gst1-plugins-base/gst1-plugins-base.mk    |   8 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk   |   7 +
 package/pkg-autotools.mk                      |   3 +
 package/prelink-cross/Config.in.host          |   6 +
 package/prelink-cross/prelink-cross.hash      |   3 +
 package/prelink-cross/prelink-cross.mk        |  15 ++
 27 files changed, 723 insertions(+), 2 deletions(-)
 create mode 100644 package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
 create mode 100644 package/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
 create mode 100644 package/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0005-add-PYTHON_INCLUDES-override.patch
 create mode 100644 package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
 create mode 100644 package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
 create mode 100644 package/gobject-introspection/Config.in
 create mode 100644 package/gobject-introspection/g-ir-compiler.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-lddwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-qemuwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner.in
 create mode 100644 package/gobject-introspection/gobject-introspection.hash
 create mode 100644 package/gobject-introspection/gobject-introspection.mk
 create mode 100644 package/gstreamer1/gst1-plugins-base/0001-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
 create mode 100644 package/prelink-cross/Config.in.host
 create mode 100644 package/prelink-cross/prelink-cross.hash
 create mode 100644 package/prelink-cross/prelink-cross.mk

-- 
2.17.1
