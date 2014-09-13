From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 09:23:13 +0200
Subject: [Buildroot] [PATCH 11/12] directfb: allow SVG support
In-Reply-To: <1410537011-29662-12-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Fri, 12 Sep 2014 17:50:10 +0200")
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-12-git-send-email-jezz@sysmic.org>
Message-ID: <87sijw9e72.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > DirectFB SVG support rely on Cairo and Cairo depends on DirectFB.
 > Since Cairo DirectFB backend is marked as experimental, this patch choose to
 > disable this backend when DirectFB SVG support is enable.

 > In add, this patch may solve some tricky situations between DirectFB and Cairo
 > (see http://sysmic.org/~jezz/results/c2f11fc0) and improve build reproducibility.

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 > ---
 >  package/cairo/cairo.mk       | 5 ++++-
 >  package/directfb/Config.in   | 5 +++++
 >  package/directfb/directfb.mk | 7 +++++++
 >  3 files changed, 16 insertions(+), 1 deletion(-)

 > diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
 > index a4c71b6..bcc0c26 100644
 > --- a/package/cairo/cairo.mk
 > +++ b/package/cairo/cairo.mk
 > @@ -48,7 +48,10 @@ CAIRO_CONF_OPT = \
 
 >  CAIRO_DEPENDENCIES = host-pkgconf fontconfig pixman
 
 > -ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 > +# DirectFB svg support rely on Cairo and Cairo DirectFB support depends on
 > +# DirectFB. Break circular dependency by disabling DirectFB support in Cairo
 > +# (which is experimental)
 > +ifeq ($(BR2_PACKAGE_DIRECTFB)x$(BR2_PACKAGE_DIRECTFB_SVG),yx)
 >  	CAIRO_CONF_OPT += --enable-directfb
 >  	CAIRO_DEPENDENCIES += directfb
 >  else
 > diff --git a/package/directfb/Config.in b/package/directfb/Config.in
 > index e3c93a1..dc01228 100644
 > --- a/package/directfb/Config.in
 > +++ b/package/directfb/Config.in
 > @@ -125,6 +125,11 @@ config BR2_PACKAGE_DIRECTFB_PNG
 >  	default y
 >  	select BR2_PACKAGE_LIBPNG
 
 > +config BR2_PACKAGE_DIRECTFB_SVG
 > +	bool "enable SVG support"
 > +	default y
 > +	select BR2_PACKAGE_CAIRO

cairo depends on BR2_ARCH_HAS_ATOMICS, so this should also do so.

I suspect this also needs the SVG backend of cairo. From config.log:

configure:19926: checking for libsvg-cairo >= 0.1.6
configure:19936: result: not found
configure:19939: WARNING:
*** SVG-Cairo at least 0.1.6 not found -- SVG image provider will not be built.

So it actually needs libsvg-cairo (which pulls in cairo and the svg
backend of cairo).

It also needs some help to find the cairo includes:

make[5]: Entering directory '/home/peko/source/buildroot/output/build/directfb-1.6.3/interfaces/IDirectFBImageProvider'
  CC       idirectfbimageprovider_dfiff.lo
  CC       idirectfbimageprovider_bmp.lo
  CC       idirectfbimageprovider_pnm.lo
  CC       idirectfbimageprovider_svg.lo
  CC       idirectfbimageprovider_mpeg2.lo
idirectfbimageprovider_svg.c:46:19: fatal error: cairo.h: No such file or directory
compilation terminated.
Makefile:817: recipe for target 'idirectfbimageprovider_svg.lo' failed
make[5]: *** [idirectfbimageprovider_svg.lo] Error 1
make[5]: *** Waiting for unfinished jobs....

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
