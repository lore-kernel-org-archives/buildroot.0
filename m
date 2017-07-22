From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 22 Jul 2017 21:31:21 +0200
Subject: [Buildroot] [PATCH] package/qt5location: handle plugins being
 conditionally built
In-Reply-To: <130adce5-41c1-0c79-5c31-33f87bcc4055@microchip.com>
References: <1500593609-5610-1-git-send-email-joshua.henderson@microchip.com>
 <trinity-2e3bcfb2-19ec-4b5f-af7f-1c84a5d187d3-1500620201526@3capp-gmx-bs73>
 <130adce5-41c1-0c79-5c31-33f87bcc4055@microchip.com>
Message-ID: <20170722213121.42e5ccd9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joshua,

On Fri, 21 Jul 2017 13:44:56 -0700, Joshua Henderson <joshua.henderson@microchip.com> wrote:

> Peter, Thomas,
> 
> On 07/20/2017 11:56 PM, Peter Seiderer wrote:
> > Hello Joshua,
> > 
> >> Gesendet: Freitag, 21. Juli 2017 um 01:33 Uhr
> >> Von: "Joshua Henderson" <joshua.henderson@microchip.com>
> >> An: buildroot at buildroot.org
> >> Cc: "Peter Seiderer" <ps.report@gmx.net>, "Julien Corjon" <corjon.j@ecagroup.com>, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> >> Betreff: [PATCH] package/qt5location: handle plugins being conditionally built
> >>
> >> This fixes a build issue where the qt5location plugins are not built, but are
> >> attempted to be installed.
> >>
> >> The qt5location plugins have dependencies that are automatically resolved
> >> causing plugins to conditionaly be built. This change checks for the existance
> >> of the plugins prior to trying to install them.
> >>
> > 
> > No, the dependencies of the position plugins are only on module positioning (one purpose of the qt5location
> > package):
> 
> Ahhh.  You are correct and that statement means I should see some dependency on position for
> positioning. Something like this covers it:
> 
>     plugins.depends += positioning
> 
> And I do see that.  The problem is that the above line only happens in src/src.pro if we have the 
> quick module with qtHaveModule(quick).  This is a qt5location change [1] that happened between qt
> 5.8.0 and qt 5.9.1, which moved the above line as a dependency on quick,  which is why this issue
> did not show up in 5.8.0.
> 
> This is also why I see the root problem come and go only with a different buildroot config
> (availability of quick or not).  I was led down this erroneous path when I took the src.pro for
> its word and assumed a dependency on quick in v1 of this patch.
> 
> [1] https://code.qt.io/cgit/qt/qtlocation.git/commit/?id=c54ee74acdb9757989004005baf79e99be4c9417
> 
> > 
> >     $  cat src/plugins/plugins.pro 
> > TEMPLATE = subdirs
> > qtHaveModule(positioning): SUBDIRS +=  position
> > qtHaveModule(location): SUBDIRS += geoservices
> > 
> > 
> > The problem is a build-ordering, the right fix is to enable ordering in src/src.pro:
> > 
> > diff --git a/src/src.pro b/src/src.pro
> > index d0a1ee4..d45ddb8 100644
> > --- a/src/src.pro
> > +++ b/src/src.pro
> > @@ -1,5 +1,6 @@
> >  TEMPLATE = subdirs
> > -
> > +CONFIG += ordered
> > + 
> >  SUBDIRS += 3rdparty/clip2tri 3rdparty/clipper 3rdparty/poly2tri
> >  3rdparty/clip2tri.depends = 3rdparty/clipper 3rdparty/poly2tri
> > 
> > Buildroot patch follows...
> 
> Isn't there some saying about every time "ordered" is used a kitten dies?  Wouldn't the proper fix be to
> address the dependency instead? I did not see your patch.  So, I have submitted a v2 to this patch and
> also submitted the patch to the Qt bug tracker going about fixing the dependency instead.

Did not yet send the patch (lack of time for a qt bug report (thanks to you for doing it) and
proper gerrit patch submission)...

Fixing it by a dependency is a nice solution (if it works, see review of your v2 patch),
'ordered' is used by some other qt submodules...

Regards,
Peter

> 
> Josh
