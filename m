From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2020 23:50:31 -0600
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.6
In-Reply-To: <20200827234830.534955b4@windsurf.home>
References: <20200706010444.537633-1-james.hilliard1@gmail.com>
 <20200827234830.534955b4@windsurf.home>
Message-ID: <CADvTj4oiaTvOJOF9HVmmfPieG_+LAQ3z2R_K+vtP_wiPtAjwEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 27, 2020 at 3:48 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun,  5 Jul 2020 19:04:44 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Add pipewire optional dependencies/configurations.
> >
> > Remove BR2_PACKAGE_PIPEWIRE_GSTREAMER config option and enable
> > automatically based on dependencies to avoid recursive dependency
> > error caused by the gobject-introspection python3 dependency.
>
> Could you give more details about this recursive dependency ?
>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  Config.in.legacy               |  10 +++
> >  package/pipewire/Config.in     |  27 +-------
> >  package/pipewire/pipewire.hash |   6 +-
> >  package/pipewire/pipewire.mk   | 114 +++++++++++++++++++++++++++------
> >  4 files changed, 110 insertions(+), 47 deletions(-)
> >
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index 7a5435188b..4541acc979 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -146,6 +146,16 @@ endif
> >
> >  comment "Legacy options removed in 2020.08"
> >
> > +config BR2_PACKAGE_PIPEWIRE_GSTREAMER
> > +     bool "pipewire gstreamer option removed"
> > +     select BR2_LEGACY
> > +     select BR2_PACKAGE_GOBJECT_INTROSPECTION
> > +     select BR2_PACKAGE_GSTREAMER1
> > +     select BR2_PACKAGE_GST1_PLUGINS_BASE
>
> But isn't that going to cause that circular dependency you're trying to
> prevent, since you're selecting BR2_PACKAGE_GOBJECT_INTROSPECTION here ?
Looks to be related to a conflict involving these:
https://github.com/buildroot/buildroot/blob/master/package/python-gobject/Config.in
https://github.com/buildroot/buildroot/blob/master/package/gstreamer1/gst1-python/Config.in
>
> Or maybe what you're talking about is not a Kconfig recursive
> dependency, but a makefile circular dependency ? But in the later case,
> I'm not sure how dropping the Config.in option helps.
>
> Could you clarify ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
