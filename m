From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:18:43 +0200
Subject: [Buildroot] [PATCH v2 03/13] system/Config.in: add new init -
 openrc
In-Reply-To: <20190512195550.24457-3-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
 <20190512195550.24457-3-michal.lyszczek@bofc.pl>
Message-ID: <20190518231843.021bf74b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 May 2019 21:55:40 +0200
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> This is very basic settings for openrc init.
> 
> * system/Config.in
>   Allows to select openrc as init system (which auto selects
>   openrc-skeleton and openrc package).
> 
> * package/ifupdown-scripts/Config.in
>   openrc has its own service to bring up/down interfaces, so
>   ifupdown-scripts should not be enabled when openrc is enabled to
>   prevent service clash.
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

I've applied, with some changes, see below.

> diff --git a/package/openrc/Config.in b/package/openrc/Config.in
> index 4baeed60ae..f79279533f 100644
> --- a/package/openrc/Config.in
> +++ b/package/openrc/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_OPENRC
>  	bool "OpenRC"
>  	select BR2_PACKAGE_NCURSES
> +	depends on BR2_INIT_OPENRC

"depends on" must be before selects, otherwise "make check-package"
complains.
> +config BR2_INIT_OPENRC
> +	bool "OpenRC"
> +	depends on BR2_USE_MMU

I have replicated this BR2_USE_MMU dependency on the openrc package.
Also, a !BR2_STATIC_LIBS dependency was missing, which I have added to
both BR2_PACKAGE_OPENRC and BR2_INIT_OPENRC.

And due to this !BR2_STATIC_LIBS dependency, I've added a Config.in
comment as well.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
