From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 8 Oct 2014 23:37:09 +0200
Subject: [Buildroot] [PATCH 4/7 v2] package/freerdp: add options to
 enable/disable server and/or client
In-Reply-To: <c3e7653516c234689d95b3a3b74cd06b6e7ef664.1412634775.git.yann.morin.1998@free.fr>
References: <cover.1412634775.git.yann.morin.1998@free.fr>
 <c3e7653516c234689d95b3a3b74cd06b6e7ef664.1412634775.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMLvyDpaxgwQ=USd4r-ULY5YYNWYGUod0wxbaQwuub0R+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Oct 7, 2014 at 12:35 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Building the client or the server requires an X.Org stack.
>
> Since freerdp can also be used for weston (wayland-based, hence no X.Org
> stack), we may want to disable the client and server.
>
> Conversely, with on an X.Org stack, we may want to enable either or
> none if we're just interested in the library.
>
> Add two options, one to enable the server, the other the client; both
> default to 'y' so that a previous .config can be re-used as-is, and
> echibit the same behaviour, that is to build the server and client.

s/echibit/exhibit/

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/freerdp/Config.in  | 20 ++++++++++++++++++--
>  package/freerdp/freerdp.mk | 15 +++++++++++++++
>  2 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
> index 23d0b0f..8e29a5b 100644
> --- a/package/freerdp/Config.in
> +++ b/package/freerdp/Config.in
> @@ -6,17 +6,33 @@ config BR2_PACKAGE_FREERDP
>           FreeRDP is a free implementation of the Remote Desktop
>           Protocol (RDP), released under the Apache license
>
> +         This only installs the freerdp library.
> +
>           http://www.freerdp.com/
>
>  if BR2_PACKAGE_FREERDP
>
>  config BR2_PACKAGE_FREERDP_NEEDS_XLIBS
> -       def_bool y
> -       depends on BR2_PACKAGE_XORG7
> +       bool
>         select BR2_PACKAGE_XLIB_LIBX11
>         select BR2_PACKAGE_XLIB_LIBXT
>         select BR2_PACKAGE_XLIB_LIBXEXT
>         select BR2_PACKAGE_XLIB_LIBXCURSOR
>         select BR2_PACKAGE_XLIB_LIBXDAMAGE
>
> +config BR2_PACKAGE_FREERDP_SERVER
> +       bool "build server"
> +       default y
> +       depends on BR2_PACKAGE_XORG7
> +       select BR2_PACKAGE_FREERDP_NEEDS_XLIBS
> +
> +config BR2_PACKAGE_FREERDP_CLIENT
> +       bool "build client"
> +       default y
> +       depends on BR2_PACKAGE_XORG7
> +       select BR2_PACKAGE_FREERDP_NEEDS_XLIBS
> +
> +comment "freerdp server and client needs X.Org"
> +       depends on !BR2_PACKAGE_XORG7
> +
>  endif
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index b50fd1e..594bab3 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -20,6 +20,21 @@ else
>  FREERDP_CONF_OPTS += -DWITH_X11=OFF
>  endif
>
> +# We need to tell CMake to only create position-independent code,
> +# othwerwise the server does not build.

Hmm... here you could be a bit more talkative in the comment ;-), e.g. adding:

libfoo.a is used to build libbar.so, so even if we are building a
static library (libfoo), it has to be built with PIC.


> +ifeq ($(BR2_PACKAGE_FREERDP_SERVER),y)
> +FREERDP_CONF_OPTS += -DWITH_SERVER=ON -DWITH_SERVER_INTERFACE=ON \
> +       -DCMAKE_POSITION_INDEPENDENT_CODE=ON

CMAKE_POSITION_INDEPENDENT_CODE is global option. It is possible to
set it locally using set_target_properties or set_property. But this
requires patching the CMake; this should looks like this: [1] (not
tested at all ;-]).

> +else
> +FREERDP_CONF_OPTS += -DWITH_SERVER=OFF -DWITH_SERVER_INTERFACE=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FREERDP_CLIENT),y)
> +FREERDP_CONF_OPTS += -DWITH_CLIENT=ON -DWITH_CLIENT_INTERFACE=ON
> +else
> +FREERDP_CONF_OPTS += -DWITH_CLIENT=OFF -DWITH_CLIENT_INTERFACE=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_CUPS),y)
>  FREERDP_CONF_OPTS += -DWITH_CUPS=ON
>  FREERDP_DEPENDENCIES += cups
> --
> 1.9.1
>

Regards,


[1] http://code.bulix.org/oixnjp-87161/?raw


-- 
Samuel
