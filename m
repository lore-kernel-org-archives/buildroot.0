From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Nov 2017 21:40:17 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/waylandpp: new package
In-Reply-To: <20171106195413.28781-1-bernd.kuhls@t-online.de>
References: <20171106195413.28781-1-bernd.kuhls@t-online.de>
Message-ID: <20171106204017.GB2763@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-11-06 20:54 +0100, Bernd Kuhls spake thusly:
> Needed for Wayland support in the next Kodi release 18-Leia:
> 
> https://kodi.tv/article/gsoc-2017-update-wayland-support
> https://forum.kodi.tv/showthread.php?tid=309254

When reading a commit log, I am not that interested about the reason
why a new package is introduced. Someone has a need for it, and that's
enough. Having it after a --- line would be probably OK in this case.

What I really like to read however, is the peculiarity of the packaging,
if any.

For example, here, you would explain why the host variant is required.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v4: bumped to version 0.1.4, added license hashes
> v3: bumped to version 0.1.3
> v2: switched to cmake, added dependency on host-gcc >= 4.9
> 
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/waylandpp/Config.in      | 15 +++++++++++++++
>  package/waylandpp/waylandpp.hash |  4 ++++
>  package/waylandpp/waylandpp.mk   | 24 ++++++++++++++++++++++++
>  5 files changed, 45 insertions(+)
>  create mode 100644 package/waylandpp/Config.in
>  create mode 100644 package/waylandpp/waylandpp.hash
>  create mode 100644 package/waylandpp/waylandpp.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c651bf26fa..4ec248d844 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -331,6 +331,7 @@ F:	package/vdr/
>  F:	package/vdr-plugin-vnsiserver/
>  F:	package/vlc/
>  F:	package/vnstat/
> +F:	package/waylandpp/
>  F:	package/x11r7/
>  F:	package/x264/
>  F:	package/x265/
> diff --git a/package/Config.in b/package/Config.in
> index fe5ccc434e..73d53c6074 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1141,6 +1141,7 @@ menu "Graphics"
>  	source "package/powervr/Config.in"
>  	source "package/tiff/Config.in"
>  	source "package/wayland/Config.in"
> +	source "package/waylandpp/Config.in"
>  	source "package/wayland-protocols/Config.in"

Sort alphabetically, please. '-' sorts before 'p'.

(Meh, I'm nitpicking, but we never said what locale to sort in, so
I say ASCII! ;-] )

>  	source "package/webkitgtk/Config.in"
>  	source "package/webp/Config.in"
> diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
> new file mode 100644
> index 0000000000..92af363789
> --- /dev/null
> +++ b/package/waylandpp/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_WAYLANDPP
> +	bool "waylandpp"
> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	select BR2_PACKAGE_WAYLAND

wayland also requires threads and !static.

> +	help
> +	  Wayland C++ bindings
> +
> +	  https://github.com/NilsBrause/waylandpp
> +
> +comment "waylandpp needs an OpenGL-EGL/wayland backend, gcc >= 4.9, host gcc >= 4.9"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

threads and !static.

> diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
> new file mode 100644
> index 0000000000..11b8e3cda9
> --- /dev/null
> +++ b/package/waylandpp/waylandpp.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256 fc767573f7334525839221ac52e3dc4b56ebaf3f7a7cdaf4f05eb6baa6dd88ab  waylandpp-0.1.4.tar.gz
> +sha256 49aa6d728fd13226952c9e3a5a9cae46379b2a501010064760172b5ce7cd94bb  LICENSE
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
> diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
> new file mode 100644
> index 0000000000..b1560f16d1
> --- /dev/null
> +++ b/package/waylandpp/waylandpp.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# waylandpp
> +#
> +################################################################################
> +
> +WAYLANDPP_VERSION = 0.1.4
> +WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
> +WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
> +WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
> +WAYLANDPP_INSTALL_STAGING = YES
> +HOST_WAYLANDPP_DEPENDENCIES = host-pkgconf host-wayland
> +WAYLANDPP_DEPENDENCIES = libegl host-pkgconf wayland host-waylandpp

So, an EGL/wayland provider is required for the target variant, but what
about the host variant? What happens if the system does not have one?

What is the host variant needed for?

> +HOST_WAYLANDPP_CONF_OPTS = \
> +	-DBUILD_LIBRARIES=OFF \
> +	-DBUILD_SCANNER=ON

Blank line between HOST_WAYLANDPP_CONF_OPTS and WAYLANDPP_CONF_OPTS.

OK, host variant builds a scanner...

> +WAYLANDPP_CONF_OPTS = \
> +	-DBUILD_LIBRARIES=ON \
> +	-DBUILD_SCANNER=OFF \
> +	-DWAYLAND_SCANNERPP=$(HOST_DIR)/bin/wayland-scanner++

That is used ehre. Makes sense somehow.

Do we need to set something like:

    WAYLANDPP_SCANNER = $(HOST_DIR)/bin/wayland-scanner++

for other packages to use?

(I'm also wondering the same about wayland-scanner.)

Regards,
Yann E. MORIN.

> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> -- 
> 2.11.0
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
