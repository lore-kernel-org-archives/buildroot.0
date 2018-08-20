From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Aug 2018 23:33:14 +0200
Subject: [Buildroot] [PATCH 2/2] boost: context needs C++11
In-Reply-To: <20180820225058.4d83d48f@windsurf>
References: <20180820165555.20492-1-fontaine.fabrice@gmail.com>
 <20180820165555.20492-2-fontaine.fabrice@gmail.com>
 <20180820225058.4d83d48f@windsurf>
Message-ID: <CAPi7W81tk-yBnm0NzyxZRM_A2kkO_kR7yqZz-VaKP536=F5kuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le lun. 20 ao?t 2018 ? 22:51, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello,
>
> On Mon, 20 Aug 2018 18:55:55 +0200, Fabrice Fontaine wrote:
> > Without this flag, mutex is not always correctly detected with gcc 4.x
> > or 5.x. As a result, boost_thread is wrongly selected by boost_context.
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.net/results/fb046c04fe18bec973d120e4ab33971f32ba5769
> >  -
> http://autobuild.buildroot.net/results/99f1a255b78a973faeb8bf3b94d78efc54426a8b
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/boost/boost.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> > index 14f6162003..a09dd3cf45 100644
> > --- a/package/boost/boost.mk
> > +++ b/package/boost/boost.mk
> > @@ -61,6 +61,11 @@ else
> >  BOOST_FLAGS += --without-icu
> >  endif
> >
> > +# boost-context needs C++11
> > +ifeq ($(BR2_PACKAGE_BOOST_CONTEXT),y)
> > +BOOST_TARGET_CXXFLAGS += -std=c++11
> > +endif
>
> I was about to apply, but... C++11 requires at least gcc 4.8 or 4.9
>
That's not right, C++11 requires at least gcc 4.7 (see libcec, jsoncpp,
poppler, yaml-cpp, ...)

> depending on the features being used, and I don't see any dependency on
> a gcc version in the definition of BR2_PACKAGE_BOOST_CONTEXT.

But you're right, we should update first patch to select
BR2_PACKAGE_BOOST_THREAD if gcc version is lower than 4.7 (and not 4.8). I
will send a v2.

> There are
> also other Boost options that say they are related to C++11.
>
I did not check if we should add -std=c++11 for those other boost options.
At least, it does not cause any build failures but perhaps some features
are wrongly disabled with some older versions of gcc.

>
> Don't we have a problem with gcc 4.7 or older compilers ?
>
std=c++11 works with gcc 4.7, I did not take time to test with older
versions.

>
>
> https://git.buildroot.org/buildroot/tree/support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config
> has a 4.7 compiler.
>
>  I'm not sure we have a gcc 4.6 compiler. Perhaps we should add that to

> the autobuilders.
>
Yes, it's a good idea.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180820/69f4d010/attachment.html>
