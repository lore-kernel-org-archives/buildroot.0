From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Sep 2014 22:39:47 +0200
Subject: [Buildroot] [PATCH v8] bcache-tools: Adding package.
In-Reply-To: <1410121662-23096-1-git-send-email-jcd@tribudubois.net>
References: <1410121662-23096-1-git-send-email-jcd@tribudubois.net>
Message-ID: <20140907203947.GA16635@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe, All,

On 2014-09-07 22:27 +0200, Jean-Christophe DUBOIS spake thusly:
> This is the bcache tools, required to setup the linux bcache
> feature of the Linux kernel.
> 
> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet, a small comment below...

[--SNIP--]
> diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
> new file mode 100644
> index 0000000..e537471
> --- /dev/null
> +++ b/package/bcache-tools/bcache-tools.mk
> @@ -0,0 +1,37 @@
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
> +BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux
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
> +
> +# The bcache-tools Makefile expects the /lib/udev/rules.d directory to exist.
> +define BCACHE_TOOLS_INSTALL_UDEV
> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/lib/udev/rules.d
> +endef
> +
> +BCACHE_TOOLS_PRE_INSTALL_TARGET_HOOKS += BCACHE_TOOLS_INSTALL_MAN8
> +BCACHE_TOOLS_PRE_INSTALL_TARGET_HOOKS += BCACHE_TOOLS_INSTALL_UDEV

Sorry, I was not clear enough in my previous mails (although I did send a
corrective email to fix this): there is not need to have two hooks, you
should create the two directories in the same hook.

No need to resend, the comitter can do the change, hopefully! ;-)

Thank you! :-)

Regards,
Yann E. MORIN.

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
