From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 18 Oct 2012 20:56:39 +0200
Subject: [Buildroot] [PATCH] luajit: bump to version 2.0.0-beta11
Message-ID: <1350586599-31757-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this release includes my 2 requests, see http://www.freelists.org/post/luajit/LuaJIT-on-Buildroot

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit-01-root-path.patch      |   10 +++++-----
 package/luajit/luajit-02-shared-lib.patch     |    2 +-
 package/luajit/luajit-03-dont-strip.patch     |    2 +-
 package/luajit/luajit-04-no-bin-symlink.patch |   12 ++++++------
 package/luajit/luajit.mk                      |   17 +++++++++++------
 5 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/package/luajit/luajit-01-root-path.patch b/package/luajit/luajit-01-root-path.patch
index 3b0a585..80ad1e9 100644
--- a/package/luajit/luajit-01-root-path.patch
+++ b/package/luajit/luajit-01-root-path.patch
@@ -7,10 +7,10 @@ Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
 +++ b/src/luaconf.h
-@@ -22,9 +22,9 @@
- #define LUA_CPATH_DEFAULT \
-   ".\\?.dll;" LUA_CDIR"?.dll;" LUA_CDIR"loadall.dll"
- #else
+@@ -26,9 +26,9 @@
+ ** Note to distribution maintainers: do NOT patch the following line!
+ ** Please read ../doc/install.html#distro and pass PREFIX=/usr instead.
+ */
 -#define LUA_ROOT	"/usr/local/"
 -#define LUA_LDIR	LUA_ROOT "share/lua/5.1/"
 -#define LUA_CDIR	LUA_ROOT "lib/lua/5.1/"
@@ -18,5 +18,5 @@ Index: b/src/luaconf.h
 +#define LUA_LDIR	LUA_ROOT "share/lua/"
 +#define LUA_CDIR	LUA_ROOT "lib/lua/"
  #ifdef LUA_XROOT
- #define LUA_JDIR	LUA_XROOT "share/luajit-2.0.0-beta10/"
+ #define LUA_JDIR	LUA_XROOT "share/luajit-2.0.0-beta11/"
  #define LUA_XPATH \
diff --git a/package/luajit/luajit-02-shared-lib.patch b/package/luajit/luajit-02-shared-lib.patch
index d5122ba..361e5c2 100644
--- a/package/luajit/luajit-02-shared-lib.patch
+++ b/package/luajit/luajit-02-shared-lib.patch
@@ -6,7 +6,7 @@ Index: b/src/Makefile
 ===================================================================
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -629,7 +629,7 @@
+@@ -669,7 +669,7 @@
  
  $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
  	$(E) "LINK      $@"
diff --git a/package/luajit/luajit-03-dont-strip.patch b/package/luajit/luajit-03-dont-strip.patch
index 9651cdf..66bdadf 100644
--- a/package/luajit/luajit-03-dont-strip.patch
+++ b/package/luajit/luajit-03-dont-strip.patch
@@ -8,7 +8,7 @@ Index: b/src/Makefile
 ===================================================================
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -625,12 +625,10 @@
+@@ -665,12 +665,10 @@
  $(LUAJIT_SO): $(LJVMCORE_O)
  	$(E) "DYNLINK   $@"
  	$(Q)$(TARGET_LD) $(TARGET_ASHLDFLAGS) -o $@ $(LJVMCORE_DYNO) $(TARGET_ALIBS)
diff --git a/package/luajit/luajit-04-no-bin-symlink.patch b/package/luajit/luajit-04-no-bin-symlink.patch
index 3eed7de..91a470a 100644
--- a/package/luajit/luajit-04-no-bin-symlink.patch
+++ b/package/luajit/luajit-04-no-bin-symlink.patch
@@ -6,7 +6,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -41,8 +41,7 @@
+@@ -43,8 +43,7 @@
  INSTALL_MAN= $(INSTALL_SHARE)/man/man1
  INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
  
@@ -16,7 +16,7 @@ Index: b/Makefile
  INSTALL_ANAME= libluajit-$(ABIVER).a
  INSTALL_SONAME= libluajit-$(ABIVER).so.$(MAJVER).$(MINVER).$(RELVER)
  INSTALL_SOSHORT= libluajit-$(ABIVER).so
-@@ -56,7 +55,6 @@
+@@ -58,7 +57,6 @@
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
  INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
@@ -24,10 +24,10 @@ Index: b/Makefile
  INSTALL_PC= $(INSTALL_PKGCONFIG)/$(INSTALL_PCNAME)
  
  INSTALL_DIRS= $(INSTALL_BIN) $(INSTALL_LIB) $(INSTALL_INC) $(INSTALL_MAN) \
-@@ -114,13 +112,6 @@
+@@ -120,13 +118,6 @@
  	  $(RM) $(FILE_PC).tmp
  	cd src && $(INSTALL_F) $(FILES_INC) $(INSTALL_INC)
- 	cd lib && $(INSTALL_F) $(FILES_JITLIB) $(INSTALL_JITLIB)
+ 	cd src/jit && $(INSTALL_F) $(FILES_JITLIB) $(INSTALL_JITLIB)
 -	@echo "==== Successfully installed LuaJIT $(VERSION) to $(PREFIX) ===="
 -	@echo ""
 -	@echo "Note: the beta releases deliberately do NOT install a symlink for luajit"
@@ -36,5 +36,5 @@ Index: b/Makefile
 -	@echo "  $(SYMLINK) $(INSTALL_TNAME) $(INSTALL_TSYM)"
 -	@echo ""
  
- ##############################################################################
- 
+ uninstall:
+ 	@echo "==== Uninstalling LuaJIT $(VERSION) from $(PREFIX) ===="
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 913bc0c..2583f92 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LUAJIT_VERSION = 2.0.0-beta10
+LUAJIT_VERSION = 2.0.0-beta11
 LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE    = http://luajit.org/download
 LUAJIT_LICENSE = MIT
@@ -12,12 +12,8 @@ LUAJIT_LICENSE_FILES = COPYRIGHT
 
 LUAJIT_INSTALL_STAGING = YES
 
-define LUAJIT_NOLARGEFILE_FIX_MAKEFILE
-	$(SED) 's/TARGET_XCFLAGS= -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE/TARGET_XCFLAGS=/' $(@D)/src/Makefile
-endef
-
 ifneq ($(BR2_LARGEFILE),y)
-LUAJIT_POST_PATCH_HOOKS += LUAJIT_NOLARGEFILE_FIX_MAKEFILE
+LUAJIT_NO_LARGEFILE = TARGET_LFSFLAGS=
 endif
 
 # The luajit build procedure requires the host compiler to have the
@@ -47,6 +43,7 @@ define LUAJIT_BUILD_CMDS
 		HOST_CC="$(LUAJIT_HOST_CC)" \
 		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
+		$(LUAJIT_NO_LARGEFILE) \
 		-C $(@D) amalg
 endef
 
@@ -58,6 +55,14 @@ define LUAJIT_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
 endef
 
+define LUAJIT_UNINSTALL_STAGING_CMDS
+	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" -C $(@D) uninstall
+endef
+
+define LUAJIT_UNINSTALL_TARGET_CMDS
+	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) uninstall
+endef
+
 define LUAJIT_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
-- 
1.7.9.5
