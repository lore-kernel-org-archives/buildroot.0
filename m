From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Nov 2020 22:24:10 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/linux-backports: use flex
 and bison to generate kconfig parser
In-Reply-To: <20201112120155.333290-1-ju.o@free.fr>
References: <20201111162208.362275-1-ju.o@free.fr>
 <20201112120155.333290-1-ju.o@free.fr>
Message-ID: <20201112212410.GE771438@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, all,

On 2020-11-12 13:01 +0100, Julien Olivain spake thusly:
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
> This patch defines the LEX and YACC Makefile variable to use flex and
> bison, to fix this issue. The host-bison and host-flex dependencies are
> added only if the host does not have them, following the same logic of
> the Kernel.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=73a4f6dbe70a1b93c11e2d1d6ca68f3522daf434
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Include suggestions from Yann:
>     Follow the same logic as the Kernel for kconfig flex/bison.
> ---
>  package/linux-backports/linux-backports.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
> index 1d7d6e7f00..030d7a2864 100644
> --- a/package/linux-backports/linux-backports.mk
> +++ b/package/linux-backports/linux-backports.mk
> @@ -11,6 +11,14 @@ LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stab
>  LINUX_BACKPORTS_LICENSE = GPL-2.0
>  LINUX_BACKPORTS_LICENSE_FILES = COPYING
>  
> +# flex and bison are needed to generate kconfig parser. We use the
> +# same logic as the linux kernel (we add host dependencies only if
> +# host does not have them). See linux/linux.mk and
> +# support/dependencies/check-host-bison-flex.mk.
> +LINUX_BACKPORTS_DEPENDENCIES = \
> +	$(BR2_BISON_HOST_DEPENDENCY) \
> +	$(BR2_FLEX_HOST_DEPENDENCY)
> +
>  ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
>  LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
>  else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> @@ -33,6 +41,8 @@ LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
>  # LINUX_BACKPORTS_MODULE_MAKE_OPTS is used by the kernel-module infra.
>  #
>  LINUX_BACKPORTS_MAKE_OPTS = \
> +	LEX=flex \
> +	YACC=bison \
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
