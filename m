From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 16:46:57 +0200
Subject: [Buildroot] [PATCH 4/4] package/lttng-{libust,
 tools}: use proper systemd rundir
In-Reply-To: <20200626220603.29561-4-nolange79@gmail.com>
References: <20200626220603.29561-1-nolange79@gmail.com>
 <20200626220603.29561-4-nolange79@gmail.com>
Message-ID: <20200627164657.6847d67e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 27 Jun 2020 00:06:02 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Set the rundir to /run/lttng, if systemd is the init system.
> /var/run is "legacy" in systemd's view.
> 
> Perhaps a better way would be to define a variable
> BR2_PACKAGE_RUNDIR to /var/run or /run depending on ini system.
> (systemd will for example issue warnings for the dbus service,
> using a socket in /var/run)

I've dropped this paragraph, since it doesn't really belong in the
commit message itself.

Is there a reason to still use /var/run in non-systemd systems ?

>  ifeq ($(BR2_PACKAGE_PYTHON),y)
>  LTTNG_LIBUST_DEPENDENCIES += python
>  LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
> diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
> index b1b0a24a4f..0f3dc84ebd 100644
> --- a/package/lttng-tools/lttng-tools.mk
> +++ b/package/lttng-tools/lttng-tools.mk
> @@ -13,6 +13,10 @@ LTTNG_TOOLS_LICENSE_FILES = LICENSE $(addprefix LICENSES/,BSD-2-Clause BSD-3-Cla
>  LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
>  LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
>  
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +LTTNG_LIBUST_CONF_OPTS += --with-lttng-system-rundir=/run/lttng

You're using LTTNG_LIBUST_CONF_OPTS, but it should have been
LTTNG_TOOLS_CONF_OPTS.

I fixed that when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
