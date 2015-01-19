From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Jan 2015 21:40:37 +0100
Subject: [Buildroot] [PATCH 0/11 v5] NVidia GPU binary blobs for x86 and ARM
	(branch yem/gfx)
Message-ID: <cover.1421699898.git.yann.morin.1998@free.fr>
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


The following changes since commit 43fbfc30c8fdc74341ec413c89d4113e13a881ed:

  package/kodi: add missing dependency on libdrm (2015-01-19 13:23:22 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/gfx

for you to fetch changes up to 7d2c57b65c15c550508c615aa1986420ad1780cb:

  package/nvidia-tegra23-codecs: new package (2015-01-19 18:40:10 +0100)

----------------------------------------------------------------
Nicolas Serafini (4):
      package/nvidia-tegra23-binaries: new package
      package.nvidia-tegra23-binaries: add gstreamer plugins
      package/nvidia-tegra23-binaries: provides JPEG
      package/nvidia-tegra23-codecs: new package

Yann E. MORIN (7):
      package/python-lxml: new package
      package/khrplatform-registry: new package
      package/openkode-registry: new package
      package/opengl-registry: new package
      package/openmax-registry: new package
      package/nvidia-driver: add NVidia's OpenGL binary blob
      package/nvidia-driver: build the kernel module

 package/Config.in                                  |    2 +
 package/jpeg/Config.in                             |   10 +
 package/nvidia-driver/Config.in                    |   65 +
 package/nvidia-driver/nvidia-driver.hash           |    3 +
 package/nvidia-driver/nvidia-driver.mk             |  160 ++
 package/nvidia-tegra23/Config.in                   |   37 +
 .../nvidia-tegra23-binaries/Config.in              |  110 +
 .../nvidia-tegra23/nvidia-tegra23-binaries/egl.pc  |   10 +
 .../nvidia-tegra23/nvidia-tegra23-binaries/gles.pc |   10 +
 .../nvidia-tegra23-binaries/glesv2.pc              |   10 +
 .../nvidia-tegra23-binaries.hash                   |    3 +
 .../nvidia-tegra23-binaries.mk                     |  134 ++
 .../nvidia-tegra23/nvidia-tegra23-codecs/Config.in |    7 +
 .../nvidia-tegra23-codecs.hash                     |    3 +
 .../nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk |   41 +
 package/nvidia-tegra23/nvidia-tegra23.mk           |   17 +
 package/opengl/Config.in                           |    3 +
 package/opengl/khronos-registry/Config.in          |    4 +
 .../opengl/khronos-registry/khronos-registry.mk    |    1 +
 .../khrplatform-registry/Config.in                 |    7 +
 .../khrplatform-registry/khrplatform-registry.hash |    2 +
 .../khrplatform-registry/khrplatform-registry.mk   |   25 +
 .../khronos-registry/opengl-registry/Config.in     |   24 +
 .../opengl/khronos-registry/opengl-registry/gl.h   | 2115 ++++++++++++++++++++
 .../opengl-registry-000-run-from-current-dir.patch |   17 +
 .../opengl-registry/opengl-registry.mk             |   87 +
 .../khronos-registry/openkode-registry/Config.in   |   15 +
 .../openkode-registry/openkode-registry.hash       |    7 +
 .../openkode-registry/openkode-registry.mk         |   48 +
 .../khronos-registry/openmax-registry/Config.in    |   20 +
 .../openmax-registry/opengl-registry.hash          |    3 +
 .../openmax-registry/opengl-registry.mk            |   27 +
 package/python-lxml/python-lxml.hash               |    2 +
 package/python-lxml/python-lxml.mk                 |   25 +
 34 files changed, 3054 insertions(+)
 create mode 100644 package/nvidia-driver/Config.in
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
 create mode 100644 package/opengl/khronos-registry/Config.in
 create mode 100644 package/opengl/khronos-registry/khronos-registry.mk
 create mode 100644 package/opengl/khronos-registry/khrplatform-registry/Config.in
 create mode 100644 package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.hash
 create mode 100644 package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.mk
 create mode 100644 package/opengl/khronos-registry/opengl-registry/Config.in
 create mode 100644 package/opengl/khronos-registry/opengl-registry/gl.h
 create mode 100644 package/opengl/khronos-registry/opengl-registry/opengl-registry-000-run-from-current-dir.patch
 create mode 100644 package/opengl/khronos-registry/opengl-registry/opengl-registry.mk
 create mode 100644 package/opengl/khronos-registry/openkode-registry/Config.in
 create mode 100644 package/opengl/khronos-registry/openkode-registry/openkode-registry.hash
 create mode 100644 package/opengl/khronos-registry/openkode-registry/openkode-registry.mk
 create mode 100644 package/opengl/khronos-registry/openmax-registry/Config.in
 create mode 100644 package/opengl/khronos-registry/openmax-registry/opengl-registry.hash
 create mode 100644 package/opengl/khronos-registry/openmax-registry/opengl-registry.mk
 create mode 100644 package/python-lxml/python-lxml.hash
 create mode 100644 package/python-lxml/python-lxml.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
