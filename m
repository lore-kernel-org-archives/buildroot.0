From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Mar 2014 18:32:43 +0100
Subject: [Buildroot] [PATCH 0/17 v2] Add new virtual-package infrastructure
Message-ID: <cover.1393695127.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a quick series implementing a new infrastructure for virtual
packages.

Basically, all a virtual package has to do in its .mk is:

    $(eval $(virtual-package))

There is no need to:
  - define the dependency against the provider,
  - define _SOURCE=""  (empty)

But it requires the config options for the virtual package be named
after the package, eg.:

    package | Selector option        | Provider option
    --------+------------------------+-----------------------------
    libegl  | BR2_PACKAGE_HAS_LIBEGL | BR2_PACKAGE_PROVIDES_LIBEGL
    jpeg    | BR2_PACKAGE_HAS_JPEG   | BR2_PACKAGE_PROVIDES_JPEG

So the series:
  - starts with renaming some config options in the current virtual
    packages
  - then introduces the new virtual-package infra and the associated
    documentation in the manual
  - and finally converts the virtual packages over to the new infra.

Special thanks to ?ric for his initial work on the manual, which
prompted the idea for this new infra! That's partly for this that I
kept his initial change to the manual almost unmolested.


Changes v1 -> v2:
  - include ?ric's virtual package tutorial to the manual  (?ric)
  - split the renaimg of config options from the actual conversion to
    the virtual-package infra
  - rebase on top of master after post-release merge
  - add host-virtual-package (will be needed by a pending lua-related
    series by Fran?ois)


Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (16):
      package/libgles: rename the _HAS and _PROVIDES variables
      package/libegl: rename the _HAS and _PROVIDES variables
      package/libopenmax: rename the _HAS and _PROVIDES variables
      package/libopenvg: rename the _HAS and _PROVIDES variables
      package/luainterpreter: rename the _HAS and _PROVIDES variables
      package/lua: rename config options
      packages: add infrastructure for virtual packages
      manual: update the virtual package section with the new infra-structure
      package/powervr: convert to the virtual-package infrastructure
      package/libgles: convert to the virtual-package infrastructure
      package/libegl: convert to the virtual-package infrastructure
      package/libopenmax: convert to the virtual-package infrastructure
      package/libopenvg: convert to the virtual-package infrastructure
      package/luainterpreter: convert to the virtual-package infrastructure
      package/jpeg: convert to the virtual-package infrastructure
      package/cryptodev: convert to the virtual-package infrastructure

eric.le.bihan.dev at free.fr (1):
      manual: add virtual package tutorial

 Config.in.legacy                                 | 21 ++++++
 docs/manual/adding-packages-virtual.txt          | 90 ++++++++++++++++++++++++
 docs/manual/adding-packages.txt                  |  2 +
 package/Config.in                                |  2 +-
 package/Makefile.in                              |  1 +
 package/bellagio/Config.in                       |  4 +-
 package/cairo/cairo.mk                           |  4 +-
 package/cryptodev/Config.in                      |  3 +
 package/cryptodev/cryptodev.mk                   | 12 +---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |  8 +--
 package/gstreamer1/gst-omx/Config.in             |  4 +-
 package/gstreamer1/gst1-plugins-bad/Config.in    |  2 +-
 package/jpeg/Config.in                           |  3 +
 package/jpeg/jpeg.mk                             | 12 +---
 package/lbase64/Config.in                        |  2 +-
 package/lpeg/Config.in                           |  2 +-
 package/lpty/Config.in                           |  2 +-
 package/lrandom/Config.in                        |  2 +-
 package/lsqlite3/Config.in                       |  2 +-
 package/lua-cjson/Config.in                      |  2 +-
 package/lua-ev/Config.in                         |  2 +-
 package/lua-msgpack-native/Config.in             |  2 +-
 package/lua/Config.in                            | 14 ++--
 package/lua/lua.mk                               |  4 +-
 package/luaexpat/Config.in                       |  2 +-
 package/luafilesystem/Config.in                  |  2 +-
 package/luainterpreter/Config.in                 |  6 +-
 package/luainterpreter/luainterpreter.mk         | 11 +--
 package/luajit/Config.in                         |  4 +-
 package/luaposix/Config.in                       |  2 +-
 package/luasec/Config.in                         |  2 +-
 package/luasocket/Config.in                      |  2 +-
 package/luasql-sqlite3/Config.in                 |  2 +-
 package/lzlib/Config.in                          |  2 +-
 package/opengl/libegl/Config.in                  |  6 +-
 package/opengl/libegl/libegl.mk                  | 11 +--
 package/opengl/libgles/Config.in                 |  6 +-
 package/opengl/libgles/libgles.mk                | 11 +--
 package/opengl/libopenmax/Config.in              |  6 +-
 package/opengl/libopenmax/libopenmax.mk          | 11 +--
 package/opengl/libopenvg/Config.in               |  6 +-
 package/opengl/libopenvg/libopenvg.mk            | 11 +--
 package/pkg-virtual.mk                           | 65 +++++++++++++++++
 package/powervr/powervr.mk                       | 11 +--
 package/qt/Config.in                             |  4 +-
 package/qt5/qt5base/Config.in                    |  6 +-
 package/qt5/qt5declarative/Config.in             |  6 +-
 package/qt5/qt5graphicaleffects/Config.in        |  6 +-
 package/qt5/qt5multimedia/Config.in              |  6 +-
 package/qt5/qt5quick1/Config.in                  |  6 +-
 package/qt5/qt5quickcontrols/Config.in           |  6 +-
 package/rings/Config.in                          |  2 +-
 package/rpi-userland/Config.in                   | 16 ++---
 package/sunxi-mali/Config.in                     |  8 +--
 package/ti-gfx/Config.in                         |  8 +--
 55 files changed, 283 insertions(+), 172 deletions(-)
 create mode 100644 docs/manual/adding-packages-virtual.txt
 create mode 100644 package/pkg-virtual.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
