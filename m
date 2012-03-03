From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Mar 2012 16:23:44 +0000
Subject: [Buildroot] [PATCH] qt: X11 support
In-Reply-To: <1330573074-12118-1-git-send-email-ismael.luceno@gmail.com>
References: <1330573074-12118-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <201203031623.45156.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 01 March 2012 03:37:54 Ismael Luceno wrote:
> 
> Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
> ---
>  package/qt/Config.gfx.in      |    4 ++++
>  package/qt/Config.in          |   14 ++++++++++++++
>  package/qt/Config.keyboard.in |    4 ++++
>  package/qt/Config.mouse.in    |    4 ++++
>  package/qt/qt.mk              |   12 +++++++++---
>  5 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/package/qt/Config.gfx.in b/package/qt/Config.gfx.in
> index dc70665..2fecd51 100644
> --- a/package/qt/Config.gfx.in
> +++ b/package/qt/Config.gfx.in
> @@ -1,3 +1,5 @@
> +if BR2_PACKAGE_QT_GUI_QWS

 I would put these conditions in the top Config.in, where we now have
if BR2_PACKAGE_QT_GUI_MODULE
source "package/qt/Config.gfx.in"
source "package/qt/Config.mouse.in"
source "package/qt/Config.keyboard.in"
...


> +
>  menu "Graphics drivers"
>  
>  config BR2_PACKAGE_QT_GFX_LINUXFB
> @@ -24,3 +26,5 @@ config BR2_PACKAGE_QT_GFX_DIRECTFB
>  	bool "directFB"
>  
>  endmenu
> +
> +endif
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 3a552d0..a982170 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -85,6 +85,20 @@ config BR2_PACKAGE_QT_GUI_MODULE
>  	  video output, or you don't require Qt GUI, say n.
>  
>  if BR2_PACKAGE_QT_GUI_MODULE
> +
> +choice
> +	prompt "GUI Backend"
> +	help
> +	  Select the graphic system, used to arbitrate screen access.
> +
> +config BR2_PACKAGE_QT_GUI_QWS
> +	bool "QWS"
> +	default y
> +
> +config BR2_PACKAGE_QT_GUI_X11
> +	bool "X11"
> +endchoice
> +

 I guess the X11 option should depend on BR2_PACKAGE_XORG7 at least.  And
it will probably have to select some X11 libraries, no?  + add corresponding
dependencies to the .mk file.

 In fact, if XORG7 is selected, the Qt GUI should probably default to X11.
Does this work?

choice
	prompt "GUI Backend"
	help
	  Select the graphic system, used to arbitrate screen access.

config BR2_PACKAGE_QT_GUI_QWS
	bool "QWS"
	default y if !BR2_PACKAGE_XORG7

config BR2_PACKAGE_QT_GUI_X11
	bool "X11"
	depends on BR2_PACKAGE_XORG7
	default y if BR2_PACKAGE_XORG7

endchoice

 Oh, and I do prefer a help text for each choice as well.  Especially if
the string itself is so terse, and especially for QWS which is a bit less
well-known.

[snip]
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index 776eb63..c6fd292 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -220,7 +220,14 @@ else
>  QT_EMB_PLATFORM = generic
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT_GUI_X11),y)
> +QT_SPEC = linux-g++
> +QT_CONFIGURE_OPTS += -xplatform linux-g++ -arch $(QT_EMB_PLATFORM)
> +else
> +QT_SPEC = qws/linux-$(QT_EMB_PLATFORM)-g++
>  QT_CONFIGURE_OPTS += -embedded $(QT_EMB_PLATFORM)
> +endif

 I'm not sure about the else here.  Wouldn't it be better to have an
explicit condition on BR2_PACKAGE_QT_GUI_QWS?  Maybe our coding style
lawyer Peter can answer that :-)

> +
>  
>  ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
>  QT_CONFIGURE_OPTS += -no-gui
> @@ -433,7 +440,7 @@ endif
>  # End of workaround.
>  
>  # Variable for other Qt applications to use
> -QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
> +QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec $(QT_SPEC)
>  
>  ################################################################################
>  # QT_QMAKE_SET -- helper macro to set <variable> = <value> in
> @@ -448,8 +455,7 @@ QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
>  # $(call QT_QMAKE_SET,variable,value,directory)
>  ################################################################################
>  define QT_QMAKE_SET
> -	$(SED) '/$(1)/d' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
> -	$(SED) '/include.*qws.conf/a$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
> +	$(SED) '/$(1)/d;/^load(qt_config)/i$(1) = $(2)' $(3)/mkspecs/$(QT_SPEC)/qmake.conf

 Nice refactoring.  Preferably mention this kind of thing explicitly in
the commit message, e.g.

Also refactored the definition of the QT_QMAKE_SET macro.

>  endef
>  
>  ifneq ($(BR2_INET_IPV6),y)
> 


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120303/6ff4134a/attachment-0001.html>
