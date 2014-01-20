From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2014 22:40:35 +0100
Subject: [Buildroot] [git commit] ljsyscall: new package
Message-ID: <20140120214721.7114F9BC28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95f72b283ef70b765da947454b4244f680b9deee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/ljsyscall/Config.in    |   14 ++++++++++++++
 package/ljsyscall/ljsyscall.mk |   37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0bb0d2d..8c8f616 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -369,6 +369,7 @@ source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
+source "package/ljsyscall/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
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
index 0000000..1f36dc7
--- /dev/null
+++ b/package/ljsyscall/ljsyscall.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# ljsyscall
+#
+################################################################################
+
+LJSYSCALL_VERSION = v0.9
+LJSYSCALL_SITE = $(call github,justincormack,ljsyscall,$(LJSYSCALL_VERSION))
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
+
+	$(INSTALL) -d $(LJSYSCALL_TARGET_DIR)/syscall/shared
+	$(INSTALL) -m 0644 -t $(LJSYSCALL_TARGET_DIR)/syscall/shared/ $(@D)/syscall/shared/*.lua
+endef
+
+$(eval $(generic-package))
