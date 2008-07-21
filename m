From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Mon, 21 Jul 2008 14:57:19 +0100
Subject: [Buildroot] Suggestion for re-arranging package/Config.in
Message-ID: <1216648639.30984.6.camel@lnx32dtp04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have found that there are many many options under package/Config.in
and in particular a large number of options for BR2_GRAPHIC_SUPPORT.

I was wondering if the following might be a nice tidy up (it makes sense
to me).  I feel this would make options easier to handle.
LiTe/Directfb-examples are both in bug database now.  
Web browser support could include firefox soon as there are examples of
that now running on mips and others.

I think this would be easier to maintain and perhaps if this was agreed
we could then do a mass move and create subdirs for each of the menus
(like you have done for some of the other submenus) and then it would be
better in the future.

Let me know your thoughts!


menuconfig BR2_GRAPHIC_SUPPORT
	bool "Graphic libraries and applications (graphic/text)"
	default y
	help
	  Support for graphic libraries, X Window system and related
	  packages, graphical toolkits, etc.

if BR2_GRAPHIC_SUPPORT

menuconfig BR2_TEXT_RENDERING_LIBS
	bool "Text Rendering Libraries"
	default y
	help
	  Support for text rendering libraries, packages etc (ncurses, slang
etc).
if BR2_TEXT_RENDERING_LIBS
source "package/ncurses/Config.in"
source "package/newt/Config.in"
source "package/slang/Config.in"
source "package/dialog/Config.in"
endif

menuconfig BR2_DIRECTFB_LIBS
	bool "DirectFB Libraries and Applications"
	default y
	help
	  Support for DirectFB libraries, packages etc (directfb, fusion etc).

if BR2_DIRECTFB_LIBS
source "package/directfb/Config.in"
source "package/directfb-examples/Config.in"
source "package/fusion/Config.in"
source "package/lite/Config.in"
endif

menuconfig BR2_IMAGE_SUPPORT
	bool "Image decoders / libraries"
	default y
	help
	  Support for image  libraries. (jpeg etc)

if BR2_IMAGE_SUPPORT
source "package/imagemagick/Config.in"
source "package/jpeg/Config.in"
source "package/libart/Config.in"
source "package/libpng/Config.in"
source "package/libungif/Config.in"
source "package/tiff/Config.in"
endif

menuconfig BR2_SDL_SUPPORT
	bool "Support for SDL libraries etc"
	default y
	help
	  Support for sdl libraries. 
if BR2_SDL_SUPPORT
source "package/sdl/Config.in"
source "package/sdl_image/Config.in"
source "package/sdl_mixer/Config.in"
source "package/sdl_ttf/Config.in"
endif

comment "busybox graphic applications"
comment "--> May be broken in busybox"
source "package/fbv/Config.in"
source "package/fbset/Config.in"

menuconfig BR2_QT_SUPPORT
	bool "Support for QT/QtE etc"
	default y
	help
	  Support for Qt/Qt/e libraries. 
if BR2_QT_SUPPORT
source "package/qte/Config.in"
source "package/qtopia4/Config.in"
endif

menuconfig BR2_GTK_SUPPORT
	bool "Support for GTK etc"
	default y
	help
	  Support for GTK libraries. 

if BR2_GTK_SUPPORT
source "package/libgtk12/Config.in"
source "package/libgtk2/Config.in"
source "package/gtk2-engines/Config.in"
source "package/gtk2-themes/Config.in"
endif

menuconfig BR2_WEB_BROWSERS
	bool "Support for Web Browsers"
	default y
	help
	  Support for some common web browsers. 

if BR2_WEB_BROWSERS
source "package/dillo/Config.in"
source "package/webkit/Config.in"
endif

menu "X Window System server"
config BR2_PACKAGE_XSERVER_none
	bool "none"
	default y
config BR2_PACKAGE_XSERVER_xorg
	bool "modular xorg"
	depends on !BR2_PACKAGE_XSERVER_none
config BR2_PACKAGE_XSERVER_tinyx
	bool "tinyx"
	depends on !BR2_PACKAGE_XSERVER_none
endmenu

config BR2_X11_PREFIX
	string
	default "/usr/X11R6"	if BR2_PACKAGE_XSERVER_xorg ||
BR2_PACKAGE_XSERVER_tinyx
	default "/usr"		if !BR2_PACKAGE_XSERVER_xorg && !
BR2_PACKAGE_XSERVER_tinyx
	help
	  X11 apps root location

if !BR2_PACKAGE_XSERVER_none
source "package/x11r7/Config.in"
endif

comment "X libraries and helper libraries"
#XXX: maybe some of these should depend on !BR2_PACKAGE_XSERVER_none
source "package/atk/Config.in"
source "package/cairo/Config.in"
source "package/pango/Config.in"
source "package/libdrm/Config.in"
source "package/libglib12/Config.in"
source "package/libglib2/Config.in"
source "package/libsexy/Config.in"
source "package/fltk/Config.in"
source "package/openmotif/Config.in"
source "package/fontconfig/Config.in"
source "package/freetype/Config.in"
source "package/tslib/Config.in"

comment "X Window managers"
source "package/matchbox/Config.in"
source "package/metacity/Config.in"
source "package/blackbox/Config.in"

comment "X applications"
source "package/alsamixergui/Config.in"
source "package/docker/Config.in"
source "package/gqview/Config.in"
source "package/leafpad/Config.in"
source "package/midori/Config.in"
source "package/pcmanfm/Config.in"
source "package/rdesktop/Config.in"
source "package/rxvt/Config.in"
source "package/sylpheed/Config.in"
source "package/synergy/Config.in"
source "package/torsmo/Config.in"
source "package/x11vnc/Config.in"
source "package/xpdf/Config.in"
source "package/xstroke/Config.in"
source "package/xvkbd/Config.in"

comment "Video libraries/codecs and applications"
source "package/mplayer/Config.in"
source "package/vlc/Config.in"
endif
