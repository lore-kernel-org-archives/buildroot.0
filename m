From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 11 Mar 2018 11:13:51 +0200
Subject: [Buildroot] [PATCH 1/1] mpd: add support for libupnp18
In-Reply-To: <CAPi7W82xkhPt-QUimyskbwS4XTqNBZzcaKzTr_Mg1fyWQ1jncQ@mail.gmail.com>
References: <20180310224056.3860-1-fontaine.fabrice@gmail.com>
 <20180311045752.ns6kotqmnwsf653w@sapphire.tkos.co.il>
 <CAPi7W82xkhPt-QUimyskbwS4XTqNBZzcaKzTr_Mg1fyWQ1jncQ@mail.gmail.com>
Message-ID: <20180311091351.ryro3co5ogc4otsa@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Sun, Mar 11, 2018 at 10:04:14AM +0100, Fabrice Fontaine wrote:
> 2018-03-11 5:57 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
> > On Sat, Mar 10, 2018 at 11:40:56PM +0100, Fabrice Fontaine wrote:
> > > Instead of selecting BR2_PACKAGE_LIBUPNP, makes UPnP option depending on
> > > BR2_PACKAGE_LIBUPNP or BR2_PACKAGE_LIBUPNP18 and let the user choose his
> > > preferred libupnp version
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >  package/mpd/Config.in | 5 ++++-
> > >  package/mpd/mpd.mk    | 4 +++-
> > >  2 files changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> > > index 5991b6f4bb..eee25c4c07 100644
> > > --- a/package/mpd/Config.in
> > > +++ b/package/mpd/Config.in
> > > @@ -308,11 +308,14 @@ config BR2_PACKAGE_MPD_TCP
> > >
> > >  config BR2_PACKAGE_MPD_UPNP
> > >       bool "UPnP"
> > > +     depends on BR2_PACKAGE_LIBUPNP || BR2_PACKAGE_LIBUPNP18
> > >       select BR2_PACKAGE_EXPAT
> > > -     select BR2_PACKAGE_LIBUPNP
> >
> > Why not
> >
> >   select BR2_PACKAGE_LIBUPNP if !BR2_PACKAGE_LIBUPNP18
> >
> > ?
>
> Because this creates a recursive dependency. Indeed, BR2_PACKAGE_LIBUPNP18
> depends on !BR2_PACKAGE_LIBUPNP as both libraries can't be enabled at the
> same time.

So maybe

  select BR2_PACKAGE_LIBUPNP18 if !BR2_PACKAGE_LIBUPNP

Only BR2_PACKAGE_LIBUPNP18 depends on !BR2_PACKAGE_LIBUPNP, not the other way 
around. Using 'select' makes life easier for users for not so obvious 
dependencies.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
