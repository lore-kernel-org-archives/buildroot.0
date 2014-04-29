From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Apr 2014 18:56:19 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: new package
In-Reply-To: <1398790166-18900-1-git-send-email-gustavo@zacarias.com.ar>
References: <1398790166-18900-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140429165618.GB3248@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-04-29 13:49 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[--SNIP--]
> diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
> new file mode 100644
> index 0000000..2e71a01
> --- /dev/null
> +++ b/package/btrfs-progs/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_BTRFS_PROGS
> +	bool "btrfs-progs"
> +	depends on BR2_LARGEFILE # acl, attr
> +	depends on BR2_USE_WCHAR # util-linux
> +	depends on BR2_USE_MMU # util-linux
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_ACL
> +	select BR2_PACKAGE_ATTR
> +	select BR2_PACKAGE_E2FSPROGS
> +	select BR2_PACKAGE_LZO
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Btrfs filesystem utilities
> +
> +	  https://btrfs.wiki.kernel.org/index.php/Main_Page
> +
> +comment "btrfs-progs needs a toolchain w/ largefile, wchar, threads"
> +	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_HAS_THREADS

This should also "depends on BR2_USE_MMU".

> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> new file mode 100644
> index 0000000..415ded2
> --- /dev/null
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# btrfs-progs
> +#
> +################################################################################
> +
> +BTRFS_PROGS_VERSION = 3.14.1
> +BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/mason/btrfs-progs
> +BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
> +BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
> +BTRFS_PROGS_LICENSE = GPLv2
> +BTRFS_PROGS_LICENSE_FILES = COPYING
> +
> +define BTRFS_PROGS_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +define BTRFS_PROGS_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) prefix=/usr DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +$(eval $(generic-package))

Would it make sense to add them as host-tools, too?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
