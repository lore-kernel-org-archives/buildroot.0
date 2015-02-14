From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 08:44:12 +0100
Subject: [Buildroot] [PATCH v4 3/3] package/gtksharp: new package
In-Reply-To: <1423748972-17471-4-git-send-email-angelo.compagnucci@gmail.com>
References: <1423748972-17471-1-git-send-email-angelo.compagnucci@gmail.com>
 <1423748972-17471-4-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150214084412.77869323@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 12 Feb 2015 14:49:32 +0100, Angelo Compagnucci wrote:

> diff --git a/package/gtksharp/Config.in b/package/gtksharp/Config.in
> new file mode 100644
> index 0000000..8f3af2e
> --- /dev/null
> +++ b/package/gtksharp/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_GTKSHARP
> +	bool "gtk#"
> +	depends on BR2_PACKAGE_MONO

Not needed, since this Config.in file is already only included if Mono
is enabled, as per your change in package/Config.in.

> +	select BR2_PACKAGE_LIBGTK3

You can't just select libgtk3, you also need to inherit all its
dependencies. However, I am not sure in such situation if we really
want to "select" libgtk3 or to "depend" on it. The reason is that by
using "select", the user may not necessarily go to the libgtk3 option
to select the display backend. And by default, the display backend is
the Broadway backend, which most likely isn't what the user wants.

So for this case, I would personally lean towards using "depends on
BR2_PACKAGE_LIBGTK3", especially since it's quite obvious for the user
who wants gtk# that the gtk library should be installed.

> +	select BR2_TARGET_TZ_INFO

More details about why tz information are needed would be useful. In
any case, this should be:

	select BR2_TARGET_TZ_INFO if BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC

because the BR2_TARGET_TZ_INFO option is not available for Musl toolchains.

> +	help
> +	  Gtk# is a .NET language binding for the GTK+ toolkit.
> +
> +	  http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/2.99/

In the Config.in help text, we want the main web site of the project,
not the download URL. So most likely, this should instead be:

	  http://www.mono-project.com/docs/gui/gtksharp/

> diff --git a/package/gtksharp/gtksharp.mk b/package/gtksharp/gtksharp.mk
> new file mode 100644
> index 0000000..948db19
> --- /dev/null
> +++ b/package/gtksharp/gtksharp.mk
> @@ -0,0 +1,15 @@
> +#############################################################
> +#
> +# gtksharp
> +#
> +#############################################################

80 # signs are the convention.

> +
> +GTKSHARP_VERSION = 2.99.3
> +GTKSHARP_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/2.99/

Please use the GTKSHARP_VERSION_MAJOR thing used in several other packages:

GTKSHARP_VERSION_MAJOR = 2.99
GTKSHAP_VERSION = $(GTKSHARP_VERSION_MAJOR).3
GTKSHARP_SITE = ......./gtk-sharp/$(GTKSHARP_VERSION_MAJOR)/

> +GTKSHARP_SOURCE = gtk-sharp-$(GTKSHARP_VERSION).tar.xz
> +GTKSHARP_LICENSE = LGPLv2
> +GTKSHARP_LICENSE_FILES = COPYING
> +GTKSHARP_INSTALL_STAGING = YES
> +GTKSHARP_DEPENDENCIES += mono libgtk3

Minor detail: the += sign is not needed here, you could just do '='.

Other than that looks good. Really, the only thing a bit weird about
this series is the time zone related thing.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
