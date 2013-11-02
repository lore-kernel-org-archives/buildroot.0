From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Nov 2013 18:56:36 +0100
Subject: [Buildroot] [PATCH 1/2] libnl: simplify makefile by using
 --{enable, disable}-cli
In-Reply-To: <1383387986-9508-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383387986-9508-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131102175636.GF3542@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-02 11:26 +0100, Thomas Petazzoni spake thusly:
> The libnl configure script has a --{enable,disable}-cli options that
> allows to enable or disable the compilation of the libnl tools. Use
> this option instead of compiling everything and then removing the
> installed programs.
> 
> Note that we also get rid of the uninstall command, which is planned
> to be globally removed in Buildroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/libnl/libnl.mk | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
> index 5c884d7..3b56bc8 100644
> --- a/package/libnl/libnl.mk
> +++ b/package/libnl/libnl.mk
> @@ -10,22 +10,11 @@ LIBNL_LICENSE = LGPLv2.1+
>  LIBNL_LICENSE_FILES = COPYING
>  LIBNL_INSTALL_STAGING = YES
>  LIBNL_DEPENDENCIES = host-bison host-flex
> -LIBNL_BINARIES = class-add class-delete class-list classid-lookup cls-add \
> -	cls-delete cls-list link-list pktloc-lookup qdisc-add qdisc-delete \
> -	qdisc-list
>  
> -define LIBNL_UNINSTALL_TARGET_CMDS
> -	rm -r $(TARGET_DIR)/usr/lib/libnl.* $(TARGET_DIR)/usr/lib/libnl-*.*
> -	rm -rf $(TARGET_DIR)/usr/lib/libnl
> -endef
> -
> -define LIBNL_REMOVE_TOOLS
> -	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/nl-, $(LIBNL_BINARIES))
> -	rm -rf $(TARGET_DIR)/usr/sbin/genl-ctrl-list
> -endef
> -
> -ifneq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
> -LIBNL_POST_INSTALL_TARGET_HOOKS += LIBNL_REMOVE_TOOLS
> +ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
> +LIBNL_CONF_OPT += --enable-cli
> +else
> +LIBNL_CONF_OPT += --disable-cli
>  endif
>  
>  $(eval $(autotools-package))
> -- 
> 1.8.1.2
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
