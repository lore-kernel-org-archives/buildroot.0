From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Oct 2013 11:45:03 +0100
Subject: [Buildroot] [PATCH v2] ljsyscall: new package
In-Reply-To: <1380157817-1893-1-git-send-email-danomimanchego123@gmail.com>
References: <1380157817-1893-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20131027114503.2474cc62@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Wed, 25 Sep 2013 21:10:17 -0400, Danomi Manchego wrote:
> diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
> new file mode 100644
> index 0000000..0bed738
> --- /dev/null
> +++ b/package/ljsyscall/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LJSYSCALL
> +	bool "ljsyscall"
> +	# ljsyscall is specifically for LuaJIT, not Lua.
> +	depends on BR2_PACKAGE_LUAJIT
> +	help
> +	  An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.
> +
> +	  http://github.com/justincormack/ljsyscall

Could you add a comment that says:

comment "ljsyscall needs LuaJIT"
	depends on !BR2_PACKAGE_LUAJIT

> diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
> new file mode 100644
> index 0000000..9223890
> --- /dev/null
> +++ b/package/ljsyscall/ljsyscall.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# ljsyscall
> +#
> +################################################################################
> +
> +LJSYSCALL_VERSION = v0.8
> +LJSYSCALL_SITE = http://github.com/justincormack/ljsyscall/tarball/$(LJSYSCALL_VERSION)
> +LJSYSCALL_LICENSE = MIT
> +LJSYSCALL_LICENSE_FILES = COPYRIGHT
> +
> +ifeq ($(BR2_i386),y)
> +LJSYSCALL_ARCH = x86
> +endif
> +ifeq ($(BR2_x86_64),y)
> +LJSYSCALL_ARCH = x64
> +endif
> +ifeq ($(BR2_powerpc),y)
> +LJSYSCALL_ARCH = ppc
> +endif
> +ifeq ($(LJSYSCALL_ARCH),)
> +LJSYSCALL_ARCH = $(BR2_ARCH)
> +endif

It seems like ljsyscall does not have support for all the architectures
supported in Buildroot. It would therefore be good to add the relevant
architecture dependencies in Config.in, and probably only the ones you
actually tested. For example, it's not necessarily clear if the MIPS
support covers MIPS 32 bits only, or also MIPS 64 bits, and if it
covers MIPS 64 bits, which MIPS ABIs are supported.

Also, that's a minor nit, but you could use some 'else' instructions,
like:

ifeq (...)
...
else ifeq (...)
...
else ifeq (...)
...
endif

> +define LJSYSCALL_INSTALL_TARGET_CMDS
> +	$(INSTALL) -d $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall
> +	$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/ $(@D)/syscall.lua
> +	$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall $(@D)/syscall/*.lua
> +
> +	$(INSTALL) -d $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall/linux/$(LJSYSCALL_ARCH)
> +	$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall/linux/ $(@D)/syscall/linux/*.lua
> +	$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall/linux/$(LJSYSCALL_ARCH) $(@D)/syscall/linux/$(LJSYSCALL_ARCH)/*.lua
> +endef

Maybe you could define:

LJSYSCALL_TARGET_DIR = $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)

and use that in your install target commands to save a bit of space.

Could you fix these and resend an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
