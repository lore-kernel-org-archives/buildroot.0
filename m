From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Aug 2020 22:06:58 +0200
Subject: [Buildroot] [PATCH] package/mg: new package
In-Reply-To: <20200830090050.889647-1-troglobit@gmail.com>
References: <20200830090050.889647-1-troglobit@gmail.com>
Message-ID: <20200830220658.1d134652@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Sun, 30 Aug 2020 11:00:51 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> diff --git a/package/mg/mg.hash b/package/mg/mg.hash
> new file mode 100644
> index 0000000000..6b3c400faa
> --- /dev/null
> +++ b/package/mg/mg.hash
> @@ -0,0 +1,5 @@
> +# From https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-4.6/

Is this a bad copy paste ?

> diff --git a/package/mg/mg.mk b/package/mg/mg.mk
> new file mode 100644
> index 0000000000..c8df6eddc6
> --- /dev/null
> +++ b/package/mg/mg.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# mg2a

Should be just "mg"

> +#
> +################################################################################
> +
> +MG_VERSION = 3.4
> +MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
> +MG_LICENSE = Public Domain
> +MG_LICENSE_FILES = UNLICENSE
> +
> +ifeq ($(BR2_PACKAGE_NCURSES),y)
> +MG_DEPENDENCIES += ncurses

Could you add:

MG_CONF_OPTS += --with-curses

or whatever is needed to explicitly enable ncurses support ?

> +else
> +MG_CONF_OPTS += --without-curses
> +endif
> +
> +define MG_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/tutorial $(TARGET_DIR)/usr/share/doc/tutorial
> +	gzip -9 $(TARGET_DIR)/usr/share/doc/tutorial

/usr/share/doc gets dropped from $(TARGET_DIR) during the
target-finalize step, so installing documentation there is not useful.

> +	$(INSTALL) -m 0755 -D $(@D)/src/mg $(TARGET_DIR)/usr/bin/mg
> +endef
> +
> +$(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
