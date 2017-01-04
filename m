From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Jan 2017 18:12:21 +0100
Subject: [Buildroot] [PATCH 01/52] package/libpjsip: disable remaining
 unspecified options
In-Reply-To: <49597bc7-6562-a833-2bdb-b54f0b4cb3a9@lucaceresoli.net>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
 <4931634ed45a432739c9fd9481c6c4bfcc2fd747.1483093662.git.yann.morin.1998@free.fr>
 <49597bc7-6562-a833-2bdb-b54f0b4cb3a9@lucaceresoli.net>
Message-ID: <20170104171221.GA3177@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2017-01-04 14:16 +0100, Luca Ceresoli spake thusly:
> On 30/12/2016 11:29, Yann E. MORIN wrote:
> > There are a bunch of options that are left unspecified; explicitly
> > disable them.
> >
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> >  package/libpjsip/libpjsip.mk | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> > index cb0d866..7d30bbb 100644
> > --- a/package/libpjsip/libpjsip.mk
> > +++ b/package/libpjsip/libpjsip.mk
> > @@ -36,6 +36,23 @@ LIBPJSIP_CONF_OPTS = \
> >  	--disable-ilbc-codec \
> >  	--disable-webrtc \
> >  	--disable-opus \
> > +	--disable-epoll \
> 
> Hey, there's a bug in the libpjsip configure script here!

Dang...

> Without --disable-epoll it says:
> 
>   checking ioqueue backend... select()
> 
> With your patch applied (i.e. passing --disable-epoll) it says:
> 
>   checking ioqueue backend... /dev/epoll
> 
> Indeed the aconfigure.ac file is wrong:
> 
> > AC_ARG_ENABLE(epoll,
> >               AS_HELP_STRING([--enable-epoll],
> >                              [Use /dev/epoll ioqueue on Linux
> (experimental)]),
> >               [
> > 		ac_os_objs=ioqueue_epoll.o
> > 		AC_MSG_RESULT([/dev/epoll])
> >                 AC_DEFINE(PJ_HAS_LINUX_EPOLL,1)
> > 		ac_linux_poll=epoll
> >               ],
> > 	      [
> >                	ac_os_objs=ioqueue_select.o
> >                 AC_MSG_RESULT([select()])
> > 		ac_linux_poll=select
> >     	      ])
> 
> The third parameter to AC_ARG_ENABLE is the action-if-present, which is
> called if either --enable-epoll or --disable-epoll is called. It should
> then read ${enableval}, not enable epoll unconditionally. The result is
> that --disable-epoll enabled epoll! :-)

But do we care what the default is? In retrospect, I think that using
epoll() is better than using select(), so I'd say we want to enable it.

I came with those --disable flags by looking at configure --help and
adding all the missing parts, and it seems I did not really thought it
through...

I'll look more carefully at what we should do to enable epoll(). But in
the end, I don't really care what we choose; I just want that it is
ecplicit and not implicit.

> Note the very next AC_ARG_ENABLE() call (for --enable-shared) is correct.
> 
> > +	--disable-oss \
> > +	--disable-ext-sound \
> > +	--disable-small-filter \
> > +	--disable-large-filter \
> > +	--disable-g711-codec \
> > +	--disable-l16-codec \
> > +	--disable-g722-codec \
> > +	--disable-libsamplerate \
> > +	--disable-sdl \
> > +	--disable-ffmpeg \
> > +	--disable-v4l2 \
> > +	--disable-openh264 \
> > +	--disable-libyuv \
> > +	--disable-ipp \
> > +	--disable-ssl \
> > +	--disable-silk \
> 
> I thought these were all already disabled by default

Well, SSL support uses opensl, so if that happens to be built before, it
will be implicitly enabled, which is not correct. Ditto libsamplerate,
or SDL, or v4l2...

> or disabled by some
> higher-level flag (e.g. --disable-sound). But clearly I missed
> something, because with your patch we get a few smaller files:
> 
>   32272 ->   9789 pjmedia/lib/libpjmedia-codec.so.2
>  345892 -> 341510 pjmedia/lib/libpjmedia.so.2
> 
> So, I'll be OK with this patch if you at least remove the
> --disable-epoll line, or after the above bug is fixed.

Yup, will do. Thanks for noticing the epoll() breakage.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
