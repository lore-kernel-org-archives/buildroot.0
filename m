From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 20:03:52 +0200
Subject: [Buildroot] [git commit branch/next] lua: fix build issue with gcc
	4.6
Message-ID: <20120802195256.CB2B581610@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02f5589d6fe85e73a965359f5dfa2a49930ae3e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

gcc 4.6 has become more sensitive about option ordering, especially
libraries. It requires the -l flags to be placed after the object
files that need that library. See for example
http://nick.zoic.org/art/etc/gcc-linker-libs.html. We had -llua at the
beginning of the link command line, causing build issues (here on gcc
4.6 with host-lua).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua-02-shared-libs-for-lua.patch  |    2 +-
 package/lua/lua-03-shared-libs-for-luac.patch |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua/lua-02-shared-libs-for-lua.patch b/package/lua/lua-02-shared-libs-for-lua.patch
index afe2ac8..454e660 100644
--- a/package/lua/lua-02-shared-libs-for-lua.patch
+++ b/package/lua/lua-02-shared-libs-for-lua.patch
@@ -43,7 +43,7 @@ Index: b/src/Makefile
 +	ln -fs $@.$(PKG_VERSION) $@
 +
 +$(LUA_T): $(LUA_O) $(LUA_SO)
-+	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUA_O) $(LIBS)
++	$(CC) -o $@ -L. $(MYLDFLAGS) $(LUA_O) -llua $(LIBS)
  
  $(LUAC_T): $(LUAC_O) $(LUA_A)
  	$(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
diff --git a/package/lua/lua-03-shared-libs-for-luac.patch b/package/lua/lua-03-shared-libs-for-luac.patch
index ebe5337..33f9183 100644
--- a/package/lua/lua-03-shared-libs-for-luac.patch
+++ b/package/lua/lua-03-shared-libs-for-luac.patch
@@ -91,7 +91,7 @@ Index: b/src/Makefile
 -$(LUAC_T): $(LUAC_O) $(LUA_A)
 -	$(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
 +$(LUAC_T): $(LUAC_O) $(LUA_SO)
-+	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUAC_O) $(LIBS)
++	$(CC) -o $@ -L. $(MYLDFLAGS) $(LUAC_O) -llua $(LIBS)
  
  clean:
  	$(RM) $(ALL_T) $(ALL_O)
