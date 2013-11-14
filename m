From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 14 Nov 2013 14:49:46 +0100
Subject: [Buildroot] [pkg-luarocks infra V2 00/10] a package infrastructure
	for Lua modules
Message-ID: <1384436996-25525-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LuaRocks is a deployment and management system for Lua modules.
(see http://luarocks.org/)

This patch set contains 4 parts :
 1) 2 long standing patches for the virtual package luainterpreter
    see http://patchwork.ozlabs.org/patch/266986 and http://patchwork.ozlabs.org/patch/266985
 2) the removal of a patch, see discussion http://lists.busybox.net/pipermail/buildroot/2013-August/076587.html 
 3) the new infrastructure for LuaRocks
 4) the conversion of 13 Lua modules

In this V2, the cross-compilation of native Lua module is supported (V1 supports only pure Lua module),
a chapter is also added in the documentation.

Note: writing infrastructure is easier than I originally thought.


Francois Perrad (10):
  luainterpreter: create virtual package
  luajit: allow to build Lua extensions without lua
  lua: remove a too invasive patch
  lua*: restore version in module paths
  luarocks: new package
  luarocks: new infrastructure
  lua-cjson: restore official name
  luasql-sqlite3: renamed like with LuaRocks
  lua*: refactor with luarocks infrastructure
  manual: adding packages luarocks

 Config.in                                          |    8 ++
 Makefile                                           |    1 +
 docs/manual/adding-packages-luarocks.txt           |   91 ++++++++++++++++++
 docs/manual/adding-packages.txt                    |    2 +
 package/Config.in                                  |    5 +-
 package/Makefile.in                                |    1 +
 package/cgilua/cgilua.mk                           |   14 +--
 package/copas/copas.mk                             |   14 +--
 package/coxpcall/coxpcall.mk                       |    4 +-
 package/lbase64/Config.in                          |    1 +
 package/lbase64/lbase64.mk                         |   28 +-----
 package/lua-cjson/Config.in                        |   14 +++
 package/lua-cjson/lua-cjson.mk                     |   12 +++
 package/lua-ev/Config.in                           |    1 +
 package/lua-ev/lua-ev.mk                           |    4 +-
 package/lua-msgpack-native/Config.in               |    1 +
 package/lua-msgpack-native/lua-msgpack-native.mk   |    6 +-
 package/lua/Config.in                              |    1 +
 package/lua/lua-01-root-path.patch                 |   21 +----
 package/lua/lua-03-shared-libs-for-luac.patch      |   97 --------------------
 package/luabitop/luabitop.mk                       |   24 +----
 package/luacjson/Config.in                         |   13 ---
 package/luacjson/luacjson.mk                       |   35 -------
 package/luaexpat/Config.in                         |    1 +
 package/luaexpat/luaexpat.mk                       |   36 +-------
 package/luaexpatutils/luaexpatutils.mk             |    4 +-
 package/luafilesystem/Config.in                    |    1 +
 .../luafilesystem-without_large_file.patch         |    8 +-
 package/luafilesystem/luafilesystem.mk             |   26 +-----
 package/luainterpreter/Config.in                   |    2 +
 package/luainterpreter/luainterpreter.mk           |   18 ++++
 package/luajit/Config.in                           |    1 +
 package/luajit/luajit-01-root-path.patch           |   22 -----
 package/luajit/luajit-05-install-inc.patch         |   17 ++++
 package/luaposix/Config.in                         |    1 +
 package/luaposix/luaposix.mk                       |    4 +-
 package/luarocks/luarocks-build-minimal.patch      |   17 ++++
 package/luarocks/luarocks-unpack.patch             |   24 +++++
 package/luarocks/luarocks.mk                       |   42 +++++++++
 package/luasec/Config.in                           |    1 +
 package/luasec/luasec.mk                           |   31 ++-----
 package/luasocket/Config.in                        |    1 +
 package/luasocket/luasocket.mk                     |   18 ++--
 package/luasql-sqlite3/Config.in                   |    8 ++
 package/luasql-sqlite3/luasql-sqlite3.mk           |   13 +++
 package/luasql/Config.in                           |   21 -----
 package/luasql/luasql.mk                           |   39 --------
 package/orbit/orbit-01-fix-installation.patch      |   26 ------
 package/orbit/orbit.mk                             |   16 +---
 package/pkg-luarocks.mk                            |   71 ++++++++++++++
 package/rings/Config.in                            |    1 +
 package/rings/rings.mk                             |   24 +----
 package/wsapi/wsapi.mk                             |   15 +--
 package/xavante/xavante.mk                         |   17 +---
 54 files changed, 419 insertions(+), 505 deletions(-)
 create mode 100644 docs/manual/adding-packages-luarocks.txt
 create mode 100644 package/lua-cjson/Config.in
 create mode 100644 package/lua-cjson/lua-cjson.mk
 delete mode 100644 package/lua/lua-03-shared-libs-for-luac.patch
 delete mode 100644 package/luacjson/Config.in
 delete mode 100644 package/luacjson/luacjson.mk
 create mode 100644 package/luainterpreter/Config.in
 create mode 100644 package/luainterpreter/luainterpreter.mk
 delete mode 100644 package/luajit/luajit-01-root-path.patch
 create mode 100644 package/luajit/luajit-05-install-inc.patch
 create mode 100644 package/luarocks/luarocks-build-minimal.patch
 create mode 100644 package/luarocks/luarocks-unpack.patch
 create mode 100644 package/luarocks/luarocks.mk
 create mode 100644 package/luasql-sqlite3/Config.in
 create mode 100644 package/luasql-sqlite3/luasql-sqlite3.mk
 delete mode 100644 package/luasql/Config.in
 delete mode 100644 package/luasql/luasql.mk
 delete mode 100644 package/orbit/orbit-01-fix-installation.patch
 create mode 100644 package/pkg-luarocks.mk

-- 
1.7.9.5
