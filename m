From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 Jun 2020 10:01:59 +0200
Subject: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-good:
 Optionally select GUDEV
In-Reply-To: <cecdfdbdb777ecdda021d6891da01e9be2f5df44.camel@collabora.com>
References: <20200531135327.12234-1-ezequiel@collabora.com>
 <20200531204902.GF8737@scaer>
 <cecdfdbdb777ecdda021d6891da01e9be2f5df44.camel@collabora.com>
Message-ID: <20200601080159.GG8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ezequiel, Nicolas, All,

On 2020-05-31 21:05 -0300, Ezequiel Garcia spake thusly:
> On Sun, 2020-05-31 at 22:49 +0200, Yann E. MORIN wrote:
> > On 2020-05-31 10:53 -0300, Ezequiel Garcia spake thusly:
> > > From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
[--SNIP--]
> > > +	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
> > The title is a bit misleading: gudev is not optional; instead, it is
> > forcibly selected when udev is enabled.
> 
> How about "package/gstreamer1/gst1-plugins-good: Select GUDEV if available"

As I see it, gudev is optional, and brings the whole libglib2 stack
behind it. Do we really need to forcibly select it?

I mean: can't we just keep the part in the .mk, to guarantee the build
ordre when libgudev is enabled?

> > > +ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> > > +GST1_PLUGINS_GOOD_DEPENDENCIES += libgudev

I.e. we just keep that part.

> > I think we would also need to add:
> >     GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-gudev=enabled
> > and the converse when ghudev is not enabled:
> >     GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-gudev=disabled
> You made me dig on this a bit closer :-)

That was my intention. ;-)

> v4l2-gudev is a meson feature, auto-detected by default,
> so the above is not required to enable it on the build.
> 
> The same applies to v4l2-libv4l2, so it seems to me
> enabling/disabling is not needed.

We want explcit enableing/disabling of optional features when there is
an option for that: this ensures that the buildsystem of the package
does not accidentally picks up the headers or libs from the host by
chance (e.g. a build on an x86 host for an x86 target).

By the look of it, that val2-gudev option is exactly about controlling
use of gudev:

    option('v4l2-gudev', type : 'feature', value : 'auto',
            description : 'Use libgudev for probing v4l2 devices')

So, is this correct, that this option controls use of gudev?

> If the library is present, the only thing needed is 
> the xxx_DEPENDENCIES change, to enforce a build order.
> 
> The story is different for the v4l2 option. It's also
> an auto-detected feature, but we are interested
> in controlling its enable/disable state.

Regards,
Yann E. MORIN.

> > Regards,
> > Yann E. MORIN.
> > 
> > > +endif
> > > +
> > >  ifeq ($(BR2_PACKAGE_LIBV4L),y)
> > >  GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-libv4l2=enabled
> > >  GST1_PLUGINS_GOOD_DEPENDENCIES += libv4l
> > > -- 
> > > 2.26.0.rc2
> > > 
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
