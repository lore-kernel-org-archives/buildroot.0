From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 6 Nov 2013 12:05:48 +0100
Subject: [Buildroot] [PATCH] libevas: disable on avr32
In-Reply-To: <1383735243-18910-1-git-send-email-spdawson@gmail.com>
References: <1383735243-18910-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAAXf6LV6GFk27s8fpEbcDVKmrkipiKA_FGFEt-wcdXMutkwBoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 6, 2013 at 11:54 AM,  <spdawson@gmail.com> wrote:
> From: Simon Dawson <spdawson@gmail.com>
>
> Neither epoll_create1 nor inotify_init1 is available on avr32. Fixes build
> failures such as the following.
>
>   http://autobuild.buildroot.net/results/4d435a5fc608936362d605aca696c01023be9723
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/efl/expedite/Config.in      | 2 ++
>  package/efl/libecore/Config.in      | 2 ++
>  package/efl/libedje/Config.in       | 2 ++
>  package/efl/libelementary/Config.in | 2 ++
>  package/efl/libethumb/Config.in     | 2 ++
>  package/efl/libevas/Config.in       | 1 +
>  package/enlightenment/Config.in     | 2 ++
>  7 files changed, 13 insertions(+)
>
> diff --git a/package/efl/expedite/Config.in b/package/efl/expedite/Config.in
> index 466fd7d..5f6e97f 100644
> --- a/package/efl/expedite/Config.in
> +++ b/package/efl/expedite/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_EXPEDITE
>         select BR2_PACKAGE_LIBEVAS
>         select BR2_PACKAGE_LIBEET
>         depends on BR2_INSTALL_LIBSTDCPP
> +       # libevas
> +       depends on !BR2_avr32
>         help
>           Expedite is the official Evas benchmark tool. It can test different
>           engines, such as X11, XRender, OpenGL (also ES variant), SDL,
> diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
> index 6c887f5..77b5283 100644
> --- a/package/efl/libecore/Config.in
> +++ b/package/efl/libecore/Config.in
> @@ -38,5 +38,7 @@ config BR2_PACKAGE_LIBECORE_X_XCB
>  config BR2_PACKAGE_LIBECORE_EVAS
>         bool "libecore Evas support"
>         select BR2_PACKAGE_LIBEVAS
> +       # libevas
> +       depends on !BR2_avr32
>
>  endif # BR2_PACKAGE_LIBECORE
> diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
> index f0985dd..d142268 100644
> --- a/package/efl/libedje/Config.in
> +++ b/package/efl/libedje/Config.in
> @@ -7,6 +7,8 @@ config BR2_PACKAGE_LIBEDJE
>         select BR2_PACKAGE_LIBEMBRYO
>         select BR2_PACKAGE_LIBEVAS
>         select BR2_PACKAGE_LUA
> +       # libevas
> +       depends on !BR2_avr32
>         help
>           A graphical layout and animation library for animated
>           resizable, compressed and scalable themes.
> diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
> index 59af80e..c43d80d 100644
> --- a/package/efl/libelementary/Config.in
> +++ b/package/efl/libelementary/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_LIBELEMENTARY
>         select BR2_PACKAGE_LIBEVAS
>         select BR2_PACKAGE_LIBECORE
>         select BR2_PACKAGE_LIBEDJE
> +       # libevas
> +       depends on !BR2_avr32
>         help
>           Elementary is a widget toolkit and EFL wrapper and convenience
>           library to make it easy to build applications and tools with UIs
> diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
> index fb0032a..e85aa1d 100644
> --- a/package/efl/libethumb/Config.in
> +++ b/package/efl/libethumb/Config.in
> @@ -5,6 +5,8 @@ config BR2_PACKAGE_LIBETHUMB
>         select BR2_PACKAGE_LIBECORE
>         select BR2_PACKAGE_LIBECORE_EVAS
>         select BR2_PACKAGE_LIBEDJE
> +       # libevas
> +       depends on !BR2_avr32
>         help
>           Ethumb is a library for generating thumbnail images of documents.
>
> diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
> index f73376b..8c4193f 100644
> --- a/package/efl/libevas/Config.in
> +++ b/package/efl/libevas/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBEVAS
>         bool "libevas"
> +       depends on !BR2_avr32 # no epoll_create1 or inotify_init1
>         select BR2_PACKAGE_FREETYPE
>         select BR2_PACKAGE_LIBEINA
>         # required to build so far
> diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
> index 54c0ac6..5ec85a5 100644
> --- a/package/enlightenment/Config.in
> +++ b/package/enlightenment/Config.in
> @@ -26,6 +26,8 @@ config BR2_PACKAGE_ENLIGHTENMENT
>         # libedbus -> dbus
>         depends on BR2_USE_MMU
>         depends on BR2_PACKAGE_XORG7
> +       # libevas
> +       depends on !BR2_avr32
>         help
>           Enlightenment, also known simply as E, is a stacking window
>           manager for the X Window System which can be used alone or
> --

In all these places, the new 'depends on' should be repeated on the
comment that is shown when one of the toolchain options is missing.

Regarding the structure:
       # libevas
       depends on !BR2_avr32

I find it more clear to use:
       depends on !BR2_avr32  # libevas


Best regards,
Thomas
