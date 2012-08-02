From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:54:02 -0000
Subject: [Buildroot] [git commit branch/next] luajit: new package
Message-ID: <20120802195255.D06488E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f93e17f0b4d8d9af2867a04c3691f68fd3f4e443
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                             |    3 +-
 package/luajit/Config.in                      |   12 +++++
 package/luajit/luajit-01-root-path.patch      |   22 +++++++++
 package/luajit/luajit-02-shared-lib.patch     |   17 +++++++
 package/luajit/luajit-03-dont-strip.patch     |   23 +++++++++
 package/luajit/luajit-04-no-bin-symlink.patch |   40 ++++++++++++++++
 package/luajit/luajit.mk                      |   63 +++++++++++++++++++++++++
 7 files changed, 179 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8529777..6aabb8e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -245,7 +245,8 @@ endmenu
 menu "Interpreter languages and scripting"
 source "package/haserl/Config.in"
 source "package/lua/Config.in"
-if BR2_PACKAGE_LUA
+source "package/luajit/Config.in"
+if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
 menu "LUA libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
new file mode 100644
index 0000000..23b2650
--- /dev/null
+++ b/package/luajit/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LUAJIT
+	bool "luajit"
+	# Luajit is only available for some target architectures, and
+	# has some complexity wrt 32/64. See luajit.mk for details.
+	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb
+	help
+	  LuaJIT implements the full set of language features defined
+	  by Lua 5.1. The virtual machine (VM) is API- and
+	  ABI-compatible to the standard Lua interpreter and can be
+	  deployed as a drop-in replacement.
+
+	  http://luajit.org/
diff --git a/package/luajit/luajit-01-root-path.patch b/package/luajit/luajit-01-root-path.patch
new file mode 100644
index 0000000..3b0a585
--- /dev/null
+++ b/package/luajit/luajit-01-root-path.patch
@@ -0,0 +1,22 @@
+Adjust installation location to /usr
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/luaconf.h
+===================================================================
+--- a/src/luaconf.h
++++ b/src/luaconf.h
+@@ -22,9 +22,9 @@
+ #define LUA_CPATH_DEFAULT \
+   ".\\?.dll;" LUA_CDIR"?.dll;" LUA_CDIR"loadall.dll"
+ #else
+-#define LUA_ROOT	"/usr/local/"
+-#define LUA_LDIR	LUA_ROOT "share/lua/5.1/"
+-#define LUA_CDIR	LUA_ROOT "lib/lua/5.1/"
++#define LUA_ROOT	"/usr/"
++#define LUA_LDIR	LUA_ROOT "share/lua/"
++#define LUA_CDIR	LUA_ROOT "lib/lua/"
+ #ifdef LUA_XROOT
+ #define LUA_JDIR	LUA_XROOT "share/luajit-2.0.0-beta10/"
+ #define LUA_XPATH \
diff --git a/package/luajit/luajit-02-shared-lib.patch b/package/luajit/luajit-02-shared-lib.patch
new file mode 100644
index 0000000..d5122ba
--- /dev/null
+++ b/package/luajit/luajit-02-shared-lib.patch
@@ -0,0 +1,17 @@
+Compile the luajit binary dynamically against the luajit library
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/Makefile
+===================================================================
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -629,7 +629,7 @@
+ 
+ $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
+ 	$(E) "LINK      $@"
+-	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) $(TARGET_O) $(TARGET_ALIBS)
++	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) -lluajit -L. $(TARGET_ALIBS)
+ 	$(Q)$(TARGET_STRIP) $@
+ 	$(E) "OK        Successfully built LuaJIT"
+ 
diff --git a/package/luajit/luajit-03-dont-strip.patch b/package/luajit/luajit-03-dont-strip.patch
new file mode 100644
index 0000000..9651cdf
--- /dev/null
+++ b/package/luajit/luajit-03-dont-strip.patch
@@ -0,0 +1,23 @@
+Don't strip the library and binary
+
+This allows Buildroot to do it if needed, but only if needed.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/Makefile
+===================================================================
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -625,12 +625,10 @@
+ $(LUAJIT_SO): $(LJVMCORE_O)
+ 	$(E) "DYNLINK   $@"
+ 	$(Q)$(TARGET_LD) $(TARGET_ASHLDFLAGS) -o $@ $(LJVMCORE_DYNO) $(TARGET_ALIBS)
+-	$(Q)$(TARGET_STRIP) $@
+ 
+ $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
+ 	$(E) "LINK      $@"
+ 	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) -lluajit -L. $(TARGET_ALIBS)
+-	$(Q)$(TARGET_STRIP) $@
+ 	$(E) "OK        Successfully built LuaJIT"
+ 
+ ##############################################################################
diff --git a/package/luajit/luajit-04-no-bin-symlink.patch b/package/luajit/luajit-04-no-bin-symlink.patch
new file mode 100644
index 0000000..3eed7de
--- /dev/null
+++ b/package/luajit/luajit-04-no-bin-symlink.patch
@@ -0,0 +1,40 @@
+Do not use a symlink for the binary, simply name if luajit
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -41,8 +41,7 @@
+ INSTALL_MAN= $(INSTALL_SHARE)/man/man1
+ INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
+ 
+-INSTALL_TNAME= luajit-$(VERSION)
+-INSTALL_TSYMNAME= luajit
++INSTALL_TNAME= luajit
+ INSTALL_ANAME= libluajit-$(ABIVER).a
+ INSTALL_SONAME= libluajit-$(ABIVER).so.$(MAJVER).$(MINVER).$(RELVER)
+ INSTALL_SOSHORT= libluajit-$(ABIVER).so
+@@ -56,7 +55,6 @@
+ INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
+ INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
+ INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
+-INSTALL_TSYM= $(INSTALL_BIN)/$(INSTALL_TSYMNAME)
+ INSTALL_PC= $(INSTALL_PKGCONFIG)/$(INSTALL_PCNAME)
+ 
+ INSTALL_DIRS= $(INSTALL_BIN) $(INSTALL_LIB) $(INSTALL_INC) $(INSTALL_MAN) \
+@@ -114,13 +112,6 @@
+ 	  $(RM) $(FILE_PC).tmp
+ 	cd src && $(INSTALL_F) $(FILES_INC) $(INSTALL_INC)
+ 	cd lib && $(INSTALL_F) $(FILES_JITLIB) $(INSTALL_JITLIB)
+-	@echo "==== Successfully installed LuaJIT $(VERSION) to $(PREFIX) ===="
+-	@echo ""
+-	@echo "Note: the beta releases deliberately do NOT install a symlink for luajit"
+-	@echo "You can do this now by running this command (with sudo):"
+-	@echo ""
+-	@echo "  $(SYMLINK) $(INSTALL_TNAME) $(INSTALL_TSYM)"
+-	@echo ""
+ 
+ ##############################################################################
+ 
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
new file mode 100644
index 0000000..b35cdb4
--- /dev/null
+++ b/package/luajit/luajit.mk
@@ -0,0 +1,63 @@
+#############################################################
+#
+# luajit
+#
+#############################################################
+
+LUAJIT_VERSION = 2.0.0-beta10
+LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
+LUAJIT_SITE    = http://luajit.org/download
+
+LUAJIT_INSTALL_STAGING = YES
+
+define LUAJIT_NOLARGEFILE_FIX_MAKEFILE
+	$(SED) 's/TARGET_XCFLAGS= -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE/TARGET_XCFLAGS=/' $(@D)/src/Makefile
+endef
+
+ifneq ($(BR2_LARGEFILE),y)
+LUAJIT_POST_PATCH_HOOKS += LUAJIT_NOLARGEFILE_FIX_MAKEFILE
+endif
+
+# The luajit build procedure requires the host compiler to have the
+# same bitness as the target compiler. Therefore, on a x86 build
+# machine, we can't build luajit for x86_64, which is checked in
+# Config.in. When the target is a 32 bits target, we pass -m32 to
+# ensure that even on 64 bits build machines, a compiler of the same
+# bitness is used. Of course, this assumes that the 32 bits multilib
+# libraries are installed.
+ifeq ($(BR2_ARCH_IS_64),y)
+LUAJIT_HOST_CC=$(HOSTCC)
+else
+LUAJIT_HOST_CC=$(HOSTCC) -m32
+endif
+
+# We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
+# build system uses non conventional variable names.
+define LUAJIT_BUILD_CMDS
+	$(MAKE) PREFIX="/usr" \
+		STATIC_CC="$(TARGET_CC)" \
+		DYNAMIC_CC="$(TARGET_CC) -fPIC" \
+		TARGET_LD="$(TARGET_CC)" \
+		TARGET_AR="$(TARGET_AR) rcus" \
+		TARGET_STRIP="$(TARGET_STRIP)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		HOST_CC="$(LUAJIT_HOST_CC)" \
+		HOST_CFLAGS="$(HOST_CFLAGS)" \
+		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
+		-C $(@D) amalg
+endef
+
+define LUAJIT_INSTALL_STAGING_CMDS
+	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" -C $(@D) install
+endef
+
+define LUAJIT_INSTALL_TARGET_CMDS
+	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+define LUAJIT_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
