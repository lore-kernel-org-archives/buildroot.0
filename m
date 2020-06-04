From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:27:30 +0200
Subject: [Buildroot] [git commit] Revert "package/prosody: use correct bit32
 package"
Message-ID: <20200604212709.BA7B6839E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf810e4099adc824ee255cca68e67cf9c949fe87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit fa84c176c2148a60103e850204180f86aa5baa73 that
replace luabitop by lua_bit32 package when lua 5.1 is used.

Since this change the prosody test in gitlab is fail due to
missing lua-bitops [1]:

Starting prosody:
**************************
Prosody was unable to find lua-bitops
This package can be obtained in the following ways:

    Source:           http://bitop.luajit.org/
    Debian/Ubuntu:    sudo apt-get install lua-bitop
    luarocks:         luarocks install luabitop

WebSocket support will not be available
More help can be found on our website, at https://prosody.im/doc/depends
**************************

The upstream documentation [2] is misleading (or not uptodate)
about lua-bit32 dependency.

Since bitop is builtin since lua5.2, we probably need to select
luabitop package only when lua 5.1 is used as lua interpreter.

Tested with run-tests:
./support/testing/run-tests tests.package.test_prosody.TestProsodyLua51

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/576271975
[2] https://prosody.im/doc/depends#bitop

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/prosody/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index 0b01547103..c32ca20e23 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PROSODY
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUA_5_3
 	depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket, luafilesystem
-	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 # runtime
+	select BR2_PACKAGE_LUABITOP if !BR2_PACKAGE_LUAJIT # runtime
 	select BR2_PACKAGE_LUAEXPAT # runtime
 	select BR2_PACKAGE_LUASEC # runtime
 	select BR2_PACKAGE_LUASOCKET # runtime
