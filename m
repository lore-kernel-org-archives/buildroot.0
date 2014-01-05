From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Jan 2014 16:48:04 +0100
Subject: [Buildroot] [PATCH 0/9 v6] Introduce the luarocks package
	infrastructure
Message-ID: <cover.1388936665.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This is a respin of the LuaRocks infrastrucutre by Fran?ois Perrad,
rebased on-top of current master, and with some changes suggested by
Thomas, plus my own.

Fran?ois, care to handle the remaining comments by Thomas, that I could
not address (since you are more qualified to reply than I am)?


Changes v5 -> v6:
  - fix dependency of luasql-sqlite3 on sqlite  (me)
  - rebased on top of master  (me)

Changes v4 -> v5:
  - apply some of Thomas' suggestions:
    http://lists.busybox.net/pipermail/buildroot/2013-December/085217.html
    and following messages
  - rebase on-top current master  (me)
  - change luainterpreter to a package-defined provider  (me)


Regards,
Yann E. MORIN.


----------------------------------------------------------------
Francois Perrad (9):
      luainterpreter: create virtual package
      luajit: allow to build Lua extensions without lua
      lua*: restore version in module paths
      luarocks: new package
      luarocks: new infrastructure
      lua-cjson: restore official name
      luasql-sqlite3: renamed like with LuaRocks
      lua*: refactor with luarocks infrastructure
      manual: adding packages luarocks

 Config.in                                          |  8 ++
 Config.in.legacy                                   | 14 ++++
 Makefile                                           |  1 +
 docs/manual/adding-packages-luarocks.txt           | 93 ++++++++++++++++++++++
 docs/manual/adding-packages.txt                    |  2 +
 package/Config.in                                  |  7 +-
 package/Makefile.in                                |  1 +
 package/cgilua/cgilua.mk                           |  9 +--
 package/copas/copas.mk                             | 10 +--
 package/coxpcall/coxpcall.mk                       |  2 +-
 package/lbase64/Config.in                          |  1 +
 package/lbase64/lbase64.mk                         | 20 +----
 package/{luacjson => lua-cjson}/Config.in          |  5 +-
 package/lua-cjson/lua-cjson.mk                     | 12 +++
 package/lua-ev/Config.in                           |  1 +
 package/lua-ev/lua-ev.mk                           |  4 +-
 package/lua-msgpack-native/Config.in               |  1 +
 package/lua-msgpack-native/lua-msgpack-native.mk   |  4 +-
 package/lua/Config.in                              |  4 +
 package/lua/lua-01-root-path.patch                 | 21 +----
 package/luabitop/luabitop.mk                       | 20 ++---
 package/luacjson/luacjson.mk                       | 27 -------
 package/luaexpat/Config.in                         |  1 +
 package/luaexpat/luaexpat.mk                       | 27 +------
 package/luaexpatutils/luaexpatutils.mk             |  2 +-
 package/luafilesystem/Config.in                    |  1 +
 .../luafilesystem-without_large_file.patch         |  8 +-
 package/luafilesystem/luafilesystem.mk             | 18 +----
 package/luainterpreter/Config.in                   |  6 ++
 package/luainterpreter/luainterpreter.mk           | 10 +++
 package/luajit/Config.in                           |  8 ++
 package/luajit/luajit-01-root-path.patch           | 22 -----
 package/luajit/luajit-05-install-inc.patch         | 17 ++++
 package/luaposix/Config.in                         |  1 +
 package/luaposix/luaposix.mk                       |  4 +-
 package/luarocks/luarocks-0001-build-minimal.patch | 17 ++++
 package/luarocks/luarocks-0002-unpack.patch        | 24 ++++++
 package/luarocks/luarocks.mk                       | 42 ++++++++++
 package/luasec/Config.in                           |  1 +
 package/luasec/luasec.mk                           | 25 ++----
 package/luasocket/Config.in                        |  1 +
 package/luasocket/luasocket.mk                     |  6 +-
 package/luasql-sqlite3/Config.in                   |  9 +++
 package/luasql-sqlite3/luasql-sqlite3.mk           | 13 +++
 package/luasql/Config.in                           | 21 -----
 package/luasql/luasql.mk                           | 35 --------
 package/orbit/orbit-01-fix-installation.patch      | 26 ------
 package/orbit/orbit.mk                             | 16 ++--
 package/pkg-luarocks.mk                            | 81 +++++++++++++++++++
 package/rings/Config.in                            |  1 +
 package/rings/rings.mk                             | 15 +---
 package/wsapi/wsapi.mk                             | 11 +--
 package/xavante/xavante.mk                         | 11 +--
 53 files changed, 433 insertions(+), 314 deletions(-)
 create mode 100644 docs/manual/adding-packages-luarocks.txt
 rename package/{luacjson => lua-cjson}/Config.in (82%)
 create mode 100644 package/lua-cjson/lua-cjson.mk
 delete mode 100644 package/luacjson/luacjson.mk
 create mode 100644 package/luainterpreter/Config.in
 create mode 100644 package/luainterpreter/luainterpreter.mk
 delete mode 100644 package/luajit/luajit-01-root-path.patch
 create mode 100644 package/luajit/luajit-05-install-inc.patch
 create mode 100644 package/luarocks/luarocks-0001-build-minimal.patch
 create mode 100644 package/luarocks/luarocks-0002-unpack.patch
 create mode 100644 package/luarocks/luarocks.mk
 create mode 100644 package/luasql-sqlite3/Config.in
 create mode 100644 package/luasql-sqlite3/luasql-sqlite3.mk
 delete mode 100644 package/luasql/Config.in
 delete mode 100644 package/luasql/luasql.mk
 delete mode 100644 package/orbit/orbit-01-fix-installation.patch
 create mode 100644 package/pkg-luarocks.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
