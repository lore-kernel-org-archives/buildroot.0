From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Sep 2014 12:42:08 +0200
Subject: [Buildroot] [PATCH v6] bcache-tools: Adding package.
In-Reply-To: <1407514262-18602-1-git-send-email-jcd@tribudubois.net>
References: <1407514262-18602-1-git-send-email-jcd@tribudubois.net>
Message-ID: <20140906104208.GA3957@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe, All,

Sorry for the delay in reviewing this patch...

On 2014-08-08 18:11 +0200, Jean-Christophe DUBOIS spake thusly:
[--SNIP--]
> diff --git a/package/bcache-tools/Config.in b/package/bcache-tools/Config.in
> new file mode 100644
> index 0000000..a3f7897
> --- /dev/null
> +++ b/package/bcache-tools/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_BCACHE_TOOLS
> +	bool "bcache tools"
> +	depends on BR2_PACKAGE_HAS_UDEV

udev is a runtime dependency only...

> +	depends on BR2_LARGEFILE # util-linux
> +	depends on BR2_USE_WCHAR # util-linux
> +	depends on BR2_USE_MMU # util-linux (libblkid)
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +	help
> +	  Bcache is a Linux kernel block layer cache. It allows one or
> +	  more fast disk drives such as flash-based solid state drives (SSDs)
> +	  to act as a cache for one or more slower hard disk drives.
> +
> +	  http://bcache.evilpiepirate.org/
> +
> +	  This is the user space bcache tools, required to setup the linux
> +	  bcache feature of the Linux kernel.
> +
> +comment "bcache-tools needs udev /dev management and a toolchain w/ largefile, wchar"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_LARGEFILE || !BR2_USE_WCHAR
> diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
> new file mode 100644
> index 0000000..880bf5e
> --- /dev/null
> +++ b/package/bcache-tools/bcache-tools.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# bcache-tools
> +#
> +################################################################################
> +
> +BCACHE_TOOLS_VERSION = v1.0.7
> +BCACHE_TOOLS_SITE = $(call github,g2p,bcache-tools,$(BCACHE_TOOLS_VERSION))
> +BCACHE_TOOLS_LICENSE = GPLv2
> +BCACHE_TOOLS_LICENSE_FILES = COPYING
> +BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux eudev

... so you do not need to depend on it here, just in the Config.in file.

And even if you needed to depend on udev at runtime, that's not eudev
you'd have to depend on, but just 'udev' (which is a virtual package
provided by either eudev or systemd.)

> +# We pass $(TARGET_CONFIGURE_OPTS) as environment variable to allow
> +# the bcache-tools Makefile to alter CFLAGS
> +define BCACHE_TOOLS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +# The bcache-tools Makefile expects the man8 directory to exist.
> +define BCACHE_TOOLS_INSTALL_MAN8
> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/man/man8
> +endef

Better to patch it out, since we do not keep the documentation on the
target anyway.

Regards,
Yann E. MORIN.

> +BCACHE_TOOLS_PRE_INSTALL_TARGET_HOOKS += BCACHE_TOOLS_INSTALL_MAN8
> +
> +define BCACHE_TOOLS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
