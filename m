From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Jul 2018 23:04:59 +0200
Subject: [Buildroot] [PATCH 1/1] boost: correctly disable icu in locale
 if needed
In-Reply-To: <20180714224100.2bc87253@windsurf>
References: <20180713174247.4005-1-fontaine.fabrice@gmail.com>
 <20180714224100.2bc87253@windsurf>
Message-ID: <CAPi7W83kqXy00ntbKnMWjXDLNDfNOFWY+kXXsx+QTh-0JKT+gA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-07-14 22:41 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello Fabrice,
>
> On Fri, 13 Jul 2018 19:42:47 +0200, Fabrice Fontaine wrote:
> > boost doesn't take into account --without-icu flag and links
> > libboost_locale with icu if it founds it in staging directory
> >
> > So use boost.locale.icu to fix this issue
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/boost/boost.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> > index b2605a70b7..242b60a460 100644
> > --- a/package/boost/boost.mk
> > +++ b/package/boost/boost.mk
> > @@ -116,6 +116,12 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> >  BOOST_OPTS += boost.locale.posix=off
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_ICU),y)
> > +BOOST_OPTS += boost.locale.icu=on
> > +else
> > +BOOST_OPTS += boost.locale.icu=off
> > +endif
>
> I'm not sure to fully understand what's going on here.
>
> First, if --without-icu has no effect, why isn't your patch removing
> it ?
>
I don't fully understand yet what --without-icu does in the other boost
libraries so I didn't want to remove it.
From my current understanding, icu should also (at least) be used by regex.

>
> Second, why are you introducing another BR2_PACKAGE_ICU conditional,
> even if there's already one ?
>
Because there was already a BR2_PACKAGE_BOOST_LOCALE conditional and it
seems strange to set boost.locale.icu if locale is not enabled. But I can
move it if you think it's better.

>
> Third, what is the problem with libboost_locale linking with icu if
> found in the staging directory ?
>
Because, if it links with icu, boost will also build chrono and thread. To
avoid always selecting these two libraries, I sent a patch to select them
only if BR2_PACKAGE_ICU is set (see http://patchwork.ozlabs.org/patch/943753).
My patch won't always work if boost links with icu when BR2_PACKAGE_ICU is
not set (for example if the user changes his configuration between two
builds). Perhaps, I should sent a patch serie with these two patches to
better reflect the dependencies between them?

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180714/1f579ddb/attachment.html>
