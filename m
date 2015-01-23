From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 00:24:39 +0100
Subject: [Buildroot] [PATCH 0/14 v6] NVidia GPU binary blobs for x86 and ARM
	(branch yem/gfx)
Message-ID: <cover.1422055104.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds support for NVidia's binary blob, the driver to its
family of GPUs, for x86 (by Yann) and Tegra2 and Tegra3 (by Nicolas).

It also introduces the OpenGL Registry, to provide GL headers for
those OpenGL/EGL/GLES implementations that do not provide their own
headers (like NVidia's binary blob.)

The x86 drivers were build- and runtile-tested using XBMC (not yet with
Kodi); the tests were very shallow, though, and not everything was
thouroughly tested (especially the video decoding part), but it is
apparently working OK so far.


Changes v5 -> v6:
  - make python-lxml a target package too  (Yegor)
  - rename the packages and move one directory up  (J?r?me)
  - use mesa3d to provide additional headers, don;t bundle them
  - install extra GLES platform headers  (Nicolas)
  - x86 nvidia driver installs a gl.pc file  (J?r?me)
  - drop JPEG HW acceleration for Tegra2/3, since we do not have
    the headers  (Nicolas)

Changes v4 -> v5:
  - fix env vars when building opengl-registry

Changes v3 -> v4:
  - integrate the Tegra2/3 driver from Nicolas
  - lots of cleanups in the packages for Tegra2/3
  - further fixes after Thomas comments
  - introduce more of the Khronos registry (OpenMAX, OpenKode...)

Changes v2 -> v3:
  - some rewrite after Thomas comments

Changes v1 -> v2:
  - bump opengl-registry
  - drop i915, applied  (Peter)



Regards,
Yann E. MORIN.


The following changes since commit dfdf173a4c7ca1c8584833a7286df37cb008fdb2:

  qt: add X11 support (2015-01-23 23:32:23 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/gfx

for you to fetch changes up to a7e8708b7a6bd74374470fd8a453c612de9a60dd:

  package/nvidia-tegra23-codecs: new package (2015-01-23 23:48:33 +0100)

----------------------------------------------------------------
J?r?me Pouiller (1):
      package/nvidia-driver: Add gl.pc

Nicolas Serafini (3):
      package/nvidia-tegra23-binaries: new package
      package.nvidia-tegra23-binaries: add gstreamer plugins
      package/nvidia-tegra23-codecs: new package

Yann E. MORIN (9):
      package/python-lxml: new host package
      package/khronos-registry-khrplatform: new package
      package/khronos-registry-openkode: new package
      package/mesa3d-headers: new package
      package/khronos-registry-opengl: new package
      package/khronos-registry-opengl: download and install extra headers
      package/khronos-registry-openmaxil: new package
      package/nvidia-driver: add NVidia's OpenGL binary blob
      package/nvidia-driver: build the kernel module

Yegor Yefremov (1):
      package/python-lxml: add target variant

 package/Config.in                                  |   4 +
 package/mesa3d-headers/Config.in                   |   8 +
 package/mesa3d-headers/mesa3d-headers.hash         |   2 +
 package/mesa3d-headers/mesa3d-headers.mk           |  57 ++++++++
 package/nvidia-driver/Config.in                    |  65 +++++++++
 package/nvidia-driver/gl.pc                        |  11 ++
 package/nvidia-driver/nvidia-driver.hash           |   3 +
 package/nvidia-driver/nvidia-driver.mk             | 161 +++++++++++++++++++++
 package/nvidia-tegra23/Config.in                   |  37 +++++
 .../nvidia-tegra23-binaries/Config.in              | 110 ++++++++++++++
 .../nvidia-tegra23/nvidia-tegra23-binaries/egl.pc  |  10 ++
 .../nvidia-tegra23/nvidia-tegra23-binaries/gles.pc |  10 ++
 .../nvidia-tegra23-binaries/glesv2.pc              |  10 ++
 .../nvidia-tegra23-binaries.hash                   |   3 +
 .../nvidia-tegra23-binaries.mk                     | 130 +++++++++++++++++
 .../nvidia-tegra23/nvidia-tegra23-codecs/Config.in |   7 +
 .../nvidia-tegra23-codecs.hash                     |   3 +
 .../nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk |  41 ++++++
 package/nvidia-tegra23/nvidia-tegra23.mk           |  17 +++
 package/opengl/Config.in                           |   6 +
 .../opengl/khronos-registry-khrplatform/Config.in  |  11 ++
 .../khronos-registry-khrplatform.hash              |   2 +
 .../khronos-registry-khrplatform.mk                |  28 ++++
 .../0001-run-from-current-dir.patch                |  17 +++
 package/opengl/khronos-registry-opengl/Config.in   |  25 ++++
 .../khronos-registry-opengl.hash                   |   4 +
 .../khronos-registry-opengl.mk                     | 115 +++++++++++++++
 package/opengl/khronos-registry-openkode/Config.in |  15 ++
 .../khronos-registry-openkode.hash                 |   7 +
 .../khronos-registry-openkode.mk                   |  49 +++++++
 .../opengl/khronos-registry-openmaxil/Config.in    |  20 +++
 .../khronos-registry-openmax.hash                  |   3 +
 .../khronos-registry-openmaxil.mk                  |  32 ++++
 package/python-lxml/Config.in                      |  10 ++
 package/python-lxml/python-lxml.hash               |   2 +
 package/python-lxml/python-lxml.mk                 |  33 +++++
 36 files changed, 1068 insertions(+)
 create mode 100644 package/mesa3d-headers/Config.in
 create mode 100644 package/mesa3d-headers/mesa3d-headers.hash
 create mode 100644 package/mesa3d-headers/mesa3d-headers.mk
 create mode 100644 package/nvidia-driver/Config.in
 create mode 100644 package/nvidia-driver/gl.pc
 create mode 100644 package/nvidia-driver/nvidia-driver.hash
 create mode 100644 package/nvidia-driver/nvidia-driver.mk
 create mode 100644 package/nvidia-tegra23/Config.in
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/egl.pc
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/gles.pc
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/glesv2.pc
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23.mk
 create mode 100644 package/opengl/khronos-registry-khrplatform/Config.in
 create mode 100644 package/opengl/khronos-registry-khrplatform/khronos-registry-khrplatform.hash
 create mode 100644 package/opengl/khronos-registry-khrplatform/khronos-registry-khrplatform.mk
 create mode 100644 package/opengl/khronos-registry-opengl/0001-run-from-current-dir.patch
 create mode 100644 package/opengl/khronos-registry-opengl/Config.in
 create mode 100644 package/opengl/khronos-registry-opengl/khronos-registry-opengl.hash
 create mode 100644 package/opengl/khronos-registry-opengl/khronos-registry-opengl.mk
 create mode 100644 package/opengl/khronos-registry-openkode/Config.in
 create mode 100644 package/opengl/khronos-registry-openkode/khronos-registry-openkode.hash
 create mode 100644 package/opengl/khronos-registry-openkode/khronos-registry-openkode.mk
 create mode 100644 package/opengl/khronos-registry-openmaxil/Config.in
 create mode 100644 package/opengl/khronos-registry-openmaxil/khronos-registry-openmax.hash
 create mode 100644 package/opengl/khronos-registry-openmaxil/khronos-registry-openmaxil.mk
 create mode 100644 package/python-lxml/Config.in
 create mode 100644 package/python-lxml/python-lxml.hash
 create mode 100644 package/python-lxml/python-lxml.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
