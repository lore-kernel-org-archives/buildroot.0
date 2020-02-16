From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Feb 2020 22:03:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5charts: fix install with
 per-package
In-Reply-To: <20200216212356.43072c64@gmx.net>
References: <20200216194230.1413696-1-fontaine.fabrice@gmail.com>
 <20200216212356.43072c64@gmx.net>
Message-ID: <CAPi7W80D9eZJDs-0N+5SA1Z5PGJB-1hvn6h1Dz=aWW=SfSGKMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le dim. 16 f?vr. 2020 ? 21:24, Peter Seiderer <ps.report@gmx.net> a ?crit :
>
> Hello Fabrice,
>
> On Sun, 16 Feb 2020 20:42:30 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > With per-package configuration, qt5charts fails to install libraries:
> > cp -dpf /home/buildroot/autobuild/instance-1/output-1/per-package/qt5charts/host/arc-buildroot-linux-gnu/sysroot/usr/lib/libQt5Charts*.so.* /home/buildroot/autobuild/instance-1/output-1/per-package/qt5charts/target/usr/lib
> > cp: cannot stat '/home/buildroot/autobuild/instance-1/output-1/per-package/qt5charts/host/arc-buildroot-linux-gnu/sysroot/usr/lib/libQt5Charts*.so.*': No such file or directory
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/4bc62fbe67bec9b5d8c6d4bb28a4987ac67308bb
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/qt5/qt5charts/qt5charts.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
> > index e359747503..14c54e81bf 100644
> > --- a/package/qt5/qt5charts/qt5charts.mk
> > +++ b/package/qt5/qt5charts/qt5charts.mk
> > @@ -38,7 +38,7 @@ endef
> >
> >  ifeq ($(BR2_STATIC_LIBS),)
> >  define QT5CHARTS_INSTALL_TARGET_LIBS
> > -     cp -dpf $(STAGING_DIR)/usr/lib/libQt5Charts*.so.* $(TARGET_DIR)/usr/lib
> > +     cp -dpf $(STAGING_DIR)/usr/lib/libQt5Charts.so.* $(TARGET_DIR)/usr/lib
>
> No doubt in the case of qt5charts the first '*' is redundant, but are you sure this
> fixes it for the per-package case?
>
> The autobuild log states:
>
>   install -m 755 -p ../../lib/libQt5Charts.so.2.1.3 /home/buildroot/autobuild/instance-1/output-1/per-package/qt5base/host/arc-buildroot-linux-gnu/sysroot/usr/lib/libQt5Charts.so.2.1.3
>
> The original 'libQt5Charts.so.2.1.3' file is installed into the qt5base per-package directory instead
> of the qt5charts per-package directory one...
Indeed, you're right, I thought my patch was fixing the issue but it
was not. The issue was fixed by running make qt5charts-dirclean and
make qt5charts a second time ...
It should be noted that the same kind of build failure are raised on
qt5svg, qt5webengine, qt5xmlpatterns and qt5scripts.
There is patch in patchwork from March 2019 that could fix this issue
but it is set as superseded:
https://patchwork.ozlabs.org/patch/1056425/.
>
> Regards,
> Peter
>
>
> >       cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
> >  endef
> >  endif
>
Best Regards,

Fabrice
