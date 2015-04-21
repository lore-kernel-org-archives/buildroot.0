From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2015 19:04:39 +0200
Subject: [Buildroot] [PATCH 0/8 v11] NVidia GPU binary blobs for Tegra2/3
	(branch yem/gfx2)
Message-ID: <cover.1429635674.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds support for NVidia's binary blob, the driver to its
family of GPUs, for Tegra2 and Tegra3, initially submitted by Nicolas.

Since those binary blobs require the old X11 driver ABI 14, we can not
use them for now, as the version of X11 we have implements ABI 19; X11
ABIs are not backward compatible.

So, we need to introduce a choice for the version of X11, so as to
provide whatever was the latest X11 vbersion to provide ABI 14; this
would be X11 version 1.14.7.

Fortunately, Gustavo was kind enough to suggest and test that building
an old X11 server with newer X11 libs was still possible, so that we
only really need the old server, not all the old libs. Pfewww... ;-)

So, this series in split in two main parts:

  - patches 1-5 introduce the possibility to choose an old X11 version
    for the server,

  - patches 6-8 add new packages for the NVidia Tegra blobs.

Thanks go to Nicolas, Laurent and Gustavo for their input and testing!


Changes v8 -> v11:
  - version bump for tegra drivers and codecs  (Nicolas)

Changes v7 -> v8:
  - introduce use of an old X11 server to provide the ABI expected by
    the NVidia blobs
  - drop the x86 drivers, applied

Changes v6 -> v7:
  - drop all Khronos Registries packages in favour of mesa3d-headers
  - adapt the NVidia driver packages to use mesa3d-headers

Changes v5 -> v6:
  - make python-lxml a target package too  (Yegor)
  - rename the packages and move one directory up  (J?r?me)
  - use mesa3d to provide additional headers, don't bundle them
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


The following changes since commit abf4db2c48bf60053cf66b32a0572cd59dd5d624:

  package: add mosquitto (2015-04-21 16:08:44 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/gfx2

for you to fetch changes up to 01c5d72e1eae387c59c3e674635b2e6e5a564a1c:

  package/nvidia-tegra23-codecs: new package (2015-04-21 18:05:23 +0200)

----------------------------------------------------------------
Nicolas Serafini (3):
      package/nvidia-tegra23-binaries: new package
      package.nvidia-tegra23-binaries: add gstreamer plugins
      package/nvidia-tegra23-codecs: new package

Yann E. MORIN (5):
      package/xserver_xorg-server: prepare for multiple supported versions
      package/xserver_xorg-server: make the version a choice
      package/xserver_xorg-server: add blind options to specify driver ABI
      package/xserver_xorg-server: not all versions need all dependencies
      package/xserver_xorg-server: add version 1.14.7

 package/Config.in                                  |   1 +
 package/nvidia-tegra23/Config.in                   |  38 ++++++
 .../nvidia-tegra23-binaries/Config.in              |  42 +++++++
 .../nvidia-tegra23/nvidia-tegra23-binaries/egl.pc  |  10 ++
 .../nvidia-tegra23/nvidia-tegra23-binaries/gles.pc |  10 ++
 .../nvidia-tegra23-binaries/glesv2.pc              |  10 ++
 .../nvidia-tegra23-binaries.hash                   |   3 +
 .../nvidia-tegra23-binaries.mk                     | 128 +++++++++++++++++++++
 .../nvidia-tegra23/nvidia-tegra23-codecs/Config.in |   7 ++
 .../nvidia-tegra23-codecs.hash                     |   3 +
 .../nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk |  41 +++++++
 package/nvidia-tegra23/nvidia-tegra23.mk           |  18 +++
 ...1-backtrace.c-Fix-word-cast-to-a-pointer.patch} |   0
 package/x11r7/xserver_xorg-server/Config.in        |  31 ++++-
 .../xserver_xorg-server/xserver_xorg-server.mk     |   9 +-
 15 files changed, 348 insertions(+), 3 deletions(-)
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
 rename package/x11r7/xserver_xorg-server/{0004-backtrace.c-Fix-word-cast-to-a-pointer.patch => 1.17.1/0001-backtrace.c-Fix-word-cast-to-a-pointer.patch} (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
