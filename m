From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 22:42:20 +0100
Subject: [Buildroot] [PATCH 1/1] emlog:new package
In-Reply-To: <1449224567-14412-1-git-send-email-joris.lijssens@gmail.com>
References: <1449224567-14412-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20151217214220.GF3653@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joris, All,

On 2015-12-04 11:22 +0100, Joris Lijssens spake thusly:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
> new file mode 100644
> index 0000000..9264849
> --- /dev/null
> +++ b/package/emlog/emlog.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# emlog
> +#
> +################################################################################
> +
> +EMLOG_VERSION = 0.52
> +EMLOG_SITE = $(call github,nicupavel,emlog,emlog-$(EMLOG_VERSION))
> +EMLOG_LICENSE = GPLv2
> +EMLOG_LICENSE_FILES = COPYING
> +
> +EMLOG_DEPENDENCIES = linux
> +
> +define EMLOG_BUILD_CMDS
> +       $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
> +       $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" -C $(@D) nbcat
> +endef
> +
> +define EMLOG_INSTALL_TARGET_CMDS
> +       $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) \
> +               INSTALL_MOD_STRIP=1 \
> +               modules_install
> +       $(INSTALL) -m 0755 $(@D)/nbcat $(TARGET_DIR)/usr/bin
> +endef

As far as I can see, this is using the standrad Linux out-of-tree
external module mechanism to build the emlog module. Buildroot has
an infrastructure to help write packages that build a kernel module:
    https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules

Thomas and I believe emlog should use that kernel-module infra.
You just need to handle the nbcat userland utility with the
generic-package infra.

Care to update and respin, please?

In the meantime, I'm marking this patch as "Changes Requested" in our
Patchwork.

Thanks! :-)

> +$(eval $(generic-package))
> -- 
> 1.8.3.1
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
