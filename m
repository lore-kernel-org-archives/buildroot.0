From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 23:47:40 +0100
Subject: [Buildroot] [git commit] luarocks: remove luainterpreter dependency
Message-ID: <20140301225012.ADC4D9936F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7669aab6b4c9a479e561d5faa9b72cce1720ccb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All packages using the luarocks infrastructure need a dependency on
luainterpreter, because having the Lua interpreter for the target is
needed to built native Lua modules. This dependency is already taken
care of in pkg-luarocks.mk.

However, host-luarocks, which is built as a dependency of the extract
step of any luarocks package, also had a dependency on
luainterpreter. Not only this was not necessary, but it was causing
problems with 'make legal-info'. Since 'make legal-info' triggers the
extraction of all packages, as soon as a luarocks package was enabled,
it would trigger the build of host-luarocks, itself triggering the
build of luainterpreter and therefore its dependencies, amongst which
the entire cross-compilation toolchain.

[Thomas: reword commit log to include more detailed explanations.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luarocks/luarocks.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 86e57d2..926fd04 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -9,7 +9,7 @@ LUAROCKS_SITE = http://luarocks.org/releases/
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
 
-HOST_LUAROCKS_DEPENDENCIES = host-lua luainterpreter
+HOST_LUAROCKS_DEPENDENCIES = host-lua
 
 LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
