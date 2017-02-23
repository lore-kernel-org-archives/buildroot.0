From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:22 +0100
Subject: [Buildroot] [PATCH for-next 0/25] Lua(Rocks) improvements
Message-ID: <20170223170047.24417-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This is a collection of fixes and improvements for the Lua and LuaRocks
infrastructure.

 It was triggered by luaposix, which fails to load at runtime with luajit
and lua 5.1 (cfr. [1]). As is typically the case, this one fix lead to a
whole lot of other changes.

 The first patches can be applied independently of each other. They are
small issues that I noticed while implementing the PKG_NAME_UPSTREAM
feature. See the individual commit messages for details.

 We decided that new Lua packages should have a name starting with lua
(I guess both lua, like luaposix, and lua-, like lua-iconv, are OK).
Patch 13 documents that in package/Config.in.

 A new package lua-bit32 is added in patch 14. This package is used to
fix luaposix in patch 15. Subsequent patches generalize the hacks that
are needed for lua-bit32 because of the added lua- prefix. Patch 16
reworks the extraction so it doesn't rely on specific naming of the
subdirectory in which luarocks extracts stuff. Patch 18 introduces
a _NAME_UPSTREAM variable so that the automatically derived variable
names from the luarocks infra are correct when the Buildroot name is
different. Patch 20 extends that concept to the typical situation that
the Lua name has camel case, while the Buildroot name (as well as the
LuaRocks name) is lower case.

 Patch 25 is again independent of the rest. It removes documentation from
the target that is installed there by some Lua (not LuaRocks) packages.
For example, luaposix does that.

 Patches 18 to 24 are somewhat controversial because they introduce
"magic automation" just to save a few lines in the package .mk file. The
amount of savings from those isn't impressive either, they have a
diffstat of 13 insertions(+), 17 deletions(-) (discounting the
documentation change). Still, I believe it makes creation of LuaRocks
packages a bit easier so I included them.

 I did a runtime test after all patches applied by doing a
require "foo"
for each luarocks package with a Lua 5.1 interpreter. I am also using the
fixed luaposix on an actual customer device.

 Obviously, this entire series is for next.

 Regards,
 Arnout

[1] https://lists.osuosl.org/pipermail/buildroot/2017-February/184511.html

----------------------------------------------------------------
The following changes since commit c75f0a4d69db655bb523fbab30e0f4656bc5fb71:

  configs/liteboard: Bump to kernel 4.10 (2017-02-21 16:11:05 +0100)

are available in the git repository at:

  https://gitlab.com/arnout/buildroot lua

for you to fetch changes up to a5dfafeb82c2a91f51908110beafe7389015ca75:

  lua: remove documentation from target (2017-02-23 16:48:06 +0100)

----------------------------------------------------------------
Arnout Vandecappelle (25):
      lutok: move to Lua libraries menu
      cosmo: remove broken package
      luarocks-package: use $(HOST_PKG_VERSION) instead of $(PKG_VERSION)
      manual: luarocks: improve tutorial example
      lpty: remove LPTY_VERSION_UPSTREAM
      lua-periphery: remove LUA_PERIPHERY_VERSION_UPSTREAM
      luasec: remove LUASEC_VERSION_UPSTREAM
      ljlinenoise: remove default definition of PKG_SUBDIR
      lua-csnappy: remove default definition of PKG_SUBDIR
      lua-iconv: remove default definition of PKG_SUBDIR
      luacrypto: remove default definition of PKG_SUBDIR
      lunit: remove default definition of PKG_SUBDIR
      package/Config.in: explain that lua package names should start with lua
      lua-bit32: new package
      luaposix: fix runtime by selecting "bit32" instead of "bitop"
      luarocks-package: rework extraction
      lua-bit32: remove custom extract commands
      luarocks-package: introduce PKG_NAME_UPSTREAM
      lua-bit32: use PKG_NAME_UPSTREAM
      luarocks-package: lowercase the upstream name for LuaRocks
      lua-coat: use PKG_NAME_UPSTREAM
      lua-cjson: use LUA_CJSON_SUBDIR
      lua-testmore: use PKG_NAME_UPSTREAM
      luabitop: use PKG_NAME_UPSTREAM
      lua: remove documentation from target

 docs/manual/adding-packages-luarocks.txt           | 55 +++++++++++++---------
 package/Config.in                                  |  6 ++-
 package/cosmo/Config.in                            | 10 ----
 package/cosmo/cosmo.hash                           |  2 -
 package/ljlinenoise/ljlinenoise.mk                 |  4 +-
 package/lpty/lpty.mk                               |  3 +-
 package/lua-bit32/Config.in                        |  9 ++++
 package/lua-bit32/lua-bit32.hash                   |  2 +
 package/{cosmo/cosmo.mk => lua-bit32/lua-bit32.mk} |  9 ++--
 package/lua-cjson/lua-cjson.mk                     |  5 +-
 package/lua-coat/lua-coat.mk                       |  5 +-
 package/lua-csnappy/lua-csnappy.mk                 |  4 +-
 package/lua-iconv/lua-iconv.mk                     |  4 +-
 package/lua-periphery/lua-periphery.mk             |  3 +-
 package/lua-testmore/lua-testmore.mk               |  5 +-
 package/luabitop/luabitop.mk                       |  5 +-
 package/luacrypto/luacrypto.mk                     |  4 +-
 package/luainterpreter/luainterpreter.mk           | 11 +++++
 package/luaposix/Config.in                         |  6 ++-
 package/luasec/luasec.mk                           |  3 +-
 package/lunit/lunit.mk                             |  4 +-
 package/lutok/Config.in                            |  1 -
 package/pkg-luarocks.mk                            | 14 ++++--
 23 files changed, 94 insertions(+), 80 deletions(-)
 delete mode 100644 package/cosmo/Config.in
 delete mode 100644 package/cosmo/cosmo.hash
 create mode 100644 package/lua-bit32/Config.in
 create mode 100644 package/lua-bit32/lua-bit32.hash
 rename package/{cosmo/cosmo.mk => lua-bit32/lua-bit32.mk} (51%)
