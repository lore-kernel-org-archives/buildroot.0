From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Tue, 6 Jan 2015 10:58:16 +0100
Subject: [Buildroot] [PATCH 1/1] qt: add X11 support
In-Reply-To: <20141216104429.5ea049c9@x230>
References: <1405441856-6263-1-git-send-email-hadrien.boutteville@gmail.com>
 <20141216104429.5ea049c9@x230>
Message-ID: <20150106105840.6a41ecb6@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

up

On Tue, 16 Dec 2014 10:44:29 +0100
"gwenhael.goavec" <gwenj@trabucayre.com> wrote:

> On Tue, 15 Jul 2014 18:30:56 +0200
> Hadrien Boutteville <hadrien.boutteville@gmail.com> wrote:
> 
> > There are two possible configurations for Qt4 installation: standard
> > (with X11) and embedded (for framebuffer). Both configurations cannot be
> > used together for one installation and some options are specific to one
> > configuration or the other.
> > 
> > Add a choice to select the standard or the embedded installation to add
> > X11 support.
> > 
> > The integration is done in order to make maximum use of the current
> > configuration logic, for example by using the same mkspecs files.
> > 
> > Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Hi,
> Works on ARM (Armadeus APF51).
> Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > ---
> > 
> > For now I only tested under Qemu without all modules (successfully).
> > I will do more tests on an ARM target, but feel free to test on your
> > side ;-).
> > 
> > ---
> >  package/qt/Config.in | 46 ++++++++++++++++++++++++++++++++++++++++++++++
> >  package/qt/qt.mk     | 15 +++++++++++++++
> >  2 files changed, 61 insertions(+)
> > 
> > diff --git a/package/qt/Config.in b/package/qt/Config.in
> > index 0a21e93..abab229 100644
> > --- a/package/qt/Config.in
> > +++ b/package/qt/Config.in
> > @@ -17,6 +17,40 @@ menuconfig BR2_PACKAGE_QT
> >  
> >  if BR2_PACKAGE_QT
> >  
> > +choice
> > +	prompt "Qt installation"
> > +	help
> > +	  Selects the type of installation: standard or embedded
> > +
> > +config BR2_PACKAGE_QT_EMBEDDED
> > +	bool "Qt embedded"
> > +	help
> > +	  The embedded Qt installation targets embedded systems without X.org.
> > +	  Provides backends for framebuffer.
> > +	  If unsure, say Y.
> > +
> > +comment "Qt standard (X11) not available (need X.org)"
> > +	depends on !BR2_PACKAGE_XORG7
> > +
> > +config BR2_PACKAGE_QT_X11
> > +	bool "Qt standard (X11)"
> > +	depends on BR2_PACKAGE_XORG7
> > +	select BR2_PACKAGE_FONTCONFIG
> > +	select BR2_PACKAGE_XLIB_LIBXI
> > +	select BR2_PACKAGE_XLIB_LIBX11
> > +	select BR2_PACKAGE_XLIB_LIBXRENDER
> > +	select BR2_PACKAGE_XLIB_LIBXCURSOR
> > +	select BR2_PACKAGE_XLIB_LIBXRANDR
> > +	select BR2_PACKAGE_XLIB_LIBXEXT
> > +	select BR2_PACKAGE_XLIB_LIBXV
> > +	select BR2_PACKAGE_QT_SYSTEMFREETYPE
> > +	select BR2_PACKAGE_QT_GUI_MODULE
> > +	help
> > +	  The standard Qt installation provides X.org backend. If you don't want to
> > +	  use X.org, say N.
> > +
> > +endchoice
> > +
> >  config BR2_PACKAGE_QT_DEBUG
> >  	bool "Compile with debug support"
> >  	help
> > @@ -98,6 +132,9 @@ config BR2_PACKAGE_QT_GUI_MODULE
> >  	  video output, or you don't require Qt GUI, say n.
> >  
> >  if BR2_PACKAGE_QT_GUI_MODULE
> > +
> > +if BR2_PACKAGE_QT_EMBEDDED
> > +
> >  menu "Pixel depths"
> >  comment "Deselecting each option leads to Qt's default (8,16,32)"
> >  
> > @@ -155,6 +192,8 @@ config BR2_PACKAGE_QT_FONT_UNIFONT
> >  
> >  endmenu
> >  
> > +endif # BR2_PACKAGE_QT_EMBEDDED
> > +
> >  choice
> >  	prompt "freetype2 support"
> >  	default BR2_PACKAGE_QT_NOFREETYPE
> > @@ -163,11 +202,16 @@ choice
> >  
> >  config BR2_PACKAGE_QT_NOFREETYPE
> >  	bool "no freetype2 support"
> > +	depends on BR2_PACKAGE_QT_EMBEDDED
> >  	help
> >  	  Do not compile in Freetype2 support.
> >  
> > +comment "Qt freetype2 needs Qt embedded"
> > +	depends on BR2_PACKAGE_QT_X11
> > +
> >  config BR2_PACKAGE_QT_QTFREETYPE
> >  	bool "Qt freetype2"
> > +	depends on BR2_PACKAGE_QT_EMBEDDED
> >  	help
> >  	  Use the libfreetype bundled with Qt.
> >  
> > @@ -268,9 +312,11 @@ endchoice
> >  
> >  source "package/qt/Config.sql.in"
> >  if BR2_PACKAGE_QT_GUI_MODULE
> > +if BR2_PACKAGE_QT_EMBEDDED
> >  source "package/qt/Config.gfx.in"
> >  source "package/qt/Config.mouse.in"
> >  source "package/qt/Config.keyboard.in"
> > +endif
> >  
> >  config BR2_PACKAGE_QT_PHONON
> >  	bool "Phonon Module"
> > diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> > index 6d01023..0513416 100644
> > --- a/package/qt/qt.mk
> > +++ b/package/qt/qt.mk
> > @@ -236,7 +236,20 @@ else
> >  QT_EMB_PLATFORM = generic
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_QT_X11),y)
> > +QT_DEPENDENCIES += fontconfig xlib_libXi xlib_libX11 xlib_libXrender \
> > +                xlib_libXcursor xlib_libXrandr xlib_libXext xlib_libXv
> > +# Using pkg-config avoids us some logic to redefine and sed again mkspecs files
> > +# to add X11 include path and link options
> > +QT_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags x11)
> > +QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags x11)
> > +QT_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs x11 xext)
> > +QT_CONFIGURE_OPTS += -arch $(QT_EMB_PLATFORM) \
> > +		-xplatform qws/linux-$(QT_EMB_PLATFORM)-g++ -x11 -no-gtkstyle -no-sm \
> > +		-no-openvg
> > +else # if BR2_PACKAGE_QT_EMBEDDED
> >  QT_CONFIGURE_OPTS += -embedded $(QT_EMB_PLATFORM)
> > +endif
> >  
> >  ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
> >  QT_CONFIGURE_OPTS += -no-gui
> > @@ -652,6 +665,7 @@ define QT_INSTALL_TARGET_IMPORTS
> >  endef
> >  
> >  # Fonts installation
> > +ifeq ($(BR2_PACKAGE_QT_EMBEDDED),y)
> >  ifneq ($(QT_FONTS),)
> >  define QT_INSTALL_TARGET_FONTS
> >  	mkdir -p $(TARGET_DIR)/usr/lib/fonts
> > @@ -665,6 +679,7 @@ define QT_INSTALL_TARGET_FONTS_TTF
> >  	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
> >  endef
> >  endif
> > +endif # BR2_PACKAGE_QT_EMBEDDED
> >  
> >  ifeq ($(BR2_PACKAGE_QT_GFX_POWERVR),y)
> >  define QT_INSTALL_TARGET_POWERVR
> > -- 
> > 2.0.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
