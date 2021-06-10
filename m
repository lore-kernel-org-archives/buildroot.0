From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 Jun 2021 07:34:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsoup: always disable
 tls_check
In-Reply-To: <20210610063627.GD135851@momiji>
References: <20210609212503.1580411-1-fontaine.fabrice@gmail.com>
 <20210610063627.GD135851@momiji>
Message-ID: <CAPi7W82QYMwJGjfKJ0c-gqw8gvPLBEBUpEwMrD4FX4OVHEvNuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le jeu. 10 juin 2021 ? 05:36, Adrian Perez de Castro
<aperez@igalia.com> a ?crit :
>
> Hi,
>
> On Wed, 09 Jun 2021 23:25:03 +0200 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > Always disable tls_check to avoid the following build failure since bump to
> > version 2.72.0 in commit 8e5f7f1cfc8fd7a9d5270f6a9707eb9eecfd21da:
> >
> > ../output-1/build/libsoup-2.72.0/meson.build:184:4: ERROR: Can not run test applications in this cross environment.
> >
> > tls_check will run code since
> > https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c45253243a2deca4880d4f614f2932373445cf9
>
> I wonder how this check passed locally when doing test builds of the update
> before submitting the patch (I did a few cross-builds targeting 64-bit ARM)
> ?\_(?)_/?
I assume that BR2_PACKAGE_LIBSOUP_SSL was not set in your tests.
However, I'm now wondering if we should also drop BR2_PACKAGE_LIBSOUP_SSL.
From my understanding, glib-networking is a runtime dependency that
was only needed at compile-time to pass tls_check.
>
> At any rate, it's good to disable the test unconditionally.
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/9e539dc7185cfb81f18438dd36357cb49ef23a5a
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
>
> > ---
> >  package/libsoup/libsoup.mk | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
> > index 2f63e9e85c..73c8c080c5 100644
> > --- a/package/libsoup/libsoup.mk
> > +++ b/package/libsoup/libsoup.mk
> > @@ -30,6 +30,7 @@ LIBSOUP_CONF_OPTS = \
> >       -Dntlm=disabled \
> >       -Dsysprof=disabled \
> >       -Dtests=false \
> > +     -Dtls_check=false \
> >       -Dvapi=disabled
> >
> >  ifeq ($(BR2_PACKAGE_BROTLI),y)
> > @@ -54,8 +55,6 @@ endif
> >
> >  ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
> >  LIBSOUP_DEPENDENCIES += glib-networking
> > -else
> > -LIBSOUP_CONF_OPTS += -Dtls_check=false
> >  endif
> >
> >  $(eval $(meson-package))
> > --
> > 2.30.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
Best Regards,

Fabrice
