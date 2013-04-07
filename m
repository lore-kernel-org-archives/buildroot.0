From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 21:57:14 +0200
Subject: [Buildroot] [PATCHv5 00/14] More Qt5 stuff
Message-ID: <1365364648-30568-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that add more Qt5 support in Buildroot. I
have built a number of different combinations, but there are some many
different possibilities, that I obviously couldn't test all of
them. Some testing will be appreciated, but for sure, only the
autobuilders will really help in getting a good build coverage of all
this.

Changes v4 -> v5:

 * Add some support for static libraries build and installation.
 * Add some missing OpenGL ES dependencies.
 * Improve the qmake.conf to specify a INCLUDEPATH directive that is
   needed to properly build certain external Qt5 modules.
 * Rebased on top of master.

Changes v3 -> v4:

 * Rebased on top of master (and therefore removed all the patches
   that have already been merged)
 * Removed the OpenSSL Qt5 specific option, and automatically enable
   OpenSSL support when the package is available. Requested by Peter
   Korsgaard.
 * Make Qt4 and Qt5 mutually exclusive. Suggested by Arnout
   Vandecappelle.

Changes v2 -> v3:

 * Drop patches that have been merged upstream.
 * Fix the xcb-util package to depend on libxcb.
 * Fix the xcb-util-wm package to depend on libxcb.
 * Bump the version of Qt5 to 5.0.1 (instead of 5.0.0)
 * Add patch from Floris Bos to fix Qt5Webkit build with an OpenGLES
   backend.
 * Fix QT5_BASE -> QT5BASE, noticed by Lionel Orry.
 * Add missing "depends on" in Qt5Quick, Qt5Multimedia and
   Qt5GraphicalEffects. They all select Qt5Declarative, which itself
   depends on the availability of an OpenGLES backend.

Changes v1 -> v2:

 * Make the package that depended on host-jpeg depend on host-libjpeg
   directly, so that we don't need to provide a virtual host-jpeg
   package.
 * Integrated patches from Floris Bos to fix issues related RPi
   OpenGLES/EGL libraries, and to get the installation of fonts done
   by the qt5base package.
 * pcre: fixed typo is -> if in commit log [Gustavo Zacarias]
 * pcre: fix help text in Config.in [Gustavo Zacarias]

The patches are also available from:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=qt5

Best regards,

Thomas

Floris Bos (1):
  qt5webkit: add EGL dir to includepath

Thomas Petazzoni (13):
  qt5: disallow the selection of Qt4 and Qt5
  qt5base: support static library building
  qt5base: adjust linux-buildroot-g++ qmake.conf
  qt5/qt5svg: new package
  qt5/qt5script: new package
  qt5/qt5imageformats: new package
  qt5/qt5xmlpatterns: new package
  qt5/qt5jsbackend: new package
  qt5/qt5declarative: new package
  qt5/qt5graphicaleffects: new package
  qt5/qt5multimedia: new package
  qt5/qt5webkit: new package
  qt5/qt5quick1: new package

 package/qt5/Config.in                              |   11 ++++
 package/qt5/qt5base/qt5base-mkspecs-files.patch    |   24 +++++----
 package/qt5/qt5base/qt5base.mk                     |   21 ++++++--
 package/qt5/qt5declarative/Config.in               |   18 +++++++
 package/qt5/qt5declarative/qt5declarative.mk       |   54 ++++++++++++++++++++
 package/qt5/qt5graphicaleffects/Config.in          |   16 ++++++
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |   40 +++++++++++++++
 package/qt5/qt5imageformats/Config.in              |   10 ++++
 package/qt5/qt5imageformats/qt5imageformats.mk     |   41 +++++++++++++++
 package/qt5/qt5jsbackend/Config.in                 |   10 ++++
 ...t5jsbackend-dont-import-bz2-python-module.patch |   29 +++++++++++
 .../qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch |   33 ++++++++++++
 package/qt5/qt5jsbackend/qt5jsbackend.mk           |   43 ++++++++++++++++
 package/qt5/qt5multimedia/Config.in                |   16 ++++++
 package/qt5/qt5multimedia/qt5multimedia.mk         |   49 ++++++++++++++++++
 package/qt5/qt5quick1/Config.in                    |   22 ++++++++
 package/qt5/qt5quick1/qt5quick1.mk                 |   45 ++++++++++++++++
 package/qt5/qt5script/Config.in                    |   10 ++++
 package/qt5/qt5script/qt5script.mk                 |   43 ++++++++++++++++
 package/qt5/qt5svg/Config.in                       |   11 ++++
 package/qt5/qt5svg/qt5svg.mk                       |   50 ++++++++++++++++++
 package/qt5/qt5webkit/Config.in                    |   14 +++++
 .../qt5/qt5webkit/qt5webkit-egl-includepath.patch  |   40 +++++++++++++++
 package/qt5/qt5webkit/qt5webkit.mk                 |   43 ++++++++++++++++
 package/qt5/qt5xmlpatterns/Config.in               |   10 ++++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |   43 ++++++++++++++++
 26 files changed, 732 insertions(+), 14 deletions(-)
 create mode 100644 package/qt5/qt5declarative/Config.in
 create mode 100644 package/qt5/qt5declarative/qt5declarative.mk
 create mode 100644 package/qt5/qt5graphicaleffects/Config.in
 create mode 100644 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
 create mode 100644 package/qt5/qt5imageformats/Config.in
 create mode 100644 package/qt5/qt5imageformats/qt5imageformats.mk
 create mode 100644 package/qt5/qt5jsbackend/Config.in
 create mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-dont-import-bz2-python-module.patch
 create mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
 create mode 100644 package/qt5/qt5jsbackend/qt5jsbackend.mk
 create mode 100644 package/qt5/qt5multimedia/Config.in
 create mode 100644 package/qt5/qt5multimedia/qt5multimedia.mk
 create mode 100644 package/qt5/qt5quick1/Config.in
 create mode 100644 package/qt5/qt5quick1/qt5quick1.mk
 create mode 100644 package/qt5/qt5script/Config.in
 create mode 100644 package/qt5/qt5script/qt5script.mk
 create mode 100644 package/qt5/qt5svg/Config.in
 create mode 100644 package/qt5/qt5svg/qt5svg.mk
 create mode 100644 package/qt5/qt5webkit/Config.in
 create mode 100644 package/qt5/qt5webkit/qt5webkit-egl-includepath.patch
 create mode 100644 package/qt5/qt5webkit/qt5webkit.mk
 create mode 100644 package/qt5/qt5xmlpatterns/Config.in
 create mode 100644 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk

-- 
1.7.9.5
