From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 17 Mar 2015 11:47:39 +0000
Subject: [Buildroot] [PATCH] lua-periphery: disable for MIPS architectures
Message-ID: <1426592859-46907-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

c_ispeed and c_ospeed are not available for MIPS:

src/serial.c:191:25: error: 'struct termios' has no member named 'c_ispeed'
         termios_settings.c_ispeed = baudrate;

src/serial.c:192:25: error: 'struct termios' has no member named 'c_ospeed'
         termios_settings.c_ospeed = baudrate;

Fixes:

  http://autobuild.buildroot.net/results/ca7146661c8135568be90dd53b6ee569ebff270d/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lua-periphery/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lua-periphery/Config.in b/package/lua-periphery/Config.in
index de5a716..0ccb05c 100644
--- a/package/lua-periphery/Config.in
+++ b/package/lua-periphery/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LUA_PERIPHERY
 	bool "lua-periphery"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	# c_ispeed and c_ospeed are not available for MIPS
+	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
 	help
 	  A library for GPIO, SPI, I2C, MMIO, and Serial peripheral I/O
 	  interface access in userspace Linux with Lua.
-- 
1.7.1
