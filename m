From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Sep 2020 23:09:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/altera-stapl: new package
In-Reply-To: <20200124151624.16728-1-jochen.baltes@gmail.com>
References: <20200124151624.16728-1-jochen.baltes@gmail.com>
Message-ID: <20200914210956.GB19902@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jochen, All,

Sorry for the long delay before lookign at this patch.

On 2020-01-24 15:16 +0000, Jochen Baltes spake thusly:
> Alteras Jam STAPL Bytecode Player with 64-bit support.
> This is a user-space port of the altera-stapl driver from the linux kernel.
> The source released by Altera wasn't 64-bit compatible.
> Additionally, the linux version is much cleaner and old cruft was removed.
> 
> Signed-off-by: Jochen Baltes <jochen.baltes@gmail.com>
> ---
>  ...strlcpy-function-with-weak-attribute.patch | 28 +++++++++++++++
>  ...ix-type-missmatch-warning-in-fprintf.patch | 34 +++++++++++++++++++

Since those two patches have now been applied upstream, and since they
are the only two changes over the version 0.3.2 that you were dding,
I've switched to using the latest HEAD of the respository, which 
allows to avoid carrying those patches.

> +	  Altera Jam STAPL Bytecode Player.
> +
> +	  https://github.com/kontron/altera-stapl
> diff --git a/package/altera-stapl/altera-stapl.hash b/package/altera-stapl/altera-stapl.hash
> new file mode 100644
> index 0000000000..9ea977924e
> --- /dev/null
> +++ b/package/altera-stapl/altera-stapl.hash
> @@ -0,0 +1,2 @@
> +sha256	22c7c9dadfb0d09a6fd3b5497cc22f7ebf7a0969d20dc37e71c8035bb5642036  altera-stapl-0.3.2.tar.gz
> +sha256	d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING

Two spaces to separate fields, not TABs.

Applied to master now, thanks!

Regards,
Yann E. MORIN.

> diff --git a/package/altera-stapl/altera-stapl.mk b/package/altera-stapl/altera-stapl.mk
> new file mode 100644
> index 0000000000..149a243604
> --- /dev/null
> +++ b/package/altera-stapl/altera-stapl.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# altera-stapl
> +#
> +################################################################################
> +
> +ALTERA_STAPL_VERSION = 0.3.2
> +ALTERA_STAPL_SITE = $(call github,kontron,altera-stapl,$(ALTERA_STAPL_VERSION))
> +ALTERA_STAPL_LICENSE = GPLv2+
> +ALTERA_STAPL_LICENSE_FILES = COPYING
> +ALTERA_STAPL_DEPENDENCIES = libgpiod
> +
> +define ALTERA_STAPL_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> +endef
> +
> +define ALTERA_STAPL_INSTALL_TARGET_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.20.1
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
