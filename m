From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 10 Nov 2019 11:43:46 +0100
Subject: [Buildroot] [PATCH 01/15] new recipe : host-systemd
In-Reply-To: <20191109214922.GQ3419@scaer>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-2-jeremy.rosen@smile.fr>
 <20191109214922.GQ3419@scaer>
Message-ID: <CAFvCimWRt-D2MBX3d==8Tcd0uhEhoJLSf5Wca81mAe7bZn4Enw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 9 nov. 2019 ? 22:49, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> J?r?my, All,
>
> On 2019-11-03 17:56 +0100, J?r?my Rosen spake thusly:
> > Add the infrastructure to build the host version of systemd
> > * disable all optional features, they can be re-added when needed
> > * systemd has creative way of dealing with cross compile
> >   we build a "normal" host systemd, but install it in $HOST_DIR
> >   we use systemctl --root to correctly act on TARGET_DIR
> > * we need to adjust RPATH using patchelf because meson can't do it
> >   correctly by itsel
> >
> > Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> [--SNIP--]
> > diff --git a/package/systemd/Config.in.host
> b/package/systemd/Config.in.host
> > new file mode 100644
> > index 0000000000..09099752d2
> > --- /dev/null
> > +++ b/package/systemd/Config.in.host
> > @@ -0,0 +1,4 @@
> > +config BR2_PACKAGE_HOST_SYSTEMD
> > +     bool "host systemd tools"
> > +     help
> > +       Systemd command-line tools for the host
>
> I don;t think we (at the current point) need a user-visible option.
>
> This host-systemd is initially a way to get systemctl only, and this is
> just internal to how Buildroot will enable the units (by using systemctl
> preset-all or so).
>
> Later, if/when it becomes possible to build extra utilities for users to
> manually run (or in a post-build/image script), then we can expose a
> user-visible host-systemd option.
>
> But for now, it is not needed.
>

Ok, will do...

The host-tools are pretty usefull, but I don't see any use-cases where you
would want the host-side tool without systemd on the target anyway...


> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 94d5f703cd..1e4f706517 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -550,3 +550,95 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> >  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> >
> >  $(eval $(meson-package))
> > +
> > +
> > +
>
> Too many empty lines. Run 'make check-package'.
>
> done

> > +#
> > +# Host-systemd configuration
> > +#
> > +HOST_SYSTEMD_CONF_OPTS= \
> > +     -Dsplit-bin=true \
> > +     -Dsplit-usr=false \
> > +     -Dutmp=false \
> > +     -Dhibernate=false \
> > +     -Dldconfig=false \
> > +     -Dresolve=false \
> [--SNIP--]
> > +     -Dsysvinit-path='' \
> > +     --prefix=/usr \
> > +     --libdir=lib \
> > +     --sysconfdir=/etc \
> > +     --localstatedir=/var \
>
> This list will be difficult to maintain on each version bump... :-(
> Can't we push for upstream to implement a simple switch:
>
> --disable-all-that-is-not-explicitly-enabled-please-and-i-d-like-a-pony-too-pretty-please
>
> That's not the kind of stuff upstream would accept... we might have more
chance if we
provided a "make host-tools" target or something like that, but my
meson-knowledge is too
low to do that. so... not right now.

I have split the options in two blocks, the ones we tweak and the long list
of "=false" options,
that might help readability


> > +
> > +HOST_SYSTEMD_DEPENDENCIES = \
> > +    host-util-linux \
> > +    host-patchelf \
> > +    host-libcap \
> > +    host-gperf \
> > +
> > +# Fix RPATH After installation
> > +# * systemd provides a install_rpath instruction to meson because the
> binaries need to link with
> > +#   libsystemd which is not in a standard path
> > +# * meson can only replace the RPATH, not append to it
> > +# * the original rpatch is thus lost.
> > +# * the original path had been tweaked by buildroot vial LD_FLAGS to
> add $(HOST_DIR)/lib
> > +# * thus re-tweak rpath after the installation for all binaries that
> need it
> > +#buildroot detects incorrect RPATH, so adding new binaries should be
> safe (it won't compile
> > +#unless properly integrated).
> > +HOST_SYSTEMD_HOST_TOOLS = \
> > +    systemd-analyze  systemd-mount systemctl
>
> Once again, I think we should just keep systemctl for now: remove
> everything else. We just need systemctl for now.
>
>
This is already the minimal set... I can't reduce it more without patching
upstream
There are actually more binaries generated than those (we do build a PID1,
after all)
Those are the ones that need to be tweaked because of libsystemd. The
others are fine.

Again, an upstream patch to build on a tool per tool basis could be
usefull, but beyond the scope
of this patch

We can then *later* add those (esp. analyse).
>
> > +define HOST_SYSTEMD_FIX_RPATH
> > +     $(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
> > +             $(HOST_DIR)/bin/patchelf --set-rpath
> $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
>
> It is not possible to make an RPATH longer than it previously was. How
> can we ensure that the rpath that is set by meson will be big enough to
> later cary our own rpath?
>
> I just checked the source and patchelf does increase the side of the
section to fit the new
size.... so we are good

Cheers
J?r?my


> Regards,
> Yann E. MORIN.
>
> > +     )
> > +endef
> > +
> > +HOST_SYSTEMD_POST_INSTALL_HOOKS +=  HOST_SYSTEMD_FIX_RPATH
> > +HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> > +
> > +$(eval $(host-meson-package))
> > --
> > 2.24.0.rc1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191110/535641cb/attachment.html>
