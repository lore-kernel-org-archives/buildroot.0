From: =?utf-8?B?VGhvbWFzIExvcmJsYW5jaMOocw==?= <zlika_ese@hotmail.com>
Date: Wed, 25 Sep 2019 20:17:18 +0000
Subject: [Buildroot] =?utf-8?q?Re=C2=A0=3A__=5BPATCH_1/1=5D_package/librs?=
 =?utf-8?q?vg=3A_optionally_build_the_SVG_GDK_pixbuf_plugin?=
References: <20190925194516.GF7274@scaer>
Message-ID: <AM6PR06MB469039BDFF6E29273E3F9E6196870@AM6PR06MB4690.eurprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your remarks Yann.
I didn't notice that librsvg selects gdk-pixbuf, so I have to rework this patch (I'm a newbie here, sorry for my mistakes). I'll try to understand why librsvg selects gdk-pixbuf, because it is strange to do so if the pixbuf plugin is not even built (I think this dependency should have been dropped in 7372c80cc). Another way would be to add an explicit option to enable the build of the pixbuf plugin.
According to 7372c80cc (package/librsvg: disable gdk-pixbuf-loader) the build is broken when host<>target arch, but I only tested it on host=target=x86_64, so I didn't notice the problem).

Regards
Thomas


-------- Message original --------
Objet : Re: [Buildroot] [PATCH 1/1] package/librsvg: optionally build the SVG GDK pixbuf plugin
De : "Yann E. MORIN"
? : Thomas Lorblanch?s
Cc : buildroot at buildroot.org," fontaine.fabrice at gmail.com"


Thomas, All,

On 2019-09-25 19:27 +0000, Thomas Lorblanch?s spake thusly:
> Enable generation of libpixbufloader-svg.so if gdk-pixbuf is enabled

Thank you for following up with this patch after our IRC discussion. :-)

> Signed-off-by: Thomas Lorblanch?s
> ---
> package/librsvg/librsvg.mk | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
> index 4f563ce6db..746b339bdd 100644
> --- a/package/librsvg/librsvg.mk
> +++ b/package/librsvg/librsvg.mk
> @@ -9,7 +9,10 @@ LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).20
> LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
> LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
> LIBRSVG_INSTALL_STAGING = YES
> -LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools --enable-introspection=no
> +LIBRSVG_CONF_OPTS = --disable-tools --enable-introspection=no
> +ifneq ($(BR2_PACKAGE_GDK_PIXBUF),y)
> +LIBRSVG_CONF_OPTS += --disable-pixbuf-loader
> +endif

Usually, we prefer positive logic (when possible), and we also prefer
that the disabling and enabling both be explicit. Also, you have to
ensure the build order with a proper:

ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
LIBRSVG_DEPENDENCIES += gdk-pixbuf
LIBRSVG_CONF_OPTS += --enable-pixbuf-loader
else
LIBRSVG_CONF_OPTS += --disable-pixbuf-loader
endif

However, in this case, gdk-pixbuf is always enabled when librsvg is,
because librsvg select gdb-pixbuf:

https://git.buildroot.org/buildroot/tree/package/librsvg/Config.in#n11

So your change means that gdk-pixbuf-loader can never be disabled.

Furthermore, it seems gdk-pixbuf-loader was explicitly disabled in
7372c80cc (package/librsvg: disable gdk-pixbuf-loader) because it failed
to build. Can you confirm this is now fixed?

> HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
> LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \

Note that you would have to remove gdk-pixbuf from that line, if it is
only needed for gdk-pixbuf-loader.

Regards,
Yann E. MORIN.

> $(if $(BR2_PACKAGE_LIBGTK3),libgtk3)
> --
> 2.11.0
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

--
.-----------------.--------------------.------------------.--------------------.
| Yann E. MORIN | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software Designer | \ / CAMPAIGN | ___ |
| +33 561 099 427 `------------.-------: X AGAINST | \e/ There is no |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL | v conspiracy. |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190925/578836e3/attachment.html>
