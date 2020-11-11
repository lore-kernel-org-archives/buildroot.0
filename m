From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Nov 2020 22:06:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/linux-backports: use buildroot
 host flex and bison
In-Reply-To: <20201111162208.362275-1-ju.o@free.fr>
References: <20201111162208.362275-1-ju.o@free.fr>
Message-ID: <20201111210633.GF3971474@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2020-11-11 17:22 +0100, Julien Olivain spake thusly:
> Upstream backports package does not define the LEX/YACC Makefile
> variables, contrary to the Kernel which is defining those in [1]. The
> default "lex" and "yacc" are then used. On some systems, "yacc" is
> Berkeley Yacc. Kconfig parser files are using non-Posix Bison
> constructs.
> 
> Attempting to generate the parser with byacc fails with error:
> 
>     yacc: e - line 97 of "zconf.y", syntax error
>     %destructor {
>     ^
> 
> This patch adds the missing dependencies on host-flex and host-bison,
> and make sure the package compilation will use those, to fix this issue.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=73a4f6dbe70a1b93c11e2d1d6ca68f3522daf434
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/linux-backports/linux-backports.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
> index 1d7d6e7f00..fafb8efb91 100644
> --- a/package/linux-backports/linux-backports.mk
> +++ b/package/linux-backports/linux-backports.mk
> @@ -11,6 +11,8 @@ LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stab
>  LINUX_BACKPORTS_LICENSE = GPL-2.0
>  LINUX_BACKPORTS_LICENSE_FILES = COPYING
>  
> +LINUX_BACKPORTS_DEPENDENCIES = host-bison host-flex

As far as I understand it, this is need for the kconfig infra (mconf et
al.), right?

If so, can we instead use:

    LINUX_BACKPORTS_DEPENDENCIES = \
        $(BR2_BISON_HOST_DEPENDENCY) \
        $(BR2_FLEX_HOST_DEPENDENCY)

... along with...

>  ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
>  LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
>  else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> @@ -33,6 +35,8 @@ LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
>  # LINUX_BACKPORTS_MODULE_MAKE_OPTS is used by the kernel-module infra.
>  #
>  LINUX_BACKPORTS_MAKE_OPTS = \
> +	LEX="$(HOST_DIR)/bin/flex" \
> +	YACC="$(HOST_DIR)/bin/bison" \

    LEX=flex \
    YACC=bison \

Thoughts?

See for example: linux/linux.mk lines 80-85
and for reference: support/dependencies/check-host-bison-flex.mk

Regards,
Yann E. MORIN.

>  	BACKPORT_DIR=$(@D) \
>  	KLIB_BUILD=$(LINUX_DIR) \
>  	KLIB=$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
