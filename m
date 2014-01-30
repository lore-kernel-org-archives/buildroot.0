From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 30 Jan 2014 12:46:52 +0100
Subject: [Buildroot] [PATCH v4 1/1] ljsyscall: new package
In-Reply-To: <1389928225-1845-1-git-send-email-danomimanchego123@gmail.com>
References: <1389928225-1845-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CAB0FRssiXxvgpOb4xUuCRr+PPQKF4PYvKCHgcPZ0jAF7JLGLqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-01-17 Danomi Manchego <danomimanchego123@gmail.com>:
> An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
> ---
>
> Note: this package requires LuaJIT specifically, so there is a depends-on
> in the ljsyscall/Config.in, even though though it is included from a
> menu with a "if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT" test around it.
>
> v3 -> v4:
>  - Rebase to master
>  - Bump version to 0.9
>  - Use github helper for download
>  - Account for shared directory
>
> v2 -> v3:
>  - Config.in: add depends-on particular target architectures, like LuaJIT.  Note
>            that this is not a compile time requirement but rather based on what
>            the package itself supports.
>  - Config.in: add comment stating when ljsyscall is hidden due to no LuaJIT
>  - ljsyscall.mk: simplify ifeq / else ifeq block
>  - ljsyscall.mk: use intermediate variable to simplify install lines
>
> v1 -> v2:
>  - Removed unnecessary build time dependency on LuaJIT.
>  - Specify -m 0644 during installation, since .lua files need not be executable.
> ---
>  package/Config.in              |    1 +
>  package/ljsyscall/Config.in    |   14 ++++++++++++++
>  package/ljsyscall/ljsyscall.mk |   37 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 52 insertions(+)
>  create mode 100644 package/ljsyscall/Config.in
>  create mode 100644 package/ljsyscall/ljsyscall.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 2f62d6c..873a54d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -369,6 +369,7 @@ source "package/cgilua/Config.in"
>  source "package/copas/Config.in"
>  source "package/coxpcall/Config.in"
>  source "package/lbase64/Config.in"
> +source "package/ljsyscall/Config.in"
>  source "package/lua-cjson/Config.in"
>  source "package/lua-ev/Config.in"
>  source "package/lua-msgpack-native/Config.in"
> diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
> new file mode 100644
> index 0000000..dcbd521
> --- /dev/null
> +++ b/package/ljsyscall/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LJSYSCALL
> +       bool "ljsyscall"
> +       # ljsyscall is specifically for LuaJIT, not Lua.
> +       depends on BR2_PACKAGE_LUAJIT
> +       # ljsyscall is only available for some target architectures
> +       depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
> +       help
> +         An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.
> +
> +         http://github.com/justincormack/ljsyscall
> +
> +comment "ljsyscall needs LuaJIT"
> +       depends on !BR2_PACKAGE_LUAJIT && (BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb)
> +
> diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
> new file mode 100644
> index 0000000..1f36dc7
> --- /dev/null
> +++ b/package/ljsyscall/ljsyscall.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# ljsyscall
> +#
> +################################################################################
> +
> +LJSYSCALL_VERSION = v0.9
> +LJSYSCALL_SITE = $(call github,justincormack,ljsyscall,$(LJSYSCALL_VERSION))
> +LJSYSCALL_LICENSE = MIT
> +LJSYSCALL_LICENSE_FILES = COPYRIGHT
> +
> +ifeq ($(BR2_i386),y)
> +LJSYSCALL_ARCH = x86
> +else ifeq ($(BR2_x86_64),y)
> +LJSYSCALL_ARCH = x64
> +else ifeq ($(BR2_powerpc),y)
> +LJSYSCALL_ARCH = ppc
> +else ifeq ($(LJSYSCALL_ARCH),)
> +LJSYSCALL_ARCH = $(BR2_ARCH)
> +endif
> +
> +LJSYSCALL_TARGET_DIR = $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)

Danomi,

I think that the right destination is :
    LJSYSCALL_TARGET_DIR = $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)

1) ljsyscall is designed for LuaJIT and PUC Lua + luaffi
2) the directory usr/share/luajit-2.0.2 seems to be reserved for
LuaJIT itself (see INSTALL_LMOD in luajit.pc)

Fran?ois

> +
> +define LJSYSCALL_INSTALL_TARGET_CMDS
> +       $(INSTALL) -d $(LJSYSCALL_TARGET_DIR)/syscall
> +       $(INSTALL) -m 0644 -t $(LJSYSCALL_TARGET_DIR)/ $(@D)/syscall.lua
> +       $(INSTALL) -m 0644 -t $(LJSYSCALL_TARGET_DIR)/syscall $(@D)/syscall/*.lua
> +
> +       $(INSTALL) -d $(LJSYSCALL_TARGET_DIR)/syscall/linux/$(LJSYSCALL_ARCH)
> +       $(INSTALL) -m 0644 -t $(LJSYSCALL_TARGET_DIR)/syscall/linux/ $(@D)/syscall/linux/*.lua
> +       $(INSTALL) -m 0644 -t $(LJSYSCALL_TARGET_DIR)/syscall/linux/$(LJSYSCALL_ARCH) $(@D)/syscall/linux/$(LJSYSCALL_ARCH)/*.lua
> +
> +       $(INSTALL) -d $(LJSYSCALL_TARGET_DIR)/syscall/shared
> +       $(INSTALL) -m 0644 -t $(LJSYSCALL_TARGET_DIR)/syscall/shared/ $(@D)/syscall/shared/*.lua
> +endef
> +
> +$(eval $(generic-package))
> --
> 1.7.9.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
