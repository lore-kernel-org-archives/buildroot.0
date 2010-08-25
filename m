From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] lua: make sure that CFLAGS are
	passed
Message-ID: <20100825153146.4199889016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8305f6ffbc391b25a24b25257089c1e0c99bd9aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
