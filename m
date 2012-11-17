From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 22:19:26 +0100
Subject: [Buildroot] [git commit] lua: don't be fancy when creating shared
	library
Message-ID: <20121117212308.183779A07C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=684f208ecf1da23ce7013a91a69adb2ff7161715
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

(Possibly) fixes #5354

The lua shared library patch was creating the shared library with
-nostdlib -lgcc for some unknown reason, which most likely is
the reason for the link issue reported in #5354.

Fix it by dropping these arguments, so gcc gets to figure out itself
what dependencies are needed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua/lua-02-shared-libs-for-lua.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lua/lua-02-shared-libs-for-lua.patch b/package/lua/lua-02-shared-libs-for-lua.patch
index 454e660..97a7068 100644
--- a/package/lua/lua-02-shared-libs-for-lua.patch
+++ b/package/lua/lua-02-shared-libs-for-lua.patch
@@ -39,7 +39,7 @@ Index: b/src/Makefile
 -$(LUA_T): $(LUA_O) $(LUA_A)
 -	$(CC) -o $@ $(MYLDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
 +$(LUA_SO): $(CORE_O) $(LIB_O)
-+	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $? -nostdlib -lgcc
++	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
 +	ln -fs $@.$(PKG_VERSION) $@
 +
 +$(LUA_T): $(LUA_O) $(LUA_SO)
