From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Aug 2014 23:48:52 +0200
Subject: [Buildroot] [PATCH v5] bcache-tools: Adding package.
In-Reply-To: <1407259782-6012-1-git-send-email-jcd@tribudubois.net>
References: <1407259782-6012-1-git-send-email-jcd@tribudubois.net>
Message-ID: <20140806214852.GG1587@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe, All,

On 2014-08-05 19:29 +0200, Jean-Christophe DUBOIS spake thusly:
> This is the bcache tools, required to setup the linux bcache
> feature of the Linux kernel.

We're almost there! :-)

> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
[--SNIP--]
> diff --git a/package/bcache-tools/Config.in b/package/bcache-tools/Config.in
> new file mode 100644
> index 0000000..383ba1f
> --- /dev/null
> +++ b/package/bcache-tools/Config.in
[--SNIP--]
> +comment "bcache-tools needs udev /dev management and a toolchain w/ largefile, wchar"
> +	depends on BR2_USE_MMU
> +        depends on !BR2_PACKAGE_HAS_UDEV || !BR2_LARGEFILE || !BR2_USE_WCHAR

Leading TAB, please.

> diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
> new file mode 100644
> index 0000000..5e451cf
> --- /dev/null
> +++ b/package/bcache-tools/bcache-tools.mk
> @@ -0,0 +1,39 @@
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
> +
> +# We need to use the BR2 host pkg-config binary in the Makefile
> +define BCACHE_TOOLS_FIX_PKGCONFIG
> +	$(SED) 's^`pkg-config^`$(PKG_CONFIG_HOST_BINARY)^' \
> +		$(BCACHE_TOOLS_DIR)/Makefile
> +endef

This is not needed, since the host directory comes early in the PATH, so
it finds our own pkg-config.

> +BCACHE_TOOLS_POST_EXTRACT_HOOKS += BCACHE_TOOLS_FIX_PKGCONFIG
> +
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

In Buildroot, the man pages are simply removed from the target/ dir jsut
prior to generatign the filesystem images.

Then, why not simply patch the Makefile to not install them in the first
place? Like, in a post-extract hook.

Thanks for your persistence! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
