From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Nov 2017 19:07:37 +0200
Subject: [Buildroot] [PATCH 1/1] qt5cinex: depends also on
 qt5quickcontrols
In-Reply-To: <32a0057b-1840-ef45-c199-9da6b14ae09c@micronovasrl.com>
References: <1510677027-24076-1-git-send-email-giulio.benetti@micronovasrl.com>
 <e8c172b8-f2ec-ced1-dda8-236d0d945b12@micronovasrl.com>
 <20171114165808.akqens5j5obw2n5c@tarshish>
 <32a0057b-1840-ef45-c199-9da6b14ae09c@micronovasrl.com>
Message-ID: <20171114170737.lo3cqwk23bg64ojb@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Giulio,

On Tue, Nov 14, 2017 at 06:03:53PM +0100, Giulio Benetti wrote:
> Sorry, my mistake.
> It installed correctly on STAGING_DIR, but not in TARGET_DIR.
> This why it compiled fine, but on target it didn't find that libQtQuick.so
> library.
> This is a problem on building Qt5 I've noticed.
> 
> If I build first time Qt5 with few features,
> than select other more features,
> those can be built partially and installed partially too.
> 
> To reproduce you can build qt5base.
> After that, select qt5cinex,
> then you should find that libraries are in STAGING_DIR but not in
> TARGET_DIR.
> 
> So to have it working properly you have to rm and rebuild qt5base and
> qt5declarative from beginning.
> 
> Did someone else noticed this?

Buildroot can't reliably rebuild reverse dependencies of packages that change 
configuration. This is a known issue. See the manual section:

  http://nightly.buildroot.org/manual.html#full-rebuild

baruch

> Il 14/11/2017 17:58, Baruch Siach ha scritto:
> > On Tue, Nov 14, 2017 at 05:32:26PM +0100, Giulio Benetti wrote:
> > > Errata:
> > > 
> > > Il 14/11/2017 17:30, Giulio Benetti ha scritto:
> > > > qt5cinex failed to build if qt5quickcontrols is not selected
> > > qt5cinex fail to execute on runtime if qt5quickcontrols is not selected
> > 
> > If it's a runtime only dependency you should not list it in _DEPENDENCIES ...
> > 
> > > > add qt5quickcontrols to qt5cinex dependencies in .mk
> > > > select BR2_PACKAGE_QT5QUICKCONTROLS in Config.in
> > > > 
> > > > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> > > > ---
> > > >    package/qt5cinex/Config.in   | 1 +
> > > >    package/qt5cinex/qt5cinex.mk | 2 +-
> > > >    2 files changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/package/qt5cinex/Config.in b/package/qt5cinex/Config.in
> > > > index 5adf6c3..7cc459a 100644
> > > > --- a/package/qt5cinex/Config.in
> > > > +++ b/package/qt5cinex/Config.in
> > > > @@ -16,6 +16,7 @@ config BR2_PACKAGE_QT5CINEX
> > > >    	select BR2_PACKAGE_QT5BASE_WIDGETS
> > > >    	select BR2_PACKAGE_QT5BASE_EGLFS
> > > >    	select BR2_PACKAGE_QT5GRAPHICALEFFECTS
> > > > +	select BR2_PACKAGE_QT5QUICKCONTROLS
> > 
> > ... but you should add a 'runtime' comment here.
> > 
> > > >    	help
> > > >    	  This application demonstrates the power of Qt5 and few of the new
> > > >    	  additions available in QtQuick 2.0.
> > > > diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
> > > > index d9254f5..44c53a1 100644
> > > > --- a/package/qt5cinex/qt5cinex.mk
> > > > +++ b/package/qt5cinex/qt5cinex.mk
> > > > @@ -12,7 +12,7 @@ QT5CINEX_HD = "rpi_"
> > > >    endif
> > > >    QT5CINEX_SOURCE = Qt5_CinematicExperience_$(QT5CINEX_HD)$(QT5CINEX_VERSION).tgz
> > > > -QT5CINEX_DEPENDENCIES = qt5base qt5declarative
> > > > +QT5CINEX_DEPENDENCIES = qt5base qt5declarative qt5quickcontrols
> > > >    QT5CINEX_LICENSE = CC-BY-3.0
> > > >    QT5CINEX_LICENSE_FILES = README
> > 
> > baruch
> > 
> 
> 
> -- 
> Giulio Benetti
> R&D Manager &
> Advanced Research
> 
> MICRONOVA SRL
> Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
> Tel. 049/8931563 - Fax 049/8931346
> Cod.Fiscale - P.IVA 02663420285
> Capitale Sociale ? 26.000 i.v.
> Iscritta al Reg. Imprese di Padova N. 02663420285
> Numero R.E.A. 258642

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
