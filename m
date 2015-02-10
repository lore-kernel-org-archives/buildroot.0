From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Feb 2015 21:01:12 +0100
Subject: [Buildroot] [PATCH 0/10 v7] NVidia GPU binary blobs for x86 and ARM
	(branch yem/gfx2)
Message-ID: <cover.1423597914.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds support for NVidia's binary blob, the driver to its
family of GPUs, for x86 (by Yann) and Tegra2 and Tegra3 (by Nicolas).

It also introduces the mesa3d-headers, a mesa3d-based package that only
installs the OpenXXX headers, for those OpenGL/EGL/GLES implementations
that do not provide their own headers (like NVidia's binary blobs.)

mesq3d-headers installs the headers corresponding to the virtual
packages that are enabled, i.e. GL headers when _HAS_LIBGL is enabled,
ELG headers when _HAS_LIBEGL is enabled and so on... This means there
is no support for packages that provide more than one OpenXXX
implementation (say GL and EGL), provides headers for some (say GL) but
require headers for others (say EGL). This should in principle not cause
any issue, as headers instaleld by suh a package would overwrite the
headers already installed by mesa3d-headers.

Also, all the usual ./configure && make && make install dance is not
done for mnesa3d, even though it is an autotools package. Instead, we
just manually copy those required headers, as they are not generated.

The x86 drivers were build- and runtile-tested using XBMC (not yet with
Kodi); the tests were very shallow, though, and not everything was
thouroughly tested (especially the video decoding part), but it is
apparently working OK so far.


Changes v6 -> v7:
  - drop all Khronos Registries packages in favour of mesa3d-headers
  - adapt the NVidia driver packages to use mesa3d-headers

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


The following changes since commit c41229af06d759081e56ce762b63436eac786cfa:

  docs/website/news.html: add 2015.02-rc1 announcement link (2015-02-08 23:50:14 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/gfx2

for you to fetch changes up to c85883e41226c0c3458f34a39b31251f68dc4f2e:

  package/nvidia-tegra23-codecs: new package (2015-02-10 19:19:45 +0100)

----------------------------------------------------------------
J?r?me Pouiller (1):
      package/nvidia-driver: Add gl.pc

Nicolas Serafini (3):
      package/nvidia-tegra23-binaries: new package
      package.nvidia-tegra23-binaries: add gstreamer plugins
      package/nvidia-tegra23-codecs: new package

Yann E. MORIN (5):
      package/python-lxml: new host package
      package/mesa3d-headers: new package
      package/mesa3d-headers: also install dri header and .pc file
      package/nvidia-driver: add NVidia's OpenGL binary blob
      package/nvidia-driver: build the kernel module

Yegor Yefremov (1):
      package/python-lxml: add target variant

 package/Config.in                                  |   4 +
 package/mesa3d-headers/Config.in                   |   8 +
 package/mesa3d-headers/mesa3d-headers.hash         |   1 +
 package/mesa3d-headers/mesa3d-headers.mk           |  91 ++++++++++++
 package/mesa3d/mesa3d.mk                           |   1 +
 package/nvidia-driver/Config.in                    |  65 +++++++++
 package/nvidia-driver/gl.pc                        |  11 ++
 package/nvidia-driver/nvidia-driver.hash           |   3 +
 package/nvidia-driver/nvidia-driver.mk             | 161 +++++++++++++++++++++
 package/nvidia-tegra23/Config.in                   |  37 +++++
 .../nvidia-tegra23-binaries/Config.in              | 107 ++++++++++++++
 .../nvidia-tegra23/nvidia-tegra23-binaries/egl.pc  |  10 ++
 .../nvidia-tegra23/nvidia-tegra23-binaries/gles.pc |  10 ++
 .../nvidia-tegra23-binaries/glesv2.pc              |  10 ++
 .../nvidia-tegra23-binaries.hash                   |   3 +
 .../nvidia-tegra23-binaries.mk                     | 128 ++++++++++++++++
 .../nvidia-tegra23/nvidia-tegra23-codecs/Config.in |   7 +
 .../nvidia-tegra23-codecs.hash                     |   3 +
 .../nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk |  41 ++++++
 package/nvidia-tegra23/nvidia-tegra23.mk           |  17 +++
 package/python-lxml/Config.in                      |  10 ++
 package/python-lxml/python-lxml.hash               |   2 +
 package/python-lxml/python-lxml.mk                 |  33 +++++
 23 files changed, 763 insertions(+)
 create mode 100644 package/mesa3d-headers/Config.in
 create mode 120000 package/mesa3d-headers/mesa3d-headers.hash
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
