From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:52:10 +0200
Subject: [Buildroot] [PATCH 18/20] lua: make sure that CFLAGS are passed
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8199f9f94bab74e27b0eed1a52ed1125e3af62e8.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We were passing a custom MYCFLAGS value to Lua's Makefile, but because
of $(TARGET_CONFIGURE_OPTS), we were also passing a CFLAGS variable,
which was overriding Lua's internal CFLAGS variable. The result was
that MYCFLAGS wasn't taken into account.

Extracted from the patch proposed by Fran?ois Perrad in bug #2353.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index d66be9f..598eea1 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -24,7 +24,9 @@ endif
 define LUA_BUILD_CMDS
 	sed -i -e 's/-O2//' $(@D)/src/Makefile
 	sed -i -e 's/\/usr\/local/\/usr/' $(@D)/etc/lua.pc
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) MYCFLAGS="$(LUA_MYCFLAGS)" \
+	$(MAKE) \
+	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
+	MYCFLAGS="$(TARGET_CFLAGS) $(LUA_MYCFLAGS)" \
 	MYLIBS="$(LUA_MYLIBS)" AR="$(TARGET_CROSS)ar rcu" \
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
 endef
-- 
1.7.0.4
