From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:37:41 +0200
Subject: [Buildroot] [PATCH v2 4/7] package/cups: Add lp user as default
 cups user
In-Reply-To: <20200619145719.2352019-5-angelo@amarulasolutions.com>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
 <20200619145719.2352019-5-angelo@amarulasolutions.com>
Message-ID: <20200620223741.2c38c12b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Jun 2020 16:57:16 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> This patch is a backport from the rockchip tree.

Good idea to try to bring back into Buildroot changes made in other
forks! However, it would be nice to have a better commit log that
explains why these changes are needed, i.e what is the visible issue
without this fix.

> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index 461e0d9143..40fe210c94 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -22,6 +22,9 @@ CUPS_CONF_OPTS = \
>  	--disable-gssapi \
>  	--disable-pam \
>  	--libdir=/usr/lib \
> +	--with-cups-user=lp \
> +	--with-cups-group=lp \
> +	--with-system-groups="lpadmin sys root" \

What is this --with-system-groups option doing?

>  	--with-rcdir=no
>  CUPS_CONFIG_SCRIPTS = cups-config
>  CUPS_DEPENDENCIES = \
> @@ -78,4 +81,9 @@ define CUPS_INSTALL_INIT_SYSV
>  		$(TARGET_DIR)/etc/init.d/S81cupsd
>  endef
>  
> +define CUPS_USERS
> +	lp -1 lp -1 * /var/spool/lpd /bin/false - lp
> +	- - lpadmin -1 * - - - Printers admin group.

So we need both a "lp" group and a "lpadmin" group ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
