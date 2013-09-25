From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Sep 2013 08:04:45 +0200
Subject: [Buildroot] [PATCH] ljsyscall: new package
In-Reply-To: <1380070732-1834-1-git-send-email-danomimanchego123@gmail.com>
References: <1380070732-1834-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <b1ff0935-bab9-4aa5-8aa7-9fdfd59dab7b@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi Manchego <danomimanchego123@gmail.com> wrote:
>An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.
>
>Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
>---
>
>Note: this package requires LuaJIT specifically, so there is a depends-on
>in the ljsyscall/Config.in, even though though it is included from a
>menu with a "if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT" test around it.
>---
> package/Config.in              |    1 +
> package/ljsyscall/Config.in    |    8 ++++++++
> package/ljsyscall/ljsyscall.mk |   36 ++++++++++++++++++++++++++++++++++++
> 3 files changed, 45 insertions(+)
> create mode 100644 package/ljsyscall/Config.in
> create mode 100644 package/ljsyscall/ljsyscall.mk
>
>diff --git a/package/Config.in b/package/Config.in
>index 1dd60d1..457e5ad 100644
>--- a/package/Config.in
>+++ b/package/Config.in
>@@ -355,6 +355,7 @@ source "package/cgilua/Config.in"
> source "package/copas/Config.in"
> source "package/coxpcall/Config.in"
> source "package/lbase64/Config.in"
>+source "package/ljsyscall/Config.in"
> source "package/luabitop/Config.in"
> source "package/luacjson/Config.in"
> source "package/luacrypto/Config.in"
>diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
>new file mode 100644
>index 0000000..0bed738
>--- /dev/null
>+++ b/package/ljsyscall/Config.in
>@@ -0,0 +1,8 @@
>+config BR2_PACKAGE_LJSYSCALL
>+	bool "ljsyscall"
>+	# ljsyscall is specifically for LuaJIT, not Lua.
>+	depends on BR2_PACKAGE_LUAJIT
>+	help
>+	  An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.
>+
>+	  http://github.com/justincormack/ljsyscall
>diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
>new file mode 100644
>index 0000000..25a5ec9
>--- /dev/null
>+++ b/package/ljsyscall/ljsyscall.mk
>@@ -0,0 +1,36 @@
>+################################################################################
>+#
>+# ljsyscall
>+#
>+################################################################################
>+
>+LJSYSCALL_VERSION = v0.8
>+LJSYSCALL_SITE = http://github.com/justincormack/ljsyscall/tarball/$(LJSYSCALL_VERSION)
>+LJSYSCALL_DEPENDENCIES = luajit
>+LJSYSCALL_LICENSE = MIT
>+LJSYSCALL_LICENSE_FILES = COPYRIGHT
>+
>+ifeq ($(BR2_i386),y)
>+LJSYSCALL_ARCH = x86
>+endif
>+ifeq ($(BR2_x86_64),y)
>+LJSYSCALL_ARCH = x64
>+endif
>+ifeq ($(BR2_powerpc),y)
>+LJSYSCALL_ARCH = ppc
>+endif
>+ifeq ($(LJSYSCALL_ARCH),)
>+LJSYSCALL_ARCH = $(BR2_ARCH)
>+endif
>+
>+define LJSYSCALL_INSTALL_TARGET_CMDS
>+	$(INSTALL) -d $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall
>+	$(INSTALL) -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/ $(@D)/syscall.lua
>+	$(INSTALL) -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall $(@D)/syscall/*.lua
>+
>+	$(INSTALL) -d $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall/linux/$(LJSYSCALL_ARCH)
>+	$(INSTALL) -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall/linux/ $(@D)/syscall/linux/*.lua
>+	$(INSTALL) -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall/linux/$(LJSYSCALL_ARCH) $(@D)/syscall/linux/$(LJSYSCALL_ARCH)/*.lua
>+endef

Any specific reason why the standard install rule doesn't work?

>+
>+$(eval $(generic-package))

Best regards,
Thomas
