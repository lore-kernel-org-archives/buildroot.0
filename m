From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 29 Oct 2013 21:18:30 -0400
Subject: [Buildroot] [PATCH v3 1/1] ljsyscall: new package
Message-ID: <1383095910-2399-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

Note: this package requires LuaJIT specifically, so there is a depends-on
in the ljsyscall/Config.in, even though though it is included from a
menu with a "if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT" test around it.

v1 -> v2:
 - Removed unnecessary build time dependency on LuaJIT.
 - Specify -m 0644 during installation, since .lua files need not be executable.

v2 -> v3:
 - Config.in: add depends-on particular target architectures, like LuaJIT.  Note
           that this is not a compile time requirement but rather based on what
           the package itself supports.
 - Config.in: add comment stating when ljsyscall is hidden due to no LuaJIT
 - ljsyscall.mk: simplify ifeq / else ifeq block
 - ljsyscall.mk: use intermediate variable to simplify install lines
---
 package/Config.in              |    1 +
 package/ljsyscall/Config.in    |   14 ++++++++++++++
 package/ljsyscall/ljsyscall.mk |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 package/ljsyscall/Config.in
 create mode 100644 package/ljsyscall/ljsyscall.mk

diff --git a/package/Config.in b/package/Config.in
index 4c4da51..be4ccc3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -359,6 +359,7 @@ source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
+source "package/ljsyscall/Config.in"
 source "package/luabitop/Config.in"
 source "package/luacjson/Config.in"
 source "package/luacrypto/Config.in"
diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
new file mode 100644
index 0000000..dcbd521
--- /dev/null
+++ b/package/ljsyscall/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LJSYSCALL
+	bool "ljsyscall"
+	# ljsyscall is specifically for LuaJIT, not Lua.
+	depends on BR2_PACKAGE_LUAJIT
+	# ljsyscall is only available for some target architectures
+	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
+	help
+	  An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.
+
+	  http://github.com/justincormack/ljsyscall
+
+comment "ljsyscall needs LuaJIT"
+	depends on !BR2_PACKAGE_LUAJIT && (BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb)
+
diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
new file mode 100644
index 0000000..861a778
--- /dev/null
+++ b/package/ljsyscall/ljsyscall.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# ljsyscall
+#
+################################################################################
+
+LJSYSCALL_VERSION = v0.8
+LJSYSCALL_SITE = http://github.com/justincormack/ljsyscall/tarball/$(LJSYSCALL_VERSION)
+LJSYSCALL_LICENSE = MIT
+LJSYSCALL_LICENSE_FILES = COPYRIGHT
+
+ifeq ($(BR2_i386),y)
+LJSYSCALL_ARCH = x86
+else ifeq ($(BR2_x86_64),y)
+LJSYSCALL_ARCH = x64
+else ifeq ($(BR2_powerpc),y)
+LJSYSCALL_ARCH = ppc
+else ifeq ($(LJSYSCALL_ARCH),)
+LJSYSCALL_ARCH = $(BR2_ARCH)
+endif
+
+LJSYSCALL_TARGET_DIR = $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)
+
+define LJSYSCALL_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(LJSYSCALL_TARGET_DIR)/syscall
+	$(INSTALL) -m 0644 -t $(LJSYSCALL_TARGET_DIR)/ $(@D)/syscall.lua
+	$(INSTALL) -m 0644 -t $(LJSYSCALL_TARGET_DIR)/syscall $(@D)/syscall/*.lua
+
+	$(INSTALL) -d $(LJSYSCALL_TARGET_DIR)/syscall/linux/$(LJSYSCALL_ARCH)
+	$(INSTALL) -m 0644 -t $(LJSYSCALL_TARGET_DIR)/syscall/linux/ $(@D)/syscall/linux/*.lua
+	$(INSTALL) -m 0644 -t $(LJSYSCALL_TARGET_DIR)/syscall/linux/$(LJSYSCALL_ARCH) $(@D)/syscall/linux/$(LJSYSCALL_ARCH)/*.lua
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
