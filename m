From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Feb 2014 23:02:07 +0100
Subject: [Buildroot] [RFC PATCH 0/10] add new virtual-package infrastructure
Message-ID: <cover.1393365231.git.yann.morin.1998@free.fr>
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

So, after the virtual-package infra has been introduced, the series
goes on to rename some options, and convert some packages over to
this new infra.

NOTE! This is an RFC! It's not final! This series has hardly been
tested. Only the dependency chain has been tested to be OK. No
build-test was performed.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (10):
      package/lua: rename config options
      packages: add infrastructure for virtual packages
      package/powervr: convert to the virtual-package infrastructure
      package/libgles: convert to the virtual-package infrastructure
      package/libegl: convert to the virtual-package infrastructure
      package/libopenmax: convert to the virtual-package infrastructure
      package/libopenvg: convert to the virtual-package infrastructure
      package/luainterpreter: convert to the virtual-package infrastructure
      package/jpeg: convert to the virtual-package infrastructure
      package/cryptodev: convert to the virtual-package infrastructure

 Config.in.legacy                                 | 24 +++++++++
 package/Config.in                                |  2 +-
 package/Makefile.in                              |  1 +
 package/bellagio/Config.in                       |  4 +-
 package/cairo/cairo.mk                           |  4 +-
 package/cryptodev/Config.in                      |  3 ++
 package/cryptodev/cryptodev.mk                   | 12 +----
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |  8 +--
 package/gstreamer1/gst-omx/Config.in             |  4 +-
 package/gstreamer1/gst1-plugins-bad/Config.in    |  2 +-
 package/jpeg/Config.in                           |  3 ++
 package/jpeg/jpeg.mk                             | 12 +----
 package/lbase64/Config.in                        |  2 +-
 package/lua-cjson/Config.in                      |  2 +-
 package/lua-ev/Config.in                         |  2 +-
 package/lua-msgpack-native/Config.in             |  2 +-
 package/lua/Config.in                            | 14 +++---
 package/lua/lua.mk                               |  4 +-
 package/luaexpat/Config.in                       |  2 +-
 package/luafilesystem/Config.in                  |  2 +-
 package/luainterpreter/Config.in                 |  6 +--
 package/luainterpreter/luainterpreter.mk         |  5 +-
 package/luajit/Config.in                         |  4 +-
 package/luaposix/Config.in                       |  2 +-
 package/luasec/Config.in                         |  2 +-
 package/luasocket/Config.in                      |  2 +-
 package/luasql-sqlite3/Config.in                 |  2 +-
 package/opengl/libegl/Config.in                  |  6 +--
 package/opengl/libegl/libegl.mk                  | 12 +----
 package/opengl/libgles/Config.in                 |  6 +--
 package/opengl/libgles/libgles.mk                | 12 +----
 package/opengl/libopenmax/Config.in              |  6 +--
 package/opengl/libopenmax/libopenmax.mk          | 12 +----
 package/opengl/libopenvg/Config.in               |  6 +--
 package/opengl/libopenvg/libopenvg.mk            | 12 +----
 package/pkg-virtual.mk                           | 64 ++++++++++++++++++++++++
 package/powervr/powervr.mk                       | 12 +----
 package/qt/Config.in                             |  4 +-
 package/qt5/qt5base/Config.in                    |  6 +--
 package/qt5/qt5declarative/Config.in             |  6 +--
 package/qt5/qt5graphicaleffects/Config.in        |  6 +--
 package/qt5/qt5multimedia/Config.in              |  6 +--
 package/qt5/qt5quick1/Config.in                  |  6 +--
 package/qt5/qt5quickcontrols/Config.in           |  6 +--
 package/rings/Config.in                          |  2 +-
 package/rpi-userland/Config.in                   | 16 +++---
 package/sunxi-mali/Config.in                     |  8 +--
 package/ti-gfx/Config.in                         |  8 +--
 48 files changed, 188 insertions(+), 166 deletions(-)
 create mode 100644 package/pkg-virtual.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
