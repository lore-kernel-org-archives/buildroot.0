From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Fri, 20 Apr 2018 11:32:25 +0530
Subject: [Buildroot] [PATCH] package/tk: new package
In-Reply-To: <1524133923-11881-1-git-send-email-romain.naour@smile.fr>
References: <1524133923-11881-1-git-send-email-romain.naour@smile.fr>
Message-ID: <CA+NV+V=_u1-QDROdCfe7vORZ1iUxTwqq0S+CEk-gcNE_Pr91ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 19, 2018 at 4:02 PM, Romain Naour <romain.naour@smile.fr> wrote:
> Use the same version as tcl package.
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> tcl and tk should be updated together.
> ---
>  DEVELOPERS           |  1 +
>  package/Config.in    |  1 +
>  package/tk/Config.in | 18 ++++++++++++++++++
>  package/tk/tk.hash   |  3 +++
>  package/tk/tk.mk     | 31 +++++++++++++++++++++++++++++++
>  5 files changed, 54 insertions(+)
>  create mode 100644 package/tk/Config.in
>  create mode 100644 package/tk/tk.hash
>  create mode 100644 package/tk/tk.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index eec278d..b33722e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1621,6 +1621,7 @@ F:        package/stress-ng/
>  F:     package/supertux/
>  F:     package/supertuxkart/
>  F:     package/terminology/
> +F:     package/tk/
>  F:     package/upower/
>  F:     package/xenomai/
>
> diff --git a/package/Config.in b/package/Config.in
> index ddbbcff..ecd9b8f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -302,6 +302,7 @@ comment "Graphic libraries"
>         source "package/sdl2_mixer/Config.in"
>         source "package/sdl2_net/Config.in"
>         source "package/sdl2_ttf/Config.in"
> +       source "package/tk/Config.in"
>
>  comment "Other GUIs"
>         source "package/qt/Config.in"
> diff --git a/package/tk/Config.in b/package/tk/Config.in
> new file mode 100644
> index 0000000..507b0bf
> --- /dev/null
> +++ b/package/tk/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_TK
> +       bool "tk"
> +       depends on BR2_USE_MMU # tcl
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # tcl
> +       depends on !BR2_STATIC_LIBS # tcl
> +       depends on BR2_PACKAGE_XORG7
> +       select BR2_PACKAGE_TCL
> +       select BR2_PACKAGE_XLIB_LIBX11
> +       select BR2_PACKAGE_XLIB_LIBXFT
> +       help
> +         A windowing toolkit for use with tcl
> +
> +         http://www.tcl.tk
> +
> +comment "tk needs a toolchain w/ threads, dynamic library"
> +       depends on BR2_USE_MMU
> +       depends on BR2_PACKAGE_XORG7
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/tk/tk.hash b/package/tk/tk.hash
> new file mode 100644
> index 0000000..5fc0b6f
> --- /dev/null
> +++ b/package/tk/tk.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 d62c371a71b4744ed830e3c21d27968c31dba74dd2c45f36b9b071e6d88eb19d  tk8.6.6-src.tar.gz
> +sha256 2cde822b93ca16ae535c954b7dfe658b4ad10df2a193628d1b358f1765e8b198  license.terms
> diff --git a/package/tk/tk.mk b/package/tk/tk.mk
> new file mode 100644
> index 0000000..97c3ae6
> --- /dev/null
> +++ b/package/tk/tk.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# tk
> +#
> +################################################################################
> +
> +TK_VERSION_MAJOR = 8.6
> +TK_VERSION = $(TK_VERSION_MAJOR).6
> +TK_SOURCE = tk$(TK_VERSION)-src.tar.gz
> +TK_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TK_VERSION)
> +TK_LICENSE = tcl license

SPDX short identifier for TCL/TK license is TCL. So license string
here should be just TCL.

Thanks,
Rahul
