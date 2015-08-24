From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2015 14:47:07 +0200
Subject: [Buildroot] [pull request] package/opencv: re-introduce opencv24
Message-ID: <cover.1440420122.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

As reported by Jonathan [0], some packages use the legacy OpenCV-2.4 API
and have not yet been ported over to the new and incompatible OpenCV-3.

So, this series;
  - renames the OpenCV-3 package from opencv to opencv3
  - reintroduces OpenCV-2.4 as opencv
  - makes opencv and opencv3 mutually exclusive (with a preference
    toward opencv, thus OpenCV-2.4)
  - restores the Gstreamer-1 plugin support for OpenCV-2.4
  - updates vlc to support both opencv and opencv3

[0] http://lists.busybox.net/pipermail/buildroot/2015-August/135270.html

Regards,
Yann E. MORIN.


The following changes since commit 7deaa277fd4c89c67de39ea21b4cd081ab85366f:

  arch/arm: add missing arm1136j-s variant (2015-08-24 00:43:12 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/opencv3-opencv24

for you to fetch changes up to 1425d9f346c52e716c02b09c21b377e93033db94:

  package/vlc: update opencv support (2015-08-24 10:33:51 +0200)

----------------------------------------------------------------
Samuel Martin (4):
      package: rename opencv -> opencv3
      package/opencv: re-introduce opencv for opencv-2.4
      Revert "package/gstreamer1/gst1-plugins-bad: disable opencv plugin with opencv-3"
      package/vlc: update opencv support

 Config.in.legacy                                   |  32 --
 package/Config.in                                  |   1 +
 package/gstreamer1/gst1-plugins-bad/Config.in      |  20 +-
 .../0001-core-fix-x86-PIC-code-compilation.patch   |  49 +++
 ...ix-return-type-value-VideoFrameSource_GPU.patch |  40 +++
 ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch | 156 +++++++++
 package/opencv/Config.in                           | 278 +++++-----------
 package/opencv/opencv.mk                           | 151 ++-------
 ...pthread-based-parallel_for-with-gcc-4.4.3.patch |   0
 ...002-fix-support-for-pthreads-parallel_for.patch |   0
 package/opencv3/Config.in                          | 344 +++++++++++++++++++
 package/opencv3/opencv3.mk                         | 363 +++++++++++++++++++++
 package/vlc/Config.in                              |  14 +-
 package/vlc/vlc.mk                                 |   6 +-
 14 files changed, 1083 insertions(+), 371 deletions(-)
 create mode 100644 package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
 create mode 100644 package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
 create mode 100644 package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
 rename package/{opencv => opencv3}/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch (100%)
 rename package/{opencv => opencv3}/0002-fix-support-for-pthreads-parallel_for.patch (100%)
 create mode 100644 package/opencv3/Config.in
 create mode 100644 package/opencv3/opencv3.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
