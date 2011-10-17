From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Oct 2011 11:02:57 +0200
Subject: [Buildroot] [PATCH 5/9] Support for compiling Qt for X11
Message-ID: <201110171102.57649.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Friday 14 October 2011 16:51:57, Will Wagner wrote:
[snip]
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index cc035bf..a36fcb6 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -96,6 +96,10 @@ ifneq ($(QT_PIXEL_DEPTHS),)
>  QT_CONFIGURE_OPTS += -depths $(subst $(space),$(comma),$(strip $(QT_PIXEL_DEPTHS)))
>  endif
>  
> +ifneq ($(BR2_PACKAGE_QT_X11),y)
> +### Embedded options
> +QT_CONFIGURE_OPTS += -no-gfx-qnx -no-kbd-qnx -no-mouse-qnx
> +
>  ### Display drivers
>  ifeq ($(BR2_PACKAGE_QT_GFX_LINUXFB),y)
>  QT_CONFIGURE_OPTS += -qt-gfx-linuxfb
> @@ -129,7 +133,6 @@ else
>  QT_CONFIGURE_OPTS += -no-gfx-directfb
>  endif
>  
> -
>  ### Mouse drivers
>  ifeq ($(BR2_PACKAGE_QT_MOUSE_PC),y)
>  QT_CONFIGURE_OPTS += -qt-mouse-pc
> @@ -178,6 +181,11 @@ else
>  QT_CONFIGURE_OPTS += -no-kbd-qvfb
>  endif
>  
> +else
> +### X11 options
> +QT_CONFIGURE_OPTS += -no-gtkstyle -no-opengl -no-openvg -no-glib --disable-script
> +endif
> +

 It's a matter of taste, but I prefer the small branch of a condition to be
at the top.  So
ifeq ($(BR2_PACKAGE_QT_X11),y)
### X11 options
QT_CONFIGURE_OPTS += -no-gtkstyle -no-opengl -no-openvg -no-glib --disable-script
else
...
endif # BR2_PACKAGE_QT_X11

>  ifeq ($(BR2_PACKAGE_QT_DEBUG),y)
>  QT_CONFIGURE_OPTS += -debug
>  else
> @@ -216,7 +224,12 @@ else
>  QT_EMB_PLATFORM = generic
>  endif
>  
> +ifneq ($(BR2_PACKAGE_QT_X11),y)
>  QT_CONFIGURE_OPTS += -embedded $(QT_EMB_PLATFORM)
> +else
> +QT_CONFIGURE_OPTS += -xplatform linux-$(QT_EMB_PLATFORM)-g++ -arch i386

 Does this really only work for i386?  In that case, add a condition on
BR2_ARCH to BR2_PACKAGE_QT_X11 in Config.in.  Else, use BR2_ARCH here
(and compile-test for some other platforms).

> +QT_DEPENDENCIES   += xserver_xorg-server

 This was just discussed on the list :-)  Qt-X11 probably doesn't really
depend on the Xserver, only on libX11 and libXinerama and perhaps others.

[snip]

 Otherwise, it does look good.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                            arnout at mind be
Senior Embedded Software Architect              +32-16-286540  +32-478-010353
Essensium/Mind                                  http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium             BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43



-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
