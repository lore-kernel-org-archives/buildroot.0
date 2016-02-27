From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 27 Feb 2016 22:00:53 +0100
Subject: [Buildroot] [PATCH v3] qt: add font license information
In-Reply-To: <CANxTyt5b64cQxOCHT5Z3KQF5K0D-T5_Qd_g9nxggYsa8+VmZQA@mail.gmail.com>
References: <1456439689-16676-1-git-send-email-ps.report@gmx.net>
 <CANxTyt5b64cQxOCHT5Z3KQF5K0D-T5_Qd_g9nxggYsa8+VmZQA@mail.gmail.com>
Message-ID: <20160227220053.6ddafcc6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Danomi,

On Sat, 27 Feb 2016 11:38:39 -0500, Danomi Manchego <danomimanchego123@gmail.com> wrote:

> Peter S.,
> 
> On Thu, Feb 25, 2016 at 5:34 PM, Peter Seiderer <ps.report@gmx.net> wrote:
> > With this implementation, the different licenses will be separated with
> > <space><comma>. This is not nice, but to avoid it a pretty ugly construct
> > is needed:
> >
> > QT_LICENSE = $(shell echo $(QT_LICENSE_BITS) | sed 's% , %, %g')
> >
> > Since the <space><comma> is just a minor nuisance, we're not going to that kind
> > of complexity.
> >
> 
> The <space><comma> can be avoided during variable construction by doing this:
> 
> QT_LICENSE := BlahBlah
> 
> ifeq ...
> QT_LICENSE:=$(QT_LICENSE), MoreBlahBlah
> 
> If you don't mind the X:=$(X) part, that is.  IIRC, buildroot did a
> pass not long ago removing := from assignments that didn't actually
> need it.
> 

Thanks for the tip, tried it and works for me ;-), but [1] states:

  Simply expanded variables are defined by lines using ?:=? or ?::=? (see Setting
  Variables). Both forms are equivalent in GNU make; however only the ?::=? form
  is described by the POSIX standard (support for ?::=? was added to the POSIX
  standard in 2012, so older versions of make won?t accept this form either). 

Maybe this was the reason to avoid it in buildroot?

Regards,
Peter

[1] https://www.gnu.org/software/make/manual/html_node/Flavors.html#index-_003a_003a_003d

> Danomi -
> 
> 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v2 -> v3:
> >   - update fixed font license reference and compacted
> >     public domain license line for micro/fixed
> >     (suggested by Arnout Vandecappelle)
> >   - add extra space rationale to commit log
> >    (as suggested by Arnout Vandecappelle)
> >
> > Changes v1 -> v2:
> >   - update most font licenses (thanks to Arnout Vandecappelle)
> >   - add comma-separator between the licenses (no nice solution,
> >     will add ' ,', but without the starting problem at:
> >
> >     QT_LICENSE = LGPLv2.1 with exceptions or GPLv3
> >     ifneq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
> >     QT_LICENSE += or Digia Qt Commercial license
> >     endif
> > ---
> >  package/qt/qt.mk | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> > index a64d32f..c4fff2d 100644
> > --- a/package/qt/qt.mk
> > +++ b/package/qt/qt.mk
> > @@ -660,13 +660,30 @@ define QT_INSTALL_TARGET_FONTS
> >         mkdir -p $(TARGET_DIR)/usr/lib/fonts
> >         cp -dpf $(QT_FONTS) $(TARGET_DIR)/usr/lib/fonts
> >  endef
> > +ifneq ($(BR2_PACKAGE_QT_FONT_MICRO)$(BR2_PACKAGE_QT_FONT_FIXED),)
> > +# as stated in the font source src/3rdparty/fonts/micro.bdf
> > +# source src/3rdparty/fonts/5x7.bdf and source src/3rdparty/fonts/6x13.bdf
> > +QT_LICENSE += , Public Domain (Micro/Fixed font)
> >  endif
> > +ifneq ($(BR2_PACKAGE_QT_FONT_HELVETICA)$(BR2_PACKAGE_QT_FONT_JAPANESE),)
> > +QT_LICENSE += , Adobe Helvetica license (Helvetica/Japanese fonts)
> > +QT_LICENSE_FILES += src/3rdparty/fonts/COPYING.Helvetica
> > +endif
> > +ifeq ($(BR2_PACKAGE_QT_FONT_UNIFONT),y)
> > +QT_LICENSE += , Freeware (Unifont font)
> > +QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.Unifont
> > +endif
> > +endif # QT_FONTS
> >
> >  ifeq ($(BR2_PACKAGE_QT_QTFREETYPE)$(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
> >  define QT_INSTALL_TARGET_FONTS_TTF
> >         mkdir -p $(TARGET_DIR)/usr/lib/fonts
> >         cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
> >  endef
> > +QT_LICENSE += , Bitstream license (DejaVu/Vera TrueType fonts)
> > +QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.DejaVu \
> > +       src/3rdparty/fonts/README.DejaVu \
> > +       src/3rdparty/fonts/COPYRIGHT.Vera
> >  endif
> >  endif # BR2_PACKAGE_QT_EMBEDDED
> >
> > --
> > 2.1.4
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
