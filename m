From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 23 Feb 2016 21:02:34 +0100
Subject: [Buildroot] [PATCH v1] qt: add font license information
In-Reply-To: <56CB9524.3090704@mind.be>
References: <1434140535-13792-1-git-send-email-ps.report@gmx.net>
 <56CB9524.3090704@mind.be>
Message-ID: <20160223210234.7cccf313@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Tue, 23 Feb 2016 00:09:24 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 06/12/15 22:22, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Not sure about the japanese font and about MIT or MIT-like
> > licenses (no exact match of the wording to other MIT licenses).
> > ---
> >  package/qt/qt.mk | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> > index a7bbe5f..3fbb3e1 100644
> > --- a/package/qt/qt.mk
> > +++ b/package/qt/qt.mk
> > @@ -656,6 +656,32 @@ define QT_INSTALL_TARGET_FONTS
> >  	mkdir -p $(TARGET_DIR)/usr/lib/fonts
> >  	cp -dpf $(QT_FONTS) $(TARGET_DIR)/usr/lib/fonts
> >  endef
> > +ifeq ($(BR2_PACKAGE_QT_FONT_MICRO),y)
> > +QT_LICENSE += Public Domain (Micro font)
> > +# disabled because this file (containing the Public Domain notice) is
> > +# the font source file too...
> > +#QT_LICENSE_FILES += src/3rdparty/fonts/micro.bdf
> 
>  IMHO LICENSE_FILES are not needed for Public Domain. The point of the license
> file is to offer the complete license text, not to prove that the license is
> right. For public domain, a complete license text is not needed.
> 

O.k, if no proof for Public Domain via a license file is necessary...

>  It is useful to have a comment of where you found this license, but if it is
> just in the file itself, that's not really relevant.
> 

Will just add a little comment...

> > +endif
> > +ifeq ($(BR2_PACKAGE_QT_FONT_FIXED),y)
> > +# according to https://launchpad.net/ubuntu/vivid/+source/qtbase-opensource-src/+copyright
> > +QT_LICENSE += Public Domain (Fixed font)
> > +endif
> > +ifeq ($(BR2_PACKAGE_QT_FONT_HELVETICA),y)
> > +QT_LICENSE += MIT-like (Helvetica fonts)
> 
>  Hm, doesn't look that MIT-like to me. I'd call it 'Adobe Helvetica license'.
> 

O.k.

> > +QT_LICENSE_FILES += src/3rdparty/fonts/COPYING.Helvetica
> > +endif
> > +ifeq ($(BR2_PACKAGE_QT_FONT_JAPANESE),y)
> > +# according to https://launchpad.net/ubuntu/vivid/+source/qtbase-opensource-src/+copyright
> > +# Public Domain
> 
>  I think that's a mistake... I submitted bug #815616 to debian.
> 
> > +QT_LICENSE += Public Domain (Japanese font)
> > +# according to lib/fonts/README same as Helvetica fonts?
> 
>  Yep, it's from the same source.
> 

Thanks for investigation...

>  It's a bit annoying that you'd have
> 
> Adobe Helvetica license (Helvetica fonts) Adobe Helvetica license (Japanese font)
> 
> i.e. the same thing twice. So I'd make it:
> 
> ifneq ($(BR2_PACKAGE_QT_FONT_HELVETICA)$(BR2_PACKAGE_QT_FONT_JAPANESE),)
> QT_LICENSE += Adobe Helvetica license (Helvetica/Japanese fonts)
> QT_LICENSE_FILES += src/3rdparty/fonts/COPYING.Helvetica
> endif

O.k.

> 
> > +#QT_LICENSE += MIT-like (Japanese fonts)
> > +#QT_LICENSE_FILES += src/3rdparty/fonts/COPYING.Helvetica
> > +endif
> > +ifeq ($(BR2_PACKAGE_QT_FONT_UNIFONT),y)
> > +QT_LICENSE += Freeware (Unifont font)
> > +QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.Unifont
> > +endif
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_QT_QTFREETYPE)$(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
> > @@ -663,6 +689,10 @@ define QT_INSTALL_TARGET_FONTS_TTF
> >  	mkdir -p $(TARGET_DIR)/usr/lib/fonts
> >  	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
> >  endef
> > +QT_LICENSE += MIT-like (DejaVu/Vera TrueType fonts)
> 
>  Also not that MIT-like, so make it 'Bitstream license'.
> 

O.k.

> 
>  The problem with the way that it's done now is that the different licenses will
> not be comma-separated while they usually are. But adding commas is difficult in
> this case, so OK.
> 

Will try Thomas suggestion for adding commas....

Wanted to do a similar patch for qt5base, but did not find the license files,
see QTBUG-46655 ([1]), after some discussion on the mailing list ([2]) the
decision was to drop the bundled fonts (abandoned: [3], [4], merged: [5], [6])...

Regards,
Peter


[1] https://bugreports.qt.io/browse/QTBUG-46655
[2] http://lists.qt-project.org/pipermail/development/2015-June/021924.html
[3] https://codereview.qt-project.org/#/c/114503/
[4] https://codereview.qt-project.org/#/c/114512/
[5] https://codereview.qt-project.org/#/c/123568/
[6] https://codereview.qt-project.org/#/c/123567/
> 
>  Regards,
>  Arnout
> 
> 
> > +QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.DejaVu \
> > +	src/3rdparty/fonts/README.DejaVu \
> > +	src/3rdparty/fonts/COPYRIGHT.Vera
> >  endif
> >  endif # BR2_PACKAGE_QT_EMBEDDED
> >  
> > 
> 
> 
