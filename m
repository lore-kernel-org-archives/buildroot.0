From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 11 Nov 2020 22:35:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/linux-backports: use buildroot
 host flex and bison
In-Reply-To: <20201111162208.362275-1-ju.o@free.fr>
References: <20201111162208.362275-1-ju.o@free.fr>
Message-ID: <20201111213505.GA28486@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

thanks for working on linux-backports package!

> Upstream backports package does not define the LEX/YACC Makefile
> variables, contrary to the Kernel which is defining those in [1]. The
> default "lex" and "yacc" are then used. On some systems, "yacc" is
> Berkeley Yacc. Kconfig parser files are using non-Posix Bison
> constructs.

> Attempting to generate the parser with byacc fails with error:

>     yacc: e - line 97 of "zconf.y", syntax error
>     %destructor {
>     ^

> This patch adds the missing dependencies on host-flex and host-bison,
> and make sure the package compilation will use those, to fix this issue.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=73a4f6dbe70a1b93c11e2d1d6ca68f3522daf434

...
>  package/linux-backports/linux-backports.mk | 4 ++++
....
> +LINUX_BACKPORTS_DEPENDENCIES = host-bison host-flex
> +
>  ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
>  LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
>  else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> @@ -33,6 +35,8 @@ LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
>  # LINUX_BACKPORTS_MODULE_MAKE_OPTS is used by the kernel-module infra.

>  LINUX_BACKPORTS_MAKE_OPTS = \
> +	LEX="$(HOST_DIR)/bin/flex" \
> +	YACC="$(HOST_DIR)/bin/bison" \
Are these really in /bin? Not in /usr/bin?

Otherwise LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
